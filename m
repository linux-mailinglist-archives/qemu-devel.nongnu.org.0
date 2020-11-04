Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCD2A6B61
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 18:06:15 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaMEf-0000U6-U7
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 12:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaMCv-0007xA-FV
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaMCs-0005C0-8U
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604509459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Cxd91RwKxFeW1IWUYtV6auFeQbF5WYTx64whXlfWQGI=;
 b=QGJnuFaVplpfxL2vz4aHBEl08um+wNmkY2viZe7JyI0Mj3EeoKv/J+Ea1TWc6eplxTDkBW
 yUTylQkwdkHnq7K1GFSzbhzZLWDTI3CYTOCOSj+ideWzQynuVN/WyWCSds1JjFeiqTAwUS
 o5Tgsla5cM4sh+iwgvuegaYS9rUIWig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-N1zv1TLlPYeFUbzZ9M_Slg-1; Wed, 04 Nov 2020 12:04:16 -0500
X-MC-Unique: N1zv1TLlPYeFUbzZ9M_Slg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C725E9EC6
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 17:04:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19BE15C5DE
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 17:04:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/20] Misc patches for QEMU 5.2-rc1
Date: Wed,  4 Nov 2020 12:04:13 -0500
Message-Id: <20201104170414.546578-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 83851c7c60c90e9fb6a23ff48076387a77bc33cd:

  Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-10-27-v3-tag' into staging (2020-11-03 12:47:58 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 372bcb2585cd2f06a01f13b1a208370ccf7479cf:

  qapi, qemu-options: make all parsing visitors parse boolean options the same (2020-11-04 12:00:40 -0500)

----------------------------------------------------------------
Doc and bug fixes

----------------------------------------------------------------
v1->v2: adjust error message

AlexChen (1):
      tests/qtest: Fix potential NULL pointer dereference in qos_build_main_args()

Alexander Bulekov (5):
      scripts/oss-fuzz: rename bin/qemu-fuzz-i386
      qtest: add a reproducer for LP#1878642
      fuzz: fix writing DMA patterns
      fuzz: check the MR in the DMA callback
      fuzz: fuzz offsets within pio/mmio regions

Bruce Rogers (1):
      configure: fix gio_libs reference

Marc Hartmayer (1):
      meson: vhost-user-gpu/virtiofsd: use absolute path

Paolo Bonzini (8):
      cutils: replace strdup with g_strdup
      docs: expand sourceset documentation
      meson: use b_staticpic=false for meson >=0.56.0
      meson: fix warning for bad sphinx-build
      semihosting: fix order of initialization functions
      ivshmem-test: do not use short-form boolean option
      qtest: escape device name in device-introspect-test
      qapi, qemu-options: make all parsing visitors parse boolean options the same

Peter Maydell (2):
      tests/qtest/libqtest.c: Check for setsockopt() failure
      tests/qtest/libqos/ahci.c: Avoid NULL dereference in ahci_exec()

Philippe Mathieu-Daudé (2):
      exec: Remove dead code (CID 1432876)
      hw/isa/lpc_ich9: Ignore reserved/invalid SCI IRQ

 configure                            |   8 +-
 contrib/vhost-user-gpu/meson.build   |   2 +-
 docs/devel/build-system.rst          | 158 +++++++++++++++++++++++------------
 docs/devel/kconfig.rst               |   2 +
 docs/meson.build                     |   3 +-
 hw/isa/lpc_ich9.c                    |  14 +++-
 include/hw/i386/ich9.h               |   1 +
 include/qapi/util.h                  |   2 +
 include/qemu/cutils.h                |   1 +
 meson.build                          |   4 +-
 qapi/opts-visitor.c                  |  14 +---
 qapi/qapi-util.c                     |  23 +++++
 qapi/qobject-input-visitor.c         |   6 +-
 qapi/string-input-visitor.c          |  17 +---
 scripts/oss-fuzz/build.sh            |   4 +-
 softmmu/physmem.c                    |  10 +--
 softmmu/vl.c                         |   4 +-
 tests/qtest/device-introspect-test.c |  10 ++-
 tests/qtest/fuzz-test.c              |  15 ++++
 tests/qtest/fuzz/generic_fuzz.c      |  44 +++++-----
 tests/qtest/fuzz/qos_fuzz.c          |   3 +-
 tests/qtest/ivshmem-test.c           |   2 +-
 tests/qtest/libqos/ahci.c            |   5 +-
 tests/qtest/libqtest.c               |   9 +-
 tools/virtiofsd/meson.build          |   2 +-
 util/cutils.c                        |   2 +-
 util/qemu-option.c                   |  20 +----
 27 files changed, 227 insertions(+), 158 deletions(-)
-- 
2.26.2


