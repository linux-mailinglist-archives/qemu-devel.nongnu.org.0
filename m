Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C893DBACC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:40:12 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TgI-0008PM-N8
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m9Tek-0005ja-Sx
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m9Tej-0008IG-Be
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627655912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3x1XJT2jTfSHmtl8l2Z6pY3mZrbcTBSKmM+wPzqlI0=;
 b=EqCmxDrrPVPQZkaNVdem0JLz6k1kyUDeHx46F/uzYQUIbUS8lZIAV3cjsJZ5O5zozdin9i
 vd5XwoI/XlpT2oSPZ5AnaMTaBymD155C1WIuwd9ipkt9vwCu53KoZvH6DCOJ7zvPyQnbkt
 Z0uLpzRoob+3JYJcEYMhWgcCpH9Vzbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-aiw6pyFRPwWdF-vq4TnViQ-1; Fri, 30 Jul 2021 10:38:28 -0400
X-MC-Unique: aiw6pyFRPwWdF-vq4TnViQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEAB810066E6;
 Fri, 30 Jul 2021 14:38:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6513360C17;
 Fri, 30 Jul 2021 14:38:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] gitlab-ci: Remove superfluous "dnf install" statement
Date: Fri, 30 Jul 2021 16:38:08 +0200
Message-Id: <20210730143809.717079-3-thuth@redhat.com>
In-Reply-To: <20210730143809.717079-1-thuth@redhat.com>
References: <20210730143809.717079-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The container already features meson and ninja, so there is no need
to try to install it with dnf again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f390f98044..38f08452f1 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -590,8 +590,6 @@ build-libvhost-user:
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   needs:
     job: amd64-fedora-container
-  before_script:
-    - dnf install -y meson ninja-build
   script:
     - mkdir subprojects/libvhost-user/build
     - cd subprojects/libvhost-user/build
-- 
2.27.0


