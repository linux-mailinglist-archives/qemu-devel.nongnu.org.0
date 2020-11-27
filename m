Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9212C6324
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:34:28 +0100 (CET)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kib59-0006Ft-HJ
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kib4D-0005Ga-BI
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:33:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kib4A-00041V-Uu
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606473205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NYrQJzRgwyZ/44toWMbPbz4FTF80CODphrB5OYV+7pY=;
 b=TQuuFacNdXfGDVmfZ9vY+AoAhSY0UUrLPw0tbsdDca15+uuvbkfdn99OjBBdJRUir8nl5v
 fnQQ32Kmii59USbiQHgueBNUkocNBQwmi2GlahkEU5nlL+fyXa0HwYjTh4teM+Xq1aLs0F
 IvDNtogtPKuQFq65sBa5KOe5tWZ0WKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-7T5qFTK7NrGpI2m_zLc85A-1; Fri, 27 Nov 2020 05:33:23 -0500
X-MC-Unique: 7T5qFTK7NrGpI2m_zLc85A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564E310082E2
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:33:22 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA905D6D1;
 Fri, 27 Nov 2020 10:33:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu PATCH] docs: fix missing backslash in certtool shell example
Date: Fri, 27 Nov 2020 10:33:14 +0000
Message-Id: <20201127103314.1782200-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/tls.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/tls.rst b/docs/system/tls.rst
index dc2b94257f..b0973afe1b 100644
--- a/docs/system/tls.rst
+++ b/docs/system/tls.rst
@@ -64,7 +64,7 @@ interactive prompts from certtool::
    cert_signing_key
    EOF
    # certtool --generate-self-signed \
-              --load-privkey ca-key.pem
+              --load-privkey ca-key.pem \
               --template ca.info \
               --outfile ca-cert.pem
 
-- 
2.28.0


