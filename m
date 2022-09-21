Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9475D1C33
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 20:04:42 +0200 (CEST)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob45P-0008HM-Ok
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 14:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob40z-0005m4-EA
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 14:00:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob40x-00021Z-78
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 14:00:05 -0400
Received: by mail-pj1-x1035.google.com with SMTP id q3so7281724pjg.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=m29O+pIusQUEzRwwGeeQ9pr8OZkiOZWItfTnsxC01L8=;
 b=VQyn7/Bw2PIL+10zWuABhmYLBkUaeN5hrzsKzknI6ZE6H6Uv4kBpp6MQuMHHsYN7Kf
 dphfUins5Zxb6TkdVuwW+5X15Uxl0Hf2f2FxXL10EmTrYpiFCJTna3SGtOG7WtCbiSvU
 KPJ6j62PBVI6UU6G2iATKfICYI0sV4TyvdiiTumN9uvFE+HN1yWEpDjJ1X3DSU789bCD
 VuLwY2rL5wU0yqQnqmkHX37hfXN+wXGefd5b0pXI5U7SMmEMuyBR++ZQKuI/Uj2uhf73
 PXNsaGUxfuq2/Llp/BFMe4rtLw6z5etBcs5KN6CJBKltkdw1miJUiWtsweTAi+1MzKSO
 YYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=m29O+pIusQUEzRwwGeeQ9pr8OZkiOZWItfTnsxC01L8=;
 b=3/3RNIWX7sS33vZHfZbp8QOnV4QMFmPZoJ8LBOqyEIDPDjDetZsMHrG8RjubJfSXmn
 Pf0LKXpRWIl99TyFzO/kWUXv+ZAXnc6Hgo6lNootKLGlzqGJ19shQ1cPLY+Mef9TNZjP
 H2YMmq7of6xC2Cc+R2zdmLbiaVRfO8xMMip26gm98URe4AuBloL+6a5i+mJ3CPiC0uRv
 /rUIe73yVSUmG/A0UQcTn4od7AVwMCQaBXqPVLf4tV9Uoe3+nvkOGhWZQ9udJqu4lyVk
 mhevAKo0c4/nFu589OCZ1RjCAa8ke3DqBWZhC67GCpbjH3RWfhNZWfMe1wg31rtKLgF3
 gL4w==
X-Gm-Message-State: ACrzQf3eSs/0StwMHSmJxLVtmwxVjqNCTw6cL6ZSW5W5drMFeyD/X82L
 n29tC/vaYkiAQ7GR2p1mwL8=
X-Google-Smtp-Source: AMsMyM7dRcqeJJhNssAlwm52ZQpsUf0l/gA9hkqa4Lp63q2yidR2Z8GTsxquJ0DKXcAzvt9Gjls4Pg==
X-Received: by 2002:a17:902:7446:b0:176:85f5:e767 with SMTP id
 e6-20020a170902744600b0017685f5e767mr5960567plt.60.1663783201659; 
 Wed, 21 Sep 2022 11:00:01 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k73-20020a633d4c000000b0041a67913d5bsm2151574pga.71.2022.09.21.10.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 11:00:01 -0700 (PDT)
Message-ID: <daa38114-e29d-4272-c272-32c344f9c3d6@amsat.org>
Date: Wed, 21 Sep 2022 19:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PULL 00/12] Publish1 patches
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20220920173152.199359-1-deller@gmx.de>
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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

Hi Helge,

On 20/9/22 19:31, Helge Deller wrote:
> The following changes since commit 621da7789083b80d6f1ff1c0fb499334007b4f51:
> 
>    Update version for v7.1.0 release (2022-08-30 09:40:11 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/hdeller/qemu-hppa.git tags/publish1-pull-request
> 
> for you to fetch changes up to 7f8674a61a908592bb4e8e698f5bef84d0eeb8cc:
> 
>    linux-user: Add parameters of getrandom() syscall for strace (2022-09-18 21:35:27 +0200)
> 
> ----------------------------------------------------------------
> linux-user: Add more syscalls, enhance tracing & logging enhancements
> 
> Here is a bunch of patches for linux-user.
> 
> Most of them add missing syscalls and enhance the tracing/logging.
> Some of the patches are target-hppa specific.
> I've tested those on productive hppa debian buildd servers (running qemu-user).
> 
> Thanks!
> Helge
> 
> Changes to v2:
> - Fix build of close_range() and pidfd_*() patches on older Linux
>    distributions (noticed by Stefan Hajnoczi)
> 
> Changes to v1:
> - Dropped the faccessat2() syscall patch in favour of Richard's patch
> - Various changes to the "missing signals in strace output" patch based on
>    Richard's feedback, e.g. static arrays, fixed usage of _NSIG, fix build when
>    TARGET_SIGIOT does not exist
> - Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
>    unconditionally and turn into a switch statement - as suggested by Richard
> 
> ----------------------------------------------------------------
> 
> Helge Deller (12):
>    linux-user: Add missing signals in strace output
>    linux-user: Add missing clock_gettime64() syscall strace
>    linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
>      syscalls
>    linux-user: Log failing executable in EXCP_DUMP()
>    linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
>    linux-user/hppa: Dump IIR on register dump
>    linux-user: Fix strace of chmod() if mode == 0
>    linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
>    linux-user: Add strace for clock_nanosleep()
>    linux-user: Show timespec on strace for futex()
>    linux-user: Add close_range() syscall
>    linux-user: Add parameters of getrandom() syscall for strace

It seems you missed my review comments:

- 
https://lore.kernel.org/qemu-devel/569161db-c8cf-9ae5-9ae6-161de7f22335@amsat.org/
- 
https://lore.kernel.org/qemu-devel/d1668b24-9c04-0e54-2a82-7174f0d46fc1@amsat.org/
- 
https://lore.kernel.org/qemu-devel/e8bfd1ba-cec7-7c29-9319-eb013c14a237@amsat.org/#t
- 
https://lore.kernel.org/qemu-devel/02090880-0db6-0a6b-60b0-b3313566b962@amsat.org/

