Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4F5F080C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:57:06 +0200 (CEST)
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeClV-00010C-Hs
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeCj4-00063D-JD
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeCiv-0001g0-Uj
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664531664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6DnGAkohTrSVWAu6Css++Q0YgNkfGf0e7aD1GEj5Vc=;
 b=GhteMDE7zD8Ef/TlSpNHQvXefu16FlHIB4AmgRuV9O94fqpG48Oz91o7sJxVXrVI9nEQ2i
 Atu+Z37QcbxlckqGVZULDxt17MF/q6vagYriO8jm3mKCBnxZlzOrgAzbocT1PCs0Qnr9TK
 k3hDiQcofTFUUoMZbTNqXmzU9kLi5Ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-6iUaGlsmNxKqSdaB8AzeUg-1; Fri, 30 Sep 2022 05:54:20 -0400
X-MC-Unique: 6iUaGlsmNxKqSdaB8AzeUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4949A800186;
 Fri, 30 Sep 2022 09:54:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1550B112131B;
 Fri, 30 Sep 2022 09:54:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C18FF180039F; Fri, 30 Sep 2022 11:54:18 +0200 (CEST)
Date: Fri, 30 Sep 2022 11:54:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 peter.maydell@linaro.org
Subject: Re: [PATCH] pci-ids: sync docs + header
Message-ID: <20220930095418.eq6bwrunzypdhrmt@sirius.home.kraxel.org>
References: <20220930073553.1626190-1-kraxel@redhat.com>
 <20220930051235-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930051235-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 05:22:33AM -0400, Michael S. Tsirkin wrote:
> On Fri, Sep 30, 2022 at 09:35:53AM +0200, Gerd Hoffmann wrote:
> > docs/specs/pci-ids.txt and include/hw/pci/pci.h are out of sync,
> > fix that.  Try improve the comment which points to pci-ids.txt.
> > 
> > Also drop the list of modern virtio devices and explain how they
> > are calculated instead.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  docs/specs/pci-ids.txt | 19 ++++++++++---------
> >  include/hw/pci/pci.h   |  7 ++++++-
> >  2 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> > index dd6859d039d0..6be7bc108d66 100644
> > --- a/docs/specs/pci-ids.txt
> > +++ b/docs/specs/pci-ids.txt
> > @@ -22,16 +22,17 @@ maintained as part of the virtio specification.
> >  1af4:1004  SCSI host bus adapter device (legacy)
> >  1af4:1005  entropy generator device (legacy)
> >  1af4:1009  9p filesystem device (legacy)
> > +1af4:1012  vsock device (legacy)
> > +1af4:1013  pmem device (legacy)
> > +1af4:1014  iommu device (legacy)
> > +1af4:1015  mem device (legacy)
> 
> Wait, how come we have legacy vsock/pmem/iommu/mem?
> They were only introduced after 1.0.

I've just synced with the header file, and the #defines there
seem to be actually used:

kraxel@sirius ~/projects/qemu (pci-ids)# git grep PCI_DEVICE_ID_VIRTIO_IOMMU
hw/virtio/virtio-iommu-pci.c:    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
include/hw/pci/pci.h:#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014

But, yes, the question is valid.  1.0-only devices should not need
a legacy id.  Dunno how that happened ...

take care,
  Gerd


