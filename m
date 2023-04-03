Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52D6D421B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 12:34:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHVJ-0002kh-2d; Mon, 03 Apr 2023 06:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pjHVG-0002kD-Do
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:33:34 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pjHVD-0006mb-VE
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:33:33 -0400
Received: by mail-il1-x12a.google.com with SMTP id h14so13737354ilj.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680518010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H+grkqH96bccPTI72gwpR4J9eqNItrMGR9NxXWmOefs=;
 b=cU3DICzMpi4C3rf3NuPe5HUchmumMzAQEhSEfQ06AcmJ9MUbSDtInqTae3NfrXzVdS
 YfMf+8R4a6kWbT2EfLHVxMtbpKykU1gNofl28nIasmsQFeq+ZjRske+UhIwe4jOiBym+
 1r6V18URHJ1cJH1pMDdZXZWA+5BOdlDBFuv4d+xsWJSoUglj0QiLv7t+gTC8NYB+RisE
 Jis6FiFNYx8oJ/QalimNQVoudwi66mC+Szj1FRYKhLJChl5NWZ0668dBxk+x8lYa30OZ
 l68M9k3+jIKV7HltCIscORqkTwrdoKB2PXm3dPQhPT5pRO5UliwggRItLfYmiPQKc6Y1
 Mc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680518010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+grkqH96bccPTI72gwpR4J9eqNItrMGR9NxXWmOefs=;
 b=kH70X2jT/tDEFbuL7PRvN1HSVe3W5mCF+IJhA08VrVgr9yp+vE8O5RXJyhZp/py5VN
 YCIaaKo13Ugw5W6iJGfzsxD4RN8J0OyEIZrPojHErF5zqVsbMWvs8FO6qBSItceQ9n4z
 4UGn20qHTO03+gCZe9nXv4r8w9fYhhKI4rdqQXTas5zkWjzzbedJPagXLPwvpbY3VzYG
 77Uy5yfVmeY2saD6SMH5CtjmF3Mya866jTqPOlMM8cxJm4sRqjKZBYQTgv+ur/qPToIQ
 J+O9/n2lfFiWN+5ypOMH+4hy//EUImhK4zpfOW0j+4+Exj13aFF83ovdmNeLZhP/TNb0
 8XwQ==
X-Gm-Message-State: AAQBX9elIrsn/mp8KWU4TgjxnTKNiT6hNbZ5aM2/GLDeEjs0ikr5uVc6
 cvfyCFdQIPTvTPx63WVxeLLdTj7gI1kN+0/AvB0Viw9o
X-Google-Smtp-Source: AKy350Zw4JRjqrhB3GMPAGXgHQhVaSfNvVGX6oXSDyDFp3tlexpRqF6K4hLwg/yUNzsw0kqxStm5ZexlGsavFjGkEtc=
X-Received: by 2002:a05:6e02:1486:b0:313:c399:73c8 with SMTP id
 n6-20020a056e02148600b00313c39973c8mr18692651ilk.4.1680518010751; Mon, 03 Apr
 2023 03:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
 <20230403104226.00001637@Huawei.com>
In-Reply-To: <20230403104226.00001637@Huawei.com>
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Mon, 3 Apr 2023 16:03:20 +0530
Message-ID: <CALfBBTtvuOMEq5SVTcqfSf8vL06NT532nxCWkRrTHVBhg7Lkew@mail.gmail.com>
Subject: Re: property 'cxl-type3.size' not found
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000011dbb505f86c17ba"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=maverickk1778@gmail.com; helo=mail-il1-x12a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000011dbb505f86c17ba
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan

Do you want me to modify the doc(remove size)? I can do that.

Regards
Raghu

On Mon, 3 Apr 2023, 15:12 Jonathan Cameron, <Jonathan.Cameron@huawei.com>
wrote:

> On Mon, 3 Apr 2023 14:34:33 +0530
> Maverickk 78 <maverickk1778@gmail.com> wrote:
>
> > Hello,
> >
> > I am trying qemu-system-aarch64 & cxl configuration listed in
> >
> > https://www.qemu.org/docs/master/system/devices/cxl.html
> >
> > qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8
> > -cpu max \
> > ...
> > -object
> >
> memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M
> > \
> > -object
> >
> memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M
> > \
> > -object
> >
> memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M
> > \
> > -object
> >
> memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M
> > \
> > -object
> >
> memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa0.raw,size=256M \
> > -object
> >
> memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa1.raw,size=256M \
> > -object
> >
> memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
> > -object
> >
> memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
> > -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> > -device cxl-rp,port=0,bus=cxl.1,id=root_port0,chassis=0,slot=0 \
> > -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
> > -device cxl-upstream,bus=root_port0,id=us0 \
> > -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
> > -device
> >
> cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
> > -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
> > -device
> >
> cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
> > -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
> > -device
> >
> cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
> > -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
> > -device
> >
> cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
> > -M
> >
> cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
> >
> >
> >
> > I hit this following error
> > qemu-system-aarch64: -device
> >
> cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M:
> > property 'cxl-type3.size' not found
> >
> >
> > Any clue if I am missing something?
>
> Looks like docs have slipped behind current state. Size isn't needed for
> the memdev
> any more as can be established from the memory backend and there isn't a
> reason
> why they'd ever be different (there was in a much earlier version).
>
> There is a known bigger issue with those docs which is that they got
> cherry picked
> from a series that included ARM support but arm support hasn't landed yet
> (and will be a while due to need for DT support).
>
> I'll look at fixing both issues up. Or if you want to send a patch Raghu
> that would
> be even better!
>
> Jonathan
>
> >
> >
> > Regards
> >
>
>

