Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E527418A57
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:23:04 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXrj-0002O2-0c
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXmC-0004ha-ER
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXm8-00081E-NT
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632676634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=azo2X/U6Bf/eZsJOzpZ4egc48NQy5RumrPmofhPYWLc=;
 b=G1xTZeAl69Wn3WT5wMUF8Zr7gamrxlsyNryOKsMVIGKoJOx827Dujp+vVCiIqBlLXgVGJM
 7cKFqB9bbE0bzuow/ogL8ky7o7HvrLRx2t6Au/iJn2GE2/M5lT9L+jbUWsvIYhwfmATpCq
 LSwnhWHlVOqvUgThze+O5/pKYrkpdkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-ZBGjcSVnNsGV_JyZ9sBQwg-1; Sun, 26 Sep 2021 13:17:10 -0400
X-MC-Unique: ZBGjcSVnNsGV_JyZ9sBQwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D7B362F9
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 056BE60657
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/5] Update meson version
Date: Sun, 26 Sep 2021 13:17:03 -0400
Message-Id: <20210926171708.455435-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:

  Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson

for you to fetch changes up to 1d4bef90b570b8f4ab10c380227d325eb49ce084:

  tests: qtest: bios-tables-test depends on the unpacked edk2 ROMs (2021-09-23 06:40:15 -0400)

----------------------------------------------------------------
* Bump Meson submodule to 0.58.2
* Fix dependencies of tests upon ROMs

----------------------------------------------------------------
Paolo Bonzini (5):
      meson: bump submodule to 0.58.2
      meson: switch minimum meson version to 0.58.2
      hexagon: use env keyword argument to pass PYTHONPATH
      meson: unpack edk2 firmware even if --disable-blobs
      tests: qtest: bios-tables-test depends on the unpacked edk2 ROMs

 configure                       |  8 ++---
 docs/meson.build                | 14 ++++-----
 meson                           |  2 +-
 meson.build                     | 70 +++++++++++++++++++----------------------
 pc-bios/descriptors/meson.build |  4 +--
 pc-bios/meson.build             |  5 +--
 plugins/meson.build             |  4 +--
 scripts/mtest2make.py           |  7 ++---
 target/hexagon/meson.build      |  3 +-
 tests/qapi-schema/meson.build   |  4 +--
 tests/qtest/meson.build         |  8 ++---
 tests/unit/meson.build          |  2 +-
 trace/meson.build               |  4 +--
 13 files changed, 63 insertions(+), 72 deletions(-)
-- 
2.27.0


