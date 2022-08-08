Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D3C58C8E2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:59:29 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2Lw-00052y-M5
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jq-0007mt-I5
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jn-0001fP-62
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOBfz/cMVhH0j5sprwl3Y1QI29rhhQHeizSuzql1dcY=;
 b=Vsrm8LGSUcOmr2pAHMyyvfld8tvZTYrfcRtVzDfe2Qg7g3X83ISoVl5B0Sv7F1X/4ux1MR
 v5D+wiND+iipEgiTWRpbyeH9k8eHA7rXJdBuXQizSrOaZtPYX7Z80ZxN7BKSmpJPY0w4CK
 wuoZOCDWRoKOldBueviJlibT5JHgLxo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Ly_mWlyHMjWfyPVqn99Wxw-1; Mon, 08 Aug 2022 08:57:13 -0400
X-MC-Unique: Ly_mWlyHMjWfyPVqn99Wxw-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa33-20020a1709076d2100b0073101bdd612so1688598ejc.14
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QOBfz/cMVhH0j5sprwl3Y1QI29rhhQHeizSuzql1dcY=;
 b=wjL1mO31ZhhyUdjHBaA8Hnc64StO7kAMIVj4ElcrVk8v8DVTMsPUXRzeg63K1LdoQn
 9zkKZEENG+oHqMAmQZR8OQhdZ6UAAF6/5P1y1WX1skyfFw/5XTCrBsF5UDjYxjMYaHU8
 YkpZ8rD2e/EdSJLNaLsxUc9fZXrhKAJ2W9eGuaehKOo7QPwL2XqLTbYHHLa5pEijEdEM
 oblvnrhT9uCOWCWZ9S1PxV+mzRRydboGtjmbNjeYnCMA0RskGedEJCYGdo4PXmMI7wWY
 hgtUWcN5M4h2fxfmjfH9l91tNdIKCrBgKKTDiAcau8bpoEwM3ApXRlRZJS7g9QOjm2Qo
 YYgw==
X-Gm-Message-State: ACgBeo2X6urjQQ3yUoQSYuYUhbSzdMBMsDIKFN7KEQyJRFpgxJsJKt30
 dT3ey9meeXWUBFjJ8Lj6EPxPLPmx3b287WmSHYDNmwRVlxKRK2ZXlhGHwu5KEtNSK64G9Syuq9N
 OmIWW3TnKZNVeuxvDEFZ4em0hNf8U6PlX5b0a6rIJWHHeyETVdBzhxdO69qU9jrxO6oE=
X-Received: by 2002:a17:907:97cd:b0:731:5d0:4434 with SMTP id
 js13-20020a17090797cd00b0073105d04434mr9360763ejc.603.1659963431787; 
 Mon, 08 Aug 2022 05:57:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/lSvnBl+RSeWTYz3dynJCBIKrtBZ2H6MCL3Uhgd4yGDiKjj93ak02165zqyTttDhrX//yXw==
X-Received: by 2002:a17:907:97cd:b0:731:5d0:4434 with SMTP id
 js13-20020a17090797cd00b0073105d04434mr9360749ejc.603.1659963431433; 
 Mon, 08 Aug 2022 05:57:11 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.144]) by smtp.gmail.com with ESMTPSA id
 en19-20020a056402529300b0043a87e6196esm4518820edb.6.2022.08.08.05.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:57:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 2/5] scsi-disk: ensure block size is non-zero and changes
 limited to bits 8-15
Date: Mon,  8 Aug 2022 14:57:03 +0200
Message-Id: <20220808125706.60511-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
References: <20220808125706.60511-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The existing code assumes that the block size can be generated from p[1] << 8
in multiple places which ignores the top and bottom 8 bits. If the block size
is allowed to be set to an arbitrary value then this causes a mismatch
between the value written by the guest in the block descriptor and the value
subsequently read back using READ CAPACITY causing the guest to generate
requests that can crash QEMU.

For now restrict block size changes to bits 8-15 and also ignore requests to
set the block size to 0 which causes the SCSI emulation to crash in at least
one place with a divide by zero error.

Fixes: 356c4c441e ("scsi-disk: allow MODE SELECT block descriptor to set the block size")
Closes: https://gitlab.com/qemu-project/qemu/-/issues/1112
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220730122656.253448-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 3027ac3b1e..efee6739f9 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1591,7 +1591,7 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     int cmd = r->req.cmd.buf[0];
     int len = r->req.cmd.xfer;
     int hdr_len = (cmd == MODE_SELECT ? 4 : 8);
-    int bd_len;
+    int bd_len, bs;
     int pass;
 
     if ((r->req.cmd.buf[1] & 0x11) != 0x10) {
@@ -1617,9 +1617,19 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     }
 
     /* Allow changing the block size */
-    if (bd_len && p[6] != (s->qdev.blocksize >> 8)) {
-        s->qdev.blocksize = p[6] << 8;
-        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+    if (bd_len) {
+        bs = p[5] << 16 | p[6] << 8 | p[7];
+
+        /*
+         * Since the existing code only checks/updates bits 8-15 of the block
+         * size, restrict ourselves to the same requirement for now to ensure
+         * that a block size set by a block descriptor and then read back by
+         * a subsequent SCSI command will be the same
+         */
+        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
+            s->qdev.blocksize = bs;
+            trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+        }
     }
 
     len -= bd_len;
-- 
2.37.1



