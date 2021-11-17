Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC5454291
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:24:39 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGFC-0001RI-0W
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnGD0-0008Bk-Pb
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:22:22 -0500
Received: from [2a00:1450:4864:20::433] (port=37394
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnGCz-0001UP-5r
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:22:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id b12so2992747wrh.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N4Xlndw8kOL7Bg7JKtzHcf7+DedzG9afQay0DaSaXIY=;
 b=d0WpH+TSnd8+kx7BkgwMTnOPxV2tyIwGa2rty4zApma8ooMIOplZ1bIUH5JbiQPIhL
 4/55QRpgAtq4lutc6+Pc0zK2HQepU6y1YMQ5QApxT1vPeRN31L6ViN+qDQNInQUUMldA
 aBmkvpV8HppM0NUwSkqe0rHpSMbDNSitaNgWNIVPY6KjxEewz52OICwqNTTUM/GGghyX
 AJQUL54Ww+enS699SlgAKpz/yMLSICDhglzsekKu6Ocgd1ZlpoA7Vpf3H4KAfEXjzvFc
 SIC4w/SYv7P0X+ArtGRWN4coPJKKdQPoDbVoFVurkFpfY/HCjWQ9CofYqWUJ5zyKpv/L
 K7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N4Xlndw8kOL7Bg7JKtzHcf7+DedzG9afQay0DaSaXIY=;
 b=n/38dyh4kCvhcJzDETYKgriSUFzsC7CGge+pHX4qxRx7pqX8/4BgUdff5wxp8BtTOc
 /bCxtckkxsDexFmpZC90wMEbw+u8mXmlYlVfg6PeuUpMY8gsUWUeRMSnD8MaUeK+8ATc
 GlLbAtdW6/1RxPMNzu9+2W0605sy/FCXckr66cGiSWnvzCAHkFpDWASbxvo5xc0naeON
 IPml3tRWCKECS7ONc9eCl7srYZFEEXiAh0KtsFu+rchK7GM/9XmpYhNWXkL0bWu9EACF
 wjwIsVmItcvpt8Y9ZVQ3LPGcwuNFhN6Eoz/BufJ7UWNTZj0fydemH1OadJQuUFrqwaw7
 0NGw==
X-Gm-Message-State: AOAM533RTMWgIdTzRIvVHQIjnbnfu6uygtmfpF3TlaF0DaTReFhHs0ym
 GZqWu6+n+ZC7lMFcD2FmKMpocsiXjsI=
X-Google-Smtp-Source: ABdhPJzovgE4V6qqxoyfevhsB4UKNc6nKu3pH2WuFK0zHdpdwPAkwF1iPPflnQAo/9mBVfgFvV39SA==
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr17410994wri.195.1637137339513; 
 Wed, 17 Nov 2021 00:22:19 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b11sm4646605wmj.35.2021.11.17.00.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:22:18 -0800 (PST)
Message-ID: <2de652dc-366e-6b3f-dfe8-3a5d79ec817b@amsat.org>
Date: Wed, 17 Nov 2021 09:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 7/9] linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211116110256.365484-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

On 11/16/21 12:02, Richard Henderson wrote:
> All supported hosts now define HAVE_SAFE_SYSCALL, so remove
> the ifdefs.  This leaves hostdep.h empty, so remove it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/aarch64/hostdep.h | 18 ------------------
>  common-user/host/arm/hostdep.h     | 18 ------------------
>  common-user/host/i386/hostdep.h    | 18 ------------------
>  common-user/host/mips/hostdep.h    |  2 --
>  common-user/host/ppc64/hostdep.h   | 18 ------------------
>  common-user/host/riscv/hostdep.h   | 14 --------------
>  common-user/host/s390x/hostdep.h   | 18 ------------------
>  common-user/host/sparc64/hostdep.h |  2 --
>  common-user/host/x86_64/hostdep.h  | 18 ------------------
>  linux-user/host/ia64/hostdep.h     | 15 ---------------
>  linux-user/host/mips/hostdep.h     | 15 ---------------
>  linux-user/host/ppc/hostdep.h      | 15 ---------------
>  linux-user/host/s390/hostdep.h     | 15 ---------------
>  linux-user/host/sparc/hostdep.h    | 15 ---------------
>  linux-user/host/sparc64/hostdep.h  | 15 ---------------
>  linux-user/host/x32/hostdep.h      | 15 ---------------
>  linux-user/safe-syscall.h          | 12 ------------
>  linux-user/user-internals.h        |  1 -
>  linux-user/signal.c                |  2 --
>  linux-user/safe-syscall.S          |  3 ---
>  20 files changed, 249 deletions(-)
>  delete mode 100644 common-user/host/aarch64/hostdep.h
>  delete mode 100644 common-user/host/arm/hostdep.h
>  delete mode 100644 common-user/host/i386/hostdep.h
>  delete mode 100644 common-user/host/mips/hostdep.h
>  delete mode 100644 common-user/host/ppc64/hostdep.h
>  delete mode 100644 common-user/host/riscv/hostdep.h
>  delete mode 100644 common-user/host/s390x/hostdep.h
>  delete mode 100644 common-user/host/sparc64/hostdep.h
>  delete mode 100644 common-user/host/x86_64/hostdep.h
>  delete mode 100644 linux-user/host/ia64/hostdep.h
>  delete mode 100644 linux-user/host/mips/hostdep.h
>  delete mode 100644 linux-user/host/ppc/hostdep.h
>  delete mode 100644 linux-user/host/s390/hostdep.h
>  delete mode 100644 linux-user/host/sparc/hostdep.h
>  delete mode 100644 linux-user/host/sparc64/hostdep.h
>  delete mode 100644 linux-user/host/x32/hostdep.h

> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> -#ifdef HAVE_SAFE_SYSCALL
>  
>  /* The core part of this function is implemented in assembly. */
>  extern long safe_syscall_base(int *pending, int *errnop, long number, ...);
> @@ -137,15 +136,4 @@ extern char safe_syscall_end[];
>      safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending, \
>                        &errno, __VA_ARGS__)
>  
> -#else
> -
> -/*
> - * Fallback for architectures which don't yet provide a safe-syscall assembly
> - * fragment; note that this is racy!
> - * This should go away when all host architectures have been updated.
> - */
> -#define safe_syscall syscall
> -
> -#endif

Good!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

