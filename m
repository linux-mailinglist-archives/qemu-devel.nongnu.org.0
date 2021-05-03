Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C13372243
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:12:09 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfrL-0005iI-T7
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpn-000423-4o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpj-0006wF-G2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yBNvLap5splJAxV0QEUjCt3fls2sthGPdPVgUUJO1pI=;
 b=geZVtFEJTRzVD/QJ1Vcqe5LKN0qOUGOQS2Nokx8w5uFqGOWocx5RGg/Q82/umDEDvPKdO8
 b5InoMmjIXx0sOx6bZ6zSoeSTkhJdUn5pKQUUlwGvvJqRzp4KXTKn43NTXcNDcyi7rbMq9
 RqmQAUe56+cqGnISe+OQu8bVpe6N2w4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-eowZ9vZZNQycD99VmM5b8g-1; Mon, 03 May 2021 17:10:23 -0400
X-MC-Unique: eowZ9vZZNQycD99VmM5b8g-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so1703734wre.18
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FX/mz33ofqLMlnwi26yzrmbZkIwbTRnUOB1k7gHb+Yw=;
 b=g9nLYGvZ4h/2J3HKPGcqkx2pfeOKKcABa5umK1QVr3VGQN+2+QdlfTplsJ35UR7Cal
 CbD+O+7vNXYlBhwM391MPjWlTn8N4SPYadjV/VVV8feaV2IczXvWz895ub41x1qswplX
 gvVMMzp9LU/AK6O1KlTby7JDpPu9AXTprlPdqhdqthaWoMBJHb+iymnLNA8bxO1mlBnx
 BbxGb+qVq1jkmdAei7i49d3eTknDr+KAJGBb6m5KDulZlO23g3zzWpMqM9ABXLcd1X+a
 QHuxJQyUGs6IWKuP+MEEChgJzIO/LjnZ55lPrUM2HGQCOjTOhlfmdlmQJG+cqSAzGUXx
 eqdQ==
X-Gm-Message-State: AOAM53019i5QOqUI3SDyIIiQVXDY2PD+m5u3r+OUqUNikni/vWoLxwQt
 5FW7js1oQqAclaNxaV/zGUBxrZFxcnzvwr7d72mN3HcuWmIUTIT6dIveL+2za6EozQJHRz1gYG9
 Rd+NI6Z3V0Uxu2ry5viTekq1PSwyhG7dgcfHBqi5R20dy2TcmMp43QIgGd6xFcmoO
X-Received: by 2002:adf:ebcc:: with SMTP id v12mr27778596wrn.389.1620076222530; 
 Mon, 03 May 2021 14:10:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJHpv0fv5yxF+/62tk2AEBCRdhpgj6WG6pCUuIuqTfPLtMPRAASRFIqMMdF2aiTYAorDnpmg==
X-Received: by 2002:adf:ebcc:: with SMTP id v12mr27778568wrn.389.1620076222257; 
 Mon, 03 May 2021 14:10:22 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id k15sm13913892wro.87.2021.05.03.14.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/12] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
Date: Mon,  3 May 2021 23:10:08 +0200
Message-Id: <20210503211020.894589-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 10-12 (bios-tables-test)=0D
=0D
Hi,=0D
=0D
This series aims at having accelerator-independent qtests=0D
by querying a QEMU instance at runtime to check the list=0D
of built-in accelerators.=0D
=0D
First we add the 'query-accels' QMP command,=0D
then we add the qtest_has_accel() method to libqtest,=0D
finally we use this new method to allow running=0D
bios-tables-test on KVM-only builds.=0D
=0D
Since v5:=0D
- Rename bios-tables tests (Igor)=0D
- Do not restrict bios-tables tests to TCG (Igor)=0D
- Reset bios-tables-test R-b tags=0D
=0D
Since v4:=0D
- Removed patch 10 (Markus, patch justification not clear)=0D
  'qtest/qmp-cmd-test: Make test build-independent from accelerator'=0D
- Removed patch 12 (Alex, icount / record/replay issue)=0D
  'tests/meson: Only build softfloat objects if TCG is selected (again)'=0D
- Sorted @Accelerator QAPI enum (Eric)=0D
- Added R-b/T-b=0D
=0D
Since v3:=0D
- Added Markus review comments=0D
- Added R-b/A-b tags=0D
=0D
Since v2:=0D
- Addressed Markus & Drew review comments=0D
- Added qtest/migration-test patch=0D
=0D
Since v1:=0D
- Addressed Eric & Paolo review comments=0D
=0D
Since v0:=0D
- kept over-engineered union (I don't how to do simple enum)=0D
- dropped arm-cpu-features patches for now=0D
- fixed typos (Eric)=0D
- rename qtest_has_accel (Thomas)=0D
- probe accel with machine none previous qtest (Paolo)=0D
- iterate over QAPI enum (Markus)=0D
=0D
Eric's suggestion of conditional QAPI didn't worked out,=0D
as accelerator definitions are poisoned.=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section=0D
  accel: Introduce 'query-accels' QMP command=0D
  qtest: Add qtest_has_accel() method=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM=0D
  qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM=0D
  qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG=0D
  qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64=0D
  qtest/bios-tables-test: Rename tests not TCG specific=0D
  qtest/bios-tables-test: Rename TCG specific tests=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              |  47 ++++++++++=0D
 tests/qtest/libqos/libqtest.h  |   8 ++=0D
 accel/accel-qmp.c              |  49 +++++++++++=0D
 tests/qtest/arm-cpu-features.c |  55 ++++--------=0D
 tests/qtest/bios-tables-test.c | 156 ++++++++++++++++-----------------=0D
 tests/qtest/libqtest.c         |  29 ++++++=0D
 tests/qtest/migration-test.c   |   4 +-=0D
 MAINTAINERS                    |   1 +=0D
 accel/meson.build              |   2 +-=0D
 tests/qtest/meson.build        |   3 +-=0D
 10 files changed, 232 insertions(+), 122 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


