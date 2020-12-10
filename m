Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5B22D5ACF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:47:28 +0100 (CET)
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLLz-0003kz-LW
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKpw-0003iA-2K
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKpr-0006sv-Ia
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kVpwdSs5ya1Bf8ZNWsU+Ci4HKmkqFAymcXD6gnTn6IE=;
 b=RNuVcdnnB16auEkve9KFZhuyGD6CYgGfSDMPSzEj78w7SFV5JV8f/RTKWPPaXTmdGw0rr7
 3CsJf3e7hBwnB1jolwOxaoE/nkdYZyGH2I0DAAm6UeCUTS9ovHwbSRExqO0TliGED28yAT
 7/B+qkI6vLB7TMEUeNqGsLbDPA4B66U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-wquUqcXeOGahCbXFPW7Jgw-1; Thu, 10 Dec 2020 07:14:13 -0500
X-MC-Unique: wquUqcXeOGahCbXFPW7Jgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEA3D10054FF;
 Thu, 10 Dec 2020 12:14:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C40FB1975E;
 Thu, 10 Dec 2020 12:14:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A601AA1E2; Thu, 10 Dec 2020 13:13:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Microvm 20201210 patches
Date: Thu, 10 Dec 2020 13:13:48 +0100
Message-Id: <20201210121359.18320-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f63877=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (2020-12-09 20:08:54 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/microvm-20201210-pull-request=0D
=0D
for you to fetch changes up to 08af4e13f8d4db099bc444f83879c32459df7f3a:=0D
=0D
  tests/acpi: disallow updates for expected data files (2020-12-10 08:47:44=
 +0100)=0D
=0D
----------------------------------------------------------------=0D
microvm: add support for second ioapic=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (11):=0D
  x86: rewrite gsi_handler()=0D
  x86: add support for second ioapic=0D
  microvm: make number of virtio transports runtime changeable=0D
  microvm: make pcie irq base runtime changeable=0D
  microvm: drop microvm_gsi_handler()=0D
  microvm: add second ioapic=0D
  tests/acpi: allow updates for expected data files=0D
  tests/acpi: add data files for ioapic2 test variant=0D
  tests/acpi: add ioapic2=3Don test for microvm=0D
  tests/acpi: update expected data files=0D
  tests/acpi: disallow updates for expected data files=0D
=0D
 include/hw/i386/ioapic.h             |   2 +=0D
 include/hw/i386/ioapic_internal.h    |   2 +-=0D
 include/hw/i386/microvm.h            |   6 +-=0D
 include/hw/i386/x86.h                |   3 +=0D
 hw/i386/acpi-common.c                |  10 ++++=0D
 hw/i386/microvm.c                    |  82 ++++++++++++++++++++-------=0D
 hw/i386/x86.c                        |  35 ++++++++++--=0D
 tests/qtest/bios-tables-test.c       |  20 +++++--=0D
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 0 -> 82 bytes=0D
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 0 -> 365 bytes=0D
 10 files changed, 128 insertions(+), 32 deletions(-)=0D
 create mode 100644 tests/data/acpi/microvm/APIC.ioapic2=0D
 create mode 100644 tests/data/acpi/microvm/DSDT.ioapic2=0D
=0D
--=20=0D
2.27.0=0D
=0D


