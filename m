Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4836B62D60F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:11:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovaue-0007ZX-Oo; Thu, 17 Nov 2022 04:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovaub-0007Yj-9k
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovauZ-0001sx-Jt
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668676218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s45didmNilOfTrQ6J5w/1jbTG7vsy/SxjtdR09Uk+oE=;
 b=YjIo74Ezqn6nwXnWJdiWvm7ko1LSSYkva0LITnbcNMahUpLnnVAbGLq+/OfbrUrR2AOpqL
 skaSKn+MSkDx/gDt4/tHmE93tLaOsihhCA4VMqbKuB+f7RvYfSQ4tbcKc3bqk7F8qdbhBy
 bJ9zwkAd0+kdz6KrPpo0D8UyI0zgr2k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-FcH2ZZzOOzSszhqXcltsVg-1; Thu, 17 Nov 2022 04:10:17 -0500
X-MC-Unique: FcH2ZZzOOzSszhqXcltsVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4F3C3802B81
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:10:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F27A22027064;
 Thu, 17 Nov 2022 09:10:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 4/4] acpi/tests/avocado/bits: some misc fixes
Date: Thu, 17 Nov 2022 10:10:06 +0100
Message-Id: <20221117091006.525072-5-thuth@redhat.com>
In-Reply-To: <20221117091006.525072-1-thuth@redhat.com>
References: <20221117091006.525072-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Ani Sinha <ani@anisinha.ca>

Most of the changes are trivial. The bits test timeout has now been increased
to 200 seconds in order to accommodate slower systems and fewer unnecessary
failures. Removed of the reference to non-existent README file in docs. Some
minor corrections in the doc file.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221117053644.516649-1-ani@anisinha.ca>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/acpi-bits.rst   | 12 ++++--------
 tests/avocado/acpi-bits.py |  3 +++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 5e22be8ef6..4a94c7d83d 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -16,11 +16,8 @@ end user. The other is that we have more control of what we wanted to test
 and how by directly using acpica interpreter on top of the bios on a running
 system. More details on the inspiration for developing biosbits and its real
 life uses can be found in [#a]_ and [#b]_.
-This directory contains tests written in python using avocado framework that
-exercises the QEMU bios components using biosbits and reports test failures.
 For QEMU, we maintain a fork of bios bits in gitlab along with all the
-dependent submodules:
-https://gitlab.com/qemu-project/biosbits-bits
+dependent submodules here: https://gitlab.com/qemu-project/biosbits-bits
 This fork contains numerous fixes, a newer acpica and changes specific to
 running this avocado QEMU tests using bits. The author of this document
 is the sole maintainer of the QEMU fork of bios bits repo.
@@ -38,10 +35,9 @@ Under ``tests/avocado/`` as the root we have:
    │ ├── bits-config
    │ │ └── bits-cfg.txt
    │ ├── bits-tests
-   │ │ ├── smbios.py2
-   │ │ ├── testacpi.py2
-   │ │ └── testcpuid.py2
-   │ └── README
+   │   ├── smbios.py2
+   │   ├── testacpi.py2
+   │   └── testcpuid.py2
    ├── acpi-bits.py
 
 * ``tests/avocado``:
diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..9ac87f01f1 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -134,6 +134,9 @@ class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
     :avocado: tags=acpi
 
     """
+    # in slower systems the test can take as long as 3 minutes to complete.
+    timeout = 200
+
     def __init__(self, *args, **kwargs):
         super().__init__(*args, **kwargs)
         self._vm = None
-- 
2.31.1


