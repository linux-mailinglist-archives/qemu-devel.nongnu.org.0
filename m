Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1282287BFE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:02:49 +0200 (CEST)
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbBg-0001Av-Cg
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQb90-0007qE-2M
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQb8x-0003e8-Oa
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602183598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4rH7SCLNftujNBG8qvGoPgJAONA4bPJF54Um58rRv9k=;
 b=gNkdFeB2veOkUnj1tppv3h2eSJgL/u+iIwfd41rVgDm0eINY/Tojb3Eit6CHP9gjeXxw6i
 Oq7o1c/iLv9Pwjhu6KfY7i9jz1Zc2Nbs4MbDTn3iUkcAfLkIQO1VL8/apOvMh2SzgtU5WW
 kyLTwJ//G3B4I6X9+I9tT68DMM9zaWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-CnIR6Zy9O9O0Ax9ETzTU-w-1; Thu, 08 Oct 2020 14:59:55 -0400
X-MC-Unique: CnIR6Zy9O9O0Ax9ETzTU-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3282E80401A
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 18:59:54 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0132E5D9E8
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 18:59:53 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] NBD patches through 2020-10-08
Date: Thu,  8 Oct 2020 13:59:43 -0500
Message-Id: <20201008185951.1026052-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e64cf4d569f6461d6b9072e00d6e78d0ab8bd4a7:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20201008' into staging (2020-10-08 17:18:46 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-10-08

for you to fetch changes up to 82cd3c26889adbd41756de121d38a3aa7c9351c7:

  nbd: Simplify meta-context parsing (2020-10-08 13:35:07 -0500)

----------------------------------------------------------------
nbd patches for 2020-10-08

- silence compilation warnings
- more fixes to prevent reconnect hangs
- improve 'qemu-nbd' termination behavior
- cleaner NBD protocol compliance on string handling

----------------------------------------------------------------
Christian Borntraeger (1):
      nbd: silence maybe-uninitialized warnings

Eric Blake (3):
      qemu-nbd: Honor SIGINT and SIGHUP
      nbd/server: Reject embedded NUL in NBD strings
      nbd: Simplify meta-context parsing

Vladimir Sementsov-Ogievskiy (4):
      block/nbd: fix drain dead-lock because of nbd reconnect-delay
      block/nbd: correctly use qio_channel_detach_aio_context when needed
      block/nbd: fix reconnect-delay
      block/nbd: nbd_co_reconnect_loop(): don't connect if drained

 block/nbd.c  |  71 ++++++++++++++++---
 nbd/server.c | 221 ++++++++++++++++++++++++-----------------------------------
 qemu-nbd.c   |  11 +--
 3 files changed, 155 insertions(+), 148 deletions(-)

-- 
2.28.0


