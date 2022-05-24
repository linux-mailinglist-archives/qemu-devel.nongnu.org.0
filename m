Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A5532FCF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:47:27 +0200 (CEST)
Received: from localhost ([::1]:57746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYcv-0004Pv-IH
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYaF-0003C2-JA
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:44:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYaD-0001FP-Tq
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHVSDqTmLZionnw1acU/1upL/WDzr+Mzm8Go6A5PCvQ=; b=OLcuLm+r3Qw26HqtRhqbuPGECx
 C9duRFw53Y3VEftQIHKi4NGViP4/6ScGQCd4F6yR5hd2ryBVslhEGpnjooV+eLFT7O/hJQHLdELPu
 GbIV18mPJM+Mc7MxJW+QK8jiCTPVuYjl47sGex61oSt4lsWGMhjN84jgNP6+efc8i1nfD81oTG1m5
 AdWBBebSnjTgjRMebZof9l56zmTZuU4ubZKjFV7utOnT4MmheltAjRmtMhqg1iJ+vqgfOeOroL7z8
 iQbfAYADPHwCbDti8QOfdytXOiCN1g2s8W9F2OK3nIpE/MgD3kDfEXWG3lubPCktcq/qCkPY1+p9I
 mlAJIbcOONxiBmMywhARItjhBwn9TNzlI6wlSbVMzU0EH4VjpS6EvfDQaCaFLBh24at3iIQR79XvB
 qgnwGb0NDwYQ0m9V0cxlloUFQaUORp4+DhO1Fo0StXfrNfvRGD5rPRBVK3egXq6z1daGkGI79EzlE
 LA2t7IkSM4bdkbrEG2ZIs5p2LXD6iAkr788OSNwHdYVTFqAwD645+AqRCiyIlSCe8WStsATRQD8ll
 PpbJyIN9qkvxzxOi6AeX7fQ/+vzYhOHPlDvwopayRcj41WxE1+HbWILtAxAs0ALqXcm5wPx4d/a+a
 8APn+9FaTBfsU64cCKCJ+VXC+q6Rpr8ztyOjOEjrs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYZ5-000Af4-CQ; Tue, 24 May 2022 18:43:31 +0100
Message-ID: <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
Date: Tue, 24 May 2022 18:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220524134809.40732-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 24/05/2022 14:48, Damien Hedde wrote:

> Hi all,
> 
> This series is about enabling to plug sysbus devices with
> device_add QAPI command. I've put RFC because, there are several
> options and I would like to know if you think the current version
> is ok to be added in qemu.
> 
> Right now only a few sysbus device can be plugged using "-device"
> CLI option and a custom plugging mechanism. A machine defines a
> list of allowed/supported sysbus devices and provides some code to
> handle the plug. For example, it sets up the memory map and irq
> connections.
> 
> In order to configure a machine from scratch with qapi, we want to
> cold plug sysbus devices to the _none_ machine with qapi commands
> without requiring the machine to provide some specific per-device
> support.
> 
> There are mostly 2 options (option 1 is in these patches). Note that
> in any case this only applies to "user-creatable" device.
> 
> + Option 1: Use the current plug mechanism by allowing any sysbus
> device, without adding handle code in the machine.
> 
> + Option 2: Add a boolean flag in the machine to allow to plug any
> sysbus device. We can additionally differentiate the sysbus devices
> requiring the legacy plug mechanism (with a flag, for example) and
> the others.
> 
> The setup of the memory map and irq connections is not related to
> the option choice above. We planned to rely on qapi commands to do
> these operations. A new _sysbus-mmio-map_ command is proposed in this
> series to setup the mapping. Irqs can already be connected using the
> _qom-set_ command.
> Alternatively we could probably add parameters/properties to device_add
> to handle the memory map, but it looks more complicated to achieve.
> 
> Based-on: <20220519153402.41540-1-damien.hedde@greensocs.com>
>      ( QAPI support for device cold-plug )
> Note that it does not stricly require this to be merged, but this series
> does not make much sense without the ability to cold plug with device_add
> first.
> 
> Thanks for your feedback,
> --
> Damien
> 
> Damien Hedde (3):
>    none-machine: allow cold plugging sysbus devices
>    softmmu/memory: add memory_region_try_add_subregion function
>    add sysbus-mmio-map qapi command
> 
>   qapi/qdev.json         | 31 ++++++++++++++++++++++++++
>   include/exec/memory.h  | 22 +++++++++++++++++++
>   hw/core/null-machine.c |  4 ++++
>   hw/core/sysbus.c       | 49 ++++++++++++++++++++++++++++++++++++++++++
>   softmmu/memory.c       | 26 ++++++++++++++--------
>   5 files changed, 123 insertions(+), 9 deletions(-)

Sorry for coming late into this series, however one of the things I've been thinking 
about a lot recently is that with the advent of QOM and qdev, is there really any 
distinction between TYPE_DEVICE and TYPE_SYS_BUS_DEVICE anymore, and whether it makes 
sense to keep TYPE_SYS_BUS_DEVICE long term.

No objection to the concept of being able to plug devices into the none machine, but 
I'm wondering if the "sysbus-mmio-map" QAPI command should be a generic "device-map" 
instead so that the concept of SYS_BUS_DEVICE doesn't leak into QAPI.

Can you give a bit more detail as to the sequence of QMP transactions that would be 
used to map a SYS_BUS_DEVICE with this series applied? I'm particularly interested to 
understand how SYS_BUS_DEVICEs are identified, and how their memory regions and gpios 
are enumerated by the client to enable it to generate the final "sysbus-mmio-map" and 
"qom-set" commands.


ATB,

Mark.

