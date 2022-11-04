Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654C618E96
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 04:09:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqn3g-0000SF-Nn; Thu, 03 Nov 2022 23:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqn3X-0007vJ-0G
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 23:07:43 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqn3U-0002Pn-Sx
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 23:07:42 -0400
Received: by mail-il1-x12a.google.com with SMTP id q5so2015072ilt.13
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 20:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tlpqRhQCbdMEQJyQ9MCcVpsxL2Wv1TDcU8sY98sgigE=;
 b=N8wCmK6tS2qsLZwoztXT9IrPXJvZKvZwiCUCzCU2bxcvdu1984rGnUB91lBwymNM5t
 MQ5F8SN4uQr6qq2+HQmM+B9ZjYftmehr9QX0noMMqgy+87dOCerMtTdB4mCqI9WQjUJE
 YG2GHIWfoi3j90DAMu//5TZ4rotUh0opLNyvmUscy8Xgy/wWiX/vDsj8Mxp5mGhV1WNI
 waTlGBifFXs8xClKGxpKI/xImjsX6iEDuSmgJz/FY1m3Zxbo/6+ezJcfpx91mPfPRHF5
 Mb0EMnBrUJXA+AY0TCY9GqfKBGD+sWB2kCzBTRBXHPSHiBBTW3UWsM6F2ifwLerBTe8O
 XGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tlpqRhQCbdMEQJyQ9MCcVpsxL2Wv1TDcU8sY98sgigE=;
 b=SrNNXZiuZCwPgQP/KcUmUCvegnKlOTOcXRnH2AF7MjjKNWrcAtRUvpESRb6ywgfnTb
 puEsSIfoMLnIXW1MecQnMWP0Zc21eQRLF4EYe31PpyceWrXUQWXF26UTXy7UsWa3Ej2d
 7umzHh6cfGZngTF4vwq/NF1t4HfXiKZ/3z7j7t0wp2UCS6eLRJn9lcVA4qE6fDtKwPBR
 ZMfsFmvJUKdfed9wcVbAOqCtdrUJ+vfZOPWm0nKveDkim7iE11Ad6+Es2XHIEWcK6ONr
 T56Td/sLWyRaP94rIrUqYj15X+lq0ZtCbJv9FWL87iw18aiDcrmZg5elg795KMBVsMVV
 8ZsQ==
X-Gm-Message-State: ACrzQf2iLw8MvoUWqIDvFqp+0M1jGzFNS+3HpxSXBOmxJwL8KgvsUYQq
 beE45z8Hj0/S/Ahnok7i6YEIZiQ8/GQoyFrQpj6zwA==
X-Google-Smtp-Source: AMsMyM60NW54b48G6RwQwMpVu1ejrQLQ0KZ0eThQzWVmm1YD+DIsQr1is3m0qcAHpbxCgBNZjj1KCDEYf3AisC61/M8=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr19468581ile.202.1667531259331; Thu, 03
 Nov 2022 20:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
 <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
 <CAARzgwyVA8M_9S2Hio5m9Zin9JyeWcHUeejQJj6=e98FkPYL2A@mail.gmail.com>
 <Y2P9QAMyL2MIfbSL@redhat.com>
 <CAARzgwzJtTaq317XvdMxd2JTZm9C+NjNNFE84anUORE0WxEx9w@mail.gmail.com>
 <20221103163136-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221103163136-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 4 Nov 2022 08:37:28 +0530
