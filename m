Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC631E0F55
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 15:22:08 +0200 (CEST)
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdD3P-0000Hg-W7
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdD0R-0003wT-7y
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:19:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24172
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdD0Q-0004Ch-FY
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590412741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=pSLb/wrsLgNYNOwhYa9iPvOM+g5PW8m7Ej1xtThJBAM=;
 b=Ek9R/4vtS8lmsp4w1lpsoaOMXE28Kq8DQsqsueog3qT2Ea6ML4U30r9loquK2RUIHmU3nO
 3rd4ipBt/OyPexXz4f5fNS+Cn4a7r6+//EPSmyWaX+blXVbbHJD6yqZ1cXghX53oVnLlal
 u2FBz74sSMayPyAy7AKDKiuyFuNlbME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-wK-OhMFJMZG-Od9fPJrkAg-1; Mon, 25 May 2020 09:18:59 -0400
X-MC-Unique: wK-OhMFJMZG-Od9fPJrkAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3A94107ACCA;
 Mon, 25 May 2020 13:18:58 +0000 (UTC)
Received: from thuth.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EC1F5C1BB;
 Mon, 25 May 2020 13:18:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] gitlab-ci: Move edk2 and opensbi YAML files to
 .gitlab-ci.d folder
Date: Mon, 25 May 2020 15:18:20 +0200
Message-Id: <20200525131823.715-5-thuth@redhat.com>
In-Reply-To: <20200525131823.715-1-thuth@redhat.com>
References: <20200525131823.715-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a dedicated folder for the gitlab-ci - so there is no need
to clutter the top directory with these .yml files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci-edk2.yml => .gitlab-ci.d/edk2.yml       | 0
 .gitlab-ci-opensbi.yml => .gitlab-ci.d/opensbi.yml | 0
 .gitlab-ci.yml                                     | 4 ++--
 MAINTAINERS                                        | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename .gitlab-ci-edk2.yml => .gitlab-ci.d/edk2.yml (100%)
 rename .gitlab-ci-opensbi.yml => .gitlab-ci.d/opensbi.yml (100%)

diff --git a/.gitlab-ci-edk2.yml b/.gitlab-ci.d/edk2.yml
similarity index 100%
rename from .gitlab-ci-edk2.yml
rename to .gitlab-ci.d/edk2.yml
diff --git a/.gitlab-ci-opensbi.yml b/.gitlab-ci.d/opensbi.yml
similarity index 100%
rename from .gitlab-ci-opensbi.yml
rename to .gitlab-ci.d/opensbi.yml
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bc6aee6aba..5208d93ff8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,6 +1,6 @@
 include:
-  - local: '/.gitlab-ci-edk2.yml'
-  - local: '/.gitlab-ci-opensbi.yml'
+  - local: '/.gitlab-ci.d/edk2.yml'
+  - local: '/.gitlab-ci.d/opensbi.yml'
 
 .update_apt_template: &before_script_apt
  before_script:
diff --git a/MAINTAINERS b/MAINTAINERS
index bde5fd480f..d43c98115c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2534,7 +2534,7 @@ F: roms/edk2
 F: roms/edk2-*
 F: tests/data/uefi-boot-images/
 F: tests/uefi-test-tools/
-F: .gitlab-ci-edk2.yml
+F: .gitlab-ci.d/edk2.yml
 F: .gitlab-ci.d/edk2/
 
 Usermode Emulation
-- 
2.18.1


