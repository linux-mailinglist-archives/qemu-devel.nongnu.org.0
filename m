Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB627564F3B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:03:46 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8H3a-00056M-09
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzs-0002DX-1l
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzn-0007eo-Ox
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hEAd6nv5nVNCGszQZura2PSpyfTbnxpdnuOLNjiDASc=;
 b=a9Ufj2P+0YKLgTLpqrtpgWPste++5ayaHojpgBut5c1bVIPPN4ymBZBAJk4PG1PPIAnQBR
 uxu1gwOrIIRQcOTj4SfPlbBWkxymtzHDILEKJfgq9BGb+HxVde8PccfhcD80/gYAle2IKd
 5JB6YmBR6vxRc8c+a2qJOG24sPL2Vkg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-WN3tNCsxPAOl57MqrCb2Sg-1; Mon, 04 Jul 2022 03:59:48 -0400
X-MC-Unique: WN3tNCsxPAOl57MqrCb2Sg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D63E38173DE;
 Mon,  4 Jul 2022 07:59:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D37492C3B;
 Mon,  4 Jul 2022 07:59:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EB3C1800626; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: [PULL 0/8] Kraxel 20220704 patches
Date: Mon,  4 Jul 2022 09:59:38 +0200
Message-Id: <20220704075946.921883-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d495e432c04a6394126c35cf96517749708b410f:

  Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu into staging (2022-06-30 22:04:12 +0530)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/kraxel-20220704-pull-request

for you to fetch changes up to 927b968d1bc7c0a25edad8161608223b1122a253:

  hw: canokey: Remove HS support as not compliant to the spec (2022-07-01 12:39:51 +0200)

----------------------------------------------------------------
usb: canokey fixes.
ui: better tab labels, cocoa fix,
docs: convert fw_cfg to rst.

----------------------------------------------------------------

Akihiko Odaki (1):
  ui/cocoa: Fix clipboard text release

Hongren (Zenithal) Zheng (3):
  hw/usb/canokey: Fix CCID ZLP
  hw/usb/canokey: fix compatibility of qemu-xhci
  docs/system/devices/usb/canokey: remove limitations on qemu-xhci

MkfsSion (1):
  hw: canokey: Remove HS support as not compliant to the spec

Simon Sapin (2):
  Rename docs/specs/fw_cfg.txt to .rst
  Convert fw_cfg.rst to reStructuredText syntax

Wen, Jianxian (1):
  ui/console: allow display device to be labeled with given id

 include/ui/console.h                  |   1 +
 hw/usb/canokey.c                      |  31 +++-
 ui/console.c                          |  41 ++++-
 docs/specs/{fw_cfg.txt => fw_cfg.rst} | 211 ++++++++++++++------------
 docs/specs/index.rst                  |   1 +
 docs/system/devices/canokey.rst       |  10 --
 ui/cocoa.m                            |   4 +-
 7 files changed, 189 insertions(+), 110 deletions(-)
 rename docs/specs/{fw_cfg.txt => fw_cfg.rst} (58%)

-- 
2.36.1


