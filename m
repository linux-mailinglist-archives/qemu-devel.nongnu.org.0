Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18423523F9A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 23:46:01 +0200 (CEST)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nou9f-00027H-LS
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 17:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nou7M-00013X-HS
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:43:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nou7K-00047g-6n
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:43:36 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so6075511pjv.4
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ywijnRQdwyEBIglQeNYlkUn1R+WoRLyxDqbCxfWNDnI=;
 b=LEOU72kUW76/tqzIPGyjZwSjafmzr4NJMOJYeSsl7XS8grHWm1R8kqrbMquCdxpKj3
 3/4HoVVXf8w/FeIgPfJefkLxJzYciXJ10sQQNp7a6cJPfcObFzxy3ITCUA/fSb6HYZu6
 qjMEsezqbyQHAEDK2aTleASTNGm8MEzlyMTyvkBXqtsUIp1izmGrxKHKUOKs7eLaAa4e
 SIplF0jqIoWVeRgcZX8C+GMVQS88zInjIIYXWEN9y0BpOKoX+iE71+ZH6Is/uIKsww/c
 BVNJp07q2iIEESEN95C704MFvRmCE48m30JNYvJbsxBo3t1sY49RMar5CDpdB8to5Sxy
 IGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ywijnRQdwyEBIglQeNYlkUn1R+WoRLyxDqbCxfWNDnI=;
 b=VrOkCFbKGKZJdnHVrxiCFm4Z+sQMidJ+5qPIauD+BLcMbTtENhRVitnjmUID/8+fnP
 /0SANDavMsUL1veFfBSFEYD7ijEPCPyTCKQ9KOZK7TyWVN7SRKtRwlS0vdFteSb1+P0P
 lask+PAMTobeipk0F7HQpps9fauOY4aVtR308ymBRpQSmjqe62l8c0IC+TMCwGgtpLel
 uFdnXmA/sKpGrrbaBtDdfRphbZYcnMjx3gY5dspoKPZVC05qpSYwUFikJHzTzMKrKK3T
 wl8GBK3J1iSxTl767qEfTZ4boSCSFfAWLtisQCTBK1//IxaBkMv+LRVuiW9rrV2zOLqJ
 C44Q==
X-Gm-Message-State: AOAM531x3YpbWR9TqmmgWf5yPswJJsQiBQvOEvsvNfiG2o6lU37gZIPt
 xrApPV/N3CtjObzzsTN80ZBycg==
X-Google-Smtp-Source: ABdhPJwUIJSvMiuWZWmgvXhltCPdRGzYkz0418UwfgWbWdZFbvx1+zqbOcSX7HnU7bGYOUt8fIY1DQ==
X-Received: by 2002:a17:90b:3a83:b0:1dc:b7d4:8395 with SMTP id
 om3-20020a17090b3a8300b001dcb7d48395mr7353733pjb.173.1652305412370; 
 Wed, 11 May 2022 14:43:32 -0700 (PDT)
