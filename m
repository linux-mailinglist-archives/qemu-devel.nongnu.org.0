Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0B5093AF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 01:44:29 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhJzn-0000YP-Ng
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 19:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhJyB-0008Dc-KE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 19:42:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhJy9-00014e-LB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 19:42:47 -0400
Received: by mail-pg1-x531.google.com with SMTP id k29so3128643pgm.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 16:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=zxZhuS8W/AwSHTFJoKwfRX8VCNwRneFwdUe7IL0gaMM=;
 b=gnoTu5yN6wgtePT1HxTYvaqxoaOSpAUvmlZZOiVnsVJaFwdgDHbWyrLS0W1bhMzM0o
 UBtkjXgkpzOg/hWUlAewA+WiGZpN4kNLeOhFlnrXNYJIsDzhK2e4mlWn1q90Rpar73Mw
 wonfqzUuobXAHAx41ghtI1PA69UpVmJkyEK0EK54tuEGyS3jBlrDH1wWh4joPa4LSTUs
 2+K086i7MFMDb7ud+cMBk5Vz6RjUfxOIXFkVm1qcc0fod+DoQAH10d7+90aZ8yo6/aUK
 qKiA4XdwZKmhCic/BhBZzHwHAeO8LLKD7huPi6izDtSDw9TpfkrQqKc+fUHbEkHWtnpy
 3m9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=zxZhuS8W/AwSHTFJoKwfRX8VCNwRneFwdUe7IL0gaMM=;
 b=3ORVLHUUC9ceHe5jSg5j/P5Eu59uRll2g5nkvrBQGsq3ogJKCXvxl2ySO6WvU3yYgQ
 xwg6Fsc8o+GzS3rIcRwKn4SolGnVdxRT3lWM7DFG4N3Am7MtBgavUqwiAD4kpDlZDjl5
 AaBuyuSDiqdn35P84cbtcNVC2V4sjm4yeUiMMMUOCwBF10DgeuUvIIO+8Q4pk36uHu+d
 dm7XGVduSdfwivkSS6BfsqgsVk4q1Iic9kaTHmAeedO52c7o6aAHNzJc478cltzI0AXd
 cVOi9YPQ2zrVd6t/0m0zmOo1BREBmskbGs1AIfzSWsJ+CHfPCSqEoG5e+mzahV6iJpYz
 2ssw==
X-Gm-Message-State: AOAM530CJr6wXLU5RyPnmPrntp+dB0Ur560K7ndZSyCx+vdPcML15v+u
 aQ9G80vgRLaZoLgvOSOUSLuWbWdxegX/1Q==
X-Google-Smtp-Source: ABdhPJzWdoh86FQo+CvEO5fuwCEBVM8mIBq7yuLPXUWSc8SeZsGP0BnD+6ZWJSdiD0CkGztyht9+IQ==
X-Received: by 2002:a05:6a00:1749:b0:50a:8eed:b824 with SMTP id
 j9-20020a056a00174900b0050a8eedb824mr13971762pfc.50.1650498163975; 
 Wed, 20 Apr 2022 16:42:43 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8068:1e8a:3e18:1987:201e:37a7?
 ([2607:fb90:8068:1e8a:3e18:1987:201e:37a7])
 by smtp.gmail.com with ESMTPSA id
 n59-20020a17090a5ac100b001cd498dc153sm1049371pji.3.2022.04.20.16.42.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 16:42:42 -0700 (PDT)
Message-ID: <3f4c15ae-0c96-b151-320e-415ac1f3e014@linaro.org>
Date: Wed, 20 Apr 2022 16:42:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/39] Logging cleanup and per-thread logfiles
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

