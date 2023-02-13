Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB8693C0E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROJt-0006hG-95; Sun, 12 Feb 2023 21:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pROJr-0006gT-9r
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:11:51 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pROJp-0000Uh-FB
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:11:51 -0500
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 258359055
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Dq6AFKomGLMzmuLEh3PBATlnUrReBmKlZxIvgKrLsJaIsI4StFCzt
 garIBmGaP/fM2fxfd8gYY2w/R8H7MDQmtdgGwc+qH03H3xA9JacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPKoT5jcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxvZOXDwJx
 PYjJT1UcEq7mM+Sg5yURbw57igjBJGD0II3v3hhyXTAE69jT8+aBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6ZMlsQYz/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuW9a4eEIoHXLSlTtmnJ+
 X/5+mbCOAM9EICP4jy46immmcaayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW1F5zzAET+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIVOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:M/XrwKABfNdSUpHlHel055DYdb4zR+YMi2TDGXoBMSC9E/bo7P
 xG+c5w6faaskd0ZJhNo6HkBEDEewK/yXcX2+ks1NWZLW7bUQKTRekI0WKh+UyCJ8SUzJ866U
 4PSdkGNPTASXJXt4LV2jWZLvoX6OW70cmT9J3jJrRWIT2CqZsM0+60MGim+4RNK2h7OaY=
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2023 21:11:46 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 dz7-20020ad45887000000b0056e9274a7e1so4070480qvb.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVP9tgev/ijYnlxQWpm2EfE9Wd14pn9bgswlyO8HLdY=;
 b=K177wMwB/bUlbJhYWA8M5eG0/a0JzD2MUkJFWNLhHDcxZslhKxOuiZv/yezO1vR9Ts
 qDKeYqdwKrtNllI3mWgxIXU2XuSO/YHtyOt2eH5g1TXXGLSMYt9XDPQycRNfVsF0doU4
 VEGpwtKHUb5AaZbY1f/qEivc+LOw4OVDUXPXFhoE0u9B3v1JiyUdIYV83PxEw5xcMjZB
 rh2uLgR5Y1BLksfIPzrHRltITJjUW20che6DV6FP+YljxF16qvzYdG47j8MbQJlgpIL6
 SpbiUvwbDy3Qu7EZ2MilxGgXkpLXkGQbagU0SebVdrdSeMxZf8NMiCgwABKoACz0NNVp
 LGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVP9tgev/ijYnlxQWpm2EfE9Wd14pn9bgswlyO8HLdY=;
 b=B81SfK3tVVXA3T6647xSRqPH/NIYQwRccZOAZeckd3B3MD9Hay/TWhbJw5xuixE2LE
 c8709mDRvsxUjRsCoN2PKjUfEBrFnsNCVepstuAsufK1ccDNCJWlAvcuLSedKY/WuLJH
 1mqlMecBAFiwXJVGYqB0celqXuUGIIF6bD2sj60+5ohbDzUvSfaoWymYNKj+DC+tQAfa
 275dG/sxAThDCjyYTaPQzixQQJQFDVfvVoBkwsvfNzDB3ftFvaBOUoAy+E72s+BGHBUb
 kh2gMLq6mkkjbXT3D+WqvTCTWPXUD/JRaA6yrgnOeNUXkn93DBTxffeCoez/sKRWqXvZ
 voVA==
X-Gm-Message-State: AO0yUKWeoOem7KBJax0MFHTN9NUNvMC+3vgm25biz8sfOtHG/Ecp3UxG
 ov+Mh81Pyrs/3GtoHtBJ0hEQdvri1oChcn3oOS0Efk1CH09xkMnjb3Vlz68YezkFFZDkeD7HEDF
 AQ8yml6rxQthx9h1aUjQkInewQzq5O7iSg8XP2A==
X-Received: by 2002:ac8:5c50:0:b0:3b9:ec46:bf95 with SMTP id
 j16-20020ac85c50000000b003b9ec46bf95mr39630180qtj.49.1676254305665; 
 Sun, 12 Feb 2023 18:11:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+wXRi3FxtzYwQ0a9CKwkvcIW+haoxUAqDUGudbVqo31QS9JCDf683G08rfjXxaujmKAiaK6Q==
