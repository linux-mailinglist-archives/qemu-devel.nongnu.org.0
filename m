Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822843B056D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:04:00 +0200 (CEST)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvg4N-0003w7-JO
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lvg2Z-0002QD-A3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:02:07 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lvg2U-0004wj-TZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:02:07 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so21125869oti.2
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cXfi5PMC6KlxLdghM3vWMF7VkRMBcsqo9hnvAikASs=;
 b=nTRlVqPLr3s1JWnCrm+yy4CMn3K2okhmpt0HkAAo9jb1EZucq9Io/BlUwKNhN1hRPk
 7TyEohRqdDSco0s2V/gPvwFp69a5187AMAY+s3mo4S1k4dGnpUBif7/8h97EY61hfCOC
 O//wzUNp7lWlzJMkbJPCqLFqiV6qgntT320UCe0sIHAnBVff/bgTPVh5alTVUJ+No/B/
 jSNQsVaHqbJcQVHnsWGDwHFZAtzgoqrMlzRRr2cz5Wbex3YM6HBY4qYN8suB+xKi5hgm
 WNPUWUmpT7AiqiQgOvXt9r7LXXhsqk0LLTl4pTdARlaeEZDV71wgPt8tr0HFJNd3eaSA
 eeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cXfi5PMC6KlxLdghM3vWMF7VkRMBcsqo9hnvAikASs=;
 b=B0xXUZiLI5PedHeiyk5Tr8xDoG3RWnHFGef2DqfANUxemLgE02Ovgztii5IOr+J/s+
 x36WDR1lbz+rs6zw4Bh/xabeKCxuGq4doF3RIfXL4W+EzughGqbedw5aPSqtBLX2/hHQ
 7Pp/PZLdPj5iUd8HS2iQ/jqHPZSBv1MUcg70nNt2uwEc73av7VANjudEbH+gH2JGLeFc
 f9RpOWit8fbVeNXuCw52nRUHIe6eXq3XtUjXb+V8RxyEok20Sd+HK5ZquLmBIlbTYkCn
 aIjSJUOL4OIxRJTBvTpkLHZbwxm4zuLpNNVLNhRWCjyt391yOYP66b/9Hh3VHJH2E+x9
 AJDg==
X-Gm-Message-State: AOAM530AKVpfxX13kVbhq4pV1EvLQQ4UBjlOM5B4IjNaq6UVgMBN9uR/
 EHdsQgmnWTpU3zEclrvZttDWUj5PByqqNNJq4hN/0g==
X-Google-Smtp-Source: ABdhPJxzM8SJ9dUaMjeGBw2cFOQtbf8WxxZ4dEqHL+vDGUPeZTC4kUjGleBudc2qfPupyjbym/gVUJf2aifVGGAtvY8=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr3113743ota.116.1624366919501; 
 Tue, 22 Jun 2021 06:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com> <87o8byqpao.fsf@toke.dk>
 <YNGe3iiZ103ps36n@redhat.com> <87im26qn9q.fsf@toke.dk>
In-Reply-To: <87im26qn9q.fsf@toke.dk>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Tue, 22 Jun 2021 16:01:48 +0300
Message-ID: <CABcq3pHAWuNuuiUgVhx7qXRorBSistct8X4pCNEYdJ0SuLJCWw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000038dae805c55a65dc"
Received-SPF: none client-ip=2607:f8b0:4864:20::336;
 envelope-from=andrew@daynix.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000038dae805c55a65dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Thank you for your comments.
I'll play with array type mmap. And later will provide some solution.

On Tue, Jun 22, 2021 at 12:09 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com>
wrote:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke H=C3=B8iland-J=C3=B8rgen=
sen wrote:
> >> Jason Wang <jasowang@redhat.com> writes:
> >>
> >> > =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri Benditovich =E5=86=
=99=E9=81=93:
> >> >> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com>
> wrote:
> >> >>>
> >> >>> =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Melnichenko =E5=
=86=99=E9=81=93:
> >> >>>> Hi Jason,
> >> >>>> I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,
> Ubuntu,
> >> >>>> and Debian - no need permissions to update BPF maps.
> >> >>>
> >> >>> How about RHEL :) ?
> >> >> If I'm not mistaken, the RHEL releases do not use modern kernels ye=
t
> >> >> (for BPF we need 5.8+).
> >> >> So this will be (probably) relevant for RHEL 9. Please correct me i=
f
> I'm wrong.
> >> >
> >> > Adding Toke for more ideas on this.
> >>
> >> Ignore the kernel version number; we backport all of BPF to RHEL,
> >> basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.
> >>
> >> However, we completely disable unprivileged BPF on RHEL kernels. Also,
> >> there's upstream commit:
> >> 08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by
> default")
> >>
> >> which adds a new value of '2' to the unprivileged_bpf_disable sysctl. =
I
> >> believe this may end up being the default on Fedora as well.
> >>
> >> So any design relying on unprivileged BPF is likely to break; I'd
> >> suggest you look into how you can get this to work with CAP_BPF :)
> >
> > QEMU will never have any capabilities. Any resources that required
> > privileges have to be opened by a separate privileged helper, and the
> > open FD then passed across to the QEMU process. This relies on the
> > capabilities checks only being performed at time of initial opening,
> > and *not* on operations performed on the already open FD.
>
> That won't work for regular map updates either, unfortunately: you still
> have to perform a bpf() syscall to update an element, and that is a
> privileged operation.
>
> You may be able to get around this by using an array map type and
> mmap()'ing the map contents, but I'm not sure how well that will work
> across process boundaries.
>
> If it doesn't, I only see two possibilities: populate the map
> ahead-of-time and leave it in place, or keep the privileged helper
> process around to perform map updates on behalf of QEMU...
>
> -Toke
>
>

