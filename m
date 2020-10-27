Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BC29ABFC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 13:23:21 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXO0W-0002xI-6Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 08:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kXNoF-0001Fw-LJ
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 08:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kXNo7-0005Cb-Lu
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 08:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603800630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v7Tztwcy9C/uhNeRXeKEoIoVkFjPzeVLnyZqaeuQAHs=;
 b=HU2Trpf1v+2Xqteauj7r2KWcZc5SzNfeTv8/B7G1CP2YoAqzZUZ0vt9lrMEXPB8DH20Rwo
 XE4Mz+RaYX0sG4vbsBM1QuK3vU5lCfgnGEa02S2kma+BijBW8CALObb7uZ0hPA5613PkDj
 9p03EaeI7yKvCQXNHt3/wZegHXBmgX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-Bfm3OZSlNCWpCvRa1gy6YA-1; Tue, 27 Oct 2020 08:10:28 -0400
X-MC-Unique: Bfm3OZSlNCWpCvRa1gy6YA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACEFD809DD5;
 Tue, 27 Oct 2020 12:10:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FD6D6EF50;
 Tue, 27 Oct 2020 12:10:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 06F72113865F; Tue, 27 Oct 2020 13:10:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel/qapi-code-gen: Fix up examples
Date: Tue, 27 Oct 2020 13:10:26 +0100
Message-Id: <20201027121026.3025930-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index c6438c6aa9..6906a06ad2 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -393,7 +393,7 @@ is identical on the wire to:
  { 'enum': 'Enum', 'data': ['one', 'two'] }
  { 'struct': 'Branch1', 'data': { 'data': 'str' } }
  { 'struct': 'Branch2', 'data': { 'data': 'int' } }
- { 'union': 'Flat': 'base': { 'type': 'Enum' }, 'discriminator': 'type',
+ { 'union': 'Flat', 'base': { 'type': 'Enum' }, 'discriminator': 'type',
    'data': { 'one': 'Branch1', 'two': 'Branch2' } }
 
 The optional 'if' member specifies a conditional.  See "Configuring
@@ -590,6 +590,8 @@ When in doubt, do not implement OOB execution support.
 Member 'allow-preconfig' declares whether the command is available
 before the machine is built.  It defaults to false.  For example:
 
+ { 'enum': 'QMPCapability',
+   'data': [ 'oob' ] }
  { 'command': 'qmp_capabilities',
    'data': { '*enable': [ 'QMPCapability' ] },
    'allow-preconfig': true }
@@ -824,7 +826,7 @@ Example: a struct with conditional feature 'allow-negative-numbers'
 { 'struct': 'TestType',
   'data': { 'number': 'int' },
   'features': [ { 'name': 'allow-negative-numbers',
-                  'if' 'defined(IFCOND)' } ] }
+                  'if': 'defined(IFCOND)' } ] }
 
 Please note that you are responsible to ensure that the C code will
 compile with an arbitrary combination of conditions, since the
-- 
2.26.2