Received: from [192.168.86.227] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 s6-20020aa78d46000000b005107a4d5096sm2218226pfe.30.2022.05.11.14.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 14:43:31 -0700 (PDT)
Message-ID: <25477bf6-2068-de4c-eab6-d93dc4b842fa@linaro.org>
Date: Wed, 11 May 2022 14:43:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/4] Miscellaneous patches patches for 2022-05-11
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220511145922.3431407-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220511145922.3431407-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 5/11/22 07:59, Markus Armbruster wrote:
> The following changes since commit 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-05-09 11:07:04 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-misc-2022-05-11
> 
> for you to fetch changes up to ea9cea93c69d508a333dd1b0cb1a44f6daf80b63:
> 
>    Clean up decorations and whitespace around header guards (2022-05-11 16:50:32 +0200)
> 
> ----------------------------------------------------------------
> Miscellaneous patches patches for 2022-05-11

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Markus Armbruster (4):
>        Clean up header guards that don't match their file name
>        Clean up ill-advised or unusual header guards
>        Normalize header guard symbol definition
>        Clean up decorations and whitespace around header guards
> 
>   accel/tcg/tcg-accel-ops-icount.h            | 6 +++---
>   accel/tcg/tcg-accel-ops-mttcg.h             | 6 +++---
>   accel/tcg/tcg-accel-ops-rr.h                | 6 +++---
>   accel/tcg/tcg-accel-ops.h                   | 6 +++---
>   block/copy-on-read.h                        | 6 +++---
>   block/coroutines.h                          | 6 +++---
>   bsd-user/arm/target.h                       | 2 +-
>   bsd-user/arm/target_arch.h                  | 6 +++---
>   bsd-user/arm/target_arch_cpu.h              | 6 +++---
>   bsd-user/arm/target_arch_elf.h              | 7 ++++---
>   bsd-user/arm/target_arch_reg.h              | 6 +++---
>   bsd-user/arm/target_arch_signal.h           | 7 ++++---
>   bsd-user/arm/target_arch_sigtramp.h         | 6 +++---
>   bsd-user/arm/target_arch_sysarch.h          | 6 +++---
>   bsd-user/arm/target_arch_thread.h           | 7 ++++---
>   bsd-user/arm/target_arch_vmparam.h          | 7 ++++---
>   bsd-user/arm/target_syscall.h               | 6 +++---
>   bsd-user/bsd-file.h                         | 6 +++---
>   bsd-user/errno_defs.h                       | 6 +++---
>   bsd-user/freebsd/host-os.h                  | 6 +++---
>   bsd-user/freebsd/target_os_elf.h            | 7 ++++---
>   bsd-user/freebsd/target_os_siginfo.h        | 7 ++++---
>   bsd-user/freebsd/target_os_signal.h         | 6 +++---
>   bsd-user/freebsd/target_os_stack.h          | 6 +++---
>   bsd-user/freebsd/target_os_thread.h         | 6 +++---
>   bsd-user/freebsd/target_os_user.h           | 6 +++---
>   bsd-user/freebsd/target_os_vmparam.h        | 7 ++++---
>   bsd-user/i386/target.h                      | 7 +++----
>   bsd-user/i386/target_arch.h                 | 6 +++---
>   bsd-user/i386/target_arch_cpu.h             | 6 +++---
>   bsd-user/i386/target_arch_elf.h             | 7 ++++---
>   bsd-user/i386/target_arch_reg.h             | 6 +++---
>   bsd-user/i386/target_arch_sigtramp.h        | 6 +++---
>   bsd-user/i386/target_arch_sysarch.h         | 6 +++---
>   bsd-user/i386/target_arch_thread.h          | 7 ++++---
>   bsd-user/i386/target_arch_vmparam.h         | 7 ++++---
>   bsd-user/netbsd/host-os.h                   | 6 +++---
>   bsd-user/netbsd/target_os_elf.h             | 7 ++++---
>   bsd-user/netbsd/target_os_siginfo.h         | 6 +++---
>   bsd-user/netbsd/target_os_signal.h          | 6 +++---
>   bsd-user/netbsd/target_os_stack.h           | 6 +++---
>   bsd-user/netbsd/target_os_thread.h          | 6 +++---
>   bsd-user/openbsd/host-os.h                  | 6 +++---
>   bsd-user/openbsd/target_os_elf.h            | 7 ++++---
>   bsd-user/openbsd/target_os_siginfo.h        | 6 +++---
>   bsd-user/openbsd/target_os_signal.h         | 6 +++---
>   bsd-user/openbsd/target_os_stack.h          | 6 +++---
>   bsd-user/openbsd/target_os_thread.h         | 6 +++---
>   bsd-user/syscall_defs.h                     | 6 +++---
>   bsd-user/x86_64/target.h                    | 2 +-
>   bsd-user/x86_64/target_arch.h               | 6 +++---
>   bsd-user/x86_64/target_arch_cpu.h           | 6 +++---
>   bsd-user/x86_64/target_arch_elf.h           | 7 ++++---
>   bsd-user/x86_64/target_arch_reg.h           | 6 +++---
>   bsd-user/x86_64/target_arch_signal.h        | 7 ++++---
>   bsd-user/x86_64/target_arch_sigtramp.h      | 6 +++---
>   bsd-user/x86_64/target_arch_sysarch.h       | 6 +++---
>   bsd-user/x86_64/target_arch_thread.h        | 7 ++++---
>   bsd-user/x86_64/target_arch_vmparam.h       | 7 ++++---
>   chardev/chardev-internal.h                  | 3 ++-
>   crypto/ivgen-plain.h                        | 6 +++---
>   hw/i386/e820_memory_layout.h                | 4 ++--
>   hw/net/can/ctu_can_fd_frame.h               | 4 ++--
>   hw/net/can/ctu_can_fd_regs.h                | 4 ++--
>   hw/nvme/nvme.h                              | 6 +++---
>   hw/usb/hcd-dwc2.h                           | 4 ++--
>   include/block/block-hmp-cmds.h              | 4 ++--
>   include/block/block_int-global-state.h      | 3 ++-
>   include/chardev/char-socket.h               | 7 ++++---
>   include/crypto/tls-cipher-suites.h          | 6 +++---
>   include/exec/memopidx.h                     | 2 +-
>   include/exec/translator.h                   | 2 +-
>   include/fpu/softfloat-helpers.h             | 2 +-
>   include/hw/acpi/generic_event_device.h      | 4 ++--
>   include/hw/gpio/aspeed_gpio.h               | 2 +-
>   include/hw/i2c/arm_sbcon_i2c.h              | 7 ++++---
>   include/hw/i2c/i2c_mux_pca954x.h            | 4 ++--
>   include/hw/input/lm832x.h                   | 4 ++--
>   include/hw/intc/exynos4210_combiner.h       | 4 ++--
>   include/hw/intc/nios2_vic.h                 | 6 +++---
>   include/hw/intc/rx_icu.h                    | 2 +-
>   include/hw/misc/aspeed_hace.h               | 2 +-
>   include/hw/misc/aspeed_lpc.h                | 2 +-
>   include/hw/misc/aspeed_sbc.h                | 2 +-
>   include/hw/misc/bcm2835_cprman.h            | 4 ++--
>   include/hw/misc/bcm2835_cprman_internals.h  | 4 ++--
>   include/hw/misc/stm32f4xx_exti.h            | 4 ++--
>   include/hw/misc/stm32f4xx_syscfg.h          | 4 ++--
>   include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 6 +++---
>   include/hw/net/allwinner-sun8i-emac.h       | 2 +-
>   include/hw/net/mv88w8618_eth.h              | 5 +++--
>   include/hw/nubus/mac-nubus-bridge.h         | 4 ++--
>   include/hw/pci-host/remote.h                | 4 ++--
>   include/hw/ppc/pnv_pnor.h                   | 8 +++++---
>   include/hw/riscv/boot_opensbi.h             | 5 +++--
>   include/hw/riscv/shakti_c.h                 | 4 ++--
>   include/hw/rtc/m48t59.h                     | 2 +-
>   include/hw/rtc/mc146818rtc.h                | 2 +-
>   include/hw/rtc/sun4v-rtc.h                  | 4 ++--
>   include/hw/rtc/xlnx-zynqmp-rtc.h            | 4 ++--
>   include/hw/rx/rx62n.h                       | 4 ++--
>   include/hw/s390x/s390-pci-clp.h             | 4 ++--
>   include/hw/sensor/emc141x_regs.h            | 4 ++--
>   include/hw/ssi/xlnx-versal-ospi.h           | 6 +++---
>   include/hw/timer/bcm2835_systmr.h           | 4 ++--
>   include/hw/tricore/tc27x_soc.h              | 4 ++--
>   include/hw/tricore/tricore_testdevice.h     | 5 ++---
>   include/hw/usb/dwc2-regs.h                  | 6 +++---
>   include/hw/usb/hcd-musb.h                   | 4 ++--
>   include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
>   include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
>   include/hw/virtio/vhost-user-fs.h           | 6 +++---
>   include/hw/virtio/vhost-user-i2c.h          | 6 +++---
>   include/hw/virtio/vhost-user-rng.h          | 6 +++---
>   include/hw/virtio/vhost-user-vsock.h        | 6 +++---
>   include/hw/virtio/vhost-vsock-common.h      | 6 +++---
>   include/hw/watchdog/wdt_imx2.h              | 6 +++---
>   include/qemu/cpu-float.h                    | 6 +++---
>   include/qemu/crc-ccitt.h                    | 6 +++---
>   include/qemu/help-texts.h                   | 4 ++--
>   include/qemu/keyval.h                       | 7 ++++---
>   include/qemu/plugin-memory.h                | 2 +-
>   include/qemu/qemu-plugin.h                  | 7 ++++---
>   include/qemu/selfmap.h                      | 2 +-
>   include/sysemu/block-backend-global-state.h | 6 +++---
>   include/tcg/tcg-ldst.h                      | 2 +-
>   include/ui/dbus-display.h                   | 6 +++---
>   include/ui/dbus-module.h                    | 6 +++---
>   include/user/syscall-trace.h                | 2 +-
>   linux-user/hexagon/target_signal.h          | 2 +-
>   plugins/plugin.h                            | 6 +++---
>   target/alpha/cpu-param.h                    | 2 +-
>   target/arm/cpu-param.h                      | 2 +-
>   target/arm/translate-a32.h                  | 4 ++--
>   target/arm/vec_internal.h                   | 6 +++---
>   target/avr/cpu-qom.h                        | 6 +++---
>   target/avr/cpu.h                            | 2 +-
>   target/cris/cpu-param.h                     | 2 +-
>   target/hexagon/attribs.h                    | 2 +-
>   target/hexagon/hex_arch_types.h             | 4 ++--
>   target/hexagon/hex_regs.h                   | 4 ++--
>   target/hppa/cpu-param.h                     | 2 +-
>   target/i386/cpu-param.h                     | 2 +-
>   target/i386/hax/hax-accel-ops.h             | 6 +++---
>   target/i386/nvmm/nvmm-accel-ops.h           | 6 +++---
>   target/i386/sev.h                           | 4 ++--
>   target/i386/whpx/whpx-accel-ops.h           | 6 +++---
>   target/i386/whpx/whpx-internal.h            | 6 +++---
>   target/m68k/cpu-param.h                     | 2 +-
>   target/microblaze/cpu-param.h               | 2 +-
>   target/mips/cpu-param.h                     | 2 +-
>   target/nios2/cpu-param.h                    | 2 +-
>   target/openrisc/cpu-param.h                 | 2 +-
>   target/ppc/cpu-param.h                      | 2 +-
>   target/ppc/power8-pmu.h                     | 4 ++--
>   target/riscv/cpu-param.h                    | 2 +-
>   target/riscv/sbi_ecall_interface.h          | 4 ++--
>   target/s390x/cpu-param.h                    | 2 +-
>   target/sh4/cpu-param.h                      | 2 +-
>   target/sparc/cpu-param.h                    | 2 +-
>   target/tricore/cpu-param.h                  | 2 +-
>   target/xtensa/core-de233_fpu/core-isa.h     | 7 +++----
>   target/xtensa/core-de233_fpu/core-matmap.h  | 4 +---
>   target/xtensa/core-dsp3400/core-isa.h       | 8 +++-----
>   target/xtensa/core-dsp3400/core-matmap.h    | 4 +---
>   target/xtensa/cpu-param.h                   | 2 +-
>   tcg/tcg-internal.h                          | 2 +-
>   tests/qtest/fuzz/fuzz.h                     | 5 ++---
>   tests/qtest/libqmp.h                        | 7 ++++---
>   tests/qtest/migration-helpers.h             | 7 ++++---
>   tools/virtiofsd/passthrough_seccomp.h       | 7 +++----
>   ui/dbus.h                                   | 7 ++++---
>   172 files changed, 424 insertions(+), 406 deletions(-)
> 


