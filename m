Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739821D7EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 18:39:20 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jainP-0007Wj-6B
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 12:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jaigo-0005MS-J1
 for qemu-devel@nongnu.org; Mon, 18 May 2020 12:32:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35143
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jaigk-0003Eh-QD
 for qemu-devel@nongnu.org; Mon, 18 May 2020 12:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589819545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=71MK90g4HIc3XBYYifEVROYuYlnS85PxlcI+K0emV+E=;
 b=Uofa+IaQ9PxzSFAnJTqzqPmoXAu8amUdqWSr7p6sj1SP0LuwczgjTnxdIGO8xTGmSRS0Wv
 65QwvBZZop0f0NEeteZpXaG2DAvDKxghpCOAmyLi2So1QpBzq+m1kuiqF2Lt+Kusxq146i
 IY+G+nY1BMycGw4Lg7nOopTpMKe3tMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-3xL3apKxNeyOE6p9TGyf7A-1; Mon, 18 May 2020 12:32:21 -0400
X-MC-Unique: 3xL3apKxNeyOE6p9TGyf7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7643F81CBE1
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 16:32:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 462DC5D9DC
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 16:32:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] NBD patches for 2020-05-18
Date: Mon, 18 May 2020 11:32:12 -0500
Message-Id: <20200518163218.649412-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit debe78ce14bf8f8940c2bdf3ef387505e9e035a9:

  Merge remote-tracking branch 'remotes/rth/tags/pull-fpu-20200515' into staging (2020-05-15 19:51:16 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-05-18

for you to fetch changes up to d8154b0945f795177511ea0e2212bd5c749fe84c:

  iotests: Enhance 223 to cover qemu-img map improvements (2020-05-18 11:02:05 -0500)

We've got a couple of first-time contributors included in this one :)

----------------------------------------------------------------
nbd patches for 2020-05-20

- fix stranded fd in 'qemu-nbd -c /dev/nbd0'
- add 'qemu-img map --start-offset --max-length' options

----------------------------------------------------------------
Eric Blake (1):
      iotests: Enhance 223 to cover qemu-img map improvements

Eyal Moscovici (4):
      qemu_img: add cvtnum_full to print error reports
      qemu-img: validate image length in img_map
      qemu-img: refactor dump_map_entry JSON format output
      qemu-img: Add --start-offset and --max-length to map

Raphael Pour (1):
      qemu-nbd: Close inherited stderr

 docs/tools/qemu-img.rst    |   2 +-
 qemu-img.c                 | 113 +++++++++++++++++++++++++++------------------
 qemu-nbd.c                 |   6 ++-
 qemu-img-cmds.hx           |   4 +-
 tests/qemu-iotests/049.out |   8 ++--
 tests/qemu-iotests/223     |   6 ++-
 tests/qemu-iotests/223.out |   3 +-
 7 files changed, 85 insertions(+), 57 deletions(-)

-- 
2.26.2


