Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F164C596
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 10:10:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Nm0-0000nO-4D; Wed, 14 Dec 2022 04:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p5Nlu-0000n7-Uu
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p5Nlt-0007jS-6u
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671008988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pH2XO4taCjKI6BIT71vGkv8iUIdI83Of+/UYGkrF2kw=;
 b=gluG7x3Ba5pR8/XWhEKQjJqz5VrD32V/Zy5Q6nHAMOE9EJOzXDGluW1kAPt7bLEz5LKevL
 36J4gxLMp8H1Db/WOYmCj4u1JpXE8zimH9GZ4zvpR7+DSWFF/ZrrulorQzxfnit+GAqF6G
 eap3oaVcGtT0dVOV6tz4t5pRmH4Krjs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-VCB661qSPrWPNHHoRLIp3g-1; Wed, 14 Dec 2022 04:09:47 -0500
X-MC-Unique: VCB661qSPrWPNHHoRLIp3g-1
Received: by mail-wr1-f72.google.com with SMTP id
 o8-20020adfba08000000b00241e80f08e0so3416869wrg.12
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 01:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pH2XO4taCjKI6BIT71vGkv8iUIdI83Of+/UYGkrF2kw=;
 b=VOM23UpOyb7cJvefFrM8wrRviOKXgEuOunpxIV+ARr+s3fXOaK3ReYoX/v6w66lyIN
 Iz1ky65m4wp5+Lf5pLTMM5lKmh7IWseFEAsopIz3DIPnAggOMw+G90x/5IokyUAtGHyd
 EOWA7GqFAQ+7lQmazM3ePEprHc7URRrg7nwWnOPq9u4L+oif5+crz2me10pdO+NZKQup
 7H3LNy7v3JwfGbc1w3jgsXCmvUXrAdLJo5tahIeFjAKSYZzd9hO+xszHyF2aM3Kp+1Od
 mu5ykJv7J0gDmDvbQjIgMada67Q3mncBHEqR0tqrWULhrXm1IruhdjzuSevzBFkvVuzk
 lDkA==
X-Gm-Message-State: ANoB5pm2hjsnMD2KijpvtJKEhyYJ0cssFdymN1eSRopn6sWG+kCmd/48
 hi9BpqLTlru9ALkgJSh8KtjGNFdjOWS5ko9T7Jc4suwf9aRlgHBuUwSlefwbgguE7hBG4ejULMC
 kxf3VpsMEbO97JK8L+hgNn+XMZfOgzYZtwG5fUcEWGwKpjKOodxyF59Oi3KXiXcfKbtc=
X-Received: by 2002:a7b:c5c4:0:b0:3d1:f234:12cc with SMTP id
 n4-20020a7bc5c4000000b003d1f23412ccmr17606673wmk.33.1671008985672; 
 Wed, 14 Dec 2022 01:09:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7vaDGjA+OyA9dJ8k1c3eRqM531Um/iZFGdzC7VGyy6IA6gTPOXwMllFBLb/MLpJbiCNUQ5yA==
X-Received: by 2002:a7b:c5c4:0:b0:3d1:f234:12cc with SMTP id
 n4-20020a7bc5c4000000b003d1f23412ccmr17606635wmk.33.1671008985282; 
 Wed, 14 Dec 2022 01:09:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b4868eb71bsm1925106wmq.25.2022.12.14.01.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 01:09:44 -0800 (PST)
Date: Wed, 14 Dec 2022 10:09:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 for-8.0 0/2] pci: drop redundant
 PCIDeviceClass::is_bridge field
Message-ID: <20221214100943.7f64a34b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221129101341.185621-1-imammedo@redhat.com>
References: <20221129101341.185621-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, 29 Nov 2022 11:13:39 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> Changelog:
>    - keep comment reminding that there was a bridge, so it would be easy to find
>      removed code if someone wishes to bring it back
>    - s/IS_PCI_BRIDGE/is_bridge/ in one instance where local is_bridge already exists

Michael,

can you merge this via PCI tree?

> 
> Igor Mammedov (2):
>   remove DEC 21154 PCI bridge
>   pci: drop redundant PCIDeviceClass::is_bridge field
> 
>  hw/pci-bridge/dec.h                |   9 --
>  include/hw/pci/pci.h               |  11 +-
>  include/hw/pci/pci_bridge.h        |   1 +
>  include/hw/pci/pci_ids.h           |   1 -
>  hw/acpi/pcihp.c                    |   3 +-
>  hw/i386/acpi-build.c               |   5 +-
>  hw/pci-bridge/cxl_downstream.c     |   1 -
>  hw/pci-bridge/cxl_upstream.c       |   1 -
>  hw/pci-bridge/dec.c                | 164 -----------------------------
>  hw/pci-bridge/i82801b11.c          |   1 -
>  hw/pci-bridge/meson.build          |   2 -
>  hw/pci-bridge/pci_bridge_dev.c     |   1 -
>  hw/pci-bridge/pcie_pci_bridge.c    |   1 -
>  hw/pci-bridge/pcie_root_port.c     |   1 -
>  hw/pci-bridge/simba.c              |   1 -
>  hw/pci-bridge/xio3130_downstream.c |   1 -
>  hw/pci-bridge/xio3130_upstream.c   |   1 -
>  hw/pci-host/designware.c           |   1 -
>  hw/pci-host/uninorth.c             |   9 +-
>  hw/pci-host/xilinx-pcie.c          |   1 -
>  hw/pci/pci.c                       |  20 ++--
>  hw/ppc/spapr_pci.c                 |  15 +--
>  22 files changed, 23 insertions(+), 228 deletions(-)
>  delete mode 100644 hw/pci-bridge/dec.h
>  delete mode 100644 hw/pci-bridge/dec.c
> 


