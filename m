Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB12B5C72
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:01:29 +0100 (CET)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexnj-0006RX-Vk
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkP-0003La-7R
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkL-0003Ug-ST
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VYt2udeLJcHsFXYDZK/CzT10367CpuNo41e7rUgoYGY=;
 b=Oy6yKDY99HAjArnlfCTwEYWi8iNApEDKy2NT1H0HiUBZ0wf49l4uWru4o0bQTOK4SQNCCU
 pHahiJqnF5hsTY9LGy8VRhemKdeZC7YXieHE7j4P2JyeIwPBW9VU7jo8lFXunuiykQA47/
 m1/EEXUWWKiULjirmbBHD22IHwmebnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-x2OjtiVVM2m7_yUEpg65UA-1; Tue, 17 Nov 2020 04:57:52 -0500
X-MC-Unique: x2OjtiVVM2m7_yUEpg65UA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1F26805EF4;
 Tue, 17 Nov 2020 09:57:51 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8AF76640;
 Tue, 17 Nov 2020 09:57:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/12] Misc fixes for 5.2
Date: Tue, 17 Nov 2020 10:57:36 +0100
Message-Id: <20201117095748.122371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
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

 Hi Peter,

the following changes since commit b17d3b7b77f043f0e76f0e6ce6def3c1b1d5ee8b:

  Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-11-16-tag' into staging (2020-11-16 20:15:57 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-17

for you to fetch changes up to 46b42f715d1310cd80acfeb7c84337a128fd190b:

  max111x: put it into the 'misc' category (2020-11-17 10:17:02 +0100)

----------------------------------------------------------------
* Fixes for compiling on Haiku, and add Haiku VM for compile-testing
* Update NetBSD VM to version 9.1
* Misc fixes (e.g. categorize some devices)
----------------------------------------------------------------

AlexChen (1):
      target/microblaze: Fix possible array out of bounds in mmu_write()

Alexander von Gluck IV (1):
      tests/vm: Add Haiku test based on their vagrant images

Brad Smith (1):
      tests/vm: update NetBSD to 9.1

Gan Qixin (4):
      ssd0323: put it into the 'display' category
      ads7846: put it into the 'input' category
      nand: put it into the 'storage' category
      max111x: put it into the 'misc' category

Philippe Mathieu-Daudé (1):
      qemu/bswap: Remove unused qemu_bswap_len()

Rebecca Cran (1):
      gitlab-ci: Use $CI_REGISTRY instead of hard-coding registry.gitlab.com

Thomas Huth (3):
      configure: Fix the _BSD_SOURCE define for the Haiku build
      configure: Do not build pc-bios/optionrom on Haiku
      configure: Add a proper check for sys/ioccom.h and use it in tpm_ioctl.h

 .gitlab-ci.d/containers.yml |   2 +-
 backends/tpm/tpm_ioctl.h    |   4 ++
 configure                   |   4 +-
 hw/block/nand.c             |   1 +
 hw/display/ads7846.c        |   2 +
 hw/display/ssd0323.c        |   1 +
 hw/misc/max111x.c           |   1 +
 include/qemu/bswap.h        |   6 ---
 meson.build                 |   2 +
 nbd/nbd-internal.h          |   2 +-
 target/microblaze/mmu.c     |   3 +-
 tests/keys/vagrant          |  27 ++++++++++
 tests/keys/vagrant.pub      |   1 +
 tests/vm/Makefile.include   |   3 +-
 tests/vm/basevm.py          |   5 +-
 tests/vm/haiku.x86_64       | 119 ++++++++++++++++++++++++++++++++++++++++++++
 tests/vm/netbsd             |   6 +--
 17 files changed, 172 insertions(+), 17 deletions(-)
 create mode 100644 tests/keys/vagrant
 create mode 100644 tests/keys/vagrant.pub
 create mode 100755 tests/vm/haiku.x86_64


