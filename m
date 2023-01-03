Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2765C37E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 17:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjkV-0003Po-Gr; Tue, 03 Jan 2023 11:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1pCjkT-0003P4-UB
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:02:45 -0500
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1pCjkS-00072o-2F
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:02:45 -0500
Received: by mail-yw1-x1143.google.com with SMTP id
 00721157ae682-4a263c4ddbaso104331797b3.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 08:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TDHN064xHQdS1jqkFgm2KixRG8yuImA7A0unjHmPZ0E=;
 b=T4mBMOJNRxSljtBgY4sZOYyoBKi5VWBXaPLV2Uc2PkmP/wvH8cbK5iO0/eT20KdW4e
 BHbrVCHqcY3QKk6N9IVI7uz+ftST1l5UoZK125Ed1hwoB7HctE5lXN+T7GkHU8U2dJzL
 gPjSZpIDu3DbhpKHiWjtXR9OB3fGbjn1Um0+dlTPlRA26dIKcrNujZxZQAtzQWNPs7f3
 tHYCrI3rZZO/310u1cEodoVAO7w0AZlGSAY4JdLF0/mI+T7ZsIlxZvq413AC5uH0jT7l
 Sq9nPMEwBbQf2DegAJkTYKNFPo6XNNbGCThLQxAGBzW44R0qFdFlUtlJCkyT78j2zWYJ
 pYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TDHN064xHQdS1jqkFgm2KixRG8yuImA7A0unjHmPZ0E=;
 b=q5lAxGcAExXCHauuHqlt4yqr3dKO+2xH0Ua7vNRp1NucgJVCDP3/DpvX599x7GhRI/
 hUs9LTxRGpRcLuHQZeYT9Qc78sG+M939kq0g/+54ZZ89ZLy5mMYLF7S5R7aeyHdjju8+
 sKU7kf4tc3wXVO4RrKx2AAT3udHIvJ8bebXufPYmNxSH6ej2MJotqzWAgm8SYZrRdf7U
 Tg0y9x/4OG8M1uErBk1x+2g8NUbiPkBoa/c7XwM8IruZIi6so4gOTaWLkb0XxHVCvGLP
 WC7tGud3DUikNXwtB+uzrT+lrjNhrrRwWdZ3KPeB0WJv4s/R8LUo85cATbkanDko5avd
 ANqw==
X-Gm-Message-State: AFqh2kocKukeaw9MFRgsiIbeUOd9HASp3QFdHqwmbvd/sDPnPLvGMu1y
 NL7Bn1QUy7gWXvW90J/48+BeUd2x6M75Rb/GLw==
X-Google-Smtp-Source: AMrXdXtPxyR1Vb5c0j0TWxwbBW7VQOwtfQzBsVqowrjZqFW/NylcwiPS767HZT2+i8tIjDFQ0X4Axkgk5svru7gV4t8=
X-Received: by 2002:a81:8381:0:b0:467:9c7b:c0dc with SMTP id
 t123-20020a818381000000b004679c7bc0dcmr4150463ywf.463.1672761762619; Tue, 03
 Jan 2023 08:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
 <20221219124211.000032b7@Huawei.com>
 <Y6CNcuIzUVmKL0SM@memverge.com> <20221219172502.00001338@Huawei.com>
 <Y6CloIiuruB/h7qp@memverge.com> <20221220153453.00000436@Huawei.com>
 <Y6IMoxKZOc7eUPCg@memverge.com> <20230103155629.00007466@Huawei.com>
In-Reply-To: <20230103155629.00007466@Huawei.com>
From: Gregory Price <gourry.memverge@gmail.com>
Date: Tue, 3 Jan 2023 11:02:31 -0500
Message-ID: <CAD3UvdQ7nZab7Y+tbc1Ox-zqzse4C16dwv6qtOAgfe4dA6_crQ@mail.gmail.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gregory.price@memverge.com>, qemu-devel@nongnu.org, 
 linux-cxl@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>, 
 Davidlohr Bueso <dave@stgolabs.net>, a.manzanares@samsung.com, 
 Ben Widawsky <bwidawsk@kernel.org>, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Content-Type: multipart/alternative; boundary="000000000000a7a5d505f15e32c1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1143;
 envelope-from=gourry.memverge@gmail.com; helo=mail-yw1-x1143.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000a7a5d505f15e32c1