--00000000000038dae805c55a65dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>Thank you for your comments.</div><div>=
I&#39;ll play with array type mmap. And later will provide some solution.<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jun 22, 2021 at 12:09 PM Toke H=C3=B8iland-J=C3=B8rgensen &=
lt;<a href=3D"mailto:toke@redhat.com">toke@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Daniel P. Berrang=C3=
=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:<br>
&gt;&gt; Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_b=
lank">jasowang@redhat.com</a>&gt; writes:<br>
&gt;&gt; <br>
&gt;&gt; &gt; =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri Benditovich=
 =E5=86=99=E9=81=93:<br>
&gt;&gt; &gt;&gt; On Mon, Jun 21, 2021 at 12:20 PM Jason Wang &lt;<a href=
=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Me=
lnichenko =E5=86=99=E9=81=93:<br>
&gt;&gt; &gt;&gt;&gt;&gt; Hi Jason,<br>
&gt;&gt; &gt;&gt;&gt;&gt; I&#39;ve checked &quot;kernel.unprivileged_bpf_di=
sabled=3D0&quot; on Fedora,=C2=A0 Ubuntu,<br>
&gt;&gt; &gt;&gt;&gt;&gt; and Debian - no need permissions to update BPF ma=
ps.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; How about RHEL :) ?<br>
&gt;&gt; &gt;&gt; If I&#39;m not mistaken, the RHEL releases do not use mod=
ern kernels yet<br>
&gt;&gt; &gt;&gt; (for BPF we need 5.8+).<br>
&gt;&gt; &gt;&gt; So this will be (probably) relevant for RHEL 9. Please co=
rrect me if I&#39;m wrong.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adding Toke for more ideas on this.<br>
&gt;&gt; <br>
&gt;&gt; Ignore the kernel version number; we backport all of BPF to RHEL,<=
br>
&gt;&gt; basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.<br=
>
&gt;&gt; <br>
&gt;&gt; However, we completely disable unprivileged BPF on RHEL kernels. A=
lso,<br>
&gt;&gt; there&#39;s upstream commit:<br>
&gt;&gt; 08389d888287 (&quot;bpf: Add kconfig knob for disabling unpriv bpf=
 by default&quot;)<br>
&gt;&gt; <br>
&gt;&gt; which adds a new value of &#39;2&#39; to the unprivileged_bpf_disa=
ble sysctl. I<br>
&gt;&gt; believe this may end up being the default on Fedora as well.<br>
&gt;&gt; <br>
&gt;&gt; So any design relying on unprivileged BPF is likely to break; I&#3=
9;d<br>
&gt;&gt; suggest you look into how you can get this to work with CAP_BPF :)=
<br>
&gt;<br>
&gt; QEMU will never have any capabilities. Any resources that required<br>
&gt; privileges have to be opened by a separate privileged helper, and the<=
br>
&gt; open FD then passed across to the QEMU process. This relies on the<br>
&gt; capabilities checks only being performed at time of initial opening,<b=
r>
&gt; and *not* on operations performed on the already open FD.<br>
<br>
That won&#39;t work for regular map updates either, unfortunately: you stil=
l<br>
have to perform a bpf() syscall to update an element, and that is a<br>
privileged operation.<br>
<br>
You may be able to get around this by using an array map type and<br>
mmap()&#39;ing the map contents, but I&#39;m not sure how well that will wo=
rk<br>
across process boundaries.<br>
<br>
If it doesn&#39;t, I only see two possibilities: populate the map<br>
ahead-of-time and leave it in place, or keep the privileged helper<br>
process around to perform map updates on behalf of QEMU...<br>
<br>
-Toke<br>
<br>
</blockquote></div>

--00000000000038dae805c55a65dc--

