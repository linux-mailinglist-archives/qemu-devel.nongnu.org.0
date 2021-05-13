Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67DB37FC61
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:19:03 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEzG-0003kX-In
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lhESw-0000o7-TB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:45:42 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lhESo-0004BO-LY
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:45:38 -0400
Received: by mail-qk1-x730.google.com with SMTP id a2so26095111qkh.11
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=2U2goYfSiw7mvqSXklXzuOIN/Rh0xrTk4vQpfOwBrU4=;
 b=L7VFCCqxJEJEE3yS1pm0XRahknS3JuC5PslJbYfggkaTWeJyGIiKCEYNZaYpWPixis
 FjMYircROkYtsm8/IQLwvcVGfuWU/hoT12vQydg2F0D42nuw/2s13KxVcvGGvPbGpziF
 OV8xDsIcakncA5+3hfHl5L7NWANLTVIHSeYUZXQwXxneeI7M46mdNam2CHY804lUyL+l
 G8YaZpuMDckM29d5K1ThXfnNL1OsQ29V+XVBo9BgRRH7ZGUqtZI+yR23m2nafKI19Jmq
 NmWJgPHLiZW6jwEMhVdQ8UADCS8bfq35t/hw3u/qCKbmE9/J6fBO3LagWtXlhQ1cRKTG
 oGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=2U2goYfSiw7mvqSXklXzuOIN/Rh0xrTk4vQpfOwBrU4=;
 b=gNxunJTrtJSNXPKAEuBPV4K9cNC4JkS9Q1B3m6dQcn8K+rEIVPlpyz02yAvUK0heNR
 kbJuxPTwJWgq5VEXWJFwGO4WlpZTZ12fCBmb9VSMrugQT8LUPtYXT/ps11AP8kk/Sp6h
 NltXhMcFtkArGiUfYkSQ/UnUsL0yeSoQLfqn+DnJV80ajTWaBenej5YYAMLPG6Oxb65t
 nNHe9iHwUTKTlXeIr6jX1m/XokNmEDVXK8YGQ24yAkBvnOd+mpbOHFJjG3yOp5K3Y+un
 DuuAmGIA8oxmrQn3V3HgR/ZJNJH0HfdVCIl3PQnNhFNCYNGGdMdj1Wx7zLVBLSBagopn
 nATw==
X-Gm-Message-State: AOAM533hYTS80L9DBIRKuzEGlCBJOVruDtoKDhcX4BsBRc6AaSwmEr7H
 +Qrs0YKbtqfrXJoDFP4BiVRM0iB4N7zn9+ke
X-Google-Smtp-Source: ABdhPJyb9XVv7COf4RSZy7rbObfQdK492pY8BTez2XDeu6OxA2JbFx6S9nwO0BHLBHAneZdOdINPwA==
X-Received: by 2002:a05:620a:c8f:: with SMTP id
 q15mr19148714qki.400.1620924329710; 
 Thu, 13 May 2021 09:45:29 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id t187sm2800443qkc.56.2021.05.13.09.45.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 May 2021 09:45:29 -0700 (PDT)
Date: Thu, 13 May 2021 12:45:23 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Message-ID: <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
In-Reply-To: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
Subject: Re: GICv3 for MTTCG
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="609d57a3_38479b96_14ca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: "=?utf-8?Q?peter.maydell=40linaro.org?=" <peter.maydell@linaro.org>,
 "=?utf-8?Q?drjones=40redhat.com?=" <drjones@redhat.com>,
 "=?utf-8?Q?Cota=40braap.org?=" <Cota@braap.org>,
 "=?utf-8?Q?richard.henderson=40linaro.org?=" <richard.henderson@linaro.org>,
 "=?utf-8?Q?qemu-devel=40nongnu.org?=" <qemu-devel@nongnu.org>,
 "=?utf-8?Q?qemu-arm=40nongnu.org?=" <qemu-arm@nongnu.org>,
 "=?utf-8?Q?Chengen_\(William=2C_FixNet\)?=" <chengen@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--609d57a3_38479b96_14ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Andrey,

To clarify, the patch series
> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> =22GICv3 LPI and ITS feature implementation=22
>

