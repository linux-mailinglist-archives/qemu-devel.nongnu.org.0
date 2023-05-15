Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEF702749
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:33:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTdC-0004U7-Tw; Mon, 15 May 2023 04:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTco-00048K-Sm
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTcm-0002Kv-KA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684139526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IYWGKhtKwLFcuFUzm0dfGbM4KWDYTExWa/UJtHJsPg0=;
 b=Il87+ngkhrSLZEAlXkf2zE/ogTQP2kii25lHdfsIzlMJXBGHCYB1Rt9lxgLDcWqh6BvaHQ
 eG1RuYD/qa363MJHDQhQBbUG6IvsD10FehWHMIu29C4edzOW/Jx11OxLgXvPXv18BLKHxc
 8XLKE+DTF8fUt0S03BbsQ2t5yWJAlBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-SJPvb-bQPBqOSqgXUzejIg-1; Mon, 15 May 2023 04:32:04 -0400
X-MC-Unique: SJPvb-bQPBqOSqgXUzejIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7572388B771;
 Mon, 15 May 2023 08:32:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 906B240F06B;
 Mon, 15 May 2023 08:32:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, Juan Quintela <quintela@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 0/3] Migration documentation
Date: Mon, 15 May 2023 10:31:58 +0200
Message-Id: <20230515083201.55060-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Continuing on my saga to not have a pointer about how migration
works/should work, this are the doc for the long mails that I had to do last week:

1 - Document how backwards compatibility is supposed to work (that is
    what it was on v1 and v2)

2 - Document how to handle features that depend of things outside of qemu
    a.k.a. we make this a libvirt/management app problem.

3 - Document how we are supposed to fix backwards compatibility
    brokenness.

You can see that I was able to find commits on tree to illustrate 1
and 3.  The problem for 2 appeared from a discussion with Avihai about
future vfio devices.  Do anyone have a good idea about a commit
already on tree to document it?

Please review.

Later, Juan.

Juan Quintela (3):
  migration: Add documentation for backwards compatiblity
  migration/docs: How to migrate when hosts have different features
  migration/doc: We broke backwards compatibility

 docs/devel/migration.rst | 503 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 503 insertions(+)

-- 
2.40.1


