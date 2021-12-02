Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11F466984
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:58:24 +0100 (CET)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqLf-0002z1-AT
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msq1I-0002MT-PS; Thu, 02 Dec 2021 12:37:23 -0500
Received: from [2607:f8b0:4864:20::833] (port=34669
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msq1H-0008Hx-Dr; Thu, 02 Dec 2021 12:37:20 -0500
Received: by mail-qt1-x833.google.com with SMTP id o17so522350qtk.1;
 Thu, 02 Dec 2021 09:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=spHhGpgvG5GOc965JBN9w9au9qbZvILlfJf9sOHhBZA=;
 b=puqh5Ze2NxJqqr15kxHDQzjXzJi4KdeEzXFEc+ELtCIG6D9u9+TEGanI5hTiSvLoRl
 zGIGEySy1fEASMa5I4GZ212emmrpZJvvJZi3PoXwF6DP33ljtD6+ON5E5PwJfP48PDkv
 kPuOkMmjpKREM/5YlBph3WubozEw/ECT5kWxhHvrNgGvYJ8ZrUq8eIDnb0eJ2Du+zvXU
 Tk0QVCB83JniR+jargd3aOU/9j60E38jd3o3px6w9Xhd9X1V1/kK0nIpwyo7aRqQ9Evz
 Dk7ZSH+TBDuczfKu8PSEqI4BAsu7CAeeDB/Ra6AXuVJlRdhi+zxbvcnLfpH5jo/l72VD
 +TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=spHhGpgvG5GOc965JBN9w9au9qbZvILlfJf9sOHhBZA=;
 b=AFxpPuurbj6vEn9/WL9agUft6EMIrUPTklObgB0JXNEiMD0yRiUAHFbJb5S5KY4ZkI
 7sl7SNIkqzDKDROXDCZIwFCamAtYxYtqiseCbXZ1VXBDb2UkVKPcAgMDws82NWlt7hkG
 8Ap1RFpZCoJxJ6FFKeSbgaa0V76z1RVWeQQq5kLofNcoFxzWqec2Ck85xLk2AKZiyIHA
 cMXCkclj9BNsjN4MVF8uEPB6ZdM1kQJqCQtX6rfSi0f9BwMgc/uGlhW5xpHNO/qHFzus
 DyImTgcy7GRy0XlZeABV/a06CvoofR4ul1KVOAGM7JOj2OWt8TjoWqZIpXN7KoGBndwa
 meqQ==
X-Gm-Message-State: AOAM533YDuidu7r16uycWzb+IgISMcx8CQHjy1wo2HEV5XKCRsOzKubK
 8KIbJYigex8ePRGs3W2aEwk=
X-Google-Smtp-Source: ABdhPJydviNxO0XYbWc4HSz2Go4jnxOFw8i2sCkPxO/M7aKStWN8ugqb2JJPrMJa0LDYg7L5yGT3pQ==
X-Received: by 2002:a05:622a:2d6:: with SMTP id
 a22mr15281940qtx.29.1638466638352; 
 Thu, 02 Dec 2021 09:37:18 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id bl16sm337795qkb.44.2021.12.02.09.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:37:18 -0800 (PST)
Message-ID: <44c311af-da58-c72c-26f1-50774a390776@gmail.com>
Date: Thu, 2 Dec 2021 14:37:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/14] ppc/pnv: Introduce version and device_id class
 atributes for PHB4 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-9-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-9-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/2/21 11:42, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h | 2 ++
>   hw/pci-host/pnv_phb4_pec.c     | 2 ++
>   hw/ppc/pnv.c                   | 4 ++--
>   3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 27556ae53425..b2864233641e 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -219,6 +219,8 @@ struct PnvPhb4PecClass {
>       int compat_size;
>       const char *stk_compat;
>       int stk_compat_size;
> +    uint64_t version;
> +    uint64_t device_id;
>   };
>   
>   #endif /* PCI_HOST_PNV_PHB4_H */
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 741ddc90ed8d..9f722729ac50 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -499,6 +499,8 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->compat_size = sizeof(compat);
>       pecc->stk_compat = stk_compat;
>       pecc->stk_compat_size = sizeof(stk_compat);
> +    pecc->version = PNV_PHB4_VERSION;
> +    pecc->device_id = PNV_PHB4_DEVICE_ID;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 185464a1d443..0c65e1e88cf5 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1408,9 +1408,9 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>               object_property_set_int(obj, "index", phb_id, &error_fatal);
>               object_property_set_int(obj, "chip-id", chip->chip_id,
>                                       &error_fatal);
> -            object_property_set_int(obj, "version", PNV_PHB4_VERSION,
> +            object_property_set_int(obj, "version", pecc->version,
>                                       &error_fatal);
> -            object_property_set_int(obj, "device-id", PNV_PHB4_DEVICE_ID,
> +            object_property_set_int(obj, "device-id", pecc->device_id,
>                                       &error_fatal);
>               object_property_set_link(obj, "stack", OBJECT(stack),
>                                        &error_abort);
> 

