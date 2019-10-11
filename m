Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B0D487B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 21:33:55 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ0fi-0002Gd-0p
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 15:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Pe-0000Oq-Ad
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Pd-0003sn-7T
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50684)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iJ0Pd-0003s5-26
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92F94306729E;
 Fri, 11 Oct 2019 19:17:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C23695D6C8;
 Fri, 11 Oct 2019 19:17:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, eric.auger@redhat.com,
 richardw.yang@linux.intel.com
Subject: [PULL 10/21] migration/postcopy: fix typo in
 mark_postcopy_blocktime_begin's comment
Date: Fri, 11 Oct 2019 20:16:35 +0100
Message-Id: <20191011191646.226814-11-dgilbert@redhat.com>
In-Reply-To: <20191011191646.226814-1-dgilbert@redhat.com>
References: <20191011191646.226814-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 11 Oct 2019 19:17:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20191005220517.24029-3-richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/postcopy-ram.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 08a3ed516e..3a72f7b4fe 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -768,9 +768,11 @@ static void mark_postcopy_blocktime_begin(uintptr_t =
addr, uint32_t ptid,
     atomic_xchg(&dc->page_fault_vcpu_time[cpu], low_time_offset);
     atomic_xchg(&dc->vcpu_addr[cpu], addr);
=20
-    /* check it here, not at the begining of the function,
-     * due to, check could accur early than bitmap_set in
-     * qemu_ufd_copy_ioctl */
+    /*
+     * check it here, not at the beginning of the function,
+     * due to, check could occur early than bitmap_set in
+     * qemu_ufd_copy_ioctl
+     */
     already_received =3D ramblock_recv_bitmap_test(rb, (void *)addr);
     if (already_received) {
         atomic_xchg(&dc->vcpu_addr[cpu], 0);
--=20
2.23.0