X-Received: by 2002:ac8:5c50:0:b0:3b9:ec46:bf95 with SMTP id
 j16-20020ac85c50000000b003b9ec46bf95mr39630143qtj.49.1676254305325; 
 Sun, 12 Feb 2023 18:11:45 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 fg10-20020a05622a580a00b003b63238615fsm8557135qtb.46.2023.02.12.18.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:11:44 -0800 (PST)
Date: Sun, 12 Feb 2023 21:11:41 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Message-ID: <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.632, SPF_HELO_PASS=-0.001,
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

ping

On 230204 2307, Alexander Bulekov wrote:
> These patches aim to solve two types of DMA-reentrancy issues:
>   
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a reentrancy-guard within APIs used for MMIO access.
>   
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version allows a
> device to associate a reentrancy-guard with a bh, when creating it.
> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
>   
> I replaced most of the qemu_bh_new invocations with the guarded analog,
> except for the ones where the DeviceState was not trivially accessible.
> 
> v5 -> v6:
>     - Only apply checkpatch checks to code in paths containing "/hw/"
>       (/hw/ and include/hw/)
>     - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
> v4-> v5:
>     - Add corresponding checkpatch checks
>     - Save/restore reentrancy-flag when entering/exiting BHs
>     - Improve documentation
>     - Check object_dynamic_cast return value
>   
> v3 -> v4: Instead of changing all of the DMA APIs, instead add an
>     optional reentrancy guard to the BH API.
> 
> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>     attempting to guess DeviceStates in BHs.
> 
> Alexander Bulekov (4):
>   memory: prevent dma-reentracy issues
>   async: Add an optional reentrancy guard to the BH API
>   checkpatch: add qemu_bh_new/aio_bh_new checks
>   hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
> 
>  docs/devel/multiple-iothreads.txt |  7 +++++++
>  hw/9pfs/xen-9p-backend.c          |  4 +++-
>  hw/block/dataplane/virtio-blk.c   |  3 ++-
>  hw/block/dataplane/xen-block.c    |  5 +++--
>  hw/char/virtio-serial-bus.c       |  3 ++-
>  hw/display/qxl.c                  |  9 ++++++---
>  hw/display/virtio-gpu.c           |  6 ++++--
>  hw/ide/ahci.c                     |  3 ++-
>  hw/ide/core.c                     |  3 ++-
>  hw/misc/imx_rngc.c                |  6 ++++--
>  hw/misc/macio/mac_dbdma.c         |  2 +-
>  hw/net/virtio-net.c               |  3 ++-
>  hw/nvme/ctrl.c                    |  6 ++++--
>  hw/scsi/mptsas.c                  |  3 ++-
>  hw/scsi/scsi-bus.c                |  3 ++-
>  hw/scsi/vmw_pvscsi.c              |  3 ++-
>  hw/usb/dev-uas.c                  |  3 ++-
>  hw/usb/hcd-dwc2.c                 |  3 ++-
>  hw/usb/hcd-ehci.c                 |  3 ++-
>  hw/usb/hcd-uhci.c                 |  2 +-
>  hw/usb/host-libusb.c              |  6 ++++--
>  hw/usb/redirect.c                 |  6 ++++--
>  hw/usb/xen-usb.c                  |  3 ++-
>  hw/virtio/virtio-balloon.c        |  5 +++--
>  hw/virtio/virtio-crypto.c         |  3 ++-
>  include/block/aio.h               | 18 ++++++++++++++++--
>  include/hw/qdev-core.h            |  7 +++++++
>  include/qemu/main-loop.h          |  7 +++++--
>  scripts/checkpatch.pl             |  8 ++++++++
>  softmmu/memory.c                  | 17 +++++++++++++++++
>  softmmu/trace-events              |  1 +
>  tests/unit/ptimer-test-stubs.c    |  3 ++-
>  util/async.c                      | 18 +++++++++++++++++-
>  util/main-loop.c                  |  5 +++--
>  util/trace-events                 |  1 +
>  35 files changed, 147 insertions(+), 41 deletions(-)
> 
> -- 
> 2.39.0
> 