--00000000000011dbb505f86c17ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Jonathan<div dir=3D"auto"><br></div><div dir=3D"auto">=
Do you want me to modify the doc(remove size)? I can do that.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Raghu<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, 3 Apr 2023, 15:12 Jonathan Cameron, &lt;<a href=3D"mailto:Jona=
than.Cameron@huawei.com">Jonathan.Cameron@huawei.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Mon, 3 Apr 2023 14:34:33 +0530<br>
Maverickk 78 &lt;<a href=3D"mailto:maverickk1778@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">maverickk1778@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hello,<br>
&gt; <br>
&gt; I am trying qemu-system-aarch64 &amp; cxl configuration listed in<br>
&gt; <br>
&gt; <a href=3D"https://www.qemu.org/docs/master/system/devices/cxl.html" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://www.qemu.org/docs/ma=
ster/system/devices/cxl.html</a><br>
&gt; <br>
&gt; qemu-system-aarch64 -M virt,gic-version=3D3,cxl=3Don -m 4g,maxmem=3D8G=
,slots=3D8<br>
&gt; -cpu max \<br>
&gt; ...<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-mem0,share=3Don,mem-path=3D/tmp/cxltest.r=
aw,size=3D256M<br>
&gt; \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/cxltest1.=
raw,size=3D256M<br>
&gt; \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-mem2,share=3Don,mem-path=3D/tmp/cxltest2.=
raw,size=3D256M<br>
&gt; \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-mem3,share=3Don,mem-path=3D/tmp/cxltest3.=
raw,size=3D256M<br>
&gt; \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-lsa0,share=3Don,mem-path=3D/tmp/lsa0.raw,=
size=3D256M \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp/lsa1.raw,=
size=3D256M \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-lsa2,share=3Don,mem-path=3D/tmp/lsa2.raw,=
size=3D256M \<br>
&gt; -object<br>
&gt; memory-backend-file,id=3Dcxl-lsa3,share=3Don,mem-path=3D/tmp/lsa3.raw,=
size=3D256M \<br>
&gt; -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \<br>
&gt; -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port0,chassis=3D0,slot=
=3D0 \<br>
&gt; -device cxl-rp,port=3D1,bus=3Dcxl.1,id=3Droot_port1,chassis=3D0,slot=
=3D1 \<br>
&gt; -device cxl-upstream,bus=3Droot_port0,id=3Dus0 \<br>
&gt; -device cxl-downstream,port=3D0,bus=3Dus0,id=3Dswport0,chassis=3D0,slo=
t=3D4 \<br>
&gt; -device<br>
&gt; cxl-type3,bus=3Dswport0,memdev=3Dcxl-mem0,lsa=3Dcxl-lsa0,id=3Dcxl-pmem=
0,size=3D256M \<br>
&gt; -device cxl-downstream,port=3D1,bus=3Dus0,id=3Dswport1,chassis=3D0,slo=
t=3D5 \<br>
&gt; -device<br>
&gt; cxl-type3,bus=3Dswport1,memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1,id=3Dcxl-pmem=
1,size=3D256M \<br>
&gt; -device cxl-downstream,port=3D2,bus=3Dus0,id=3Dswport2,chassis=3D0,slo=
t=3D6 \<br>
&gt; -device<br>
&gt; cxl-type3,bus=3Dswport2,memdev=3Dcxl-mem2,lsa=3Dcxl-lsa2,id=3Dcxl-pmem=
2,size=3D256M \<br>
&gt; -device cxl-downstream,port=3D3,bus=3Dus0,id=3Dswport3,chassis=3D0,slo=
t=3D7 \<br>
&gt; -device<br>
&gt; cxl-type3,bus=3Dswport3,memdev=3Dcxl-mem3,lsa=3Dcxl-lsa3,id=3Dcxl-pmem=
3,size=3D256M \<br>
&gt; -M<br>
&gt; cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.size=3D4G,cxl-fmw.0.interleave-g=
ranularity=3D4k<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; I hit this following error<br>
&gt; qemu-system-aarch64: -device<br>
&gt; cxl-type3,bus=3Dswport0,memdev=3Dcxl-mem0,lsa=3Dcxl-lsa0,id=3Dcxl-pmem=
0,size=3D256M:<br>
&gt; property &#39;cxl-type3.size&#39; not found<br>
&gt; <br>
&gt; <br>
&gt; Any clue if I am missing something?<br>
<br>
Looks like docs have slipped behind current state. Size isn&#39;t needed fo=
r the memdev<br>
any more as can be established from the memory backend and there isn&#39;t =
a reason<br>
why they&#39;d ever be different (there was in a much earlier version).<br>
<br>
There is a known bigger issue with those docs which is that they got cherry=
 picked<br>
from a series that included ARM support but arm support hasn&#39;t landed y=
et<br>
(and will be a while due to need for DT support).<br>
<br>
I&#39;ll look at fixing both issues up. Or if you want to send a patch Ragh=
u that would<br>
be even better!<br>
<br>
Jonathan<br>
<br>
&gt; <br>
&gt; <br>
&gt; Regards<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000011dbb505f86c17ba--

