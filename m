Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C3474346
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:16:14 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7fB-0008WN-5X
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:16:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7YZ-0003kP-Mb
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:09:23 -0500
Received: from [2a00:1450:4864:20::435] (port=39537
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7YY-0000Rv-BJ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:09:23 -0500
Received: by mail-wr1-x435.google.com with SMTP id a18so32297076wrn.6
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ItuauIuV5Sbt1WIyre3VTcunKWQTLWYOjybrqlicq9M=;
 b=SVFbBQah3sjvryqAfAbOACjcl+/E7C/LXhWqhrflCLIABUF42C5HJ3ytCtaKptsowy
 1HCBEiI9ztN7CH4yLLzk01ywA4mkLnQbHwmiC0ykmTY6sDCGijGAcdRfDG73j+W6NQTK
 9YZa59PKhqI/y7ED6G6nnPnmk8KHaKlHoCMtJdqiG7IDVZcYyz+Tey+HnA3vn6LG+3Fu
 2yk9xfbRsaFaFYJz74SLCaIGeRMgOYjLeHqOl15t8afU0jVe30l+PXXDwPOhtdB98uNc
 iofSkrGOsohslvjWLoTlRK6GR1I7Ijhze0KTGmmTeW5R39BkSP4xI7TajwD1NVQX3dEN
 1Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ItuauIuV5Sbt1WIyre3VTcunKWQTLWYOjybrqlicq9M=;
 b=la7TLQMsX0PrtMpLrnAqpEBReiD4UvWSIVmavbkT4zUgPbmFQq7snk7JAH0lzjnIvU
 FQtcfUmgAGV4J+eRmXfWFC7wid8q8zsIWbmWJfGK50SJVTgZ5gK2izmh0hmd5WVBv5g1
 bvH0xL4b4m5fQNMKBg5XE2ipImLF8ZiCf9/X83LLhUEMTmyfDn+j4Ze586649A/MyR3t
 23JfQxKXA20Rr+gg8yub+2fop+wzK+pBbv/SvFTaYgDdz0Wt0KUgIY6vHHAappyrfC2Y
 q0I536S1lu2YlluGGSZYzZ+n4z+W1sgu91g0ask2SYIhzrn/ChOCC8XF3HPlHcKR37nV
 T0JA==
X-Gm-Message-State: AOAM532niaKB7XUzLSu96HDEHmapYTXs5eZsUrtTQh3aecKC8AwyG+gk
 g4hl7YC5mTmYWuNk36O3G6k=
X-Google-Smtp-Source: ABdhPJy3w+9kO+LvXUus8yjFC9rV66GsGeddC7xz/s/U37px0NLqLAHYJllgb4B78aOv2XDoNePpqw==
X-Received: by 2002:adf:f990:: with SMTP id f16mr5706579wrr.128.1639487360803; 
 Tue, 14 Dec 2021 05:09:20 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id c8sm1430258wmq.34.2021.12.14.05.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:09:20 -0800 (PST)
Message-ID: <97a8bfbc-44af-fc31-f55c-fb3f674457bb@amsat.org>
Date: Tue, 14 Dec 2021 14:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 08/15] linux-user: Rename TARGET_QEMU_ESIGRETURN to
 QEMU_ESIGRETURN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 01:25, Richard Henderson wrote:
> This value is fully internal to qemu, and so is not a TARGET define.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/generic/target_errno_defs.h |  2 +-
>  linux-user/aarch64/cpu_loop.c          |  2 +-
>  linux-user/aarch64/signal.c            |  4 ++--
>  linux-user/alpha/cpu_loop.c            |  2 +-
>  linux-user/alpha/signal.c              |  8 ++++----
>  linux-user/arm/cpu_loop.c              |  2 +-
>  linux-user/arm/signal.c                |  8 ++++----
>  linux-user/cris/cpu_loop.c             |  2 +-
>  linux-user/cris/signal.c               |  4 ++--
>  linux-user/hexagon/cpu_loop.c          |  2 +-
>  linux-user/hexagon/signal.c            |  2 +-
>  linux-user/hppa/cpu_loop.c             |  2 +-
>  linux-user/hppa/signal.c               |  4 ++--
>  linux-user/i386/cpu_loop.c             |  6 +++---
>  linux-user/i386/signal.c               |  8 ++++----
>  linux-user/m68k/cpu_loop.c             |  2 +-
>  linux-user/m68k/signal.c               |  8 ++++----
>  linux-user/microblaze/cpu_loop.c       |  2 +-
>  linux-user/microblaze/signal.c         |  4 ++--
>  linux-user/mips/cpu_loop.c             |  2 +-
>  linux-user/mips/signal.c               |  8 ++++----
>  linux-user/openrisc/cpu_loop.c         |  2 +-
>  linux-user/ppc/cpu_loop.c              |  2 +-
>  linux-user/ppc/signal.c                | 10 +++++-----
>  linux-user/riscv/cpu_loop.c            |  2 +-
>  linux-user/riscv/signal.c              |  2 +-
>  linux-user/s390x/cpu_loop.c            |  2 +-
>  linux-user/s390x/signal.c              |  8 ++++----
>  linux-user/sh4/cpu_loop.c              |  2 +-
>  linux-user/sh4/signal.c                |  8 ++++----
>  linux-user/sparc/cpu_loop.c            |  2 +-
>  linux-user/sparc/signal.c              |  8 ++++----
>  linux-user/syscall.c                   |  2 +-
>  linux-user/xtensa/cpu_loop.c           |  2 +-
>  linux-user/xtensa/signal.c             |  4 ++--
>  35 files changed, 70 insertions(+), 70 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

