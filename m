Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E1647C49
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3T7z-00008z-RE; Thu, 08 Dec 2022 21:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1p3T7v-00007z-DR; Thu, 08 Dec 2022 21:28:39 -0500
Received: from [106.39.185.58] (helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>)
 id 1p3T7s-0001Jr-RN; Thu, 08 Dec 2022 21:28:39 -0500
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id CD83017E0209;
 Fri,  9 Dec 2022 10:28:22 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.19.22.40] (unknown [110.185.170.176])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P2473745T281456496406896S1670552901323048_; 
 Fri, 09 Dec 2022 10:28:22 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0854f7cad5afec5e1735e50a1f814d24>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: pbonzini@redhat.com
X-RCPT-COUNT: 9
X-SENDER-IP: 110.185.170.176
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Message-ID: <0e5293ac-1093-224a-4ce0-1b9f3d940749@cestc.cn>
Date: Fri, 9 Dec 2022 10:28:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] blockdev: add 'media=cdrom' argument to support usb cdrom
 emulated as cdrom
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fam Zheng <fam@euphon.net>
References: <20221201134227.1983-1-luzhipeng@cestc.cn>
 <871qpjf86a.fsf@pond.sub.org> <1d355249-9ab0-f824-e00d-3135cb2646b5@cestc.cn>
 <4ce0329b-0868-f6b5-63f2-62ae212c76a7@redhat.com>
 <718dbdad-4920-d2c8-b3a6-c0f83fd818f1@cestc.cn>
 <CABgObfb9kL2WCHUNQ4KVRAQWZPGBWmKGyaodX5yMChS+9x9PmA@mail.gmail.com>
From: Zhipeng Lu <luzhipeng@cestc.cn>
In-Reply-To: <CABgObfb9kL2WCHUNQ4KVRAQWZPGBWmKGyaodX5yMChS+9x9PmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.58 (failed)
Received-SPF: pass client-ip=106.39.185.58; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.266,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Thanks.

  -device usb-bot,id=bot0
  -device scsi-{cd,hd},bus=bot0.0,drive=drive0

Qemu implements virtio scsi to emulate scsi controller, but if the 
virtual machine(for example windows guest os) don't install the virtio 
scsi driver, it don't work
i need the function: emulate cdrom in guest, support hotplug and unplug, 
not  depend on virtio driver

have a better idea?

在 2022/12/7 16:39, Paolo Bonzini 写道:
> It should be like this:
> 
> -device usb-bot,id=bot0
> -device scsi-{cd,hd},bus=bot0.0,drive=drive0
> 
> Libvirt has the code to generate the options for SCSI controllers, but 
> usb-bot only allows one disk attached to it so it's easier to make it a 
> <drive> element.
> 
> Paolo
> 
> Il sab 3 dic 2022, 13:52 Zhipeng Lu <luzhipeng@cestc.cn 
> <mailto:luzhipeng@cestc.cn>> ha scritto:
> 
>     Could you give the detail qemu cmdline about usb-bot?
> 
>     在 2022/12/2 17:40, Paolo Bonzini 写道:
>      > On 12/2/22 03:26, Zhipeng Lu wrote:
>      >> NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
>      >> sda             8:0    0  100M  1 disk
>      >> vda           252:0    0   10G  0 disk
>      >> ├─vda1        252:1    0    1G  0 part /boot
>      >> └─vda2        252:2    0    9G  0 part
>      >>    ├─rhel-root 253:0    0    8G  0 lvm  /
>      >>    └─rhel-swap 253:1    0    1G  0 lvm  [SWAP]
>      >> lshw -short|grep cdrom -i
>      >> No cdrom.
>      >>
>      >> My patch is to solve this problem, usb cdrom emulated as cdrom.
>      >
>      > This is a libvirt bug, it should use usb-bot instead of usb-storage
>      > together with -blockdev.  Then it can add a scsi-cd device below
>     usb-bot.
>      >
>      > Paolo
>      >
>      >>
>      >>
>      >> 在 2022/12/1 23:35, Markus Armbruster 写道:
>      >>> luzhipeng <luzhipeng@cestc.cn <mailto:luzhipeng@cestc.cn>> writes:
>      >>>
>      >>>> From: zhipeng Lu <luzhipeng@cestc.cn <mailto:luzhipeng@cestc.cn>>
>      >>>>
>      >>>> The drive interface supports media=cdrom so that the usb cdrom
>      >>>> can be emulated as cdrom in qemu, but libvirt deprived the drive
>      >>>> interface, so media=cdrom is added to the blockdev interface to
>      >>>> support usb cdrom emulated as cdrom
>      >>>>
>      >>>> Signed-off-by: zhipeng Lu <luzhipeng@cestc.cn
>     <mailto:luzhipeng@cestc.cn>>
>      >>>
>      >>> What problem are you trying to solve?
>      >>>
>      >>>
>      >>>
>      >>
>      >>
>      >>
>      >
>      >
>      >
> 
> 



