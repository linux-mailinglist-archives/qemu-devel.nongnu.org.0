Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C44D5ABC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 06:46:05 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSY6G-0003Ia-9v
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 00:46:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSY08-0004TJ-Ip
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:39:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSY06-0003Hf-VQ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646977182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSZmM2iGII+Xld0Nqkvkbjpika5YLvW/dM92rDcwX60=;
 b=Ytw+hjCv0uOJ2jzuCy9pQoXQii7y7mNhu7iitn205pEIfvpmEHS5OCF2ni+kBoaT/pv+/t
 tYkECaL8An1J42ykQbbttfIE8vte5tSqB3DN1TOMDlEqw03ZzhvZ6AcZdARUfCTlMpMSel
 pMcVvNwi861RmA6wk6+bIUhpXAtrTro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-FaMKktTANYWW1c0q--N3dw-1; Fri, 11 Mar 2022 00:39:39 -0500
X-MC-Unique: FaMKktTANYWW1c0q--N3dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A567180A08F;
 Fri, 11 Mar 2022 05:39:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1C845DBA2;
 Fri, 11 Mar 2022 05:38:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 813371800636; Fri, 11 Mar 2022 06:37:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] edk2: .git can be a file
Date: Fri, 11 Mar 2022 06:37:52 +0100
Message-Id: <20220311053759.875785-5-kraxel@redhat.com>
In-Reply-To: <20220311053759.875785-1-kraxel@redhat.com>
References: <20220311053759.875785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/Makefile.edk2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index 3d75a842a4df..6801ea62e8f1 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -51,7 +51,7 @@ all: $(foreach flashdev,$(flashdevs),../pc-bios/edk2-$(flashdev).fd.bz2) \
 # we're building from a tarball and that they've already been fetched by
 # make-release/tarball scripts.
 submodules:
-	if test -d edk2/.git; then \
+	if test -e edk2/.git; then \
 		cd edk2 && git submodule update --init --force -- \
 			ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
 			BaseTools/Source/C/BrotliCompress/brotli \
-- 
2.35.1


