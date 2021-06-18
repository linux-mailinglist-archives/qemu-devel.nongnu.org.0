Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A53AD341
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:58:50 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKdd-0001vj-M4
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXt-0008JM-8O
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXq-0006ru-9w
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624045969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rmhyog/QQZz84S1b45iwfmtgelyk0jjrn1OiDEqnj8=;
 b=RliOPhJfKWrwAS45ToSoERz2vBhFKgTIPoyP0oqdBkoNhTlvd0CHm0J3AMXx4g+xhqvr49
 B69jAVas90Jc7gYdvzkgMKEAj8sXNNEZGVj4StFOGcRUS/thXqGv0U102kCM3DX8TxCgkm
 /pykZQbpgkFnenl3sLRzO/D1CrPd1h0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-lq-ihUJyN5y3mQuaQ7HeeQ-1; Fri, 18 Jun 2021 15:52:47 -0400
X-MC-Unique: lq-ihUJyN5y3mQuaQ7HeeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8359100C667;
 Fri, 18 Jun 2021 19:52:46 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 818FF60C17;
 Fri, 18 Jun 2021 19:52:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 6/7] docs: add a table showing x86-64 ABI compatibility levels
Date: Fri, 18 Jun 2021 15:52:36 -0400
Message-Id: <20210618195237.442548-7-ehabkost@redhat.com>
In-Reply-To: <20210618195237.442548-1-ehabkost@redhat.com>
References: <20210618195237.442548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

It is useful to know which CPUs satisfy each x86-64 ABI
compatibility level, when dealing with guest OS that require
something newer than the baseline ABI.

These ABI levels are defined in:

  https://gitlab.com/x86-psABIs/x86-64-ABI/

and supported by GCC, Clang, glibc and more.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210607135843.196595-2-berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 MAINTAINERS                        |  2 +-
 docs/system/cpu-models-x86-abi.csv | 67 ++++++++++++++++++++++++++++++
 docs/system/cpu-models-x86.rst.inc | 22 ++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/cpu-models-x86-abi.csv

diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f5365..ccdb81c9f62 100644
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
index 00000000000..f3f3b60be10
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
index 867c8216b5a..f40ee03ecc0 100644
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


