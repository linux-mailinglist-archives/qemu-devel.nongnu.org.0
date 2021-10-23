Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD84385EA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 01:23:37 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meQMP-0006uH-TA
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 19:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meQLD-000615-Tc
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 19:22:19 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meQLC-0003Tc-6d
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 19:22:19 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r28so2606677pga.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 16:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JlEd7L5mIZV85VxDWrRYcS9At90Io6zRb25Py7kAKu8=;
 b=JK9Dre0dX6Sz0YH+Ash1TM/KCAdaGtmftvr0iway05ySRxj8AUdSbKj3E/qSvzwoBZ
 yLY3Eako2fbCjjv4OQc6j5OgZFxCnbBazCC60pDYhba7Z+Hgnk2aF7BbUzyIoMcdXXhg
 94G1Zuffzi4fUlAB1FvcQwG3d0u0YI06ml+ZR1WdZmQgFvbdS2fabw7lxB/JbuCOE1T7
 QufHAuH1zDt/KePYxLJ1KQHLHX6ESGKtQ4Kkvexx4OkO43xXzkP8TVGw+UOQ6P+xaJqo
 47q+msz7r7w0X5cPRyoha7hGI49kd0VLHUJgv0vf9Kuc6FNx4Tn6Cuo//79n3Khgzxrw
 igpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlEd7L5mIZV85VxDWrRYcS9At90Io6zRb25Py7kAKu8=;
 b=CUdfOwbl3Qy2bIePagJVB5jXdoHoin2wpvObCUGHvc1xICPaphZ90Tf4nmrnoEyKlQ
 tCIGta6NR8QTarXoIoFZtoOc1Rhiz8jqoU3sfPeT6T3aBUT+mhNohVt7uVoPaj3jpuj4
 TAiIBSo9Jbg0LOMHiMXnzNjRwvkeFdV2VpeilugWEP521w180q6O3I8bMrl4KtQClR1+
 /sU/aNK1ohWi0Pr8O7QoiBih/RFF62DZrJEHT0OBTAVyOnlm1aZZ1TOIOTuEaGkwFoCJ
 aluwsmIiGkCh5ygF6GbfeU9W7fGg7EG17Z8wx7T+cRn0Bx3vCkCFGgwqZga/WzXzNFXc
 aaOg==
X-Gm-Message-State: AOAM533q5wNL0YYPBatCDYNBXM5yfuC36stDDKeKKOn+gB1RZ9MEDLWJ
 SJClJWTLlVIFZhbNKvOxQwD1fQ==
X-Google-Smtp-Source: ABdhPJyAAn/zibXBeuU+tDepH7T+2k0VV9s3bcPPez4DUYV83ZgkgqL32yKi1dXS7u35msi/rTPTPA==
X-Received: by 2002:a63:b203:: with SMTP id x3mr6504449pge.239.1635031335808; 
 Sat, 23 Oct 2021 16:22:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v9sm14328206pfc.23.2021.10.23.16.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 16:22:15 -0700 (PDT)
Subject: Re: [PULL 00/11] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211023183123.813116-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24f16c0d-a021-25ba-75d8-656d85e54f88@linaro.org>
Date: Sat, 23 Oct 2021 16:22:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 11:31 AM, Laurent Vivier wrote:
> The following changes since commit 1dafe7656a9c2770065e91208edd4c073f5f98a9:
> 
>    Merge remote-tracking branch 'remotes/vivier-m68k/tags/q800-pull-request' into staging (2021-10-22 07:47:13 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
> 
> for you to fetch changes up to 2c92be50bcfa8b7529a39fc99078ef14dcfc71aa:
> 
>    analyze-migration.py: fix extract contents ('-x') errors (2021-10-23 20:28:56 +0200)
> 
> ----------------------------------------------------------------
> Trivial patches pull request 20211023
> 
> ----------------------------------------------------------------
> 
> Greg Kurz (2):
>    softmmu/physmem.c: Fix typo in comment
>    README: Fix some documentation URLs
> 
> Laurent Vivier (2):
>    analyze-migration.py: fix a long standing typo
>    analyze-migration.py: fix extract contents ('-x') errors
> 
> Oğuz Ersen (1):
>    po: update turkish translation
> 
> Philippe Mathieu-Daudé (3):
>    disas/nios2: Fix style in print_insn_nios2()
>    disas/nios2: Simplify endianess conversion
>    MAINTAINERS: Add myself as reviewer of 'Machine core' API
> 
> Tong Ho (3):
>    hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
>    hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
>    hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
> 
>   MAINTAINERS                       |  1 +
>   README.rst                        | 14 +++---
>   disas/nios2.c                     | 73 ++++++++++++-------------------
>   hw/nvram/xlnx-efuse.c             |  9 ++--
>   hw/nvram/xlnx-versal-efuse-ctrl.c | 20 ++++++---
>   hw/nvram/xlnx-zynqmp-efuse.c      | 18 +++++---
>   include/disas/dis-asm.h           |  3 +-
>   po/tr.po                          | 25 +++++------
>   scripts/analyze-migration.py      |  6 +--
>   softmmu/physmem.c                 |  2 +-
>   target/nios2/cpu.c                |  6 +--
>   11 files changed, 87 insertions(+), 90 deletions(-)

Applied, thanks.

r~


