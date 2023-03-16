Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A8B6BCB9E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckJm-0001Mg-0w; Thu, 16 Mar 2023 05:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pckJk-0001M3-4x
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pckJi-0008R1-JR
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678960477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KzXSWvS3WphAtrC1nmb2sejuoYPah4Of5n/G+rwFMF0=;
 b=MkFI6RRxvyUuSCwwKq3VW4idaD6cNOu1EEFjYdeuXmezECELMbpRgS/xl0vzXx8WjfGN2T
 Fkj477ncQaN6NTl+bgDeCGPz1wNpr1vEWg7b/H6kHArWWsPOOO5jQapUDhCjBrERNJFgWo
 Vc5sEKhr2+uS1urbBex5DThCbGJxN8Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-MUtpefDxNfSjIcicyQcnBQ-1; Thu, 16 Mar 2023 05:54:34 -0400
X-MC-Unique: MUtpefDxNfSjIcicyQcnBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 241C387A9E1;
 Thu, 16 Mar 2023 09:54:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C92A835453;
 Thu, 16 Mar 2023 09:54:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3D2631801CF6; Thu, 16 Mar 2023 10:54:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/6] edk2: update to 2023-02 stable tag
Date: Thu, 16 Mar 2023 10:54:26 +0100
Message-Id: <20230316095432.1514080-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Turned out to be a bit more complicated than just
"update submodule + binaries, done".  One acpi
test case needs a fix to not use too small numa
nodes.  So posting this as patch series for
review first.

The patch updating the binaries will probably
not make it to to the list.  So for testing the
the branch can be pulled here:

git://git.kraxel.org/qemu edk2-stable202302

Alternatively use "make -C roms efi" to build
locally (needs cross compilers for arm, aarch64
and riscv64).

Gerd Hoffmann (6):
  acpi: enable tests/data/acpi updates
  bios-tables-test: use 128M numa nodes on aarch64
  acpi: disable tests/data/acpi updates
  edk2: update submodule to edk2-stable202302
  edk2: replace build scripts
  edk2: update firmware binaries

 roms/edk2-build.py                     | 380 +++++++++++++++++++++++++
 tests/qtest/bios-tables-test.c         |   6 +-
 pc-bios/README                         |   4 +-
 pc-bios/edk2-aarch64-code.fd.bz2       | Bin 1161290 -> 1508184 bytes
 pc-bios/edk2-arm-code.fd.bz2           | Bin 1161845 -> 1483149 bytes
 pc-bios/edk2-i386-code.fd.bz2          | Bin 1282120 -> 1695318 bytes
 pc-bios/edk2-i386-secure-code.fd.bz2   | Bin 1473677 -> 1922002 bytes
 pc-bios/edk2-riscv.fd.bz2              | Bin 0 -> 1096418 bytes
 pc-bios/edk2-x86_64-code.fd.bz2        | Bin 1327522 -> 1796544 bytes
 pc-bios/edk2-x86_64-microvm.fd.bz2     | Bin 1309407 -> 1697788 bytes
 pc-bios/edk2-x86_64-secure-code.fd.bz2 | Bin 1513711 -> 1999841 bytes
 roms/Makefile                          |  29 +-
 roms/Makefile.edk2                     | 178 ------------
 roms/edk2                              |   2 +-
 roms/edk2-build.config                 | 124 ++++++++
 roms/edk2-build.sh                     |  55 ----
 roms/edk2-funcs.sh                     | 273 ------------------
 tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
 tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes
 19 files changed, 517 insertions(+), 534 deletions(-)
 create mode 100755 roms/edk2-build.py
 create mode 100644 pc-bios/edk2-riscv.fd.bz2
 delete mode 100644 roms/Makefile.edk2
 create mode 100644 roms/edk2-build.config
 delete mode 100755 roms/edk2-build.sh
 delete mode 100644 roms/edk2-funcs.sh

-- 
2.39.2


