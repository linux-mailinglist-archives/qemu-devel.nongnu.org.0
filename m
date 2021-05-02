Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A87370E28
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:18:04 +0200 (CEST)
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFjH-0003aX-M6
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEyX-0002MC-4e; Sun, 02 May 2021 12:29:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEyV-0002l5-Bg; Sun, 02 May 2021 12:29:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l2so3105517wrm.9;
 Sun, 02 May 2021 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ztuz5YiSbZ1fTv9XeImd/FAzHR24zLpCN5PIot4YYTs=;
 b=FC/pC93MiaCLFHUEeW91mmeN7PEDaiXc7PUQ9boCINOJ87xT5hA1cv6LjBleTtOup6
 /A/rRIiWt7SqeRzfhcNxU1eKvtOzhVE76w8w6/QPFa0c3hYB6r4nYovAWyNyMb7oMNRJ
 EhJ1UykkRQySfOP5cYTdzf58qirTidugmJg2kynQLodGzybxxrAsoecMZEfyOoW/s1PC
 IYANQpLCMbE0AhfwIpE4J7BvmQ20yiR3Jh2PYuebcmiOAlC9ziU4UYOoDsp8dWeRH2xv
 orLS0h4a7sgrui6NNpDM7VBJ16FhOXMiBzIlWlKeplc/UnITt42M0T2A9ml6BY0k2Os5
 h2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ztuz5YiSbZ1fTv9XeImd/FAzHR24zLpCN5PIot4YYTs=;
 b=L2GPEcQq9csKkV9ZUaGU32ICfDQOj1URgJWo/Er9/uEE47jVroJSl1k4sFr861D9Y+
 FQdMjCHdFbksAlXzv4QYWNNCi1Y1X/8SlylZ47uCHmZqP1s8H8yuTprSS8i3Zr0X7UVd
 62mTGeGFbrzRLxOeKs8Ivhp2cgy35DDXphWYOJ2bPvh0aKDVxGuujo6etz4zU/hISF4I
 aw4Xrqk9z+0XYsRY0cOPnyu1l6qlJ+OKNPPE2vquI/tJksa1LS51i5Cyg+q2IJE0waex
 th2qZ21FKTu6pijmWwQH+1xRowZEX/nnmGqScePFP1fw79bclC/MnhDNGMiJIL6Daimt
 WFEw==
X-Gm-Message-State: AOAM530yFN69rspO88eo5iDH3qoAmhM/zqeqL0uLe98i3xpvCh8YqWKC
 0qY8RcqvbhfmTTs+ajiTFO4=
X-Google-Smtp-Source: ABdhPJz7+lOHU/y1zn7p7hjg+EGEOCp3tTrDGLwHLjATP456NdbRJM48TuQeFjw4uepSCoaYAdtPKg==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr20478181wrg.110.1619972981232; 
 Sun, 02 May 2021 09:29:41 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v17sm9069376wrd.89.2021.05.02.09.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 09:29:40 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for invalid
 RAM size
To: qemu-devel@nongnu.org
References: <20210407225608.1882855-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f7138901-3e7d-14ca-87a8-317089d51195@amsat.org>
Date: Sun, 2 May 2021 18:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407225608.1882855-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Could you take this patch via the ARM tree?
It has been reviewed twice.

Thanks,

Phil.

On 4/8/21 12:56 AM, Philippe Mathieu-Daudé wrote:
> The i.MX25 PDK board has 2 banks for SDRAM, each can
> address up to 256 MiB. So the total RAM usable for this
> board is 512M. When we ask for more we get a misleading
> error message:
> 
>   $ qemu-system-arm -M imx25-pdk -m 513M
>   qemu-system-arm: Invalid RAM size, should be 128 MiB
> 
> Update the error message to better match the reality:
> 
>   $ qemu-system-arm -M imx25-pdk -m 513M
>   qemu-system-arm: RAM size more than 512 MiB is not supported
> 
> Fixes: bf350daae02 ("arm/imx25_pdk: drop RAM size fixup")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/imx25_pdk.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 1c201d0d8ed..51fde71b1bd 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -67,7 +67,6 @@ static struct arm_boot_info imx25_pdk_binfo;
>  
>  static void imx25_pdk_init(MachineState *machine)
>  {
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      IMX25PDK *s = g_new0(IMX25PDK, 1);
>      unsigned int ram_size;
>      unsigned int alias_offset;
> @@ -79,8 +78,8 @@ static void imx25_pdk_init(MachineState *machine)
>  
>      /* We need to initialize our memory */
>      if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE)) {
> -        char *sz = size_to_str(mc->default_ram_size);
> -        error_report("Invalid RAM size, should be %s", sz);
> +        char *sz = size_to_str(FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
> +        error_report("RAM size more than %s is not supported", sz);
>          g_free(sz);
>          exit(EXIT_FAILURE);
>      }
> 

