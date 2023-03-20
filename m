Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1BC6C0D8A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peByq-0001Vu-Sf; Mon, 20 Mar 2023 05:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1peByk-0001T4-WA
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1peByh-0003RI-Oy
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679305134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSk7n/+ElKUe46P2+AAO3hfuMYYfWKAF4Hxfq/5hlxI=;
 b=XrNFg4qVL5fDJeK1DgmEJg6Vt/rhBbeHW9T9EDrPsz86GyZIGEN1RFa1QWLGBnoP2fWvvd
 uI9/CPuN0pAJ2DyD68Jw/kiFGOd94LIwxBK52JyPY6nGE9mG19JK4nHWHjJxfrxur8ZvvK
 1KuNXQoCFReUcCkbE6WYz0kTvk8dEC0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-lbR3u6iIM_-0YkFeFUbsSA-1; Mon, 20 Mar 2023 05:38:53 -0400
X-MC-Unique: lbR3u6iIM_-0YkFeFUbsSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A50631C05EAD;
 Mon, 20 Mar 2023 09:38:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6920040C83AC;
 Mon, 20 Mar 2023 09:38:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1A5A18000B3; Mon, 20 Mar 2023 10:38:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 4/6] edk2: update submodule to edk2-stable202302
Date: Mon, 20 Mar 2023 10:38:45 +0100
Message-Id: <20230320093847.539751-5-kraxel@redhat.com>
In-Reply-To: <20230320093847.539751-1-kraxel@redhat.com>
References: <20230320093847.539751-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 pc-bios/README | 4 ++--
 roms/edk2      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/pc-bios/README b/pc-bios/README
index 3702ed485c63..c555dd324ea1 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -50,8 +50,8 @@
   variable store templates built from the TianoCore community's EFI Development
   Kit II project
   <https://github.com/tianocore/tianocore.github.io/wiki/EDK-II>. The images
-  were built at git tag "edk2-stable202008". The firmware binaries bundle parts
-  of the OpenSSL project, at git tag "OpenSSL_1_1_1g" (the OpenSSL tag is a
+  were built at git tag "edk2-stable202302". The firmware binaries bundle parts
+  of the OpenSSL project, at git tag "OpenSSL_1_1_1s" (the OpenSSL tag is a
   function of the edk2 tag). Parts of the Berkeley SoftFloat library are
   bundled as well, at Release 3e plus a subsequent typo fix (commit
   b64af41c3276f97f0e181920400ee056b9c88037), as an OpenSSL dependency on 32-bit
diff --git a/roms/edk2 b/roms/edk2
index b24306f15daa..f80f052277c8 160000
--- a/roms/edk2
+++ b/roms/edk2
@@ -1 +1 @@
-Subproject commit b24306f15daa2ff8510b06702114724b33895d3c
+Subproject commit f80f052277c88a67c55e107b550f504eeea947d3
-- 
2.39.2


