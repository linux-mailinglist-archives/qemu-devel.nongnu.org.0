Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EF4580F65
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:54:24 +0200 (CEST)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGKd-0001x5-2f
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHQ-0007IU-IV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHO-0000uj-8G
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658825461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KZTyPYRfo1OXMJBI4tM3NygyoMomSzCBlESDF2+bw8M=;
 b=UCwbgSJLIMewzR4geGk7fe69K0WvYohcsNz4v0m0raH65z+x/qi/YOWyYN4dT49YUpmXGE
 SBMt1UPjqHgAaP2POg07I5EToZ1Ald231SLFTCNQDOg2lT6PvanhtVzD+Z+Y7Tu1PuTaaS
 qW7G/l3mP8P6UlRJlRR5SA0cwMfe6to=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-dC-sKcEZOuehATzX1ElY0g-1; Tue, 26 Jul 2022 04:50:59 -0400
X-MC-Unique: dC-sKcEZOuehATzX1ElY0g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79FE0185A7B2;
 Tue, 26 Jul 2022 08:50:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-201.pek2.redhat.com
 [10.72.12.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10C31492CA2;
 Tue, 26 Jul 2022 08:50:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/3] Net patches
Date: Tue, 26 Jul 2022 16:50:52 +0800
Message-Id: <20220726085055.17239-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 75a8ce64f6e37513698857fb4284170da163ed06:

  vdpa: Fix memory listener deletions of iova tree (2022-07-26 16:24:19 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Ake Koomsin (1):
      e1000e: Fix possible interrupt loss when using MSI

Eugenio Pérez (2):
      vhost: Get vring base from vq, not svq
      vdpa: Fix memory listener deletions of iova tree

 hw/net/e1000e_core.c   |  2 ++
 hw/virtio/vhost-vdpa.c | 26 +++++++++++++-------------
 2 files changed, 15 insertions(+), 13 deletions(-)


