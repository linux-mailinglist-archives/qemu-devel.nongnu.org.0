Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D153F24E288
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 23:18:17 +0200 (CEST)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9EQS-0006M8-Ui
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 17:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k9EMf-0001Cs-T7
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 17:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k9EMc-0003rN-SL
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 17:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598044458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TpWbhUyXkt3LakPn/SludUGkFwKrG9hjWPw3DGhCPHE=;
 b=hFYqjkWhRN6jjvUFiKZxZa1vtI8a7ibP+b9eY+7jSxEmEHgVYCIcNICfoaL1p4Vvy4VAnV
 vQA5Zh9Otre2fyVNRLLDJUsMuQtVpOMmpYGiApsVSpumtTO1oVZ0qCu3/MUONW/OBSTxLJ
 lrKMRKOjJeqA29h/g48G6hILl0W4CxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-Le0zxH00Nq-pC3OuW3Eb4g-1; Fri, 21 Aug 2020 17:14:14 -0400
X-MC-Unique: Le0zxH00Nq-pC3OuW3Eb4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E6821074657
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 21:14:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C045C1D0
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 21:14:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Meson build system fixes
Date: Fri, 21 Aug 2020 17:14:06 -0400
Message-Id: <20200821211412.17321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit d6f83a72a7db94a3ede9f5cc4fb39f9c8e89f954:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/acceptance-testing-20200812' into staging (2020-08-21 14:51:43 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 460b4664c6ad2b88ccfb2d69ab4cbb7d6c9165a0:

  keymaps: update (2020-08-21 17:06:17 -0400)

----------------------------------------------------------------
meson fixes:

* --disable-tools --enable-system build
* s390 no-TCG build
* fdmon-io_uring
* 'shift' error message in version_ge()

----------------------------------------------------------------
Marc-André Lureau (1):
      meson: convert pc-bios/keymaps/Makefile

Paolo Bonzini (2):
      target/s390x: fix meson.build issue
      keymaps: update

Philippe Mathieu-Daudé (1):
      meson: Fix --disable-tools --enable-system builds

Stefano Garzarella (2):
      util/meson.build: fix fdmon-io_uring build
      configure: silence 'shift' error message in version_ge()

 Makefile                    |   8 --
 configure                   |   6 +-
 meson.build                 |  14 +--
 pc-bios/keymaps/.gitignore  |   1 +
 pc-bios/keymaps/Makefile    |  56 ----------
 pc-bios/keymaps/ar          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/bepo        | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/cz          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/da          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/de          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/de-ch       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/en-gb       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/en-us       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/es          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/et          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/fi          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/fo          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/fr          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/fr-be       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/fr-ca       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/fr-ch       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/hr          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/hu          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/is          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/it          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/ja          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/lt          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/lv          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/meson.build |  56 ++++++++++
 pc-bios/keymaps/mk          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/nl          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/no          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/pl          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/pt          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/pt-br       | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/ru          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/th          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/keymaps/tr          | 242 +++++++++++++++++++++++++++++++++++++++++++-
 pc-bios/meson.build         |   1 +
 target/s390x/meson.build    |   2 +-
 ui/meson.build              |   2 +-
 util/meson.build            |   2 +-
 42 files changed, 7752 insertions(+), 140 deletions(-)
 create mode 100644 pc-bios/keymaps/.gitignore
 delete mode 100644 pc-bios/keymaps/Makefile
 create mode 100644 pc-bios/keymaps/meson.build
-- 
2.26.2