Content-Type: text/plain; charset="UTF-8"

The fine grained control would be a precursor to an emulated pooling
device.  If you can demonstrate it with a singleton attached device, you
could just implement an exclusivity table in a shared file, and set the
shared memory to a file backend as well.  Boom, shared memory pool across
qemu instances.

On Tue, Jan 3, 2023, 10:56 AM Jonathan Cameron <Jonathan.Cameron@huawei.com>
wrote:

> On Tue, 20 Dec 2022 14:27:31 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
>
> > On Tue, Dec 20, 2022 at 03:34:53PM +0000, Jonathan Cameron wrote:
> > > > However I don't think this is successful in creating the dax devices,
> > > > and therefore the reconfiguring into ram.
> > >
> > > Sure. I only bothered testing the it in some dax modes rather than via
> kmem.
> > > It 'should' work but more testing needed there.
> > >
> > > However as you've noted, that only applies to the pmem regions at the
> moment.
> > > I wondered if you'd scripted the HDM decoder setup etc for test
> purposes
> > > (so what the driver will do). Alternative to that would be enabling
> the driver
> > > support. Not sure if anyone is looking at that yet. Final alternative
> would
> > > be to port the existing EDK2 based support to work on QEMU.  All non
> trivial
> > > jobs so may take a while,
> > >
> > > Jonathan
> >
> > Also, I'm relatively new to this corner of the kernel (mm, regions, dax,
> > etc), so i need to spend a week or two with uninterrupted tinkering with
> > how adding new memory regions from these devices is actually "supposed
> > to work" in a dynamic-capacity world.
> >
> > At least in theory, the partitioning of persistent and volatile memory
> > regions on one of these type-3 devices should end up looking a bit like
> > dynamic capacity when doing runtime reconfiguring.
> >
> > For example, considering
> >
> > Device(512mb PMEM, 512 VMEM), I'd want, at least i think
> >
> > CMFW-Volatile:    max window size(1024mb) - Numa 2
> > CMFW-Persistent:  max window size(512mb)  - Numa 3
> >
> > Then we'd need the kernel support for
> >
> > 1) Online 2x256mb volatile regions in Numa 2
> > 2) Online 2x256mb persistent regions in Numa 3
> > 3) Offline persistent region (256mb:512mb)
> > 4) Reconfigure device to 256Pmem/768Volatile
> >    a) change decoders in device accordingly
> > 5) Online 1x256mb volatile region in Numa 2
> >
> > The question is whether you can do this without offlining the other
> > adjacent regions.  I just don't know enough about the region subsystem
> > to say what is "correct" behavior here.
>
> Whilst you probably 'can' do fine grained offline / online (to some
> degree anyway) I'm not sure if people consider it an important
> usecase. If decoder reprogramming is involved things will get very fiddly
> so at least in first instance I'd advocate just ripping it all down and
> building up again.  Or in the simple case, just block attempts to
> reconfigure
> at the partitioning if either side is in use.
>
> >
> > On the device side, I need to go look at the mailbox commands to go
> > about implementing the reconfiguration / decoder reprogramming.
> >
> > I guess the "decoder" reprogramming is essentially changing the
> > read/write commands to adjust based on v/pmem_active vs v/pmem_size?
>
> Yup.  We also need multiple decoder support in general in QEMU.
> It's not that high on my list as my main focus this cycle is going
> to be on reducing the out of tree patch set by upstreaming stuff.
>
> >
> > I suppose I can look at this chunk next.
>
> Great.
>
> Jonathan
>
>
>

--000000000000a7a5d505f15e32c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The fine grained control would be a precursor to an emula=
ted pooling device.=C2=A0 If you can demonstrate it with a singleton attach=
ed device, you could just implement an exclusivity table in a shared file, =
and set the shared memory to a file backend as well.=C2=A0 Boom, shared mem=
ory pool across qemu instances.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023, 10:56 AM Jonathan Camer=
on &lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com">Jonathan.Cameron@huaw=
ei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 20 De=
c 2022 14:27:31 -0500<br>
Gregory Price &lt;<a href=3D"mailto:gregory.price@memverge.com" target=3D"_=
blank" rel=3D"noreferrer">gregory.price@memverge.com</a>&gt; wrote:<br>
<br>
&gt; On Tue, Dec 20, 2022 at 03:34:53PM +0000, Jonathan Cameron wrote:<br>
&gt; &gt; &gt; However I don&#39;t think this is successful in creating the=
 dax devices,<br>
