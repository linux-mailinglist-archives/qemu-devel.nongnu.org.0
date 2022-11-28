Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBD63A904
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozdsj-00074l-48; Mon, 28 Nov 2022 08:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozdsa-00074N-NU
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozdsY-0000tM-Ly
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669640937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h/5XUExehg3C4QVDi9PYPSOknokybWkrSitvzrejwOA=;
 b=VwVy0HWclSEdgfrCYaPynW6BrXhwKY+Y+Hma3R3fNRPOtSus3JHQ5wM4C/B+BKJoZwwwMg
 OLLASLNZQ9mFZ3imTX6aWqhkyrav7YybNYmfw6t/XANxjkB5Ym2C9Zw3mGjDMZ5VIW8MmT
 4oA+2sXKNyNSKrPgdsPeGFEFCmJwFYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-7bk9OwZlPnSpUNfLukgP7A-1; Mon, 28 Nov 2022 08:08:55 -0500
X-MC-Unique: 7bk9OwZlPnSpUNfLukgP7A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F0C2811E75
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 13:08:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73BB4492B05;
 Mon, 28 Nov 2022 13:08:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 0/2] Put Canary End of List in VMSTATE
Date: Mon, 28 Nov 2022 14:08:49 +0100
Message-Id: <20221128130851.14362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi

This are a patch series from David from January.
The changes that I did:
- rebases
- change assert() in vmstate_check() to and if and printf.

Please, Review.

Dr. David Alan Gilbert (2):
  migration: Add canary to VMSTATE_END_OF_LIST
  migration: Perform vmsd structure check during tests

 include/migration/vmstate.h |  7 +++++-
 migration/savevm.c          | 43 +++++++++++++++++++++++++++++++++++++
 migration/vmstate.c         |  2 ++
 3 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.38.1


