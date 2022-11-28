Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892F263A4E6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:27:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaPF-0004mn-JF; Mon, 28 Nov 2022 04:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozaPD-0004kz-5L
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozaPB-0004qd-Kx
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669627585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrZjYOWd4xLAYyQYnm6YKfCB4q5EqQ+BHDHNPQG5uco=;
 b=IiiYUrnGmcuLCeskdFU9aNnegvYURPRnFq6gLbqFOTn6ofNm4F3lP8bMRvCT/MpJj4lqS2
 axE3EwwWvkpizPgHuyrVNtuuv+va+TpsY8SgMAo51VhasiVZrxcFmjFrALTWB/OBeyNhds
 lxoHKhc9nJBDVuo7pOjk6qyyoKZSdW4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-gXxmtJdyMuOAQMbHPHA__Q-1; Mon, 28 Nov 2022 04:26:08 -0500
X-MC-Unique: gXxmtJdyMuOAQMbHPHA__Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E37A3C0D181;
 Mon, 28 Nov 2022 09:26:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB57249BB65;
 Mon, 28 Nov 2022 09:26:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 for-8.0 3/5] scripts/make-release: Remove CI yaml and more
 git files from the tarball
Date: Mon, 28 Nov 2022 10:25:53 +0100
Message-Id: <20221128092555.37102-4-thuth@redhat.com>
In-Reply-To: <20221128092555.37102-1-thuth@redhat.com>
References: <20221128092555.37102-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These files are of no use in a normal tarball and thus should not
be included here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/make-release | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/make-release b/scripts/make-release
index 44a9d86a04..febeb6cb36 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -41,6 +41,9 @@ git submodule update --init --single-branch
         BaseTools/Source/C/BrotliCompress/brotli \
         CryptoPkg/Library/OpensslLib/openssl \
         MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
+
+rm -v .*.yml
 popd
-tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
+
+tar --exclude=".git*" -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.31.1


