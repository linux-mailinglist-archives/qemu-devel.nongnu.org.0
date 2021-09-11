Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A54076A4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 15:07:32 +0200 (CEST)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP2jC-0003EU-QA
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 09:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mP2hI-0001J8-Rv
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 09:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mP2hF-0005CM-3t
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 09:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631365527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3lvjzsBZgW6vXvh46Qw+LbLBMHRfEr/ZsNDoZNXKJo=;
 b=hyM4kRQtHiI7R2cJWobmE0zLuF38FZixhDb1Lu2ssjW24F1in6MWfU3wFzvC5gVxNXzwmk
 gI7HCmYVsSvpDKG1XQ0pHyMliKsA6frSdUKzc6uFv95h1cu7zUukRIWFjRerIcv7R5qCf1
 I4aerIea+RAuXO8+k7kyksdQ+yTa7HE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-gmGFnAuQPUiJ_4ynkycuEw-1; Sat, 11 Sep 2021 09:05:25 -0400
X-MC-Unique: gmGFnAuQPUiJ_4ynkycuEw-1
Received: by mail-pg1-f200.google.com with SMTP id
 h10-20020a65404a000000b00253122e62a0so3757999pgp.0
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 06:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3lvjzsBZgW6vXvh46Qw+LbLBMHRfEr/ZsNDoZNXKJo=;
 b=qyPP37OMsiFSyoDNPt0nSsNmaPC44M1+mgJjpZCwu9tTsi6cjEoSmKrNSFge6E4s82
 N1/Ijta+bqKt43y4xzVgyr4OWkfWO2EjX/D2Rk0HbXz2H98H85U9Uuv8Xw6dYTCwhQc2
 3B40NXYTDJ0O6liGxmFeixVFISerQVeu3yjWEnmJejLnFXtwDMKcMlcpb4jGoHpO2e3C
 dqcgR84qA3+Yku8YIqYoHBSgXi5+76ce9huHhVFUe0h5hhdYD+niCrQnGfDL6IsYRchC
 V8vBEL0yG9NNAtAq3hcxzlJh1HYgePtzowjPiCZ74PskB2s6n8kfJcbdsFGCYGR1XSjC
 8XCw==
X-Gm-Message-State: AOAM530IdI0n6uCEIMTGILb1wKt0R81IxXSlibvRjrPrtH2PVEuXot9U
 CLRk4a7d1gFuxERg0sVd8yNro+FiZwvem624sjVAeOQhMaKlGnrPluHAO5wnSZ+pye0+U3aouhW
 DFXPIdGaTyonuAihpWBtJrB5Ga9qZCDQ=
X-Received: by 2002:a62:8415:0:b0:407:8998:7c84 with SMTP id
 k21-20020a628415000000b0040789987c84mr2488248pfd.71.1631365524344; 
 Sat, 11 Sep 2021 06:05:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKX3Ky8ebfRWZ2cSYwvd3N4lLDi6HBvF0FRKAps0CsxOOl5ww4yh0rweuZUm8hoXzpA/PPNoCWHj/YGsvpXBU=
X-Received: by 2002:a62:8415:0:b0:407:8998:7c84 with SMTP id
 k21-20020a628415000000b0040789987c84mr2488227pfd.71.1631365523942; Sat, 11
 Sep 2021 06:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <CAFEAcA_qgYHaheTsLDsHSicRJQ3Pv8Y_7mS8jhLy7NgPpPNyQw@mail.gmail.com>
In-Reply-To: <CAFEAcA_qgYHaheTsLDsHSicRJQ3Pv8Y_7mS8jhLy7NgPpPNyQw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 11 Sep 2021 15:05:11 +0200
Message-ID: <CABgObfb572Ghxc6sQpaERGpkivAL=7vi0RGP652HCVT44iui=g@mail.gmail.com>
Subject: Re: [PULL v4 00/43] (Mostly) x86 changes for 2021-09-06
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008dc7cb05cbb7e244"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008dc7cb05cbb7e244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes this is not anymore the tag I had posted... I was working on the review
comments.

Paolo

Il sab 11 set 2021, 15:00 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Wed, 8 Sept 2021 at 11:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit
> f9128631fbeb40a55f7bc145397981c963d40909:
> >
> >   Merge remote-tracking branch
> 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-09-0=
7
> 13:24:43 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to 3b942628231462c56c883a6273cf137d2a382f8f=
:
> >
> >   ebpf: only include in system emulators (2021-09-08 08:07:04 +0200)
> >
> > ----------------------------------------------------------------
> > * SGX support (Sean, Yang)
> > * vGIF and vVMLOAD/VMSAVE support (Lara)
> > * Fix LA57 support in TCG (Daniel)
> > * Avoid pointless warnings for static user-only compilation (Thomas)
> > * Fix --disable-system compilation if libbpf is found
> > * target-i386.rst restructuring
> >
> > ----------------------------------------------------------------
>
> I gave this a retry and it now fails to compile (all hosts):
>
> ../../hw/i386/sgx-stub.c: In function =E2=80=98pc_machine_init_sgx_epc=E2=
=80=99:
> ../../hw/i386/sgx-stub.c:7:12: error: =E2=80=98sgx_epc=E2=80=99 undeclare=
d (first use
> in this function)
>     7 |     memset(sgx_epc, 0, sizeof(SGXEPCState));
>       |            ^~~~~~~
> ../../hw/i386/sgx-stub.c:7:12: note: each undeclared identifier is
> reported only once for each function it appears in
>
>
> -- PMM
>
>

--0000000000008dc7cb05cbb7e244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes this is not anymore the tag I had posted... I was wor=
king on the review comments.<div dir=3D"auto"><br></div><div dir=3D"auto">P=
aolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Il sab 11 set 2021, 15:00 Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Wed, 8 Sept 2021 at 11:07, Paolo Bonzin=
i &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noref=
errer">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit f9128631fbeb40a55f7bc145397981c963d=
40909:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/stefanha-gitlab/=
tags/block-pull-request&#39; into staging (2021-09-07 13:24:43 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/bonzini/qemu.git" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://gitlab.com/bonzini/qemu.git</=
a> tags/for-upstream<br>
&gt;<br>
&gt; for you to fetch changes up to 3b942628231462c56c883a6273cf137d2a382f8=
f:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0ebpf: only include in system emulators (2021-09-08 08:07:0=
4 +0200)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; * SGX support (Sean, Yang)<br>
&gt; * vGIF and vVMLOAD/VMSAVE support (Lara)<br>
&gt; * Fix LA57 support in TCG (Daniel)<br>
&gt; * Avoid pointless warnings for static user-only compilation (Thomas)<b=
r>
&gt; * Fix --disable-system compilation if libbpf is found<br>
&gt; * target-i386.rst restructuring<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
<br>
I gave this a retry and it now fails to compile (all hosts):<br>
<br>
../../hw/i386/sgx-stub.c: In function =E2=80=98pc_machine_init_sgx_epc=E2=
=80=99:<br>
../../hw/i386/sgx-stub.c:7:12: error: =E2=80=98sgx_epc=E2=80=99 undeclared =
(first use<br>
in this function)<br>
=C2=A0 =C2=A0 7 |=C2=A0 =C2=A0 =C2=A0memset(sgx_epc, 0, sizeof(SGXEPCState)=
);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
../../hw/i386/sgx-stub.c:7:12: note: each undeclared identifier is<br>
reported only once for each function it appears in<br>
<br>
<br>
-- PMM<br>
<br>
</blockquote></div>

--0000000000008dc7cb05cbb7e244--


