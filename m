Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BBE307F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:24:01 +0100 (CET)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Dpg-0004IH-K1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5DkR-00089Q-D5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:18:35 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5DkO-0003zL-TJ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:18:35 -0500
Received: by mail-ej1-x631.google.com with SMTP id r12so9676050ejb.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 12:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAtJWjRuCfvHYRLBrDYaimjyau58BQ6WjERD3wqXJsA=;
 b=CCNekYUiUfdkgF2WZL0Kwusr6bxHEElmywZVcKLRTjjQH5D2p9Sl7INddyJ67xkcTr
 VcMhha/IBW18p78Bh1XS+VcCKz4/0H89K2ba7pYHIgBfiRscPv57ttesUFfHbT9gk6aT
 93P8qLxEftyUQUN/PaV0yf+JGo9bjBO4lExKXSwjjD0JR/dki7VIruReXxqTcWm+Tms4
 jvLogvcQQrKLIo6lSHj5sMiyLru6HKnc9ctLgKDIo7WV9KJ84GraSuIeJkiMByXk6+w6
 0DXV+fISiF4Vm5km0Ofn+oaZWaPYjVMHDKfTWAdrnvWlNHazidSDuJy8VFmqZagCdyRF
 jv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAtJWjRuCfvHYRLBrDYaimjyau58BQ6WjERD3wqXJsA=;
 b=X3sDVdcOeFMy2nTOLymlhzZZB8S59a8Risgb2Ig6qzAI9mDszQkmpj4ffKQUwOyiut
 VqMrEUpqZ1nB451DJJw6W4y5i9VJ2KxczJZ6mflpBgP8OIYHprUVr1nRyRSn1rVsU8tT
 cjAcRCGhRjQIaSrfAZVbMyabgX9XKqKRGWn3H+9Wee6Wb4AZ5hASSUdkBKSD/VI41+2K
 TkSLPEQyFuQcqTF/9qCOpta0sWOIUv+Sv8u5+ZHexwwSx867BhGqqU9/9OAZovo/Ascy
 Hb9zCoDbrqMtCcH7oNpA8oozpRaC4PhSZs8lkFTjvFr7IFRp+VXmf3X+D93Gg4+8A9lF
 kT+g==
X-Gm-Message-State: AOAM532zNl9bqHG4/jwt++mQ/uSeeigyBJ4WMPGYDSoxT/mAf8yi1LGo
 dWL9RJMkL3Kw7t6UTSqZW4dLdDCuS2Ecy5gbrmI=
X-Google-Smtp-Source: ABdhPJzitfdJNbvAyalwbeTVMfOO3OMOv5PwYx1pwgRHd331CJsi1pu+gQgxB4aAWkTK07d9HAONbocMjP03c5BCq8w=
X-Received: by 2002:a17:906:2785:: with SMTP id
 j5mr1113540ejc.527.1611865110998; 
 Thu, 28 Jan 2021 12:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
In-Reply-To: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 29 Jan 2021 00:18:19 +0400
Message-ID: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
Subject: Re: vnc clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005e0dbf05b9fb97d7"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

