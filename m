Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A14C02D9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:08:30 +0100 (CET)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbSX-000200-83
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1e-0008Fy-5z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1c-00082K-1v
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645558839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDLpDgWFXIATN0OhWc55h0ZASnSriQOlym6oIVYm4Lw=;
 b=PlzPbUvgsWCqVLQw8W1D801n7Mq1KsYZVFKq99ewHYkpb8HpeJClyKS5RSBHZhbVbbpoRi
 9Aaz5m7u2Xy+GF/dLmJ1MkqkftiD8j8mxaEYaR2/yIlg2CL33szt2cwhIe5fLaIFwYgav1
 RYB2SXEgoSfbtWCpWvmJA6pQcKhtPpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-TwX-py8jNvqOeXP6moSHQQ-1; Tue, 22 Feb 2022 14:40:36 -0500
X-MC-Unique: TwX-py8jNvqOeXP6moSHQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E4301091DA0;
 Tue, 22 Feb 2022 19:40:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C72C75F4E1;
 Tue, 22 Feb 2022 19:40:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] qga/vss: update informative message about MinGW
Date: Tue, 22 Feb 2022 23:40:03 +0400
Message-Id: <20220222194008.610377-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220222194008.610377-1-marcandre.lureau@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The headers are now all available in MinGW master branch.
(commit 13390dbbf885f and earlier) aiming for 10.0.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index 54f2da5b0763..62472747f1bb 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,7 +15,7 @@ have_qga_vss = get_option('qga_vss') \
     If your Visual Studio installation doesn't have the VSS headers,
     Please download and install Microsoft VSS SDK:
     http://www.microsoft.com/en-us/download/details.aspx?id=23490
-    On POSIX-systems, MinGW doesn't yet provide working headers.
+    On POSIX-systems, MinGW should provide headers in >=10.0 releases.
     you can extract the SDK headers by:
     $ scripts/extract-vsssdk-headers setup.exe
     The headers are extracted in the directory 'inc/win2003'.
-- 
2.35.1.273.ge6ebfd0e8cbb


