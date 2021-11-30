Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF924640CE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 22:54:19 +0100 (CET)
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msB4r-0002qf-RT
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 16:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msB35-0001MQ-9X
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:52:28 -0500
Received: from [2a00:1450:4864:20::42d] (port=42846
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msB33-0007uD-L8
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:52:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c4so47505608wrd.9
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 13:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LgHoviiLOzg3guFZmmBsIkDr4z2Gqcb2+I3ReyAGEBE=;
 b=NTHucoizNd2fay7t4HQF9Ecx1T2JUT8Lhrraa+1WvJihfIJTadExMrYo5/FiY2xqWx
 gCoeYytcYpKsAVJBZPzFZ0+yq6Bt44POmDITINL3f9oUScpaqr+5lb6OptKiYG8sEWOj
 j2WqBE3oAITzqcLlkACgKdbIq/wHpcN9GUNpDrn6Z9SjIThO4ophGdebo2Q2Rp30xBhG
 DgRhtYuqYi4a6i7jEBKeFIYX6Ge03EKIVLOizpL2bBsU+21pnwt3XFtpTlnsOKa/wwPr
 5qVkfHtP8ZXC2jR3irZKrWaDVud77TbDfWvNgoCKXNSLAUGNtF0ZPplv1XvUSs2bAmp3
 vvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LgHoviiLOzg3guFZmmBsIkDr4z2Gqcb2+I3ReyAGEBE=;
 b=2KgQ0gkX/uGFFl3atfd6T1O13OtWFaBsSz+HveKQfzX4/5zj8qcyhu9E6s7BVqdyi0
 VsmyDG8hRGjakIPYjdA1ADIqnECprgMnIOwuiNTi1UWxwu58Zyj2at5AQW9roQQLKC8W
 teFIHwUnGhnhmVfP9cWVpzGgO2pOp48cLHIZRKykzglbbd8ntgJEkA0lX/MTylKjJ/W/
 RKAYC5SNc5cYZ8ssIIwPp+D8KiuVTVi+isw9U1qUofMieSWKLqEm7TUKNWTL+WgVur7H
 Ck6ljzpiXttxX9H1dcWCNp8V1kcyJ5vOjpByT5k0TAGEAt23y3bgp4GSb9L0zpv7A57p
 UkEw==
X-Gm-Message-State: AOAM532eHeTLWQCX/hQC4xkqZiDxgBzMTt9N5qrU6Qnh+nanMKXgOBSO
 Y6THtis/M7mYA0YDoOr2IoE=
X-Google-Smtp-Source: ABdhPJwTI/b3pg1bdZZzGbVVA8tTzNslcjuuGARHjYNxGwJnE5l9OLpHUjN/7uvmLPjKBL+QF9h31w==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr1759452wrz.545.1638309144064; 
 Tue, 30 Nov 2021 13:52:24 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id s8sm17509354wro.19.2021.11.30.13.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 13:52:23 -0800 (PST)
Message-ID: <f6d41700-94fa-d8bf-bc54-a842f0cd4873@amsat.org>
Date: Tue, 30 Nov 2021 22:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] hw/mips: bootloader: Fix write_ulong
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
 <20211130211729.7116-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211130211729.7116-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.211,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 22:17, Jiaxun Yang wrote:
> bl_gen_write_ulong uses sd for both 32 and 64 bit CPU,
> while sd is illegal on 32 bit CPUs.
> 
> Replace sd with sw on 32bit CPUs.
> 
> Fixes: 3ebbf86 ("hw/mips: Add a bootloader helper")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Should be backported to 6.0 onwards.
> ---
>  hw/mips/bootloader.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 6ec8314490..99991f8b2b 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -182,7 +182,11 @@ void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
>  {
>      bl_gen_load_ulong(p, BL_REG_K0, val);
>      bl_gen_load_ulong(p, BL_REG_K1, addr);
> -    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
> +    if (bootcpu_supports_isa(ISA_MIPS3)) {
> +        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
> +    } else {
> +        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
> +    }

We have bl_gen_load_ulong(); having bl_gen_store_ulong()
would make the API even. Mind sending a patch? Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  }
>  
>  void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
> 

