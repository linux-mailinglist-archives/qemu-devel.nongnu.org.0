Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFE259647
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 18:01:03 +0200 (CEST)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD8iU-0005co-7p
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 12:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD866-0005ga-Vm
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:21:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45747
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD865-0006je-9R
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598973680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPtQeWytbjl1rsTUENn1hvUpy54W+h30e9o+Yrx427o=;
 b=dZ2Ekkvs2AaWT7a36qVMSWJ9aziichI5oGxZVJZrLOkSZ3/e1gnlp6EfUhwpy0rFEAVPxG
 m/ITRu8W7Y3TOefb1A1YAmg8ElqwzbqdHEdAutqlDYn0AePeROz9RSfJkH554Q4m5OpM/j
 WRLkMfVHhyzlU4R40EBIHV4Fan0SYpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-diZC5YhrPhClLyTcSINCYQ-1; Tue, 01 Sep 2020 11:21:02 -0400
X-MC-Unique: diZC5YhrPhClLyTcSINCYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41274107B270;
 Tue,  1 Sep 2020 15:21:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-188.ams2.redhat.com [10.36.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 044A25D9CC;
 Tue,  1 Sep 2020 15:20:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/8] cirrus.yml: Update the macOS jobs to Catalina
Date: Tue,  1 Sep 2020 17:20:46 +0200
Message-Id: <20200901152050.255165-5-thuth@redhat.com>
In-Reply-To: <20200901152050.255165-1-thuth@redhat.com>
References: <20200901152050.255165-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:16:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When looking at the CI jobs on cirrus-ci.com, it seems like the mojave-based
images have been decomissioned a while ago already, since apparently all our
jobs get automatically upgraded to catalina. So let's update our YML script
accordingly to avoid confusion.

Reviewed-by: Ed Maste <emaste@freebsd.org>
Message-Id: <20200728074405.13118-5-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 86a059c12f..0742aaf8a3 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -18,7 +18,7 @@ freebsd_12_task:
 
 macos_task:
   osx_instance:
-    image: mojave-base
+    image: catalina-base
   install_script:
     - brew install pkg-config python gnu-sed glib pixman make sdl2 bash
   script:
@@ -33,7 +33,7 @@ macos_task:
 macos_xcode_task:
   osx_instance:
     # this is an alias for the latest Xcode
-    image: mojave-xcode
+    image: catalina-xcode
   install_script:
     - brew install pkg-config gnu-sed glib pixman make sdl2 bash
   script:
-- 
2.18.2


