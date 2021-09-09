Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4204053B6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:53:51 +0200 (CEST)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJYs-00013e-37
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mOJXQ-0008Ie-Go
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:52:20 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:36998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mOJXK-0006lJ-Mc
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:52:18 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 79E032E0F9A;
 Thu,  9 Sep 2021 15:52:08 +0300 (MSK)
Received: from sas1-db2fca0e44c8.qloud-c.yandex.net
 (sas1-db2fca0e44c8.qloud-c.yandex.net [2a02:6b8:c14:6696:0:640:db2f:ca0e])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 jXzm4zkqFa-q8tuCLl9; Thu, 09 Sep 2021 15:52:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1631191928; bh=Mj/QWEO/T7G+87+5waBMBUP/FagEh79jXinNor3GAMY=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=tl6/mvXnwAgzQNWBSCrPW1Z8nuL41y02PUWxCK/zbnDkQBEFDwzLVBjYj/thW4lvY
 pWrFmBkLztLHpf/MVkcnF0l00BUcgd+l7vigbSs0Uf+08/yIzmZlgiAqj9LZ6o79qr
 EQCYtBRn+Wdmu9ifTMCTtUhw5vkHWpU29OzMKaKU=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8010::1:1])
 by sas1-db2fca0e44c8.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LgYonbd0u6-q70SIw9h; Thu, 09 Sep 2021 15:52:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v0] machine: remove non existent device tuning
Date: Thu,  9 Sep 2021 15:51:55 +0300
Message-Id: <20210909125155.71120-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Device "vhost-blk-device" doesn't exist in qemu yet.
So, its compatibility tuning is meaningless.

The line with the non existent device was introduced with
"1bf8a989a566b virtio: make seg_max virtqueue size dependent"
patch by mistake. The oriiginal patch was meant to set
"seg-max-adjust" property for "vhost-scsi" device instead of
"vhost-blk-device".

So now, we have "seg-max-adjust" property enabled for all machine
types using binaries with implemented "seg-max-adjust".

Replacing "vhost-blk-device" with "vhost-scsi" instead of removing
the line seems to be a bad idea. Now, because of the mistake, "seg-max"
for "vhost-scsi" device is queue-size dependent even for machine types
using "hw_compat_4_2" and older on new binaries.
Thus, now we have two behaviors:
* on old binaries (before the original patch) - seg_max is always 126
* on new binaries - seg_max is queue-size dependent
Replacing the line will split the behavior of new binaries into two.
This would make an investigation in case of related problems harder.

To not make things worse, this patch just removes the line
to keep behavior like it is now.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 hw/core/machine.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528fd..d4f70cc01af0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -87,7 +87,6 @@ GlobalProperty hw_compat_4_2[] = {
     { "virtio-blk-device", "x-enable-wce-if-config-wce", "off" },
     { "virtio-blk-device", "seg-max-adjust", "off"},
     { "virtio-scsi-device", "seg_max_adjust", "off"},
-    { "vhost-blk-device", "seg_max_adjust", "off"},
     { "usb-host", "suppress-remote-wake", "off" },
     { "usb-redir", "suppress-remote-wake", "off" },
     { "qxl", "revision", "4" },
-- 
2.25.1


