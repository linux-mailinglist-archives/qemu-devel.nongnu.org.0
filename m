Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180136B2381
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:58:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEtx-0004ds-3G; Thu, 09 Mar 2023 06:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1paEtv-0004Ye-9P
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1paEtt-0007x4-JA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678363056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VWbviqU0yQBjbu+wn7l16bdYV3wL2MFZTvb5Ddgmy/4=;
 b=idRtbIl3bVU0kWvH22C/1htPuKsOIwKzhpzxQbq7g12VeUuBJ4HohZm2FzVv9D+ohS714t
 iDAYKtGYHZtgUGPGJoxreOLhukWS4IBeU8z6O0Uem7q0HPvZsXHSLNcDtGGD4UVpWBD+pS
 6d45id4bWbrg0z8LqVG3rmAV8wT2GAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-MqH-bp9hO3W-2aZRbIw-gg-1; Thu, 09 Mar 2023 06:57:35 -0500
X-MC-Unique: MqH-bp9hO3W-2aZRbIw-gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABB012999B29;
 Thu,  9 Mar 2023 11:57:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF55C15BA0;
 Thu,  9 Mar 2023 11:57:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 542E91800082; Thu,  9 Mar 2023 12:57:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 0/3] Edk2 stable202302 20230309 patches
Date: Thu,  9 Mar 2023 12:57:11 +0100
Message-Id: <20230309115714.906369-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/edk2-stable202302-20230309-pull-request

for you to fetch changes up to 75bc97ac50634229fa9da45faa1fa64bbe6024c7:

  edk2: update firmware binaries (2023-03-09 12:49:29 +0100)

----------------------------------------------------------------
edk2: update to 202302 stable tag

----------------------------------------------------------------

Gerd Hoffmann (3):
  edk2: update submodule to edk2-stable202302
  edk2: replace build scripts
  edk2: update firmware binaries

 roms/edk2-build.py                     | 372 +++++++++++++++++++++++++
 pc-bios/edk2-aarch64-code.fd.bz2       | Bin 1161290 -> 1508803 bytes
 pc-bios/edk2-arm-code.fd.bz2           | Bin 1161845 -> 1482646 bytes
 pc-bios/edk2-i386-code.fd.bz2          | Bin 1282120 -> 1695318 bytes
 pc-bios/edk2-i386-secure-code.fd.bz2   | Bin 1473677 -> 1922002 bytes
 pc-bios/edk2-riscv.fd.bz2              | Bin 0 -> 1096510 bytes
 pc-bios/edk2-x86_64-code.fd.bz2        | Bin 1327522 -> 1796544 bytes
 pc-bios/edk2-x86_64-microvm.fd.bz2     | Bin 1309407 -> 1697788 bytes
 pc-bios/edk2-x86_64-secure-code.fd.bz2 | Bin 1513711 -> 1999841 bytes
 roms/Makefile                          |  29 +-
 roms/Makefile.edk2                     | 178 ------------
 roms/edk2                              |   2 +-
 roms/edk2-build.config                 | 119 ++++++++
 roms/edk2-build.sh                     |  55 ----
 roms/edk2-funcs.sh                     | 273 ------------------
 15 files changed, 499 insertions(+), 529 deletions(-)
 create mode 100755 roms/edk2-build.py
 create mode 100644 pc-bios/edk2-riscv.fd.bz2
 delete mode 100644 roms/Makefile.edk2
 create mode 100644 roms/edk2-build.config
 delete mode 100755 roms/edk2-build.sh
 delete mode 100644 roms/edk2-funcs.sh

-- 
2.39.2


