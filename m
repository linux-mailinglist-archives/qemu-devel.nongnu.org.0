Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D74524A65
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:36:38 +0200 (CEST)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6BR-00040A-17
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np64w-0001KB-7D
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np64u-0000o1-D3
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652351391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VP866pfmQT0nfJXtrlVJP9gnrc8jjC8tuGkeBk4Be1I=;
 b=gvwKpX4P/t12JdX8nx6lN0zWqzi+QI+bw5pF4GYe/2HmmR/BWBVg6X3MpEUdfSjHdhzgEU
 f2lh9GYkUvSXTXjYJipahrUsm09jEMn5I/IF6P2jrfC1m8zLnCwvHIbwO75MqGxFjugTY+
 D3f6gzD/Sc8J9y21yvG8cY/ThWhqvaY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-UPliWUlwN9uNFYQ67VQx5g-1; Thu, 12 May 2022 06:29:48 -0400
X-MC-Unique: UPliWUlwN9uNFYQ67VQx5g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 146CC80159B;
 Thu, 12 May 2022 10:29:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0789D56A184;
 Thu, 12 May 2022 10:29:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PULL 0/2] Update linux-headers to v5.18-rc6
Date: Thu, 12 May 2022 12:29:40 +0200
Message-Id: <20220512102942.1134141-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

 Hi!

The following changes since commit ec11dc41eec5142b4776db1296972c6323ba5847:

  Merge tag 'pull-misc-2022-05-11' of git://repo.or.cz/qemu/armbru into staging (2022-05-11 09:00:26 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-12

for you to fetch changes up to 98cdec27e4396a2982c85ed148f70770bb6600b4:

  vfio: tolerate migration protocol v1 uapi renames (2022-05-12 11:00:05 +0200)

----------------------------------------------------------------
* Update the linux headers to v5.18-rc6 (required for multiple patch
  series that are currently in flight)
* Fix the vfio code to compile again after the header update

I'm sending this as a separate pull request, so that the the patch
series that are currently in flight do not have to deal each time
with the ugly vfio macro rename anymore.

----------------------------------------------------------------
Matthew Rosato (1):
      vfio: tolerate migration protocol v1 uapi renames

Thomas Huth (1):
      linux-headers: Update headers to v5.18-rc6

 include/standard-headers/linux/input-event-codes.h |  25 +-
 include/standard-headers/linux/virtio_config.h     |   6 +
 include/standard-headers/linux/virtio_crypto.h     |  82 ++++-
 linux-headers/asm-arm64/kvm.h                      |  16 +
 linux-headers/asm-generic/mman-common.h            |   2 +
 linux-headers/asm-mips/mman.h                      |   2 +
 linux-headers/linux/kvm.h                          |  27 +-
 linux-headers/linux/psci.h                         |   4 +
 linux-headers/linux/userfaultfd.h                  |   8 +-
 linux-headers/linux/vfio.h                         | 406 ++++++++++-----------
 linux-headers/linux/vhost.h                        |   7 +
 hw/vfio/common.c                                   |   2 +-
 hw/vfio/migration.c                                |  19 +-
 13 files changed, 377 insertions(+), 229 deletions(-)


