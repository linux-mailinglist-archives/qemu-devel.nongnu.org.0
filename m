Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE1543CBC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:26:08 +0200 (CEST)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz1Jf-0002ke-9E
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nz1H6-0000BE-Vz
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nz1H4-0006XP-Nq
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654716206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hS372k5ayEW03WSD9IuDmqTtgdBBNQiOMm9HluogIYo=;
 b=Yhr5UGGmVx3qxiUVJM0NGCVXZUz8ymNkhFTVwsq/hRYjTr+L5DuvVumay6CjW+4Gi7WpYM
 qhirBVYoKVBbYLDL9FQs7kUS3FI2kvRZig9lpfIk/htI85geE36HTg9iuZXAD6D/ADrVcA
 O2ouDE79TjShPfk7RqHx5xyyI+Zu8C0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-qY4-m3RhN86KrOW5D5bkUg-1; Wed, 08 Jun 2022 15:23:24 -0400
X-MC-Unique: qY4-m3RhN86KrOW5D5bkUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83EA838149AB
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 19:23:24 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.35.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C7C918EA6;
 Wed,  8 Jun 2022 19:23:24 +0000 (UTC)
Subject: [PULL 0/1] VFIO updates 2022-06-08
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com
Cc: eric.auger@redhat.com
Date: Wed, 08 Jun 2022 13:23:23 -0600
Message-ID: <165471611818.206382.17518111383201260657.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5:

  Merge tag 'pull-la-20220606' of https://gitlab.com/rth7680/qemu into staging (2022-06-06 16:16:01 -0700)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20220608.0

for you to fetch changes up to ec6600be0dc16982181c7ad80d94c143c0807dd2:

  vfio/common: remove spurious warning on vfio_listener_region_del (2022-06-08 08:44:19 -0600)

----------------------------------------------------------------
VFIO updates 2022-06-08

 * Fix spurious alignment warnings for TPM on unmap too (Eric Auger)

----------------------------------------------------------------
Eric Auger (1):
      vfio/common: remove spurious warning on vfio_listener_region_del

 hw/vfio/common.c     | 10 +++++++++-
 hw/vfio/trace-events |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)


