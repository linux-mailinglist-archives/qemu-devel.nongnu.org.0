Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D2253B554
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 10:44:51 +0200 (CEST)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwgRm-0005DT-3h
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 04:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwgPo-0004SS-Uq; Thu, 02 Jun 2022 04:42:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwgPn-0006jy-85; Thu, 02 Jun 2022 04:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VaRsS9mLjCUnTm4Z0jqPtO9CVte0/sAuhFsUGoRSLeA=; b=UCGzCm13x5VQYYuGYUutpOL5Oi
 t4HKIoCaOE4YNZnOhwajPY8nffd2pqa4/uQffIjPfAbN5XP9dUw9emNa+cwsZyo6i5wYVxeHyfosC
 h5/MW1kFzNhIpyzzKHHnALtR/nrUCns5i1jwup60ZOk8QMPOgzxEs+3cGuooxGGHi6A3mrNnTAcBe
 OkJWAMC4Md5Lv7pSSJtc9m1bm0wn8q1QP5VHe6oOhNZylUzeGHeG1XYDr58ztvrUIO/2kOZb9yTar
 I9uA0sth1kPtu3/RhHw51SagoUt048ZEFZu7QwsmPi3NXAYpZt+uMJc4QeUARfSe37WCi+MRfPzdy
 6j1eeXowxqk6uv6cm2zSr+BlOmRjz4jBo2Nd8jflBcdZoFa2lDnlkKhM6LpDGmMtD1mcXdmQE+zPc
 l9zw0uch2nTu96HL2WF6fvxRXYK6Qo+GiE8blr17Cja+bc/Hxf1bIOm6a/OwTJeYhrpxcauipGVA2
 HzeJLWSkPHwBo36IMx0oKmFzELynq0VFEcvG6T/HFut47qkcqBoU0/31/G/hNtIVT4MANX9acgxIp
 YoUmg80SXnkSNrbttqkl7rvucwnZ7Jae0f3Qs6MXOVsBoysx50rzv9K6ENUlL/+8t+CRwVTXF9w1W
 GhIxBMgNPeV6MGs7oouVEFWQV+O1vmcgGOdvlb7uI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwgOd-0003Os-IC; Thu, 02 Jun 2022 09:41:39 +0100
Message-ID: <c5d209d1-b6df-4447-1bb7-43d19e30104d@ilande.co.uk>
Date: Thu, 2 Jun 2022 09:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/16] powernv: introduce pnv-phb base/proxy devices
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

On 31/05/2022 22:49, Daniel Henrique Barboza wrote:

> Hi,
> 
> This v2 is considerable different from the first version due to the
> review provided by Mark Cave-Ayland.
> 
> We're now preserving all PnvPHB3/4/5 implementations already in place.
> The PnvPHB device now acts as a base/proxy of the existing PHBs, which
> are turned into backends of the base PnvPHB device.
> 
> QOM is being more used this time by passing through properties to the
> PHB backends from the base device, and by setting the phb->version
> via global machine properties in each machine.
> 
> The changes made impact both user creatable and default devices, meaning
> that now the powernv machines are using the PnvPHB base device in all
> circunstances.
> 
> The one thing that I didn't change from v1 is the root port revamp. I
> didn't find enough reason to do the same thing we did with the PnvPHBs,
> given that all that differs them is the reset() callback of
> phb4_root_port. This means that patches 14-17 from v1 are still mostly
> the same.
> 
> 
> Changes from v1:
> - lots of changes in patches 1-6 and 7 due to the change of direction
> - patch 10 from v1: removed
> - PnvPHB.version is now being removed in patch 16
> - several other minor changes due to changes in the initial patches
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01410.html
> 
> Daniel Henrique Barboza (16):
>    ppc/pnv: add PHB3 bus init helper
>    ppc/pnv: add pnv_get_phb3_child()
>    ppc/pnv: add PnvPHB base/proxy device
>    ppc/pnv: change PnvPHB3 to be a PnvPHB backend
>    ppc/pnv: user created pnv-phb for powernv8
>    ppc/pnv: add PHB4 bus init helper
>    ppc/pnv: change PnvPHB4 to be a PnvPHB backend
>    ppc/pnv: user created pnv-phb for powernv9
>    ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>    ppc/pnv: user creatable pnv-phb for powernv10
>    ppc/pnv: add pnv-phb-root-port device
>    ppc/pnv: remove pnv-phb3-root-port
>    ppc/pnv: remove pnv-phb4-root-port
>    ppc/pnv: remove 'phb_rootport_typename' in pnv_phb_realize()
>    ppc/pnv: remove pecc->rp_model
>    ppc/pnv: remove PnvPHB4.version
> 
>   hw/pci-host/meson.build        |   3 +-
>   hw/pci-host/pnv_phb.c          | 219 ++++++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb.h          |  56 ++++++++
>   hw/pci-host/pnv_phb3.c         | 144 ++++++++-------------
>   hw/pci-host/pnv_phb4.c         | 226 ++++++++++++++-------------------
>   hw/pci-host/pnv_phb4_pec.c     |  14 +-
>   hw/ppc/pnv.c                   |  78 ++++++++++--
>   include/hw/pci-host/pnv_phb3.h |  12 +-
>   include/hw/pci-host/pnv_phb4.h |  18 +--
>   include/hw/ppc/pnv.h           |   4 +-
>   10 files changed, 512 insertions(+), 262 deletions(-)
>   create mode 100644 hw/pci-host/pnv_phb.c
>   create mode 100644 hw/pci-host/pnv_phb.h

I've had a quick look over the series, and whilst I'm not overly familiar with the 
PMV PHB side, this looks much better to me from a QOM/qdev modelling perspective. 
I've added a few comments but in general I'm fairly happy with the way this is going.


ATB,

Mark.

