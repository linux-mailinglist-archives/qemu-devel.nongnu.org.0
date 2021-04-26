Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED2F36B3E2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:13:05 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb12u-00034F-KA
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lb0z3-00072L-4L
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lb0yz-0005Lh-4P
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619442539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zCnbgTdtQLCAzxeqvzke96+qge47qOUWxHzwqbezYY=;
 b=isl4CurL7St5/7WDK8ca/KeT2eJAchbb15zlWNtsZOe/LfVBHf/FeEb9d7Y0IfglZIMv2v
 Yh0+86Gz8sfGUyr4koGs8q54/qpV39vAwIo1m1kh+S2upC/BHN10MZp1AOyZJjGFTcj4VF
 +GnoMGYv1hnkjLittAesGH9U3+X/H14=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4ynPJCZ3P5a6wygJ6TJ5Ug-1; Mon, 26 Apr 2021 09:08:56 -0400
X-MC-Unique: 4ynPJCZ3P5a6wygJ6TJ5Ug-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so19019292wro.8
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 06:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+zCnbgTdtQLCAzxeqvzke96+qge47qOUWxHzwqbezYY=;
 b=sdXjmNj02YzASlVXhVzNqsYalBK2j5NgY5EU6RnPrTsEyDL6QokV/bm8cXvok8yQSb
 nV07KwX14KgSgC2aJ7VMpnsjSRCOsjtdbouLJprBbx9zXxSgrAGlfuuuIfjLSLdu60Tf
 wH8WLTdUOwBaMsgrNUyXGQiLCDaOJ8mtF7lEu1SXEsbrMPkfdXJkHBvBHUFALSSerPxn
 g6EjyhP/cZpZkrmtBIg7zSGA+bt/c6k3Q6rbi4H0MIwIqr8jCTJFxKKb2xZhK16LYN0E
 kVMgH4CbA3z4H9Ks4EwVqf9tIeEDRoTFuo+vz3WsvMQ+Fe3NcR8Eq2VHcIWv2k5cFqAO
 sF4g==
X-Gm-Message-State: AOAM5336gN16va9dye5CWG2tryS66brqAYncpZeC/cAYSS2zHJzgRbOp
 TkpEgVhBKxTZP/hGlx3WzAPMDrjph7/+yR3Pogd2+CRuhbDaTxPSdp/NpTwlugfIyCsUUAMMMWJ
 WiDTShzRva9aNWbA=
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr23199817wrw.387.1619442535402; 
 Mon, 26 Apr 2021 06:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAGeoKO6+VGVxWOPl3Yna5rOCvnSC4yFbjENP02HFMeJCtxklluaROUBq/Am1mX//yMNi9Hw==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr23199790wrw.387.1619442535231; 
 Mon, 26 Apr 2021 06:08:55 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id i11sm9978371wrp.56.2021.04.26.06.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 06:08:54 -0700 (PDT)
Date: Mon, 26 Apr 2021 09:08:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
Message-ID: <20210426090834-mutt-send-email-mst@kernel.org>
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-2-its@irrelevant.dk>
 <YIZEPo8gD/puvP5T@apples.localdomain>
 <79c468bd-e600-7acd-2843-e9a77df91e79@redhat.com>
MIME-Version: 1.0
In-Reply-To: <79c468bd-e600-7acd-2843-e9a77df91e79@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 11:27:04AM +0200, Philippe Mathieu-Daudé wrote:
> On 4/26/21 6:40 AM, Klaus Jensen wrote:
> > On Apr 23 07:21, Klaus Jensen wrote:
> >> From: Klaus Jensen <k.jensen@samsung.com>
> >>
> >> Commit 1901b4967c3f changed the nvme device from using a bar exclusive
> >> for MSI-x to sharing it on bar0.
> >>
> >> Unfortunately, the msix_uninit_exclusive_bar() call remains in
> >> nvme_exit() which causes havoc when the device is removed with, say,
> >> device_del. Fix this.
> >>
> >> Additionally, a subregion is added but it is not removed on exit which
> >> causes a reference to linger and the drive to never be unlocked.
> >>
> >> Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
> >> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> >> ---
> >> hw/block/nvme.c | 3 ++-
> >> 1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> >> index 624a1431d072..5fe082ec34c5 100644
> >> --- a/hw/block/nvme.c
> >> +++ b/hw/block/nvme.c
> >> @@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
> >>     if (n->pmr.dev) {
> >>         host_memory_backend_set_mapped(n->pmr.dev, false);
> >>     }
> >> -    msix_uninit_exclusive_bar(pci_dev);
> >> +    msix_uninit(pci_dev, &n->bar0, &n->bar0);
> >> +    memory_region_del_subregion(&n->bar0, &n->iomem);
> >> }
> >>
> >> static Property nvme_props[] = {
> >> -- 
> >> 2.31.1
> >>
> > 
> > Ping for a review on this please :)
> 
> You forgot to Cc the maintainers :/ (doing it now).
> 
> $ ./scripts/get_maintainer.pl -f include/hw/pci/msix.h
> "Michael S. Tsirkin" <mst@redhat.com> (supporter:PCI)
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:PCI)


