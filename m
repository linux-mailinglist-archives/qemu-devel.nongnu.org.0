Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0041E3DA7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 11:35:03 +0200 (CEST)
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdsSk-0006qD-BH
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 05:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1jdsS1-0006Qv-Rv
 for qemu-devel@nongnu.org; Wed, 27 May 2020 05:34:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46979
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1jdsS0-0002x8-PN
 for qemu-devel@nongnu.org; Wed, 27 May 2020 05:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590572054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=63qITC/tJoB5eHEQGa0oIJyr0nvomjx0A1xhaDX0wsE=;
 b=Posdlr8a9WDGHuCFw+qjh+2WLK4wr5/tDYDvp7DLx+xL4MBzcwLi8C/UlY9Giz0v8vWlvb
 tPTewPnFrGopriRq9/It0A/bIBFlZH+Mq/4QAM/itLJFx5ztGkMU75mLdUgm1rVSNAcbBL
 ROafvVJ+qkJ4Dws7HXmalehXcAqc8MQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-mcCeIyqOOr2aix2-doEsaw-1; Wed, 27 May 2020 05:34:12 -0400
X-MC-Unique: mcCeIyqOOr2aix2-doEsaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02807A0C09
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 09:34:12 +0000 (UTC)
Received: from foo.home.annexia.org (ovpn-112-79.ams2.redhat.com
 [10.36.112.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464E019D82;
 Wed, 27 May 2020 09:34:11 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] crypto: Remove use of GCRYPT_VERSION macro.
Date: Wed, 27 May 2020 10:34:09 +0100
Message-Id: <20200527093409.3588189-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=rjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


