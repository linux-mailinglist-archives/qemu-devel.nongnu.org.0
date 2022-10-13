Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30955FD896
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:42:55 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiwc0-00060E-QE
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oiwW2-0003yw-QO
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 07:36:42 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oiwW0-00033s-TP
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 07:36:42 -0400
Received: by mail-qk1-x741.google.com with SMTP id j21so859188qkk.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FfB92XLO1eDeU1fbo/jeYP1FGMsA0M+4vYPO/tAGlDs=;
 b=jlcSIsVmfFW8n8M+DZ0KV20jtDLaMOuTdJIoWZVDxVVSap5Ta8CWPoOGVZKrbsGo0C
 NoXZn279KdvFviwwkEr3ooBisRYq/IpFLrSiJ05RVLwJ12UalFsL2OE5vuczPjXY5NrI
 +fzbwpbk8Ctaq6Qm26r1361dn4LRqAj/M83meXPUEqyQaZFrPic8ruPqhSVIO+yAjs3G
 N8sPwZizTLqE1XecsznSAtalKDTh89wyEao/i+sMYQ+zuLl0qoo4v1KLK4FSpss1/62+
 LTjd1PfAXBomVik3p1YDm0yPOdeLBSZLjkJ5Gw4ppLIHJZE0dek7easQZAdz3wxIohx4
 ubpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfB92XLO1eDeU1fbo/jeYP1FGMsA0M+4vYPO/tAGlDs=;
 b=R4t/zuvi+hRgMDrCYZDVeihe0fWAl/Pogl0Ksl3Ba7duITwU0lu9jc9doWIcWmQ5r6
 1RqLcp2KmqflMRuk/TThHRFTffIk7vb9gGOvFns3JkzzulhaK5Ve5Y+VclbDmlolVWz2
 yem/TzG3YpJO0u8sAL8fHGIWRTcasQf8GcYT23v71ZK+ucG5wqeFI4ZXCPbYcPbW6wOz
 BWZE9xg3T3hYWTtP2XLsMqKOeDykiroDfQ91ukfIM9qxxiz/NZ5INDgRie5CboASJ9kj
 gqPMWLtnlK/YdxgZVAPU7497YWAJYbzGdfAZB7o006roGbjawdTw26gwyzVx0lSgy1Np
 8eFw==
X-Gm-Message-State: ACrzQf1bOdzXz597nYxBksO4sd8Besri+Al8A9pZMkeO2GpkPh3TPhm1
 IwGlhP38uhTmC6SR/gp8EjTt5Okv0mEDil8VOw==
X-Google-Smtp-Source: AMsMyM5j+/AmBlp6nVFvHrg5JnYqNaa8yhgD5M4MNZA20og8BXk3aI9gqoDWar6roLWnWWJ+H4s5QxKB7s+rsl8Vbp0=
X-Received: by 2002:a37:658b:0:b0:6ee:7998:d694 with SMTP id
 z133-20020a37658b000000b006ee7998d694mr9842396qkb.777.1665660999445; Thu, 13
 Oct 2022 04:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
 <20221013095749.0000052d@huawei.com>
In-Reply-To: <20221013095749.0000052d@huawei.com>
From: Gregory Price <gourry.memverge@gmail.com>
Date: Thu, 13 Oct 2022 07:36:28 -0400
Message-ID: <CAD3UvdRYH2NVck-kLYLQcBym-5TY0WXWj7vCzcRi5yEuVfgzcQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org, 
 Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, a.manzanares@samsung.com, 
 Ben Widawsky <bwidawsk@kernel.org>, Gregory Price <gregory.price@memverge.com>,
 mst@redhat.com, 
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Content-Type: multipart/alternative; boundary="000000000000302f1b05eae8ecc1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x741.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000302f1b05eae8ecc1
Content-Type: text/plain; charset="UTF-8"

Reading through your notes, everything seems reasonable, though I'm not
sure I agree with the two pass notion, though I'll wait to see the patch
set.

The enum is a good idea, *forehead slap*, I should have done it.  If we
have a local enum, why not just make it global (within the file) and
allocate the table as I have once we know how many MRs are present?

6 eggs/half dozen though, I'm ultimately fine with either.

On Thu, Oct 13, 2022, 4:58 AM Jonathan Cameron <Jonathan.Cameron@huawei.com>
wrote:

