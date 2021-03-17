Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D5433E298
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:25:53 +0100 (CET)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMK0W-0005s5-U0
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJym-0005QM-0v
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:24:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJyk-0005d0-Dd
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:24:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id d15so11399413wrv.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eso8Q1m8oBEvbBvIBN1WMlKZ9h5JGkl8BCPhetqClP4=;
 b=EHFvdecau3nXwfayyVJsp/11B/JIh7yulUTBH6mhLPJvRiYcG0i4mmyEPSCZFFIcAn
 rm4lPLe3mqAZ36jApysc9xiRcyz9ekflLNeWXVeq6RZhTrxDAetVRj+Iukzb7Zv6OBkI
 NByiilpKPk0nRc+jq5JplcQ96Xve5O2lJsL1R4xzQkGPf4FZZncitSXo3XMguPEe8uXx
 ExaE84yRiguxbkSyLqP63Kwenb1aiQ2tfzli56T8ZtRx+0B35eBlLgzpJPEDZ7fYFGrk
 zZtrOlh9ja4O8xmxI4YGdYdWcavv6WuCt5nTA8cSslVoyYguuqPJg71zQ82S/s7G3BL7
 ZBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eso8Q1m8oBEvbBvIBN1WMlKZ9h5JGkl8BCPhetqClP4=;
 b=ojGGTEd02G2xdl1DP9eQJ3aryRokqSZ6dFw+wImUcbMhwQsgmmJwV0DKJh0mHViFeq
 Sa8wW1EuaFEH1rPvNV+H6N7YTD4gkhorYhHb5JeyHjTlMhz0HHWgIM6hk1wz4/Ec6HKQ
 13jPfd3mX8maFmXz3n/4xw5n36RCeagbV60Xx9xD4P93fCWhLZEAFYU/1AxsbNAl9arN
 SIlqY7LOU6HF+wQE3GlkmJtJqJReHfa+9htg580upI7Lx7sfkD2q31m0gpbLIxx1kIVH
 VjA7coy9KAGCDzY6aBXj4RQ69OxrHXig8Py524Wa1Z8nQRjTMD0dFeN0/kT+Tn51wLZ7
 cKPg==
X-Gm-Message-State: AOAM530K62fOv58a/VHqawQRvhqBhEoTt3jzqSmQdVXnBKLG+/A3N2JY
 FrDoeB3jD9ddjJe3DhOo/Qc=
X-Google-Smtp-Source: ABdhPJz+iCaXuDTDzExEy2hP68VCCecXdvzYrBTydBl/3fBvtzVBabcdm4Twv2dfLM0VqG5tKtR47A==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr1510631wrt.31.1615940640633;
 Tue, 16 Mar 2021 17:24:00 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h6sm799681wmi.6.2021.03.16.17.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:24:00 -0700 (PDT)
Subject: Re: [PATCH v5 00/57] TCI fixes and cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8885d213-be25-d75e-a6eb-1c7c4f07b74b@amsat.org>
Date: Wed, 17 Mar 2021 01:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> 
> Richard Henderson (57):
>   tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
>   tcg/tci: Rename tci_read_r to tci_read_rval
>   tcg/tci: Split out tci_args_rrs
>   tcg/tci: Split out tci_args_rr
>   tcg/tci: Split out tci_args_rrr
>   tcg/tci: Split out tci_args_rrrc
>   tcg/tci: Split out tci_args_l
>   tcg/tci: Split out tci_args_rrrrrc
>   tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
>   tcg/tci: Split out tci_args_ri and tci_args_rI
>   tcg/tci: Reuse tci_args_l for calls.
>   tcg/tci: Reuse tci_args_l for exit_tb
>   tcg/tci: Reuse tci_args_l for goto_tb
>   tcg/tci: Split out tci_args_rrrrrr
>   tcg/tci: Split out tci_args_rrrr
>   tcg/tci: Clean up deposit operations
>   tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to 32-bits
>   tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
>   tcg/tci: Hoist op_size checking into tci_args_*
>   tcg/tci: Remove tci_disas
>   tcg/tci: Implement the disassembler properly
>   tcg: Build ffi data structures for helpers
>   tcg/tci: Use ffi for calls
>   tcg/tci: Improve tcg_target_call_clobber_regs
>   tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
>   tcg/tci: Push opcode emit into each case
>   tcg/tci: Split out tcg_out_op_rrs
>   tcg/tci: Split out tcg_out_op_l
>   tcg/tci: Split out tcg_out_op_p
>   tcg/tci: Split out tcg_out_op_rr
>   tcg/tci: Split out tcg_out_op_rrr
>   tcg/tci: Split out tcg_out_op_rrrc
>   tcg/tci: Split out tcg_out_op_rrrrrc
>   tcg/tci: Split out tcg_out_op_rrrbb
>   tcg/tci: Split out tcg_out_op_rrcl
>   tcg/tci: Split out tcg_out_op_rrrrrr
>   tcg/tci: Split out tcg_out_op_rrrr
>   tcg/tci: Split out tcg_out_op_rrrrcl
>   tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
>   tcg/tci: Split out tcg_out_op_v
>   tcg/tci: Split out tcg_out_op_np
>   tcg/tci: Split out tcg_out_op_r[iI]
>   tcg/tci: Reserve r13 for a temporary
>   tcg/tci: Emit setcond before brcond
>   tcg/tci: Remove tci_write_reg
>   tcg/tci: Change encoding to uint32_t units
>   tcg/tci: Implement goto_ptr
>   tcg/tci: Implement movcond
>   tcg/tci: Implement andc, orc, eqv, nand, nor
>   tcg/tci: Implement extract, sextract
>   tcg/tci: Implement clz, ctz, ctpop
>   tcg/tci: Implement mulu2, muls2
>   tcg/tci: Implement add2, sub2
>   tcg/tci: Split out tci_qemu_ld, tci_qemu_st
>   tests/tcg: Increase timeout for TCI
>   gitlab: Rename ACCEL_CONFIGURE_OPTS to EXTRA_CONFIGURE_OPTS
>   gitlab: Enable cross-i386 builds of TCI
> 
>  configure                                     |    3 +
>  meson.build                                   |    9 +-
>  include/exec/helper-ffi.h                     |  115 ++
>  include/exec/helper-tcg.h                     |   24 +-
>  include/tcg/tcg-opc.h                         |    6 +-
>  include/tcg/tcg.h                             |    1 +
>  target/hppa/helper.h                          |    2 +
>  target/i386/ops_sse_header.h                  |    6 +
>  target/m68k/helper.h                          |    1 +
>  target/ppc/helper.h                           |    3 +
>  tcg/tci/tcg-target-con-set.h                  |    2 +-
>  tcg/tci/tcg-target.h                          |   81 +-
>  disas/tci.c                                   |   61 -
>  tcg/tcg.c                                     |   88 +-
>  tcg/tci.c                                     | 1517 ++++++++++-------
>  tcg/tci/tcg-target.c.inc                      |  704 +++++---
>  .gitlab-ci.d/crossbuilds.yml                  |   21 +-
>  tcg/tci/README                                |   20 +-
>  .../dockerfiles/fedora-i386-cross.docker      |    1 +
>  tests/docker/dockerfiles/fedora.docker        |    1 +

Except the Docker part, tested running SH4 on HPPA, so:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

BTW -d out_asm looks nice ;)

