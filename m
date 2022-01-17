Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4BD4910C7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:49:15 +0100 (CET)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Y09-0001xE-N0
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Xvd-0007nh-8D; Mon, 17 Jan 2022 14:44:37 -0500
Received: from [2607:f8b0:4864:20::229] (port=43816
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9XvV-0006Th-Ss; Mon, 17 Jan 2022 14:44:32 -0500
Received: by mail-oi1-x229.google.com with SMTP id s22so25047297oie.10;
 Mon, 17 Jan 2022 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=KGBdXsDaHgGHjL4lZBS6sJ42eejA/s2j1V4T+IS7KjU=;
 b=AM6xOALuyOwb9FjhPMEp0g7R9rXBiErlcyr56DmQ5HgSu8B5pZ166cUUBZQRklUDz/
 3+pfDpJuDvaSNTVYH96fySgCovbLOQY1bLSmRtunA3iSjl9vh5qtV7BEAi9oFkZrfsFs
 kou/spLjvlkz3qyjJ4XXMhld2D3jFgnIK3n2WA2zHKZ84DopAR+8MCaEtMnBOq+sVAxq
 9zyMApOQsfanv1NtngzL+R8d1i2+qkTQ5omss+B92i0tjLfbKNqO1jxww7VBKJHLqAO2
 sU5efe5nQrb0+S13mx+RyR7lqTQVQHfj1bc1ewNSFBhL8iCaIac7d+BTL1ao9kzUn70j
 5NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KGBdXsDaHgGHjL4lZBS6sJ42eejA/s2j1V4T+IS7KjU=;
 b=eGT5SsoglE1EfHtISI5CLhX05+njAmEc1PSQZTy+dOviu0cNvsVvuybnWRefT0TxU8
 UNKDXzikf7uZi98gGx4Jj5MyjPUene4sByxoWdHQ71UCUB+kl04SkMHyFHo6TfxoTz36
 NE/XRypFMTuqFkLRPQCuywKoEUglLw9JUJciY5RvL9/8L0DKs1r7MOumlLngT/d2CTld
 PmXxiWlG4N9yX6Rshs6Tx534Mw5ZOK0N1s87O5k32G6NzPGQDVuQrfDKDhar2eazT+4t
 Hc/qMfqE1yKXoTVxW+b0/uSSGxv4QFWlHz/Apb4cSDP08gq9x9AI6zzQmipqM1I6nE5B
 DChg==
X-Gm-Message-State: AOAM530FexvXLuJmOf96dNW+ngEvDOwtdrIxT/PEwku0XTnbkpqfuyEK
 qpt38qOuB1KVTl3dRb4lJaWQOlcd4+H6kjJx
X-Google-Smtp-Source: ABdhPJzM6n5TCPv7T8cpiHY0H+4ddVCrIvfuu3KVYEz0yz9cqIAl/Kpckez0erLCRlCHuwCHuuaK7w==
X-Received: by 2002:a05:6808:14c5:: with SMTP id
 f5mr1165602oiw.36.1642448657070; 
 Mon, 17 Jan 2022 11:44:17 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id k101sm6045022otk.60.2022.01.17.11.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 11:44:16 -0800 (PST)
Message-ID: <e3a0f568-bba7-5762-8a04-99967dec0a9d@gmail.com>
Date: Mon, 17 Jan 2022 16:44:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] ppc/pnv: Add a 'rp_model' class attribute for the
 PHB4 PEC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220117122753.1655504-1-clg@kaod.org>
 <20220117122753.1655504-3-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220117122753.1655504-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 1/17/22 09:27, Cédric Le Goater wrote:
> PHB5 will introduce its own root port model. Prepare ground for it.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h | 1 +
>   hw/pci-host/pnv_phb4_pec.c     | 5 ++++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 74fdec2b478b..0c7635dec591 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -203,6 +203,7 @@ struct PnvPhb4PecClass {
>       int stk_compat_size;
>       uint64_t version;
>       const uint32_t *num_phbs;
> +    const char *rp_model;
>   };
>   
>   #endif /* PCI_HOST_PNV_PHB4_H */
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index b19e89236a63..a3c4b4ef850c 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -134,7 +134,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       }
>   
>       /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB4_ROOT_PORT);
> +    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> +                             PNV_PHB4_PEC_GET_CLASS(pec)->rp_model);
> +
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
> @@ -267,6 +269,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB4_VERSION;
>       pecc->num_phbs = pnv_pec_num_phbs;
> +    pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {

