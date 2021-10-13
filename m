Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDE42C9DA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 21:19:48 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majn1-0005zd-72
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 15:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1majlO-00041X-1D
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1majlK-0003do-NZ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634152682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7E98pIX7+2rmaMAnEyh504U6I0RF7bicTJi1EYcpGM8=;
 b=N7JfGn9ninLccPkosVb+3hlM46bL7KWSx9fO1egpiIrV7IRTYnQOBTjlSIApc7lhI34yqF
 JCaqfv3Fnim2BXVfPrxjNgIjIQX/zDf6gtiLdkSewSAQgg8MwS1M87MU7YLKrRFAOL3URK
 uZVriZLmVBnpGRyCfDF5Y39to1ythE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-LPoLQC73PeS66K_sVxg_4Q-1; Wed, 13 Oct 2021 15:17:59 -0400
X-MC-Unique: LPoLQC73PeS66K_sVxg_4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F44DF8A0;
 Wed, 13 Oct 2021 19:17:58 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3528860CA1;
 Wed, 13 Oct 2021 19:17:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH v3 0/2] virtio-iommu: Name Tweaks
Date: Wed, 13 Oct 2021 15:17:53 -0400
Message-Id: <20211013191755.767468-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series removes the non transitional name, drop the base_name
and change the generic_name into  "virtio-iommu-pci".

History:

v2 -> v3:
- fixed duplicate in commit msg
- added Connie's R-b

v1 -> v2:
- drop the base_name and change the generic_name into  "virtio-iommu-pci"
  (Connie)


Eric Auger (2):
  virtio-iommu: Remove the non transitional name
  virtio-iommu: Drop base_name and change generic_name

 hw/virtio/virtio-iommu-pci.c     | 4 +---
 include/hw/virtio/virtio-iommu.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.27.0


