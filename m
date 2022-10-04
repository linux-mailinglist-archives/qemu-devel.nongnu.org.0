Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0EC5F3E55
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:28:53 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdIJ-0006oz-EO
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcbf-0004jd-JF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:44:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcbb-0004RN-KX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664869482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W4hbuB9mF+gVQ/rzUoBvuEc8JBFaB+mTi/rZG8hJR2k=;
 b=IHxEvcug10qyJmfsoRuRCGQAb2lDcGwsenBiKk7xngmAx96dy4wrJKO40V2BQoGmJ/9HFN
 e8GwDMhAeUWbQ8ABwwGARoILoXNgnM3kq9V62qtRppodZkStfp3gwjXnrGOAxxMPUce2Yi
 sBRLqGH3rNnbLrU4k6VfcIW9jSo1Ajw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-6Y4KgUUDOTujDPpYDk2ojQ-1; Tue, 04 Oct 2022 03:44:40 -0400
X-MC-Unique: 6Y4KgUUDOTujDPpYDk2ojQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75DC2811E87;
 Tue,  4 Oct 2022 07:44:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 200302027061;
 Tue,  4 Oct 2022 07:44:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C65FE1800082; Tue,  4 Oct 2022 09:44:38 +0200 (CEST)
Date: Tue, 4 Oct 2022 09:44:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 peter.maydell@linaro.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] pci-ids: virtio cleanup
Message-ID: <20221004074438.b6v5dsatrlgfzs3c@sirius.home.kraxel.org>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <4f186b7a-79b6-8253-c886-e8b24310ab8a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f186b7a-79b6-8253-c886-e8b24310ab8a@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, Sep 30, 2022 at 04:22:21PM +0200, David Hildenbrand wrote:
> On 30.09.22 15:58, Gerd Hoffmann wrote:
> > Drop legacy ids for virtio 1.0 devices, they are not needed
> > and will be overridden anyway by generic virtio pci code.
> > 
> > Improve modern virtio id documentation.
> > 
> > Gerd Hoffmann (5):
> >    pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
> >    pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
> 
> I remember that for some weird reason, this was required for Linux to
> actually make use of the device. I never figured out why -- maybe that
> changed.

Looking at 'info pci' the mem + pmem devices look identical with and
without this series ...

  Bus  0, device   3, function 0:
    Class 0255: PCI device 1af4:1058
      PCI subsystem 1af4:1100
      IRQ 11, pin A
      BAR4: 64 bit prefetchable memory at 0xfe000000 [0xfe003fff].
      id ""
  Bus  0, device   4, function 0:
    Class 0255: PCI device 1af4:105b
      PCI subsystem 1af4:1100
      IRQ 10, pin A
      BAR4: 64 bit prefetchable memory at 0xfe004000 [0xfe007fff].
      id ""

... and the PCI ID conforms virtio 1.0 (aka 0x1040 + virtio id).

take care,
  Gerd


