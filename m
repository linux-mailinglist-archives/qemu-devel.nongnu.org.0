Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28656307CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:38:28 +0100 (CET)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BFS-00036r-Tx
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l5BBR-00016D-3h
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:34:17 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l5BBP-0005LX-2T
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:34:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id g15so4726350pgu.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzKdJ3qCqMCJGXOb0Hfwkp4SCbZ2e5K3dltAFrMCK7o=;
 b=fPVdPevrMkua2P+EszCep5siKP5SKlDm1KN5m8eS3Tx8669JuxDF/xI6m9ZkE16hLK
 JMkV/3qKZ85Mde/3ijbmFSAByQVY9VTN7SxiJg22stWRy+gqTfR1Zy1KEU383bbJeQ6O
 I+rlNx+fPHl4d6R+9WPr+uKSD+qugUvEKMSu0K/oZANSr8OXCJouUZqbMv+hF+72mX99
 LWW7ID61Ygv6zlBxSzrQUhoQWTFMqwGWOZIaaTl8tdkOtOMPy1UotDWWQzjriGPX4km/
 tmnFm7eK7fJRS0sJvH6tHtEtrxLf4j4AhKxGP/JVcbjGnJvNPINDeFxSppvCLvrHBIH8
 8nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzKdJ3qCqMCJGXOb0Hfwkp4SCbZ2e5K3dltAFrMCK7o=;
 b=oa+MWmbrS5BQ/Ksb8zZE9kOGcXCQQbp5Tn0++qQD10Mpan7rtQpGuMNOfOzSwRqeB5
 JS+Snke+bM1o3McMy5aGBCvX4kO+YkQdEocttoHOVK6rpuCPmvgGfcZyPERh2NihIje1
 VU3FbHltJ+fKjmZwRmJTG3Elpji4ymy+zfv4IolnEe1VsW64eVDMSX4hkoI/i6fADN1n
 mfhCZHVuzWQ2IIa3a8aYspaAmzkU0LiYryhwTIFC2S8TKFOudBJkcnIHyOPwHiOZRo+1
 44rquXwbyM3uelwgW3K/ugbEpb8nHyK8Y4bX8YoE/sJO4oZTE7CqC7xMq9PpEF5UQSuX
 xj1w==
X-Gm-Message-State: AOAM533ScLhICu7SBWLpDKZKI1bb5RcbBB+RKTw9cMp8BDz2f4VTDIrD
 iNwf+Lo9JgbruZ7SHp0QGPHMlXGljSNDq6A6VPk=
X-Google-Smtp-Source: ABdhPJwoGcEqHAYav9vydUh5xhxep2gEnxlU8hTB1LsqIaN4sfYin0IaisokbCTd7FKy5KNM5K8bAOMYKPFgSewimns=
X-Received: by 2002:a63:1626:: with SMTP id w38mr560801pgl.278.1611855253486; 
 Thu, 28 Jan 2021 09:34:13 -0800 (PST)
MIME-Version: 1.0
References: <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
In-Reply-To: <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 28 Jan 2021 23:04:01 +0530
Message-ID: <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d041a905b9f94bb7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d041a905b9f94bb7
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Jan 2021 at 22:00, Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Thu, Jan 28, 2021 at 09:20:31PM +0530, Shreyansh Chouhan wrote:
> > (Gerd, I wasn't able to get gmail to quote your email, so I have just
> copy
> > pasted the relavant parts.)
> >
> > > Yes.  net_conf is common config (backend, mac address, maybe more) for
> > > network devices.  For sound devices that would audiodev (link the
> device
> > > to a backend which then handles alsa/pulse/jack/oss/sdl/whatever).
> >
> > Ah I see, so the net_conf corresponds to audiodev?
>
> Oops.  Confused that.  nic_conf (struct NICConf) is the common config
> for all network devices, not net_conf.
>
> See DEFINE_NIC_PROPERTIES() in include/net/net.h
>
> NICConf.peers (exposed as "netdev" property) links the emulated device
> (frontend) to a netdev (backend) which actually processes the packets
> sent by the guest.
>
> In a simliar way the audiodev property links the emulated audio device
> to a backend which handles the host-side audio playback using alsa,
> pulseaudio or something else.
>
> > I thought it would correspond to `virtio_snd_conf`. So as alex said,
> > `virtio_snd_conf` is the front end configuration.
>
> Correct.
>
> The backend is configured separately, i.e.
>
>   -netdev user,id=net0,$moreargs
>
> or
>
>   -audiodev alsa,id=snd0,$moreargs
>
> Then the two are linked by id, i.e.
>
>   -device virtio-net-pci,netdev=net0
>
> or
>
>   -device virtio-sound-pci,audiodev=snd0
>

