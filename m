Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9C2DC70A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:26:28 +0100 (CET)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcRP-0000Ja-T5
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcGd-0000pP-L7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:15:27 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:41179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcGZ-0008Dz-Lg
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:15:19 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id q6so5235530ooo.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M/hc/Jin8uCGooacHBaupSqJFKga/5DqgwVtz5F0MsY=;
 b=L2NSOewipBX2Ph5UKi5qPwBXVEulHHurk3368N081YmQTQYY2fF+EFwLVIJZ/d6B2k
 SUcnjeqY6g+LyVKCgZifGtvEx/m3ezHIiWbM71AlgrHLuLNuZ2CH4j/x5CSXX7YYDipy
 PWytk5gCE6RdOOiK0AEu6/x1TUE1nnljAWnVTVI1adnxvvCdvOZHQhGwWlj5tnPWAVS5
 x655GnrP3/8cwZa9SNUj0aug3eIeHXNZmMVDFByWhFSbJTIHnkN76IcCEe9LfOrtEKvG
 H9ri3RV0ktmXwJrgSqtzfhKeYwHS3BXlskFLoEsgW99ASIvbrID1CZlBPhIYv7apdyrf
 teQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M/hc/Jin8uCGooacHBaupSqJFKga/5DqgwVtz5F0MsY=;
 b=IunAr3icxRmLRuTrI4c/B3ExlIq1W9rHWRrmXD1+JlC/n9tMJLLkAAig57rjxuenTX
 oPFfh1g3YmVF7q5asWpHw7mia2JY6JFmZ2UF9khRhuLCzBYEzB8/CDEPYdYu3BX2CfLm
 xFKiDTkEtZ1Ve+I9cbVclhnFmnT4fQGksxlBOMjGL4bvLHkGH1MI5jX0WUv6dzLxvNp1
 lbiF3kengavyY1YxOy73Ced4nwCm/F8p4SnFJrJpTS+w9/ka2jU0lQWrEcoE0RPUC7M2
 v7jT25pd+05zPpMLaWkRvTjQ5ibWmdxCJBTQpM1rkosT2TZXkbTdyTDbDp6zgOAS8Hkf
 TNcA==
X-Gm-Message-State: AOAM532xv39GYXUxGLZ51w2hUGyKcvaJm5kuDsvcJy/pEQVdtyWI1Zmm
 Y3wrQAlMgHFIqWc92dniEmozAw==
X-Google-Smtp-Source: ABdhPJxyoElMHbLjEApleAgIBIrzHrqqcMtZQ8+tVEnU6zx1AR1Z+SqL6mf3DxTQcljedO38ohL0FQ==
X-Received: by 2002:a4a:c191:: with SMTP id w17mr7208461oop.1.1608146114378;
 Wed, 16 Dec 2020 11:15:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k10sm636045otn.71.2020.12.16.11.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:15:13 -0800 (PST)
Subject: Re: [PATCH v2 12/12] target/mips/mips-defs: Rename ISA_MIPS32R6 as
 ISA_MIPS_R6
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <811b7cf0-c17f-17e9-7ea5-3784b875733c@linaro.org>
Date: Wed, 16 Dec 2020 13:15:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> The MIPS ISA release 6 is common to 32/64-bit CPUs.
> 
> To avoid holes in the insn_flags type, update the
> definition with the next available bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h     |   4 +-
>  target/mips/mips-defs.h    |   4 +-
>  linux-user/elfload.c       |   2 +-
>  linux-user/mips/cpu_loop.c |   2 +-
>  target/mips/cp0_helper.c   |  18 +-
>  target/mips/cpu.c          |  10 +-
>  target/mips/fpu_helper.c   |   4 +-
>  target/mips/tlb_helper.c   |   6 +-
>  target/mips/translate.c    | 426 ++++++++++++++++++-------------------
>  9 files changed, 238 insertions(+), 238 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


