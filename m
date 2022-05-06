Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D651D009
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:18:49 +0200 (CEST)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpQW-0006fU-FB
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpPD-0005mV-50
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:17:27 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpPB-0007OQ-6M
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:17:26 -0400
Received: by mail-oi1-x22b.google.com with SMTP id m25so6420282oih.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AyBUOak8SLjrN+5bootpE9yxYyIrNbmNA2abRoEHo5A=;
 b=kpKAeAaXfXjmrK1OoE4Rws6khhmKF3XuZHb1IDpPu8dUr5md0L0oUAIBCAKm1Ukz6F
 ajPDJFqw98g6NjVPl+HOcAsmjWpuG7IR7hwr6LTS/S+OvwiTGgF/2bhtFO7EgHuZ08FR
 Bx+l8QtWlwXakU/rB0htC+bA+iUnTvKZQx7u04SnNZnnrj/7RvCDUXLCW9cLsowUO12a
 W9aTsSOXDZEYlkQVbUP52niOuaibs0GxVwll+LCPTnNf6uCwo7gWPGWSEiaC2LbiYLzv
 9+qjzkjXFN7lSL1ppS5rEztF7aTi3QMzKeMFzHj8QMUousOgLBUq3K8YV/ScaY3yuVMG
 ab3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AyBUOak8SLjrN+5bootpE9yxYyIrNbmNA2abRoEHo5A=;
 b=7Df9WlxIC5+KygM+J5wv12lzM8oxl4nSia86UcYn0aEkMKEnh2vNvzWysq2oTTgOg4
 pH0WTvhvyug4SLFWaEYltS7OAywn+jUsO2YZ3TT/hZxooJZ34gI1qDUtLbCrhedzZb5L
 /8WN0QyIS/5Px2kNR+ecGAwdim1OMnY1aKv/dkZ8YcSspp7zTQL7IsvOwkIIUNyrZKFG
 8MnpV40T+Ml0recH9IsvvffCLbaBC6+H3jqp5iSZpUSkwrXlLehTBdPzCdCLkXTRH/Sq
 qGVTzRxTQ9yAcFH9Xfig8pFiq1WNlHKbwBkOH9oB9aQEpD2R/C4hgrHLVpxL5n6ijVUv
 DRzQ==
X-Gm-Message-State: AOAM532jtIznByVvO/2N7oXWpClol8zWk0DUBvmelS+SqRwhlv0zCOnh
 w7pXQA3WQ6nVco2tkZfjbLXrwQ==
X-Google-Smtp-Source: ABdhPJxmsrFxRxgUjEZrce0DOKefxX60VKwHvM2HN1nmJ8/IFq1v2aw9iXpgjoQ9CdT9/UOwP8OvEA==
X-Received: by 2002:a05:6808:2c8:b0:325:ad24:a002 with SMTP id
 a8-20020a05680802c800b00325ad24a002mr4015563oid.82.1651810643294; 
 Thu, 05 May 2022 21:17:23 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056808144200b003266e656d39sm1313795oiv.4.2022.05.05.21.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 21:17:22 -0700 (PDT)
Message-ID: <5fe9a894-1bd4-c2b2-1500-20b9ee7e125c@linaro.org>
Date: Thu, 5 May 2022 23:17:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/30] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220505184938.351866-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/5/22 13:49, Daniel Henrique Barboza wrote:
> The following changes since commit e91b8994115d2f093e7556c9af2d051a26a98cfb:
> 
>    Merge tag 'pull-target-arm-20220505' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-05-05 11:30:33 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220505
> 
> for you to fetch changes up to bf3dd1e6d0d7c5c4906f89776e15dddc22af784b:
> 
>    target/ppc: Change MSR_* to follow POWER ISA numbering convention (2022-05-05 15:36:17 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-05-05:
> 
> The star of the show in this PR is the 'Remove hidden usages of *env'
> work done by Víctor, which impacts a lot of target/ppc code and we want
> to get it landed ASAP so future target/ppc contributions can be based on
> it.
> 
> Other changes:
> 
> - XIVE fixes in guest interrupt handling
> - BookE debug interrupt fix
> - vhost-user TARGET_PPC64 macro fix
> - valgrind fixes in kvmppc functions

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Bin Meng (1):
>        target/ppc: Fix BookE debug interrupt generation
> 
> Daniel Henrique Barboza (4):
>        target/ppc: initialize 'val' union in kvm_get_one_spr()
>        target/ppc: init 'lpcr' in kvmppc_enable_cap_large_decr()
>        target/ppc: init 'sregs' in kvmppc_put_books_sregs()
>        target/ppc: init 'rmmu_info' in kvm_get_radix_page_info()
> 
> Frederic Barrat (2):
>        ppc/xive: Always recompute the PIPR when pushing an OS context
>        ppc/xive: Update the state of the External interrupt signal
> 
> Murilo Opsfelder Araujo (1):
>        vhost-user: Use correct macro name TARGET_PPC64
> 
> Víctor Colombo (22):
>        target/ppc: Remove fpscr_* macros from cpu.h
>        target/ppc: Remove unused msr_* macros
>        target/ppc: Remove msr_pr macro
>        target/ppc: Remove msr_le macro
>        target/ppc: Remove msr_ds macro
>        target/ppc: Remove msr_ile macro
>        target/ppc: Remove msr_ee macro
>        target/ppc: Remove msr_ce macro
>        target/ppc: Remove msr_pow macro
>        target/ppc: Remove msr_me macro
>        target/ppc: Remove msr_gs macro
>        target/ppc: Remove msr_fp macro
>        target/ppc: Remove msr_cm macro
>        target/ppc: Remove msr_ir macro
>        target/ppc: Remove msr_dr macro
>        target/ppc: Remove msr_ep macro
>        target/ppc: Remove msr_fe0 and msr_fe1 macros
>        target/ppc: Remove msr_ts macro
>        target/ppc: Remove msr_hv macro
>        target/ppc: Remove msr_de macro
>        target/ppc: Add unused msr bits FIELDs
>        target/ppc: Change MSR_* to follow POWER ISA numbering convention
> 
>   hw/intc/xive.c           |  25 +++++-
>   hw/intc/xive2.c          |  18 ++--
>   hw/ppc/pegasos2.c        |   2 +-
>   hw/ppc/spapr.c           |   2 +-
>   hw/virtio/vhost-user.c   |   2 +-
>   include/hw/ppc/xive.h    |   1 +
>   target/ppc/cpu.c         |   2 +-
>   target/ppc/cpu.h         | 220 ++++++++++++++++++++++-------------------------
>   target/ppc/cpu_init.c    |  23 +++--
>   target/ppc/excp_helper.c |  54 ++++++------
>   target/ppc/fpu_helper.c  |  28 +++---
>   target/ppc/gdbstub.c     |   2 +-
>   target/ppc/helper_regs.c |  15 ++--
>   target/ppc/kvm.c         |  16 ++--
>   target/ppc/machine.c     |   2 +-
>   target/ppc/mem_helper.c  |  23 ++---
>   target/ppc/misc_helper.c |   2 +-
>   target/ppc/mmu-radix64.c |  11 +--
>   target/ppc/mmu_common.c  |  40 +++++----
>   target/ppc/mmu_helper.c  |   6 +-
>   20 files changed, 260 insertions(+), 234 deletions(-)