is applicable for virt machine 6.1 onwards,i.e ITS TCG functionality is n=
ot available for version 6.0 that is being tried
here.

Thanks
Shashi

On May 13 2021, at 12:35 pm, Andrey Shinkevich <andrey.shinkevich=40huawe=
i.com> wrote:
> Dear colleagues,
>
> Thank you all very much for your responses. Let me reply with one messa=
ge.
> I configured QEMU for AARCH64 guest:
> =24 ./configure --target-list=3Daarch64-softmmu
>
> When I start QEMU with GICv3 on an x86 host:
> qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3
>
> QEMU reports this error from hw/pci/msix.c:
> error=5Fsetg(errp, =22MSI-X is not supported by interrupt controller=22=
);
>
> Probably, the variable 'msi=5Fnonbroken' would be initialized in
> hw/intc/arm=5Fgicv3=5Fits=5Fcommon.c:
> gicv3=5Fits=5Finit=5Fmmio(..)
>
> I guess that it works with KVM acceleration only rather than with TCG.
> The error persists after applying the series:
> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> =22GICv3 LPI and ITS feature implementation=22
> (special thanks for referring me to that)
>
> Please, make me clear and advise ideas how that error can be fixed=3F
> Should the MSI-X support be implemented with GICv3 extra=3F
>
> When successful, I would like to test QEMU for a maximum number of core=
s
> to get the best MTTCG performance.
> Probably, we will get just some percentage of performance enhancement
> with the BQL series applied, won't we=3F I will test it as well.
>
> Best regards,
> Andrey Shinkevich
>
>
> On 5/12/21 6:43 PM, Alex Benn=C3=A9e wrote:
> >
> > Andrey Shinkevich <andrey.shinkevich=40huawei.com> writes:
> >
> >> Dear colleagues,
> >>
> >> I am looking for ways to accelerate the MTTCG for ARM guest on x86-6=
4 host.
> >> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8=
:
> >>
> >> include/hw/intc/arm=5Fgic=5Fcommon.h:=23define GIC=5FNCPU 8
> >>
> >> The version 3 of the Generic Interrupt Controller (GICv3) is not
> >> supported in QEMU for some reason unknown to me. It would allow to
> >> increase the limit of CPUs and accelerate the MTTCG performance on a=

> >> multiple core hypervisor.
> >
> > It is supported, you just need to select it.
> >
> >> I have got an idea to implement the Interrupt Translation Service (I=
TS)
> >> for using by MTTCG for ARM architecture.
> >
> > There is some work to support ITS under TCG already posted:
> >
> > Subject: =5BPATCH v3 0/8=5D GICv3 LPI and ITS feature implementation
> > Date: Thu, 29 Apr 2021 19:41:53 -0400
> > Message-Id: <20210429234201.125565-1-shashi.mallela=40linaro.org>
> >
> > please do review and test.
> >
> >> Do you find that idea useful and feasible=3F
> >> If yes, how much time do you estimate for such a project to complete=
 by
> >> one developer=3F
> >> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU=
=3F
> >
> > As far as MTTCG performance is concerned there is a degree of
> > diminishing returns to be expected as the synchronisation cost betwee=
n
> > threads will eventually outweigh the gains of additional threads.
> >
> > There are a number of parts that could improve this performance. The
> > first would be picking up the BQL reduction series from your =46uture=
Wei
> > colleges who worked on the problem when they were Linaro assignees:
> >
> > Subject: =5BPATCH v2 0/7=5D accel/tcg: remove implied BQL from cpu=5F=
handle=5Finterrupt/exception path
> > Date: Wed, 19 Aug 2020 14:28:49 -0400
> > Message-Id: <20200819182856.4893-1-robert.foley=40linaro.org>
> >
> > There was also a longer series moving towards per-CPU locks:
> >
> > Subject: =5BPATCH v10 00/73=5D per-CPU locks
> > Date: Wed, 17 Jun 2020 17:01:18 -0400
> > Message-Id: <20200617210231.4393-1-robert.foley=40linaro.org>
> >
> > I believe the initial measurements showed that the BQL cost started t=
o
> > edge up with GIC interactions. We did discuss approaches for this and=
 I
> > think one idea was use non-BQL locking for the GIC. You would need to=

