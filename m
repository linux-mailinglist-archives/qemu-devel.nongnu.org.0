Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF9347D425
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 16:13:41 +0100 (CET)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n03JD-0007RD-VW
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 10:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n03Gi-0005D8-OY
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:11:04 -0500
Received: from [2a00:1450:4864:20::536] (port=43739
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n03Gg-0001E7-9w
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:11:04 -0500
Received: by mail-ed1-x536.google.com with SMTP id o20so9818800eds.10
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ub8DARzafOqOlLWzKciPo4HmQtbJVxLhucfaVmt4yR0=;
 b=kLu+SW8Xg2T8zQRl6oa5lbwO98Vmbh+MmGcSTitBQVZHDEAi+LsP3khaEh8jwrySk9
 10p1mh18W4uZiNBAQQEla3Wuo5rWEsWD9YvZTQ3TfvFW7jwBOU7FDn+gFCm8OsSnQ1l9
 9OQ+N9wk74scJ4OMvu6REmk84fxRsE/C6hQOoshpjjgASWxR1++GCwLbRHcyCC8Xj2ok
 ef3rJvD9hjn1rTz0Zd9i6MOpVfqmJ7cBYLL5fTBxdxhBDqOGOsrs5/QIyUprJP9GGM0H
 ov2h6EBZ1hC0IbJGL9/Rw6cjnWPEDCPIV5c0D0u0sBr8Vl1vKOzPk6wC9SAxWqeoVCJp
 bcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ub8DARzafOqOlLWzKciPo4HmQtbJVxLhucfaVmt4yR0=;
 b=nlAQOCY//l2+p4eYAcL6lKyyyyJfOODIM9qeXaZIYOKmicV2/9nkvDS04tDPw6agVI
 c0ZJp6ShzS/XoJ9f/tdEE7m+ZRroHQG09TXAMOkDTHNBKJHPNnJBanfzN35gS5eKQnvk
 OnZOJnNr4wVAzsOizL6faxS3ab8s0R6s2ZMTowk98BDBuzdRNXnDKknPUoBYoyYMzoB8
 i+qcUyavDkofPSji9AiR0h9ifd4pOip89gi5y0Yb3kCsgjELIldqadpFID0AQsZzpvlv
 NzbEAWv8ze/omyccnpOkGDF4wgf7POBqQxLGHkJUOUATVEFUVIOsbcl0GiniNqxevprS
 6Tzw==
X-Gm-Message-State: AOAM530O5G9dCs8swTIBQO+v5UXS8q1tVJwDbSVxYt6YJq8aex23ypnX
 0nSvrc2b+ludJhHJptSftzeJIrqPD6slKbwg+H0=
X-Google-Smtp-Source: ABdhPJwUO95QPTY4ll/AgwpkjwtmuTgHfm1JZQIssGTcBE3KLucIAe0jJC4swCdUuw0Ng0Q6ZnC34Rfk8JePo0x+3P0=
X-Received: by 2002:a17:906:d554:: with SMTP id
 cr20mr2765222ejc.356.1640185860682; 
 Wed, 22 Dec 2021 07:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20211222010647.1332479-1-dpetroff@gmail.com>
 <CAJ+F1CLp_JABETwwu+hVG-iMT--5AKWH5qSOYm9rHA1vTi9Hfg@mail.gmail.com>
In-Reply-To: <CAJ+F1CLp_JABETwwu+hVG-iMT--5AKWH5qSOYm9rHA1vTi9Hfg@mail.gmail.com>
From: Dmitry Petrov <dpetroff@gmail.com>
Date: Wed, 22 Dec 2021 16:10:49 +0100
Message-ID: <CADufsaRjkwDt_6Cihb1Q2fZHEHDN7v0hDQHcc25PBstyPz07wg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ps2: Initial horizontal scroll support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000097764605d3bd87d9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

--00000000000097764605d3bd87d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

Thank you for the comments!

The reason of adding the support there was because I've been working on
horizontal scroll support for another os
(serenity os - https://github.com/SerenityOS/serenity/pull/11246) and
wanted to make sure that any changes I made
worked fine and ps/2 mouse code was the most straightforward way I could
find especially because I could test it
both against linux and serenity os code.

Did I get it right that the only changes needed for these patches are:

- Drop unnecessary log line
- Submit again as v3 with a cover letter?

It's my first submission, still trying to get used to the tooling and
requirements.

Thanks! Dmitry Petrov



On Wed, 22 Dec 2021 at 14:59, Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmai=
l.com>
wrote:

> Hi
>
> On Wed, Dec 22, 2021 at 5:27 AM Dmitry Petrov <dpetroff@gmail.com> wrote:
>
>> v2:
>>   - Patch is split into a sequence
>>   - value is clamped to 31 for horizontal scroll
>>
>> This patch introduces horizontal scroll support for the ps/2
>> mouse.
>>
>> The patch is based on the previous work
>> by Brad Jorsch done in 2010
>> but never merge, see
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D579968
>>
>>
> The patch series doesn't form a thread. You should also add a cover
> letter. This way, tools like patchew/patchwork can handle it correctly.
>
>
>> This change adds support for horizontal scroll to ps/2 mouse device
>> code. The code is implemented to match the logic of linux kernel
>> which is used as a reference.
>>
>> Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
>>
>
> I just realized that ps2.c isn't reused by vmmouse.
>
> What's really the point in adding horizontal scroll to ps2?
>
> A VM without absolute pointer is not really acceptable or working these
> days. Especially on Wayland with the QEMU GTK display. (fwiw, spice-gtk a=
nd
> rdw do implement pointer contraints & relative extensions so it's kinda
> working ok).
>
> Have you looked at adding virtio-input-hid support instead? That should b=
e
> more straightforward.
>
>
> ---
>>  hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++-------
>>  qapi/ui.json   |  2 +-
>>  2 files changed, 50 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
>> index 9376a8f4ce..6236711e1b 100644
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
>> @@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
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
>> +        if (dw1 !=3D 0) {
>> +            if (dw1 > 31) {
>> +                dw1 =3D 31;
>> +            } else if (dw1 < -31) {
>> +                dw1 =3D -31;
>> +            }
>> +
>> +            /*
>> +             * linux kernel expects first 6 bits to represent the value
>> +             * for horizontal scroll
>> +             */
>> +            b =3D (dw1 & 0x3f) | 0x40;
>> +            s->mouse_dw -=3D dw1;
>> +        } else {
>> +            if (dz1 > 7) {
>> +                dz1 =3D 7;
>> +            } else if (dz1 < -7) {
>> +                dz1 =3D -7;
>> +            }
>> +
>> +            b =3D (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
>> +            s->mouse_dz -=3D dz1;
>> +        }
>>          ps2_queue_noirq(&s->common, b);
>>          break;
>>      }
>> @@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>>      /* update deltas */
>>      s->mouse_dx -=3D dx1;
>>      s->mouse_dy -=3D dy1;
>> -    s->mouse_dz -=3D dz1;
>>
>>      return 1;
>>  }
>> @@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev,
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
>> @@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)
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
>> @@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)
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
>> --
>> 2.32.0
>>
>>
>>
> No objection otherwise, patch looks fine (I couldn't really test it on
> wayland..).
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000097764605d3bd87d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marc-Andr=C3=A9,</div><div><br></div><div>Thank yo=
u for the comments!<br></div><div><br></div><div>The reason of adding the s=
upport there was because I&#39;ve been working on horizontal scroll support=
 for another os</div><div>(serenity os - <a href=3D"https://github.com/Sere=
nityOS/serenity/pull/11246" target=3D"_blank">https://github.com/SerenityOS=
/serenity/pull/11246</a>) and wanted to make sure that any changes I made</=
div><div>worked fine and ps/2 mouse code was the most straightforward way I=
 could find especially because I could test it</div><div>both against linux=
 and serenity os code.</div><div><br></div><div>Did I get it right that the=
 only changes needed for these patches are:</div><div><br></div><div>- Drop=
 unnecessary log line</div><div>- Submit again as v3 with a cover letter?</=
