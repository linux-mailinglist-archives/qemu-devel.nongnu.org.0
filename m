Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362244C49B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:45:41 +0100 (CET)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpnA-0002YS-9d
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkpmJ-0001r1-4R
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:44:47 -0500
Received: from [2a00:1450:4864:20::32e] (port=43762
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkpmH-0006x3-Ax
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:44:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2299841wmz.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQmOqBPmjJxvX5ManjcmIKo5PwKng+h5MARKvkbSHmU=;
 b=eN4zZBrDcYdscNKp6i1OKorVU8uZKfpn25jWofQ9/ZN4AGjuKPRyChCACukhvLjhew
 8slafk8hfvSqzFAvpsv3ezk1ejuHldWvhtD0ZJWpHuWrxEjaDoh/c95zcWJN4wclMDyx
 tsn4CBMsjQdqbuJI/berByNf8qITtktcrDPOvl1dyqyArCkTZjkwWXgmfEzqE6cfrHHB
 sP+hFuMxv15GSpDOCC0B2asz6nMc2ydAQg6ucEQxv7xsNTsQouyn9iCsXGnsjg9yO1SR
 gIJ5kwSDLpdtDYmatn3Ql2I2NHCyhhq+AloMd7Pupd/FE4xWISRoztSljVcLxSeLZlX4
 ZaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQmOqBPmjJxvX5ManjcmIKo5PwKng+h5MARKvkbSHmU=;
 b=JF6cI+EuRVDTaJQrcA2MjzUBmaJ4r8KOQNz/fu7zOkbaZcdtfmuBaeiA3BRrGIBqjv
 X9BTDQ2+KrAyCH/qcKs7NC8CpcWvn+LeDqiKdZe3/qru9pBnbPhVJTxPM2a81yVE4x7Q
 eN8S07zs4U8IriYGCMo+8b48SlVEpVSge3tYWIVtMYkWmf5nFHeFMsWGfO+Bqn0Lv+xS
 DnlT7jWlGL1IIk4sRGLClkqhwwV2OdkVcKhG/vHU0ABe3kSvFPh8ptwMYgAkHUtDCitI
 /CDZUDYzhl/rLVS/dTPnZTTFq1STi+47bqYzpCEH71HeT9l+43aAqJHAT+dgDj/tOGmg
 D56w==
X-Gm-Message-State: AOAM530zpgRMdA/4Rq75xVoDI7ZA+9h8daBmuIk+sfhMcmxWC4o9G5GJ
 P3Bog0IUEVok00Anku80Peu+RqqPdyY=
X-Google-Smtp-Source: ABdhPJxDALQqrMSIddCWRw3MimAbk4V6XMNkCSvWZFREoaeIVQwFzwj9et3J0VzgPShDoA48LxxfAg==
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr172219wmb.14.1636559083856; 
 Wed, 10 Nov 2021 07:44:43 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m125sm6034422wmm.39.2021.11.10.07.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:44:42 -0800 (PST)
Message-ID: <552724f4-3f0f-2dc9-45a9-a4a6b0885946@amsat.org>
Date: Wed, 10 Nov 2021 16:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC 2/4] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-3-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211108023738.42125-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 03:37, Warner Losh wrote:
> All instances of rewind_if_in_safe_syscall are the same, differing only
> in how the instruction point is fetched from the ucontext and the size
> of the registers. Use host_signal_pc and new host_signal_set_pc
> interfaces to fetch the pointer to the PC and adjust if needed. Delete
> all the old copies of rewind_if_in_safe_syscall.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  linux-user/host/aarch64/hostdep.h | 20 --------------------
>  linux-user/host/arm/hostdep.h     | 20 --------------------
>  linux-user/host/i386/hostdep.h    | 20 --------------------
>  linux-user/host/ppc64/hostdep.h   | 20 --------------------
>  linux-user/host/riscv/hostdep.h   | 20 --------------------
>  linux-user/host/s390x/hostdep.h   | 20 --------------------
>  linux-user/host/x86_64/hostdep.h  | 20 --------------------
>  linux-user/signal.c               | 18 +++++++++++++++++-
>  8 files changed, 17 insertions(+), 141 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

