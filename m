Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9E48046C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 20:43:12 +0100 (CET)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1vtn-0005IW-Oz
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 14:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1vib-0003Kh-H9
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1viZ-0005A9-QG
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640633495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBYUK7VxZy9M2kaoqYbflC51sHliXuuRV4MPHXaCvsY=;
 b=FYRkUxOTJuJadjETQL5gFEiF0WnRvRazQaU9hIMb3lzVqmtDZ7jfCmfBZUc3U5VWWygbaf
 Aejr/GiorP91pgsz2c9xcdMK7UpuVK7VVepAe+NrpBW6T2zmKoj17OwuG92kOkwrb1AkaD
 0pwGcsKhPszOn/BVRG40w9aYzaaXSC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-ccir3uLSPA2n2t7FHVDlzg-1; Mon, 27 Dec 2021 14:31:33 -0500
X-MC-Unique: ccir3uLSPA2n2t7FHVDlzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E25102CC43;
 Mon, 27 Dec 2021 19:31:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A3B60BF4;
 Mon, 27 Dec 2021 19:31:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests: acpi: SLIC: update expected blobs
Date: Mon, 27 Dec 2021 14:31:20 -0500
Message-Id: <20211227193120.1084176-5-imammedo@redhat.com>
In-Reply-To: <20211227193120.1084176-1-imammedo@redhat.com>
References: <20211227193120.1084176-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: dlenski@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SLIC.slic               | Bin 0 -> 36 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 49dbf8fa3e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/FACP.slic",
-"tests/data/acpi/q35/SLIC.slic",
diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index f6a864cc863c7763f6c09d3814ad184a658fa0a0..891fd4b784b7b6b3ea303976db7ecd5b669bc84b 100644
GIT binary patch
delta 28
jcmeyu_=Qo#&CxmF3j+fKvygL;W3Y#Uud9N>M3Dyoc<=}c

delta 28
jcmeyu_=Qo#&CxmF3j+fK^G+v!XOCb7r-%UOi6RdGgN+Fa

diff --git a/tests/data/acpi/q35/SLIC.slic b/tests/data/acpi/q35/SLIC.slic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fd26592e2480c5d02a018e0d855a04106661a7b5 100644
GIT binary patch
literal 36
mcmWIc@pM*UU|?YMbPjS1_E7M31#*C(gN1>iFg3Rn#0CI%)&>Cp

literal 0
HcmV?d00001

-- 
2.31.1


