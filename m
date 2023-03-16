Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A06BCB9D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckJn-0001NJ-DN; Thu, 16 Mar 2023 05:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pckJl-0001Mi-Lv
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pckJk-0008RI-3p
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678960479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Swr5WHkORpeJSZbDDSifkS4cDhXWlO9xIpprpsBE6Pw=;
 b=I+L9sCvWFGsWmnizaKVsWAhnmcTlQZa78H1DqPVofe+ZrW/6ydUqV6nsbcZei/vHWzSOfR
 QU9rXfoQtOoD1/LJOisa6WlMLnlukjO/J1lWfh0qLG55uLn8HBxes65lJtmS15OtWKtjnT
 Xa7LekNFlAK5h4pQlieqyeHttw36n2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-8uDvrXcWMd6hZbuw84t-SQ-1; Thu, 16 Mar 2023 05:54:37 -0400
X-MC-Unique: 8uDvrXcWMd6hZbuw84t-SQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E572858F09;
 Thu, 16 Mar 2023 09:54:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E53B240C6E67;
 Thu, 16 Mar 2023 09:54:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 73C621801EBC; Thu, 16 Mar 2023 10:54:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 4/6] edk2: update submodule to edk2-stable202302
Date: Thu, 16 Mar 2023 10:54:30 +0100
Message-Id: <20230316095432.1514080-5-kraxel@redhat.com>
In-Reply-To: <20230316095432.1514080-1-kraxel@redhat.com>
References: <20230316095432.1514080-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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


