Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0049EB61
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:53:54 +0100 (CET)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDAq9-0004KF-12
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nDAlB-00083o-RS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:48:45 -0500
Received: from [2a00:1450:4864:20::32c] (port=45749
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nDAl3-0003hu-TM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:48:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso2540688wms.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HiPC2kkLClrcUQ0fcOWYL9wHyw787g3lAdcXnaS0ro=;
 b=LcU/PW2aXGTIcWdzQy3YqOapbAfkFpPE3UUakHa1fA3yzCti/YLsmmL5M4xWXU1l9j
 pkue+2jCZgaz8CLnqCc7loMLh77Gw6v8RYjyoAie/w+UGgLaubaLKvg1BcuD5RsaLzZB
 /d20koLzBmgRbaruKTvO3BKGeL1aNxa7BlygotuIwakNUcTR7qcT94p9TBvgf3G/Plyr
 BcuGcTD1GSXKGJ1HcTBn6ArJ8/PFBcEoKW7oFlX+8aHASgEsCNppQMp/OD9Sl06+f1qy
 itV+PzZsFNUI/I1O0sisAIE65iaZTu5Ybk6dgjqnmYbA/0pYc2VhnG54uhQqN/C6K/8s
 H+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HiPC2kkLClrcUQ0fcOWYL9wHyw787g3lAdcXnaS0ro=;
 b=z3N04KHgG8zd1uKwmv/gK3S7p3AEbMHx5CLLh3OeZ6WcxgxH8bwel7W3kIR/+iSH7C
 Xzk2tIvifsGTMOph+4IIJLwgpHsjJ6QjFnMI5to7laMtOEjuPw+VGpxGFW291G2EcS/6
 S3igIrHTqy+2iSxdUec70be8RTAYNpuheWtahi8MWzMu3zy216dZ1JUiUwQwx0jKK8V3
 rMp744kkkcpnvMjCf8Pb3Y6GskWhXSJF4mP02nrhk6GQ/2kMfiq81EABnotfjZeK2V8Y
 zjjQ01411JOIN+L6pmMOhZ+aOs44LpynHFaCqSaYTMlMktCMlxd+n55Ddce+f3OBlEUL
 3FeQ==
X-Gm-Message-State: AOAM531Rp+Hehg8kZvrBbLjqXW5uGmhtWpsWP3Uhu+0Yux3N+14P0cbC
 /Ho2/UpcaRC6NmSkOnUyPvreEV7ZTTEOkx3emm8=
X-Google-Smtp-Source: ABdhPJwHUcRs3qQSd77OCbfER7isBUR6kFDCBzJi8UollfAPfHvTOLFYtKiLZMCKD/6FNOUJV+Y258B+3QeeFTWmevc=
X-Received: by 2002:a05:600c:4e46:: with SMTP id
 e6mr12723237wmq.15.1643312915122; 
 Thu, 27 Jan 2022 11:48:35 -0800 (PST)
MIME-Version: 1.0
References: <15f521a3-712a-f8de-6994-bad6222681@eik.bme.hu>
In-Reply-To: <15f521a3-712a-f8de-6994-bad6222681@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 27 Jan 2022 23:48:23 +0400
Message-ID: <CAJ+F1C+hwUJ5Zt9-bANNw8tpeeX4KyoRYk4g=qJNv3J-ji-LnA@mail.gmail.com>
Subject: Re: Mouse pointer warping with gtk display
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="0000000000008f913405d6959aee"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008f913405d6959aee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jan 27, 2022 at 10:29 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> Hello,
>
> We've found a problem with mouse pointer jumping around then constantly
> warping making it unusable which only seems to happen with the gtk
> display. Similar problem was reported with MacOS guests but now we could
> also reproduce with MorphOS on pegasos2 and thus confirm it's not a guest
> issue or hardware emulation problem but seems to be related to QEMU's gtk
> display. This can be reproduced as following (boot.img is the file from
> the root dir of the iso which is available from
> https://www.morphos-team.net/morphos-3.15.iso ):
>
> qemu-system-ppc -M pegasos2 -cdrom morphos-3.15.iso -display sdl \
> -L ../pc-bios -kernel boot.img -device ati-vga,romfile=3D""
>
> This does not have this problem and mouse works but running with -display
> gtk has the mouse pointer issue making it unusable. It can be seemingly
> avoided with using -device ati-vga,romfile=3D"",guest_hwcursor=3Dtrue so =
I
> think problem is somewhere in mouse handling in ui/gtk.c with host side
> mouse pointer. The gd_motion_event() in that file has a big comment about
> warping mouse back to the middle near the end of the function which seems
> to ne what's happening and causing this as this does not appear in sdl.c
> that does not show the same issue but I don't understand what that code i=
s
> trying to do.
>

In general, a guest handles mouse input with relative motion events
(standard ps2).

A more VM-friendly guest can additionally handle mouse input with absolute
coordinates (vmmouse, usb tablet etc)

While giving absolute coordinates to a guest is quite a simple task from a
client (and offers some advantages) it is more tricky to deal with relative
mouse events...

At the toolkit level, iirc, you generally don't have low-level events &
relative motion (gtk doesn't let you grab the mouse exclusively to receive
all events). You can workaround this with some window managers (ex wayland
relative-pointer unstable extension).

The "old" strategy with gtk2/3 is to grab the mouse, which is then
constrained within the display widget iirc, and convert absolute events to
relative events by doing simple current_position - last_position. Since
your client mouse may reach the widget borders (and/or the client monitor
limits, can't remember which applies, I think it varies), you also need to
recenter the client mouse somewhere, and that's usually in the middle of
the display widget.

This is clunky at best, and gtk devs decided to no longer support that kind
of API with gtk4. The recommended approach is to use lower-level events,
like the one you get from the wayland extensions. This is a pain for
portability, but that's all we have for now.

spice-gtk implements the wayland stuff. Have you tried running -display
spice-app? It may have a more polished behavior than the one in qemu.






>
> It's a known problem that host mouse pointer can get out of sync with the
> guest which I think is because mouse acceleration on the host is not
> correctly taken into account when reporting mouse moves to the guest and
> this may try to correct that issue but it seems to cause more harm than
> good in some cases. Any idea what might be the problem and how to solve
> this? I wonder why nobody else is seeing this with other guests. (I'm not
> direcly interested in fixing it as I'm using sdl display but this makes i=
t
> hard to use some guests for users whose distros make gtk backend the
> default which may actually be most people so it might be a good idea to
> improve this for them so I thought at least reporting the problem is
> useful.)
>

I suspect SDL offers an API for relative mouse events, which works better
than what we do in the gtk backend.

I hope in the future we can drop the gtk code from qemu, in favor of
dbus-display and rdw. Maintaining that kind of code is hard, and having the
same gtk widget base code for various remote desktop apps & protocols
should help maintenance and offer a consistent behavior, whether you use
QEMU/DBus, VNC, Spice, or RDP and whatever the future brings.

(I wrote the above mostly from memory, I agree it's convoluted and a bit
buggy, I doubt anyone likes it ;)

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008f913405d6959aee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 10:29 PM BA=
LATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">He=
llo,<br>
<br>
We&#39;ve found a problem with mouse pointer jumping around then constantly=
 <br>
warping making it unusable which only seems to happen with the gtk <br>
display. Similar problem was reported with MacOS guests but now we could <b=
r>
also reproduce with MorphOS on pegasos2 and thus confirm it&#39;s not a gue=
st <br>
issue or hardware emulation problem but seems to be related to QEMU&#39;s g=
tk <br>
display. This can be reproduced as following (boot.img is the file from <br=
>
the root dir of the iso which is available from <br>
<a href=3D"https://www.morphos-team.net/morphos-3.15.iso" rel=3D"noreferrer=
" target=3D"_blank">https://www.morphos-team.net/morphos-3.15.iso</a> ):<br=
>
<br>
qemu-system-ppc -M pegasos2 -cdrom morphos-3.15.iso -display sdl \<br>
-L ../pc-bios -kernel boot.img -device ati-vga,romfile=3D&quot;&quot;<br>
<br>
This does not have this problem and mouse works but running with -display <=
br>
gtk has the mouse pointer issue making it unusable. It can be seemingly <br=
>
avoided with using -device ati-vga,romfile=3D&quot;&quot;,guest_hwcursor=3D=
true so I <br>
think problem is somewhere in mouse handling in ui/gtk.c with host side <br=
>
mouse pointer. The gd_motion_event() in that file has a big comment about <=
br>
warping mouse back to the middle near the end of the function which seems <=
br>
to ne what&#39;s happening and causing this as this does not appear in sdl.=
c <br>
that does not show the same issue but I don&#39;t understand what that code=
 is <br>
trying to do.<br></blockquote><div><br></div><div>In general, a guest handl=
es mouse input with relative motion events (standard ps2).</div><div><br></=
div>A more VM-friendly guest can additionally handle mouse input with absol=
ute coordinates (vmmouse, usb tablet etc)</div><div class=3D"gmail_quote"><=
br></div><div class=3D"gmail_quote">While giving absolute coordinates to a =
guest is quite a simple task from a client (and offers some advantages) it =
is more tricky to deal with relative mouse events...</div><div class=3D"gma=
il_quote"><br></div><div>At the toolkit level, iirc, you generally don&#39;=
t have low-level events &amp; relative motion (gtk doesn&#39;t let you grab=
 the mouse exclusively to receive all events). You can workaround this with=
 some window managers (ex wayland relative-pointer unstable extension).</di=
v><div><br></div><div>The &quot;old&quot; strategy with gtk2/3 is to grab t=
he mouse, which is then constrained within the display widget iirc, and con=
vert absolute events to relative events by doing simple current_position - =
last_position. Since your client mouse may reach the widget borders (and/or=
 the client monitor limits, can&#39;t remember which applies, I think it va=
ries), you also need to recenter the client mouse somewhere, and that&#39;s=
 usually in the middle of the display widget.</div><div><br></div><div>This=
 is clunky at best, and gtk devs decided to no longer support that kind of =
API with gtk4. The recommended approach is to use lower-level events, like =
the one you get from the wayland extensions. This is a pain for portability=
, but that&#39;s all we have for now.<br></div><div><br></div><div>spice-gt=
k implements the wayland stuff. Have you tried running -display spice-app? =
It may have a more polished behavior than the one in qemu.<br></div><div><b=
r></div><div><br></div><div><div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote"><div><br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
It&#39;s a known problem that host mouse pointer can get out of sync with t=
he <br>
guest which I think is because mouse acceleration on the host is not <br>
correctly taken into account when reporting mouse moves to the guest and <b=
r>
this may try to correct that issue but it seems to cause more harm than <br=
>
good in some cases. Any idea what might be the problem and how to solve <br=
>
this? I wonder why nobody else is seeing this with other guests. (I&#39;m n=
ot <br>
direcly interested in fixing it as I&#39;m using sdl display but this makes=
 it <br>
hard to use some guests for users whose distros make gtk backend the <br>
default which may actually be most people so it might be a good idea to <br=
>
improve this for them so I thought at least reporting the problem is <br>
useful.)<br></blockquote><div><br></div><div>I suspect SDL offers an API fo=
r relative mouse events, which works better than what we do in the gtk back=
end.<br></div><div><br></div><div>I hope in the future we can drop the gtk =
code from qemu, in favor of dbus-display and rdw. Maintaining that kind of =
code is hard, and having the same gtk widget base code for various remote d=
esktop apps &amp; protocols should help maintenance and offer a consistent =
behavior, whether you use QEMU/DBus, VNC, Spice, or RDP and whatever the fu=
ture brings.<br></div></div><br clear=3D"all"></div>(I wrote the above most=
ly from memory, I agree it&#39;s convoluted and a bit buggy, I doubt anyone=
 likes it ;)</div><div><br></div><div><div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div></div>

--0000000000008f913405d6959aee--

