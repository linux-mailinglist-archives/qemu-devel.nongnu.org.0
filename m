Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20412CBB33
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:06:17 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPxg-00043c-Pg
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPuo-0002iL-7s
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPuj-0002np-PR
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606906991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qu6pDylvSXtEDgjROvhT9RtOetB4hXZzVyaZJaN/sik=;
 b=ixqK10vW9U+Km1YrwCrkyh2VDGKXeCal86Y+IsYLRwptPL1uOm7qo/OJ6BG40w9Shel/Mu
 asEAoO4cC+Yil8ft8j8wNDlAKFi9O+++oc8KNNHDzGk3RI6E2PWDg9LkGeY3afN9N3AWl/
 Z9NVVLhIdS3bS5Fub2A7FY+GBDCMlHU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-ECYh5IN4Mv6ShjUdOF82RA-1; Wed, 02 Dec 2020 06:03:09 -0500
X-MC-Unique: ECYh5IN4Mv6ShjUdOF82RA-1
Received: by mail-wr1-f70.google.com with SMTP id v1so3352980wri.16
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=Qu6pDylvSXtEDgjROvhT9RtOetB4hXZzVyaZJaN/sik=;
 b=sRy2TH9pJrMgtRHWt2yXR3Mzyh7J+VTQRMJ7jO+ULX2UlJPSbcl7nN/IMQ8ABnVP2I
 WxHUJX/j9prpQo7qWFXKrJeeDCW5pgbHTs2r83kc/PHPUCIvERmt0x/sRPiv2aPA0vsX
 FROVT7hplMvO9M4YkjkYZcpsP7A7RrvR/jyegQbEc+NfY6FaRVkkJ1+mTz9Hmbwc/FKN
 AzRDigs+GnlfhXkbuz7Lcpv0pUPSwVO1DiUAVZkf94bJLfIqKSZLvaoufFDRABCQa7lJ
 MxAPsKwsmJnFXas67w+2clinWVZYiYZDRqLcUT7xe2kK03nDEfPF5SeesdWUKqqmhLyI
 kLuA==
X-Gm-Message-State: AOAM531QBMNcQzCL3RJOWx5Rwxdu30+d+oawW/bByLapMFPO3/7aYB2w
 CTSbWlzN2doc1WepO4LBx9VvIj/mtsdqUuJQ1+WE9Wgw7fu2gkDRtMQX4EXPMWeCZICpL/K3yvt
 3MvG/NLEaRl9iRfU4FP+o1oTyluhYP/udB/f4kvHjd+1ukoXGpv1Yd6Z1Q3bz
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr2802692wrt.30.1606906987681;
 Wed, 02 Dec 2020 03:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjXDiPCZpuc00Rm9QCqU+cEA4P4gOm5rJZcnWi/lzdb6Nm9r3xRN53vQSwdfauFR8FtUfkGQ==
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr2802669wrt.30.1606906987408;
 Wed, 02 Dec 2020 03:03:07 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d8sm1586955wrp.44.2020.12.02.03.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:03:06 -0800 (PST)
Date: Wed, 2 Dec 2020 06:03:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] pc,vhost: fixes
Message-ID: <20201202101655.122214-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 5 gave me pause but we do need patch 6 as
it's a guest triggerable assert, and it seemed
cleaner to just take the whole patchset than cherry-pick.

The following changes since commit d73c46e4a84e47ffc61b8bf7c378b1383e7316b5:

  Update version for v5.2.0-rc4 release (2020-12-01 16:21:01 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to a451089140c7b167661d0a23190e6d8bd7eae48d:

  memory: Skip bad range assertion if notifier is DEVIOTLB_UNMAP type (2020-12-02 05:14:29 -0500)

----------------------------------------------------------------
pc,vhost: fixes

A couple of last minute bugfixes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Chen (1):
      vhost-user-scsi: Fix memleaks in vus_proc_req()

Eugenio Pérez (5):
      memory: Rename memory_region_notify_one to memory_region_notify_iommu_one
      memory: Add IOMMUTLBEvent
      memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP IOMMUTLBNotificationType
      intel_iommu: Skip page walking on device iotlb invalidations
      memory: Skip bad range assertion if notifier is DEVIOTLB_UNMAP type

 include/exec/memory.h                     | 40 ++++++++------
 contrib/vhost-user-scsi/vhost-user-scsi.c |  3 +-
 hw/arm/smmu-common.c                      | 13 +++--
 hw/arm/smmuv3.c                           | 13 +++--
 hw/i386/intel_iommu.c                     | 92 ++++++++++++++++++-------------
 hw/misc/tz-mpc.c                          | 32 ++++++-----
 hw/ppc/spapr_iommu.c                      | 15 ++---
 hw/s390x/s390-pci-inst.c                  | 27 +++++----
 hw/virtio/vhost.c                         |  2 +-
 hw/virtio/virtio-iommu.c                  | 30 +++++-----
 softmmu/memory.c                          | 29 ++++++----
 11 files changed, 167 insertions(+), 129 deletions(-)


