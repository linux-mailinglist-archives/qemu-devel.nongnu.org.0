Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C063D571
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0M4v-0007GB-HD; Wed, 30 Nov 2022 07:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p0M4l-0007F0-Uc; Wed, 30 Nov 2022 07:20:32 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p0M4j-000133-Ai; Wed, 30 Nov 2022 07:20:30 -0500
Received: by mail-oi1-x234.google.com with SMTP id l127so18528411oia.8;
 Wed, 30 Nov 2022 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=acxKndfB3szWnx9OQCHF17E5AsBmorCwbkfaTv/F6DY=;
 b=HJHhu+t5eaplCDrUBLHhakLp8UDFBRK11aSMs5q9aQOp12LbLRXbTVEvPxpFJhE0Fn
 CIbQalnZ58Z9BEH+YzdFerjNid1HyICMoLUYJDxdz9+DOXmcYLBgd5UzAZP5IdNfG6mc
 +vLp5GWdT+4qoXw9QdaqNaK3Z+YFkx7+EeQ6fV4J0C4GS5mAIEZU6Qer+Ee7Elo5cT/Z
 Xcz9q85CvTiXrTgNkHO5qV2nd7OjEHyEpxFk5YuP803IlbKz5X5JNFO2hOBI6voBLPTi
 QwGRQAS6Qk9//4TCJS5WWAjhJuvNpDQ/lEwPNPpugWhoMjyqOYcaYMCtPQ8Dskxa0mwl
 DAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=acxKndfB3szWnx9OQCHF17E5AsBmorCwbkfaTv/F6DY=;
 b=Ryk3r+r8wTa3h4tPiQjfvQqTlcez1TX1Ew9LskKVUagL+RWlPCy/a2dgqMbjyaBvW+
 K3DX2JaqDSRzD0N7AFzuO6rwCGDLhbXoJWYGdkBH3QiyFu/7dBkpSAAGjixm7eTYJVY1
 M5uN2C2f8ZmyXKEsOGBqmdtgYyvrI0hhBvSNwjXpC+b7bilh25Q2LL/zfZUL84hBISIv
 3mAdyJ/jk+LJkE4vCAhzxfpy8pBuQk9pPRkXmsOYkJfO0J483jTL+ExSaBCVx1lunz26
 i3BHLkw0OCf7msPW1KS79UNM5EXzXuD1dIfrV5V5pZOBiYnDH3R++Gjm9LDykcTY2jEh
 e5aQ==
X-Gm-Message-State: ANoB5pnf2Ui35Ah2Al6qZv5SDdAMol4OU+skrVVJMK6q0SFeQtjuUqTT
 bJ8nk4lu+SK7FxiCzPx0fRM=
X-Google-Smtp-Source: AA0mqf4dfljCJEW23lQyuyAyu5fk9kTUQt3WyX1s/I6J2pCzoLYbIAAk+eqShpnxKJeTYqyF5QAalw==
X-Received: by 2002:aca:c28b:0:b0:35a:581e:f643 with SMTP id
 s133-20020acac28b000000b0035a581ef643mr32416397oif.151.1669810826389; 
 Wed, 30 Nov 2022 04:20:26 -0800 (PST)
Received: from [192.168.68.102] ([177.102.68.131])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm1083396oae.18.2022.11.30.04.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 04:20:25 -0800 (PST)
Message-ID: <de62350f-cf37-31d8-3a28-73b92a1b9759@gmail.com>
Date: Wed, 30 Nov 2022 09:20:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 0/7] virtio, pci, xics: 3-phase reset conversions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 11/25/22 08:52, Peter Maydell wrote:
> This patchset converts a miscellaneous collection of classes
> to 3-phase reset. The common link, as with other series I've
> sent out recently, is converting child classes that currently
> use device_class_set_parent_reset() so that we can remove
> that function. To do this we first need to convert the parent
> class, and then the subclass.
> 
> The first two patches handle TYPE_VIRTIO_VGA_BASE, and its parent
> TYPE_VIRTIO_PCI.
> 
> The second two handle the parent TYPE_PCIE_ROOT_PORT and its two
> child classes TYPE_CXL_ROOT_PORT and TYPE_PNV_PHB_ROOT_PORT.
> 
> The last three deal with TYPE_PHB3_MSI and the parenT TYPE_ICS.
> 
> This is all 8.0 material.

Tested with the powern8 machine model that uses xics. Series:


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> thanks
> -- PMM
> 
> Peter Maydell (7):
>    hw/virtio: Convert TYPE_VIRTIO_PCI to 3-phase reset
>    hw/display/virtio-vga: Convert TYPE_VIRTIO_VGA_BASE to 3-phase reset
>    pci: Convert TYPE_PCIE_ROOT_PORT to 3-phase reset
>    pci: Convert child classes of TYPE_PCIE_ROOT_PORT to 3-phase reset
>    hw/intc/xics: Reset TYPE_ICS objects with device_cold_reset()
>    hw/intc/xics: Convert TYPE_ICS to 3-phase reset
>    hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI to 3-phase reset
> 
>   hw/display/virtio-vga.h        |  2 +-
>   include/hw/pci/pcie_port.h     |  2 +-
>   include/hw/ppc/xics.h          |  2 +-
>   hw/display/virtio-vga.c        | 15 +++++++++------
>   hw/intc/xics.c                 | 11 ++++++-----
>   hw/pci-bridge/cxl_root_port.c  | 14 +++++++++-----
>   hw/pci-bridge/pcie_root_port.c |  8 +++++---
>   hw/pci-host/pnv_phb.c          | 18 ++++++++++--------
>   hw/pci-host/pnv_phb3_msi.c     | 22 +++++++++-------------
>   hw/virtio/virtio-pci.c         |  8 +++++---
>   10 files changed, 56 insertions(+), 46 deletions(-)
> 

