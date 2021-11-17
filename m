Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2EE454B96
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:05:06 +0100 (CET)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOMr-0000Td-GQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:05:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnO9j-0005su-Le
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:51:34 -0500
Received: from [2a00:1450:4864:20::431] (port=44737
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnO9g-0002TL-Dq
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:51:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id n29so5901578wra.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WPY1ltiJ9J4tA/h64zdVlgNdDR4PiYOPFoBy3eYGs+c=;
 b=pHUngudgR/RsNPrGpWopv7iBUwhQRZDqEXdhnoBUD8gNyxLfR4WZqFvi2RDieWyJEf
 pyd2AthtM3sfej9A+/AUOtuUNyKbWMivYEU1KlHvysNWrMYn1tQl/EiY87OiN0lPXvkz
 jlv+J1jZemTJux80cf/2HP7+fJBR7I6UKA4LZE8x303F3owyy6jiZm6VhXaa2AgFaTWl
 Rbq8X7OHJcGzwMfJgdGD7g/uKxJ1FzDUPrUmAzZJj3llcLMqyxnkVoECLSCoCSde3iGJ
 9yUKUnR6ujjXlPosPrDb1KA+5UHZjAms/ErmOJWCpJFa3N8Fpa2Tq8sCPxTe2cALVZW6
 8XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WPY1ltiJ9J4tA/h64zdVlgNdDR4PiYOPFoBy3eYGs+c=;
 b=CasWRpVj1mqH1Mx711QfiXrVMnRDOrhMr3vX9TKoqJyuCFtwe9TVJKozgc99bUFyRx
 zveDMfo5nRyTuc/2l1GgXiD5ObQEZRfzPZvTbxI8Vrea30hX9HbwRvqGrvLgdohiZHte
 qhK9mhof3yWR32KNQenZv9DBJuPOMGZtXTWFT5AWj0mggE8WQidb014UGla/zcbU243A
 qdrqZAz1m6Tt7pDqBPKRrIOU5jKpciyTOtHB2bszmqgo8Vm5sBC5FaZlzGiQiGM/jrTv
 XkQBrwjoXKXTrX+GEU1E1m6gNP4n3k1RfNYvO7+ss79UpZQw7VFLHHKIB3Zn2HE3G/f4
 ebVA==
X-Gm-Message-State: AOAM533Tek851ffCcylK8Gk2IhBSTOB7HIUCmYe0kwbPPAqMXMYP8j5i
 o94Or1DJgtvNJhm69r3Wlo8=
X-Google-Smtp-Source: ABdhPJx54fKgseWiRjXdnWyrzk4K0kGGj+tkbzZwi1yKzSiLCIqc5z+khMgSoTHM+Tz7l1AinzARzw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr22233442wrr.365.1637167886963; 
 Wed, 17 Nov 2021 08:51:26 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t9sm420850wrx.72.2021.11.17.08.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:51:26 -0800 (PST)
Message-ID: <cf7f0c38-124c-7d57-513d-225feaa181e9@amsat.org>
Date: Wed, 17 Nov 2021 17:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 09/17] *-user: Rename TARGET_ERESTARTSYS to
 QEMU_ERESTARTSYS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211117160412.71563-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 17:04, Richard Henderson wrote:
> This value is fully internal to qemu, and so is not a TARGET define.
> We use this as an extra marker for both host and target errno.

Thanks for this cleanup, I often wondered what was it really.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/errno_defs.h                       |  2 +-
>  linux-user/generic/target_errno_defs.h      |  2 +-
>  linux-user/safe-syscall.h                   |  8 ++++----
>  linux-user/signal-common.h                  |  2 +-
>  linux-user/aarch64/cpu_loop.c               |  2 +-
>  linux-user/alpha/cpu_loop.c                 |  2 +-
>  linux-user/arm/cpu_loop.c                   |  2 +-
>  linux-user/cris/cpu_loop.c                  |  2 +-
>  linux-user/hexagon/cpu_loop.c               |  2 +-
>  linux-user/hppa/cpu_loop.c                  |  2 +-
>  linux-user/i386/cpu_loop.c                  |  6 +++---
>  linux-user/m68k/cpu_loop.c                  |  2 +-
>  linux-user/microblaze/cpu_loop.c            |  2 +-
>  linux-user/mips/cpu_loop.c                  |  2 +-
>  linux-user/openrisc/cpu_loop.c              |  2 +-
>  linux-user/ppc/cpu_loop.c                   |  2 +-
>  linux-user/riscv/cpu_loop.c                 |  2 +-
>  linux-user/s390x/cpu_loop.c                 |  2 +-
>  linux-user/sh4/cpu_loop.c                   |  2 +-
>  linux-user/signal.c                         |  6 +++---
>  linux-user/sparc/cpu_loop.c                 |  2 +-
>  linux-user/syscall.c                        | 16 ++++++++--------
>  linux-user/xtensa/cpu_loop.c                |  2 +-
>  common-user/host/aarch64/safe-syscall.inc.S |  2 +-
>  common-user/host/arm/safe-syscall.inc.S     |  2 +-
>  common-user/host/i386/safe-syscall.inc.S    |  2 +-
>  common-user/host/mips/safe-syscall.inc.S    |  2 +-
>  common-user/host/ppc64/safe-syscall.inc.S   |  2 +-
>  common-user/host/riscv/safe-syscall.inc.S   |  2 +-
>  common-user/host/s390x/safe-syscall.inc.S   |  2 +-
>  common-user/host/sparc64/safe-syscall.inc.S |  2 +-
>  common-user/host/x86_64/safe-syscall.inc.S  |  2 +-
>  32 files changed, 46 insertions(+), 46 deletions(-)

