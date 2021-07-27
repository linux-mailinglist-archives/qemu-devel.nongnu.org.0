Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A93D7AE6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:27:08 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Pv8-0000At-LX
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8PuA-0007lf-IS
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8Pu4-0004ft-Qv
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627403159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S2Crpu+MaWtG09w3UX9BtSBoQFQqwqdlXukffUEqwnw=;
 b=SshjCtrbKG3WBpZTd46H7Zmg3u0d/wgOKBkwpN3DNvueR0OrMVTpgBFpVDkcJUE60bislw
 DbtXQLY6thzsPGlxi8qcxhqgsSCOR9LhPCTm9K6jy6eweNolmDAaMTZTxe8K4lo7EzWPty
 nlXrsIyqbDLNfVq3TPv4u+FGlaeYmQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-oH2k8MksPVKosVkMw_7aqg-1; Tue, 27 Jul 2021 12:25:58 -0400
X-MC-Unique: oH2k8MksPVKosVkMw_7aqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1699210509E1;
 Tue, 27 Jul 2021 16:25:50 +0000 (UTC)
Received: from thuth.com (ovpn-113-58.ams2.redhat.com [10.36.113.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B7415D9DD;
 Tue, 27 Jul 2021 16:25:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitlab-ci.d/buildtest: Disable iotests 197 and 215
Date: Tue, 27 Jul 2021 18:25:42 +0200
Message-Id: <20210727162542.318882-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iotests 197 and 215 are occasionally failing in the gitlab-CI now.
According to the log, the failure is "./common.rc: Killed" which might
be an indication that the process has been killed due to out-of-memory
reasons. Both tests are doing a big read with 2G that likely causes
this issue. It used to work fine in the gitlab-CI in the past, but
either the program is now requiring more free memory, or the the CI
containers have changed, so that the OOM condition now sometimes occurs.

Anyway, these two tests are not really suitable for CI containers if
they are doing things like huge reads (which is likely also the reason
why they haven't been added to the "auto" group in the past), so let's
simply disable them in the gitlab-CI now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ee0c83b600..63f1903f07 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -305,10 +305,10 @@ build-tcg-disabled:
     - cd tests/qemu-iotests/
     - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
-            170 171 183 184 192 194 197 208 215 221 222 226 227 236 253 277
+            170 171 183 184 192 194 208 221 222 226 227 236 253 277
     - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
-            124 132 139 142 144 145 151 152 155 157 165 194 196 197 200 202
-            208 209 215 216 218 222 227 234 246 247 248 250 254 255 257 258
+            124 132 139 142 144 145 151 152 155 157 165 194 196 200 202
+            208 209 216 218 222 227 234 246 247 248 250 254 255 257 258
             260 261 262 263 264 270 272 273 277 279
 
 build-user:
-- 
2.27.0