Message-ID: <CAARzgwzvtBdZJoo0J+y__sBnaSAt6k1yc6MN4sszVRQwpWVP2w@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 peter.maydell@linaro.org, philmd@linaro.org, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: multipart/alternative; boundary="0000000000005da87b05ec9c606e"
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000005da87b05ec9c606e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2022 at 02:02 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Nov 03, 2022 at 11:14:21PM +0530, Ani Sinha wrote:
> >
> >
> > On Thu, Nov 3, 2022 at 23:11 Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
> wrote:
> >
> >     On Thu, Nov 03, 2022 at 10:26:26PM +0530, Ani Sinha wrote:
> >     > On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha <ani@anisinha.ca> wrote=
:
> >     > >
> >     > > On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha <ani@anisinha.ca>
> wrote:
> >     > > >
> >     > > > On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca>
> wrote:
> >     > > > >
> >     > > > > > To pull this image:
> >     > > > >
> >     > > > > > $ docker pull
> registry.gitlab.com/qemu-project/qemu/fedora:latest
> >     > > > >
> >     > > > > Actually the URL is:
> >     > > > >
> >     > > > > $ docker pull registry.gitlab.com/qemu-project/qemu/qemu/
> >     fedora:latest
> >     > > > >
> >     > > > > > (or to be sure to pull the very same:)
> >     > > > >
> >     > > > > > $ docker pull
> >     > > > > > registry.gitlab.com/qemu-project/qemu/
> >
>  fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> >     > > > >
> >     > > > > Same here,
> >     > > > >
> >     > > > > registry.gitlab.com/qemu-project/qemu/qemu/
> >
>  fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> >     > > >
> >     > > > I pulled this container,
> >     >
> >     > This is fc35, the same mst is using:
> >     >
> >     > # cat /etc/fedora-release
> >     > Fedora release 35 (Thirty Five)
> >     >
> >     > Hmm. Something else is going on in the gitlab specific environmen=
t.
> >
> >     Or it is a non-deterministic race condition and the chance  of
> hitting
> >     it varies based on your hardware and/or CPU load.
> >
> >
> > Can we kick off the same CI job again? Does it pass this time?
> >
>
> It's completely deterministic on gitlab. Stefan also reproduced on
> his F36 box.


Then this means it=E2=80=99s not enough to simply use the same container as=
 the CI
and same configure line to reproduce all the issues.

--0000000000005da87b05ec9c606e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 4, 2022 at 02:02 Michael S. Tsirkin &lt;<a href=
=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Thu, Nov 03, 2022 at 11:14:21PM +0530, Ani Sinha w=
rote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Nov 3, 2022 at 23:11 Daniel P. Berrang=C3=A9 &lt;<a href=3D"ma=
ilto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; wro=
te:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Nov 03, 2022 at 10:26:26PM +0530, Ani Sinha=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha &lt;=
<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt=
; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha=
 &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</=
a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; On Thu, Nov 3, 2022 at 9:12 PM Ani S=
inha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.=
ca</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; To pull this image:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; $ docker pull <a href=3D"h=
ttp://registry.gitlab.com/qemu-project/qemu/fedora:latest" rel=3D"noreferre=
r" target=3D"_blank">registry.gitlab.com/qemu-project/qemu/fedora:latest</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; Actually the URL is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; $ docker pull <a href=3D"http:/=
/registry.gitlab.com/qemu-project/qemu/qemu/" rel=3D"noreferrer" target=3D"=
_blank">registry.gitlab.com/qemu-project/qemu/qemu/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0fedora:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; (or to be sure to pull the=
 very same:)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; $ docker pull<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; <a href=3D"http://registry=
.gitlab.com/qemu-project/qemu/" rel=3D"noreferrer" target=3D"_blank">regist=
ry.gitlab.com/qemu-project/qemu/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0fedora:d6d20c1c6aede3a652eb01b781530cc10392de276450=
3c84f9bf4eb1d7a89d26<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; Same here,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; <a href=3D"http://registry.gitl=
ab.com/qemu-project/qemu/qemu/" rel=3D"noreferrer" target=3D"_blank">regist=
ry.gitlab.com/qemu-project/qemu/qemu/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0fedora:d6d20c1c6aede3a652eb01b781530cc10392de276450=
3c84f9bf4eb1d7a89d26<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; I pulled this container,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is fc35, the same mst is using:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # cat /etc/fedora-release<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Fedora release 35 (Thirty Five)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hmm. Something else is going on in the gitlab =
specific environment.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Or it is a non-deterministic race condition and the=
 chance=C2=A0 of hitting<br>
&gt;=C2=A0 =C2=A0 =C2=A0it varies based on your hardware and/or CPU load.<b=
r>
&gt; <br>
&gt; <br>
&gt; Can we kick off the same CI job again? Does it pass this time?=C2=A0<b=
r>
&gt; <br>
<br>
It&#39;s completely deterministic on gitlab. Stefan also reproduced on<br>
his F36 box.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Then=
 this means it=E2=80=99s not enough to simply use the same container as the=
 CI and same configure line to reproduce all the issues.</div></div></div>

--0000000000005da87b05ec9c606e--

