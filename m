Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6673921B7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:59:39 +0200 (CEST)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0cs-0006eX-9m
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lm0Zo-0004ZM-7I
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lm0Zk-0003Mm-6P
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622062583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYPV4nXbxOKUTGTsgXcMDT9jI/5nTm51miBrcfIdLwE=;
 b=dhEEUnsLhIAjky3UUMyTS8v02MKJGfvjh4mKiDSmTxgmvSoTBxtsoFiYxPmUZO1g1FGEjE
 FQF0KLJbAmh3atOeJP+XzfghWfTGc2zTjNFjBOi6seVVpinrHQzApTmTfgdE7eseZUw3q8
 JZtjEz4j1vtBOCOPL3+rMkHn8vqMqwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-LZtF7jZHOfKYLqnQFeHVxA-1; Wed, 26 May 2021 16:56:14 -0400
X-MC-Unique: LZtF7jZHOfKYLqnQFeHVxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD35680ED8D
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 20:56:13 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-113-115.rdu2.redhat.com
 [10.10.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C7C15C3E9;
 Wed, 26 May 2021 20:56:10 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] tests/acceptance: change armbian archive to a faster host
Date: Wed, 26 May 2021 17:56:01 -0300
Message-Id: <20210526205601.263444-2-willianr@redhat.com>
In-Reply-To: <20210526205601.263444-1-willianr@redhat.com>
References: <20210526205601.263444-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current host for the image
Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
(archive.armbian.com) is extremely slow in the last couple of weeks,
making the job running the test
tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
for the first time when the image is not yet on GitLab cache, time out
while the image is being downloaded.

This changes the host to one faster, so new users with an empty cache
are not impacted.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 276a53f146..51c23b822c 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
         # As we expand it to 2 GiB we are safe.
 
-        image_url = ('https://archive.armbian.com/orangepipc/archive/'
+        image_url = ('https://armbian.systemonachip.net/'
+                     'archive/orangepipc/archive/'
                      'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
         image_hash = ('b4d6775f5673486329e45a0586bf06b6'
                       'dbe792199fd182ac6b9c7bb6c7d3e6dd')
-- 
2.31.1


