Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D91B793C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 17:16:57 +0200 (CEST)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS04W-0007DZ-IU
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 11:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jS01f-0005W9-UK
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 11:14:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jS01f-0003De-El
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 11:13:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53087
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jS01f-000380-1b
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 11:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TYmNuSOn4IDoELOcOBARb8fVRorxxX2PkhsGkPDGRZA=;
 b=XhzOLkHwz1aXmtmDspTE3WRUjBDyMBP3LBOHLVfk29D1TaSTx3BovUmFKOxOD91You9tQu
 7H0s9zIeeBxe4ZPnOWL3MYhBhTRac6/sVzAN/U8/JmJsqg1VJ897lik+DXEVlrGOE6HmLT
 iQu9Zn4PZ4MRzQ4+cKiJ0Rh5+acDs08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-wwlMvF8tNb60uCveNaYckA-1; Fri, 24 Apr 2020 11:13:54 -0400
X-MC-Unique: wwlMvF8tNb60uCveNaYckA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2FFB18B644B;
 Fri, 24 Apr 2020 15:13:51 +0000 (UTC)
Received: from catbus.gsslab.fab.redhat.com (mustard.gsslab.fab.redhat.com
 [10.33.8.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65DAC5D76D;
 Fri, 24 Apr 2020 15:13:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] travis: explicitly include gnutls to ensure it is updated
Date: Fri, 24 Apr 2020 16:08:27 +0100
Message-Id: <20200424150827.3453162-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:11:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Travis includes gnutls in the default package set, but it is
an outdated version linkng to an incompatible libffi version.
The 'update: true' stanza causes the brew toolchain to be
updated but not the installed formula. It is possible to
run 'brew upgrade' to update installed formula, but this is
very slow adding more than 5 minutes to the build time.
Listing the gnutls package explicitly causes it to be updated
without extending the build time.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---

Note in testing this I got past the libffi.6.dylib error, but
eventually hit the Travis 50 minute timeout. So we need to
do more to minimize what we build on macOS, splitting the job
into two I guess.

 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 2fd63eceaa..afbb070082 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -287,6 +287,7 @@ jobs:
             - pixman
             - gnu-sed
             - python
+            - gnutls
           update: true
       before_script:
         - brew link --overwrite python
--=20
2.24.1


