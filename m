Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56294373BDF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:01:25 +0200 (CEST)
Received: from localhost ([::1]:59036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leH9Y-0002fL-3U
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6b-00010b-1Z
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6T-0003p7-KH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qjKcmd9wbHPYUkB1wRXTw3XMupiRynwSYp3NJnGx4Zo=;
 b=Me87TauDUBGNQJbiY2a8PjG4ExTTM7zsC54dpPiSkzOcvJM/BDTc1gYeXnum4ubi1JKxQw
 MdPTdAauAx90imaEbBZ/o2O26yPgOgFvSOwZac1VyRTMBSfiv4nnI+5pX8LhIJJlBTm4av
 LhhqUINouM50wlGHLqP6/dOD4xGzUqY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-U-jeJjsjMca2vWeMyUf0rg-1; Wed, 05 May 2021 08:58:10 -0400
X-MC-Unique: U-jeJjsjMca2vWeMyUf0rg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u126-20020a1c60840000b029013f6df1cd5bso552403wmb.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eamodQ7C+6L0ZlM2FjxWCF/C3+wmfS+rP0aRIkDaijQ=;
 b=ExC/S/ScH39sL8fohdgm6HX37N99IcGrcKZFqxta9uZHKfnvvpfEe3cGdvHSBHb53N
 5Jhqbbe6bDP06iqP+MsN1icrrS+2QUXwRJp4j9V70ufipUs6RXfWNaNyR2KLvpOaoquy
 gK6gvOxrl78XJMHYXtp4iOmAVMUXBuqGieX1eQXa7sQdGYIUvU5D58crXzhuCZbdcM6X
 n6qdsg7LA2GaM2cPmO+72BoDLJx+OZwHpdhzPKicxBZCp99V3ylCfDrWfGXj87hNhgxX
 sXNC0OCa3+HDx5DrUHe08UQEeW/vN+l5MEZVh5dWpqWuP0zBetQg3mWoP1a+u6jDyJaQ
 14HQ==
X-Gm-Message-State: AOAM530LL+9HpJNV9RPuKgVYmauYbjpB81LBDFGe6jl13DiW9arbDxcY
 9qHpP+UWE8vIX8wfNFOX+JP0zUtQp83+B4ZDr5AoOdea8MLXX3hFlq7dCAbaret2iqvDZv9o5Y5
 zSNZPy9wc/ycdlVNUJgpgluaHDMAKiMjIVGF2IE7WYeLOkFQRnCOdHL2fTf5wX4J+
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr32436714wma.54.1620219488603; 
 Wed, 05 May 2021 05:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB663WfRyqUoacEEtbjWk8S/2HRouGIIGnOKkpr3526EsdDM+xcMd8mJXSkTN4Ii25rlsERA==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr32436690wma.54.1620219488358; 
 Wed, 05 May 2021 05:58:08 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id a15sm23757618wrx.9.2021.05.05.05.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/12] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
Date: Wed,  5 May 2021 14:57:54 +0200
Message-Id: <20210505125806.1263441-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series fully reviewed.=0D
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
Since v6:=0D
- Fixed a typo (Eric)=0D
- Added R-b tags=0D
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


