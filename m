Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4B373167
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 22:32:27 +0200 (CEST)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le1iU-0003Nj-Ck
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 16:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1le1h5-0002x0-6W
 for qemu-devel@nongnu.org; Tue, 04 May 2021 16:30:59 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1le1gw-0002Fy-6G
 for qemu-devel@nongnu.org; Tue, 04 May 2021 16:30:58 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBV6n-1lqLt72CbP-00CvoY; Tue, 04 May 2021 22:30:42 +0200
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-8-chouhan.shreyansh2702@gmail.com>
 <df6c1dc7-5d0f-f094-5d2f-2d8f9a909a1c@vivier.eu>
 <CAAQ-SiMje-qBYy8bwRKXmUEMSQk5UR=rPtTPUBGQ6Fqhs-i_eA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH 07/27] virtio-snd: Add properties for class init
Message-ID: <8ddeb9c6-4de0-e0b0-8d35-38f76e5bef4c@vivier.eu>
Date: Tue, 4 May 2021 22:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiMje-qBYy8bwRKXmUEMSQk5UR=rPtTPUBGQ6Fqhs-i_eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:98NLNn+fI3GRTNTRtYCxU/+0BT8FC4F9fPCnTV0sFOkCIZho5T+
 QLvI/petTlGgKuJAJVPoXmNv+4LuKsp5KLPNrnDOd5+l4+Ksn+crZjFrQ5wCVt1rACvQMCU
 N/sTT9zLdses9zHMjzoWcZHZKPpJhBOg1YMLmzMUUbm52fPyKM8X1LYS/4fWk+oihBbRxHD
 N5KkADQGWUJlnd96ftH1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SO68zygzTWU=:/Gmjg+2hiOlP2N2VROGz7U
 7I2rQgAm9RZC8o+8sQdvYLbfujPxRot2WFmPATXPYGAALZFdUTFt75LH2+eBp6QE36eml9qSW
 nmowubRaUWdbAR2cdZsRGHtOal2TEtrL7Qr1bqUWwB28ZqlaKEhrgW1IU2ZNe3QShDM/kPJ/g
 NFLOR3wUnaZoFuYgSgTimoSIi2lZIrtSZIpuKbJREv38naLFb7xsMs0MFJIH16vkzJ4PDTP5T
 DVplRq3qTOF5xB3OMtQKn4gCb5gdmLxZaMxdnnjh0xBqEzFJ3M2XLpVXxbkAEEIqNgQSbk1gU
 SDXbLvQMWyXy6oS2lTx/AILG4TpglKQ94C+BwJNUTgG2Bip42Ttv9/zGppDadohWK81WFhsSi
 7FJQO3PMjLfG8tf+AXRYvOv9drUq91fefsI8ugX7t/s+cLxnZT3ykxHaOIwFyN78BbUZfsJ3Y
 0Nhxg47VoKpx6/7EY1twwbOwXauDkAwqba7IsNW0JRJB4M9mtXWvntfOID+8e+TSt2qIXz4cT
 MQYPEpopY3nRc3yKShaCjs=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shreyansh,

First of all, thank you for your work, I was expecting a virtio sound device for some time...

Le 04/05/2021 à 21:35, Shreyansh Chouhan a écrit :
> On Tue, 4 May 2021 at 19:02, Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote:
> 
>     There is nothing specific to PCI in that code, why do you prevent the use of virtio-snd as a MMIO
>     device?
> 
> I am sorry I do not understand your question completely. If by preventing the use of virtio-snd, you
> mean
> why did I add the PCI dependencies to the Kconfig file, then I think I must have been a bit confused
> while writing it. VIRTIO_PCI already includes those dependencies, I will change the dependency to
> VIRTIO. (Which is what it is for other virtio devices too.)
> 
> However if you mean why did I not add an MMIO binding for this device, then there is no
> specific reason. I simply followed what QEMU had been doing for the other virtio devices.
> Will there be any advantages to implementing the device as a MMIO device? 

No, the question was only about the dependencies, generally a a virtio device is binded to a virtio
bus, and virtio PCI is a PCI card providing a virtio bus with the virtio device attached to it.

For instance, for virtio-net-pci:

HOST

  -> PCI Host controller

    -> PCI virtio net device (TYPE_VIRTIO_NET_PCI)

      -> virtio Bus (TYPE_VIRTIO_BUS)

        -> virtio net device (TYPE_VIRTIO_NET)

TYPE_VIRTIO_NET_PCI is created by hw/virtio/virtio-net-pci.c and TYPE_VIRTIO_NET by hw/net/vrtio-net.c:

hw/virtio/meson.build:

virtio_pci_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net-pci.c'))
virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)

hw/net/meson.build
specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))

hw/net/Kconfig:

config VIRTIO_NET
    bool
    default y
    depends on VIRTIO

So:

the virtio-net device is built when VIRTIO_NET is set,
the virtio-net-pci device is build when VIRTIO_NET and VIRTIO_PCI are set.

So what I expect for virtio-snd:

hw/virtio/meson.build:

virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SND', if_true: files('virtio-snd-pci.c'))

hw/audio/meson.build:

softmmu_ss.add(when: 'CONFIG_VIRTIO_SND', if_true: files('virtio-snd.c'))

hw/audio/Kconfig

config VIRTIO_SND
    bool
    default y
    depends on VIRTIO

With that kind of config, a machine without PCI bus will be able to create a virtio bus to add your
virtio device (like s390x with virtio-ccw of any other MMIO machine like the virt machines).

In short: update your hw/audio/config, and all will be fine.

Thanks,
Laurent

