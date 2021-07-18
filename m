Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F603CC819
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:48:05 +0200 (CEST)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51Wu-0004Y8-LI
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51Vi-0003AP-Rs
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:46:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51Vg-00025J-Jg
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:46:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l7so17461808wrv.7
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R55CtsVL++IldeVlM5HZ0BfM2z7yYwjRTK7tFydDgMM=;
 b=NRcGtH0sBqPvjOAtNuUKuRA7R/ohkGkgZxKWs19vP+23SfaBVq6sSAdm1Fo+XpjX/S
 yO24HhbLAdAfWolTvGBal47fvmHAnIUDF2GuM8hj6h0Y0nenzZ43MnmkyIchazNnMNma
 wajIHpUGFLRTLPqk+Z6pOrHX1v1sjXkUF6VxrbO55QtgEHUY7kaR513n6YLfe6s7Rzg3
 ZHnXZyW1i+d7BHSec+H6ZT1CHQX1BVmtVxdUBYrJYjKWyk0+UKMdcyDupM05J58VyUDe
 o3IGKKfopngABYlqJZNLZb98Gpx3HkRKrb+4TxASVL2a8azFw9pxHjpVo+lU2zgQMM/o
 PMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R55CtsVL++IldeVlM5HZ0BfM2z7yYwjRTK7tFydDgMM=;
 b=XcrW6+z4vbrgIiS6yPoCMrvOcwI7HjzRdP+8MVnLvCiHO+u5YCnq5+pJhuG8oMMkYu
 5e68DtT+XFoqY0N0uS3RoRCDZpR4T2yXJj/mFxPjgfcxFa2P5IiWHIjil+sxmzmOUwOR
 L+PEKQwNOIq02yvMijwqO4LNOy5QfDywPnVMjzkHqXhKNwiuQ66bh9UwkVYrTFXKcCy2
 w42NSDbf/BVajA1g6QwLYWBLSQyz+z3gfS0TDOcykCUtj5rSmmXojvYlyiwN0o2lLkKp
 4Rc7m9bwPKMBAFVAzUUnAghWKXm+5Pp+RQaCH7DRtICv8PmYo02iz0xBzNBFmiSyflTi
 d4yQ==
X-Gm-Message-State: AOAM532cwm/J3gr9m6XySuceFKMfZmTKPMpf1QOcLJwK9ZITL/GjCG1/
 HI4Nt79A4o9e4JE4w6HVry8=
X-Google-Smtp-Source: ABdhPJx31Z0drVavMCeHR/oVesSOLvAVOtt76NgrzQBq2vXWWkPJNQFllis3HQZdVwbyJy2ESMKnNA==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr22862714wrb.172.1626594407176; 
 Sun, 18 Jul 2021 00:46:47 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id z16sm16630793wrl.8.2021.07.18.00.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:46:46 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/10] linux-user: Split signal-related prototypes
 into sighandling.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e43d49d-f135-3475-afa4-2ce8de7b63ff@amsat.org>
Date: Sun, 18 Jul 2021 09:46:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717232103.18047-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 1:20 AM, Peter Maydell wrote:
> Split the signal related prototypes into a new header file
> sighandling.h, and include it in those places that require it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h                | 36 --------------------
>  linux-user/sighandling.h         | 56 ++++++++++++++++++++++++++++++++
>  linux-user/aarch64/cpu_loop.c    |  1 +
>  linux-user/aarch64/signal.c      |  1 +
>  linux-user/alpha/cpu_loop.c      |  1 +
>  linux-user/alpha/signal.c        |  1 +
>  linux-user/arm/cpu_loop.c        |  1 +
>  linux-user/arm/signal.c          |  1 +
>  linux-user/cris/cpu_loop.c       |  1 +
>  linux-user/cris/signal.c         |  1 +
>  linux-user/fd-trans.c            |  1 +
>  linux-user/hexagon/cpu_loop.c    |  1 +
>  linux-user/hexagon/signal.c      |  1 +
>  linux-user/hppa/cpu_loop.c       |  1 +
>  linux-user/hppa/signal.c         |  1 +
>  linux-user/i386/cpu_loop.c       |  1 +
>  linux-user/i386/signal.c         |  1 +
>  linux-user/m68k/cpu_loop.c       |  1 +
>  linux-user/m68k/signal.c         |  1 +
>  linux-user/main.c                |  1 +
>  linux-user/microblaze/cpu_loop.c |  1 +
>  linux-user/microblaze/signal.c   |  1 +
>  linux-user/mips/cpu_loop.c       |  1 +
>  linux-user/mips/signal.c         |  1 +
>  linux-user/nios2/cpu_loop.c      |  1 +
>  linux-user/nios2/signal.c        |  1 +
>  linux-user/openrisc/cpu_loop.c   |  1 +
>  linux-user/openrisc/signal.c     |  1 +
>  linux-user/ppc/cpu_loop.c        |  1 +
>  linux-user/ppc/signal.c          |  1 +
>  linux-user/riscv/cpu_loop.c      |  1 +
>  linux-user/riscv/signal.c        |  1 +
>  linux-user/s390x/cpu_loop.c      |  1 +
>  linux-user/s390x/signal.c        |  1 +
>  linux-user/sh4/cpu_loop.c        |  1 +
>  linux-user/sh4/signal.c          |  1 +
>  linux-user/signal.c              |  1 +
>  linux-user/sparc/cpu_loop.c      |  1 +
>  linux-user/sparc/signal.c        |  1 +
>  linux-user/syscall.c             |  1 +
>  linux-user/xtensa/cpu_loop.c     |  1 +
>  linux-user/xtensa/signal.c       |  1 +
>  42 files changed, 96 insertions(+), 36 deletions(-)
>  create mode 100644 linux-user/sighandling.h

The difference between "signal-common.h" and "sighandling.h"
is not clear. Could they be merged? Anyway:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

