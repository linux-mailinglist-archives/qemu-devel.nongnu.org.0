Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7863CE655
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:46:28 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WPT-0007iO-5y
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m5WNr-0006X4-6b
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m5WNp-0000Gj-Py
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BEn/M29xXpzEjZGd75hTgplyo2zAtlZO+jPOdh1ThU0=;
 b=ibDzU6GuBjmQK/fMwZaY+sHaFsB6LyDjvdU8N5bOyDbADG8C6HWRfV4vZZ2nM+0Df/EgRE
 bUkxg00t3Y7jE1jbe44K80qOf5hzsfHeJJtpCyMOsfE0k1WWVjxRzD37RZFuP0HhCTjwdM
 cZtM+LOuhPZl2ZBqYW52LOwQjezEzOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-469PwfhWM8OLqeXhn_p5Dg-1; Mon, 19 Jul 2021 12:44:40 -0400
X-MC-Unique: 469PwfhWM8OLqeXhn_p5Dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4CDA81C863;
 Mon, 19 Jul 2021 16:44:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7AA127068;
 Mon, 19 Jul 2021 16:44:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] chardev-spice: add missing module_obj directive
Date: Mon, 19 Jul 2021 12:44:35 -0400
Message-Id: <20210719164435.1227794-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Frederic Bezies <fredbezies@gmail.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The chardev-spicevmc class was not listed in chardev/spice.c, causing
"-chardev spicevmc" to fail when modules are enabled.

Reported-by: Frederic Bezies <fredbezies@gmail.com>
Fixes: 9f4a0f0978 ("modules: use modinfo for qom load", 2021-07-09)
Resolves: #488
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/spice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/chardev/spice.c b/chardev/spice.c
index 3ffb3fdc0d..bbffef4913 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -382,6 +382,7 @@ static const TypeInfo char_spicevmc_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spicevmc_class_init,
 };
+module_obj(TYPE_CHARDEV_SPICEVMC);
 
 static void char_spiceport_class_init(ObjectClass *oc, void *data)
 {
-- 
2.27.0


