Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673C68C68
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 15:51:57 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1OW-0007T1-7q
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 09:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53839)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hn1OC-0006Wd-Uj
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hn1OB-00034M-PG
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:51:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hn1OB-000341-Jg
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:51:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D11A659442;
 Mon, 15 Jul 2019 13:51:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B498B5D705;
 Mon, 15 Jul 2019 13:51:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 15:51:05 +0200
Message-Id: <20190715135125.17770-2-quintela@redhat.com>
In-Reply-To: <20190715135125.17770-1-quintela@redhat.com>
References: <20190715135125.17770-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 15 Jul 2019 13:51:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 01/21] migration: fix multifd_recv event typo
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It uses num in multifd_send().  Make it coherent.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/trace-events b/migration/trace-events
index de2e136e57..cd50a1e659 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -80,7 +80,7 @@ get_queued_page_not_dirty(const char *block_name, uint6=
4_t tmp_offset, unsigned
 migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_throttle(void) ""
-multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t fl=
ags, uint32_t next_packet_size) "channel %d packet number %" PRIu64 " pag=
es %d flags 0x%x next packet size %d"
+multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t fl=
ags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages =
%d flags 0x%x next packet size %d"
 multifd_recv_sync_main(long packet_num) "packet num %ld"
 multifd_recv_sync_main_signal(uint8_t id) "channel %d"
 multifd_recv_sync_main_wait(uint8_t id) "channel %d"
--=20
2.21.0


