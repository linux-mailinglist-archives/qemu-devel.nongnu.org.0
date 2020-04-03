Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357B19D078
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 08:51:17 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKGAe-0002hH-9v
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 02:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG8O-0007ak-LG
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 02:48:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG8N-0001XT-Lt
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 02:48:56 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:39495)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jKG8N-0001Wt-EQ; Fri, 03 Apr 2020 02:48:55 -0400
Received: by mail-lj1-x241.google.com with SMTP id i20so5824053ljn.6;
 Thu, 02 Apr 2020 23:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4POPsuQtyxk6evHDC1sfPvJ9lW/5rWpku3cwH1qzDdE=;
 b=YXySCw9n0UHnhvKWnSvGsRplC949gRiLYk7PxfF2k/yu3f5zDk12gjK/QIzYtJ1O1D
 7DV9EG+g2Nuj070Bu0jgFeyXPipabAJ6hcO1FrFnAYk/yXkFvbYNvm2AgC/qJuf2ECK8
 fsSXENG4Inz/nZsO65khQ1vKJqtha6e2Ybr4f0AeJEjm5qBG4PZKijD6gG6hCNOBIYWT
 rWTJx1MxxfzdhFUCJHuaIM4JeBvESrZKiBL3rC6sa+hhttIw5mUAqrH2e2q2emPVkU1g
 gxjSyfRivnn0xSkCFWBpdfqOj6n5HLQkIZuu9IOl8NJoHw/2bOEdhkejm3zp6cfEnCNW
 ersw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4POPsuQtyxk6evHDC1sfPvJ9lW/5rWpku3cwH1qzDdE=;
 b=gBHPWUl/90J5AYEq+WwUnJe01cdu9Vd5i61SQHDxcmpZtJ7I3lXCPSdakZeTGbdAaE
 oWbEc2rrwlXmsTviFoI9S7vw4sh+Blrs9Ao1Rmoog4cmC0i6FZ0CIBA5WVlBF+NqPiUd
 XiWnsjJH/3hQz3uTRGQCbxVyELXX90OXftRzaIP7rZ1wVjh6cuprvswxBlS9ruOZHkPe
 DcigFWlrKM97xaniG5aelZrYrBHGPPdg9oFEFCQdKf+Ir2sCLHyhiYfdLzRiPkm7PpaV
 egtl1NNMKxnecoUtAacs/h0sM9njWUsNumadP3iNTJTLXLanonUyGRFAj+gNf4HeOF6G
 b4pA==
X-Gm-Message-State: AGi0PuZwSkD37uD/w86WUXnU35+s8/mnPDjIQLArUpWkwGrdE4XzNow1
 yZFV1VUQ92RFGNC69ZHyglU=
X-Google-Smtp-Source: APiQypLIiygUdXzt6Q8rErFUPuqxHDdaj5fioexcbY85x+CIQm8yddI2v/QYosXqai3bAuil7Hp+uQ==
X-Received: by 2002:a2e:8e99:: with SMTP id z25mr3961744ljk.72.1585896534156; 
 Thu, 02 Apr 2020 23:48:54 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f26sm5272085lfc.76.2020.04.02.23.48.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 23:48:53 -0700 (PDT)
Date: Fri, 3 Apr 2020 08:48:51 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 2/5] dma/xlnx-zdma: Populate DBG0.CMN_BUF_FREE
Message-ID: <20200403064850.cwgpbkghfw7vbmdo@fralle-msi>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402134721.27863-3-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2020 Apr 02] Thu 15:47:18, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Populate DBG0.CMN_BUF_FREE so that SW can see some free space.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/dma/xlnx-zdma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index a6c5b2304a..6a4699757a 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -680,6 +680,12 @@ static RegisterAccessInfo zdma_regs_info[] = {
>      },{ .name = "ZDMA_CH_DBG0",  .addr = A_ZDMA_CH_DBG0,
>          .rsvd = 0xfffffe00,
>          .ro = 0x1ff,
> +
> +        /*
> +         * There's SW out there that will check the debug regs for free space.
> +         * Claim that we always have 0x100 free.
> +         */
> +        .reset = 0x100
>      },{ .name = "ZDMA_CH_DBG1",  .addr = A_ZDMA_CH_DBG1,
>          .rsvd = 0xfffffe00,
>          .ro = 0x1ff,
> -- 
> 2.20.1
> 

