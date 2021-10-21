Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CDA436B45
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:22:01 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdddY-0000FY-KJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mddbK-0006gN-Q8
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 15:19:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mddbJ-00067r-3w
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 15:19:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso1312580pjw.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TFpPC7YN2KrYbfN0XEh+ekZ4ofGcnFkKniDPDuURfrM=;
 b=tYTg1P+HUbiX2xIIX67NkNJAhSVdr6oVKa4UheuuvqmX7bzYlpv/4gHswdjiur9Z+v
 ddTL1SMjgKMN9OyI4Ky9qmznLsgmQ2Jg2D5zrXw6ocWOnLVDxPVSOIWnInE2CWqQL6RR
 yZCk2uaDwPgJzGbGISNjvo4VxJfhxoAKl54RbzXd7tm7AOpEI56xeyYLXcLQ36/LqwcA
 NUPB0xthw2/6IduaakuiYm8zoHrrXEAPPmxGZH6dwU6P2h846IyhqcvXJamCTTEw6ffi
 4juOiRCGdU4OMBd2UGPReStB2Wur+2InY7dw/TiXT6Hiqecqn8A4y5Hd45Zmtby2u1/r
 Fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TFpPC7YN2KrYbfN0XEh+ekZ4ofGcnFkKniDPDuURfrM=;
 b=hahlRBzcrLyK5NKxaIg3FezY5DqmsRkrvk2OEfN2Yyj7IBvb8cTwJV9UDCY6IDiNJr
 6/7I5cCHdZhoYZKqoStUAmJ3bqw0nHkYJeDstJVqKZVbSpVUhgkG0Y9DuoukwG7yNAgY
 tVSGQd7Ed9qcpXe0UE2V5pJu9XMVCM5YKMriWPtPJUxsqe78/sAvmEyyd62LvAEO/OJV
 Xa20ctkQbB1gdVQB17rcb0QqG4/Igr/TCrujr3TXliozAczHMR6Qo1fkcjn5HACH/Wp/
 o21NBcDgDORgwPMzKFf8lWpn9M4vkEjuPFcTdeXDRCeL5ogup+5KsxgTsGMRPMhGY56Z
 5iMQ==
X-Gm-Message-State: AOAM5322Apw9pjmvuKpOysJiBY0SCJDT473VSrxWxDDD8dFnajFEQjRa
 f1O3vwb9a3dFyYKmShk+2xmX+RnhHnY1Zg==
X-Google-Smtp-Source: ABdhPJws5meTwt9E3aeegwpULRAPp1jBMv+6lkaMHhZO8Ne3Ougiq8eoMutg5Xshsx0q6/kXOItnvw==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id
 c17-20020a170902b691b029012d02b6d116mr6778454pls.71.1634843979527; 
 Thu, 21 Oct 2021 12:19:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm6863593pfo.188.2021.10.21.12.19.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 12:19:39 -0700 (PDT)
Subject: Re: [PULL 00/19] target/arm patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211021152541.781175-1-richard.henderson@linaro.org>
Message-ID: <e6db062f-fe08-686a-aa93-ef3990965092@linaro.org>
Date: Thu, 21 Oct 2021 12:19:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 8:25 AM, Richard Henderson wrote:
> The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-arm-20211021
> 
> for you to fetch changes up to f801789ff00f457044dcd91323316dbde42578d1:
> 
>    tests/data/acpi/virt: Update the empty expected file for PPTT (2021-10-21 08:04:15 -0700)
> 
> ----------------------------------------------------------------
> Introduce cpu topology support
> Generate DBG2 table
> Switch to ssize_t for elf loader return type
> Fixed sbsa cpu type error message typo
> Only initialize required submodules for edk2
> Dont create device-tree node for empty NUMA node
> 
> ----------------------------------------------------------------
> Andrew Jones (2):
>        hw/arm/virt: Add cpu-map to device tree
>        hw/acpi/aml-build: Add PPTT table
> 
> Eric Auger (6):
>        tests/acpi: Get prepared for IORT E.b revision upgrade
>        hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
>        tests/acpi: Generate reference blob for IORT rev E.b
>        tests/acpi: Add void table for virt/DBG2 bios-tables-test
>        hw/arm/virt_acpi_build: Generate DBG2 table
>        bios-tables-test: Generate reference table for virt/DBG2
> 
> Gavin Shan (1):
>        hw/arm/virt: Don't create device-tree node for empty NUMA node
> 
> Luc Michel (1):
>        hw/elf_ops.h: switch to ssize_t for elf loader return type
> 
> Philippe Mathieu-Daudé (2):
>        roms/edk2: Only init brotli submodule to build BaseTools
>        roms/edk2: Only initialize required submodules
> 
> Shuuichirou Ishii (1):
>        hw/arm/sbsa-ref: Fixed cpu type error message typo.
> 
> Yanan Wang (6):
>        hw/arm/virt: Only describe cpu topology since virt-6.2
>        device_tree: Add qemu_fdt_add_path
>        hw/acpi/aml-build: Add Processor hierarchy node structure
>        tests/data/acpi/virt: Add an empty expected file for PPTT
>        hw/arm/virt-acpi-build: Generate PPTT table
>        tests/data/acpi/virt: Update the empty expected file for PPTT
> 
>   include/hw/acpi/aml-build.h       |   3 +
>   include/hw/arm/virt.h             |   4 +-
>   include/hw/elf_ops.h              |  27 ++++-----
>   include/hw/loader.h               |  58 +++++++++----------
>   include/sysemu/device_tree.h      |   1 +
>   hw/acpi/aml-build.c               |  89 +++++++++++++++++++++++++++++
>   hw/arm/boot.c                     |  13 +++++
>   hw/arm/sbsa-ref.c                 |   2 +-
>   hw/arm/virt-acpi-build.c          | 117 +++++++++++++++++++++++++++++++-------
>   hw/arm/virt.c                     |  71 +++++++++++++++++++----
>   hw/core/loader.c                  |  60 +++++++++----------
>   softmmu/device_tree.c             |  44 +++++++++++++-
>   .gitlab-ci.d/edk2.yml             |   6 +-
>   roms/Makefile                     |   3 +-
>   roms/Makefile.edk2                |   7 ++-
>   scripts/make-release              |   7 ++-
>   tests/data/acpi/virt/DBG2         | Bin 0 -> 87 bytes
>   tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
>   tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
>   tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
>   tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
>   tests/data/acpi/virt/PPTT         | Bin 0 -> 76 bytes
>   22 files changed, 403 insertions(+), 109 deletions(-)
>   create mode 100644 tests/data/acpi/virt/DBG2
>   create mode 100644 tests/data/acpi/virt/PPTT

Applied, thanks.

r~


