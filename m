Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0A442C02
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:00:56 +0100 (CET)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrXD-0007KZ-42
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhrV0-0005V3-0G
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhrUw-0006iO-HA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635850712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fr+QIaJD4b5Nrncrki0+tL8d0z2VE3qKT4h3HcW3Azw=;
 b=O/RJQdRkafEgNVbFvvDwL92HTzc67G59egt7B+A6OVpDQkypZKlNp5vMRV/it92hnoMapH
 jpIO0qhuRiwgGisO4Qb/z1yG1sTl9U/6tkfSiyHDZ6N/qgnLvW15bvCJ4O4/pZNFX5pla0
 2dj/ToDeyEzg53wuAT7lK5tEjIGEplk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-qPndTVaXOlqLWR8aMMq1Ew-1; Tue, 02 Nov 2021 06:58:28 -0400
X-MC-Unique: qPndTVaXOlqLWR8aMMq1Ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C0B180A5EC;
 Tue,  2 Nov 2021 10:58:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAF536784C;
 Tue,  2 Nov 2021 10:58:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] meson.build: Allow to disable OSS again
Date: Tue,  2 Nov 2021 11:58:22 +0100
Message-Id: <20211102105822.773131-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If sys/soundcard.h is available, it is currently not possible to
disable OSS with the --disable-oss or --without-default-features
configure switches. Improve the check in meson.build to fix this.

Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Only ever look for OSS if we also have system emulation enabled

 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 6dec5dd5cc..2848917602 100644
--- a/meson.build
+++ b/meson.build
@@ -915,7 +915,7 @@ if liblzfse.found() and not cc.links('''
 endif
 
 oss = not_found
-if not get_option('oss').auto() or have_system
+if have_system and not get_option('oss').disabled()
   if not cc.has_header('sys/soundcard.h')
     # not found
   elif targetos == 'netbsd'
-- 
2.27.0


