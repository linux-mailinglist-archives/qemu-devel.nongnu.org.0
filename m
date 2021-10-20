Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AD434CEF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:59:42 +0200 (CEST)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC86-0004yU-09
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdC3t-0007BJ-JL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:55:21 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:16144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdC3o-0006uc-Un
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:55:21 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1708446923;
 Wed, 20 Oct 2021 15:55:14 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v6 5/5] docs: add deprecation note about 'set_password' param
 'connected'
Date: Wed, 20 Oct 2021 15:55:00 +0200
Message-Id: <20211020135500.2384930-6-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020135500.2384930-1-s.reiter@proxmox.com>
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

Seperate patch since it read a bit unsure in the review, feel free to either
drop or squash this.

 docs/about/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0bed6ecb1d..1ad08e57d2 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -228,6 +228,12 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
 instead.  As part of this deprecation, where ``nbd-server-add`` used a
 single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 
+``set_password`` argument ``connected`` for VNC protocol (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Only the value ``keep`` is and was ever supported for VNC. It is recommended to
+just drop the argument.
+
 System accelerators
 -------------------
 
-- 
2.30.2



