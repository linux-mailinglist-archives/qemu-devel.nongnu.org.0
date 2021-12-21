Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC16247C96D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 23:55:39 +0100 (CET)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzo2k-0005XI-C6
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 17:55:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzo17-0004lC-KN
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 17:53:57 -0500
Received: from [2607:f8b0:4864:20::1034] (port=37755
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzo15-0002xw-Ri
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 17:53:57 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so3941355pjj.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 14:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aJR6j6nVrlZcdyukjk0pIlICfCJL03lg2j43ut/f2xg=;
 b=f0RSls8cxGkPA4jBNPFF+1sifRTV8H7UIZaGPhzV49J/21KHhb0NruCdfD9UxcyVzK
 aD49HmdyDXzpALKQoOnlFm9XVh800YY31RExFSXQO0NM/BzCTV6Us/sqTP/8zSpgC3On
 /vvOobGITm/Sy//F+8lRAdZmgEApZ0uUppa4z0yKJN9+r2DmYvmA77G7bg19kukfulYk
 69F9HxZHmpqDBT+zNKtlGOtuTLQbzWUnJ0eMuIgJ3RsNEaBd9Ff6KxGZSA7TH/P80ORV
 MABsO7j22gGcry6pzHbMZCHemiwBqtZ/iHAkMmKCres1Eadb0QkXjlVAtxMOmXBX9MIC
 0ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aJR6j6nVrlZcdyukjk0pIlICfCJL03lg2j43ut/f2xg=;
 b=a0GoE7Sj37524O1IR3I/CUVQUJCxh7zaloIR2W7+jAkXTKrzmy13gjJXOduX28mdX9
 VGu8EULFUi5gvi2U5B6fN/6aNrle/HYoivJqBEw+9djF6+S7TgoXQIQy4qDEkiGOekBl
 K56BQyrch/Rx96cAqnnMNW21ZUlJKQhiXZW9wNXqvrX3AKlgvEt96vhMNw83YwcOsw6N
 M+yy51LTZXtqauDJBzVslHwAopiOvJvOWrx1+TFtNVwmKHNEcztAlf+Gyur9G+HQatEc
 uh4vk/VQTIvjrtcA32ifkDp1ZQ6ZpqLkk4Knw+XCwFlbP5MZb7+hzL5WqVp3SyfoK4zA
 kdtw==
X-Gm-Message-State: AOAM530uGnS6EEcA/A3RergHGNIkowh5H/azbt9VGM4kIVJaH6eTSNEs
 X7Uu7ZzGuf91PgiQvNVLbo4Jqw==
X-Google-Smtp-Source: ABdhPJyO3dO7oyIhxMADMFsglW8xKNAHE0bGqjCMexnQXeOZSvjFBTpMuR4kt6QULmSBI/MgpEZAKw==
X-Received: by 2002:a17:90a:ff17:: with SMTP id
 ce23mr426615pjb.164.1640127234294; 
 Tue, 21 Dec 2021 14:53:54 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id z18sm130111pfe.146.2021.12.21.14.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 14:53:53 -0800 (PST)
Subject: Re: [PATCH v2 00/30] tcg/loongarch64: New tcg backend
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211221212558.1835038-1-richard.henderson@linaro.org>
Message-ID: <27762bf6-2757-537b-4d98-a73c28d99d74@linaro.org>
Date: Tue, 21 Dec 2021 14:53:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221212558.1835038-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: git@xen0n.name
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 1:25 PM, Richard Henderson wrote:
> Version 2: Dropped patch 31, the gitlab-ci change:
> 
> Found errors in your .gitlab-ci.yml:
> 'cross-loongarch64-system' job needs 'loongarch64-cross-container' job
> but 'loongarch64-cross-container' is not in any previous stage
> 'cross-loongarch64-user' job needs 'loongarch64-cross-container' job
> but 'loongarch64-cross-container' is not in any previous stage
> 
> 
> r~
> 
> 
> The following changes since commit 5316e12bb2b4408a1597b283ef4bb4794dd7b4f7:
> 
>    Merge tag 'dbus-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2021-12-21 08:00:26 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-loong-20211221-2
> 
> for you to fetch changes up to dfcf900ba67040ea9aa839aa38b33b4c091721d8:
> 
>    configure, meson.build: Mark support for loongarch64 hosts (2021-12-21 13:17:06 -0800)
> 
> ----------------------------------------------------------------
> Initial commit of tcg/loongarch64
> 
> ----------------------------------------------------------------
> WANG Xuerui (30):
>        elf: Add machine type value for LoongArch
>        MAINTAINERS: Add tcg/loongarch64 entry with myself as maintainer
>        tcg/loongarch64: Add the tcg-target.h file
>        tcg/loongarch64: Add generated instruction opcodes and encoding helpers
>        tcg/loongarch64: Add register names, allocation order and input/output sets
>        tcg/loongarch64: Define the operand constraints
>        tcg/loongarch64: Implement necessary relocation operations
>        tcg/loongarch64: Implement the memory barrier op
>        tcg/loongarch64: Implement tcg_out_mov and tcg_out_movi
>        tcg/loongarch64: Implement goto_ptr
>        tcg/loongarch64: Implement sign-/zero-extension ops
>        tcg/loongarch64: Implement not/and/or/xor/nor/andc/orc ops
>        tcg/loongarch64: Implement deposit/extract ops
>        tcg/loongarch64: Implement bswap{16,32,64} ops
>        tcg/loongarch64: Implement clz/ctz ops
>        tcg/loongarch64: Implement shl/shr/sar/rotl/rotr ops
>        tcg/loongarch64: Implement add/sub ops
>        tcg/loongarch64: Implement mul/mulsh/muluh/div/divu/rem/remu ops
>        tcg/loongarch64: Implement br/brcond ops
>        tcg/loongarch64: Implement setcond ops
>        tcg/loongarch64: Implement tcg_out_call
>        tcg/loongarch64: Implement simple load/store ops
>        tcg/loongarch64: Add softmmu load/store helpers, implement qemu_ld/qemu_st ops
>        tcg/loongarch64: Implement tcg_target_qemu_prologue
>        tcg/loongarch64: Implement exit_tb/goto_tb
>        tcg/loongarch64: Implement tcg_target_init
>        tcg/loongarch64: Register the JIT
>        common-user: Add safe syscall handling for loongarch64 hosts
>        linux-user: Implement CPU-specific signal handler for loongarch64 hosts
>        configure, meson.build: Mark support for loongarch64 hosts
> 
>   configure                                       |    5 +
>   meson.build                                     |    2 +-
>   include/elf.h                                   |    2 +
>   linux-user/host/loongarch64/host-signal.h       |   87 ++
>   tcg/loongarch64/tcg-target-con-set.h            |   31 +
>   tcg/loongarch64/tcg-target-con-str.h            |   28 +
>   tcg/loongarch64/tcg-target.h                    |  180 +++
>   tcg/loongarch64/tcg-insn-defs.c.inc             |  979 +++++++++++++
>   tcg/loongarch64/tcg-target.c.inc                | 1677 +++++++++++++++++++++++
>   MAINTAINERS                                     |    5 +
>   common-user/host/loongarch64/safe-syscall.inc.S |   90 ++
>   11 files changed, 3085 insertions(+), 1 deletion(-)
>   create mode 100644 linux-user/host/loongarch64/host-signal.h
>   create mode 100644 tcg/loongarch64/tcg-target-con-set.h
>   create mode 100644 tcg/loongarch64/tcg-target-con-str.h
>   create mode 100644 tcg/loongarch64/tcg-target.h
>   create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
>   create mode 100644 tcg/loongarch64/tcg-target.c.inc
>   create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S

Applied, thanks.


r~


