Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29D669B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:10:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLJB-0003Mb-LN; Fri, 13 Jan 2023 09:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1pGLJ9-0003Lx-2U
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:45:27 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1pGLJ7-0001w9-Ea
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:45:26 -0500
Received: by mail-yb1-xb41.google.com with SMTP id 203so22564427yby.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OmA35jJ/IhI8soaMVoVzRxTdPwL96AKIEmoHHT08quA=;
 b=KqkaCgTIyPBARXanIaKDvVPstM62miRK6I2mZWn6jdyjxumZg+YF9pWPFAgYQpEyJi
 a/ilzSaIZyByPPCI4oFRbZOb5gUyDSWN2mZIEc0UAC5yQmjmrfW4J6JpGZaSkxBYtQR8
 nHyh2T2WpPT68CSIzfvKOw5YQBponYyCHSeygzBkbyaefcXeZkcsvMQ8PprjS0wQAffC
 Uoo3D706voSBssczDzKmOtNMK2+moI3CgFbf3MdTNK3LV6YgZO/JQM08Qt+sWRSkeIp0
 e4lSHIrZnMVlbb7NasbOEDdJFtZeWrFAGj7X7Vcvox/qK+/TeKo+iPZ8ioaTmoPevyjx
 qlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OmA35jJ/IhI8soaMVoVzRxTdPwL96AKIEmoHHT08quA=;
 b=OEna5VWuww4Vs0WnXC2JsP149B1+HBxrFNOrmEKN0pLOV2fB2suVCrGUhKeNz8+7uU
 ZJ8PLcsKHry/xnWuaXYYblyDXrN5njs4nXLOk83OBdFy2nM/f5lXS3yMhYSSdppGnojt
 uJzzd3QsV9kXWZ69sTWNECv4dk4Iu7AFUM0ONwaVq9lOm4wfc1UZVdqWH4fZavPJklEa
 EQ7Jbpl/OEsjeXOakFXurZcwtg32VAxVMuhs/W9OmdAb68dfpjYnxVwQimURJYefWMcJ
 xHVu4NjLalOMTGnm500Uq7HXX5Nc7kLbFJ5s18kmR+/dC36DZLMhRFmDptS4z3ReTYVZ
 +pWw==
X-Gm-Message-State: AFqh2ko1YfQL187LfEjXqiY87+OdPhBa02lv63z6Y5JDeZy0YajSYTdM
 Xme4HGdbEJiARRyxQm7VLxgRDZwvzsufn1kBvQ==
X-Google-Smtp-Source: AMrXdXtvW42plJJHW08s4MrHL72OZhhsLfwVDpDwaARnO01O9OUl05Av7rFmMdDC3joyGUFjpkS+B7GBlGX3JRb3wGE=
X-Received: by 2002:a25:cc8:0:b0:711:cae6:c734 with SMTP id
 191-20020a250cc8000000b00711cae6c734mr8793900ybm.433.1673621124046; Fri, 13
 Jan 2023 06:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <Y8AppXP+eP9cEz+i@memverge.com> <20230112172130.0000391b@Huawei.com>
 <Y8CNw/fZT5fZJZcK@memverge.com> <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com> <20230113144026.000001fb@Huawei.com>
In-Reply-To: <20230113144026.000001fb@Huawei.com>
From: Gregory Price <gourry.memverge@gmail.com>
Date: Fri, 13 Jan 2023 09:45:11 -0500
Message-ID: <CAD3UvdTsd8d05snsP+db=Q06YsURHU_4JzCK-3resDWNCq5CpQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw/cxl: CXL emulation cleanups and minor fixes for
 upstream
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gregory.price@memverge.com>, qemu-devel@nongnu.org, 
 Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 linux-cxl@vger.kernel.org, 
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>
Content-Type: multipart/alternative; boundary="00000000000096641c05f22648df"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=gourry.memverge@gmail.com; helo=mail-yb1-xb41.google.com
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

--00000000000096641c05f22648df
Content-Type: text/plain; charset="UTF-8"

Ah I see, i forgot about that one.  Give me a bit and I'll see if it is the
same issue.

On Fri, Jan 13, 2023 at 9:41 AM Jonathan Cameron <
Jonathan.Cameron@huawei.com> wrote:

> On Fri, 13 Jan 2023 09:19:59 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
>
> > On Fri, Jan 13, 2023 at 09:12:13AM +0000, Jonathan Cameron wrote:
> > >
> > > Just to check, are these different from the on stack problem you
> reported
> > > previously?  Doesn't look like the fix for that has made it upstream
> yet.
> > >
> > > What kernel are you running?
> > >
> > >
> >
> > The prior issue I saw was related to the CXL Fixed Memory Window having
> > an e820 region registered during machine initialization.  That fix is
> > upstream.
> >
> > On 2023-1-11 branch it is commit 2486dd045794d65598fbca9fd1224c27b9732dce
> >
> > This one appears when registering any kind of type-3 device, during
> > boot.
>
> I meant this one
>
> https://lore.kernel.org/all/20221118000524.1477383-1-ira.weiny@intel.com/
>
> Sorry, should have dug out a link in earlier reply and save a round trip.
>
> Jonathan
>

--00000000000096641c05f22648df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah I see,=C2=A0i forgot about that one.=C2=A0 Give me a bi=
t and I&#39;ll see if it is the same issue.</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 13, 2023 at 9:41 AM =
Jonathan Cameron &lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com">Jonatha=
n.Cameron@huawei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Fri, 13 Jan 2023 09:19:59 -0500<br>
Gregory Price &lt;<a href=3D"mailto:gregory.price@memverge.com" target=3D"_=
blank">gregory.price@memverge.com</a>&gt; wrote:<br>
<br>
&gt; On Fri, Jan 13, 2023 at 09:12:13AM +0000, Jonathan Cameron wrote:<br>
&gt; &gt; <br>
&gt; &gt; Just to check, are these different from the on stack problem you =
reported<br>
&gt; &gt; previously?=C2=A0 Doesn&#39;t look like the fix for that has made=
 it upstream yet.<br>
&gt; &gt; <br>
&gt; &gt; What kernel are you running?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; The prior issue I saw was related to the CXL Fixed Memory Window havin=
g<br>
&gt; an e820 region registered during machine initialization.=C2=A0 That fi=
x is<br>
&gt; upstream.<br>
&gt; <br>
&gt; On 2023-1-11 branch it is commit 2486dd045794d65598fbca9fd1224c27b9732=
dce<br>
&gt; <br>
&gt; This one appears when registering any kind of type-3 device, during<br=
>
&gt; boot.<br>
<br>
I meant this one<br>
<br>
<a href=3D"https://lore.kernel.org/all/20221118000524.1477383-1-ira.weiny@i=
ntel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all=
/20221118000524.1477383-1-ira.weiny@intel.com/</a><br>
<br>
Sorry, should have dug out a link in earlier reply and save a round trip.<b=
r>
<br>
Jonathan<br>
</blockquote></div>

--00000000000096641c05f22648df--

