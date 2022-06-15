Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C154D186
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:25:50 +0200 (CEST)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1YeD-0004Fh-A5
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o1Yby-0002pV-NO
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:23:30 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o1Ybx-0002qm-6y
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:23:30 -0400
Received: by mail-yb1-xb31.google.com with SMTP id p13so22270345ybm.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwdiFAzg9OyCm6z6rzXhnezmvKsswS+TyH70/5WuJ9g=;
 b=hjzFBiAXvhahTi+HNSsSMC65YPg8YRjsrFoX/aoFi89Dvh2B4Bvm14FHxDXh1idnt0
 wwLVckSx+iK3awkRdK1PKQ66UR51qj0W8zruJaa3aT54Q6+DwEubFVAtQI/OXgadpcIG
 x680qucbhA696HWXo7bpqPWAV6YrIH1FhOcj7KlzyZDxqcSxxZ1zV4YC2k5TabEUW/4/
 nwX9n7IruPILU03DnJz5lVcBkZ25rbFmaFGK5XDVcQOWSLesPOoFDY0gCgOvrvlVq8Tz
 vFiLd8Icul1zToZdUpasekw9pM35ET8uwsYxYjvjUW6Py+zfMLUBMI2Yrp28CHAEUqB2
 O+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwdiFAzg9OyCm6z6rzXhnezmvKsswS+TyH70/5WuJ9g=;
 b=8GozR5D977f4vI+ueeVysg9rs2hVrS3PurVI/rPmSq1Pqsbo6LLiOrv6HMZgGftuOr
 1Y7V+3XZh9ZHOZStfI//Ppc7PLUvplTz9MiwDhnZPHbjgSQBuneM4GpjnNk4Tkg4ZPZP
 44yu9pRMgZ+9uWSVYJ/WGAARLEKHdpY5evEIgbEJwV9Gailu5bw+x1qMwmJUwIRZs/3t
 kLDUo5Ym2dWb4UhG7iYo9FZqJf4/BdTT0PyyAQ3u6HiiPcoLdGGjv+RYMSee3GjK+vfV
 +/qlcJ04ea1GxS/u/AQgokReFukPxnsvWOOuSVPjF9OEdppq2BNu22G9TyoW6p3uOm/x
 GsIQ==
X-Gm-Message-State: AJIora8XcC7kLEB6JeeP50NPf0nk4kOx9TnHz6MM3NfLQmIYcInOQIdB
 xldIEzeQM/Kw4BnBTOOs9HGAk6PFFM3Hf7NawqofUA==
X-Google-Smtp-Source: AGRyM1uBXEZ2zHXRW3bp7/YftqDDJMIA/WGGDyD7sU+99HEc/npns1jXfVPc2CZzzHdZOC9UqlvpH2xj2+ycQtZcvMQ=
X-Received: by 2002:a25:b5c1:0:b0:664:5a43:61a0 with SMTP id
 d1-20020a25b5c1000000b006645a4361a0mr1528549ybg.321.1655321006399; Wed, 15
 Jun 2022 12:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <20220615073337.jq654i7ba33xttwh@sirius.home.kraxel.org>
In-Reply-To: <20220615073337.jq654i7ba33xttwh@sirius.home.kraxel.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 15 Jun 2022 12:23:15 -0700
Message-ID: <CAAH4kHabyqiWL=yP94OvGhauPy3rv2zGq0w+3Be_rVGm8=y38g@mail.gmail.com>
Subject: Re: New "IndustryStandard" fw_cfg?
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Xu, Min M" <min.m.xu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Yao,
 Jiewen" <jiewen.yao@intel.com>, 
 "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=dionnaglaze@google.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

> > > For Qemu, the main code I see for adding config is here, but I'm not sure
> > > what y'all's preferred external configuration method is to get a value from an
>
> Ideally no external configuration, although I suspect we need something
> at least temporarily.

Yes, whereas TDX can assume unaccepted memory is supported as part of
its "TDX support" set of capabilities an OS has, SEV-SNP has already
been released and is supported. We therefore need to not break
existing images that "support SEV-SNP".

>
> IMHO the long-term goal should be to make this fully automatic, by
> having efi apps (which includes the linux kernel's efi stub) and
> firmware negotiate this.  Problem is this most likely requires changing
> the uefi specs, which will take a while.
>
> One possible way I see is extending efi boot services with a
> GetMemoryMapEx() call, with an additional flags parameter where the
> caller can specify that it can handle unaccepted memory with a flag
> bit.  When the guest does not set the flag (or uses the old GetMemoryMap
> call) the firmware must accept all memory and return a memory map
> without unaccepted memory.

To allow for future weird memory extensions, I'd recommend this being
a struct with initial size field, but yes.
Sounds like a new UEFI spec would be needed for this negotiation.

>
> > > 2. A "well-known" file path to be included in the file slots starting at 0x0020,
> > > such as "etc/min_accepted_mem_size", still plumbed through like in 1.
>
> New options should use a file path.
>
> See also docs/specs/fw_cfg.txt in qemu source tree.
>

Thanks for this.

> take care,
>   Gerd
>


-- 
-Dionna Glaze, PhD (she/her)

