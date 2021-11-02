Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D634439BF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:31:10 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3FF-0005Qu-EM
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi37z-0001Fo-HS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:23:39 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi37w-0006ud-P4
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:23:39 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id k29so689920qve.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 16:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oas+l9HA7BaPwr8klY91y5bRuUDfnyNqvYYUuk3eBA4=;
 b=mcidwy5fFb3tFChbptPrYFTj1jgM0+1gYGKPLwhihcUyrEregVOb7D53ZgUJ+Fc/GA
 f4PjQCh2iMBK7fBZzaNSwge2uHDUEWaPQrhkChGi9eyA3xSEr7FfKgXVCdpaN8dTE9Pw
 kIdsQGAzy49X9hyll6X33VWy1v0H2QE0Qi6dJIi3HqzO9SwgN3RpcJ3w6aaQJer8xCHu
 Mx9XSjSau2Fvms9Wgs45+3gigJfDE2pyZIPtncbxqfGBpylbHQ2W5ahz3kZVnEVxiRqD
 LjGRqu/51tUCOvjMkcbNLJz4GiysuJi58uTtBpeRDQpJVn42aQYbX60TP73Q5I23gd5p
 VByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oas+l9HA7BaPwr8klY91y5bRuUDfnyNqvYYUuk3eBA4=;
 b=J90M65fRgTOWC05NpWmnt5kNk9htz+996toW7D5j+0jyP7w9sW8I6Wvrq/QTII2/pI
 VoJhtVLfBe16o9NhPvVNTabpYsDU4GY+0ytTCn7pALS7e080SHY0qpEUIgf5ss5QefDy
 0ULbWA3UbY/Z4x6s60F1iHtwoKNY5NHyR2bY1nlw1/G+cN3OilUTC08DOeygjvD3z85C
 3C+Jjh7u1WPUbJv8bADhxa8DgfpBiNtHF5qxm5ldbmVz2eL+I/E4pSLXLocJHTCiI5EF
 uxCmu2ngix80vaCeOTHZAWgdHy3DxsQl6Yz5BZuYijif2me4+KJ5VuDIX/FtnFefEAfn
 DIww==
X-Gm-Message-State: AOAM531PAm2GELZ2WhtKR9AP3PPsRJhq2P2vOIEOSea18YLamXOmEkBp
 cAD2RA7H1QeNiJmmMy5VDa0+Lw==
X-Google-Smtp-Source: ABdhPJyE55bJrjRy04aKAELTYCGN1BDpaKftBBD2xnXN454hDh0Ug5em2Gn47L97Q1+f2QQYVxNxtw==
X-Received: by 2002:a05:6214:1d2b:: with SMTP id
 f11mr23280000qvd.7.1635895415373; 
 Tue, 02 Nov 2021 16:23:35 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id ay36sm328354qkb.63.2021.11.02.16.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 16:23:35 -0700 (PDT)
Subject: Re: [PULL 00/41] MIPS patches for 2021-11-02
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211102134240.3036524-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8033456b-97c1-ca4a-50b8-26d212bd54d7@linaro.org>
Date: Tue, 2 Nov 2021 19:23:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 9:41 AM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 844d6dfc3e48a8d404b03ea815868fd01c6f7317:
> 
>    Merge remote-tracking branch 'remotes/alex.williamson/tags/vfio-update-20211101.0' into staging (2021-11-02 07:25:59 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/mips-20211102
> 
> for you to fetch changes up to 6f08c9c5316a80a049d4861eaac5844466ba3eba:
> 
>    Revert "elf: Relax MIPS' elf_check_arch() to accept EM_NANOMIPS too" (2021-11-02 14:35:22 +0100)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> - Fine-grained MAINTAINERS sections
> - Fix MSA MADDV.B / MSUBV.B opcodes
> - Convert MSA opcodes to decodetree
> - Correct Loongson-3A4000 MSAIR register
> - Do not accept ELF nanoMIPS binaries on linux-user
> - Use ISA instead of PCI interrupts in VT82C686 PCI device
> 
> ----------------------------------------------------------------
> 
> BALATON Zoltan (4):
>    usb/uhci: Misc clean up
>    usb/uhci: Disallow user creating a vt82c686-uhci-pci device
>    usb/uhci: Replace pci_set_irq with qemu_set_irq
>    hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
> 
> Philippe Mathieu-Daudé (37):
>    MAINTAINERS: Add MIPS general architecture support entry
>    MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware
>    MAINTAINERS: Split MIPS TCG frontend vs MIPS machines/hardware
>    target/mips: Fix MSA MADDV.B opcode
>    target/mips: Fix MSA MSUBV.B opcode
>    target/mips: Adjust style in msa_translate_init()
>    target/mips: Use dup_const() to simplify
>    target/mips: Have check_msa_access() return a boolean
>    target/mips: Use enum definitions from CPUMIPSMSADataFormat enum
>    target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
>    target/mips: Convert MSA LDI opcode to decodetree
>    target/mips: Convert MSA I5 instruction format to decodetree
>    target/mips: Convert MSA BIT instruction format to decodetree
>    target/mips: Convert MSA SHF opcode to decodetree
>    target/mips: Convert MSA I8 instruction format to decodetree
>    target/mips: Convert MSA load/store instruction format to decodetree
>    target/mips: Convert MSA 2RF instruction format to decodetree
>    target/mips: Convert MSA FILL opcode to decodetree
>    target/mips: Convert MSA 2R instruction format to decodetree
>    target/mips: Convert MSA VEC instruction format to decodetree
>    target/mips: Convert MSA 3RF instruction format to decodetree
>      (DF_HALF)
>    target/mips: Convert MSA 3RF instruction format to decodetree
>      (DF_WORD)
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>      1/4)
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>      2/4)
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>      3/4)
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>      4/4)
>    target/mips: Convert MSA ELM instruction format to decodetree
>    target/mips: Convert MSA COPY_U opcode to decodetree
>    target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree
>    target/mips: Convert MSA MOVE.V opcode to decodetree
>    target/mips: Convert CFCMSA opcode to decodetree
>    target/mips: Convert CTCMSA opcode to decodetree
>    target/mips: Remove generic MSA opcode
>    target/mips: Remove one MSA unnecessary decodetree overlap group
>    target/mips: Fix Loongson-3A4000 MSAIR config register
>    target/mips: Remove obsolete FCR0_HAS2008 comment on P5600 CPU
>    Revert "elf: Relax MIPS' elf_check_arch() to accept EM_NANOMIPS too"
> 
>   hw/usb/hcd-uhci.h               |    3 +-
>   target/mips/tcg/msa.decode      |  243 ++-
>   hw/usb/hcd-uhci.c               |   14 +-
>   hw/usb/vt82c686-uhci-pci.c      |   15 +
>   linux-user/elfload.c            |    2 -
>   target/mips/tcg/msa_helper.c    |   64 +-
>   target/mips/tcg/msa_translate.c | 2743 +++++++------------------------
>   target/mips/cpu-defs.c.inc      |    2 +-
>   MAINTAINERS                     |   37 +-
>   9 files changed, 957 insertions(+), 2166 deletions(-)

Applied, thanks.

r~


