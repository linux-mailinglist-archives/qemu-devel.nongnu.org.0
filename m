Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084AD187133
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:33:55 +0100 (CET)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtcg-0002S5-1q
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDsI3-0004nU-3X
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDsI0-0001GW-Mo
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:08:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDsI0-0001Ct-HI
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584374908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ssNU1W6JmcL4kU4cWyqsOdXjUb4r7kWMVEvWGvo+2k=;
 b=Z+jKRamDsUkdz9JxgzcPAcWioKB509NIPYn6vFLnJXDxS+LLazFrLT9JJSoHWoD7G/S5OW
 /HoDYJdYoVWT7a8lSEflPrBfab/4ULe5Q81hMlLIpRNRZk1slQyNjYM+JU4wPT2GCkWGfP
 rWedeo8738mN2rbDJ3xeiJdlZYGkza8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-Raf75YFQMQS1G56dk9AvEA-1; Mon, 16 Mar 2020 12:08:23 -0400
X-MC-Unique: Raf75YFQMQS1G56dk9AvEA-1
Received: by mail-wr1-f72.google.com with SMTP id b11so9234553wru.21
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N7+HmyV0D4vFSs4ZL/u4BopejDTWdgLZjfeVHLnQ9M4=;
 b=tA/1euOJkXSJZTSwNDwaSzIL1CpAg1Zqz3qcxQSQKM8H3pkqFNaHYGTGxnuaKGUiOh
 c7jG82eG6M2MZRX9Nkl1kofcX7nuAgTfxwG09bk5DxsOtPCERnGff2a7PRW/W1HaeSPe
 q1Ez2GybcKBp3lvrObmO0CzTnEg3JqL33s0bDSdmsBFqIefFsPPcQcsU5QfVwin5TUXl
 Y8Ptu2Dggs5aq5MIYxnBx2/Y3HWuQjmzxc859XFJxWFp5vdkOdLXLFe25betnxtc9SQ0
 5GxjTEgWR853n4fPPg+PEVpRFA8RNeL3Vn8nK8UJwCtjKsEveDxJ8EBa6ROa6StHnoCv
 W9DQ==
X-Gm-Message-State: ANhLgQ0KVS6aQjUGppRIduo5eS5wXs3C1XoMrRBDhJy4ixvQS9Q1ECMB
 8NqqZUAa8SY3NO4mvzR+xoO/pC84QnLAtejnJDkJFqMapcCaXZ1tvyyjdoByJCgZfp6j59o5Wrp
 3PFWCJogoJ8KtCDA=
X-Received: by 2002:a1c:984a:: with SMTP id a71mr29937830wme.185.1584374902202; 
 Mon, 16 Mar 2020 09:08:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vssyfrGmsyQfMixG6XPmVZD6SHgaog1D2LjTAVp2uFXc9h0dhfPsS644yu8c8+ZyHwycJ4JHQ==
X-Received: by 2002:a1c:984a:: with SMTP id a71mr29937801wme.185.1584374901937; 
 Mon, 16 Mar 2020 09:08:21 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id v10sm170121wml.44.2020.03.16.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 09:08:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] .travis.yml: Add a KVM-only Aarch64 job
Date: Mon, 16 Mar 2020 17:06:34 +0100
Message-Id: <20200316160634.3386-20-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job to build QEMU on Aarch64 with TCG disabled, so
this configuration won't bitrot over time.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Job ran for 13 min 1 sec
https://travis-ci.org/github/philmd/qemu/jobs/663122258
---
 .travis.yml | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index b92798ac3b..ea3c0df185 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -450,6 +450,38 @@ jobs:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS}"
=20
+    - name: "[aarch64] GCC check (KVM)"
+      arch: arm64
+      dist: xenial
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
+      env:
+        - CONFIG=3D"--disable-containers --disable-tcg --enable-kvm --enab=
le-fdt --disable-tools"
+        - TEST_CMD=3D"make check-unit"
+      script:
+        # Only select the 'virt' machine.
+        - echo CONFIG_ARM_VIRT=3Dy > ${SRC_DIR}/default-configs/aarch64-so=
ftmmu.mak
+        - make -j3 && travis_retry ${TEST_CMD}
+
     - name: "[ppc64] GCC check-tcg"
       arch: ppc64le
       dist: xenial
--=20
2.21.1


