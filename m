Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A962D915B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:15:31 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobWU-0004y4-Nj
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobUl-0004Yr-Jx
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:13:43 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobUk-0005U9-60
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:13:43 -0500
Received: by mail-wr1-x444.google.com with SMTP id d26so1498863wrb.12
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xwgg+27xCNsAE7K6AyWgVFKmwaevORvMH0pOZzdSQFY=;
 b=KNbZ7RAvymPwjOWgPehzQRkmZfD9UobI2oOMF8s5QTUTdnTmfY/x/PZMPdVR6An1ey
 tWM77C2YpvVgRkQ8SSdoQaZs8O/7FogAMcX6yQNaohduuQNHFcmhHHyebc6PoQMdRFPn
 7chbHOy8KoXkERmt6OIinp3Sg9hhx83IyquMfR6HrhQP7g8URVjbjVLrqtUeGNeqmREd
 UGTgX0gWH17FWnSlQnKzW/0vaKU3RfWcMhK0bMtLCBwvT09BXDZP+8qM/FMoOXgfejve
 iKjW0tDVhT7gndDYBuzFwgnJ1kWDHX0wwazvsecSCD/kwrzhf6EmapxoSq0DpuOAfPqS
 E2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xwgg+27xCNsAE7K6AyWgVFKmwaevORvMH0pOZzdSQFY=;
 b=lVTaol34fQo5Zps4gdVAUPtgGpal1D72pcVuORZ4qmjLdVupg8lFVA+4rjDcJY9L4z
 paJnixnOJ8UHpq7FQFyrBZZD12gCaeRRN88LME2nMzSxoobdxTDZ6XL8LdPnQby4QU5G
 eYe1cYcM3niU/rF/9zAmSpfk/5uU+zzZiiAXJoxir5i5WZWn9ccT7JHjcXKBJZopPWnD
 oJ6kVp6IzoWvGkE8wGjfwZVaZPGAPF7k/StY7jt30IZ5ZAxExPbhukFT7yGgnpMNFXOu
 RF5QhV47thAxsH/8n95MuxNrRIrJVeVJB82aUGA2P5PSQwSn+DIB4D6D+FOEoIyh14hK
 JfOA==
X-Gm-Message-State: AOAM5333uxiL6x4huiE2tiFfEjMYWscDyYj0zpeUYodYso0evAb+LuDS
 f2+OyoyDbAqwjwVN8Ex0NuY=
X-Google-Smtp-Source: ABdhPJzD0wfUdmofv+ZrC/+TtMebbCSeFheUn/B7VqG7FGWGJj9MRyQnQyZ0Spynn/Br7ZYUw1mZnQ==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr26247068wrn.12.1607904820621; 
 Sun, 13 Dec 2020 16:13:40 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n3sm29830460wrw.61.2020.12.13.16.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 16:13:39 -0800 (PST)
Subject: Re: [PATCH v4 6/6] linux-user: Add support for MIPS Loongson 2F/3A
To: qemu-devel@nongnu.org
References: <20201207224335.4030582-1-f4bug@amsat.org>
 <20201207224335.4030582-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <37eb459b-ba47-955b-072a-5605d97e4a50@amsat.org>
Date: Mon, 14 Dec 2020 01:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207224335.4030582-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 11:43 PM, Philippe Mathieu-Daudé wrote:
> Userland ELF binaries using Loongson SIMD instructions have the
> HWCAP_LOONGSON_MMI bit set [1].
> Binaries compiled for LLoongson 3A [2] have the HWCAP_LOONGSON_EXT

Bah... Yet another typo "LLoongson" -> "Loongson".

> bit set for the LQ / SQ instructions.
> 
> [1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
> [2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 0836e72b5ac..a64050713f2 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1024,6 +1024,8 @@ static uint32_t get_elf_hwcap(void)
>      GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
>                          2, HWCAP_MIPS_R6);
>      GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
> +    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
> +    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
>  
>      return hwcaps;
>  }
> 

