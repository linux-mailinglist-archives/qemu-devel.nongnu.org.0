Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37430AB98
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:39:28 +0100 (CET)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bIV-0000IM-HV
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFu-00068y-UQ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFq-0001wr-Bs
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dF+DNiXzOE5QV+MXlTEAPcImOxnJARCsewEVeGhWiIE=;
 b=jL+EH1QpzkogW7DN+JOPRwxCrJBSd0mZJi7WRvgG2yf/PB64C72DjBGw4si93Y0KnioPtt
 OBpvmmTfHCgKMNSGatNXxYeDfbseMzsSVyK31vui+sygt1OFztjj1Y9wSSvok9K2UACFki
 gRRolTXIEOcVbebLAfhMpctYRYZmm3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-mfD5Ihs-Psy6Cy2bGmP-Bw-1; Mon, 01 Feb 2021 10:36:36 -0500
X-MC-Unique: mfD5Ihs-Psy6Cy2bGmP-Bw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77088030AE;
 Mon,  1 Feb 2021 15:36:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BDAA5D6BA;
 Mon,  1 Feb 2021 15:36:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI compatibility
 levels
Date: Mon,  1 Feb 2021 15:36:03 +0000
Message-Id: <20210201153606.4158076-2-berrange@redhat.com>
In-Reply-To: <20210201153606.4158076-1-berrange@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Florian Weimer <fweimer@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
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

and supported by GCC, CLang, GLibC and more.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS                        |   2 +-
 docs/system/cpu-models-x86-abi.csv | 121 +++++++++++++++++++++++++++++
 docs/system/cpu-models-x86.rst.inc |  18 +++++
 3 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/cpu-models-x86-abi.csv

diff --git a/MAINTAINERS b/MAINTAINERS
index fbb228ef2b..bb8d60c458 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -344,7 +344,7 @@ F: tests/tcg/i386/
 F: tests/tcg/x86_64/
 F: hw/i386/
 F: disas/i386.c
-F: docs/system/cpu-models-x86.rst.inc
+F: docs/system/cpu-models-x86*
 T: git https://gitlab.com/ehabkost/qemu.git x86-next
 
 Xtensa TCG CPUs
diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
new file mode 100644
index 0000000000..4565e6a535
--- /dev/null
+++ b/docs/system/cpu-models-x86-abi.csv
@@ -0,0 +1,121 @@
+Model,baseline,v2,v3,v4
+486,,,,
+486-v1,,,,
+Broadwell,✅,✅,✅,
+Broadwell-IBRS,✅,✅,✅,
+Broadwell-noTSX,✅,✅,✅,
+Broadwell-noTSX-IBRS,✅,✅,✅,
+Broadwell-v1,✅,✅,✅,
+Broadwell-v2,✅,✅,✅,
+Broadwell-v3,✅,✅,✅,
+Broadwell-v4,✅,✅,✅,
+Cascadelake-Server,✅,✅,✅,✅
+Cascadelake-Server-noTSX,✅,✅,✅,✅
+Cascadelake-Server-v1,✅,✅,✅,✅
+Cascadelake-Server-v2,✅,✅,✅,✅
+Cascadelake-Server-v3,✅,✅,✅,✅
+Cascadelake-Server-v4,✅,✅,✅,✅
+Conroe,✅,,,
+Conroe-v1,✅,,,
+Cooperlake,✅,✅,✅,✅
+Cooperlake-v1,✅,✅,✅,✅
+Denverton,✅,✅,,
+Denverton-v1,✅,✅,,
+Denverton-v2,✅,✅,,
+Dhyana,✅,✅,✅,
+Dhyana-v1,✅,✅,✅,
+EPYC,✅,✅,✅,
+EPYC-IBPB,✅,✅,✅,
+EPYC-Rome,✅,✅,✅,
+EPYC-Rome-v1,✅,✅,✅,
+EPYC-v1,✅,✅,✅,
+EPYC-v2,✅,✅,✅,
+EPYC-v3,✅,✅,✅,
+Haswell,✅,✅,✅,
+Haswell-IBRS,✅,✅,✅,
+Haswell-noTSX,✅,✅,✅,
+Haswell-noTSX-IBRS,✅,✅,✅,
+Haswell-v1,✅,✅,✅,
+Haswell-v2,✅,✅,✅,
+Haswell-v3,✅,✅,✅,
+Haswell-v4,✅,✅,✅,
+Icelake-Client,✅,✅,✅,
+Icelake-Client-noTSX,✅,✅,✅,
+Icelake-Client-v1,✅,✅,✅,
+Icelake-Client-v2,✅,✅,✅,
+Icelake-Server,✅,✅,✅,✅
+Icelake-Server-noTSX,✅,✅,✅,✅
+Icelake-Server-v1,✅,✅,✅,✅
+Icelake-Server-v2,✅,✅,✅,✅
+Icelake-Server-v3,✅,✅,✅,✅
+Icelake-Server-v4,✅,✅,✅,✅
+IvyBridge,✅,✅,,
+IvyBridge-IBRS,✅,✅,,
+IvyBridge-v1,✅,✅,,
+IvyBridge-v2,✅,✅,,
+KnightsMill,✅,✅,✅,
+KnightsMill-v1,✅,✅,✅,
+Nehalem,✅,✅,,
+Nehalem-IBRS,✅,✅,,
+Nehalem-v1,✅,✅,,
+Nehalem-v2,✅,✅,,
+Opteron_G1,✅,,,
+Opteron_G1-v1,✅,,,
+Opteron_G2,✅,,,
+Opteron_G2-v1,✅,,,
+Opteron_G3,✅,,,
+Opteron_G3-v1,✅,,,
+Opteron_G4,✅,✅,,
+Opteron_G4-v1,✅,✅,,
+Opteron_G5,✅,✅,,
+Opteron_G5-v1,✅,✅,,
+Penryn,✅,,,
+Penryn-v1,✅,,,
+SandyBridge,✅,✅,,
+SandyBridge-IBRS,✅,✅,,
+SandyBridge-v1,✅,✅,,
+SandyBridge-v2,✅,✅,,
+Skylake-Client,✅,✅,✅,
+Skylake-Client-IBRS,✅,✅,✅,
+Skylake-Client-noTSX-IBRS,✅,✅,✅,
+Skylake-Client-v1,✅,✅,✅,
+Skylake-Client-v2,✅,✅,✅,
+Skylake-Client-v3,✅,✅,✅,
+Skylake-Server,✅,✅,✅,✅
+Skylake-Server-IBRS,✅,✅,✅,✅
+Skylake-Server-noTSX-IBRS,✅,✅,✅,✅
+Skylake-Server-v1,✅,✅,✅,✅
+Skylake-Server-v2,✅,✅,✅,✅
+Skylake-Server-v3,✅,✅,✅,✅
+Skylake-Server-v4,✅,✅,✅,✅
+Snowridge,✅,✅,,
+Snowridge-v1,✅,✅,,
+Snowridge-v2,✅,✅,,
+Westmere,✅,✅,,
+Westmere-IBRS,✅,✅,,
+Westmere-v1,✅,✅,,
+Westmere-v2,✅,✅,,
+athlon,,,,
+athlon-v1,,,,
+core2duo,✅,,,
+core2duo-v1,✅,,,
+coreduo,,,,
+coreduo-v1,,,,
+kvm32,,,,
+kvm32-v1,,,,
+kvm64,✅,,,
+kvm64-v1,✅,,,
+n270,,,,
+n270-v1,,,,
+pentium,,,,
+pentium-v1,,,,
+pentium2,,,,
+pentium2-v1,,,,
+pentium3,,,,
+pentium3-v1,,,,
+phenom,✅,,,
+phenom-v1,✅,,,
+qemu32,,,,
+qemu32-v1,,,,
+qemu64,✅,,,
+qemu64-v1,✅,,,
diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 9a2327828e..b964b29c78 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -39,6 +39,24 @@ CPU, as they would with "Host passthrough", but gives much of the
 benefit of passthrough, while making live migration safe.
 
 
+ABI compatibility levels for CPU models
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The x86_64 architecture has a number of `ABI compatibility levels`_
+defined. Traditionally most operating systems and toolchains would
+only target the original baseline ABI. It is expected that in
+future OS and toolchains are likely to target newer ABIs. The
+following table illustrates which ABI compatibility levels can be
+satisfied by the QEMU CPU models
+
+.. _ABI compatibility levels: https://gitlab.com/x86-psABIs/x86-64-ABI/
+
+.. csv-table:: x86-64 ABI compatibility levels
+   :file: cpu-models-x86-abi.csv
+   :widths: 40,15,15,15,15
+   :header-rows: 1
+
+
 Preferred CPU models for Intel x86 hosts
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.29.2


