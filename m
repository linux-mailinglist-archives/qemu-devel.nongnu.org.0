Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B5252CB6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:46:32 +0200 (CEST)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtst-0002Xy-7c
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtpM-0004ih-1w
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:42:52 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:47928
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtpK-000867-Be
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:42:51 -0400
Received: from MattGorko-Laptop.home
 (lfbn-idf1-1-1395-83.w90-79.abo.wanadoo.fr [90.79.87.83])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 416B2412DD;
 Wed, 26 Aug 2020 13:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1598442168; bh=nQhKuNn3MwH4gOHTPOjyBvj9K5iVBhe1uEtgY1+8Dds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AvMnKyctu16S0XDSCiPqb/XTAEtQ4YOB5upyz6yS2iKVa4qI6fcucC1PQgX5XK3Wh
 PxqlW5sjr3qlxKuDR/EEiADvOTOgKQBKnHf3xsU+y9cFMvd9AxgU/Y3r29WzCRqGDF
 o5JxRd1mXDeT32Jw+EuV9vbggksdFz/wzpu92/Sg=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/12] docs/system: Add U2F key to the USB devices examples
Date: Wed, 26 Aug 2020 13:42:05 +0200
Message-Id: <20200826114209.28821-9-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
References: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 07:42:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 docs/system/usb.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/usb.rst b/docs/system/usb.rst
index ddfa828d74..9a2f1927c4 100644
--- a/docs/system/usb.rst
+++ b/docs/system/usb.rst
@@ -81,6 +81,9 @@ option or the ``device_add`` monitor command. Available devices are:
 ``usb-audio``
    USB audio device
 
+``u2f-{emulated,passthru}``
+   Universal Second Factor device
+
 .. _host_005fusb_005fdevices:
 
 Using host USB devices on a Linux host
-- 
2.28.0


