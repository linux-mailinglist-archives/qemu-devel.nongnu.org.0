Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE46661865C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:45:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqeGb-0000cA-OJ; Thu, 03 Nov 2022 13:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqeGa-0000bl-3m
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:44:36 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqeGX-0005r5-J0
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:44:35 -0400
Received: by mail-il1-x129.google.com with SMTP id q5so1416810ilt.13
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lsaDJlFyKHRWD7vo4ctg/T9drM4UOl5/W7N4sjN8H8U=;
 b=ByVyIXW/Ubaj6asCDsHO5W+zynNWSh59zN30e7zpWmzC+3ul+vY8AhGIktpqHMjvfF
 S6a31dPNF5amJMzUn6S9qyMshrFE3IMSRi/qqui8PVfFuJZX2j7hrQKbbHbuYY/T+ctP
 2FuJgJUMhwyJRVnLnF61yXWcvnO6oFa0cURdgD9XgyTKgAR7258C6WAkQVLN+N1mpTr7
 CuVL/iOXGsIQQS6JXK0dSnkKtsKFbd9lYn5+6YMfIHydXUJxOsp5gmouhQ1kA+Eve0GI
 jbXQ3mX+EvVjOjSVVnh4saXEPAMSOchWGC6HQRWEcEAIhRIy4XYbIt8v4SdAr6wwfJQ8
 zEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lsaDJlFyKHRWD7vo4ctg/T9drM4UOl5/W7N4sjN8H8U=;
 b=Mi9nkq8PU8obY1u4Z63PCiQGvj7p63mEdh/jpSCtkzslVRUkstO+j9C27I7154asbD
 wtfyWuP43FMtbvNWrschB2QaCHz78H0SZMaosnawrYPuM8IlB2Y5glZ1qsqWwbG5z204
 SNZBdniEkEzviMhHtcLAvh9fFVCqs0X5SPTs+708w9vxd5hZEmoxbu5K+D8DdjxDD2F9
 h0n4ERK66Bw3C5cq4yY0ji8f8aBDVSs5jfRRRRPWpXkcbZ7qIjj8EUrRwMIAjMdURAOP
 LIOGGpoCIy4t5kep+vDXRAtIuqXqaiafR+z7OaSjYvGxjmb+gcRAQL1zivJiNY/E9Dhv
 SG7Q==
X-Gm-Message-State: ACrzQf2dUKxvYpOXtneoD2db+4PRq4r03eN/czUUaXVWZNgl+2xZVLEX
 1I+4O5fJ7PQdnQ+I5H47WCB0AAz9yy7KW5DPK8kCrQ==
X-Google-Smtp-Source: AMsMyM51foUNRjKJF6Jj3SzvAm0AVzlaOq8w/K9YM5o6oUi42cXOSY6TTSfYrHPBXIFT7hNxkliK6YIpPYboFwQiN1c=
X-Received: by 2002:a92:2e0e:0:b0:300:a037:caf9 with SMTP id
 v14-20020a922e0e000000b00300a037caf9mr16302710ile.63.1667497472051; Thu, 03
 Nov 2022 10:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
 <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
 <CAARzgwyVA8M_9S2Hio5m9Zin9JyeWcHUeejQJj6=e98FkPYL2A@mail.gmail.com>
 <Y2P9QAMyL2MIfbSL@redhat.com>
In-Reply-To: <Y2P9QAMyL2MIfbSL@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 3 Nov 2022 23:14:21 +0530
Message-ID: <CAARzgwzJtTaq317XvdMxd2JTZm9C+NjNNFE84anUORE0WxEx9w@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: mst@redhat.com, peter.maydell@linaro.org, philmd@linaro.org, 
 qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: multipart/alternative; boundary="0000000000007c629a05ec948256"
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x129.google.com
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

--0000000000007c629a05ec948256
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2022 at 23:11 Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Thu, Nov 03, 2022 at 10:26:26PM +0530, Ani Sinha wrote:
> > On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > > To pull this image:
> > > > >
> > > > > > $ docker pull
> registry.gitlab.com/qemu-project/qemu/fedora:latest
> > > > >
> > > > > Actually the URL is:
> > > > >
> > > > > $ docker pull
> registry.gitlab.com/qemu-project/qemu/qemu/fedora:latest
> > > > >
> > > > > > (or to be sure to pull the very same:)
> > > > >
> > > > > > $ docker pull
> > > > > >
> registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b78153=
0cc10392de2764503c84f9bf4eb1d7a89d26
> > > > >
> > > > > Same here,
> > > > >
> > > > >
> registry.gitlab.com/qemu-project/qemu/qemu/fedora:d6d20c1c6aede3a652eb01b=
781530cc10392de2764503c84f9bf4eb1d7a89d26
> > > >
> > > > I pulled this container,
> >
> > This is fc35, the same mst is using:
> >
> > # cat /etc/fedora-release
> > Fedora release 35 (Thirty Five)
> >
> > Hmm. Something else is going on in the gitlab specific environment.
>
> Or it is a non-deterministic race condition and the chance  of hitting
> it varies based on your hardware and/or CPU load.


Can we kick off the same CI job again? Does it pass this time?

>

--0000000000007c629a05ec948256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 3, 2022 at 23:11 Daniel P. Berrang=C3=A9 &lt;<a=
 href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)">On Thu, Nov 03, 2022 at 10:26:26PM +0530, Ani Sinha =
wrote:<br>
&gt; On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha &lt;<a href=3D"mailto:ani@an=
isinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha &lt;<a href=3D"mailto:a=
ni@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha &lt;<a href=3D"mail=
to:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; To pull this image:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; $ docker pull <a href=3D"http://registry.gitlab.co=
m/qemu-project/qemu/fedora:latest" rel=3D"noreferrer" target=3D"_blank">reg=
istry.gitlab.com/qemu-project/qemu/fedora:latest</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Actually the URL is:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; $ docker pull <a href=3D"http://registry.gitlab.com/qem=
u-project/qemu/qemu/fedora:latest" rel=3D"noreferrer" target=3D"_blank">reg=
istry.gitlab.com/qemu-project/qemu/qemu/fedora:latest</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; (or to be sure to pull the very same:)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; $ docker pull<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"http://registry.gitlab.com/qemu-project=
/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d=
26" rel=3D"noreferrer" target=3D"_blank">registry.gitlab.com/qemu-project/q=
emu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26=
</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Same here,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"http://registry.gitlab.com/qemu-project/qemu=
/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d=
26" rel=3D"noreferrer" target=3D"_blank">registry.gitlab.com/qemu-project/q=
emu/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a=
89d26</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I pulled this container,<br>
&gt; <br>
&gt; This is fc35, the same mst is using:<br>
&gt; <br>
&gt; # cat /etc/fedora-release<br>
&gt; Fedora release 35 (Thirty Five)<br>
&gt; <br>
&gt; Hmm. Something else is going on in the gitlab specific environment.<br=
>
<br>
Or it is a non-deterministic race condition and the chance=C2=A0 of hitting=
<br>
it varies based on your hardware and/or CPU load.</blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Can we kick off the same CI job again? Doe=
s it pass this time?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote>=
</div></div>

--0000000000007c629a05ec948256--

