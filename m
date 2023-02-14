Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC7696E08
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1Ak-00080t-Mf; Tue, 14 Feb 2023 14:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1Aa-0007zw-3X
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:40:53 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1AY-00047q-G7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:40:51 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0393460EC5;
 Tue, 14 Feb 2023 22:40:44 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 eepJj20RYKo1-mlZaUK2E; Tue, 14 Feb 2023 22:40:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403643; bh=ZQFT2kufe37I2tZPVapwxqewy7Es/L1YJHpTIyoaC3w=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=wGhnKX+ioYwtaEbjbEs+jLDvQ+kwhs9+FUSkzh5UqZS8S0oLQgRGElqDHYwCkmujN
 8ras9JvF0r7yIRbyjP9LuCVOgyMiAFGtOH5U7zMGP6EGp4edOLLe6GjL+QpjzhRbg4
 F/D32gEtTsOfga34oZzr5bpFpV9kDNhs5PIRGclw=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <bbde5a1d-5456-59bd-f6bb-46509cb2d56c@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 09/16] pcie: drop unused PCIExpressIndicator
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-10-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-10-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 13/02/2023 16:00, Vladimir Sementsov-Ogievskiy wrote:
> The structure type is unused. Also, it's the only user of corresponding
> macros, so drop them too.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>   include/hw/pci/pcie.h      | 8 --------
>   include/hw/pci/pcie_regs.h | 5 -----
>   2 files changed, 13 deletions(-)
>
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index 798a262a0a..3cc2b15957 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -27,14 +27,6 @@
>   #include "hw/pci/pcie_sriov.h"
>   #include "hw/hotplug.h"
>   
> -typedef enum {
> -    /* for attention and power indicator */
> -    PCI_EXP_HP_IND_RESERVED     = PCI_EXP_SLTCTL_IND_RESERVED,
> -    PCI_EXP_HP_IND_ON           = PCI_EXP_SLTCTL_IND_ON,
> -    PCI_EXP_HP_IND_BLINK        = PCI_EXP_SLTCTL_IND_BLINK,
> -    PCI_EXP_HP_IND_OFF          = PCI_EXP_SLTCTL_IND_OFF,
> -} PCIExpressIndicator;
> -
>   typedef enum {
>       /* these bits must match the bits in Slot Control/Status registers.
>        * PCI_EXP_HP_EV_xxx = PCI_EXP_SLTCTL_xxxE = PCI_EXP_SLTSTA_xxx
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 00b595a82e..1fe0bdd25b 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -66,11 +66,6 @@ typedef enum PCIExpLinkWidth {
>   
>   #define PCI_EXP_SLTCAP_PSN_SHIFT        ctz32(PCI_EXP_SLTCAP_PSN)
>   
> -#define PCI_EXP_SLTCTL_IND_RESERVED     0x0
> -#define PCI_EXP_SLTCTL_IND_ON           0x1
> -#define PCI_EXP_SLTCTL_IND_BLINK        0x2
> -#define PCI_EXP_SLTCTL_IND_OFF          0x3
> -
>   #define PCI_EXP_SLTCTL_SUPPORTED        \
>               (PCI_EXP_SLTCTL_ABPE |      \
>                PCI_EXP_SLTCTL_PDCE |      \

