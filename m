Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597794C4AAE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:27:01 +0100 (CET)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdQp-0003cl-Sm
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdDv-0007WD-Mj; Fri, 25 Feb 2022 11:13:41 -0500
Received: from [2607:f8b0:4864:20::334] (port=40952
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdDt-00060R-17; Fri, 25 Feb 2022 11:13:39 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso3915412ots.7; 
 Fri, 25 Feb 2022 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dNKLvxpoNJ7AIrjm+OTCX0taqiK4hMw4sRRzIAM5vbI=;
 b=ZAWeN/wZ2b44AhJoPTdiJFCE3hQ8PyWdYN44ZveZC5hyirRe86KyfiGO9m1svdQjuV
 gmjL1H8TPvZQ5P131EHBOttf/tAnV0j1IKO6+1mgVA7fFb5o7/DBVUzAgNmK8MHBqbo1
 X6KE24xFG5Q7URsR0wxa8R0wrEUSzt0lX8frHSdOPSbN0e7x8Gps9Lrj+Qv3xYK6Z7ve
 d8jEDcREmH22GzTOrhp2yLMFpEMpn2PN/orjDnm1khzbel3ei+FF4Ekd2LNKhb3e2x8m
 sVlvNKawsp9r2VDBjRrOxGPFv6lojKrnVTRm7rwtivPWNREKRw7GMNWTq8T4Dt0/+0Dl
 xMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dNKLvxpoNJ7AIrjm+OTCX0taqiK4hMw4sRRzIAM5vbI=;
 b=fYRSWuoAjhP5MGeOXegAQIMaGZBTmsZ3F3PR3afgilowIZSX6aIR0SVeXOty9o7Fus
 xQ9WumkZ1x9Tc1pFF8QxDg/mEM4M86HJJVKUrLrOFFYVFw5EtPYj5c2AA71UMXEySZTm
 5mTVmyiLK5IMlEMBe6z3KRGXXIuk0zo+qpTbGVpAyUsA80xDS/oNeN4uRuv5A6Ri9Y5R
 QbA2XfzJ5E3Dz5yfMIhQj6IHtgLj/Yy7B2P4aWgpYmiIuGZ3ZYn+A+MERoH1HAtOnfh0
 aKR6Ji4C6eKRiqhXGcRFMGjPQd1QrHaY8cU/yy9DEVmtyjF1Y3y0RMP5+uONptBgvvZE
 +Nfw==
X-Gm-Message-State: AOAM531mXx+/PxJpXr4tBZB/ngWajxrvcmbZu1SWFdzvx4g/tac3YBs2
 Qu/LexmFQn4YdxYB7uMDLy8=
X-Google-Smtp-Source: ABdhPJyny66gWedQTmSUF7yDJb3IhgbhCTn7p3y0otADdvNGWZahSP0G2PEIUzMv/iCjslO4FiM4LQ==
X-Received: by 2002:a05:6830:44a8:b0:5af:1534:4c85 with SMTP id
 r40-20020a05683044a800b005af15344c85mr890676otv.92.1645805615258; 
 Fri, 25 Feb 2022 08:13:35 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a4a330e000000b002e89ed90006sm1265189ooq.44.2022.02.25.08.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:13:35 -0800 (PST)
Message-ID: <f3b49249-1018-53f6-7e91-e922989fa87d@gmail.com>
Date: Fri, 25 Feb 2022 13:13:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 13/18] pnv/xive2: Introduce new capability bits
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-14-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-14-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/26/21 08:53, Cédric Le Goater wrote:
> These bits control the availability of interrupt features : StoreEOI,
> PHB PQ_disable, PHB Address-Based Trigger and the overall XIVE
> exploitation mode. These bits can be set at early boot time of the
> system to activate/deactivate a feature for testing purposes. The
> default value should be '1'.
> 
> The 'XIVE exploitation mode' bit is a software bit that skiboot could
> use to disable the XIVE OS interface and propose a P8 style XICS
> interface instead. There are no plans for that for the moment.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/intc/pnv_xive2_regs.h | 5 +++++
>   hw/intc/pnv_xive2.c      | 4 ++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
> index 084fccc8d3e9..46d4fb378135 100644
> --- a/hw/intc/pnv_xive2_regs.h
> +++ b/hw/intc/pnv_xive2_regs.h
> @@ -31,6 +31,11 @@
>   #define       CQ_XIVE_CAP_VP_INT_PRIO_8         3
>   #define    CQ_XIVE_CAP_BLOCK_ID_WIDTH           PPC_BITMASK(12, 13)
>   
> +#define    CQ_XIVE_CAP_PHB_PQ_DISABLE           PPC_BIT(56)
> +#define    CQ_XIVE_CAP_PHB_ABT                  PPC_BIT(57)
> +#define    CQ_XIVE_CAP_EXPLOITATION_MODE        PPC_BIT(58)
> +#define    CQ_XIVE_CAP_STORE_EOI                PPC_BIT(59)
> +
>   /* XIVE2 Configuration */
>   #define X_CQ_XIVE_CFG                           0x03
>   #define CQ_XIVE_CFG                             0x018
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index 186ab66e105d..cb12cea14fc6 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -1708,9 +1708,9 @@ static const MemoryRegionOps pnv_xive2_nvpg_ops = {
>   };
>   
>   /*
> - * POWER10 default capabilities: 0x2000120076f00000
> + * POWER10 default capabilities: 0x2000120076f000FC
>    */
> -#define PNV_XIVE2_CAPABILITIES  0x2000120076f00000
> +#define PNV_XIVE2_CAPABILITIES  0x2000120076f000FC
>   
>   /*
>    * POWER10 default configuration: 0x0030000033000000

