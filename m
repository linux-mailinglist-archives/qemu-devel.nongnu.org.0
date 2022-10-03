Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB95F38B8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:19:21 +0200 (CEST)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTmS-0007Wi-WB
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSea-0000cI-7z; Mon, 03 Oct 2022 17:07:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSeY-0000l7-9o; Mon, 03 Oct 2022 17:07:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x32-20020a17090a38a300b00209dced49cfso8453649pjb.0; 
 Mon, 03 Oct 2022 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=JcZFlUWoxcBk5eMSxZ8K4jVmNSa50VoIBjQxUhPCAC0=;
 b=lj2St/LcZRC3bntHx3ylC8SfSokw5OKwiqi6zHmr5h0RqbG9ADPe6D9oh9snyR0y/T
 w9M00ksjn1P6RcrkbiQDY6aVrAlOtUS44M9uzVqhdenBKzQtOFLQDed+NA+1ey7/autG
 +lM9mJRb7dth6eDf6oIlXKpdtJAbGVB+5dh/os8Csnrc/et0dGGYh7zxghk7t/k51OCz
 5npWhizzrZIq5gsSmedxOAZbL8LqY1VW//Ls3LF24MlURbrR84ZYDWqPs38q4R6DYj0f
 6F5VxN6H2neiHJYSQXIMf2lgYst6cc7TRdUjzyrx/Gm+YSaCSlkuT9XMQFD1XCGDPAk6
 Cw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=JcZFlUWoxcBk5eMSxZ8K4jVmNSa50VoIBjQxUhPCAC0=;
 b=4BmZN/+kpIDbHpOS4Xes5xEJ6PzlLVnQDqHy091mf4qoTgI6JgXXmPn4wamYsjVg+g
 34Q1OjIHBBR4VE/7EK0tkNjQPuPv2I0svUTzi0OXIx4n3rdxTkerYN54Km4fvvHDuVZ5
 4b/1IhKP+PEcuuPb/JthxIlV4PRkmw10Uure9WXoVhoySaJTbMpS0F/ixkGuQSMeHiVQ
 RPWD6qqlHmO7kNIXCZ4NKXMAktmdEXQnyQdb59/vBswL1SubcrMMpo/fmjN2tK3asvtI
 DikINT3u/05OG1qpGZbEnQKFjo/6Z0TRB42S4aRmTvRuZNXM9swVGkKUiG0xAOucKlUB
 gs+w==
X-Gm-Message-State: ACrzQf1NRqlJDWNKz+wg3fESf9dqzastyJvuCGJkEvkK8tfNmn8S6REV
 Z9G5DiJmdnWEny/QnpdcjiQ=
X-Google-Smtp-Source: AMsMyM7FXcoiNbljmNAVr3Dz+LroLACX5uj55bNbRTMZDObimHyfBGCiSvwJriK5asY18WlIcawZQQ==
X-Received: by 2002:a17:90a:70cd:b0:205:e3ed:32d7 with SMTP id
 a13-20020a17090a70cd00b00205e3ed32d7mr14079990pjm.9.1664831223337; 
 Mon, 03 Oct 2022 14:07:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090332c200b00176b5035045sm7688546plr.202.2022.10.03.14.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 14:07:02 -0700 (PDT)
Message-ID: <69fadeb6-ff4d-c327-5716-5a416bf96c20@amsat.org>
Date: Mon, 3 Oct 2022 23:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 13/13] hw/ppc/e500: Add Freescale eSDHC to e500 boards
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-14-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/10/22 22:31, Bernhard Beschow wrote:
> Adds missing functionality to emulated e500 SOCs which increases the
> chance of given "real" firmware images to access SD cards.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/ppc/ppce500.rst | 13 +++++++++++++
>   hw/ppc/Kconfig              |  1 +
>   hw/ppc/e500.c               | 31 ++++++++++++++++++++++++++++++-
>   3 files changed, 44 insertions(+), 1 deletion(-)

> +static void dt_sdhc_create(void *fdt, const char *parent, const char *mpic)
> +{
> +    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
> +    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
> +    int irq = MPC85XX_ESDHC_IRQ;

Why not pass these 3 variable as argument?

> +    g_autofree char *name = NULL;
> +
> +    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
> +    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
> +    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
> +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
> +    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
> +}
>   
>   typedef struct PlatformDevtreeData {
>       void *fdt;
> @@ -553,6 +573,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>   
>       dt_rtc_create(fdt, "i2c", "rtc");
>   
> +    /* sdhc */
> +    dt_sdhc_create(fdt, soc, mpic);
>   

