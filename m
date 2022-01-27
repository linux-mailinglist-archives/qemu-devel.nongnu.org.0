Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4849EC7C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:30:01 +0100 (CET)
Received: from localhost ([::1]:52504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBP6-0000y2-Cs
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:30:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nDBNw-0007b8-3M
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:28:48 -0500
Received: from [2607:f8b0:4864:20::22d] (port=38843
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nDBNt-00015B-Ma
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:28:47 -0500
Received: by mail-oi1-x22d.google.com with SMTP id g205so8194645oif.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 12:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ASXWpL8mpdIbdgXp2s+kQqIfiVjbPoqoRTOPaLZ3Qw=;
 b=TnkA6GFr/1H0lK/4ffJ4+qpCo5RAobsiLcCC0GJihpXFmeg5SCXY/7dU0EnfWKSxC5
 FN4iTPLEhZS3Ps8u1GpZXZHVeNG8TY6HclLXm7VFSy99Z0S6WYW4hbdD1WWFVBmkr1W0
 xpJDAjO4tkjLwFEZChOxbH1/jClfFsedBkENogy+eJEURpSN2F07dKO1he5eLSV+cHWX
 Nrz/Wsx//IFxRX5vgos149tuCpjE1L/jaEbWywNmcs0966dXYI/sODPtDYTetBFUbIK0
 927ot5W0Si7PlGUtW5EMhLNPPtFbkVMoSp/v+IgGkZ7GfjXy7MlQYGCJYDxDHAJucFLy
 nPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ASXWpL8mpdIbdgXp2s+kQqIfiVjbPoqoRTOPaLZ3Qw=;
 b=f2HZ9X2XVTOvoGmqZPFtCP8M+w7CDWGNaOg6nELC4WQOvs2SDTE8MTOxIVQUHMpRx3
 PkTFKObBl0VR8lYAXyGZwarmUbxCXNBE6CoiDECvHNQNu5QpDQZrrVx1L3ZkH+ha75s/
 y+KUn0TumFoMplHGKlC+lMY5DN2bvb09cFPsXC95lebZtBe1N5XLXlstcf0eIeina9uX
 qQS2+33K0odb9zdt7mzxuWOUYerNmlX9x1B8SaH1b2trMJ4mYpeuGcKckLKXTkng+cSf
 Ua6UIfbWDucL6ETpKK0ThGj6LiPKaBTdvwIEeI3L+jnhPgNH6Dzywqs7/W0XIUDoH2UQ
 tqZA==
X-Gm-Message-State: AOAM530ouevlgRmVVKtO9B4alzrOCN301Uv7sbeDnKio56iHfXfXv3tU
 mMdwZybMSfB22JRu8byQ3DngTXxVvbdI9Krc4XY=
X-Google-Smtp-Source: ABdhPJxYEYBGeCZfuElsG0X/NuOG9Mn+fnLds0wKJ42fL0eMJE09V735cZYjSOYrGmavbIIg6qOH/mItgZnBXEzVQC8=
X-Received: by 2002:a05:6808:170a:: with SMTP id
 bc10mr3512513oib.36.1643315324332; 
 Thu, 27 Jan 2022 12:28:44 -0800 (PST)
MIME-Version: 1.0
References: <15f521a3-712a-f8de-6994-bad6222681@eik.bme.hu>
 <CAJ+F1C+hwUJ5Zt9-bANNw8tpeeX4KyoRYk4g=qJNv3J-ji-LnA@mail.gmail.com>
In-Reply-To: <CAJ+F1C+hwUJ5Zt9-bANNw8tpeeX4KyoRYk4g=qJNv3J-ji-LnA@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 27 Jan 2022 21:28:33 +0100
Message-ID: <CABLmASH5K=mO0=k4oR76JS70a9L87rNzJu9OhtNR9dohzg5-jA@mail.gmail.com>
Subject: Re: Mouse pointer warping with gtk display
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000292bf105d6962a1d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000292bf105d6962a1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 8:48 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, Jan 27, 2022 at 10:29 PM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
>
>> Hello,
>>
>> We've found a problem with mouse pointer jumping around then constantly
>> warping making it unusable which only seems to happen with the gtk
>> display. Similar problem was reported with MacOS guests but now we could
>> also reproduce with MorphOS on pegasos2 and thus confirm it's not a gues=
t
>> issue or hardware emulation problem but seems to be related to QEMU's gt=
k
>> display. This can be reproduced as following (boot.img is the file from
>> the root dir of the iso which is available from
>> https://www.morphos-team.net/morphos-3.15.iso ):
>>
>> qemu-system-ppc -M pegasos2 -cdrom morphos-3.15.iso -display sdl \
>> -L ../pc-bios -kernel boot.img -device ati-vga,romfile=3D""
>>
>> This does not have this problem and mouse works but running with -displa=
y
>> gtk has the mouse pointer issue making it unusable. It can be seemingly
>> avoided with using -device ati-vga,romfile=3D"",guest_hwcursor=3Dtrue so=
 I
>> think problem is somewhere in mouse handling in ui/gtk.c with host side
>> mouse pointer. The gd_motion_event() in that file has a big comment abou=
t
>> warping mouse back to the middle near the end of the function which seem=
s
>> to ne what's happening and causing this as this does not appear in sdl.c
>> that does not show the same issue but I don't understand what that code
>> is
>> trying to do.
>>
>
> In general, a guest handles mouse input with relative motion events
> (standard ps2).
>
> A more VM-friendly guest can additionally handle mouse input with absolut=
e
> coordinates (vmmouse, usb tablet etc)
>
> While giving absolute coordinates to a guest is quite a simple task from =
a
> client (and offers some advantages) it is more tricky to deal with relati=
ve
> mouse events...
>
> At the toolkit level, iirc, you generally don't have low-level events &
> relative motion (gtk doesn't let you grab the mouse exclusively to receiv=
e
> all events). You can workaround this with some window managers (ex waylan=
d
> relative-pointer unstable extension).
>
> The "old" strategy with gtk2/3 is to grab the mouse, which is then
> constrained within the display widget iirc, and convert absolute events t=
o
> relative events by doing simple current_position - last_position. Since
> your client mouse may reach the widget borders (and/or the client monitor
> limits, can't remember which applies, I think it varies), you also need t=
o
> recenter the client mouse somewhere, and that's usually in the middle of
> the display widget.
>
> This is clunky at best, and gtk devs decided to no longer support that
> kind of API with gtk4. The recommended approach is to use lower-level
> events, like the one you get from the wayland extensions. This is a pain
> for portability, but that's all we have for now.
>
> spice-gtk implements the wayland stuff. Have you tried running -display
> spice-app? It may have a more polished behavior than the one in qemu.
>
>
>
>
>
>
>>
>> It's a known problem that host mouse pointer can get out of sync with th=
e
>> guest which I think is because mouse acceleration on the host is not
>> correctly taken into account when reporting mouse moves to the guest and
>> this may try to correct that issue but it seems to cause more harm than
>> good in some cases. Any idea what might be the problem and how to solve
>> this? I wonder why nobody else is seeing this with other guests. (I'm no=
t
>> direcly interested in fixing it as I'm using sdl display but this makes
>> it
>> hard to use some guests for users whose distros make gtk backend the
>> default which may actually be most people so it might be a good idea to
>> improve this for them so I thought at least reporting the problem is
>> useful.)
>>
>
> I suspect SDL offers an API for relative mouse events, which works better
> than what we do in the gtk backend.
>
> I hope in the future we can drop the gtk code from qemu, in favor of
> dbus-display and rdw. Maintaining that kind of code is hard, and having t=
he
> same gtk widget base code for various remote desktop apps & protocols
> should help maintenance and offer a consistent behavior, whether you use
> QEMU/DBus, VNC, Spice, or RDP and whatever the future brings.
>
> (I wrote the above mostly from memory, I agree it's convoluted and a bit
> buggy, I doubt anyone likes it ;)
>
> --
> Marc-Andr=C3=A9 Lureau
>

Hi Zoltan,

While I can reproduce the issue you report when running morphos with gtk, I
cannot currently reproduce with the Mac OS/OSX guests I tested on Linux
host. Both mac99 (adb mouse and kbd) and mac99,via=3Dpmu (usb mouse and kbd=
)
keep the mouse inside the guest window with both sdl and gtk.

Best,
Howard

--000000000000292bf105d6962a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 8:48 PM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=
=3D"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jan 27, 2022 at 10:29 PM BALATON Zoltan &lt;<a href=3D"mailto:ba=
laton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
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
 likes it ;)</div><div><br></div><div><div>-- <br><div dir=3D"ltr">Marc-And=
r=C3=A9 Lureau<br></div></div></div></div></blockquote><div><br></div><div>=
Hi Zoltan,</div><div><br></div><div>While I can reproduce the issue you rep=
ort when running morphos with gtk, I cannot currently reproduce with the Ma=
c OS/OSX guests I tested on Linux host. Both mac99 (adb mouse and kbd) and =
mac99,via=3Dpmu (usb mouse and kbd) keep the mouse inside the guest window =
with both sdl and gtk.<br></div><div><br></div><div>Best,</div><div>Howard<=
br></div><div>=C2=A0<br></div></div></div>

--000000000000292bf105d6962a1d--

