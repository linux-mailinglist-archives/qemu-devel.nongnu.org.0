Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60274251202
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 08:23:36 +0200 (CEST)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kASMp-0005Sc-GP
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 02:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kASJj-0002Mr-Ps
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 02:20:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kASJi-0002bU-9g
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 02:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598336421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcRbvyTzoBYYcoZF7ye/vje8bN4fWyq6/fM1cwgfk4g=;
 b=RByqy6ebSwWbyDuLROdtwiiwUjSYd2uys35ow6Nw5yxo7/iehREU27Yh3jD7z4NMPCfiD8
 ovMToMnVE2OLOu0BPUavEY4aDg5izb5wEet+1gj7Rl+eHeBrUzIp76F5KxXViqVLy+xGTF
 CmtXVOBSKFM0hlkVPrn/srRY9T3R9Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-SnfA8RjtO1u7LyMrL3adCA-1; Tue, 25 Aug 2020 02:20:13 -0400
X-MC-Unique: SnfA8RjtO1u7LyMrL3adCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67DA425D3;
 Tue, 25 Aug 2020 06:20:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37EB32AABF;
 Tue, 25 Aug 2020 06:20:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56CBB241; Tue, 25 Aug 2020 08:20:08 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] meson: drop keymaps symlink
Date: Tue, 25 Aug 2020 08:20:06 +0200
Message-Id: <20200825062008.6502-2-kraxel@redhat.com>
In-Reply-To: <20200825062008.6502-1-kraxel@redhat.com>
References: <20200825062008.6502-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
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
Cc: Klaus Jensen <k.jensen@samsung.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, laurent@vivier.eu,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are building the keymaps by default now.  Drop the keymaps symlink
so the generated files are actually written to the build tree not the
source tree.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-id: 20200824074057.3673-1-kraxel@redhat.com
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index b8f5b81a6719..377aafa2acd5 100755
--- a/configure
+++ b/configure
@@ -8120,7 +8120,7 @@ DIRS="$DIRS roms/seabios"
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/lm32/Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
-LINKS="$LINKS pc-bios/optionrom/Makefile pc-bios/keymaps"
+LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
-- 
2.27.0


