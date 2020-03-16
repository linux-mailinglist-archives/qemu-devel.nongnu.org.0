Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E2187530
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 22:56:07 +0100 (CET)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDxiQ-0002DM-42
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 17:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jDxI4-0004C4-B9
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jDxI3-0006dG-22
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:28:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:20689)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jDxI1-0006b7-Ji
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584394128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anav/LjQ1m13mmdq5/IzM5jXbq6Z9U2/QX5HlDThZP4=;
 b=Mhh3XlKOCgiWugm95B5W4aUbSuyzuGgGF/NrFJ4wKd/7/2fdytUDh4HIyiOUNfdrfzoZkP
 LOKHGc71Tr2djBEJOKMNkGY0e64DrNGFiYOoBXS8+JTYmTwP1TnJa/T4enTU6i8VNbY9Bw
 Bah1y7oh9LBHRzmmJxm7LWraPhz2Wzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-uyVd_ruZOaCWH-kuWwQLVA-1; Mon, 16 Mar 2020 17:28:47 -0400
X-MC-Unique: uyVd_ruZOaCWH-kuWwQLVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C2498017DF
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 21:28:46 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A94519C4F;
 Mon, 16 Mar 2020 21:28:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/61] scripts/cocci: Rename memory-region-{init-ram ->
 housekeeping}
Date: Mon, 16 Mar 2020 22:27:06 +0100
Message-Id: <1584394048-44994-40-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1584394048-44994-1-git-send-email-pbonzini@redhat.com>
References: <1584394048-44994-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

As we are going to add various semantic changes related to the memory
region API, rename this script to be more generic.
Add a 'usage' header, and an entry in MAINTAINERS to avoid checkpatch
warning.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                                                 |  1 +
 ...gion-init-ram.cocci =3D> memory-region-housekeeping.cocci} | 13 +++++++=
++++++
 2 files changed, 14 insertions(+)
 rename scripts/coccinelle/{memory-region-init-ram.cocci =3D> memory-region=
-housekeeping.cocci} (84%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a88bc28..770126f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2047,6 +2047,7 @@ F: include/exec/ramblock.h
 F: memory.c
 F: include/exec/memory-internal.h
 F: exec.c
+F: scripts/coccinelle/memory-region-housekeeping.cocci
=20
 SPICE
 M: Gerd Hoffmann <kraxel@redhat.com>
diff --git a/scripts/coccinelle/memory-region-init-ram.cocci b/scripts/cocc=
inelle/memory-region-housekeeping.cocci
similarity index 84%
rename from scripts/coccinelle/memory-region-init-ram.cocci
rename to scripts/coccinelle/memory-region-housekeeping.cocci
index d290150..3699c10 100644
--- a/scripts/coccinelle/memory-region-init-ram.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -1,3 +1,16 @@
+/*
+  Usage:
+
+    spatch \
+        --macro-file scripts/cocci-macro-file.h \
+        --sp-file scripts/coccinelle/memory-region-housekeeping.cocci \
+        --keep-comments \
+        --in-place \
+        --dir .
+
+*/
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
--=20
1.8.3.1