Ah ha! So `virtio-snd-conf` corresponds to the `-device` configuration
and `audiodev` to the backend configuration. I think the audio code
now makes more sense to me. I will give it another read.

> > The only thing really required is the audiodev property.  Everything
> > > else can be hard-coded initially, and once the basics are working
> > > refined (like adding properties for jack labels, ...).
> >
> > So in the realize function I set up the audiodev, right? Also in that
> case
> > why the difference between the net and sound devices? In the net
> > device we set up the common config in net_conf. Does the net_conf
> > somehow later sets up NetDev too?
> >
> > And what is a NetClientState? Is the NetClient the emulated guest? This
> > confuses me a lot. I can't understand what will be the parellel audio
> device
> > property.
>
> Not fully sure what NetClientState is, I guess it is shared struct for
> both frontend and backend to manage the connection state.
>
> The audio subsystem has simliar structs, SWVoiceIn and SWVoiceOut for
> example.  There also is QEMUSoundCard.  I'd suggest to check out the
> source code of other audio devices for code examples.
>
I will read it and revert back if I have any queries.

>
> > Also I can't seem to find where we parse the command line options
> > passed to qemu.  The code structure is a bit different from what I had
> > expected. In virtio_net_device_realize we set duplex to half or full
> > depending on the value of the net_conf.duplex_str. But I couldn't find
> > where we actually set it.
>
> See virtio_net_properties[].  There is a line in the array:
>
>     DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),
>
I thought this just declared a property, and didn't set it. But now that in
retrospect
we already declared the variable when we defined the struct so that doesn't
make
sense.

>
> And the whole array is registered using:
>
>    device_class_set_props(dc, virtio_net_properties);
>
> That is enough to make those properties work, the qemu core handles
> everything for you.  See hw/core/qdev-properties.c if you are curious,
> but you can also just consider that a black box at service for you ;)
>
I think I will give it a quick look :P

>
> take care,
>   Gerd
>
> Thanks a lot!
--
Shreyansh

--000000000000d041a905b9f94bb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 Jan 2021 at 22:00, Gerd Ho=
ffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Ja=
n 28, 2021 at 09:20:31PM +0530, Shreyansh Chouhan wrote:<br>
&gt; (Gerd, I wasn&#39;t able to get gmail to quote your email, so I have j=
ust copy<br>
&gt; pasted the relavant parts.)<br>
&gt; <br>
&gt; &gt; Yes.=C2=A0 net_conf is common config (backend, mac address, maybe=
 more) for<br>
