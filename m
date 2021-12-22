Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71847CAC5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 02:29:04 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzqRD-0008Pw-8z
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 20:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzp4T-0003PU-SN
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 19:01:29 -0500
Received: from [2a00:1450:4864:20::534] (port=38612
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzp4Q-0003R6-Ez
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 19:01:29 -0500
Received: by mail-ed1-x534.google.com with SMTP id bm14so1546793edb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 16:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rtqz82zL39aL+hd9QPumRJqWqZbFbU4M9PvkaGQzhZI=;
 b=EyH0sfXyzVQmjhMxdlS/LuwZZLJuXEClM4KP7Wm5tslisfOnajq8Z6Gn/1u27iCfJY
 OJZBWpoKBNw51s9gaXbio+0scfDTddjVfuH+VgKLGCivWpMBahhYENpzgvWJpiKmhfgx
 XNLpAsSDGcNRE4PDdAbPAgEDzXxH8c97Ema/ZNc9jpU6lwGG0oEwvgkmy/szok3evXh3
 UAjeDdY4Ql0aSbFCRQ5b78GCc5Xm1Y3+BNJujCDaxZTMkaf53uXKZbFPxsRz4ezjEUWg
 UNhKZYbCbmJxIjVPKVoY6qrQ9+v1z1j58MVjZ+C7D8l7j+bOJN3Sbpm/SEj+0Rz0nU0M
 Z7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rtqz82zL39aL+hd9QPumRJqWqZbFbU4M9PvkaGQzhZI=;
 b=cGQs8GvMH7A3Ac7xlbCsQIfWrw6+FLDldeXMJIuc6sxzWULtqcU1hX8KNAEGEe2lUa
 bd9U0bNKIt3ulzsdKp0+gEHbTNPr2bEuG4KTGmIr1+JJGtYOWgBM1YbIYSiyrhSnccOS
 P3Y5opvA6b4NULMwX5eiTPAoHwLnHKy6ZKv4/Tp1CjN7aqhcHEqb2gBLHwSk3IW3U382
 2xV9G8bG6l6Oyiut/0FhEKr+6skp762MDDLv8a2Ry4Un4P0xpN1jNlH5wEyNqb4sOMId
 WDlF2k5zmuGlfqQg8504GcWrhyX5WDuZts4kZRsKbocPS1aY6j8cWffHCEYogVPnY6Fl
 WMGw==
X-Gm-Message-State: AOAM5327+YSWGliuv90iwakMS6VtjT31TItpjZD6lS+7ygndVyeSgYJK
 gG+TDcmlHgaCS/OcJugLVBnAoAOf2iJpYciOJfc=
X-Google-Smtp-Source: ABdhPJxfV0bLs997rAAEe3plAiIFtwMeRIE9uVDJscZYOamxvHnfx+gDf6wrlP2ksC/qbZ2q834yDSR3SlJK7mzOAIE=
X-Received: by 2002:a17:906:c156:: with SMTP id
 dp22mr509915ejc.283.1640131283175; 
 Tue, 21 Dec 2021 16:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20211220233722.1262821-1-dpetroff@gmail.com>
 <CAJ+F1CKAJkFPeSP7-HHMy1aY8kSesSEqEK11iCzg6d27Epbefg@mail.gmail.com>
In-Reply-To: <CAJ+F1CKAJkFPeSP7-HHMy1aY8kSesSEqEK11iCzg6d27Epbefg@mail.gmail.com>
From: Dmitry Petrov <dpetroff@gmail.com>
Date: Wed, 22 Dec 2021 01:01:11 +0100
Message-ID: <CADufsaS8q=BFGEO3UqoM2=bcVwHnMVa8M=0Qz2o6+TRK++qpdw@mail.gmail.com>
Subject: Re: [PATCH] ps2: Initial horizontal scroll support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000084ce5805d3b0d2a1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 20:24:44 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000084ce5805d3b0d2a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

Thank you for the review! It's much clearer to me now.

The odd thing about docs is that I wasn't able to find any specification
that would describe
intellimouse 4.0 protocol extension the way it's implemented in the linux
kernel.

For example here: https://isdaman.com/alsos/hardware/mouse/ps2interface.htm

> You may have seen mice with two scrolling wheels--one vertical and the
other horizontal.  These mice use the Microsoft Intellimouse data packet
format as described above.  If the vertical wheel is scrolled upward, the
Z-counter is incremented by one and if that wheel is scrolled down, the
Z-counter is decremented by one.  This is normal operation for a scrolling
wheel.  However, if the horizontal wheel is scrolled right, the Z-counter
is incremented by two and if it is scrolled left, the Z-counter is
decremented by two.  This seems like an odd way to implement the second
scrolling wheel, but it works since the placement of the two wheels make it
impossible to use both of them at the same time (and if you try to trick
the software and use both at the same time, it will ignore the horizontal
wheel.)

The closest thing I could find was a small hint on the osdev wiki:
https://wiki.osdev.org/Mouse_Input#Formats_of_Optional_4th_Packet_Byte

>  Note: if the buttons do not exist, then these bits may flip based on
scroll wheel movement! (ie. Be careful that this does not generate spurious
"mouse button click" events for buttons that do not exist.

After all the investigation I decided to simply mimic the linux kernel
behaviour and keep the comment from the original patch regarding the
buttons.

I will rephrase comments a bit, split the patch into a sequence and
resubmit.

Thanks a lot! Dmitry Petrov

On Tue, 21 Dec 2021 at 09:59, Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmai=
l.com>
wrote:

> Hi
>
> On Tue, Dec 21, 2021 at 4:10 AM Dmitry Petrov <dpetroff@gmail.com> wrote:
>
>> This patch introduces horizontal scroll support for the ps/2 mouse.
>> It includes changes in the ps/2 device driver as well as support
>> for three display options - cocoa, gtk and sdl, tested and working
>> on all of them against guest ubuntu system.
>>
>> The patch is based on the previous work by Brad Jorsch done in 2010
>> but never merge, see
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D579968
>
>
> You should split the patch for the different subsystems/ui etc
>
> Looks good to me, although I didn't test it yet. Some comments below
>
>
>>
>> Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
>> ---
>>  hw/input/ps2.c    | 54 ++++++++++++++++++++++++++++++++++++++++-------
>>  qapi/ui.json      |  2 +-
>>  ui/cocoa.m        | 18 ++++++++++------
>>  ui/gtk.c          | 54 ++++++++++++++++++++++++++++++++++++-----------
>>  ui/input-legacy.c | 16 ++++++++++++++
>>  ui/sdl2.c         |  5 +++++
>>  6 files changed, 122 insertions(+), 27 deletions(-)
>>
>> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
>> index 9376a8f4ce..9e42284cd9 100644
>> --- a/hw/input/ps2.c
>> +++ b/hw/input/ps2.c
>> @@ -123,6 +123,7 @@ typedef struct {
>>      int mouse_dx; /* current values, needed for 'poll' mode */
>>      int mouse_dy;
>>      int mouse_dz;
>> +    int mouse_dw;
>>      uint8_t mouse_buttons;
>>  } PS2MouseState;
>>
>> @@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>>      /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
>>      const int needed =3D s->mouse_type ? 4 : 3;
>>      unsigned int b;
>> -    int dx1, dy1, dz1;
>> +    int dx1, dy1, dz1, dw1;
>>
>>      if (PS2_QUEUE_SIZE - s->common.queue.count < needed) {
>>          return 0;
>> @@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>>      dx1 =3D s->mouse_dx;
>>      dy1 =3D s->mouse_dy;
>>      dz1 =3D s->mouse_dz;
>> +    dw1 =3D s->mouse_dw;
>>      /* XXX: increase range to 8 bits ? */
>>      if (dx1 > 127)
>>          dx1 =3D 127;
>> @@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>>      /* extra byte for IMPS/2 or IMEX */
>>      switch(s->mouse_type) {
>>      default:
>> +        /* Just ignore the wheels if not supported */
>> +        s->mouse_dz =3D 0;
>> +        s->mouse_dw =3D 0;
>>          break;
>>      case 3:
>>          if (dz1 > 127)
>> @@ -747,13 +752,38 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>>          else if (dz1 < -127)
>>                  dz1 =3D -127;
>>          ps2_queue_noirq(&s->common, dz1 & 0xff);
>> +        s->mouse_dz -=3D dz1;
>> +        s->mouse_dw =3D 0;
>>          break;
>>      case 4:
>> -        if (dz1 > 7)
>> -            dz1 =3D 7;
>> -        else if (dz1 < -7)
>> -            dz1 =3D -7;
>> -        b =3D (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
>> +        /*
>> +         * This matches what the Linux kernel expects for exps/2 in
>> +         * drivers/input/mouse/psmouse-base.c. Note, if you happen to
>> +         * press/release the 4th or 5th buttons at the same moment as a
>> +         * horizontal wheel scroll, those button presses will get lost.
>> I'm not
>> +         * sure what to do about that, since by this point we don't kno=
w
>> +         * whether those buttons actually changed state.
>> +         */
>>
>
> Reading the kernel code helped me guess what is going on, but it would be
> nice to have more doc or link to specifications instead.
>
>
>> +        if (dw1 !=3D 0) {
>> +            if (dw1 > 15) {
>> +                dw1 =3D 15;
>> +            } else if (dw1 < -15) {
>> +                dw1 =3D -15;
>> +            }
>> +
>> +            /* 0x3f was found by trial and error vs ubuntu instance */
>> +            b =3D (dw1 & 0x3f) | 0x40;
>>
>
> Ok, clamp at 15 (I think you could go at 31 actually, since 5 bits seem t=
o
> be used) and go to the kernel:
> case 0x40: /* horizontal scroll on IntelliMouse Explorer 4.0 */
>
> This case doesn't handle buttons simultaneously indeed.
>
> I think 0x3f comes from 5 bits + 1 sign bit.
>
> +            s->mouse_dw -=3D dw1;
>> +        } else {
>> +            if (dz1 > 7) {
>> +                dz1 =3D 7;
>> +            } else if (dz1 < -7) {
>> +                dz1 =3D -7;
>> +            }
>> +
>> +            b =3D (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
>> +            s->mouse_dz -=3D dz1;
>>
>
> Here clamp at 7, since we should fall in the kernel
> case 0x00:
>
> and only 3 bits seem to be used (thus & 0x0f for 3+1 sign).
>
> This case handles buttons simultaneously, but only vertical scroll (unles=
s
> a4tech_workaround is set and triggered)
>
>
>
>
>
>> +        }
>>          ps2_queue_noirq(&s->common, b);
>>          break;
>>      }
>> @@ -764,7 +794,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>>      /* update deltas */
>>      s->mouse_dx -=3D dx1;
>>      s->mouse_dy -=3D dy1;
>> -    s->mouse_dz -=3D dz1;
>>
>>      return 1;
>>  }
>> @@ -806,6 +835,12 @@ static void ps2_mouse_event(DeviceState *dev,
>> QemuConsole *src,
>>              } else if (btn->button =3D=3D INPUT_BUTTON_WHEEL_DOWN) {
>>                  s->mouse_dz++;
>>              }
>> +
>> +            if (btn->button =3D=3D INPUT_BUTTON_WHEEL_RIGHT) {
>> +                s->mouse_dw--;
>> +            } else if (btn->button =3D=3D INPUT_BUTTON_WHEEL_LEFT) {
>> +                s->mouse_dw++;
>> +            }
>>          } else {
>>              s->mouse_buttons &=3D ~bmap[btn->button];
>>          }
>> @@ -833,8 +868,10 @@ static void ps2_mouse_sync(DeviceState *dev)
>>          /* if not remote, send event. Multiple events are sent if
>>             too big deltas */
>>          while (ps2_mouse_send_packet(s)) {
>> -            if (s->mouse_dx =3D=3D 0 && s->mouse_dy =3D=3D 0 && s->mous=
e_dz =3D=3D 0)
>> +            if (s->mouse_dx =3D=3D 0 && s->mouse_dy =3D=3D 0
>> +                    && s->mouse_dz =3D=3D 0 && s->mouse_dw =3D=3D 0) {
>>                  break;
>> +            }
>>          }
>>      }
>>  }
>> @@ -1036,6 +1073,7 @@ static void ps2_mouse_reset(void *opaque)
>>      s->mouse_dx =3D 0;
>>      s->mouse_dy =3D 0;
>>      s->mouse_dz =3D 0;
>> +    s->mouse_dw =3D 0;
>>      s->mouse_buttons =3D 0;
>>  }
>>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index d7567ac866..9dac1bf548 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -905,7 +905,7 @@
>>  ##
>>  { 'enum'  : 'InputButton',
>>    'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down',
>> 'side',
>> -  'extra' ] }
>> +  'extra', 'wheel-left', 'wheel-right' ] }
>>
>>  ##
>>  # @InputAxis:
>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index 68a6302184..c898a8aeaa 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -970,21 +970,27 @@ QemuCocoaView *cocoaView;
>>               */
>>
>>              /*
>> -             * When deltaY is zero, it means that this scrolling event
>> was
>> -             * either horizontal, or so fine that it only appears in
>> -             * scrollingDeltaY. So we drop the event.
>> +             * We shouldn't have got a scroll event when deltaY and
>> delta Y
>> +             * are zero, hence no harm in dropping the event
>>               */
>> -            if ([event deltaY] !=3D 0) {
>> +            if ([event deltaY] !=3D 0 || [event deltaX] !=3D 0) {
>>              /* Determine if this is a scroll up or scroll down event */
>> -                buttons =3D ([event deltaY] > 0) ?
>> +                if ([event deltaY] !=3D 0) {
>> +                  buttons =3D ([event deltaY] > 0) ?
>>                      INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
>> +                } else if ([event deltaX] !=3D 0) {
>> +                  buttons =3D ([event deltaX] > 0) ?
>> +                    INPUT_BUTTON_WHEEL_LEFT : INPUT_BUTTON_WHEEL_RIGHT;
>> +                }
>> +
>>                  qemu_input_queue_btn(dcl.con, buttons, true);
>>                  qemu_input_event_sync();
>>                  qemu_input_queue_btn(dcl.con, buttons, false);
>>                  qemu_input_event_sync();
>>              }
>> +
>>              /*
>> -             * Since deltaY also reports scroll wheel events we prevent
>> mouse
>> +             * Since deltaY/deltaY also report scroll wheel events we
>> prevent mouse
>>               * movement code from executing.
>>               */
>>              mouse_event =3D false;
>> diff --git a/ui/gtk.c b/ui/gtk.c
>> index 428f02f2df..b52eec6fe9 100644
>> --- a/ui/gtk.c
>> +++ b/ui/gtk.c
>> @@ -963,33 +963,63 @@ static gboolean gd_scroll_event(GtkWidget *widget,
>> GdkEventScroll *scroll,
>>                                  void *opaque)
>>  {
>>      VirtualConsole *vc =3D opaque;
>> -    InputButton btn;
>> +    InputButton btn_vertical;
>> +    InputButton btn_horizontal;
>> +    bool has_vertical =3D false;
>> +    bool has_horizontal =3D false;
>>
>>      if (scroll->direction =3D=3D GDK_SCROLL_UP) {
>> -        btn =3D INPUT_BUTTON_WHEEL_UP;
>> +        btn_vertical =3D INPUT_BUTTON_WHEEL_UP;
>> +        has_vertical =3D true;
>>      } else if (scroll->direction =3D=3D GDK_SCROLL_DOWN) {
>> -        btn =3D INPUT_BUTTON_WHEEL_DOWN;
>> +        btn_vertical =3D INPUT_BUTTON_WHEEL_DOWN;
>> +        has_vertical =3D true;
>> +    } else if (scroll->direction =3D=3D GDK_SCROLL_LEFT) {
>> +        btn_horizontal =3D INPUT_BUTTON_WHEEL_LEFT;
>> +        has_horizontal =3D true;
>> +    } else if (scroll->direction =3D=3D GDK_SCROLL_RIGHT) {
>> +        btn_horizontal =3D INPUT_BUTTON_WHEEL_RIGHT;
>> +        has_horizontal =3D true;
>>      } else if (scroll->direction =3D=3D GDK_SCROLL_SMOOTH) {
>>          gdouble delta_x, delta_y;
>>          if (!gdk_event_get_scroll_deltas((GdkEvent *)scroll,
>>                                           &delta_x, &delta_y)) {
>>              return TRUE;
>>          }
>> -        if (delta_y =3D=3D 0) {
>> -            return TRUE;
>> -        } else if (delta_y > 0) {
>> -            btn =3D INPUT_BUTTON_WHEEL_DOWN;
>> +
>> +        if (delta_y > 0) {
>> +            btn_vertical =3D INPUT_BUTTON_WHEEL_DOWN;
>> +            has_vertical =3D true;
>> +        } else if (delta_y < 0) {
>> +            btn_vertical =3D INPUT_BUTTON_WHEEL_UP;
>> +            has_vertical =3D true;
>> +        } else if (delta_x > 0) {
>> +            btn_horizontal =3D INPUT_BUTTON_WHEEL_RIGHT;
>> +            has_horizontal =3D true;
>> +        } else if (delta_x < 0) {
>> +            btn_horizontal =3D INPUT_BUTTON_WHEEL_LEFT;
>> +            has_horizontal =3D true;
>>          } else {
>> -            btn =3D INPUT_BUTTON_WHEEL_UP;
>> +            return TRUE;
>>          }
>>      } else {
>>          return TRUE;
>>      }
>>
>> -    qemu_input_queue_btn(vc->gfx.dcl.con, btn, true);
>> -    qemu_input_event_sync();
>> -    qemu_input_queue_btn(vc->gfx.dcl.con, btn, false);
>> -    qemu_input_event_sync();
>> +    if (has_vertical) {
>> +        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, true);
>> +        qemu_input_event_sync();
>> +        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, false);
>> +        qemu_input_event_sync();
>> +    }
>> +
>> +    if (has_horizontal) {
>> +        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, true);
>> +        qemu_input_event_sync();
>> +        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, false);
>> +        qemu_input_event_sync();
>> +    }
>> +
>>      return TRUE;
>>  }
>>
>> diff --git a/ui/input-legacy.c b/ui/input-legacy.c
>> index 9fc78a639b..2c9a215d7f 100644
>> --- a/ui/input-legacy.c
>> +++ b/ui/input-legacy.c
>> @@ -23,6 +23,7 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "qapi/qapi-commands-ui.h"
>>  #include "ui/console.h"
>>  #include "keymaps.h"
>> @@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev,
>> QemuConsole *src,
>>                                      1,
>>                                      s->buttons);
>>          }
>> +        if (btn->down && btn->button =3D=3D INPUT_BUTTON_WHEEL_RIGHT) {
>> +            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
>> +                                    s->axis[INPUT_AXIS_X],
>> +                                    s->axis[INPUT_AXIS_Y],
>> +                                    -2,
>> +                                    s->buttons);
>> +        }
>> +        if (btn->down && btn->button =3D=3D INPUT_BUTTON_WHEEL_LEFT) {
>> +            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
>> +                                    s->axis[INPUT_AXIS_X],
>> +                                    s->axis[INPUT_AXIS_Y],
>> +                                    2,
>> +                                    s->buttons);
>> +        }
>>          break;
>>      case INPUT_EVENT_KIND_ABS:
>>          move =3D evt->u.abs.data;
>> @@ -216,6 +231,7 @@ QEMUPutMouseEntry
>> *qemu_add_mouse_event_handler(QEMUPutMouseEvent *func,
>>      QEMUPutMouseEntry *s;
>>
>>      s =3D g_new0(QEMUPutMouseEntry, 1);
>> +    qemu_log("qemu_add_mouse_event_handler %s", name);
>>
>>      s->qemu_put_mouse_event =3D func;
>>      s->qemu_put_mouse_event_opaque =3D opaque;
>> diff --git a/ui/sdl2.c b/ui/sdl2.c
>> index 17c0ec30eb..19bbc1fdd4 100644
>> --- a/ui/sdl2.c
>> +++ b/ui/sdl2.c
>> @@ -33,6 +33,7 @@
>>  #include "sysemu/runstate-action.h"
>>  #include "sysemu/sysemu.h"
>>  #include "ui/win32-kbd-hook.h"
>> +#include "qemu/log.h"
>>
>>  static int sdl2_num_outputs;
>>  static struct sdl2_console *sdl2_console;
>> @@ -535,6 +536,10 @@ static void handle_mousewheel(SDL_Event *ev)
>>          btn =3D INPUT_BUTTON_WHEEL_UP;
>>      } else if (wev->y < 0) {
>>          btn =3D INPUT_BUTTON_WHEEL_DOWN;
>> +    } else if (wev->x < 0) {
>> +        btn =3D INPUT_BUTTON_WHEEL_RIGHT;
>> +    } else if (wev->x > 0) {
>> +        btn =3D INPUT_BUTTON_WHEEL_LEFT;
>>      } else {
>>          return;
>>      }
>> --
>> 2.32.0
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000084ce5805d3b0d2a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marc-Andr=C3=A9,</div><div><br></div><div>Thank yo=
u for the review! It&#39;s much clearer to me now.<br></div><div><br></div>=
<div>The odd thing about docs is that I wasn&#39;t able to find any specifi=
cation that would describe</div><div>intellimouse 4.0 protocol extension th=
e way it&#39;s implemented in the linux kernel.</div><div><br></div><div>Fo=
r example here: <a href=3D"https://isdaman.com/alsos/hardware/mouse/ps2inte=
rface.htm">https://isdaman.com/alsos/hardware/mouse/ps2interface.htm</a></d=
iv><div><br></div><div>&gt; You may have seen mice with two scrolling wheel=
s--one vertical and the other horizontal.=C2=A0 These mice use the Microsof=
t Intellimouse data packet format as described above.=C2=A0 If the vertical=
 wheel is scrolled upward, the Z-counter is incremented by one and if that =