&gt; &gt; &gt; and therefore the reconfiguring into ram.=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; Sure. I only bothered testing the it in some dax modes rather tha=
n via kmem.<br>
&gt; &gt; It &#39;should&#39; work but more testing needed there.<br>
&gt; &gt; <br>
&gt; &gt; However as you&#39;ve noted, that only applies to the pmem region=
s at the moment.<br>
&gt; &gt; I wondered if you&#39;d scripted the HDM decoder setup etc for te=
st purposes<br>
&gt; &gt; (so what the driver will do). Alternative to that would be enabli=
ng the driver<br>
&gt; &gt; support. Not sure if anyone is looking at that yet. Final alterna=
tive would<br>
&gt; &gt; be to port the existing EDK2 based support to work on QEMU.=C2=A0=
 All non trivial<br>
&gt; &gt; jobs so may take a while,<br>
&gt; &gt; <br>
&gt; &gt; Jonathan=C2=A0 <br>
&gt; <br>
&gt; Also, I&#39;m relatively new to this corner of the kernel (mm, regions=
, dax,<br>
&gt; etc), so i need to spend a week or two with uninterrupted tinkering wi=
th<br>
&gt; how adding new memory regions from these devices is actually &quot;sup=
posed<br>
&gt; to work&quot; in a dynamic-capacity world.<br>
&gt; <br>
&gt; At least in theory, the partitioning of persistent and volatile memory=
<br>
&gt; regions on one of these type-3 devices should end up looking a bit lik=
e<br>
&gt; dynamic capacity when doing runtime reconfiguring.<br>
&gt; <br>
&gt; For example, considering<br>
&gt; <br>
&gt; Device(512mb PMEM, 512 VMEM), I&#39;d want, at least i think<br>
&gt; <br>
&gt; CMFW-Volatile:=C2=A0 =C2=A0 max window size(1024mb) - Numa 2<br>
&gt; CMFW-Persistent:=C2=A0 max window size(512mb)=C2=A0 - Numa 3<br>
&gt; <br>
&gt; Then we&#39;d need the kernel support for<br>
&gt; <br>
&gt; 1) Online 2x256mb volatile regions in Numa 2<br>
&gt; 2) Online 2x256mb persistent regions in Numa 3<br>
&gt; 3) Offline persistent region (256mb:512mb)<br>
&gt; 4) Reconfigure device to 256Pmem/768Volatile<br>
&gt;=C2=A0 =C2=A0 a) change decoders in device accordingly<br>
&gt; 5) Online 1x256mb volatile region in Numa 2<br>
&gt; <br>
&gt; The question is whether you can do this without offlining the other<br=
>
&gt; adjacent regions.=C2=A0 I just don&#39;t know enough about the region =
subsystem<br>
&gt; to say what is &quot;correct&quot; behavior here.<br>
<br>
Whilst you probably &#39;can&#39; do fine grained offline / online (to some=
<br>
degree anyway) I&#39;m not sure if people consider it an important<br>
usecase. If decoder reprogramming is involved things will get very fiddly<b=
r>
so at least in first instance I&#39;d advocate just ripping it all down and=
<br>
building up again.=C2=A0 Or in the simple case, just block attempts to reco=
nfigure<br>
at the partitioning if either side is in use.<br>
<br>
&gt; <br>
&gt; On the device side, I need to go look at the mailbox commands to go<br=
>
&gt; about implementing the reconfiguration / decoder reprogramming.<br>
&gt; <br>
&gt; I guess the &quot;decoder&quot; reprogramming is essentially changing =
the<br>
&gt; read/write commands to adjust based on v/pmem_active vs v/pmem_size?<b=
r>
<br>
Yup.=C2=A0 We also need multiple decoder support in general in QEMU.<br>
It&#39;s not that high on my list as my main focus this cycle is going<br>
to be on reducing the out of tree patch set by upstreaming stuff.<br>
<br>
&gt; <br>
&gt; I suppose I can look at this chunk next.<br>
<br>
Great.<br>
<br>
Jonathan<br>
<br>
<br>
</blockquote></div>

--000000000000a7a5d505f15e32c1--