div><div><br></div><div>It&#39;s my first submission, still trying to get u=
sed to the tooling and requirements.</div><div><br></div><div>Thanks! Dmitr=
y Petrov<br></div><div><br></div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 22 Dec 2021 at 14:5=
9, Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com"=
 target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div dir=
=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 22, 2021 at 5:27 AM Dmitry Petrov &lt;<a href=
=3D"mailto:dpetroff@gmail.com" target=3D"_blank">dpetroff@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">v2:<br>
=C2=A0 - Patch is split into a sequence<br>
=C2=A0 - value is clamped to 31 for horizontal scroll<br>
<br>
This patch introduces horizontal scroll support for the ps/2<br>
mouse.<br>
<br>
The patch is based on the previous work<br>
by Brad Jorsch done in 2010<br>
but never merge, see<br>
<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D579968" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport=
.cgi?bug=3D579968</a><br>
<br></blockquote><div><br></div><div><div>The patch series doesn&#39;t form=
 a thread. You should also add a cover letter. This way, tools like patchew=
/patchwork can handle it correctly.<br></div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
This change adds support for horizontal scroll to ps/2 mouse device<br>
code. The code is implemented to match the logic of linux kernel<br>
which is used as a reference.<br>
<br>
Signed-off-by: Dmitry Petrov &lt;<a href=3D"mailto:dpetroff@gmail.com" targ=
et=3D"_blank">dpetroff@gmail.com</a>&gt;<br></blockquote><div><br></div>I j=
ust realized that ps2.c isn&#39;t reused by vmmouse.</div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote">What&#39;s really the point =
in adding horizontal scroll to ps2?</div><div class=3D"gmail_quote"><br></d=
iv><div class=3D"gmail_quote">A VM without absolute pointer is not really a=
cceptable or working these days. Especially on Wayland with the QEMU GTK di=
splay. (fwiw, spice-gtk and rdw do implement pointer contraints &amp; relat=
ive extensions so it&#39;s kinda working ok).<br></div><div class=3D"gmail_=
quote"><div><br></div><div>Have you looked at adding virtio-input-hid suppo=
rt instead? That should be more straightforward.</div><div><br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++------=
-<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A02 files changed, 50 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/hw/input/ps2.c b/hw/input/ps2.c<br>
index 9376a8f4ce..6236711e1b 100644<br>
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
@@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br=
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw1 !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw1 &gt; 31) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw1 =3D 31;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (dw1 &lt; -31) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw1 =3D -31;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* linux kernel expects fir=
st 6 bits to represent the value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for horizontal scroll<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dw1 &amp; 0x3f) | 0x40;<b=
r>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(&amp;s-&gt;common, b);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)<br>
=C2=A0 =C2=A0 =C2=A0/* update deltas */<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dx -=3D dx1;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mouse_dy -=3D dy1;<br>
-=C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0}<br>
@@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev, QemuCons=
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
@@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)<br>
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
@@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)<br>
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
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>No objection otherwise, pat=
ch looks fine (I couldn&#39;t really test it on wayland..).</div><div><br><=
/div><div>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div></d=
iv>
</blockquote></div>

--00000000000097764605d3bd87d9--

