Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A085B07FB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:06:53 +0200 (CEST)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwdg-0001Vo-8T
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaU-0004A7-MR
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaR-0004SU-JD
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pz5jiO3T6MmmGAcd69o+JUO9bTrKVzSUtknQ9w1fSWw=;
 b=Uee5sorZGvNaHAGY4Vwzg+tTrcA4p7i3n7/vJIUlnMP41mQeHALNr+pby/RulP7ZHhowJq
 pK0CYq5umzsGpVSnTzlyCvtdomr79/qiDpw95P6X8U3/0vhpm3dwQbw0YjLvGqy3jzf2m3
 wE3mO31QUYYvU0pOr/GcrThMEHHPeZg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-kjbkHhwpMumy2r4__0Bqvg-1; Wed, 07 Sep 2022 11:03:29 -0400
X-MC-Unique: kjbkHhwpMumy2r4__0Bqvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEB14805AF5
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 15:03:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8474B4010D42;
 Wed,  7 Sep 2022 15:03:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3BE0721E6900; Wed,  7 Sep 2022 17:03:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 00/10] QAPI patches patches for 2022-09-07
Date: Wed,  7 Sep 2022 17:03:17 +0200
Message-Id: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:

  Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qemu into staging (2022-09-06 08:31:24 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-09-07

for you to fetch changes up to 6e7a37ffc230d06852f1a8893097331d39df77c9:

  qapi: fix examples of events missing timestamp (2022-09-07 15:10:13 +0200)

----------------------------------------------------------------
QAPI patches patches for 2022-09-07

----------------------------------------------------------------
Victor Toso (10):
      qapi: fix example of query-ballon command
      qapi: fix example of query-vnc command
      qapi: fix example of query-dump-guest-memory-capability command
      qapi: fix example of BLOCK_JOB_READY event
      qapi: fix example of NIC_RX_FILTER_CHANGED event
      qapi: fix example of DEVICE_UNPLUG_GUEST_ERROR event
      qapi: fix example of MEM_UNPLUG_ERROR event
      qapi: fix examples of blockdev-add with qcow2
      qapi: fix example of query-hotpluggable-cpus command
      qapi: fix examples of events missing timestamp

 qapi/block-core.json | 12 ++++++------
 qapi/dump.json       |  2 +-
 qapi/machine.json    |  8 ++++----
 qapi/migration.json  | 27 +++++++++++++++++++++++----
 qapi/net.json        |  1 -
 qapi/qdev.json       |  3 +--
 qapi/ui.json         |  4 ++--
 7 files changed, 37 insertions(+), 20 deletions(-)

-- 
2.37.2


