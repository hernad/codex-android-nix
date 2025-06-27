package com.example.helloworld

import android.widget.Button
import android.widget.TextView
import org.junit.Test
import org.junit.Assert.assertEquals
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class MainActivityTest {
    @Test
    fun buttonClickUpdatesTextView() {
        val activity = Robolectric.buildActivity(MainActivity::class.java)
            .setup().get()
        val button = activity.findViewById<Button>(R.id.button)
        button.performClick()
        val textView = activity.findViewById<TextView>(R.id.textView)
        assertEquals("hello Ernad", textView.text.toString())
    }
}