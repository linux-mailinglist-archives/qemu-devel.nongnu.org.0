Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674906FEA6A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:57:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOS-0007fv-T6; Wed, 10 May 2023 23:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxON-0007eR-Dy
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOK-0005MR-2j
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZh+LAhar6nPtIoSNQcHKHxsNMn6RRk7C+8pl2eXI/E=;
 b=XOM2MzrGzbbBiMqoWTROsQZgzcQnjmW27KlVDdCel1IKYpLKrxIlfUtWYh8pON5we0Bzjg
 RqZ03QxadcLlIhwnHRHo2OlAydRY1plM4evm5Qejzo/CSJdQ6k9xRq+wRXFCaq6SME/sWY
 X7OD7yQJgbqBMkap3tz4PR6LtsHB4GM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-UgLf4YWXNBSBzsV7BH7E5g-1; Wed, 10 May 2023 23:54:52 -0400
X-MC-Unique: UgLf4YWXNBSBzsV7BH7E5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AABEB81D9EC;
 Thu, 11 May 2023 03:54:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11C240C2076;
 Thu, 11 May 2023 03:54:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 18/27] qemu.git: drop meson git submodule
Date: Wed, 10 May 2023 23:54:26 -0400
Message-Id: <20230511035435.734312-19-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that meson is installed from a vendored wheel, we don't need the git
submodule anymore. Drop it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitmodules | 3 ---
 meson       | 1 -
 2 files changed, 4 deletions(-)
 delete mode 160000 meson

diff --git a/.gitmodules b/.gitmodules
index 6ce5bf49c5..2a3a12033c 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -49,9 +49,6 @@
 [submodule "roms/qboot"]
 	path = roms/qboot
 	url = https://gitlab.com/qemu-project/qboot.git
-[submodule "meson"]
-	path = meson
-	url = https://gitlab.com/qemu-project/meson.git
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
diff --git a/meson b/meson
deleted file mode 160000
index 3a9b285a55..0000000000
--- a/meson
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
-- 
2.40.0


