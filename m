Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B892594FA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 17:45:22 +0200 (CEST)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD8TJ-0006Wc-4P
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 11:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD85p-0004ux-9X
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:21:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54172
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD85n-0006fk-KZ
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598973663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWa5r75nzfu7Drt1Kz0Py3AuyX82j4YBffnwWzasHI0=;
 b=eg8qrJu2yOmWdYbJPEfCj6vPtSggd9Qn+sleGXHChgfdnd8jQPDUB5zMr0v/Y1ipV0k9Nq
 BSRG+mINeAmSVJcJloU5Bl7YR1fjjUrsHOGrW7Kuq0hDXe5rALe9NJSOQ+hSiL4MzSnXNn
 6PnMYcMAXCP6gG1TM/W+jiBEH3j9+B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-bMLwn7zvPdWlvvDMoC4S-Q-1; Tue, 01 Sep 2020 11:21:00 -0400
X-MC-Unique: bMLwn7zvPdWlvvDMoC4S-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990DD10ABDAA;
 Tue,  1 Sep 2020 15:20:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-188.ams2.redhat.com [10.36.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C9FF5D9CC;
 Tue,  1 Sep 2020 15:20:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/8] cirrus.yml: Compile macOS with -Werror
Date: Tue,  1 Sep 2020 17:20:45 +0200
Message-Id: <20200901152050.255165-4-thuth@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiler warnings currently go unnoticed in our macOS builds, since -Werror
is only enabled for Linux and MinGW builds by default. So let's enable them
here now, too.
Unfortunately, the sasl header is marked as deprecated in the macOS headers
and thus generates a lot of deprecation warnings. Thus we have to also use
-Wno-error=deprecated-declarations to be able to compile the code here.

Message-Id: <20200728074405.13118-4-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index b50da72eec..86a059c12f 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -24,7 +24,9 @@ macos_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --python=/usr/local/bin/python3 || { cat config.log; exit 1; }
+    - ../configure --python=/usr/local/bin/python3 --enable-werror
+                   --extra-cflags='-Wno-error=deprecated-declarations'
+                   || { cat config.log; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake check
 
@@ -37,6 +39,7 @@ macos_xcode_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --cc=clang || { cat config.log; exit 1; }
+    - ../configure --extra-cflags='-Wno-error=deprecated-declarations'
+                   --enable-werror --cc=clang || { cat config.log; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake check
-- 
2.18.2


