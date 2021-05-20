Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0EC38B8AC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 23:02:45 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljpoa-0007FD-B1
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 17:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljpkK-0005F3-OU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:58:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljpkH-0007uz-ET
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621544296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taNOnZ4D7p0XpRKn4QtLPQv0UqeiicP/YMEmlzAlaro=;
 b=PngL6fk1RWhkOXafW4blihis6W14v61hE2zZBFBEh6I0x0naj9IxVZZPGqHGn432Ys66Ol
 fLWRCQdNYZsIraEsUHzP2SiZjPeXmJB86Ns+N1mDlCfBmWoSY4HS51fheIAO2aS3Mm48oJ
 SIPEsGjnd3wGMo9vFJ5vjvnCavhQBqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-N7x0E2UWMBitXQnuGPDkQA-1; Thu, 20 May 2021 16:58:15 -0400
X-MC-Unique: N7x0E2UWMBitXQnuGPDkQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAD17189C440;
 Thu, 20 May 2021 20:58:13 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-113-104.rdu2.redhat.com
 [10.10.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3407361F38;
 Thu, 20 May 2021 20:58:11 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] acceptance tests: bump Avocado version to 88.1
Date: Thu, 20 May 2021 17:58:04 -0300
Message-Id: <20210520205804.211730-2-willianr@redhat.com>
In-Reply-To: <20210520205804.211730-1-willianr@redhat.com>
References: <20210520205804.211730-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Besides some internal changes, new features, and bug fixes, on the QEMU side,
this version fixes the following message seen when running the acceptance
tests: "Error running method "pre_tests" of plugin "fetchasset": 'bytes'
object has no attribute 'encode'".

The release notes are available at
https://avocado-framework.readthedocs.io/en/latest/releases/88_0.html.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/requirements.txt b/tests/requirements.txt
index 91f3a343b9..a21b59b443 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,5 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-avocado-framework==85.0
+avocado-framework==88.1
 pycdlib==1.11.0
-- 
2.31.1


