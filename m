Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6347341C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:35:10 +0100 (CET)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqAH-0006GQ-73
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:35:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwq8f-0004oJ-Mt; Mon, 13 Dec 2021 13:33:29 -0500
Received: from [2607:f8b0:4864:20::82d] (port=41708
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwq8e-0006CN-8M; Mon, 13 Dec 2021 13:33:29 -0500
Received: by mail-qt1-x82d.google.com with SMTP id v22so16121058qtx.8;
 Mon, 13 Dec 2021 10:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5J8HPOr6MpkfQojpRt5+CjgRpiaM4haFJGYOmaOK+7U=;
 b=SZx8T7FxlF00DS6Aro/ncI3dhJGrX/fkJuiA+fqNArcyJXHVLgezozaHwrI+MR8eWk
 M1y1SFXhTKqEM6xq943PpSUnGmbcT8DJqCck38l/wSetzBEVAE3xB1vz6caZyveyr0uu
 FxFrQyrhdsbi2IYom4OjeGCcK5LSxo3qczeJa/+GSD4jF1hnNjr571OI5A2CfOCkee1T
 9xodIBTOTtueBsA7wVqRQ0zHUgKBi1CRNvc1VUH4I2FPfGa/X0Gg4vmO4y72EtuchMQr
 jOTSwcsHACKgKbFhQJ0UjC05nrciqPzcMEDi9PrYicphbfe8Lk4p/FZ71Vz7d8URs9y9
 jyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5J8HPOr6MpkfQojpRt5+CjgRpiaM4haFJGYOmaOK+7U=;
 b=januY/qPO81go1fAqWhBHm2qPo9QC+AOUqWH5H5lPvd/KqvW21rHIITN3niqg3xoFh
 5WgY3OoXeJLJVn+RK/5zdD7O/LtPN/6aWl7tbBwCUC1R3Vy1ltoDRTx3pcR8JZ1CoJYE
 P700TCWDoLBPeikhIumZQ0d/lJ4xYY1oHliAw87Zfc4yy/uNPJ1cLS3XAUESDsq3Wggq
 6Kay4FsEVDlrq8wQ4gcMEroIZdbSEjdcKNhxjAgDOIcaI8WW18GTiqCRK4IEDS7JRSoM
 noijlm2RA0vsIsRcQqJyl3B/z3PYeKQ1FhTShyzfFNs3gbT/VAeAmTjX3MgSeuhGUfie
 8MnA==
X-Gm-Message-State: AOAM5324kxEdTXMmjK7DxefUvNYvmDb+CcnfhBFWpBjdyT+pu0hTP9Tw
 NSRvEW4aFMS+MYeMyhjyCn1gLDIubD0=
X-Google-Smtp-Source: ABdhPJw5o+fWsScCHJ1Q8uaqTsKneG7UZ9bv3IRZ/8/3e/lNWF3QyKnPbjEr/KSc9FwtanvuvHiCGw==
X-Received: by 2002:a05:622a:138e:: with SMTP id
 o14mr9273qtk.576.1639420407010; 
 Mon, 13 Dec 2021 10:33:27 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id c1sm9543827qte.79.2021.12.13.10.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 10:33:26 -0800 (PST)
Message-ID: <3d06debb-99d9-1376-26ef-839e9763019b@gmail.com>
Date: Mon, 13 Dec 2021 15:33:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 03/19] ppc/pnv: Use the chip class to check the index
 of PHB3 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211213132830.108372-1-clg@kaod.org>
 <20211213132830.108372-4-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211213132830.108372-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/13/21 10:28, Cédric Le Goater wrote:
> The maximum number of PHB3 devices per chip can be different depending
> on the POWER8 processor model.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 3aa42ef9d4b9..9c4451ca0d1c 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -993,7 +993,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>       int i;
>   
> -    if (phb->phb_id >= PNV8_CHIP_PHB3_MAX) {
> +    if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
>           error_setg(errp, "invalid PHB index: %d", phb->phb_id);
>           return;
>       }
> 