wheel is scrolled down, the Z-counter is decremented by one.=C2=A0 This is =
normal operation for a scrolling wheel.=C2=A0 However, if the horizontal wh=
eel is scrolled right, the Z-counter is incremented by two and if it is scr=
olled left, the Z-counter is decremented by two.=C2=A0 This seems like an o=
dd way to implement the second scrolling wheel, but it works since the plac=
ement of the two wheels make it impossible to use both of them at the same =
time (and if you try to trick the software and use both at the same time, i=
t will ignore the horizontal wheel.) <br></div><div><br></div><div>The clos=
est thing I could find was a small hint on the osdev wiki: <a href=3D"https=
://wiki.osdev.org/Mouse_Input#Formats_of_Optional_4th_Packet_Byte">https://=
wiki.osdev.org/Mouse_Input#Formats_of_Optional_4th_Packet_Byte</a></div><di=
v><br></div><div>&gt;=C2=A0 Note: if the buttons do not exist, then these b=
its may flip based on scroll wheel movement! (ie. Be careful that this does=
 not generate spurious &quot;mouse button click&quot; events for buttons th=
at do not exist.</div><div><br></div><div>After all the investigation I dec=
ided to simply mimic the linux kernel behaviour and keep the comment from t=
he original patch regarding the buttons.<br></div><div><br></div><div>I wil=
l rephrase comments a bit, split the patch into a sequence and resubmit.</d=
iv><div><br></div><div>Thanks a lot! Dmitry Petrov<br> </div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 Dec=
 2021 at 09:59, Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">H=
i<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Dec 21, 2021 at 4:10 AM Dmitry Petrov &lt;<a href=3D"mailto:dp=
etroff@gmail.com" target=3D"_blank">dpetroff@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This patch introduces=
 horizontal scroll support for the ps/2 mouse.<br>
It includes changes in the ps/2 device driver as well as support<br>
for three display options - cocoa, gtk and sdl, tested and working<br>
on all of them against guest ubuntu system.<br>
<br>
The patch is based on the previous work by Brad Jorsch done in 2010<br>
but never merge, see<br>
<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D579968" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport=
.cgi?bug=3D579968</a></blockquote><div><br></div><div>You should split the =
patch for the different subsystems/ui etc</div><div><br></div><div>Looks go=
od to me, although I didn&#39;t test it yet. Some comments below<br></div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Dmitry Petrov &lt;<a href=3D"mailto:dpetroff@gmail.com" targ=
et=3D"_blank">dpetroff@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/input/ps2.c=C2=A0 =C2=A0 | 54 ++++++++++++++++++++++++++++++++++++=
++++-------<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0ui/cocoa.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++++++++------<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 54 +++++++++++++++++++++=
+++++++++++++++-----------<br>
=C2=A0ui/input-legacy.c | 16 ++++++++++++++<br>
=C2=A0ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A06 files changed, 122 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/hw/input/ps2.c b/hw/input/ps2.c<br>
index 9376a8f4ce..9e42284cd9 100644<br>
--- a/hw/input/ps2.c<br>
+++ b/hw/input/ps2.c<br>
@@ -123,6 +123,7 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0int mouse_dx; /* current values, needed for &#39;poll&#=
39; mode */<br>
=C2=A0 =C2=A0 =C2=A0int mouse_dy;<br>
=C2=A0 =C2=A0 =C2=A0int mouse_dz;<br>
+=C2=A0 =C2=A0 int mouse_dw;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t mouse_buttons;<br>
=C2=A0} PS2MouseState;<br>
<br>
@@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br>
=C2=A0 =C2=A0 =C2=A0/* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */<b=
r>
=C2=A0 =C2=A0 =C2=A0const int needed =3D s-&gt;mouse_type ? 4 : 3;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int b;<br>
-=C2=A0 =C2=A0 int dx1, dy1, dz1;<br>
+=C2=A0 =C2=A0 int dx1, dy1, dz1, dw1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (PS2_QUEUE_SIZE - s-&gt;common.queue.count &lt; need=
ed) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
@@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br>
=C2=A0 =C2=A0 =C2=A0dx1 =3D s-&gt;mouse_dx;<br>
=C2=A0 =C2=A0 =C2=A0dy1 =3D s-&gt;mouse_dy;<br>
=C2=A0 =C2=A0 =C2=A0dz1 =3D s-&gt;mouse_dz;<br>
+=C2=A0 =C2=A0 dw1 =3D s-&gt;mouse_dw;<br>
=C2=A0 =C2=A0 =C2=A0/* XXX: increase range to 8 bits ? */<br>
=C2=A0 =C2=A0 =C2=A0if (dx1 &gt; 127)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dx1 =3D 127;<br>
@@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br>
=C2=A0 =C2=A0 =C2=A0/* extra byte for IMPS/2 or IMEX */<br>
=C2=A0 =C2=A0 =C2=A0switch(s-&gt;mouse_type) {<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Just ignore the wheels if not supported */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 3:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dz1 &gt; 127)<br>
@@ -747,13 +752,38 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (dz1 &lt; -127)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dz1 =3D -127;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(&amp;s-&gt;common, dz1 &a=
mp; 0xff);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 4:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dz1 &gt; 7)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D 7;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (dz1 &lt; -7)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D -7;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dz1 &amp; 0x0f) | ((s-&gt;mouse_buttons=
 &amp; 0x18) &lt;&lt; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This matches what the Linux kernel exp=
ects for exps/2 in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* drivers/input/mouse/psmouse-base.c. No=
te, if you happen to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* press/release the 4th or 5th buttons a=
t the same moment as a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* horizontal wheel scroll, those button =
presses will get lost. I&#39;m not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sure what to do about that, since by t=
his point we don&#39;t know<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* whether those buttons actually changed=
 state.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
</blockquote><div><br></div><div>Reading the kernel code helped me guess wh=
at is going on, but it would be nice to have more doc or link to specificat=
ions instead.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw1 !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw1 &gt; 15) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw1 =3D 15;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (dw1 &lt; -15) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw1 =3D -15;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 0x3f was found by trial and e=
rror vs ubuntu instance */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dw1 &amp; 0x3f) | 0x40;<b=
r></blockquote><div><br></div><div>Ok, clamp at 15 (I think you could go at=
 31 actually, since 5 bits seem to be used) and go to the kernel:</div><div=
