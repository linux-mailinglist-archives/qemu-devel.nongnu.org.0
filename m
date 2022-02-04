Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B977E4AA306
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:19:54 +0100 (CET)
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6vp-0000I0-A2
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG6uF-0007Ol-Ug
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:18:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG6uD-0005oe-6u
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644013092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLUiNj+CKEHTlnOqoeYJ0ag2smi1TFlFDzJwEYhdpE8=;
 b=biVfBYQUV5LjcqTX/87XCb9zXJ1oOMY875GKAeNnwbo1LHLECYJgmGF4DOXb7TlHxkJQyU
 PfvdwKqU7FfVyDnJ25gAZOKAxYdY3utKKq/iNmU+8VsFVscsrEd03465uhiH0/hG6358r2
 /NVai4jMHSyh5InEw9NDB/04f4ckKSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-yhtBBV3RO-Gf_rYiD2lYLQ-1; Fri, 04 Feb 2022 17:18:09 -0500
X-MC-Unique: yhtBBV3RO-Gf_rYiD2lYLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C9CD1091DA0;
 Fri,  4 Feb 2022 22:18:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACFF25E484;
 Fri,  4 Feb 2022 22:18:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Revert "python: pin setuptools below v60.0.0"
Date: Fri,  4 Feb 2022 17:18:04 -0500
Message-Id: <20220204221804.2047468-3-jsnow@redhat.com>
In-Reply-To: <20220204221804.2047468-1-jsnow@redhat.com>
References: <20220204221804.2047468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 1e4d8b31be35e54b6429fea54f5ecaa0083f91e7.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile  | 2 --
 python/setup.cfg | 1 -
 2 files changed, 3 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 949c472624..3334311362 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -68,8 +68,6 @@ $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
 		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
 		. $(QEMU_VENV_DIR)/bin/activate;		\
 		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
-		pip install --disable-pip-version-check		\
-			"setuptools<60.0.0" 1>/dev/null;	\
 		make develop 1>/dev/null;			\
 	)
 	@touch $(QEMU_VENV_DIR)
diff --git a/python/setup.cfg b/python/setup.cfg
index 3fb18f845d..168a79c867 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -163,7 +163,6 @@ deps =
     .[devel]
     .[fuse]  # Workaround to trigger tox venv rebuild
     .[tui]   # Workaround to trigger tox venv rebuild
-    setuptools < 60  # Workaround, please see commit msg.
 commands =
     make check
 
-- 
2.34.1