&gt; &gt; network devices.=C2=A0 For sound devices that would audiodev (lin=
k the device<br>
&gt; &gt; to a backend which then handles alsa/pulse/jack/oss/sdl/whatever)=
.<br>
&gt; <br>
&gt; Ah I see, so the net_conf corresponds to audiodev?<br>
<br>
Oops.=C2=A0 Confused that.=C2=A0 nic_conf (struct NICConf) is the common co=
nfig<br>
for all network devices, not net_conf.<br>
<br>
See DEFINE_NIC_PROPERTIES() in include/net/net.h<br>
<br>
NICConf.peers (exposed as &quot;netdev&quot; property) links the emulated d=
evice<br>
(frontend) to a netdev (backend) which actually processes the packets<br>
sent by the guest.<br>
<br>
In a simliar way the audiodev property links the emulated audio device<br>
to a backend which handles the host-side audio playback using alsa,<br>
pulseaudio or something else.<br>
<br>
&gt; I thought it would correspond to `virtio_snd_conf`. So as alex said,<b=
r>
&gt; `virtio_snd_conf` is the front end configuration.<br>
<br>
Correct.<br>
<br>
The backend is configured separately, i.e.<br>
<br>
=C2=A0 -netdev user,id=3Dnet0,$moreargs<br>
<br>
or<br>
<br>
=C2=A0 -audiodev alsa,id=3Dsnd0,$moreargs<br>
<br>
Then the two are linked by id, i.e.<br>
<br>
=C2=A0 -device virtio-net-pci,netdev=3Dnet0<br>
<br>
or<br>
<br>
=C2=A0 -device virtio-sound-pci,audiodev=3Dsnd0<br></blockquote><div>=C2=A0=
</div><div>Ah ha! So `virtio-snd-conf` corresponds to the `-device` configu=
ration</div><div>and `audiodev` to the backend configuration. I think the a=
udio code</div><div>now makes more sense to me. I will give it another read=
.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; &gt; The only thing really required is the audiodev property.=C2=A0 Ev=
erything<br>
&gt; &gt; else can be hard-coded initially, and once the basics are working=
<br>
&gt; &gt; refined (like adding properties for jack labels, ...).<br>
&gt; <br>
&gt; So in the realize function I set up the audiodev, right? Also in that =
case<br>
&gt; why the difference between the net and sound devices? In the net<br>
&gt; device we set up the common config in net_conf. Does the net_conf<br>
&gt; somehow later sets up NetDev too?<br>
&gt; <br>
&gt; And what is a NetClientState? Is the NetClient the emulated guest? Thi=
s<br>
&gt; confuses me a lot. I can&#39;t understand what will be the parellel au=
dio device<br>
&gt; property.<br>
<br>
Not fully sure what NetClientState is, I guess it is shared struct for<br>
both frontend and backend to manage the connection state.<br>
<br>
The audio subsystem has simliar structs, SWVoiceIn and SWVoiceOut for<br>
example.=C2=A0 There also is QEMUSoundCard.=C2=A0 I&#39;d suggest to check =
out the<br>
source code of other audio devices for code examples.<br></blockquote><div>=
I will read it and revert back if I have any queries. </div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
&gt; Also I can&#39;t seem to find where we parse the command line options<=
br>
&gt; passed to qemu.=C2=A0 The code structure is a bit different from what =
I had<br>
&gt; expected. In virtio_net_device_realize we set duplex to half or full<b=
r>
&gt; depending on the value of the net_conf.duplex_str. But I couldn&#39;t =
find<br>
&gt; where we actually set it.<br>
<br>
See virtio_net_properties[].=C2=A0 There is a line in the array:<br>
<br>
=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;duplex&quot;, VirtIONet, net_conf.du=
plex_str),<br></blockquote><div>I thought this just declared a property, an=
d didn&#39;t set it. But now that in retrospect</div><div>we already declar=
ed the variable when we defined the struct so that doesn&#39;t make</div><d=
iv>sense.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
And the whole array is registered using:<br>
<br>
=C2=A0 =C2=A0device_class_set_props(dc, virtio_net_properties);<br>
<br>
That is enough to make those properties work, the qemu core handles<br>
everything for you.=C2=A0 See hw/core/qdev-properties.c if you are curious,=
<br>
but you can also just consider that a black box at service for you ;)<br></=
blockquote><div>I think I will give it a quick look :P <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
take care,<br>
=C2=A0 Gerd<br>
<br></blockquote><div>Thanks a lot!</div><div>--</div><div>Shreyansh<br></d=
iv><div> <br></div></div></div>

--000000000000d041a905b9f94bb7--

