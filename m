Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E297A5F6536
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:29:20 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogP42-0005iI-R2
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOnA-0006Id-Rw
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:11:53 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOn9-0005FA-5b
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:11:52 -0400
Received: by mail-pl1-x634.google.com with SMTP id u24so1376056plq.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=MPT1EYdfeNd4OoMKMaStZVJAzd1uDjGi22YDHHeg934=;
 b=Y5eJG41ObgNO1/FlNBt41SV9OZz4k7+q/rhGdnsdiVZNM79VMZgf8q8fHbFA4Yc7aT
 g3Ne/UxyL8ACR9w8xEkJ650Z8O7ek7iK6jmSaNTRTndR/gqAHXgVGW7SAkeVpnxdnuxH
 FfEQy/gPJJhtYn8AB9ZYhVLYCaydP2+u4uiUi55V529JirmFXQoEt1OQVbUGsrUhrqQK
 Y65V6fgrYYpf2k98nQaPQf2/o3KVSdgC1cDdU+jS6Y4GZMrGeQ8kbHBMyiak0ERLtR1s
 M4FrJjBo8Flio9/olY7ARsyolOl4wcGPpIP4TQa0TlniXvppaGFv1g3ZCBneaMEMAPIL
 oWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPT1EYdfeNd4OoMKMaStZVJAzd1uDjGi22YDHHeg934=;
 b=vifJMYm6slffOL+B8JgWOV7bVLN481/b9mT563gfh4MlDtnjyC2Ql30fh+9bAuyJvo
 VhJnzP/Ul8tSxvjvirV/pzT5AgOoq2ote4o3e5gewQgRoD3qD+L2g9+LPTCBykAqXiEq
 iKabbcafLBrZdHq1WuMENKRLimvMURG9QrosO6eRcoRM6ddF3KQy6pk0YZRVkFBKQULX
 jH/gQN5BQztZLMZI9nIP3etxE76S2tfwK79KT/JgqLDp4tNJ9rb3FwE22NaUBI4q0Myk
 aAIgc2ggEqKj355dPWhq9+D07RVLJDE8quXwrJlw9Yq5IOO9qzanQIxGh1Dmvkk+BZmK
 9q7g==
X-Gm-Message-State: ACrzQf3+I34dOXNKuUpLrsd0FaijfXH5mwGEdAdXn2bkCtEsLeMIJlpx
 wS6yvGpAJlzJxJaCnBR/kA0=
X-Google-Smtp-Source: AMsMyM70L7/kwIUR3ch7L6LudVLz0DHZbUk8oyBfHWFQ0HI58pBV/iN6s3rCFqtuQ5lQbeJlk057Zg==
X-Received: by 2002:a17:90b:3ec6:b0:20a:eb6b:c832 with SMTP id
 rm6-20020a17090b3ec600b0020aeb6bc832mr8594738pjb.22.1665054708801; 
 Thu, 06 Oct 2022 04:11:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090302cd00b00172dc6e1916sm12060600plk.220.2022.10.06.04.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 04:11:48 -0700 (PDT)
Message-ID: <a41ded5c-3b98-3a75-1dc0-6c5caaad9a9c@amsat.org>
Date: Thu, 6 Oct 2022 13:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH RESEND] linux-user: Fix struct statfs ABI on loongarch64
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>
References: <20221006100710.427252-1-xen0n@gentoo.org>
In-Reply-To: <20221006100710.427252-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
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

On 6/10/22 12:07, WANG Xuerui wrote:
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
> // Example output on my amd64 box, with the test binary residing on a
> // btrfs partition.
> 
> // Native and emulated output after the fix:
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
> 
> Resend with amended commit message to 100% clarify the example output
> are generated on my box and will differ for everyone else. Sorry for
> the noise.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