>case 0x40: /* horizontal scroll on IntelliMouse Explorer 4.0 */</div><div>=
<br></div><div>This case doesn&#39;t handle buttons simultaneously indeed.<=
/div><div><br></div><div>I think 0x3f comes from 5 bits + 1 sign bit.<br> <=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw -=3D dw1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dz1 &gt; 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D 7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (dz1 &lt; -7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D -7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dz1 &amp; 0x0f) | ((s-&gt=
;mouse_buttons &amp; 0x18) &lt;&lt; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br>
</blockquote><div><br></div><div>Here clamp at 7, since we should fall in t=
he kernel<br></div><div>case 0x00:<br></div><div><br></div><div>and only 3 =
bits seem to be used (thus &amp; 0x0f for 3+1 sign).</div><div><br></div><d=
iv>This case handles buttons simultaneously, but only vertical scroll (unle=
ss a4tech_workaround is set and triggered)<br></div><div><br></div><div><br=
></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(&amp;s-&gt;common, b);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -764,7 +794,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br>
=C2=A0 =C2=A0 =C2=A0/* update deltas */<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dx -=3D dx1;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dy -=3D dy1;<br>
-=C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0}<br>
@@ -806,6 +835,12 @@ static void ps2_mouse_event(DeviceState *dev, QemuCons=
ole *src,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (btn-&gt;button =
=3D=3D INPUT_BUTTON_WHEEL_DOWN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;mouse_d=
z++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;button =3D=3D INPUT_=
BUTTON_WHEEL_RIGHT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw--;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (btn-&gt;button =3D=3D=
 INPUT_BUTTON_WHEEL_LEFT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw++;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;mouse_buttons &amp;=
=3D ~bmap[btn-&gt;button];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -833,8 +868,10 @@ static void ps2_mouse_sync(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if not remote, send event. Multiple ev=
ents are sent if<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too big deltas */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (ps2_mouse_send_packet(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mouse_dx =3D=3D 0 &amp=
;&amp; s-&gt;mouse_dy =3D=3D 0 &amp;&amp; s-&gt;mouse_dz =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mouse_dx =3D=3D 0 &amp=
;&amp; s-&gt;mouse_dy =3D=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;&amp; s-&gt;mouse_dz =3D=3D 0 &amp;&amp; s-&gt;mouse_dw =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -1036,6 +1073,7 @@ static void ps2_mouse_reset(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dx =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dy =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dz =3D 0;<br>
+=C2=A0 =C2=A0 s-&gt;mouse_dw =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_buttons =3D 0;<br>
=C2=A0}<br>
<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index d7567ac866..9dac1bf548 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -905,7 +905,7 @@<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;=C2=A0 : &#39;InputButton&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;=C2=A0 : [ &#39;left&#39;, &#39;middle&#39;, &#3=
9;right&#39;, &#39;wheel-up&#39;, &#39;wheel-down&#39;, &#39;side&#39;,<br>
-=C2=A0 &#39;extra&#39; ] }<br>
+=C2=A0 &#39;extra&#39;, &#39;wheel-left&#39;, &#39;wheel-right&#39; ] }<br=
>
<br>
=C2=A0##<br>
=C2=A0# @InputAxis:<br>
diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
index 68a6302184..c898a8aeaa 100644<br>
--- a/ui/cocoa.m<br>
+++ b/ui/cocoa.m<br>
@@ -970,21 +970,27 @@ QemuCocoaView *cocoaView;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* When deltaY is zero, it =
means that this scrolling event was<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* either horizontal, or so=
 fine that it only appears in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* scrollingDeltaY. So we d=
rop the event.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We shouldn&#39;t have go=
t a scroll event when deltaY and delta Y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* are zero, hence no harm =
in dropping the event<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ([event deltaY] !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ([event deltaY] !=3D 0 || [ev=
ent deltaX] !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Determine if this is a s=
croll up or scroll down event */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buttons =3D ([even=
t deltaY] &gt; 0) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ([event deltaY]=
 !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buttons =3D=
 ([event deltaY] &gt; 0) ?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ([event =
deltaX] !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buttons =3D=
 ([event deltaX] &gt; 0) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INPU=
T_BUTTON_WHEEL_LEFT : INPUT_BUTTON_WHEEL_RIGHT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_qu=
eue_btn(dcl.con, buttons, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_ev=
ent_sync();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_qu=
eue_btn(dcl.con, buttons, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_input_ev=
ent_sync();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since deltaY also report=
s scroll wheel events we prevent mouse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since deltaY/deltaY also=
 report scroll wheel events we prevent mouse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * movement code from execu=
ting.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse_event =3D false;<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 428f02f2df..b52eec6fe9 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -963,33 +963,63 @@ static gboolean gd_scroll_event(GtkWidget *widget, Gd=
kEventScroll *scroll,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VirtualConsole *vc =3D opaque;<br>
-=C2=A0 =C2=A0 InputButton btn;<br>
+=C2=A0 =C2=A0 InputButton btn_vertical;<br>
+=C2=A0 =C2=A0 InputButton btn_horizontal;<br>
+=C2=A0 =C2=A0 bool has_vertical =3D false;<br>
+=C2=A0 =C2=A0 bool has_horizontal =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (scroll-&gt;direction =3D=3D GDK_SCROLL_UP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D INPUT_BUTTON_WHEEL_UP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_vertical =3D INPUT_BUTTON_WHEEL_UP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_vertical =3D true;<br>
=C2=A0 =C2=A0 =C2=A0} else if (scroll-&gt;direction =3D=3D GDK_SCROLL_DOWN)=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D INPUT_BUTTON_WHEEL_DOWN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_vertical =3D INPUT_BUTTON_WHEEL_DOWN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_vertical =3D true;<br>
+=C2=A0 =C2=A0 } else if (scroll-&gt;direction =3D=3D GDK_SCROLL_LEFT) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_horizontal =3D INPUT_BUTTON_WHEEL_LEFT;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_horizontal =3D true;<br>
+=C2=A0 =C2=A0 } else if (scroll-&gt;direction =3D=3D GDK_SCROLL_RIGHT) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_horizontal =3D INPUT_BUTTON_WHEEL_RIGHT;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_horizontal =3D true;<br>
=C2=A0 =C2=A0 =C2=A0} else if (scroll-&gt;direction =3D=3D GDK_SCROLL_SMOOT=
H) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdouble delta_x, delta_y;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gdk_event_get_scroll_deltas((GdkEven=
t *)scroll,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;delta_x, &amp;delta_y)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (delta_y =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (delta_y &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D INPUT_BUTTON_WHEEL_DOWN;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (delta_y &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_vertical =3D INPUT_BUTTON_WH=
EEL_DOWN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_vertical =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (delta_y &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_vertical =3D INPUT_BUTTON_WH=
EEL_UP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_vertical =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (delta_x &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_horizontal =3D INPUT_BUTTON_=
WHEEL_RIGHT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_horizontal =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (delta_x &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btn_horizontal =3D INPUT_BUTTON_=
WHEEL_LEFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_horizontal =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D INPUT_BUTTON_WHEEL_UP;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 qemu_input_queue_btn(vc-&gt;gfx.dcl.con, btn, true);<br>
-=C2=A0 =C2=A0 qemu_input_event_sync();<br>
-=C2=A0 =C2=A0 qemu_input_queue_btn(vc-&gt;gfx.dcl.con, btn, false);<br>
-=C2=A0 =C2=A0 qemu_input_event_sync();<br>
+=C2=A0 =C2=A0 if (has_vertical) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_queue_btn(vc-&gt;gfx.dcl.con, btn_v=
ertical, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_event_sync();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_queue_btn(vc-&gt;gfx.dcl.con, btn_v=
ertical, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_event_sync();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (has_horizontal) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_queue_btn(vc-&gt;gfx.dcl.con, btn_h=
orizontal, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_event_sync();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_queue_btn(vc-&gt;gfx.dcl.con, btn_h=
orizontal, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_input_event_sync();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
=C2=A0}<br>
<br>
diff --git a/ui/input-legacy.c b/ui/input-legacy.c<br>
index 9fc78a639b..2c9a215d7f 100644<br>
--- a/ui/input-legacy.c<br>
+++ b/ui/input-legacy.c<br>
@@ -23,6 +23,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;keymaps.h&quot;<br>
@@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev, QemuC=
onsole *src,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;buttons);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;down &amp;&amp; btn-&gt;button =3D=
=3D INPUT_BUTTON_WHEEL_RIGHT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;qemu_put_mouse_event(s-&gt=
;qemu_put_mouse_event_opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
X],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
Y],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buttons);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;down &amp;&amp; btn-&gt;button =3D=
=3D INPUT_BUTTON_WHEEL_LEFT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;qemu_put_mouse_event(s-&gt=
;qemu_put_mouse_event_opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
X],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;axis[INPUT_AXIS_=
Y],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buttons);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case INPUT_EVENT_KIND_ABS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D evt-&gt;u.abs.data;<br>
@@ -216,6 +231,7 @@ QEMUPutMouseEntry *qemu_add_mouse_event_handler(QEMUPut=
MouseEvent *func,<br>
=C2=A0 =C2=A0 =C2=A0QEMUPutMouseEntry *s;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D g_new0(QEMUPutMouseEntry, 1);<br>
+=C2=A0 =C2=A0 qemu_log(&quot;qemu_add_mouse_event_handler %s&quot;, name);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;qemu_put_mouse_event =3D func;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;qemu_put_mouse_event_opaque =3D opaque;<br>
diff --git a/ui/sdl2.c b/ui/sdl2.c<br>
index 17c0ec30eb..19bbc1fdd4 100644<br>
--- a/ui/sdl2.c<br>
+++ b/ui/sdl2.c<br>
@@ -33,6 +33,7 @@<br>
=C2=A0#include &quot;sysemu/runstate-action.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;ui/win32-kbd-hook.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
<br>
=C2=A0static int sdl2_num_outputs;<br>
=C2=A0static struct sdl2_console *sdl2_console;<br>
@@ -535,6 +536,10 @@ static void handle_mousewheel(SDL_Event *ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btn =3D INPUT_BUTTON_WHEEL_UP;<br>
=C2=A0 =C2=A0 =C2=A0} else if (wev-&gt;y &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btn =3D INPUT_BUTTON_WHEEL_DOWN;<br>
+=C2=A0 =C2=A0 } else if (wev-&gt;x &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D INPUT_BUTTON_WHEEL_RIGHT;<br>
+=C2=A0 =C2=A0 } else if (wev-&gt;x &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btn =3D INPUT_BUTTON_WHEEL_LEFT;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>

--00000000000084ce5805d3b0d2a1--

