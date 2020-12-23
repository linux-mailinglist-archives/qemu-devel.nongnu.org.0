Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D72E1BF0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 12:35:18 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks2QH-0002tk-03
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 06:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1ks2PV-0002LD-Tt; Wed, 23 Dec 2020 06:34:29 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:44676
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1ks2PS-0003bc-SF; Wed, 23 Dec 2020 06:34:29 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 47DE9DB39AB;
 Wed, 23 Dec 2020 12:34:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id eIGqQagKWQSU; Wed, 23 Dec 2020 12:32:17 +0100 (CET)
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 642F3DB3FCC;
 Wed, 23 Dec 2020 12:28:51 +0100 (CET)
Subject: Re: Various spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20201223105845.8543-1-mjt@msgid.tls.msk.ru>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <8997e300-f8a9-a642-ee30-717478b54f2e@weilnetz.de>
Date: Wed, 23 Dec 2020 12:28:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201223105845.8543-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.12.20 um 11:58 schrieb Michael Tokarev:

> An assorted set of spelling fixes in various places.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 90e63b83674..2b096552719 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -840 +840 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
> -                                dis = "ASE attribute missmatch";
> +                                dis = "ASE attribute mismatch";
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index b5118acd3fd..155733646d8 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -124 +124 @@ npcm7xx_rng_write(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04
> -stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interupt: GPIO: %d, Line: %d; Level: %d"
> +stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interrupt: GPIO: %d, Line: %d; Level: %d"
> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
> index 38d328587e3..27b0c37943b 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -582 +582 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
> -    case REG_INT_EN:            /* Interupt Enable */
> +    case REG_INT_EN:            /* Interrupt Enable */
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 67ebb16c4d5..8fbadaf03d7 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -227 +227 @@ static void hiomap_cmd(IPMIBmcSim *ibs, uint8_t *cmd, unsigned int cmd_len,
> -        qemu_log_mask(LOG_GUEST_ERROR, "HIOMAP: unknow command %02X\n", cmd[2]);
> +        qemu_log_mask(LOG_GUEST_ERROR, "HIOMAP: unknown command %02X\n", cmd[2]);
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index 2d566f7db10..5c76bed77aa 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -304 +304 @@ static void *event_thread(void *arg)
> -                        "ERROR: wrong reader: quiting event_thread\n");
> +                        "ERROR: wrong reader: quitting event_thread\n");
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index f8c64c8b95b..1cf2816772c 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1129 +1129 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
> -            /* An error occured so we have to clear the interrupt counter. See
> +            /* An error occurred so we have to clear the interrupt counter. See
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 614ccc2bcb6..87fa7b40419 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -903 +903 @@ check_dev_state:
> -        /* An error is occured. */
> +        /* An error is occurred. */


"has occurred" or better simply "occurred"


> diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
> index 08c869ab0af..7901ab276ce 100644
> --- a/include/hw/s390x/css.h
> +++ b/include/hw/s390x/css.h
> @@ -136 +136 @@ struct SubchDev {
> -    uint16_t migrated_schid; /* used for missmatch detection */
> +    uint16_t migrated_schid; /* used for mismatch detection */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 104632ea343..fd5e384d98e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -148 +148 @@ SRST
> -        there will be one thread per vCPU therefor taking advantage of
> +        there will be one thread per vCPU therefore taking advantage of
> @@ -2406 +2406 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
> -    "                use 'poll-us=n' to speciy the maximum number of microseconds that could be\n"
> +    "                use 'poll-us=n' to specify the maximum number of microseconds that could be\n"
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 5a8c96072e4..9e24e2c4822 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6916 +6916 @@ static void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
> -        error_setg(errp, "No crash occured");
> +        error_setg(errp, "No crash occurred");
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 233e46bb70b..43a63c6e25d 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -1159 +1159 @@ static int nested_state_post_load(void *opaque, int version_id)
> -        error_report("Recieved unsupported nested state size: "
> +        error_report("Received unsupported nested state size: "
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 202498deb51..c9728651f00 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -120 +120 @@ static const char *m68k_exception_name(int index)
> -        return "Unitialized Interruot";
> +        return "Uninitialized Interruot";


s/Interruot/interrupt/


> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6a0264fc6b1..d39d560cf47 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -478 +478 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> -                qemu_log("vector verison is not specified, "
> +                qemu_log("vector version is not specified, "


With both additional modification (see comments above) which can be 
applied before merging (no need to resend the patch)

Reviewed-by: Stefan Weil <sw@weilnetz.de>



