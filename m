Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39406425998
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:34:46 +0200 (CEST)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXI5-0000C4-6s
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYX9X-0007df-F5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:25:55 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYX9V-0003mC-5I
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:25:55 -0400
Received: by mail-pg1-x529.google.com with SMTP id v11so447308pgb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G5dIOQfTAnDyPM6tY9NBKnGkBV5a8G9OehWdO3jZQmM=;
 b=W5+umAGT8/Qb816YfDP6wCEEhvOS9+EHWJ/lhewK46s2cXJQr0n8anbq/czgPbZ+O3
 auyoKlODIV2hYDps0AclZ7p+hJfBOv3ePxExxr7Fe7fb2ukHJvDXRLDfUHe5sXsq9xUI
 WjBAhwvpEQ9XA63xhxvkTq6JWwHrN0vBK2sYFCbQGC6/unTxBt2/K1kvSpQtENpjK6s+
 VW/4/naFUhzplhi+ySGYtRxU9WcVZsAzaCno14yMkT6QGzGDdbcprXxkbDIJTZPK0NjP
 Eayvmlz1qInQh5s7+yG2ib1gvpPTl2y3UpDBbojvynJnAXgwy7tLZvxm0qnDRkk1JNFm
 6//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G5dIOQfTAnDyPM6tY9NBKnGkBV5a8G9OehWdO3jZQmM=;
 b=B0hKTfL2e7dQGimarUWMzP6dOii6VQktdt1QxdBw49WBiV4syv7aYzBC/fQPou73WO
 v1flQgmc8/tN8Y4uWOba5NE7abaq+GwzqGDUNgYD5l7sogxItRxmeaKforBz/H4I855A
 dskos6X0Ij1OjQ1uSQsP1J1954MmwS20BwTNCqvE4kH0TRB/9M0qrLsidYrkQbZRSVk8
 hXzXEgETdQFZ7yqcFFapHgdoR56WigmxzZkPyaLPXE7WHkZevv58fytLUYqv/lQ+UyZG
 QNVHJvUqQJuFDBdXFzvghyPqFguh7bJrBL0+9NwtUhzDC3z6cb6pTuZVnw/UqVUlYBE9
 oQyQ==
X-Gm-Message-State: AOAM5338YKW0sWrAcsjUzowwo+LPX1PCbsHWDFTo8+yMKTRLWe6sJCkH
 WmYzZFJ1jSj/O/jnBiBZgdQagw==
X-Google-Smtp-Source: ABdhPJwlVUQecOG/AyROsu2ng6+wmtEXJW6jU2WhUz+8PU5CuwAWfSjA95ftjaiH8scjvyq4ymhIhQ==
X-Received: by 2002:aa7:914d:0:b0:44c:61e3:99b9 with SMTP id
 13-20020aa7914d000000b0044c61e399b9mr5545626pfi.65.1633627550774; 
 Thu, 07 Oct 2021 10:25:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id kb15sm80834pjb.43.2021.10.07.10.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:25:50 -0700 (PDT)
Subject: Re: [PULL 00/26] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee3a99c2-a6f6-8768-71be-5816ae4da1b2@linaro.org>
Date: Thu, 7 Oct 2021 10:25:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 11:47 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit ca61fa4b803e5d0abaf6f1ceb690f23bb78a4def:
> 
>    Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20211006' into staging (2021-10-06 12:11:14 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211007
> 
> for you to fetch changes up to 9ae6ecd848dcd1b32003526ab65a0d4c644dfb07:
> 
>    hw/riscv: shakti_c: Mark as not user creatable (2021-10-07 08:41:33 +1000)
> 
> ----------------------------------------------------------------
> Third RISC-V PR for QEMU 6.2
> 
>   - Add Zb[abcs] instruction support
>   - Remove RVB support
>   - Bug fix of setting mstatus_hs.[SD|FS] bits
>   - Mark some UART devices as 'input'
>   - QOMify PolarFire MMUART
>   - Fixes for sifive PDMA
>   - Mark shakti_c as not user creatable
> 
> ----------------------------------------------------------------
> Alistair Francis (1):
>        hw/riscv: shakti_c: Mark as not user creatable
> 
> Bin Meng (5):
>        hw/char: ibex_uart: Register device in 'input' category
>        hw/char: shakti_uart: Register device in 'input' category
>        hw/char: sifive_uart: Register device in 'input' category
>        hw/dma: sifive_pdma: Fix Control.claim bit detection
>        hw/dma: sifive_pdma: Don't run DMA when channel is disclaimed
> 
> Frank Chang (1):
>        target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and V=1 in mark_fs_dirty()
> 
> Philipp Tomsich (16):
>        target/riscv: Introduce temporary in gen_add_uw()
>        target/riscv: fix clzw implementation to operate on arg1
>        target/riscv: clwz must ignore high bits (use shift-left & changed logic)
>        target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
>        target/riscv: Reassign instructions to the Zba-extension
>        target/riscv: Remove the W-form instructions from Zbs
>        target/riscv: Remove shift-one instructions (proposed Zbo in pre-0.93 draft-B)
>        target/riscv: Reassign instructions to the Zbs-extension
>        target/riscv: Add instructions of the Zbc-extension
>        target/riscv: Reassign instructions to the Zbb-extension
>        target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci
>        target/riscv: Add a REQUIRE_32BIT macro
>        target/riscv: Add rev8 instruction, removing grev/grevi
>        target/riscv: Add zext.h instructions to Zbb, removing pack/packu/packh
>        target/riscv: Remove RVB (replaced by Zb[abcs])
>        disas/riscv: Add Zb[abcs] instructions
> 
> Philippe Mathieu-Daudé (3):
>        hw/char/mchp_pfsoc_mmuart: Simplify MCHP_PFSOC_MMUART_REG definition
>        hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion container
>        hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
> 
>   include/hw/char/mchp_pfsoc_mmuart.h     |  17 +-
>   target/riscv/cpu.h                      |  11 +-
>   target/riscv/helper.h                   |   6 +-
>   target/riscv/insn32.decode              | 115 ++++-----
>   disas/riscv.c                           | 157 +++++++++++-
>   hw/char/ibex_uart.c                     |   1 +
>   hw/char/mchp_pfsoc_mmuart.c             | 116 +++++++--
>   hw/char/shakti_uart.c                   |   1 +
>   hw/char/sifive_uart.c                   |   1 +
>   hw/dma/sifive_pdma.c                    |  13 +-
>   hw/riscv/shakti_c.c                     |   7 +
>   target/riscv/bitmanip_helper.c          |  65 +----
>   target/riscv/cpu.c                      |  30 +--
>   target/riscv/translate.c                |  36 ++-
>   target/riscv/insn_trans/trans_rvb.c.inc | 419 ++++++++++----------------------
>   15 files changed, 516 insertions(+), 479 deletions(-)

Applied, thanks.

Remember to update the wiki for the user-facing changes.


r~

