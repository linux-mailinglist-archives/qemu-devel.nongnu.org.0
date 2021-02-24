Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3A3244CB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:57:26 +0100 (CET)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF0Hk-0000De-Ph
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lF0Gk-0008Bq-W3
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:56:23 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lF0Gh-0003Ls-Bu
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:56:22 -0500
Received: from [192.168.100.1] ([82.252.152.102]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MF2YC-1l3yiJ0R7Q-00FW59; Wed, 24 Feb 2021 20:56:11 +0100
Subject: Re: [PATCH] Remove deprecated target tilegx
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210224183952.80463-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <66ad6185-ff2f-3f41-456f-b38d094cbb16@vivier.eu>
Date: Wed, 24 Feb 2021 20:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224183952.80463-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zTHPta+UoWeEHq7kNWm5eXck/DHlA8n4vtJk+iiGWpebXG+zsH1
 SclDfaJRz5+dhY/SDNEu/jy1DF9qu/tei3pJSTK8gl4V8AKXJjFQLJpz6EEUqqAHO8HKEmK
 OzT1AZULRn2eyGmnpZA1j1ga02r+tUF4LIe7dujzAt4BdLknWeKClOVNmea7dqaeGGTFred
 gn3x0pqq6TYIVXG7PV85Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XapdWig/4Ig=:Fgba7tGvUpbnlhl+aqChgw
 ysIq6wrIotD5dV34BT7wqwCLjmcjwtJjM42/NdR/53Pte8fFbqwUbW5PmtpZhmYqInY69mLSY
 8TBuZQy8verIxiwJqVBtJQXw35sM9r4DRBzvRmZYaPZgXjHAVz5flHm4vFwzFhzXrbgfpEWUn
 3nuBMgsQtLR7Tmk76WTHmTTb/NXQPMboOHfPEpOEwYGMhu72ONrPEH5rIv136JQESSoYbnJyh
 Jpk2DhxXWVFyODUGwPNED+Zx1N5PFl2Mk2JMD8Ll6nJsdj+I8yvgeWvfc4p/lDYSJk/UYRRrQ
 NyXEz//5o8nBZEa4zeeK+VghXef+asYrz9VBvNTLhLVcejD1BgNpTr+uZ/ABgsbX7CLPfWt17
 1QAWASTLmB8Irvwdth1FPNaXik65xge/rDbdTN/4kVjhACzbhtE1oRgDJzLg8qJ4HEEk0uCiG
 jRUFajnRbA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chen Gang <gang.chen.5i5j@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/02/2021 à 19:39, Thomas Huth a écrit :
> TILE-Gx was only implemented in linux-user mode, but support for this CPU
> was removed from the upstream Linux kernel in 2018, and it has also been
> dropped from glibc, so there is no new Linux development taking place with
> this architecture. For running the old binaries, users can simply use older
> versions of QEMU.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml                                |    3 +-
>  configure                                     |    2 +-
>  default-configs/targets/tilegx-linux-user.mak |    1 -
>  docs/system/deprecated.rst                    |    8 -
>  docs/system/removed-features.rst              |   14 +
>  include/elf.h                                 |    2 -
>  include/exec/poison.h                         |    1 -
>  linux-user/elfload.c                          |   23 -
>  linux-user/syscall_defs.h                     |   10 +-
>  linux-user/tilegx/cpu_loop.c                  |  287 --
>  linux-user/tilegx/signal.c                    |  178 --
>  linux-user/tilegx/sockbits.h                  |    1 -
>  linux-user/tilegx/syscall_nr.h                |  327 ---
>  linux-user/tilegx/target_cpu.h                |   44 -
>  linux-user/tilegx/target_elf.h                |   14 -
>  linux-user/tilegx/target_fcntl.h              |   11 -
>  linux-user/tilegx/target_signal.h             |   23 -
>  linux-user/tilegx/target_structs.h            |   46 -
>  linux-user/tilegx/target_syscall.h            |   44 -
>  linux-user/tilegx/termbits.h                  |    1 -
>  target/meson.build                            |    1 -
>  target/tilegx/cpu-param.h                     |   17 -
>  target/tilegx/cpu.c                           |  182 --
>  target/tilegx/cpu.h                           |  160 --
>  target/tilegx/helper.c                        |  147 -
>  target/tilegx/helper.h                        |   23 -
>  target/tilegx/meson.build                     |   13 -
>  target/tilegx/opcode_tilegx.h                 | 1406 ----------
>  target/tilegx/simd_helper.c                   |  165 --
>  target/tilegx/spr_def_64.h                    |  212 --
>  target/tilegx/translate.c                     | 2437 -----------------
>  31 files changed, 18 insertions(+), 5785 deletions(-)
>  delete mode 100644 default-configs/targets/tilegx-linux-user.mak
>  delete mode 100644 linux-user/tilegx/cpu_loop.c
>  delete mode 100644 linux-user/tilegx/signal.c
>  delete mode 100644 linux-user/tilegx/sockbits.h
>  delete mode 100644 linux-user/tilegx/syscall_nr.h
>  delete mode 100644 linux-user/tilegx/target_cpu.h
>  delete mode 100644 linux-user/tilegx/target_elf.h
>  delete mode 100644 linux-user/tilegx/target_fcntl.h
>  delete mode 100644 linux-user/tilegx/target_signal.h
>  delete mode 100644 linux-user/tilegx/target_structs.h
>  delete mode 100644 linux-user/tilegx/target_syscall.h
>  delete mode 100644 linux-user/tilegx/termbits.h
>  delete mode 100644 target/tilegx/cpu-param.h
>  delete mode 100644 target/tilegx/cpu.c
>  delete mode 100644 target/tilegx/cpu.h
>  delete mode 100644 target/tilegx/helper.c
>  delete mode 100644 target/tilegx/helper.h
>  delete mode 100644 target/tilegx/meson.build
>  delete mode 100644 target/tilegx/opcode_tilegx.h
>  delete mode 100644 target/tilegx/simd_helper.c
>  delete mode 100644 target/tilegx/spr_def_64.h
>  delete mode 100644 target/tilegx/translate.c
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>