> On Wed, 12 Oct 2022 14:21:15 -0400
> Gregory Price <gourry.memverge@gmail.com> wrote:
>
> > Included in this response is a recommended patch set on top of this
> > patch that resolves a number of issues, including style and a heap
> > corruption bug.
> >
> > The purpose of this patch set is to refactor the CDAT initialization
> > code to support future patch sets that will introduce multi-region
> > support in CXL Type3 devices.
> >
> > 1) Checkpatch errors in the immediately prior patch
> > 2) Flatting of code in cdat initialization
> > 3) Changes in allocation and error checking for cleanliness
> > 4) Change in the allocation/free strategy of CDAT sub-tables to simplify
> >    multi-region allocation in the future.  Also resolves a heap
> >    corruption bug
> > 5) Refactor of CDAT initialization code into a function that initializes
> >    sub-tables per memory-region.
> >
> > Gregory Price (5):
> >   hw/mem/cxl_type3: fix checkpatch errors
> >   hw/mem/cxl_type3: Pull validation checks ahead of functional code
> >   hw/mem/cxl_type3: CDAT pre-allocate and check resources prior to work
> >   hw/mem/cxl_type3: Change the CDAT allocation/free strategy
> >   hw/mem/cxl_type3: Refactor CDAT sub-table entry initialization into a
> >     function
> >
> >  hw/mem/cxl_type3.c | 240 +++++++++++++++++++++++----------------------
> >  1 file changed, 122 insertions(+), 118 deletions(-)
> >
>
> Thanks, I'm going to roll this stuff into the original patch set for v8.
> Some of this I already have (like the check patch stuff).
> Some I may disagree with in which case  I'll reply to the patches - note
> I haven't looked at them in detail yet!
>
> Jonathan
>

--000000000000302f1b05eae8ecc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reading through your notes, everything seems reasonable, =
though I&#39;m not sure I agree with the two pass notion, though I&#39;ll w=
ait to see the patch set.<div dir=3D"auto"><br></div><div dir=3D"auto">The =
enum is a good idea, *forehead slap*, I should have done it.=C2=A0 If we ha=
ve a local enum, why not just make it global (within the file) and allocate=
 the table as I have once we know how many MRs are present?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">6 eggs/half dozen though, I&#39;m ult=
imately fine with either.=C2=A0</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 13, 2022, 4:58 AM Jonathan=
 Cameron &lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com">Jonathan.Camero=
n@huawei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed,=
 12 Oct 2022 14:21:15 -0400<br>
Gregory Price &lt;<a href=3D"mailto:gourry.memverge@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">gourry.memverge@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Included in this response is a recommended patch set on top of this<br=
>
&gt; patch that resolves a number of issues, including style and a heap<br>
&gt; corruption bug.<br>
&gt; <br>
&gt; The purpose of this patch set is to refactor the CDAT initialization<b=
r>
&gt; code to support future patch sets that will introduce multi-region<br>
&gt; support in CXL Type3 devices.<br>
&gt; <br>
&gt; 1) Checkpatch errors in the immediately prior patch<br>
&gt; 2) Flatting of code in cdat initialization<br>
&gt; 3) Changes in allocation and error checking for cleanliness<br>
&gt; 4) Change in the allocation/free strategy of CDAT sub-tables to simpli=
fy<br>
&gt;=C2=A0 =C2=A0 multi-region allocation in the future.=C2=A0 Also resolve=
s a heap<br>
&gt;=C2=A0 =C2=A0 corruption bug<br>
&gt; 5) Refactor of CDAT initialization code into a function that initializ=
es<br>
&gt;=C2=A0 =C2=A0 sub-tables per memory-region.<br>
&gt; <br>
&gt; Gregory Price (5):<br>
&gt;=C2=A0 =C2=A0hw/mem/cxl_type3: fix checkpatch errors<br>
&gt;=C2=A0 =C2=A0hw/mem/cxl_type3: Pull validation checks ahead of function=
al code<br>
&gt;=C2=A0 =C2=A0hw/mem/cxl_type3: CDAT pre-allocate and check resources pr=
ior to work<br>
&gt;=C2=A0 =C2=A0hw/mem/cxl_type3: Change the CDAT allocation/free strategy=
<br>
&gt;=C2=A0 =C2=A0hw/mem/cxl_type3: Refactor CDAT sub-table entry initializa=
tion into a<br>
&gt;=C2=A0 =C2=A0 =C2=A0function<br>
&gt; <br>
&gt;=C2=A0 hw/mem/cxl_type3.c | 240 +++++++++++++++++++++++----------------=
------<br>
&gt;=C2=A0 1 file changed, 122 insertions(+), 118 deletions(-)<br>
&gt; <br>
<br>
Thanks, I&#39;m going to roll this stuff into the original patch set for v8=
.<br>
Some of this I already have (like the check patch stuff).<br>
Some I may disagree with in which case=C2=A0 I&#39;ll reply to the patches =
- note<br>
I haven&#39;t looked at them in detail yet!<br>
<br>
Jonathan<br>
</blockquote></div>

--000000000000302f1b05eae8ecc1--