> > revert:
> >
> > Subject: =5BPATCH-for-5.2=5D exec: Remove MemoryRegion::global=5Flock=
ing field
> > Date: Thu, 6 Aug 2020 17:07:26 +0200
> > Message-Id: <20200806150726.962-1-philmd=40redhat.com>
> >
> > and then implement a more fine tuned locking in the GIC emulation
> > itself. However I think the BQL and per-CPU locks are lower hanging
> > fruit to tackle first.
> >
> >>
> >> Best regards,
> >> Andrey Shinkevich
> >
> >
>


--609d57a3_38479b96_14ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi Andrey,</div><br><div>To clarify, the patch series</div><blockquo=
te><div><div>https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944=
.html</div><div>=22GICv3 LPI and ITS feature implementation=22</div></div=
></blockquote><div>is applicable for virt machine 6.1 onwards,i.e ITS TCG=
 functionality is not available for version 6.0 that is being tried</div>=
<div>here.</div><br><div>Thanks</div><div>Shashi</div><br><div class=3D=22=
gmail=5Fquote=5Fattribution=22>On May 13 2021, at 12:35 pm, Andrey Shinke=
vich &lt;andrey.shinkevich=40huawei.com&gt; wrote:</div><blockquote><div>=
<div>Dear colleagues,</div><br><div>Thank you all very much for your resp=
onses. Let me reply with one message.</div><br><div>I configured QEMU for=
 AARCH64 guest:</div><div>=24 ./configure --target-list=3Daarch64-softmmu=
</div><br><div>When I start QEMU with GICv3 on an x86 host:</div><div>qem=
u-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3</div><br><=
div>QEMU reports this error from hw/pci/msix.c:</div><div>error=5Fsetg(er=
rp, =22MSI-X is not supported by interrupt controller=22);</div><br><div>=
Probably, the variable 'msi=5Fnonbroken' would be initialized in</div><di=
v>hw/intc/arm=5Fgicv3=5Fits=5Fcommon.c:</div><div>gicv3=5Fits=5Finit=5Fmm=
io(..)</div><br><div>I guess that it works with KVM acceleration only rat=
her than with TCG.</div><br><div>The error persists after applying the se=
ries:</div><div>https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00=
944.html</div><div>=22GICv3 LPI and ITS feature implementation=22</div><d=
iv>(special thanks for referring me to that)</div><br><div>Please, make m=
e clear and advise ideas how that error can be fixed=3F</div><div>Should =
the MSI-X support be implemented with GICv3 extra=3F</div><br><div>When s=
uccessful, I would like to test QEMU for a maximum number of cores</div><=
div>to get the best MTTCG performance.</div><div>Probably, we will get ju=
st some percentage of performance enhancement</div><div>with the BQL seri=
es applied, won't we=3F I will test it as well.</div><br><div>Best regard=
s,</div><div>Andrey Shinkevich</div><br><br><div>On 5/12/21 6:43 PM, Alex=
 Benn=C3=A9e wrote:</div><div>&gt;</div><div>&gt; Andrey Shinkevich &lt;a=
ndrey.shinkevich=40huawei.com&gt; writes:</div><div>&gt;</div><div>&gt;&g=
t; Dear colleagues,</div><div>&gt;&gt;</div><div>&gt;&gt; I am looking fo=
r ways to accelerate the MTTCG for ARM guest on x86-64 host.</div><div>&g=
t;&gt; The maximum number of CPUs for MTTCG that uses GICv2 is limited by=
 8:</div><div>&gt;&gt;</div><div>&gt;&gt; include/hw/intc/arm=5Fgic=5Fcom=
