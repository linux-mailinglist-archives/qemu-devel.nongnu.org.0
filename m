Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DC57D05A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:54:05 +0200 (CEST)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYV2-00066A-0p
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEYT4-00044w-IU
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:52:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEYT2-0005f0-TN
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4BoSxxZbJ9MPLl5sbeBaOBVmVR0JQQ8NnFNx4yCLVrI=; b=gLMSxirCLNgebztmMI3dwSAtfY
 x9Hllv4VpyLo9PR/c0tX+ZMHtOpprd4+YzbC2hFMkNG+YAJo1S/I4qlSXUeK6eBXDCH23moNpaLrS
 SauJnfNwjaUumadMmyxknxJhMv1DCWhdNHaxXVp/b17uDacHtZO8wUmrwvOAmXJr8JKa70gQZMmcL
 S5HUZ7HOE7hZlQnK4iXRXthE+M0MS8EYe+lRs+e0TNYl91GnoKATYnOye2xo+vGZMqR7ieI3GdWQh
 h11Le0yzBq1OwRP0ChKIthuTNfdDaMdmou2nzM/IuYB5mXviNMeyNu+wXIHwyqlCfsfepD7DW67A3
 QBU3dbUhg6bb0aSuRQ/66MhvBunyxsMaV/UBq1BFmPAqFrbGbXWDHk2Lw04WwWkNT79AOlOnz5yGK
 DNdq2uMEuZBBhj7QcpGqYdhEAViv/okLwUTGUhCo3viWCyHd2P+EBBL1J3TyySN2d60Ij/skrQFV5
 OBNqionnVxIIaOIWo710y+c3WQBL08DqdLWFDPlPwo7PqY3wPEACnXfn158wat7nrQT9YDlE19BS4
 DBAKTCg3eeMmBd2I8QfPEFyuj0tuOWNj9LgMg1Fo/lcBPgr09J50RKROvuPHJ/fxGFE9eEtwEtySR
 pR5JISIq6C1aoYRSr5fu+QSmlqf4eIv8rdqpAfFtw=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEYRd-000466-RR; Thu, 21 Jul 2022 16:50:37 +0100
Message-ID: <f85ae904-4a31-141d-17dd-43c5a27d9b07@ilande.co.uk>
Date: Thu, 21 Jul 2022 16:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Roman Kagan <rvkagan@yandex-team.ru>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
 <Ytlii7t0rERVJBXo@rvkaganb>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <Ytlii7t0rERVJBXo@rvkaganb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
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

On 21/07/2022 15:28, Roman Kagan wrote:

(lots cut)

> In the guest (Fedora 34):
> 
> [root@test ~]# lspci -tv
> -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
>             +-01.0  Device 1234:1111
>             +-02.0  Red Hat, Inc. QEMU XHCI Host Controller
>             +-05.0-[01]----00.0  Red Hat, Inc. Virtio block device
>             +-05.1-[02]----00.0  Red Hat, Inc. Virtio network device
>             +-05.2-[03]--
>             +-05.3-[04]--
>             +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
>             \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
> 
> Changing addr of the second disk from 4 to 0 makes it appear in the
> guest.
> 
> What exactly do you find odd?

Thanks for this, the part I wasn't sure about was whether the device ids in the 
command line matched the primary PCI bus or the secondary PCI bus.

In that case I suspect that the enumeration of non-zero PCIe devices fails in Linux 
because of the logic here: 
https://github.com/torvalds/linux/blob/master/drivers/pci/probe.c#L2622.

I don't have a copy of the PCIe specification, but assuming the comment is true then 
your patch looks correct to me. I think it would be worth adding a similar comment 
and reference to your patch to explain why the logic is required, which should also 
help the PCI maintainers during review.


ATB,

Mark.

