Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF162AD597
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:47:58 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcS7x-0000u7-4V
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRpx-0007LN-KP
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRpr-0001bY-T6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605007755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//Az4ERp8yyXlWNcKo63DhWsemnd2oKmdKT/iH/voHo=;
 b=iITIFkZRDK1XrNRhCw5zLxQTuS6jL332JxpwUKrD8r9+kl3GigmzXaMT2u6RDfFic28xU+
 +xwCiLiPWwiK9gOY9YmMF4/pmP38KD+h52Dku1siNsvaZCmMqRNdxTLNw6PHUGD2NAtJZH
 Gx7/kks/kHUBMoVdsSDaIrzGOAVVxws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-IoIW3iTBMcC6mZBnown7gg-1; Tue, 10 Nov 2020 06:29:13 -0500
X-MC-Unique: IoIW3iTBMcC6mZBnown7gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C2A809DE0;
 Tue, 10 Nov 2020 11:29:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B980626345;
 Tue, 10 Nov 2020 11:29:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] replay: remove some dead code
Date: Tue, 10 Nov 2020 06:29:06 -0500
Message-Id: <20201110112909.1103518-4-pbonzini@redhat.com>
In-Reply-To: <20201110112909.1103518-1-pbonzini@redhat.com>
References: <20201110112909.1103518-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch removes dead code in replay_continue_stop() function.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <160455661411.3455.4177953912304752892.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay-debugging.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index ee9e86daa9..1d6a968406 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -278,7 +278,6 @@ static void replay_continue_stop(void *opaque)
             replay_continue_end();
         }
         replay_last_snapshot = replay_get_current_icount();
-        return;
     } else {
         /* Seek to the very first step */
         replay_seek(0, replay_stop_vm_debug, &err);
@@ -286,9 +285,7 @@ static void replay_continue_stop(void *opaque)
             error_free(err);
             replay_continue_end();
         }
-        return;
     }
-    replay_continue_end();
 }
 
 bool replay_reverse_continue(void)
-- 
2.26.2



