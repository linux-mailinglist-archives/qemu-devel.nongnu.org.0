Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F221839DE47
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:02:35 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFpq-0003RJ-JK
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqFmL-0001R2-Ix
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:58:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqFmJ-0004SQ-8X
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623074334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSx2jtQjUJeTxuXeBdmCGIP7i5svwoMufs43KL7oqsA=;
 b=O2AtKAgvBKEbSWhPcbZoiVQ1JbwOXCD2m037pg+WIPbBZKGtgBWdeaZDpG+/cVcYE9+zwV
 ErqjsB0uaA5SDfrFTTwrc0g5WDfnMZ3sqMHiU+9rPOtzpD1IHHf0mG3mnHtDtM6E7t50Jr
 TX3AS+gU2dw7VZwY3OG6Gu30LEK2gaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-Md_NwRtCOISJxk-YmPxZvg-1; Mon, 07 Jun 2021 09:58:53 -0400
X-MC-Unique: Md_NwRtCOISJxk-YmPxZvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811E8102CB6F;
 Mon,  7 Jun 2021 13:58:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-203.ams2.redhat.com
 [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81EFF19C66;
 Mon,  7 Jun 2021 13:58:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] docs: add a table showing x86-64 ABI compatibility
 levels
Date: Mon,  7 Jun 2021 14:58:40 +0100
Message-Id: <20210607135843.196595-2-berrange@redhat.com>
In-Reply-To: <20210607135843.196595-1-berrange@redhat.com>
References: <20210607135843.196595-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is useful to know which CPUs satisfy each x86-64 ABI
compatibility level, when dealing with guest OS that require
something newer than the baseline ABI.

These ABI levels are defined in:

  https://gitlab.com/x86-psABIs/x86-64-ABI/

and supported by GCC, Clang, glibc and more.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS                        |  2 +-
 docs/system/cpu-models-x86-abi.csv | 67 ++++++++++++++++++++++++++++++
 docs/system/cpu-models-x86.rst.inc | 22 ++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/cpu-models-x86-abi.csv

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..56888121ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -328,7 +328,7 @@ F: tests/tcg/i386/
 F: tests/tcg/x86_64/
 F: hw/i386/
 F: disas/i386.c
-F: docs/system/cpu-models-x86.rst.inc
+F: docs/system/cpu-models-x86*
 T: git https://gitlab.com/ehabkost/qemu.git x86-next
 
 Xtensa TCG CPUs
diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
new file mode 100644
index 0000000000..f3f3b60be1
--- /dev/null
+++ b/docs/system/cpu-models-x86-abi.csv
@@ -0,0 +1,67 @@
+Model,baseline,v2,v3,v4
+486-v1,,,,
+Broadwell-v1,✅,✅,✅,
+Broadwell-v2,✅,✅,✅,
+Broadwell-v3,✅,✅,✅,
+Broadwell-v4,✅,✅,✅,
+Cascadelake-Server-v1,✅,✅,✅,✅
+Cascadelake-Server-v2,✅,✅,✅,✅
+Cascadelake-Server-v3,✅,✅,✅,✅
+Cascadelake-Server-v4,✅,✅,✅,✅
+Conroe-v1,✅,,,
+Cooperlake-v1,✅,✅,✅,✅
+Denverton-v1,✅,✅,,
+Denverton-v2,✅,✅,,
+Dhyana-v1,✅,✅,✅,
+EPYC-Milan-v1,✅,✅,✅,
+EPYC-Rome-v1,✅,✅,✅,
+EPYC-Rome-v2,✅,✅,✅,
+EPYC-v1,✅,✅,✅,
+EPYC-v2,✅,✅,✅,
+EPYC-v3,✅,✅,✅,
+Haswell-v1,✅,✅,✅,
+Haswell-v2,✅,✅,✅,
+Haswell-v3,✅,✅,✅,
+Haswell-v4,✅,✅,✅,
+Icelake-Client-v1,✅,✅,✅,
+Icelake-Client-v2,✅,✅,✅,
+Icelake-Server-v1,✅,✅,✅,✅
+Icelake-Server-v2,✅,✅,✅,✅
+Icelake-Server-v3,✅,✅,✅,✅
+Icelake-Server-v4,✅,✅,✅,✅
+IvyBridge-v1,✅,✅,,
+IvyBridge-v2,✅,✅,,
+KnightsMill-v1,✅,✅,✅,
+Nehalem-v1,✅,✅,,
+Nehalem-v2,✅,✅,,
+Opteron_G1-v1,✅,,,
+Opteron_G2-v1,✅,,,
+Opteron_G3-v1,✅,,,
+Opteron_G4-v1,✅,✅,,
+Opteron_G5-v1,✅,✅,,
+Penryn-v1,✅,,,
+SandyBridge-v1,✅,✅,,
+SandyBridge-v2,✅,✅,,
+Skylake-Client-v1,✅,✅,✅,
+Skylake-Client-v2,✅,✅,✅,
+Skylake-Client-v3,✅,✅,✅,
+Skylake-Server-v1,✅,✅,✅,✅
+Skylake-Server-v2,✅,✅,✅,✅
+Skylake-Server-v3,✅,✅,✅,✅
+Skylake-Server-v4,✅,✅,✅,✅
+Snowridge-v1,✅,✅,,
+Snowridge-v2,✅,✅,,
+Westmere-v1,✅,✅,,
+Westmere-v2,✅,✅,,
+athlon-v1,,,,
+core2duo-v1,✅,,,
+coreduo-v1,,,,
+kvm32-v1,,,,
+kvm64-v1,✅,,,
+n270-v1,,,,
+pentium-v1,,,,
+pentium2-v1,,,,
+pentium3-v1,,,,
+phenom-v1,✅,,,
+qemu32-v1,,,,
+qemu64-v1,✅,,,
diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 867c8216b5..f40ee03ecc 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -39,6 +39,28 @@ CPU, as they would with "Host passthrough", but gives much of the
 benefit of passthrough, while making live migration safe.
 
 
+ABI compatibility levels for CPU models
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The x86_64 architecture has a number of `ABI compatibility levels`_
+defined. Traditionally most operating systems and toolchains would
+only target the original baseline ABI. It is expected that in
+future OS and toolchains are likely to target newer ABIs. The
+table that follows illustrates which ABI compatibility levels
+can be satisfied by the QEMU CPU models. Note that the table only
+lists the long term stable CPU model versions (eg Haswell-v4).
+In addition to whats listed, there are also many CPU model
+aliases which resolve to a different CPU model version,
+depending on the machine type is in use.
+
+.. _ABI compatibility levels: https://gitlab.com/x86-psABIs/x86-64-ABI/
+
+.. csv-table:: x86-64 ABI compatibility levels
+   :file: cpu-models-x86-abi.csv
+   :widths: 40,15,15,15,15
+   :header-rows: 2
+
+
 Preferred CPU models for Intel x86 hosts
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.31.1


