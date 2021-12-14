Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A4474353
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:21:21 +0100 (CET)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7k8-0005AE-7G
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:21:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7cF-0007JW-QZ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:13:13 -0500
Received: from [2a00:1450:4864:20::333] (port=54090
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7cE-00012M-2G
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:13:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id y196so14193035wmc.3
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CKF8aezFM3Sl8U0FlGJGYIPjUqYq637No/eAxWpBMrY=;
 b=K02hMRbGEmz/YP27MYIIDr47ygjurcavXf7b2Uxg2OMqDO8683bT/+dL13X5+i5rJM
 KfwQuSTyD1dZDCWDhy1/zEL8bDhSNM2/dVOviIvMtBRFcz+zkTgQr3pmrOFySuNuXonx
 SMAnknJXpxZoCTbqIEi36kn0ftzYmiFKSc7rM91sJjcVfKfOE5lcL/Yjpsx0azmthfnH
 iymtVRoRJmyY+xIs6hjLsmOXv8iIt5EiFptvOAItyHru6CrOA0pd4ItIKv00NNOTM572
 dPSUHg1QH6OREfjmqXKqHn+DzcDdBPG29/RBOOp4H3S6dqfs/FpqDGXpHKp+aSnmmNb4
 Wu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CKF8aezFM3Sl8U0FlGJGYIPjUqYq637No/eAxWpBMrY=;
 b=Dgc40h4dKeJOqJ4ccGNeb5DpeFf28dOK4s1Px69OCbietTZZdgdwYz29N1QBIg3d9Q
 VcRBrrPv68Beq4/BK8/ZKvUolS5HnMq97qjucFiSDyWI7rO+2dFUMdxkalmlCxk1DKnF
 Dt/BPQzmB3jZkhW2YiP2R2b/hwHvnfaOwGYBXRxFKNIUcjfug7YK0X/kKcOuu35RBXPR
 zFf80S7fHRF6a9w0EmC9sqyvukppyxy+80afJ7lY3l9EY7zS6Db09BV4RxAdCwz95EW/
 XS2JZ37Rp+Lm2ZfDaZ5tiC3mhXIXWzs7YVy9ueNrTZwo+MWIssL3yykbbjvAcbRaL1KC
 I/TA==
X-Gm-Message-State: AOAM532mUDZSyWHj8jykhp+L8BkXClDG/KiIKPWQg2ioIp4jGlBfjQHM
 o9Ajc9453LuPFZSlo9dzrwo=
X-Google-Smtp-Source: ABdhPJxMdcWnWuXscBqPAXJiRpr3CFHRcCLHctN/KYDK9iEWa/lRy/g9r3C59sUePuiUYXJ7+m53xA==
X-Received: by 2002:a05:600c:6006:: with SMTP id
 az6mr7220599wmb.5.1639487586782; 
 Tue, 14 Dec 2021 05:13:06 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id z14sm14136693wrp.70.2021.12.14.05.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:13:05 -0800 (PST)
Message-ID: <9c0909b6-cbd8-69eb-046d-37deaef33ad0@amsat.org>
Date: Tue, 14 Dec 2021 14:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 11/15] common-user: Move safe-syscall.* from linux-user
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

On 12/14/21 01:26, Richard Henderson wrote:
> Move linux-user safe-syscall.S and safe-syscall-error.c to common-user
> so that bsd-user can also use it.  Also move safe-syscall.h to
> include/user/.  Since there is nothing here that is related to the guest,
> as opposed to the host, build it once.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                                    | 18 +++++++++++++++++-
>  {linux-user => include/user}/safe-syscall.h    |  0
>  .../safe-syscall-error.c                       |  2 +-
>  linux-user/signal.c                            |  2 +-
>  linux-user/syscall.c                           |  2 +-
>  MAINTAINERS                                    |  2 ++
>  bsd-user/meson.build                           |  2 ++
>  .../host/aarch64/safe-syscall.inc.S            |  2 +-
>  .../host/arm/safe-syscall.inc.S                |  2 +-
>  .../host/i386/safe-syscall.inc.S               |  2 +-
>  .../host/mips/safe-syscall.inc.S               |  2 +-
>  .../host/ppc64/safe-syscall.inc.S              |  2 +-
>  .../host/riscv/safe-syscall.inc.S              |  2 +-
>  .../host/s390x/safe-syscall.inc.S              |  2 +-
>  .../host/sparc64/safe-syscall.inc.S            |  2 +-
>  .../host/x86_64/safe-syscall.inc.S             |  2 +-
>  common-user/meson.build                        |  6 ++++++
>  {linux-user => common-user}/safe-syscall.S     |  0
>  linux-user/meson.build                         |  5 +++--
>  19 files changed, 42 insertions(+), 15 deletions(-)
>  rename {linux-user => include/user}/safe-syscall.h (100%)
>  rename {linux-user => common-user}/safe-syscall-error.c (95%)
>  rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (97%)
>  rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (98%)
>  rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (98%)
>  rename {linux-user => common-user}/host/mips/safe-syscall.inc.S (98%)
>  rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (98%)
>  rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (97%)
>  rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (98%)
>  rename {linux-user => common-user}/host/sparc64/safe-syscall.inc.S (97%)
>  rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (98%)
>  create mode 100644 common-user/meson.build
>  rename {linux-user => common-user}/safe-syscall.S (100%)

Nice!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

