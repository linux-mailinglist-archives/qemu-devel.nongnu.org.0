Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BBC526704
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:29:02 +0200 (CEST)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYA0-0007wu-OE
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npXhT-0005ZW-US
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npXhS-0002Ux-5u
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ns4aGzwH/xS9NxJfffrfTWo7UeuEK65aIxfxlyZfm68=;
 b=XQNsONs/8PSnCrlholjF25fObWsbbX4ndgI6S0BKONZ9yQzQoMXuJCUUQpkADxbtJYwCmk
 ROZIYXzl3p0yFuQAaqICzydsuthgPSFkvZ1j16XO6qWKrC9I4jHg0YXfZbL+DDnT6uzrUr
 9XX++sJdO9cM6/ZlCLW9DuOV73nl5Og=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-82qyWwMnP4i0onNJxRcoYA-1; Fri, 13 May 2022 11:59:26 -0400
X-MC-Unique: 82qyWwMnP4i0onNJxRcoYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBC293C138B8;
 Fri, 13 May 2022 15:59:25 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 743D842B949;
 Fri, 13 May 2022 15:59:25 +0000 (UTC)
Subject: [PULL 0/1] Linux header update to v5.18-rc6
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, mjrosato@linux.ibm.com, avihaih@nvidia.com,
 cohuck@redhat.com
Date: Fri, 13 May 2022 09:59:25 -0600
Message-ID: <165245750487.2018734.15148993038263758584.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

The following changes since commit 9de5f2b40860c5f8295e73fea9922df6f0b8d89a:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-12 10:52:15 -0700)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/linux-headers-v5.18-rc6

for you to fetch changes up to e4082063e47e9731dbeb1c26174c17f6038f577f:

  linux-headers: Update to v5.18-rc6 (2022-05-13 08:20:11 -0600)

----------------------------------------------------------------
 * Linux header update to v5.18-rc6 and vfio file massaging (Alex Williamson)

----------------------------------------------------------------
Alex Williamson (1):
      linux-headers: Update to v5.18-rc6

 hw/vfio/common.c                                   |   6 +-
 hw/vfio/migration.c                                |  27 +-
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
 13 files changed, 383 insertions(+), 235 deletions(-)


