Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A74376B3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 14:19:46 +0200 (CEST)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdtWT-0001Da-RV
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 08:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mdtRd-0006xN-SL
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mdtRO-0002fJ-Td
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634904869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgrgBGVa/0M6og89ZjDnXkx7Z+R7O8EiyftcofG+Eiw=;
 b=YPaiEpTx9EJTPLZFEzA7WNcpMpc3bQ4Hm7tWbnzp+gihxr466/mPKG+XWUe+t8LKDVeQQI
 J8/2BThoxt0jjFMvzADH//uNxUzd7YUO22hty130dZNxGE2Kr1RTyGTKbGefpXiNmbsHHp
 2kJ+22fb+hinvza7KRM78qN6wt5c0/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-kW-tPYJIONSm9JD9P9SP_Q-1; Fri, 22 Oct 2021 08:14:27 -0400
X-MC-Unique: kW-tPYJIONSm9JD9P9SP_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C86E9F92B
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 12:14:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB26A196AE;
 Fri, 22 Oct 2021 12:14:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C3FA18003BF; Fri, 22 Oct 2021 14:14:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] update seabios to master branch snapshot
Date: Fri, 22 Oct 2021 14:14:19 +0200
Message-Id: <20211022121420.2636991-2-kraxel@redhat.com>
In-Reply-To: <20211022121420.2636991-1-kraxel@redhat.com>
References: <20211022121420.2636991-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new seabios release is planned for november.

Update to a master branch snapshot, to
  (a) increase test coverage of the changes.
  (b) make the delta smaller when updating to the final
      release during the qemu 6.2 freeze.

Most noteworthy this fixes the nvme boot regression caused
by adding namespace support to the qemu nvme emulation.

seabios shortlog
================

Alex Martens via SeaBIOS (1):
      nvme: fix missing newline on sq full print

Alexander Graf (4):
      nvme: Record maximum allowed request size
      nvme: Allow to set PRP2
      nvme: Pass large I/O requests as PRP lists
      nvme: Split requests by maximum allowed size

Daniel P. Berrangé (1):
      smbios: avoid integer overflow when adding SMBIOS type 0 table

David Woodhouse (1):
      nvme: Clean up nvme_cmd_readwrite()

Gerd Hoffmann (9):
      output: add support for uppercase hex numbers
      dsdt: add support for pnp ids as strings
      usb: add boot prio support for mmio host adapters
      usb/xhci: split xhci setup into generic and pci parts
      usb/xhci: add support for mmio host adapters (via acpi).
      usb boot: add xhci mmio example
      nvme: improve namespace allocation
      nvme: drive desc should not include the newline
      Increase BUILD_MIN_BIOSTABLE for large roms

Matt DeVillier (1):
      usb.c: Fix devices using non-primary interface descriptor

Mike Banon (1):
      Support booting USB drives with a write protect switch enabled

Sergei Trofimovich (1):
      vgasrc: ignore .node.gnu.property (binutils-2.36 support)

Stefan Berger (4):
      tcgbios: Fix details in log entries
      Add implementations for sha256, sha384, and sha512
      tcgbios: Use The proper sha function for each PCR bank
      tcgbios: Disable platform hierarchy in case of failure

Stefan Ott via SeaBIOS (1):
      usb-hid: Increase MAX_KBD_EVENT

Volker Rümelin (2):
      stacks: call check_irqs() in run_thread()
      stacks: call check_irqs() after switch_next()

weitaowang-oc@zhaoxin.com (1):
      USB:Fix xHCI initail fail by using longer reset and CNR clear timeout value

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/seabios | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/seabios b/roms/seabios
index 155821a1990b..64f37cc530f1 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit 155821a1990b6de78dde5f98fa5ab90e802021e0
+Subproject commit 64f37cc530f144e53c190c9e8209a51b58fd5c43
-- 
2.31.1


