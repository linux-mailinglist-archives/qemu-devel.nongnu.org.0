Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA32577E3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 13:05:42 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kChd7-0002mH-Uc
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 07:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kChbu-0001C3-HF
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 07:04:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46605
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kChbs-0008MC-44
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 07:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598871863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oh0dsR9TI3mzIVeN0IPikw4F2PQLKCbM82ZwfYzDhZo=;
 b=dD6PXUEOs55TuecYEpMvXIIJ9+vsIbW1c4ITzef3yDDEaoytQqZ6x8oBV54ZBh2QVOlsn9
 CVCt6wfqG7YS06f6NsEOVpnmerC/d6d8c1oxj0XVMADmNa+ZTf+h6+UAhs5GvzmM5f9jxU
 9ahpTy8JaIDAPguw9KjBXkj7g7T7kk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-mMAjwlKfPSWqNoU5qcjfPA-1; Mon, 31 Aug 2020 07:04:21 -0400
X-MC-Unique: mMAjwlKfPSWqNoU5qcjfPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 208B510ABDA0;
 Mon, 31 Aug 2020 11:04:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 033DB757C0;
 Mon, 31 Aug 2020 11:04:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 31A0431E23; Mon, 31 Aug 2020 13:04:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] ui: Add more mouse buttons to SPICE
Date: Mon, 31 Aug 2020 13:04:15 +0200
Message-Id: <20200831110416.15176-5-kraxel@redhat.com>
In-Reply-To: <20200831110416.15176-1-kraxel@redhat.com>
References: <20200831110416.15176-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 02:54:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Frediano Ziglio <freddy77@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frediano Ziglio <freddy77@gmail.com>

Add support for SIDE and EXTRA buttons.

The constants for buttons in both SPICE and QEMU are defined as
  LEFT
  MIDDLE
  RIGHT
  UP
  DOWN
  SIDE
  EXTRA
(same order).

"button_mask" contains for each bit the state of a button. Qemu currently
uses bits 0, 1, 2 respectively as LEFT, RIGHT, MIDDLE; also add bits 4
and 5 as UP and DOWN (using wheel movements). SPICE protocol uses
a bitmask based on the order above where LEFT is bit 0, MIDDLE is
bit 1 and so on till EXTRA being bit 6. To avoid clash with Qemu usage
SPICE bitmask from SIDE are move a bit more resulting respectively
in 0x40 and 0x80 values.

Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
Message-id: 20200820145851.50846-1-fziglio@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/spice-input.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/spice-input.c b/ui/spice-input.c
index cd4bb0043fd9..d5bba231c95c 100644
--- a/ui/spice-input.c
+++ b/ui/spice-input.c
@@ -123,6 +123,8 @@ static void spice_update_buttons(QemuSpicePointer *pointer,
         [INPUT_BUTTON_RIGHT]       = 0x02,
         [INPUT_BUTTON_WHEEL_UP]    = 0x10,
         [INPUT_BUTTON_WHEEL_DOWN]  = 0x20,
+        [INPUT_BUTTON_SIDE]        = 0x40,
+        [INPUT_BUTTON_EXTRA]       = 0x80,
     };
 
     if (wheel < 0) {
-- 
2.27.0


