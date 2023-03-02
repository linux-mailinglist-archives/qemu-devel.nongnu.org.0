Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0A6A8BAB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrIk-0006OG-1w; Thu, 02 Mar 2023 17:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrIi-0006Mx-Ew
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:21:24 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrIg-0007wb-OQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:21:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f11so551554wrv.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677795681;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HUILPdLysPVqixdbseU8O2BqodLow6wXYYFBFdjPbzE=;
 b=rNmCaPAL1fnhhOPkzNQgNWUz8DmliWKnQSQlA4Cz+1CeL08ZgzKRgAoviLHWnWZqQe
 +vPUcYHoakgTsbyrPSXhU8jcIwaHAYwK0Kptd943gQ+4s376pX5q6KqDyQwESgktX3Gu
 cl0YxuApwv7sHNLzkrE3m2obop120/OliaHS/AXFk4bURTS16Cx8AnFiWgLQG8cz8H6J
 eKyCWDiP8tUy63fc8Zk6EMGaHWSrJ1aulqIzmTrcpOXbpn241kQtKOaFEadFCk0R863H
 1lCdqtceIdxmUvht+353/6rNdOsScRv9piKNKpo14sINu1R2XypPjnyeZhwO7yF2vY//
 NdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677795681;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HUILPdLysPVqixdbseU8O2BqodLow6wXYYFBFdjPbzE=;
 b=KsoFc5+jsN7FQvCKlxot1BQStlzV4olsDrtcUDrwqblS+mgS3P4bO3epOc2t7zSmJI
 G7LOhlRQGorkYZWGAosNNLA8hF9lK6lcQ/NlCoxyx89V2jRT7z/E40yMCK1lFYuu3dRS
 GweGTahjBJP7xiLfsCks8dwNpQkv0dtBA+h2PpWy54l9PFStcbzk3w8RBLsBT6+FnHDn
 JM5NqpS/83ZZxsYk00u77pUFNNrEJF11j+rKxMHm4ZXjDYCcHjZHEu5lQFQe4xVoPmU0
 UgZ4+Bl29yiPe/z22BS2hu4KG5mmJ2jVhHKDChkAaTaQRzXZpCBRla2RIqX7EsV54E5N
 0iHg==
X-Gm-Message-State: AO0yUKXFtoduVzvq+U1zSbiMi3wQXYieeD0z12PhsDHXM+CuHjwdgIr9
 smaKk8qP2Sv+chWwMu9ZiLbFwA==
X-Google-Smtp-Source: AK7set9AlSQVRrTYEtJHjNOOjv3jwlC2uDgLNi6D6If7vTpeqGFoZdIwYjiPzjxB6S4u2GpezgOdtQ==
X-Received: by 2002:adf:f847:0:b0:2c7:ae57:5acc with SMTP id
 d7-20020adff847000000b002c7ae575accmr8792662wrq.26.1677795680914; 
 Thu, 02 Mar 2023 14:21:20 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d4892000000b002c70e60abd4sm489506wrq.2.2023.03.02.14.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:21:20 -0800 (PST)
Message-ID: <e6ea9eda-51be-df8e-5711-73b944b52944@linaro.org>
Date: Thu, 2 Mar 2023 23:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] pnv_phb4_pec: Keep track of instantiated PHBs
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
 <20230302163715.129635-2-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163715.129635-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

Hi Frederic,

On 2/3/23 17:37, Frederic Barrat wrote:
> Add an array on the PEC object to keep track of the PHBs which are
> instantiated. The array can be sparsely populated when using
> user-created PHBs. It will be useful for the next patch to only export
> instantiated PHBs in the device tree.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/pci-host/pnv_phb4_pec.c     | 12 +++++++-----
>   hw/ppc/pnv.c                   |  1 +
>   include/hw/pci-host/pnv_phb4.h |  2 ++
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 43267a428f..97c06bb0a0 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c

> +static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
> +                                           int stack_no,
> +                                           Error **errp)
>   {
>       PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
> @@ -128,8 +128,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                               &error_fatal);
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
> -        return;
> +        return NULL;
>       }
> +    return phb;
>   }


> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 28d61b96c7..0b72ef1471 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -185,6 +185,8 @@ struct PnvPhb4PecState {
>   
>       /* PHBs */
>       uint32_t num_phbs;
> +#define MAX_PHBS_PER_PEC        3
> +    PnvPHB *phbs[MAX_PHBS_PER_PEC];
>   
>       PnvChip *chip;
>   };

 From QOM PoV, better would be to 'embed' the PnvPHB structure (not only
a pointer to it), and initialize the PnvPHB instance calling
object_initialize_child() instead of qdev_new().

See for example the recent conversion of OHCISysBusState in commit
01c400ae43 ("hw/display/sm501: Embed OHCI QOM child in chipset").

Regards,

Phil.