mon.h:=23define GIC=5FNCPU 8</div><div>&gt;&gt;</div><div>&gt;&gt; The ve=
rsion 3 of the Generic Interrupt Controller (GICv3) is not</div><div>&gt;=
&gt; supported in QEMU for some reason unknown to me. It would allow to</=
div><div>&gt;&gt; increase the limit of CPUs and accelerate the MTTCG per=
formance on a</div><div>&gt;&gt; multiple core hypervisor.</div><div>&gt;=
</div><div>&gt; It is supported, you just need to select it.</div><div>&g=
t;</div><div>&gt;&gt; I have got an idea to implement the Interrupt Trans=
lation Service (ITS)</div><div>&gt;&gt; for using by MTTCG for ARM archit=
ecture.</div><div>&gt;</div><div>&gt; There is some work to support ITS u=
nder TCG already posted:</div><div>&gt;</div><div>&gt; Subject: =5BPATCH =
v3 0/8=5D GICv3 LPI and ITS feature implementation</div><div>&gt; Date: T=
hu, 29 Apr 2021 19:41:53 -0400</div><div>&gt; Message-Id: &lt;20210429234=
201.125565-1-shashi.mallela=40linaro.org&gt;</div><div>&gt;</div><div>&gt=
; please do review and test.</div><div>&gt;</div><div>&gt;&gt; Do you fin=
d that idea useful and feasible=3F</div><div>&gt;&gt; If yes, how much ti=
me do you estimate for such a project to complete by</div><div>&gt;&gt; o=
ne developer=3F</div><div>&gt;&gt; If no, what are reasons for not implem=
enting GICv3 for MTTCG in QEMU=3F</div><div>&gt;</div><div>&gt; As far as=
 MTTCG performance is concerned there is a degree of</div><div>&gt; dimin=
ishing returns to be expected as the synchronisation cost between</div><d=
iv>&gt; threads will eventually outweigh the gains of additional threads.=
</div><div>&gt;</div><div>&gt; There are a number of parts that could imp=
rove this performance. The</div><div>&gt; first would be picking up the B=
QL reduction series from your =46utureWei</div><div>&gt; colleges who wor=
ked on the problem when they were Linaro assignees:</div><div>&gt;</div><=
div>&gt; Subject: =5BPATCH v2 0/7=5D accel/tcg: remove implied BQL from c=
pu=5Fhandle=5Finterrupt/exception path</div><div>&gt; Date: Wed, 19 Aug 2=
020 14:28:49 -0400</div><div>&gt; Message-Id: &lt;20200819182856.4893-1-r=
obert.foley=40linaro.org&gt;</div><div>&gt;</div><div>&gt; There was also=
 a longer series moving towards per-CPU locks:</div><div>&gt;</div><div>&=
gt; Subject: =5BPATCH v10 00/73=5D per-CPU locks</div><div>&gt; Date: Wed=
, 17 Jun 2020 17:01:18 -0400</div><div>&gt; Message-Id: &lt;2020061721023=
1.4393-1-robert.foley=40linaro.org&gt;</div><div>&gt;</div><div>&gt; I be=
lieve the initial measurements showed that the BQL cost started to</div><=
div>&gt; edge up with GIC interactions. We did discuss approaches for thi=
s and I</div><div>&gt; think one idea was use non-BQL locking for the GIC=
. You would need to</div><div>&gt; revert:</div><div>&gt;</div><div>&gt; =
Subject: =5BPATCH-for-5.2=5D exec: Remove MemoryRegion::global=5Flocking =
field</div><div>&gt; Date: Thu, 6 Aug 2020 17:07:26 +0200</div><div>&gt; =
Message-Id: &lt;20200806150726.962-1-philmd=40redhat.com&gt;</div><div>&g=
t;</div><div>&gt; and then implement a more fine tuned locking in the GIC=
 emulation</div><div>&gt; itself. However I think the BQL and per-CPU loc=
ks are lower hanging</div><div>&gt; fruit to tackle first.</div><div>&gt;=
</div><div>&gt;&gt;</div><div>&gt;&gt; Best regards,</div><div>&gt;&gt; A=
ndrey Shinkevich</div><div>&gt;</div><div>&gt;</div></div></blockquote><i=
mg class=3D=22mailspring-open=22 alt=3D=22Sent from Mailspring=22 width=3D=
=220=22 height=3D=220=22 style=3D=22border:0; width:0; height:0;=22 src=3D=
=22https://link.getmailspring.com/open/41839E15-50D=46-4E=46B-A=4654-6CDB=
089859BD=40getmailspring.com=3Fme=3D2a4b90d6&amp;recipient=3DcWVtdS1kZXZl=
bEBub25nbnUub3Jn=22>
--609d57a3_38479b96_14ca--