--0000000000005e0dbf05b9fb97d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jan 28, 2021 at 9:14 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi folks,
>
> I'm looking for a good way to implement cut+paste support for vnc.
>
> The vnc core protocol has support for text/plain cut+paste, and there
> is an extension adding support for other formats.  That'll cover one
> part of the problem, exchanging cut+paste data between vnc client and
> qemu vnc server.
>
> The tricky part is the second: the guest <=3D> qemu communication.
> I see basically two possible approaches here:
>
>   (1) Have some guest agent (spice does it that way).
>       Advantage: more flexible, allows more features.
>       Disadvantage: requires agent in the guest.
>
>   (2) Send text as key events.
>       Advantage: no guest agent needed.
>       Disadvantage: is translated by guests keyboard map, so qemu
>       needs to know the map for proper char -> key event translation.
>       Only works for text/plain and only for chars you can easily
>       type, anything needing input methods (emoji =F0=9F=98=8A for exampl=
e)
>       isn't going to fly.
>
> I think that (1) is clearly the better way.  Given that the agent
> would need to run in user wayland/xorg session context the existing
> qemu-guest-agent will not work.  Also linking against some UI library
> like gtk3 for clipboard handling is not something we want for the
> qemu-guest-agent.  So we need another one, I'll name it
> qemu-clipboard-agent for the rest of this mail.  And we need a
> communication channel.
>
> I'd tend to model the qemu-clipboard-agent simliar to the
> qemu-guest-agent, i.e. have some stream as communication path and run
> some stream protocol over it.
>
> Stream options I see are (in order of personal preference):
>
>   (1) New virtio-serial port.  virtio-serial likely is there anyway
>       for the qemu-guest-agent ...
>
>   (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
>       channel, i.e. qemu-clipboard-agent will proxy everything through
>       qemu-guest-agent (spice does it that way).
>
> Protocol options I see are (not sure yet which to prefer, need to have
> a closer look at the candidates):
>
>   (1) Add clipboard commands to QMP and use these.
>
>   (2) Reuse the clipboard bits of the vnc protocol (forward
>       VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
>
>   (3) Reuse the clipboard bits of the spice-agent protocol.
>
>   (4) Reuse the clipboard bits of the wayland protocol.
>
> Once we have sorted the qemu <-> guest communication path it should be
> possible to also hook up other UIs (specifically gtk) without too much
> effort.  Which probably makes (2) a rather poor choice.
>
> Comments?
> Suggestions?
> Other ideas?
>


I also had recently some thoughts about how to implement clipboard sharing
in a more general way for QEMU.

I admit I like Christophe's suggestion ("it's somebody else problem"), but
it falls short to me as I don't know of a common open-source remoting
solution for various operating systems, and I don't see how it could
integrate well with our UI and remote protocols. Or look at reusing some
VirtualBox code perhaps?

Some things I keep in mind:
- the spice protocol had a number of iterations to fix some races. It would
be great not to repeat the same mistakes, and I don't know if VNC have the
same flaws or not.
- the spice agent design isn't great: the system agent proxies messages to
the active session. It would be nice if the new solution didn't have such a
middle-man.
- with wayland, clipboard sharing isn't really possible. Or not in a
seamless way at least. Today it kinda works with some X11 compatibility
extensions, but this will eventually go away or change behaviour.
- the GNOME desktop is working on remoting using RDP, and they are
implementing a DBus interface for it (
https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote-desktop-clipboa=
rd
)
- it's not just about clipboard. We would also want to have some kind of
drag and drop (even if limited to files like Spice atm). We may want some
windowing integration. We may also want to have access to some desktop
services: apps, documents etc.. And what's not.

That leads me to think that virtio-serial is not very well suited, as it
doesn't allow various services / processes to come and go. I see vsock as a
much better alternative. (I also wonder if it handles control flow any
better btw)

I think we shoud work on getting the free desktops our best-class support.
To me, this means we need to speak the lingua franca, which is DBus. The
great thing is that DBus is also equipped to handle services that come and
go, handling discovery, introspection etc. Various services are already
available. As mentioned earlier, that's what the GNOME desktop will offer
for clipboard sharing. There are good chances other desktops will follow if
that design works, as it should be easy for them to implement the same
service. That means good reuse of existing desktop code. Speaking DBus on
Windows, MacOS or Android isn't an issue. However, vsock support may be a
bit tricky atm.

Fwiw, DBus doesn't yet officially support vsock connections:
https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/200. This a minor
detail, as once you give it a fd for transport, it doesn't really care (I
also took care of glib!1892 and Rust zbus)

Oh and of course, since this is a new daemon, it would be really a shame
not to write it in a modern language (hint! ;-).

Hope that helps,

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005e0dbf05b9fb97d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 28, 2021 at 9:14 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
 Hi folks,<br>
<br>
I&#39;m looking for a good way to implement cut+paste support for vnc.<br>
<br>
The vnc core protocol has support for text/plain cut+paste, and there<br>
is an extension adding support for other formats.=C2=A0 That&#39;ll cover o=
ne<br>
part of the problem, exchanging cut+paste data between vnc client and<br>
qemu vnc server.<br>
<br>
The tricky part is the second: the guest &lt;=3D&gt; qemu communication.<br=
>
I see basically two possible approaches here:<br>
<br>
=C2=A0 (1) Have some guest agent (spice does it that way).<br>
=C2=A0 =C2=A0 =C2=A0 Advantage: more flexible, allows more features.<br>
=C2=A0 =C2=A0 =C2=A0 Disadvantage: requires agent in the guest.<br>
<br>
=C2=A0 (2) Send text as key events.<br>
=C2=A0 =C2=A0 =C2=A0 Advantage: no guest agent needed.<br>
=C2=A0 =C2=A0 =C2=A0 Disadvantage: is translated by guests keyboard map, so=
 qemu<br>
=C2=A0 =C2=A0 =C2=A0 needs to know the map for proper char -&gt; key event =
translation.<br>
=C2=A0 =C2=A0 =C2=A0 Only works for text/plain and only for chars you can e=
asily<br>
=C2=A0 =C2=A0 =C2=A0 type, anything needing input methods (emoji =F0=9F=98=
=8A for example)<br>
=C2=A0 =C2=A0 =C2=A0 isn&#39;t going to fly.<br>
<br>
I think that (1) is clearly the better way.=C2=A0 Given that the agent<br>
would need to run in user wayland/xorg session context the existing<br>
qemu-guest-agent will not work.=C2=A0 Also linking against some UI library<=
br>
like gtk3 for clipboard handling is not something we want for the<br>
qemu-guest-agent.=C2=A0 So we need another one, I&#39;ll name it<br>
qemu-clipboard-agent for the rest of this mail.=C2=A0 And we need a<br>
communication channel.<br>
<br>
I&#39;d tend to model the qemu-clipboard-agent simliar to the<br>
qemu-guest-agent, i.e. have some stream as communication path and run<br>
some stream protocol over it.<br>
<br>
Stream options I see are (in order of personal preference):<br>
<br>
=C2=A0 (1) New virtio-serial port.=C2=A0 virtio-serial likely is there anyw=
ay<br>
=C2=A0 =C2=A0 =C2=A0 for the qemu-guest-agent ...<br>
<br>
=C2=A0 (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent<b=
r>
=C2=A0 =C2=A0 =C2=A0 channel, i.e. qemu-clipboard-agent will proxy everythi=
ng through<br>
=C2=A0 =C2=A0 =C2=A0 qemu-guest-agent (spice does it that way).<br>
<br>
Protocol options I see are (not sure yet which to prefer, need to have<br>
a closer look at the candidates):<br>
<br>
=C2=A0 (1) Add clipboard commands to QMP and use these.<br>
<br>
=C2=A0 (2) Reuse the clipboard bits of the vnc protocol (forward<br>
=C2=A0 =C2=A0 =C2=A0 VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)<b=
r>
<br>
=C2=A0 (3) Reuse the clipboard bits of the spice-agent protocol.<br>
<br>
=C2=A0 (4) Reuse the clipboard bits of the wayland protocol.<br>
<br>
Once we have sorted the qemu &lt;-&gt; guest communication path it should b=
e<br>
possible to also hook up other UIs (specifically gtk) without too much<br>
effort.=C2=A0 Which probably makes (2) a rather poor choice.<br>
<br>
Comments?<br>
Suggestions?<br>
Other ideas?<br>
</blockquote></div><div><br></div><div><br></div><div>I also had recently s=
ome thoughts about how to implement clipboard sharing in a more general way=
 for QEMU.</div><div><br></div><div>I admit I like Christophe&#39;s suggest=
ion (&quot;it&#39;s somebody else problem&quot;), but it falls short to me =
as I don&#39;t know of a common open-source remoting solution for various o=
perating systems, and I don&#39;t see how it could integrate well with our =
UI and remote protocols. Or look at reusing some VirtualBox code perhaps?<b=
r></div><div><br></div><div>Some things I keep in mind:</div><div>- the spi=
ce protocol had a number of iterations to fix some races. It would be great=
 not to repeat the same mistakes, and I don&#39;t know if VNC have the same=
 flaws or not.</div><div>- the spice agent design isn&#39;t great: the syst=
em agent proxies messages to the active session. It would be nice if the ne=
w solution didn&#39;t have such a middle-man.<br></div><div>- with wayland,=
 clipboard sharing isn&#39;t really possible. Or not in a seamless way at l=
east. Today it kinda works with some X11 compatibility extensions, but this=
 will eventually go away or change behaviour.</div><div>- the GNOME desktop=
 is working on remoting using RDP, and they are implementing a DBus interfa=
ce for it (<a href=3D"https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/=
remote-desktop-clipboard">https://gitlab.gnome.org/jadahl/mutter/-/commits/=
wip/remote-desktop-clipboard</a>)</div><div>- it&#39;s not just about clipb=
oard. We would also want to have some kind of drag and drop (even if limite=
d to files like Spice atm). We may want some windowing integration. We may =
also want to have access to some desktop services: apps, documents etc.. An=
d what&#39;s not.</div><div><br></div><div>That leads me to think that virt=
io-serial is not very well suited, as it doesn&#39;t allow various services=
 / processes to come and go. I see vsock as a much better alternative. (I a=
lso wonder if it handles control flow any better btw)</div><div><br></div><=
div>I think we shoud work on getting the free desktops our best-class suppo=
rt. To me, this means we need to speak the lingua franca, which is DBus. Th=
e great thing is that DBus is also equipped to handle services that come an=
d go, handling discovery, introspection etc. Various services are already a=
vailable. As mentioned earlier, that&#39;s what the GNOME desktop will offe=
r for clipboard sharing. There are good chances other desktops will follow =
if that design works, as it should be easy for them to implement the same s=
ervice. That means good reuse of existing desktop code. Speaking DBus on Wi=
ndows, MacOS or Android isn&#39;t an issue. However, vsock support may be a=
 bit tricky atm.</div><div><br></div><div>Fwiw, DBus doesn&#39;t yet offici=
ally support vsock connections: <a href=3D"https://gitlab.freedesktop.org/d=
bus/dbus/-/merge_requests/200">https://gitlab.freedesktop.org/dbus/dbus/-/m=
erge_requests/200</a>. This a minor detail, as once you give it a fd for tr=
ansport, it doesn&#39;t really care (I also took care of glib!1892 and Rust=
 zbus)<br></div><div><br></div><div>Oh and of course, since this is a new d=
aemon, it would be really a shame not to write it in a modern language (hin=
t! ;-).</div><div><br></div><div>Hope that helps,</div><div><br></div><div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br=
></div></div></div>

--0000000000005e0dbf05b9fb97d7--