On 4/20/22 11:05, Richard Henderson wrote:
> The following changes since commit 40a4b96eb08b3a3e83895f46b2394748dac7a641:
> 
>    Merge tag 'pull-block-2022-04-20' of https://gitlab.com/hreitz/qemu into staging (2022-04-20 09:39:33 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-log-20220420
> 
> for you to fetch changes up to 4e51069d679348d2617512e56e28cdc7bb34c833:
> 
>    util/log: Support per-thread log files (2022-04-20 10:51:11 -0700)
> 
> ----------------------------------------------------------------
> Clean up log locking.
> Use the FILE* from qemu_log_trylock more often.
> Support per-thread log files with -d tid.

Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Richard Henderson (39):
>        util/log: Drop manual log buffering
>        target/hexagon: Remove qemu_set_log in hexagon_translate_init
>        util/log: Return bool from qemu_set_log_filename
>        util/log: Pass Error pointer to qemu_set_log
>        os-posix: Use qemu_log_enabled
>        util/log: Move qemu_log_lock, qemu_log_unlock out of line
>        util/log: Rename qemu_log_lock to qemu_log_trylock
>        hw/xen: Split out xen_pv_output_msg
>        *: Use fprintf between qemu_log_trylock/unlock
>        util/log: Remove qemu_log_vprintf
>        tcg: Pass the locked filepointer to tcg_dump_ops
>        exec/translator: Pass the locked filepointer to disas_log hook
>        exec/log: Remove log_disas and log_target_disas
>        accel/tcg: Use cpu_dump_state between qemu_log_trylock/unlock
>        target/nios2: Remove log_cpu_state from reset
>        util/log: Use qemu_log_trylock/unlock in qemu_log
>        util/log: Drop return value from qemu_log
>        util/log: Mark qemu_log_trylock as G_GNUC_WARN_UNUSED_RESULT
>        util/log: Remove qemu_log_flush
>        util/log: Drop call to setvbuf
>        bsd-user: Expand log_page_dump inline
>        linux-user: Expand log_page_dump inline
>        tests/unit: Do not reference QemuLogFile directly
>        include/exec/log: Do not reference QemuLogFile directly
>        include/qemu/log: Move entire implementation out-of-line
>        sysemu/os-win32: Test for and use _lock_file/_unlock_file
>        util/log: Introduce qemu_set_log_filename_flags
>        bsd-user: Use qemu_set_log_filename_flags
>        linux-user: Use qemu_set_log_filename_flags
>        softmmu: Use qemu_set_log_filename_flags
>        util/log: Remove qemu_log_close
>        util/log: Rename logfilename to global_filename
>        util/log: Rename qemu_logfile to global_file
>        util/log: Rename qemu_logfile_mutex to global_mutex
>        util/log: Hoist the eval of is_daemonized in qemu_set_log_internal
>        util/log: Combine two logfile closes
>        util/log: Rename QemuLogFile to RCUCloseFILE
>        util/log: Limit RCUCloseFILE to file closing
>        util/log: Support per-thread log files
> 
>   meson.build                          |  12 ++
>   include/exec/log.h                   |  52 +----
>   include/exec/translator.h            |   2 +-
>   include/qemu/log-for-trace.h         |   2 +-
>   include/qemu/log.h                   |  93 +--------
>   include/sysemu/os-win32.h            |  16 +-
>   accel/tcg/cpu-exec.c                 |  18 +-
>   accel/tcg/translate-all.c            | 118 +++++------
>   accel/tcg/translator.c               |  12 +-
>   bsd-user/main.c                      |  54 ++---
>   cpu.c                                |  16 +-
>   hw/net/can/can_sja1000.c             |  25 +--
>   hw/xen/xen_pvdev.c                   |  45 +++--
>   linux-user/main.c                    |  55 +++--
>   linux-user/mmap.c                    |   7 +-
>   monitor/misc.c                       |   9 +-
>   net/can/can_socketcan.c              |  24 ++-
>   os-posix.c                           |   2 +-
>   qemu-img.c                           |   2 +-
>   qemu-io.c                            |   2 +-
>   qemu-nbd.c                           |   2 +-
>   scsi/qemu-pr-helper.c                |   2 +-
>   softmmu/vl.c                         |  21 +-
>   storage-daemon/qemu-storage-daemon.c |   2 +-
>   target/alpha/translate.c             |   7 +-
>   target/arm/translate-a64.c           |   6 +-
>   target/arm/translate.c               |   7 +-
>   target/avr/translate.c               |   7 +-
>   target/cris/translate.c              |   7 +-
>   target/hexagon/translate.c           |  13 +-
>   target/hppa/translate.c              |  15 +-
>   target/i386/tcg/translate.c          |  22 +-
>   target/m68k/translate.c              |   7 +-
>   target/microblaze/translate.c        |   7 +-
>   target/mips/tcg/translate.c          |   7 +-
>   target/nios2/cpu.c                   |   5 -
>   target/nios2/translate.c             |   7 +-
>   target/openrisc/translate.c          |   7 +-
>   target/ppc/translate.c               |   7 +-
>   target/riscv/translate.c             |  10 +-
>   target/rx/translate.c                |   7 +-
>   target/s390x/tcg/translate.c         |  11 +-
>   target/sh4/translate.c               |   7 +-
>   target/sparc/translate.c             |   7 +-
>   target/tricore/translate.c           |   7 +-
>   target/xtensa/translate.c            |   7 +-
>   tcg/tcg.c                            | 184 ++++++++---------
>   tests/unit/test-logging.c            |  42 ++--
>   util/log.c                           | 377 +++++++++++++++++++++++------------
>   49 files changed, 724 insertions(+), 659 deletions(-)


