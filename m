Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2422C814
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 16:34:25 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyymG-0007LM-F1
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyykY-0004xr-Ng
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 10:32:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51599
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyykX-0004ai-5D
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 10:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595601156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=/b9YPiB6paCpA84mJ1cIQX/SSu1ij7B0jsnuIgn+YjM=;
 b=a5hhbo9kHfZWVuPoUKaYwb6cocIKapCva5TRi+yqfM4fZ0/7Bt6VHd2NrXuDyQ/EVkONjX
 2Od48TCVJwq1fYtlCL2BiEqW3lgfuVg5eEuJ9zSe6Ty0VYdY+vKBgSEJeZ20PGOdBA5L9y
 4jZtFNgLSbFLozkKjOP27F0wamBFa+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-qxi4sc9TMjmm1jAanF81vw-1; Fri, 24 Jul 2020 10:32:33 -0400
X-MC-Unique: qxi4sc9TMjmm1jAanF81vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B55AE102C7EC;
 Fri, 24 Jul 2020 14:32:31 +0000 (UTC)
Received: from thuth.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A34D02DE79;
 Fri, 24 Jul 2020 14:32:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/3] cirrus.yml: Update the macOS jobs to Catalina
Date: Fri, 24 Jul 2020 16:32:20 +0200
Message-Id: <20200724143220.32751-4-thuth@redhat.com>
In-Reply-To: <20200724143220.32751-1-thuth@redhat.com>
References: <20200724143220.32751-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 08:23:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When looking at the CI jobs on cirrus-ci.com, it seems like the mojave-based
images have been decomissioned a while ago already, since apparently all our
jobs get automatically upgraded to catalina. So let's update our YML script
accordingly to avoid confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index bb25c1723b..b11aac53cb 100644
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
@@ -32,7 +32,7 @@ macos_task:
 macos_xcode_task:
   osx_instance:
     # this is an alias for the latest Xcode
-    image: mojave-xcode
+    image: catalina-xcode
   install_script:
     - brew install pkg-config gnu-sed glib pixman make sdl2 bash
   script:
-- 
2.18.1


