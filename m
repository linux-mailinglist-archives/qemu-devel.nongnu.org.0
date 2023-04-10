Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2766DC771
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:50:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrt5-0003Ev-MW; Mon, 10 Apr 2023 09:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plrt2-0003EY-N5
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:48:49 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plrt0-0003V1-7m
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:48:48 -0400
Received: by mail-oi1-x233.google.com with SMTP id bf5so3195313oib.8
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681134524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PA22J5N7z4MCbja4K8f/7ZvWnXZAM3OtqYkIRkKLxKk=;
 b=H/MBK6ZnmkpGQMA2EaxEFOA/ogRFHzF4Zk0sebpbSAiinOXclJLQKhyRAFsJ4XshjO
 loj+0G5jc1u8BVkoSe+wZrRytaLCmUbz+YBPc79D05TmDyJisxP3TsKW5QpHdeQlW0VM
 CLTS3leufQTpWZMgqaDp9PPUTt1buisH5Cbk0GNU0kevSy1EgyXtsfu+bsq8dV7WVjeY
 xKpyzeYr3UVVibEWHmeTGgdkY/ap+nG9+niaUFA5lCtfkb4PCKcWQv0QOm1q7oDr9ubQ
 jG2MPu7zFbRyMZIYP2qexRUE0r+OdrJBUCiVxtETmba+Xw+LrKBsM6cHAVIUm/wS7FEf
 ykdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681134524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PA22J5N7z4MCbja4K8f/7ZvWnXZAM3OtqYkIRkKLxKk=;
 b=bQ9AMT7h5HJ23srMB6SVLe+GdfaLQTDXHN1MYYU7vHzEPfx0rzge++IPZA5ScCeoO7
 A5HDaxFCqGyw4R0D7I7LjEf4anpr59IZQ1U8EZnW4nKR9CFwXYeR0MvK6ByeovaKLLII
 TVp4WkO1Wpar2HYHU2TQ6i/7nui0r6F9oW2Ghb5lqbntRAeCyIKM83wAqupgo9c53HoC
 gDGQ2DVPaZz+q45aqtpcnS3sZFxMVzYpvPBkxBemrlKvd6LtaM/VdtZGIr8KI3GZ+Zqx
 94oD/kDisQlAxq74zU0Mi1yiaTN5pg/o/6xcaJTCUP0bwuF41wGjJbwO7GWjd+k0lj2O
 bvqw==
X-Gm-Message-State: AAQBX9dYS93gLUmgB4dwOKF2czRZd0DeHMHdFhYeNTPWyhyMA22ubPVC
 fGsCGWYL1Ckel5fLsBftgH50/Q==
X-Google-Smtp-Source: AKy350a4sWLTsG4Jj+XdzL2+zA2/nW6ba+kJ+dxIIdxc/f4Ef7E7zz5orzYCubZLclSC0nt9G1NfuQ==
X-Received: by 2002:a05:6808:a8b:b0:389:5164:9db2 with SMTP id
 q11-20020a0568080a8b00b0038951649db2mr4797798oij.48.1681134524589; 
 Mon, 10 Apr 2023 06:48:44 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 r142-20020acaa894000000b003871471f894sm4426554oie.27.2023.04.10.06.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 06:48:44 -0700 (PDT)
Message-ID: <0fd5d633-8aac-4186-a7b8-0e27f416bb3f@ventanamicro.com>
Date: Mon, 10 Apr 2023 10:48:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] target/riscv: Separate implicitly-enabled and
 explicitly-enabled extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

On 4/10/23 00:35, Weiwei Li wrote:
> The patch tries to separate the multi-letter extensions that may implicitly-enabled by misa.EXT from the explicitly-enabled cases, so that the misa.EXT can truely disabled by write_misa().
> With this separation, the implicitly-enabled zve64d/f and zve32f extensions will no work if we clear misa.V. And clear misa.V will have no effect on the explicitly-enalbed zve64d/f and zve32f extensions.

For this particular case of write_misa() I'm not sure if we need all that. If we want
to grant user choice on write_misa(), let's say that the user wants to enable/disable
RVV, we can enable/disable all RVV related Z-extensions by hand. It's just a matter
of writing enable/disable code that write_misa() would use.

In the end, write_misa() is also an user choice. If write_misa() wants to disable RVV,
this means that the user wants to disable RVV, so it doesn't matter whether the user
enabled zve32f on the command line or not - we disable zve32f as well. Same thing for
RVC and its related Z-extensions.

The reason why I didn't do this particular code for RVC and RVV is because we have
pending work in the ML that I would like to get it merged first. And there's a few
caveats we need to decide what to do, e.g. what if the user disables F but V is
enabled? Do we refuse write_misa()? Do we disable RVV?


All this said, patch 1 is still a good addition to make it easier to distinguish
the Z-extensions we're enabling due to MISA bits. I believe we should use
set_implicit_extensions_from_ext() in the future for all similar situations.



Thanks,

Daniel



> 
> Weiwei Li (2):
>    target/riscv: Add set_implicit_extensions_from_ext() function
>    target/riscv: Add ext_z*_enabled for implicitly enabled extensions
> 
>   target/riscv/cpu.c                      | 73 +++++++++++++++----------
>   target/riscv/cpu.h                      |  8 +++
>   target/riscv/cpu_helper.c               |  2 +-
>   target/riscv/csr.c                      |  2 +-
>   target/riscv/insn_trans/trans_rvd.c.inc |  2 +-
>   target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
>   target/riscv/insn_trans/trans_rvi.c.inc |  5 +-
>   target/riscv/insn_trans/trans_rvv.c.inc | 16 +++---
>   target/riscv/translate.c                |  4 +-
>   9 files changed, 68 insertions(+), 46 deletions(-)
> 

