Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB0466959
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:45:15 +0100 (CET)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msq8w-0000SP-D2
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:45:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msq1u-0002m6-Nc; Thu, 02 Dec 2021 12:37:59 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=34742
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msq1s-0008KO-9z; Thu, 02 Dec 2021 12:37:58 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id i13so204455qvm.1;
 Thu, 02 Dec 2021 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eDf3f62VaBkqVCie+mhEQ/I+FWhalDbAOxq410eSMwo=;
 b=qRnn39IB7Oqp4V33e+hNv+iy7UQVbjP7Lseu5G4WUUvyGt9Jo5znFJUbYOQfoARjMg
 lsTx8un1++KrryXGkCCMoWIrSEYecesQ0iGucz6xvr0/w/TmqdRskn9E/oTQnHZvJqv6
 V+L9aD43/wMSnF/E8uhjRV+79w3E1Xa7H/oL9iBfodudxjG5D/dhy+5MARFMcRW2pwUt
 Tw1QVfiVDYsbjz3wcF+w2kxEbSogtssrsAMqJc41yV1MpB8ID6Gh7fiMbFzKy+oONNxS
 YLW3IQg0+U6P0qHskMtCOahDLlqsqX7Re9RgTkTdVYVpIBaKn7RqrJDpi9HdO6+Msz38
 1szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eDf3f62VaBkqVCie+mhEQ/I+FWhalDbAOxq410eSMwo=;
 b=zn3zvrGzakucm3KCaXa0utw2/+PZfaJZH947/VniCB+IuFpvVjL3iSXADz6sZRG4Sn
 EAapyMyG2kbHXFv5TTwJ9lNEsS8/KP8nm3S+J699i8960oWGLn+5mB3iNgbTVe+4CJ69
 ncmLe0tRV/yzW3Rm2Xuf62iyCRltFIKYwHK8K9WCknHUX26oCY5Zz/qx14gL2sMVVIWd
 kEUsVGJKAPVMR7ou8MabbuAiAvwLD63G3ZfKImwwtl8ERvWNf0MjX8WSuYw9sv8x2/f7
 9XDV2Ufyj9Dh+DzII99FU9lJQyAZQHZ9sETTkOXKLO2UWwdu+5S2Ypbnx7/wyp5gnncL
 it6Q==
X-Gm-Message-State: AOAM531SgAHkmIc0dSsa7rS/piU8lRVliMIqf9POhDKajKeU3pwmWnZE
 pO07cggwZ2Ar/iATSVZlyE8=
X-Google-Smtp-Source: ABdhPJxqYg0jGiYYK80e2Sxb17WF1Kbx9JtpAKnD8+PS9bxZwIsFuQLjGq8KPCG0pUFenCbN3NpGcQ==
X-Received: by 2002:a0c:f205:: with SMTP id h5mr14436953qvk.128.1638466675202; 
 Thu, 02 Dec 2021 09:37:55 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id d5sm289167qte.27.2021.12.02.09.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:37:55 -0800 (PST)
Message-ID: <8805557b-37ac-65d3-09da-e10eff83af54@gmail.com>
Date: Thu, 2 Dec 2021 14:37:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 09/14] ppc/pnv: Introduce a "chip" property under the PHB4
 model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-10-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-10-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
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
> Next changes will make use of it.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h | 2 ++
>   hw/pci-host/pnv_phb4_pec.c     | 2 ++
>   hw/ppc/pnv.c                   | 2 ++
>   3 files changed, 6 insertions(+)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b2864233641e..8a585c9a42f7 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -205,6 +205,8 @@ struct PnvPhb4PecState {
>       #define PHB4_PEC_MAX_STACKS     3
>       uint32_t num_stacks;
>       PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
> +
> +    PnvChip *chip;
>   };
>   
>   
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 9f722729ac50..e9750c41c595 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -462,6 +462,8 @@ static Property pnv_pec_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
>           DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
> +        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
> +                         PnvChip *),
>           DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
>           DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 0c65e1e88cf5..76b2f5468b38 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1389,6 +1389,8 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>                                   &error_fatal);
>           object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
>                                   &error_fatal);
> +        object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
> +                                 &error_fatal);
>           object_property_set_link(OBJECT(pec), "system-memory",
>                                    OBJECT(get_system_memory()), &error_abort);
>           if (!qdev_realize(DEVICE(pec), NULL, errp)) {
> 

