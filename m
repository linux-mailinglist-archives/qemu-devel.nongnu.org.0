Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF956446D4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 15:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ZKj-0007HW-1T; Tue, 06 Dec 2022 09:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2ZKg-0007HN-Qy
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 09:54:06 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2ZKd-0003iv-S6
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 09:54:06 -0500
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B984C1FE36;
 Tue,  6 Dec 2022 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670338440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHOXEZUf3UFUalnj6jfDRrh73iPRPHXCKV16WGEWjys=;
 b=fMCBqVaq7bnU8AxSLasEL+1W0mwWGzCd2h9WlxyytHH5bpj0Dt7wOUOvPcOkI4Upd2xNsE
 Zas8nLTN3tBsfPG/1jwnEi1h4BdStN0+AjNUCPQqn3K7OyUcWiUmhuvxb8CIYuvhZOLnu5
 cauuIVJzr5P477ckEU749E2uptFeOxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670338440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHOXEZUf3UFUalnj6jfDRrh73iPRPHXCKV16WGEWjys=;
 b=rYNCZ7My3+QOOKXc5xm/s/iG9ObGh7MPbAUZGrb1eZvQj4ykZCqpn/qZTvZX/XLHmZTu9H
 HGgmXYLD4nGspKCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8E63E132F3;
 Tue,  6 Dec 2022 14:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id B7M7E4ZXj2NDMwAAGKfGzw
 (envelope-from <cfontana@suse.de>); Tue, 06 Dec 2022 14:53:58 +0000
Message-ID: <5d1a9740-df5c-fa6e-8c67-1dcd7174df66@suse.de>
Date: Tue, 6 Dec 2022 15:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20210517111111.1068153-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/17/21 13:11, Philippe Mathieu-Daudé wrote:
> Guard declarations within hwaddr.h against inclusion
> from user-mode emulation.
> 
> To make it clearer this header is sysemu specific,
> move it to the sysemu/ directory.

Hi Philippe,

do we need include/exec/sysemu/... .h

as opposed to just use the existing

include/sysemu/

?

Thanks,

Claudio

