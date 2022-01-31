Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC3F4A4DA3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:58:16 +0100 (CET)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEawR-000867-Qc
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:58:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEapw-00011o-3c; Mon, 31 Jan 2022 12:51:33 -0500
Received: from [2a00:1450:4864:20::232] (port=45719
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEapt-0006VU-13; Mon, 31 Jan 2022 12:51:31 -0500
Received: by mail-lj1-x232.google.com with SMTP id t9so20457071lji.12;
 Mon, 31 Jan 2022 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=82CtlzTUPu89ArvEr8o1+XGhOncLU5/HVb493xwXQoA=;
 b=UtIHuLP188dUAW8xqNh0NDtgIorFXOofJJAfshCEHByke97Y2r/or8DbzlQDGUfGJl
 an/i7jNU/ZpPXYBGbzrlsYOpKVT6Ss8DRaCdqUKuURG8If5B9/id7BzkTONNU0JKivJ7
 Vby8HmLfpS6Lx2UmDiOid0i2hGIhUg78CjNobTMM1klpOh4zKJ/WphAtJ7L9QkqKNRHx
 R1YBei+3jjG06e7TjKk8zqETi4JbkkEwNGXM/olPlF9ksSXRP8ce86K7Uuh38ueB+Q4g
 XehEoUWMRNBQTMWQRBzQuaqhVmKWRVMAoWGE0n3bT4JdrnltQ4LbXoRVWRCecjBJ/cCg
 2tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=82CtlzTUPu89ArvEr8o1+XGhOncLU5/HVb493xwXQoA=;
 b=b4sZYxpkCSjhBBwa7gKuHW2XuCRLrd/DIOqZdmFqYvOUnoHfWJRYQ3QVRo/APXZ5hr
 2XLEhpyYxeURMWicRo0eJ+MUeWNwt8OsDixlz/rZxflBDp3s1gSxnK1pmPqp2bkGdb/6
 6VOVZOf9r7UNFCeoaDV7RYismxxv/cg7x0VLHS7u6UwojcT0GZLvsNm5QppoXsjcZoX3
 f1uH3V8W2y+yVTcQ+l5aGf22fCqgOlyC7IHsaNVhj+YCQnppKzhR67A1kCveSivyibcm
 Arkk2BgiGgpMOJgda8V51BlpSWHd2LJEeipTKTyVvu4eQbYsN8q/5HmPPeX2RREqnnOr
 5Wmw==
X-Gm-Message-State: AOAM5309hbG+uRUxfl5IwcmDF+FaYorCfm95zbJ0PiFOkJmWTt0s0sue
 ILaINGiBmSKpxRkaCywZ0W8=
X-Google-Smtp-Source: ABdhPJyTAqfUOs34HrilFAPe9hcruUZtjTFnoq7Txshz8BVVk52XuMSMTSz/kqSTADMZLgS//N+5rw==
X-Received: by 2002:a2e:2284:: with SMTP id
 i126mr14479832lji.309.1643651484040; 
 Mon, 31 Jan 2022 09:51:24 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id z13sm3727044lft.92.2022.01.31.09.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 09:51:23 -0800 (PST)
Date: Mon, 31 Jan 2022 18:51:23 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
Message-ID: <20220131175123.GT3586016@toto>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-4-edgar.iglesias@gmail.com>
 <20220131153555.gyivhhz3a7zwiho4@debian>
 <20220131172709.GE8684@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131172709.GE8684@toto>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 06:27:09PM +0100, Edgar E. Iglesias wrote:
> On Mon, Jan 31, 2022 at 03:35:57PM +0000, Francisco Iglesias wrote:
> > Hi Edgar,
> > 
> > A couple of minor comments below, looks good to me otherwise!
> > 
> > On Mon, Jan 31, 2022 at 12:12:03AM +0100, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > > 
> > > Add a model of the Xilinx ZynqMP CRF. At the moment this
> > > is mostly a stub model.
> > > 
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > > ---
> > >  include/hw/misc/xlnx-zynqmp-crf.h | 209 +++++++++++++++++++++++
> > >  hw/misc/xlnx-zynqmp-crf.c         | 270 ++++++++++++++++++++++++++++++
> > >  hw/misc/meson.build               |   1 +
> > >  3 files changed, 480 insertions(+)
> > >  create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
> > >  create mode 100644 hw/misc/xlnx-zynqmp-crf.c
> > > 
> > > diff --git a/include/hw/misc/xlnx-zynqmp-crf.h b/include/hw/misc/xlnx-zynqmp-crf.h
> > > new file mode 100644
> > > index 0000000000..b173ea4a08
> > > --- /dev/null
> > > +++ b/include/hw/misc/xlnx-zynqmp-crf.h
> > > @@ -0,0 +1,209 @@
> > > +/*
> > > + * QEMU model of the CRF - Clock Reset FPD.
> > > + *
> > > + * Copyright (c) 2022 Xilinx Inc.
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > > + */
> > > +
> > 
> > Include guard seem to be missing:
> > 
> > #ifndef XLNX_ZYNQMP_CRF_H
> > #define XLNX_ZYNQMP_CRF_H
> > 
> > 
> > > +#include "hw/sysbus.h"
> > > +#include "hw/register.h"
> > > +
> > > +#define TYPE_XLNX_ZYNQMP_CRF "xlnx.zynqmp_crf"
> > > +
> > > +#define XILINX_CRF(obj) \
> > > +     OBJECT_CHECK(XlnxZynqMPCRF, (obj), TYPE_XLNX_ZYNQMP_CRF)
> > > +
> > > +REG32(ERR_CTRL, 0x0)
> > 
> > (Optional but in case the these ones wont be used outside
> > xlnx-zynqmp-crf.c we could consider placing them there).
> 
> 
> Hi,
> 
> Yeah, I thought about that but the issue is with defining:
> 
> #define CRF_R_MAX (R_RST_DDR_SS + 1)
> 
> We could move these regdefs out and hardcode CRF_R_MAX, e.g:
> #define CRF_R_MAX (0x108 / 4)
> 
> But that seems error-phrone.
> The trade-off is keeping them here and pollute the name-space.
> I already to rename one of these macros to avoid conflict...
> 
> Does someone have other ideas or preferences?

I guess we could xlnx-zynqmp-crf.h:
#define CRF_R_MAX ((0x108 / 4) + 1)

and in xlnx-zynqmp-crf.c crf_init():
assert((R_RST_DDR_SS + 1) == CRF_R_MAX);

Or something along those lines...


> 
> Cheers,
> Edgar
> 
> ....
> 
> > > +REG32(RST_DDR_SS, 0x108)
> > > +    FIELD(RST_DDR_SS, DDR_RESET, 3, 1)
> > > +    FIELD(RST_DDR_SS, APM_RESET, 2, 1)
> > > +
> > > +#define CRF_R_MAX (R_RST_DDR_SS + 1)
> > > +
> > > +typedef struct XlnxZynqMPCRF {
> > > +    SysBusDevice parent_obj;
> > > +    MemoryRegion iomem;
> > > +    qemu_irq irq_ir;
> > > +
> > > +    RegisterInfoArray *reg_array;
> > > +    uint32_t regs[CRF_R_MAX];
> > > +    RegisterInfo regs_info[CRF_R_MAX];
> > > +} XlnxZynqMPCRF;

