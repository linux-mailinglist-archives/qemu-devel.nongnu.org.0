Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8317D51E69C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 13:16:32 +0200 (CEST)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnIQJ-0005T4-6H
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 07:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnINF-0004nB-Uz
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:13:21 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnINE-0000q4-5D
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:13:21 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 7so8113127pga.12
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bQnQxpHxhSRvGX6jdPSKik6xQiF2F+/rL0K3EED0ZUo=;
 b=ly2u4BBDuH3K/vc/lfPid5OgqZhvWzQQLQTK0BoVR+Dfmkdw8zjKbR4W3z+L0Zv3b7
 cfLJOuxghKsTwTHPCRvM9BQX2fHVfK01Y574SKopePacte3/Iy2/MqOv22gsMa79bSXj
 MhiZc2MyUTg0cG+Qk2HXw6TV54cHjgiryYujndVhG7WcbKa5WohmGG4F8C+CcTPJhzwR
 aA7LdPsnpkB3C0XBqydJHKbYbvne/81X6n+w5H9JEKuISbYPW80lRxzhJpMlqkoQaho5
 +3cq6I4pzZEk6EjjKGWvhUOGt3wjACN0a+MsrubHi4S5AXd87L2QUdUxk9TMF8+rDBY0
 yZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bQnQxpHxhSRvGX6jdPSKik6xQiF2F+/rL0K3EED0ZUo=;
 b=PfB7BcLuUOMDVZUzvm3lqFR32rxK/irITSXaH+JRRw0M6VfDxFyUzqJxbVVRQ9/M15
 0a4eZnV3Iv/Yd9cNpEWMCe8vDQZqcfuaNGcUGwUhc/oQUjNfhO4PeQLPtABoQ8KumHcZ
 DNoq/aRHptEPSG57QenzK/lvp5JwTVNQ4URlrHsbDf4pdER5S9azwb9Ue+o3CTFUi0kR
 +ebhSaF2GsIn7aZNWDDArTglq03+04R67Us/ofBmgoeQhTA8REkGougrofKaIJYrcWJh
 wawkoLvm6nySDtleyE7rUxsT3/hWaWk97cf5rWFm9GxMXwfeekiR34DT8gMwHqbphSOh
 PbDQ==
X-Gm-Message-State: AOAM5331IoxesSz7zlVpQVtBLllf/P1IQofb++mWNrx6DLUl9Vcjaaat
 nzL5QAQGjRJUtAGlwxLiuHb8tQ==
X-Google-Smtp-Source: ABdhPJyUekCTrnDWN5/5SjCxI2qmewJJTpbeaNL0CPjk5Y1cDhWijzdbC5Ty5+bnNl5gp/MerWjCiw==
X-Received: by 2002:a63:561c:0:b0:3c1:42fb:cd81 with SMTP id
 k28-20020a63561c000000b003c142fbcd81mr6490609pgb.104.1651921998588; 
 Sat, 07 May 2022 04:13:18 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 w12-20020a17090aea0c00b001d9e3b0e10fsm8906088pjy.16.2022.05.07.04.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 04:13:18 -0700 (PDT)
Message-ID: <f3de97de-99d6-409c-b753-23087e3207b6@linaro.org>
Date: Sat, 7 May 2022 06:13:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/18] target/xtensa updates for v7.1
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220506224331.3886707-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506224331.3886707-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 5/6/22 17:43, Max Filippov wrote:
> Hello,
> 
> please pull the following updates for the target/xtensa.
> 
> Changes since v1:
> - rebase series to the current master
> - drop big-endian tests enabling patch (cannot test it because of the
>    test infrastructure change)
> - add cache testing opcodes patch
> 
> The following changes since commit 31abf61c4929a91275fe32f1fafe6e6b3e840b2a:
> 
>    Merge tag 'pull-ppc-20220505' of https://gitlab.com/danielhb/qemu into staging (2022-05-05 13:52:22 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/OSLL/qemu-xtensa.git tags/20220506-xtensa-1
> 
> for you to fetch changes up to 59491e97f89eaeee275f57fb6bb40f0152429fb3:
> 
>    target/xtensa: implement cache test option opcodes (2022-05-06 15:37:10 -0700)
> 
> ----------------------------------------------------------------
> target/xtensa updates for v7.1:
> 
> - expand test coverage to MMUv3, cores without windowed registers or
>    loop option;
> - import lx106 core (used in the esp8266 IoT chips);
> - use tcg_constant_* in the front end;
> - add clock input to the xtensa CPU;
> - fix reset state of the xtensa MX PIC;
> - implement cache testing opcodes.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Max Filippov (17):
>        target/xtensa: fix missing tcg_temp_free in gen_window_check
>        target/xtensa: use tcg_contatnt_* for numeric literals
>        target/xtensa: use tcg_constant_* for exceptions
>        target/xtensa: use tcg_constant_* for TLB opcodes
>        target/xtensa: use tcg_constant_* for numbered special registers
>        target/xtensa: use tcg_constant_* for FPU conversion opcodes
>        target/xtensa: use tcg_constant_* for remaining opcodes
>        target/xtensa: add clock input to xtensa CPU
>        hw/xtensa: fix reset value of MIROUT register of MX PIC
>        tests/tcg/xtensa: fix build for cores without windowed registers
>        tests/tcg/xtensa: restore vecbase SR after test
>        tests/tcg/xtensa: fix watchpoint test
>        tests/tcg/xtensa: remove dependency on the loop option
>        tests/tcg/xtensa: enable autorefill phys_mem tests for MMUv3
>        tests/tcg/xtensa: enable mmu tests for MMUv3
>        tests/tcg/xtensa: fix vectors and checks in timer test
>        target/xtensa: implement cache test option opcodes
> 
> Simon Safar (1):
>        target/xtensa: import core lx106
> 
>   hw/xtensa/mx_pic.c                            |    2 +-
>   target/xtensa/core-lx106.c                    |   51 +
>   target/xtensa/core-lx106/core-isa.h           |  470 ++
>   target/xtensa/core-lx106/gdb-config.c.inc     |   83 +
>   target/xtensa/core-lx106/xtensa-modules.c.inc | 7668 +++++++++++++++++++++++++
>   target/xtensa/cores.list                      |    1 +
>   target/xtensa/cpu.c                           |   15 +
>   target/xtensa/cpu.h                           |    5 +
>   target/xtensa/op_helper.c                     |    7 +-
>   target/xtensa/translate.c                     |  211 +-
>   tests/tcg/xtensa/crt.S                        |    2 +
>   tests/tcg/xtensa/test_break.S                 |   86 +-
>   tests/tcg/xtensa/test_mmu.S                   |  182 +-
>   tests/tcg/xtensa/test_phys_mem.S              |   10 +-
>   tests/tcg/xtensa/test_sr.S                    |    2 +
>   tests/tcg/xtensa/test_timer.S                 |   68 +-
>   16 files changed, 8604 insertions(+), 259 deletions(-)
>   create mode 100644 target/xtensa/core-lx106.c
>   create mode 100644 target/xtensa/core-lx106/core-isa.h
>   create mode 100644 target/xtensa/core-lx106/gdb-config.c.inc
>   create mode 100644 target/xtensa/core-lx106/xtensa-modules.c.inc
> 


