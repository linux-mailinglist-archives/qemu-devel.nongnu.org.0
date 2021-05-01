Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57857370933
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:38:30 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyFp-0005dn-EC
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEB-00044c-Vd
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyE8-00083o-UA
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IiCOJYLYQjCXUKgsA8xTlklm89DU2HbkMO26QsLfhq8=;
 b=bXe4VE7YRN3m0+HN/7g6qUjW98HThnm51crd0yGtxPEdXI/HxMSG+MxdyyiZTz3N+H/A02
 Vacm2IyMqa0lqOuOGGqwgkIadVNGE3HoKeU0k+V3qX1w927P0EqOqqGFYAUlbvcm8taCah
 8Ddrm4pVj6At7BzRYDUsN3VxzStgbrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-8trs_c9uNhy20hqdcMmhBg-1; Sat, 01 May 2021 18:36:42 -0400
X-MC-Unique: 8trs_c9uNhy20hqdcMmhBg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso1293137wrf.7
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IStbyYiATShK5G0B53V5n+qRhn2ARGKs2JBKHFd0JhE=;
 b=kxATglJuRQcqqDFDpjo9wFKtR/eirhW421/xNXwr+nFodGpdCCBtSJqB3dmgM7zoG5
 z5MgXC77+RLtFiApJYHElw8kVfqRfwgE4xh1x/T8hJhku/tISFHbjk89e16Bqhdq5D8z
 4HIzXbZtDkpTaemadnprANpZaSCqzFzdR5Lld4YkfONuJ1OCfg9QxH9PWGfDZtt6uLRZ
 WRRo7GvHXEJjRgpMrtYZdUQNGDlUH+kGkCDMGTSV5D/O7dkFLpQbpnX03IED1MyefJfC
 QYL03VpZ5rkKZrVotJUSkg9ps+LNDv+PVocuaUCuokK22PF8NOuYZOl/716e4+J+iXGZ
 Gf/g==
X-Gm-Message-State: AOAM530vZlXGJul7R/Kvy4jTNvs6pgtC7BrYRS6aONuZGphkHfH07j5K
 CN2HeUg81KPkFoTFlCNsjtBzHqE4ONxUA2Nen3z9w5luCUtkRsr7XFk7Fp85eCcLOJi1nTAKvGc
 n8okmS0JOeTBxACyY8zY4nlIEqAS1EklnMUN7wIxYdLtjwppgXw4MLb6NoIVMfM8S
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr15445251wrr.305.1619908601211; 
 Sat, 01 May 2021 15:36:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ2tppgeB9IgVtXrPzOsX/xDQ1TmynnQkR4mE1Pyx+2Bla+12snuTcQgJrj4j76CfHfGnzGg==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr15445220wrr.305.1619908600952; 
 Sat, 01 May 2021 15:36:40 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q19sm17176530wmc.44.2021.05.01.15.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:36:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
Date: Sun,  2 May 2021 00:36:28 +0200
Message-Id: <20210501223638.510712-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Since v5:=0D
- Removed patch 10 (Markus, patch justification not clear)=0D
  'qtest/qmp-cmd-test: Make test build-independent from accelerator'=0D
- Removed patch 12 (Alex, icount / record/replay issue)=0D
  'tests/meson: Only build softfloat objects if TCG is selected (again)'=0D
- Sorted @Accelerator QAPI enum (Eric)=0D
- Added R-b/T-b=0D
=0D
Since v4:=0D
- Added Markus review comments=0D
- Added R-b/A-b tags=0D
=0D
Since v3:=0D
- Addressed Markus & Drew review comments=0D
- Added qtest/migration-test patch=0D
=0D
Since v2:=0D
- Addressed Eric & Paolo review comments=0D
=0D
Since v1:=0D
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
Philippe Mathieu-Daud=C3=A9 (10):=0D
  MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM=0D
  qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM=0D
  qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64=0D
  qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              | 47 ++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/arm-cpu-features.c | 55 ++++++-------------=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 tests/qtest/migration-test.c   |  4 +-=0D
 MAINTAINERS                    |  1 +=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 10 files changed, 207 insertions(+), 90 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


