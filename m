Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F532EC2DC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:59:51 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxD66-0001WY-Fs
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxD39-0008J4-ID
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:56:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxD38-0005p8-1w
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:56:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a12so3200267wrv.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PuC5w7yutEE/j/EXzpLsLyeWupqExzY0jhrQouz6Hx8=;
 b=dR42PmhIgiewAdMMNgaoVg1/kd3w838rtpntt+eF6jj89zYc1Ww9H3PgOjy5m64t7Y
 /qzZIic28W5q+ywBx4FQkbuISD1A3lorzz2vC1cR2mgabYcwuvo+l+1hyUDy++x+zJQO
 MYUQgXk78UjTGFPdybKBX6BxtYCKdGGcqcrLZINH9+6EKA242t9lAmBGnkBmbRM26+LD
 /aYrG6Z8GujdbTPJz94HzBxy3tm6z0Xsxm0kulGXtKcO3O6DHPSX5kdvtZsxML0eaSqc
 vKhfTWsXpJN2UpgU36z0fDJC1cF1tNp5V7UwFok0YqduuxXy4X+LEuKB/920kHqShMyp
 jUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PuC5w7yutEE/j/EXzpLsLyeWupqExzY0jhrQouz6Hx8=;
 b=TSEbHv4HuOsHXf6HyKNYm9n5CW+AQcGKmfaPNY9+qR3XZWC7JzNnRpwB1GtAcMvxbO
 M1yxfENq8nEAPuXJ6Ta3Lq2+ER1Fur8Dj4wk2urZD4K5tcvBr74CxFeamxPimOrBVFQl
 +sxeXMiEFyaQKDaIbGo7G8qqafdxaW8sjAwCMzjuF4V1TThunY2alrEJlRM8RH7cq4jb
 6UannRipGjbXnH9NyNpzlAmBicKDkfewSR6xt5YSVBuyJGjXWUj0BMpa29oFws2lO+2t
 SJ2ZhWcwOAhWLIzgVSL3f+CBlKF+JmWvb7K2PH/Z/rd7ZC7aJd312n+TunNZKDw3VKbs
 BuQg==
X-Gm-Message-State: AOAM532zr3M4PZ3bg5siO5/TEu4e4BfdB8I2kMVqseJx2ivYpNqAosQi
 GnZ5PNI3KaavogxfyKjbIp4=
X-Google-Smtp-Source: ABdhPJwSH0WSh4AezqUqtDRG7FeOVtOIbByfrlKMWP6eCAacgSm/b50RIOEI2qQ5qKDSy6tUuXTuug==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr5610413wrp.146.1609955804704; 
 Wed, 06 Jan 2021 09:56:44 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r2sm4028121wrn.83.2021.01.06.09.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 09:56:44 -0800 (PST)
Subject: Re: [PATCH v3 00/15] target/mips/mips-defs: Simplify ISA definitions
To: qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2bf7ace6-29ae-8883-1f83-cdccdfd0207f@amsat.org>
Date: Wed, 6 Jan 2021 18:56:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 11:11 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daud=C3=A9 (15):
>   target/mips/mips-defs: Remove USE_HOST_FLOAT_REGS comment
>   target/mips/mips-defs: Reorder CPU_MIPS5 definition
>   target/mips/mips-defs: Rename CPU_MIPSxx Release 1 as CPU_MIPSxxR1
>   target/mips/mips-defs: Introduce CPU_MIPS64 and cpu_type_is_64bit()
>   hw/mips/boston: Check 64-bit support with cpu_type_is_64bit()
>   target/mips/mips-defs: Use ISA_MIPS32 definition to check Release 1
>   target/mips/mips-defs: Use ISA_MIPS32R2 definition to check Release 2
>   target/mips/mips-defs: Use ISA_MIPS32R3 definition to check Release 3
>   target/mips/mips-defs: Use ISA_MIPS32R5 definition to check Release 5
>   target/mips/mips-defs: Use ISA_MIPS32R6 definition to check Release 6
>   target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1
>   target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_R2
>   target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_R3
>   target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_R5
>   target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_R6
> 
>  target/mips/cpu.h                |   5 +
>  target/mips/internal.h           |   8 +-
>  target/mips/mips-defs.h          |  46 +--
>  hw/mips/boston.c                 |   6 +-
>  linux-user/mips/cpu_loop.c       |   6 +-
>  target/mips/cp0_helper.c         |  18 +-
>  target/mips/cp0_timer.c          |   4 +-
>  target/mips/cpu.c                |   6 +-
>  target/mips/fpu_helper.c         |   4 +-
>  target/mips/helper.c             |  12 +-
>  target/mips/translate.c          | 620 +++++++++++++++----------------
>  target/mips/translate_init.c.inc |  14 +-
>  12 files changed, 370 insertions(+), 379 deletions(-)

Series queued to mips-next.

