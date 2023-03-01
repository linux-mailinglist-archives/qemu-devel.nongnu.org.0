Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AE6A763C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXU7C-00057c-Sx; Wed, 01 Mar 2023 16:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXU73-0004w7-U1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:35:53 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXU70-0000Dy-9Z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:35:49 -0500
Received: by mail-pg1-x536.google.com with SMTP id y19so8617542pgk.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677706543;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ME0fUxKCw5pLDPo2HIFL7NkgZLBrJZgmc8oJHeOcSGE=;
 b=awaJbygHf7Uv7sDL5Y6+ZjRG02Unmooy8Q9fHYDjq3v9S29V+DlfDluGFC9mcyN5ts
 umRVzEmwBqtDXbbo72ElTZ3DmeOcfNQjCy0kK+i8V0fzGp+7SPZG6jY6iaMkYha2sQ/V
 VLiTu+sitMP/LA6uWkJWFV7lm7tD5ZbP1DnPj2qrRVbmqOrZ2ivJ+Vjk8R4SMiJIye5B
 Ez59mvNyg2q1c2n7iamzKqc7BsacwIA26dDiG+Z0kr10yrpV4rvVaxR6QmWrFafFULEK
 85w/pYXnxGp6p4Idg8A5Ieokcst7nO5Ve2UZwR4NKbv4bL2Acm0Reez+p+THxPrMYExY
 VtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677706543;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ME0fUxKCw5pLDPo2HIFL7NkgZLBrJZgmc8oJHeOcSGE=;
 b=pR/0HeDmsaBCz6thRqJsc9AneDhExwFh1qn4s0cM5ndd9Rbj6JE8xycWtbUue43EPz
 qNYUTmrdAqU/34sgIXnwkDchhVjFsiuGLIGFYwq8A866bf+OdC9xuMazsnG0DfhUuyHa
 /8mGEQZRYbjt3nPIXcCBACqNVE4DxeYWiguCpb9QMPJD7TP1ClGH+s5vwQz7/PrI/e6V
 7L56fr8IGP4e7HPMQP3hfj8gQm7IVhffM+urhe74j1/T2Q+Np9ODq+BCV4MogLVWoPix
 aTTlERA+3jGVpVr4BJ9S7T3IsHPtTpMjG/gvec1WYlNguxOEDd8kMcmEwA6bpfdEjSkP
 SUHg==
X-Gm-Message-State: AO0yUKWFNihgIqmA0SQWRQjXlFmbfl/7w0E62Yk2Quv3/iGsPXDs6PJj
 eV7j3Mrs7cpEBJfKwlKOsPQ+ANILHGTB2JwC
X-Google-Smtp-Source: AK7set8QqQv+s5cedzFC2OinLFClnOlqsfNfHda4DwkPAvbRfTpdI8SDBAaltBdRnUOCaqnvOly2zw==
X-Received: by 2002:aa7:9805:0:b0:5aa:4df7:7eef with SMTP id
 e5-20020aa79805000000b005aa4df77eefmr7532281pfl.6.1677706542976; 
 Wed, 01 Mar 2023 13:35:42 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e1-20020a635441000000b004fbfefd5183sm620680pgm.80.2023.03.01.13.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:35:42 -0800 (PST)
Date: Wed, 01 Mar 2023 13:35:42 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 12:29:07 PST (-0800)
Subject: Re: [PATCH v7 0/4] riscv: Add support for Zicbo[m,z,p] instructions
In-Reply-To: <20230223234427.521114-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 Richard Henderson <richard.henderson@linaro.org>, dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-1fd4c381-8371-4adc-b597-b4bc05f7afec@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 15:44:23 PST (-0800), dbarboza@ventanamicro.com wrote:
> Hi,
>
> This new version has changes based on feedbacks of both v5 and v6.
>
> Patch 1 was revamped. We're modifying probe_access_flags() to accept a
> 'size' parameter to allow for RISC-V usage with PMP. Changes in the existing
> callers are trivial and no behavior change is done (well, at least it's not
> intended). And we avoid adding another  probe_* API that only RISC-V
> will care about.
>
> Changes from v6:
> - patch 1:
>   - no longer adding a new probe_access_flags_range() API
>   - add a 'size' param to probe_access_flags()
> - patch 2:
>   - check for RISCV_EXCP_ILLEGAL_INST first in check_zicbo_envcfg()
>   - add a probe for MMU_DATA_STORE after check_zicbo_envcfg()
>   - write zeros even if the address isn't mapped to RAM
> - patch 3:
>   - simplify the verifications in check_zicbom_access() by using probe_write()
> - v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05379.html
>
> Christoph Muellner (3):
>   target/riscv: implement Zicboz extension
>   target/riscv: implement Zicbom extension
>   target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder
>
> Daniel Henrique Barboza (1):
>   tcg: add 'size' param to probe_access_flags()
>
>  accel/stubs/tcg-stub.c                      |   2 +-
>  accel/tcg/cputlb.c                          |  17 ++-
>  accel/tcg/user-exec.c                       |   5 +-
>  include/exec/exec-all.h                     |   3 +-
>  semihosting/uaccess.c                       |   2 +-
>  target/arm/ptw.c                            |   2 +-
>  target/arm/sve_helper.c                     |   2 +-
>  target/riscv/cpu.c                          |   7 ++
>  target/riscv/cpu.h                          |   4 +
>  target/riscv/helper.h                       |   5 +
>  target/riscv/insn32.decode                  |  16 ++-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
>  target/riscv/op_helper.c                    | 132 ++++++++++++++++++++
>  target/riscv/translate.c                    |   1 +
>  target/s390x/tcg/mem_helper.c               |   6 +-
>  15 files changed, 247 insertions(+), 14 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case Richard wants to take these along with the TCG patch, otherwise 
I'm happy to take these through the RISC-V tree when that lands (or do 
some sort of shared tag, as we're getting kind of close).

