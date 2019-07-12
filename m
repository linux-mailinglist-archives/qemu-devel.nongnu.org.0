Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96667176
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:33:20 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlwbu-00067g-KB
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44819)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hlwb2-0004CE-PI
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hlwaz-0001bC-2i
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:32:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hlwav-0001Yz-Sd
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:32:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 23669A3B71;
 Fri, 12 Jul 2019 14:32:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14E9760920;
 Fri, 12 Jul 2019 14:32:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 16:31:50 +0200
Message-Id: <20190712143207.4214-3-quintela@redhat.com>
In-Reply-To: <20190712143207.4214-1-quintela@redhat.com>
References: <20190712143207.4214-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 12 Jul 2019 14:32:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/19] migration-test: rename parameter to
 parameter_int
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

We would need _str ones on the next patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/migration-test.c | 55 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index b6434628e1..a4feb9545d 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -398,7 +398,8 @@ static char *migrate_get_socket_address(QTestState *w=
ho, const char *parameter)
     return result;
 }
=20
-static long long migrate_get_parameter(QTestState *who, const char *para=
meter)
+static long long migrate_get_parameter_int(QTestState *who,
+                                           const char *parameter)
 {
     QDict *rsp;
     long long result;
@@ -409,17 +410,17 @@ static long long migrate_get_parameter(QTestState *=
who, const char *parameter)
     return result;
 }
=20
-static void migrate_check_parameter(QTestState *who, const char *paramet=
er,
-                                    long long value)
+static void migrate_check_parameter_int(QTestState *who, const char *par=
ameter,
+                                        long long value)
 {
     long long result;
=20
-    result =3D migrate_get_parameter(who, parameter);
+    result =3D migrate_get_parameter_int(who, parameter);
     g_assert_cmpint(result, =3D=3D, value);
 }
=20
-static void migrate_set_parameter(QTestState *who, const char *parameter=
,
-                                  long long value)
+static void migrate_set_parameter_int(QTestState *who, const char *param=
eter,
+                                      long long value)
 {
     QDict *rsp;
=20
@@ -429,7 +430,7 @@ static void migrate_set_parameter(QTestState *who, co=
nst char *parameter,
                     parameter, value);
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
-    migrate_check_parameter(who, parameter, value);
+    migrate_check_parameter_int(who, parameter, value);
 }
=20
 static void migrate_pause(QTestState *who)
@@ -681,7 +682,7 @@ static void deprecated_set_downtime(QTestState *who, =
const double value)
                     " 'arguments': { 'value': %f } }", value);
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
-    migrate_check_parameter(who, "downtime-limit", value * 1000);
+    migrate_check_parameter_int(who, "downtime-limit", value * 1000);
 }
=20
 static void deprecated_set_speed(QTestState *who, long long value)
@@ -692,7 +693,7 @@ static void deprecated_set_speed(QTestState *who, lon=
g long value)
                           "'arguments': { 'value': %lld } }", value);
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
-    migrate_check_parameter(who, "max-bandwidth", value);
+    migrate_check_parameter_int(who, "max-bandwidth", value);
 }
=20
 static void deprecated_set_cache_size(QTestState *who, long long value)
@@ -703,7 +704,7 @@ static void deprecated_set_cache_size(QTestState *who=
, long long value)
                          "'arguments': { 'value': %lld } }", value);
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
-    migrate_check_parameter(who, "xbzrle-cache-size", value);
+    migrate_check_parameter_int(who, "xbzrle-cache-size", value);
 }
=20
 static void test_deprecated(void)
@@ -738,8 +739,8 @@ static int migrate_postcopy_prepare(QTestState **from=
_ptr,
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
      */
-    migrate_set_parameter(from, "max-bandwidth", 100000000);
-    migrate_set_parameter(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "max-bandwidth", 100000000);
+    migrate_set_parameter_int(from, "downtime-limit", 1);
=20
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
@@ -790,7 +791,7 @@ static void test_postcopy_recovery(void)
     }
=20
     /* Turn postcopy speed down, 4K/s is slow enough on any machines */
-    migrate_set_parameter(from, "max-postcopy-bandwidth", 4096);
+    migrate_set_parameter_int(from, "max-postcopy-bandwidth", 4096);
=20
     /* Now we start the postcopy */
     migrate_postcopy_start(from, to);
@@ -831,7 +832,7 @@ static void test_postcopy_recovery(void)
     g_free(uri);
=20
     /* Restore the postcopy bandwidth to unlimited */
-    migrate_set_parameter(from, "max-postcopy-bandwidth", 0);
+    migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
=20
     migrate_postcopy_complete(from, to);
 }
@@ -877,9 +878,9 @@ static void test_precopy_unix(void)
      * machine, so also set the downtime.
      */
     /* 1 ms should make it not converge*/
-    migrate_set_parameter(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "downtime-limit", 1);
     /* 1GB/s */
-    migrate_set_parameter(from, "max-bandwidth", 1000000000);
+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
=20
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
@@ -889,7 +890,7 @@ static void test_precopy_unix(void)
     wait_for_migration_pass(from);
=20
     /* 300 ms should converge */
-    migrate_set_parameter(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", 300);
=20
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -956,11 +957,11 @@ static void test_xbzrle(const char *uri)
      * machine, so also set the downtime.
      */
     /* 1 ms should make it not converge*/
-    migrate_set_parameter(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "downtime-limit", 1);
     /* 1GB/s */
-    migrate_set_parameter(from, "max-bandwidth", 1000000000);
+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
=20
-    migrate_set_parameter(from, "xbzrle-cache-size", 33554432);
+    migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
=20
     migrate_set_capability(from, "xbzrle", "true");
     migrate_set_capability(to, "xbzrle", "true");
@@ -972,7 +973,7 @@ static void test_xbzrle(const char *uri)
     wait_for_migration_pass(from);
=20
     /* 300ms should converge */
-    migrate_set_parameter(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", 300);
=20
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -1008,9 +1009,9 @@ static void test_precopy_tcp(void)
      * machine, so also set the downtime.
      */
     /* 1 ms should make it not converge*/
-    migrate_set_parameter(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "downtime-limit", 1);
     /* 1GB/s */
-    migrate_set_parameter(from, "max-bandwidth", 1000000000);
+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
=20
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
@@ -1022,7 +1023,7 @@ static void test_precopy_tcp(void)
     wait_for_migration_pass(from);
=20
     /* 300ms should converge */
-    migrate_set_parameter(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", 300);
=20
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -1054,9 +1055,9 @@ static void test_migrate_fd_proto(void)
      * machine, so also set the downtime.
      */
     /* 1 ms should make it not converge */
-    migrate_set_parameter(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "downtime-limit", 1);
     /* 1GB/s */
-    migrate_set_parameter(from, "max-bandwidth", 1000000000);
+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
=20
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
@@ -1090,7 +1091,7 @@ static void test_migrate_fd_proto(void)
     wait_for_migration_pass(from);
=20
     /* 300ms should converge */
-    migrate_set_parameter(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", 300);
=20
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
--=20
2.21.0


