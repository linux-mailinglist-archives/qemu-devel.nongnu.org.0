Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4671718FF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 14:41:21 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7JPk-0004Tz-V3
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 08:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36935)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7JOu-0003Zz-Fn
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7JOt-00041a-ED
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:40:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30572
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7JOt-00041S-93
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582810826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F/ErkvSUG0ZH9xxLjDCD9rb0kmKejM6XBgI/FOO8G6I=;
 b=N40sULU6/09cjdyUCRLNWZjjghu1/9DkFZOwKonmYOS6ypRJM38uk3PBn9Gr6aNk9hUvKr
 LxSlIdvu2nds7oUqfML4IgzWxj4HfCqQNCEZckHz6nnJTGjguHCIIkBaNsQAXsTlr0rbi/
 nv1Sc+jbFT/7BE4aJKFjg76jw8xihJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-CfjCFJ38MkuWtB7OQbuw_Q-1; Thu, 27 Feb 2020 08:40:24 -0500
X-MC-Unique: CfjCFJ38MkuWtB7OQbuw_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E518E13F5;
 Thu, 27 Feb 2020 13:40:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E62EF19C58;
 Thu, 27 Feb 2020 13:40:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qapi/machine: Place the 'Notes' tag after the 'Since' tag
Date: Thu, 27 Feb 2020 14:40:19 +0100
Message-Id: <20200227134019.6218-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes when adding a 'Since' tag:

  In file included from qapi/qapi-schema.json:105:
  qapi/machine.json:25:1: '@arch:' can't follow 'Notes' section

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Fix another occurrence in CpuInstanceProperties (Liam Merwick)
---
 qapi/machine.json | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 6c11e3cf3a..3d8b5324f3 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -16,11 +16,11 @@
 # individual target constants are not documented here, for the time
 # being.
 #
+# Since: 3.0
+#
 # Notes: The resulting QMP strings can be appended to the "qemu-system-"
 #        prefix to produce the corresponding QEMU executable name. This
 #        is true even for "qemu-system-x86_64".
-#
-# Since: 3.0
 ##
 { 'enum' : 'SysEmuTarget',
   'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
@@ -820,13 +820,13 @@
 # @die-id: die number within node/board the CPU belongs to (Since 4.1)
 # @core-id: core number within die the CPU belongs to# @thread-id: thread =
number within core the CPU belongs to
 #
+# Since: 2.7
+#
 # Note: currently there are 5 properties that could be present
 #       but management should be prepared to pass through other
 #       properties with device_add command to allow for future
 #       interface extension. This also requires the filed names to be kept=
 in
 #       sync with the properties passed to -device/device_add.
-#
-# Since: 2.7
 ##
 { 'struct': 'CpuInstanceProperties',
   'data': { '*node-id': 'int',
--=20
2.21.1


