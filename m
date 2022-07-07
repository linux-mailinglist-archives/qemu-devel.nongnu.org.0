Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A621556970B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 02:52:04 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9FkR-00032P-8c
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 20:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fiw-00027x-7h
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:50:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fiu-0007FV-Gr
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:50:29 -0400
Received: by mail-pg1-x534.google.com with SMTP id s27so15601163pga.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TKrRWw4y10h+lUHhLI0L6+jdVBeraEO+YeqFH8sCyuI=;
 b=IZhkIU8NmgqEUaTpDHwEuKxxgLKK7n3Duoh+At+Nf+0L/IXJ0QbsrA0dkTf+ROvepX
 faIToGVuNTfCr51G+jW8vWlFs5i3l/30utcGeRGOg0LK7KndZqYaR7H6C+hx6MHiXNF3
 Sgq8VyA0lUa668V8tL2WiSVudbZNcQzTe1IDV+m/jj5amEfwQcOH4B6nRZJ4eE0RPkDd
 oY+600zZ/8gGaYWQYlxBr6e3AnEebxThwFE7AJbtw/ybkOggCc+9ecp+yhab6ilE63F5
 DrjAuG8y1L8MB0fzSDXOTIROSE+QiQICmcwDNJfBHLD61Drv35VWtryTZWanVpBb9330
 DE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TKrRWw4y10h+lUHhLI0L6+jdVBeraEO+YeqFH8sCyuI=;
 b=2n0EWEvfcs0s/GNKfpV4GtirKKzy2erq3afzB4oHyGT8YvkWDlfZ1a208837eEyHYy
 AGBGv4IOE/gJzPLY5BY5DebZlSuq6NFh8413hDISDktvVTfd300xxjk5XUlUWWywPXCE
 XduGfPv+yH3DM+1Ddg6F4zT6j2WI7pITm/CvSUpWQB2gG/vH6H2/8IFbZHp4NrdzHE7M
 CLWdW+Cuww/WqkxDd7Y204azajDgJPqMkP/SokBqnj00J9SNQ0LVoZJFgFoB05LtbFAM
 /NLUbGome2ealArdr9uNYebSsmPTjOn63w4nejjM9rYDGmTPPUUL5qvO7wJRTCd8rA37
 h5+w==
X-Gm-Message-State: AJIora+Ym9ss4XUgq9TMTpPu41Epao/j6lEbc53Ru+PsVEJS2hAKyLV0
 NuS3/YCkyQWnTX+xReOtVCMgGw==
X-Google-Smtp-Source: AGRyM1vXawGLPH5kay+Fe6uOmf5K9l4sOKSDrF6RInkhGwp3EgbNrcxlBeUFPTCPNAuauhbdw72NZg==
X-Received: by 2002:a17:902:bb90:b0:16b:8a74:3aad with SMTP id
 m16-20020a170902bb9000b0016b8a743aadmr49524582pls.47.1657155026896; 
 Wed, 06 Jul 2022 17:50:26 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a17090322d200b0016bdc98730bsm8601539plg.151.2022.07.06.17.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 17:50:26 -0700 (PDT)
Message-ID: <4b139900-ba8a-e2c5-217f-f73268f33ce9@linaro.org>
Date: Thu, 7 Jul 2022 06:20:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/2] M68k for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220706114013.340537-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220706114013.340537-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/6/22 17:10, Laurent Vivier wrote:
> The following changes since commit 180c2f24d5e8eada41e012a3899d29bb695aae06:
> 
>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-06 10:41:34 +0530)
> 
> are available in the Git repository at:
> 
>    https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.1-pull-request
> 
> for you to fetch changes up to a988465d0eb7e2ee31a3679bbe3fbe71681820da:
> 
>    m68k: virt: pass RNG seed via bootinfo block (2022-07-06 12:30:41 +0200)
> 
> ----------------------------------------------------------------
> Pull request m68k 20220706
> 
> pass RNG seed via bootinfo block

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Jason A. Donenfeld (2):
>    m68k: use correct variable name in boot info string macro
>    m68k: virt: pass RNG seed via bootinfo block
> 
>   hw/m68k/bootinfo.h                             | 18 +++++++++++++++++-
>   .../standard-headers/asm-m68k/bootinfo-virt.h  |  1 +
>   hw/m68k/virt.c                                 |  7 +++++++
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 