> 
> Patch created mechanically using:
> 
>   $ sed -i s,exec/hwaddr.h,exec/sysemu/hwaddr.h, $(git grep -l exec/hwaddr.h)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/audio/lm4549.h                                   | 2 +-
>  hw/net/can/can_sja1000.h                            | 2 +-
>  hw/net/can/ctucan_core.h                            | 2 +-
>  hw/net/net_tx_pkt.h                                 | 2 +-
>  include/disas/disas.h                               | 4 +++-
>  include/exec/cpu-all.h                              | 2 +-
>  include/exec/cpu-common.h                           | 2 +-
>  include/exec/cpu-defs.h                             | 2 +-
>  include/exec/memory.h                               | 2 +-
>  include/exec/{ => sysemu}/hwaddr.h                  | 7 +++++--
>  include/hw/arm/sharpsl.h                            | 2 +-
>  include/hw/arm/soc_dma.h                            | 2 +-
>  include/hw/arm/sysbus-fdt.h                         | 2 +-
>  include/hw/arm/virt.h                               | 2 +-
>  include/hw/block/block.h                            | 2 +-
>  include/hw/block/fdc.h                              | 2 +-
>  include/hw/block/flash.h                            | 2 +-
>  include/hw/core/cpu.h                               | 4 +++-
>  include/hw/cris/etraxfs_dma.h                       | 2 +-
>  include/hw/display/vga.h                            | 2 +-
>  include/hw/i386/microvm.h                           | 2 +-
>  include/hw/i386/x86.h                               | 2 +-
>  include/hw/input/lasips2.h                          | 2 +-
>  include/hw/loader-fit.h                             | 2 +-
>  include/hw/misc/allwinner-h3-dramc.h                | 2 +-
>  include/hw/misc/empty_slot.h                        | 2 +-
>  include/hw/nvram/fw_cfg.h                           | 2 +-
>  include/hw/pci-host/gpex.h                          | 2 +-
>  include/hw/remote/memory.h                          | 2 +-
>  include/hw/remote/mpqemu-link.h                     | 2 +-
>  include/hw/rtc/m48t59.h                             | 2 +-
>  include/hw/rtc/sun4v-rtc.h                          | 2 +-
>  include/hw/timer/tmu012.h                           | 2 +-
>  include/hw/virtio/virtio-access.h                   | 2 +-
>  include/monitor/monitor.h                           | 2 +-
>  include/qemu/accel.h                                | 4 +++-
>  include/qemu/iova-tree.h                            | 2 +-
>  include/qemu/userfaultfd.h                          | 2 +-
>  dump/dump.c                                         | 2 +-
>  dump/win_dump.c                                     | 2 +-
>  hw/arm/sbsa-ref.c                                   | 2 +-
>  hw/input/lasips2.c                                  | 2 +-
>  hw/m68k/next-cube.c                                 | 2 +-
>  hw/ppc/pnv_homer.c                                  | 2 +-
>  tests/qtest/microbit-test.c                         | 2 +-
>  MAINTAINERS                                         | 1 +
>  scripts/codeconverter/codeconverter/test_regexps.py | 4 ++--
>  47 files changed, 58 insertions(+), 48 deletions(-)
>  rename include/exec/{ => sysemu}/hwaddr.h (81%)
> 
> diff --git a/hw/audio/lm4549.h b/hw/audio/lm4549.h
> index aba9bb5b077..5d53c2f2179 100644
> --- a/hw/audio/lm4549.h
> +++ b/hw/audio/lm4549.h
> @@ -13,7 +13,7 @@
>  #define HW_LM4549_H
>  
>  #include "audio/audio.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  typedef void (*lm4549_callback)(void *opaque);
>  
> diff --git a/hw/net/can/can_sja1000.h b/hw/net/can/can_sja1000.h
> index 7ca9cd681ed..57e6d4d34e4 100644
> --- a/hw/net/can/can_sja1000.h
> +++ b/hw/net/can/can_sja1000.h
> @@ -27,7 +27,7 @@
>  #ifndef HW_CAN_SJA1000_H
>  #define HW_CAN_SJA1000_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "net/can_emu.h"
>  
>  #define CAN_SJA_MEM_SIZE      128
> diff --git a/hw/net/can/ctucan_core.h b/hw/net/can/ctucan_core.h
> index bbc09ae0678..c0e4beafba2 100644
> --- a/hw/net/can/ctucan_core.h
> +++ b/hw/net/can/ctucan_core.h
> @@ -28,7 +28,7 @@
>  #ifndef HW_CAN_CTUCAN_CORE_H
>  #define HW_CAN_CTUCAN_CORE_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "net/can_emu.h"
>  
>  #ifndef HOST_WORDS_BIGENDIAN
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index 4ec8bbe9bd9..86548b4f613 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -19,7 +19,7 @@
>  #define NET_TX_PKT_H
>  
>  #include "net/eth.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  /* define to enable packet dump functions */
>  /*#define NET_TX_PKT_DEBUG*/
> diff --git a/include/disas/disas.h b/include/disas/disas.h
> index d363e95edeb..1b85d121a7a 100644
> --- a/include/disas/disas.h
> +++ b/include/disas/disas.h
> @@ -1,7 +1,9 @@
>  #ifndef QEMU_DISAS_H
>  #define QEMU_DISAS_H
>  
> -#include "exec/hwaddr.h"
> +#ifndef CONFIG_USER_ONLY
> +#include "exec/sysemu/hwaddr.h"
> +#endif
>  
>  #ifdef NEED_CPU_H
>  #include "cpu.h"
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 32cfb634c6a..3e7edddead5 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -175,7 +175,7 @@ extern unsigned long reserved_va;
>  
>  #else
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  #define SUFFIX
>  #define ARG1         as
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index ccabed4003a..1a64b0b5ac6 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -4,7 +4,7 @@
>  /* CPU interfaces that are target independent.  */
>  
>  #ifndef CONFIG_USER_ONLY
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #endif
>  
>  /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index ba3cd32a1ec..52a2b93493d 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -26,7 +26,7 @@
>  #include "qemu/host-utils.h"
>  #include "qemu/thread.h"
>  #ifndef CONFIG_USER_ONLY
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #endif
>  #include "exec/memattrs.h"
>  #include "hw/core/cpu.h"
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c8b90889241..52a2659b396 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -17,7 +17,7 @@
>  #ifndef CONFIG_USER_ONLY
>  
>  #include "exec/cpu-common.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "exec/memattrs.h"
>  #include "exec/memop.h"
>  #include "exec/ramlist.h"
> diff --git a/include/exec/hwaddr.h b/include/exec/sysemu/hwaddr.h
> similarity index 81%
> rename from include/exec/hwaddr.h
> rename to include/exec/sysemu/hwaddr.h
> index 8f16d179a88..9693cd516b4 100644
> --- a/include/exec/hwaddr.h
> +++ b/include/exec/sysemu/hwaddr.h
> @@ -1,8 +1,9 @@
>  /* Define hwaddr if it exists.  */
>  
> -#ifndef HWADDR_H
> -#define HWADDR_H
> +#ifndef EXEC_SYSEMU_HWADDR_H
> +#define EXEC_SYSEMU_HWADDR_H
>  
> +#ifndef CONFIG_USER_ONLY
>  
>  #define HWADDR_BITS 64
>  /* hwaddr is the type of a physical address (its size can
> @@ -23,4 +24,6 @@ typedef struct MemMapEntry {
>      hwaddr size;
>  } MemMapEntry;
>  
> +#endif /* !CONFIG_USER_ONLY */
> +
>  #endif
> diff --git a/include/hw/arm/sharpsl.h b/include/hw/arm/sharpsl.h
> index e986b28c527..36ed1df72a7 100644
> --- a/include/hw/arm/sharpsl.h
> +++ b/include/hw/arm/sharpsl.h
> @@ -7,7 +7,7 @@
>  #ifndef QEMU_SHARPSL_H
>  #define QEMU_SHARPSL_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  /* zaurus.c */
>  
> diff --git a/include/hw/arm/soc_dma.h b/include/hw/arm/soc_dma.h
> index e93a7499a80..14b802c2330 100644
> --- a/include/hw/arm/soc_dma.h
> +++ b/include/hw/arm/soc_dma.h
> @@ -21,7 +21,7 @@
>  #ifndef HW_SOC_DMA_H
>  #define HW_SOC_DMA_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  struct soc_dma_s;
>  struct soc_dma_ch_s;
> diff --git a/include/hw/arm/sysbus-fdt.h b/include/hw/arm/sysbus-fdt.h
> index 340c382cdde..7a8ace37b4c 100644
> --- a/include/hw/arm/sysbus-fdt.h
> +++ b/include/hw/arm/sysbus-fdt.h
> @@ -24,7 +24,7 @@
>  #ifndef HW_ARM_SYSBUS_FDT_H
>  #define HW_ARM_SYSBUS_FDT_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  /**
>   * platform_bus_add_all_fdt_nodes - create all the platform bus nodes
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918b..504b0bb6e57 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -30,7 +30,7 @@
>  #ifndef QEMU_ARM_VIRT_H
>  #define QEMU_ARM_VIRT_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
>  #include "hw/arm/boot.h"
> diff --git a/include/hw/block/block.h b/include/hw/block/block.h
> index c172cbe65f1..0f36b1f0277 100644
> --- a/include/hw/block/block.h
> +++ b/include/hw/block/block.h
> @@ -11,7 +11,7 @@
>  #ifndef HW_BLOCK_H
>  #define HW_BLOCK_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qapi/qapi-types-block-core.h"
>  #include "hw/qdev-properties-system.h"
>  
> diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
> index 1ecca7cac7f..7f0fb3d3986 100644
> --- a/include/hw/block/fdc.h
> +++ b/include/hw/block/fdc.h
> @@ -1,7 +1,7 @@
>  #ifndef HW_FDC_H
>  #define HW_FDC_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qapi/qapi-types-block.h"
>  
>  /* fdc.c */
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index 86d8363bb09..e184df092eb 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -3,7 +3,7 @@
>  
>  /* NOR flash devices */
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qom/object.h"
>  
>  /* pflash_cfi01.c */
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e4328de8d41..7aa5c82fa20 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -22,7 +22,9 @@
>  
>  #include "hw/qdev-core.h"
>  #include "disas/dis-asm.h"
> -#include "exec/hwaddr.h"
> +#if !defined(CONFIG_USER_ONLY)
> +#include "exec/sysemu/hwaddr.h"
> +#endif
>  #include "exec/memattrs.h"
>  #include "qapi/qapi-types-run-state.h"
>  #include "qemu/bitmap.h"
> diff --git a/include/hw/cris/etraxfs_dma.h b/include/hw/cris/etraxfs_dma.h
> index 095d76b9560..f0a4038c8ae 100644
> --- a/include/hw/cris/etraxfs_dma.h
> +++ b/include/hw/cris/etraxfs_dma.h
> @@ -1,7 +1,7 @@
>  #ifndef HW_ETRAXFS_DMA_H
>  #define HW_ETRAXFS_DMA_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  struct dma_context_metadata {
>  	/* data descriptor md */
> diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
> index 5f7825e0e36..d63e0bb9c94 100644
> --- a/include/hw/display/vga.h
> +++ b/include/hw/display/vga.h
> @@ -9,7 +9,7 @@
>  #ifndef QEMU_HW_DISPLAY_VGA_H
>  #define QEMU_HW_DISPLAY_VGA_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  /*
>   * modules can reference this symbol to avoid being loaded
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index f25f8374413..e6931917ed1 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -19,7 +19,7 @@
>  #define HW_I386_MICROVM_H
>  
>  #include "qemu-common.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qemu/notify.h"
>  
>  #include "hw/boards.h"
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index c09b648dff2..b594f829cdb 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -18,7 +18,7 @@
>  #define HW_I386_X86_H
>  
>  #include "qemu-common.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qemu/notify.h"
>  
>  #include "hw/i386/topology.h"
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index 0cd7b59064a..f4c1e787d2b 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -7,7 +7,7 @@
>  #ifndef HW_INPUT_LASIPS2_H
>  #define HW_INPUT_LASIPS2_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  #define TYPE_LASIPS2 "lasips2"
>  
> diff --git a/include/hw/loader-fit.h b/include/hw/loader-fit.h
> index 0832e379dc9..138da77d664 100644
> --- a/include/hw/loader-fit.h
> +++ b/include/hw/loader-fit.h
> @@ -20,7 +20,7 @@
>  #ifndef HW_LOADER_FIT_H
>  #define HW_LOADER_FIT_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  struct fit_loader_match {
>      const char *compatible;
> diff --git a/include/hw/misc/allwinner-h3-dramc.h b/include/hw/misc/allwinner-h3-dramc.h
> index 0b6c877ef74..93e640b23af 100644
> --- a/include/hw/misc/allwinner-h3-dramc.h
> +++ b/include/hw/misc/allwinner-h3-dramc.h
> @@ -22,7 +22,7 @@
>  
>  #include "qom/object.h"
>  #include "hw/sysbus.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  /**
>   * Constants
> diff --git a/include/hw/misc/empty_slot.h b/include/hw/misc/empty_slot.h
> index dec56e56ae4..d942aebd3e7 100644
> --- a/include/hw/misc/empty_slot.h
> +++ b/include/hw/misc/empty_slot.h
> @@ -12,7 +12,7 @@
>  #ifndef HW_EMPTY_SLOT_H
>  #define HW_EMPTY_SLOT_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  void empty_slot_init(const char *name, hwaddr addr, uint64_t slot_size);
>  
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 0e7a8bc7af2..af1f8df9cf0 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -1,7 +1,7 @@
>  #ifndef FW_CFG_H
>  #define FW_CFG_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "standard-headers/linux/qemu_fw_cfg.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/dma.h"
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index fcf8b638200..52da437057e 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -20,7 +20,7 @@
>  #ifndef HW_GPEX_H
>  #define HW_GPEX_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "hw/sysbus.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pcie_host.h"
> diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h
> index bc2e30945f5..200fc982a00 100644
> --- a/include/hw/remote/memory.h
> +++ b/include/hw/remote/memory.h
> @@ -11,7 +11,7 @@
>  #ifndef REMOTE_MEMORY_H
>  #define REMOTE_MEMORY_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "hw/remote/mpqemu-link.h"
>  
>  void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp);
> diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
> index 4ec09158851..9b56b30a311 100644
> --- a/include/hw/remote/mpqemu-link.h
> +++ b/include/hw/remote/mpqemu-link.h
> @@ -14,7 +14,7 @@
>  #include "qom/object.h"
>  #include "qemu/thread.h"
>  #include "io/channel.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "io/channel-socket.h"
>  #include "hw/remote/proxy.h"
>  
> diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
> index d9b45eb1612..dda5ef4a20a 100644
> --- a/include/hw/rtc/m48t59.h
> +++ b/include/hw/rtc/m48t59.h
> @@ -26,7 +26,7 @@
>  #ifndef HW_RTC_M48T59_H
>  #define HW_RTC_M48T59_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "qom/object.h"
>  
>  #define TYPE_NVRAM "nvram"
> diff --git a/include/hw/rtc/sun4v-rtc.h b/include/hw/rtc/sun4v-rtc.h
> index fd868f6ed2f..b2e27447121 100644
> --- a/include/hw/rtc/sun4v-rtc.h
> +++ b/include/hw/rtc/sun4v-rtc.h
> @@ -12,7 +12,7 @@
>  #ifndef HW_RTC_SUN4V
>  #define HW_RTC_SUN4V
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  void sun4v_rtc_init(hwaddr addr);
>  
> diff --git a/include/hw/timer/tmu012.h b/include/hw/timer/tmu012.h
> index 808ed8de1d7..ea98ff0b3f1 100644
> --- a/include/hw/timer/tmu012.h
> +++ b/include/hw/timer/tmu012.h
> @@ -9,7 +9,7 @@
>  #ifndef HW_TIMER_TMU012_H
>  #define HW_TIMER_TMU012_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  #define TMU012_FEAT_TOCR   (1 << 0)
>  #define TMU012_FEAT_3CHAN  (1 << 1)
> diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
> index 6818a23a2d3..b18e0109d9f 100644
> --- a/include/hw/virtio/virtio-access.h
> +++ b/include/hw/virtio/virtio-access.h
> @@ -16,7 +16,7 @@
>  #ifndef QEMU_VIRTIO_ACCESS_H
>  #define QEMU_VIRTIO_ACCESS_H
>  
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-bus.h"
>  
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index af3887bb71d..b70fb361e3a 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -4,7 +4,7 @@
>  #include "block/block.h"
>  #include "qapi/qapi-types-misc.h"
>  #include "qemu/readline.h"
> -#include "include/exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  typedef struct MonitorHMP MonitorHMP;
>  typedef struct MonitorOptions MonitorOptions;
> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
> index 4f4c283f6fc..2fc5feddff2 100644
> --- a/include/qemu/accel.h
> +++ b/include/qemu/accel.h
> @@ -24,7 +24,9 @@
>  #define QEMU_ACCEL_H
>  
>  #include "qom/object.h"
> -#include "exec/hwaddr.h"
> +#ifndef CONFIG_USER_ONLY
> +#include "exec/sysemu/hwaddr.h"
> +#endif
>  
>  typedef struct AccelState {
>      /*< private >*/
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index b66cf93c4bc..1530cf0e95e 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -24,7 +24,7 @@
>   */
>  
>  #include "exec/memory.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  #define  IOVA_OK           (0)
>  #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> index 6b74f92792d..2cdce404edf 100644
> --- a/include/qemu/userfaultfd.h
> +++ b/include/qemu/userfaultfd.h
> @@ -14,7 +14,7 @@
>  #define USERFAULTFD_H
>  
>  #include "qemu/osdep.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include <linux/userfaultfd.h>
>  
>  int uffd_query_features(uint64_t *features);
> diff --git a/dump/dump.c b/dump/dump.c
> index ab625909f30..544553d3579 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -15,7 +15,7 @@
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "elf.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/dump.h"
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index c5eb5a9aacd..6c30c98fb09 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -12,7 +12,7 @@
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "elf.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/dump.h"
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 43c19b49234..d01d93eb8f9 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -27,7 +27,7 @@
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "kvm_arm.h"
>  #include "hw/arm/boot.h"
>  #include "hw/block/flash.h"
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index e7faf24058b..f84f37411fd 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -26,7 +26,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/input/ps2.h"
>  #include "hw/input/lasips2.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "trace.h"
>  #include "exec/address-spaces.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index de951ffe5d3..84c346e7420 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -10,7 +10,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "hw/irq.h"
> diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
> index 9a262629b73..394425232ed 100644
> --- a/hw/ppc/pnv_homer.c
> +++ b/hw/ppc/pnv_homer.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "exec/memory.h"
>  #include "sysemu/cpus.h"
>  #include "hw/qdev-core.h"
> diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
> index 2b255579dfd..4d1c7fd863b 100644
> --- a/tests/qtest/microbit-test.c
> +++ b/tests/qtest/microbit-test.c
> @@ -15,7 +15,7 @@
>  
>  
>  #include "qemu/osdep.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  #include "libqos/libqtest.h"
>  
>  #include "hw/arm/nrf51.h"
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 78561a223f9..f1ae9934349 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -129,6 +129,7 @@ F: include/exec/cpu*.h
>  F: include/exec/exec-all.h
>  F: include/exec/helper*.h
>  F: include/exec/tb-hash.h
> +F: include/exec/sysemu/hwaddr.h
>  F: include/sysemu/cpus.h
>  F: include/sysemu/tcg.h
>  F: include/hw/core/tcg-cpu-ops.h
> diff --git a/scripts/codeconverter/codeconverter/test_regexps.py b/scripts/codeconverter/codeconverter/test_regexps.py
> index a445634d88a..41a2cd9c14c 100644
> --- a/scripts/codeconverter/codeconverter/test_regexps.py
> +++ b/scripts/codeconverter/codeconverter/test_regexps.py
> @@ -228,7 +228,7 @@ def test_initial_includes():
>  /* NOR flash devices */
>  
>  #include "qom/object.h"
> -#include "exec/hwaddr.h"
> +#include "exec/sysemu/hwaddr.h"
>  
>  /* pflash_cfi01.c */
>  '''
> @@ -236,7 +236,7 @@ def test_initial_includes():
>      m = InitialIncludes.domatch(c)
>      assert m
>      print(repr(m.group(0)))
> -    assert m.group(0).endswith('#include "exec/hwaddr.h"\n')
> +    assert m.group(0).endswith('#include "exec/sysemu/hwaddr.h"\n')
>  
>      c = '''#ifndef QEMU_VIRTIO_9P_H
>  #define QEMU_VIRTIO_9P_H


