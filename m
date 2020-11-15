Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A372B39DE
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:29:24 +0100 (CET)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQWR-0001Wk-8v
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUT-0008Qp-11
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUQ-0001XT-3V
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=18Fc3V72Nt+I75V7UwGykm3r5Q46kep57s8eGL/Us2c=;
 b=cvS3QkTkduzAQJePOXbxvoaYD4pZXRXFLwQksviq5yjwFp6Cuo5ntojpYqVqZo1fyhaU33
 80LlVBtZJpPNa1IVzgjnxRKmeiKWxJXHtRPveT//J+oAmVOnrCPsoqvQaVDWfYeu3jw6DB
 ya//NvI0W4tbkLe+ZYEc3wrGF8wAAXk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-24cHN-FmOTaB-ocFkXcb6g-1; Sun, 15 Nov 2020 17:27:11 -0500
X-MC-Unique: 24cHN-FmOTaB-ocFkXcb6g-1
Received: by mail-wm1-f72.google.com with SMTP id h2so9104252wmm.0
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=18Fc3V72Nt+I75V7UwGykm3r5Q46kep57s8eGL/Us2c=;
 b=elEOb3Azydk14gf4Ny8vkorgIt2OkKDu6KFsommpZxd/4Juux62cSWCNlEf5yiaM3r
 koJrpKpO2EIx5RH3/7oLwYueHR7Csz/FIjKYfGAeUx+k90pAlFolCfHRGjS/IWS3oO2D
 DliUpN4DtHKS+eqSjlqJiVcjVB4bfGgyfOgqWYdrjF8k49aVnFy2kqZ2sIAVlq+bLHb0
 ULoWbQVZMc6eQaCuOte3BIc2D0qudTnNCTiBPGJ4ehEktNYQ6qg2ZI5zFiS3VTcggcCZ
 JdpaxZZgN0LqX70/5YeuDIBl9lUoXA4vu5sYtdyUVu7/zeOZzBmvCuLk9SqxzAcavtJl
 FbdA==
X-Gm-Message-State: AOAM533Zi0s2u6i/tSGa9BmYnaH7B6E5cN7cCUjzSOcVFhlP6e+BddRT
 23JXUu0+lipIXEL4SfUY6tB5MRTZbVAiAcbW/FXtdGHGTORxIV6kQ0V54jJvKTdzz12zBWa6r4B
 Q4Xh0zrhO0Hn0Afz8xN7/IMV6NWXdJM+sAuLxlLcsOQirO6CcM2PU8g/sADBW
X-Received: by 2002:a05:6000:36f:: with SMTP id
 f15mr16355203wrf.78.1605479230073; 
 Sun, 15 Nov 2020 14:27:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQHuS/s4QKiuFBFBfJ3DTfsV/lzTpBUfxvU4/4VkcAdEdIixJk1PSKYa8bBaT269bt/FEHqA==
X-Received: by 2002:a05:6000:36f:: with SMTP id
 f15mr16355184wrf.78.1605479229816; 
 Sun, 15 Nov 2020 14:27:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id u5sm16692976wml.13.2020.11.15.14.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:08 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] pc,vhost: fixes, new test
Message-ID: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 17:27:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:

  Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to fe8d9946228d4df6c020f2cb38b6ac08981727cf:

  vhost-user-blk/scsi: Fix broken error handling for socket call (2020-11-15 17:05:47 -0500)

----------------------------------------------------------------
pc,vhost: fixes, new test

Lots of fixes all over the place.
A new test case which seems like a good idea even at
this late stage: can't break things and will make
sure we don't introduce regressions.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
AlexChen (2):
      contrib/libvhost-user: Fix bad printf format specifiers
      vhost-user-blk/scsi: Fix broken error handling for socket call

Coiby Xu (1):
      test: new qTest case to test the vhost-user-blk-server

Philippe Mathieu-Daudé (1):
      hw/i386/acpi-build: Fix maybe-uninitialized error when ACPI hotplug off

Stefan Hajnoczi (13):
      vhost-user: fix VHOST_USER_ADD/REM_MEM_REG truncation
      meson: move vhost_user_blk_server to meson.build
      vhost-user-blk-server: depend on CONFIG_VHOST_USER
      configure: mark vhost-user Linux-only
      tests/qtest: add multi-queue test case to vhost-user-blk-test
      libqtest: add qtest_socket_server()
      vhost-user-blk-test: rename destroy_drive() to destroy_file()
      vhost-user-blk-test: close fork child file descriptors
      vhost-user-blk-test: drop unused return value
      vhost-user-blk-test: fix races by using fd passing
      block/export: port virtio-blk discard/write zeroes input validation
      vhost-user-blk-test: test discard/write zeroes invalid inputs
      block/export: port virtio-blk read/write range check

 meson_options.txt                         |   2 +
 configure                                 |  25 +-
 contrib/libvhost-user/libvhost-user.h     |   2 +-
 tests/qtest/libqos/libqtest.h             |  25 +
 tests/qtest/libqos/vhost-user-blk.h       |  48 ++
 block/export/vhost-user-blk-server.c      | 129 +++-
 contrib/libvhost-user/libvhost-user.c     |  24 +-
 contrib/vhost-user-blk/vhost-user-blk.c   |   2 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c |   2 +-
 hw/i386/acpi-build.c                      |  45 +-
 hw/virtio/vhost-user.c                    |   5 +-
 tests/qtest/libqos/vhost-user-blk.c       | 129 ++++
 tests/qtest/libqtest.c                    |  76 ++-
 tests/qtest/vhost-user-blk-test.c         | 965 ++++++++++++++++++++++++++++++
 block/export/meson.build                  |   5 +-
 docs/interop/vhost-user.rst               |  21 +-
 meson.build                               |  15 +
 tests/qtest/libqos/meson.build            |   1 +
 tests/qtest/meson.build                   |   2 +
 19 files changed, 1419 insertions(+), 104 deletions(-)
 create mode 100644 tests/qtest/libqos/vhost-user-blk.h
 create mode 100644 tests/qtest/libqos/vhost-user-blk.c
 create mode 100644 tests/qtest/vhost-user-blk-test.c


