Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1681F94BF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 12:41:20 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkmYJ-00072v-VD
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 06:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jkmTy-0000uR-Os
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:36:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45533
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jkmTw-0007SI-TS
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592217408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDPcbbQN9/45I+316wizP19u8fb11YOlZCffXtV4MRg=;
 b=I1T3rv+x34sOJwFGe+fjhuxj6olKjoMBfVLFFi4S1DCzgxSb0zxHXZhj5hPR1Y7ca8O8KO
 GpLn8NUB87wmgTcTEOrKbo5+6DNEo7vMeJA55GtjqQF3/jv5Gg8AwnU9tkA2bKvNNrpejT
 UYFJSuBDv+GvKLtHn8Tvp22PYZzJQ2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-0c7d3AguP-e9_NppyrpyMg-1; Mon, 15 Jun 2020 06:36:46 -0400
X-MC-Unique: 0c7d3AguP-e9_NppyrpyMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A0A1009441
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 10:36:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90A3D5D9CC;
 Mon, 15 Jun 2020 10:36:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] crypto: Remove use of GCRYPT_VERSION macro.
Date: Mon, 15 Jun 2020 11:36:33 +0100
Message-Id: <20200615103633.300208-6-berrange@redhat.com>
In-Reply-To: <20200615103633.300208-1-berrange@redhat.com>
References: <20200615103633.300208-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:17:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Richard W.M. Jones" <rjones@redhat.com>

According to the gcrypt documentation it's intended that
gcry_check_version() is called with the minimum version of gcrypt
needed by the program, not the version from the <gcrypt.h> header file
that happened to be installed when qemu was compiled.  Indeed the
gcrypt.h header says that you shouldn't use the GCRYPT_VERSION macro.

This causes the following failure:

  qemu-img: Unable to initialize gcrypt

if a slightly older version of libgcrypt is installed with a newer
qemu, even though the slightly older version works fine.  This can
happen with RPM packaging which uses symbol versioning to determine
automatically which libgcrypt is required by qemu, which caused the
following bug in RHEL 8:

  https://bugzilla.redhat.com/show_bug.cgi?id=1840485

qemu actually requires libgcrypt >= 1.5.0, so we might put the string
"1.5.0" here.  However since 1.5.0 was released in 2011, it hardly
seems we need to check that.  So I replaced GCRYPT_VERSION with NULL.
Perhaps in future if we move to requiring a newer version of gcrypt we
could put a literal string here.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/init.c b/crypto/init.c
index b305381ec5..ea233b9192 100644
--- a/crypto/init.c
+++ b/crypto/init.c
@@ -122,7 +122,7 @@ int qcrypto_init(Error **errp)
 #endif
 
 #ifdef CONFIG_GCRYPT
-    if (!gcry_check_version(GCRYPT_VERSION)) {
+    if (!gcry_check_version(NULL)) {
         error_setg(errp, "Unable to initialize gcrypt");
         return -1;
     }
-- 
2.26.2


