Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F605F6533
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:27:57 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogP2h-0003sV-Uf
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOmf-0005lb-VV
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:11:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOmd-0005B9-5o
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:11:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id z20so1387106plb.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OV+VGRdpcesDMQSMVQLcI8Tiiu+Bjo9aMiqjqYsa1Lg=;
 b=GOaJNC/bDX8rOBihLdc/A9QPhv6m8hTc2URcmvVYaNhD/FWYrL+9rg6gJuF8MLJ29j
 iKyRbShfcCwG/xCh6nX619EbD0MGtY1Ei93Y2shcA8MdlRTR2wgtUEFTDRJF7twku4rq
 kF2RzqSJwk60YRE4PDXelh9sQ+YauZNAc4kr5zMixGpqp/2Vm6OEeeh8+PlwrPrbWvG/
 +IgtiGq6eHAD8MwE1222WOl9bdKLuVfQhNn3sBgwA7F6BzZz4R9nTW3p7bL2UQoIIQdF
 Qil7MUA8CEa8wx4AK8r0vWT7Ullq6hG01AlEGA63HuKftMn9s3Id2i2siWs8suqxcmFX
 5Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OV+VGRdpcesDMQSMVQLcI8Tiiu+Bjo9aMiqjqYsa1Lg=;
 b=kZzJWYvH92ZK+NFLwLtXgkSSQWR5LyF3VApE6Fe5YWcvPBoUxjQexFGwLCJ7TM0dJA
 JgHgVIGxX5z6HblfmvxOfPOlnFJ5r8GPp1flhMxtkOv0qe6NmGsA84vyv35wMViUBOfW
 TDSENxo8awEQEeMMSGgL5HqCycr4oVepsGBkedOjLKIMFhdN6x+pqttu0jAKiPEhPQ3Q
 z/s5reioXK62cWXXUoElMEE3YwTGjdsBEUPzLDTjRBJKDazyuK8baPrjBX+INA+KkzhQ
 nQCv2rLj3XhTxKo0sWB2DZxyl5MR1i1Y6i9FfJvPWLrS+fYBQkbPJ1dh3yW49cUjOj/w
 DVxQ==
X-Gm-Message-State: ACrzQf166Uxn9nGuO3lwSrJMiwo/jrq/utvMAFCK6WCXZNWx9faL/Ppk
 nGel2aKcdtRiqYUwlQCSU+s=
X-Google-Smtp-Source: AMsMyM4sHDuNgjKSzjJkrGorVibrIc33OoPol2nckhOlq3U0VTIHCCaeXB7QvajDgGGVekVC25g+yA==
X-Received: by 2002:a17:902:d2ce:b0:178:7b5:c070 with SMTP id
 n14-20020a170902d2ce00b0017807b5c070mr4133814plc.58.1665054676404; 
 Thu, 06 Oct 2022 04:11:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c135-20020a624e8d000000b0054223a0185asm12552935pfb.161.2022.10.06.04.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 04:11:15 -0700 (PDT)
Message-ID: <df459320-b0b5-6a59-5b2b-f320a72d8351@amsat.org>
Date: Thu, 6 Oct 2022 13:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] linux-user: Fix struct statfs ABI on loongarch64
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>
References: <20221006095839.425262-1-xen0n@gentoo.org>
In-Reply-To: <20221006095839.425262-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.435,
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

On 6/10/22 11:58, WANG Xuerui wrote:
> Previously the 32-bit version was incorrectly chosen, leading to funny
> but incorrect output from e.g. df(1). Simply select the version
> corresponding to the 64-bit asm-generic definition.
> 
> For reference, this program should produce the same output no matter
> natively compiled or not, for loongarch64 or not:
> 
> ```c
> #include <stdio.h>
> #include <sys/statfs.h>
> 
> int main(int argc, const char *argv[])
> {
>    struct statfs b;
>    if (statfs(argv[0], &b))
>      return 1;
> 
>    printf("f_type = 0x%lx\n", b.f_type);
>    printf("f_bsize = %ld\n", b.f_bsize);
>    printf("f_blocks = %ld\n", b.f_blocks);
>    printf("f_bfree = %ld\n", b.f_bfree);
>    printf("f_bavail = %ld\n", b.f_bavail);
> 
>    return 0;
> }
> 
> // Native and expected emulated output after the fix:
> //
> // f_type = 0x9123683e
> // f_bsize = 4096
> // f_blocks = 268435456
> // f_bfree = 168406890
> // f_bavail = 168355058
> 
> // Output before the fix, note the messed layout:
> //
> // f_type = 0x10009123683e
> // f_bsize = 723302085239504896
> // f_blocks = 168355058
> // f_bfree = 2250817541779750912
> // f_bavail = 1099229433104
> ```
> 
> Fixes: 1f63019632 ("linux-user: Add LoongArch syscall support")
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Song Gao <gaosong@loongson.cn>
> Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
> ---
>   linux-user/syscall_defs.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 01ee10a88f..77864de57f 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2262,7 +2262,8 @@ struct target_statfs64 {
>   };
>   #elif (defined(TARGET_PPC64) || defined(TARGET_X86_64) || \
>          defined(TARGET_SPARC64) || defined(TARGET_AARCH64) || \
> -       defined(TARGET_RISCV)) && !defined(TARGET_ABI32)
> +       defined(TARGET_RISCV) || defined(TARGET_LOONGARCH64)) && \
> +       !defined(TARGET_ABI32)
>   struct target_statfs {
>   	abi_long f_type;
>   	abi_long f_bsize;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


