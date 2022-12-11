Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FABF649662
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TJr-0005R2-O0; Sun, 11 Dec 2022 15:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TJp-0005Qq-UN
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:53:05 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TJo-00071x-Bh
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:53:05 -0500
Received: by mail-ej1-x62e.google.com with SMTP id kw15so23308792ejc.10
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iFHULDTanQ4i4cmzOgkuiI+yGO2lSz7h8RXzgTm0PGM=;
 b=g2M8sYoreouQu88WBRTlNrUmXhwg9Z9m+a/Pb81h2aDRWqIUjQOXBCwHa+HE6n+/gg
 94j7JAjqCE+22va+BvBF9IAut9y/WyCIBW4WHPPojmxQqXIH15OoZ9OPbS/2JNypOUA7
 Et+fS5+O9numDeOAPedvFXtLeRRnPJBc6Qit8p/NuC96BuOIQsiKyAO2k55zTsqRXiRU
 JtY3ij7deJZXjczm2hKmFvYCZoChs0mifxCu90OVEy1EKBkufSqPBxFbi3Fqo3sSlYve
 UzwHI4U5YKC9ktbKSE/lnFFmEuKQE91tGVc0R1klhJipG+YbXZSgJETkx7bUisOjnUds
 6Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iFHULDTanQ4i4cmzOgkuiI+yGO2lSz7h8RXzgTm0PGM=;
 b=mdpFX5MB9VpQxRKXxLgRbnTbnUC5+w20jkqsygT3N/xx9N8ROp1MFOC8Hi5JyHu1Ee
 CaMNwQibnmwCpvIyQEp2JqM6JZWF6w4JlMTHCQtQ8sgazlSa2rv4DzSMS0Co64RT6+jS
 28wYLVLjXGzgX41vg0AdkJxMfQkT4++Jfj64il9TVikvjpdBFut94NnlpkYzLPlGoOj6
 S6WcVvrnZCNHfAhgWmganNkxw0WgOHdAGSj+BWOfTxh+ovdcbxT2/xAsvPMlJH54fjYA
 Ag/DXtS+e1wdOuEIZMM2L7g7pLqiiRlkVIRhCF4NZ5BHgHIa71pBgw4EtEfN/edq6OWr
 wr+A==
X-Gm-Message-State: ANoB5pn5zmvrY9UmOLXCwP+eYychVg5uJxQ5EyzBBK4WAY1PmlgNuRYc
 dQw9VA+8pdoitI1sne3IBQ7x6M2WcCgaot8CzcY=
X-Google-Smtp-Source: AA0mqf7jwQRHiTUhJ0A6l5Vy4AdV+bIqUhMU99G64nqQZWi7r/e7mz+7x01nKiDcbB6im2DiW82pfA==
X-Received: by 2002:a17:906:2ada:b0:7c0:969a:ca7f with SMTP id
 m26-20020a1709062ada00b007c0969aca7fmr11102581eje.76.1670791982372; 
 Sun, 11 Dec 2022 12:53:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709065d1000b007adf2e4c6f7sm2416400ejt.195.2022.12.11.12.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 12:53:01 -0800 (PST)
Message-ID: <dc1751e4-221d-dd00-f1cb-feab1dc8f9eb@linaro.org>
Date: Sun, 11 Dec 2022 21:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 v2 01/11] hw/mips/bootloader: Handle buffers as
 opaque arrays
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211204533.85359-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/12/22 21:45, Philippe Mathieu-Daudé wrote:
> It is irrelevant to the API what the buffers to fill are made of.
> In particular, some MIPS ISA have 16-bit wide instructions.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c         | 55 +++++++++++++++++++++---------------
>   hw/mips/malta.c              | 19 +++++++------
>   include/hw/mips/bootloader.h | 10 +++----
>   3 files changed, 48 insertions(+), 36 deletions(-)


> diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
> index fffb0b7da8..c32f6c2835 100644
> --- a/include/hw/mips/bootloader.h
> +++ b/include/hw/mips/bootloader.h
> @@ -11,16 +11,16 @@
>   
>   #include "exec/cpu-defs.h"
>   
> -void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
> -void bl_gen_jump_kernel(uint32_t **p,
> +void bl_gen_jump_to(void **ptr, target_ulong jump_addr);
> +void bl_gen_jump_kernel(void **ptr,
>                           bool set_sp, target_ulong sp,
>                           bool set_a0, target_ulong a0,
>                           bool set_a1, target_ulong a1,
>                           bool set_a2, target_ulong a2,
>                           bool set_a3, target_ulong a3,
>                           target_ulong kernel_addr);
> -void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
> -void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
> -void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val);
> +void bl_gen_write_ulong(void **ptr, target_ulong addr, target_ulong val);
> +void bl_gen_write_u32(void **ptr, target_ulong addr, uint32_t val);
> +void bl_gen_write_u64(void **ptr, target_ulong addr, uint64_t val);

And I forgot to squash this...:

-- >8 --
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index edda87e23c..b6dd9fb200 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -323,7 +323,7 @@ static void boston_register_types(void)
  }
  type_init(boston_register_types)

-static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
+static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
  {
      uint64_t regaddr;

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 34befa5dd5..cfc8ca6ae4 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -179,7 +179,7 @@ static void write_bootloader(CPUMIPSState *env, 
uint8_t *base,
      /* Second part of the bootloader */
      p = (uint32_t *)(base + 0x040);

-    bl_gen_jump_kernel(&p,
+    bl_gen_jump_kernel((void **)&p,
                         true, ENVP_VADDR - 64,
                         true, 2, true, ENVP_VADDR,
                         true, ENVP_VADDR + 8,
---


