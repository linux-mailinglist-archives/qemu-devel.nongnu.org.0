Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57A4A4915
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:12:33 +0100 (CET)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXQ0-0000Je-5q
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:12:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEVcd-0003og-0k; Mon, 31 Jan 2022 07:17:31 -0500
Received: from [2a00:1450:4864:20::233] (port=38747
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEVcb-0007r4-FN; Mon, 31 Jan 2022 07:17:26 -0500
Received: by mail-lj1-x233.google.com with SMTP id e17so19153146ljk.5;
 Mon, 31 Jan 2022 04:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fx23SND8V1sz634UVepTS3wV09PRCsMKeba8kwWDipw=;
 b=Z4mb+qVPH4E1bBUQoWaff1w7UOjslrxZIjDiX/QydsRgyZr/hiFaMZlcdN9AqTpkV8
 8W5vD5gJcKnQ2xZPpUzF2aYYkTPb6Z9Zv9YADb9HUdiIxBTj2n5uhqu1obQjCVQi5zo6
 ncFc8N2a7xXuZvLrC0Oxfb/WiW2SQ0brneshbXAHXA6naNzy5oFhCuHexL70yteu3yJR
 8mifIskWoeYKcIMfBa3RhCxvxHsCynWpPYnwzTpMB1ZNeYyGS2CH/fBZQriYSijd0C6T
 oIM0FPDL9ULwHbVM0U1cHYJM9RtzfZEzIvfEl8PX5AYNzCd8bTvzDg1VAHBoM/zIuByH
 a9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fx23SND8V1sz634UVepTS3wV09PRCsMKeba8kwWDipw=;
 b=BdRewiM9MW5t1gmD0JEVG//3Kj3dzLM30bpprNii3UmYQnKKDTwoSWJ5s6/366U1Uu
 5knngt9zlnMUYjQ6+6azqi1UBtSc0YujAWAAgpcJ7M70S/skI8Ms+XKZq8FE235fe0fx
 naq6Qe+NMsqM9+Uq0D7cvZ0oE5ftOcblurrvWgAlr5uw/N+mELZZwlr2s+5NSBXWNQ7K
 erN9MELBn/IilTs2F4+aA84litPWpvqrxQJvpsVO3eWJkeY6MwmMYRzjdzFNJi6y3/TB
 cGlR+zuMgLLchCEaKbrY4g8uTb1qJFi9pO/c5jMzSyDWdyIkFtWbFtVAlUCyA5SQAAbI
 CCCA==
X-Gm-Message-State: AOAM530M68peY6rhGosK2CVeB6T7cxYDHTlNZE4q023a4rNDbkAZjHed
 CfEcL+hIy3xOgu1Zu11+Ibg=
X-Google-Smtp-Source: ABdhPJzEYQ70YVwilJmqNDx80Q+obNYQQyg0KS6BzvRcLGOTov1YFQvtOaS6Egeoq3Bto4NqrWPThA==
X-Received: by 2002:a2e:8053:: with SMTP id p19mr12870082ljg.95.1643631441809; 
 Mon, 31 Jan 2022 04:17:21 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j2sm16165lfc.174.2022.01.31.04.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 04:17:21 -0800 (PST)
Date: Mon, 31 Jan 2022 13:17:20 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU
 Control
Message-ID: <20220131121720.GS3586016@toto>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-6-edgar.iglesias@gmail.com>
 <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x233.google.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 12:35:54AM +0100, Philippe Mathieu-Daudé wrote:
> On 31/1/22 00:12, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > 
> > Add a model of the Xilinx ZynqMP APU Control.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >   include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
> >   hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++++
> >   hw/misc/meson.build                    |   1 +
> >   3 files changed, 349 insertions(+)
> >   create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> >   create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
> > 
> > diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> > new file mode 100644
> > index 0000000000..44bf264cef
> > --- /dev/null
> > +++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> > @@ -0,0 +1,91 @@
> > +/*
> > + * QEMU model of ZynqMP APU Control.
> > + *
> > + * Copyright (c) 2013-2022 Xilinx Inc
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
> > + * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > + *
> > + */
> > +
> > +#include "hw/sysbus.h"
> > +#include "hw/register.h"
> > +#include "target/arm/cpu.h"
> > +
> > +#define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
> > +
> > +#define XLNX_ZYNQMP_APU(obj) \
> > +     OBJECT_CHECK(XlnxZynqMPAPUCtrl, (obj), TYPE_XLNX_ZYNQMP_APU_CTRL)
> ...
> 
> > +#define APU_R_MAX ((R_PWRSTAT) + 1)
> > +
> > +#define NUM_CPUS 4
> 
> Hmm isn't it APU_MAX_CPU?
> 


Thanks Philippe. Yes, this was a little confusing. The values happen to be the
same but they belong to different models. For example, the apu-ctrl model will be
reused in Versal.

Anyways, for v2 I've renamed the macros to CRF_MAX_CPU and APU_MAX_CPU respectevly.
I hope that makes things clearer.

Thanks,
Edgar

