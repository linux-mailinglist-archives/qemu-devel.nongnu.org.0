Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722F5F1055
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:57:23 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJKE-0003X5-5W
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFg-0006JK-TF
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFe-0006bI-VA
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtC+bYqylEWZqUE3sXcCHnbwV3E91M1xWus5hdYfSQw=;
 b=X1KCcU01RZDpUzo/qDzAZhijB3uZ3zffvc0fuDKUwGxl9458YhMdm2Tptc588EzfriUagh
 EcLXKuZ1K2QjKA8w0+4g+aBovZ6NiLdTCOTGWw4RDDvOW5iB87WcaYEfvKX5BaogDARSx6
 jas6S6kMgQ/x4gd7iDksQdCLsHl+eW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-Dm2pV7hENF2UoLo9FCSyIg-1; Fri, 30 Sep 2022 12:52:36 -0400
X-MC-Unique: Dm2pV7hENF2UoLo9FCSyIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01D042A5954A;
 Fri, 30 Sep 2022 16:52:36 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4132C17583;
 Fri, 30 Sep 2022 16:52:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 02/18] block/qcow2-bitmap: Add missing cast to silent GCC error
Date: Fri, 30 Sep 2022 18:52:06 +0200
Message-Id: <20220930165222.249716-3-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit d1258dd0c8 ("qcow2: autoloading dirty bitmaps") added the
set_readonly_helper() GFunc handler, correctly casting the gpointer
user_data in both the g_slist_foreach() caller and the handler.
Few commits later (commit 1b6b0562db), the handler is reused in
qcow2_reopen_bitmaps_rw() but missing the gpointer cast, resulting
in the following error when using Homebrew GCC 12.2.0:

  [2/658] Compiling C object libblock.fa.p/block_qcow2-bitmap.c.o
  ../../block/qcow2-bitmap.c: In function 'qcow2_reopen_bitmaps_rw':
  ../../block/qcow2-bitmap.c:1211:60: error: incompatible type for argument 3 of 'g_slist_foreach'
   1211 |     g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
        |                                                            ^~~~~
        |                                                            |
        |                                                            _Bool
  In file included from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gmain.h:26,
                   from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/giochannel.h:33,
                   from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib.h:54,
                   from /Users/philmd/source/qemu/include/glib-compat.h:32,
                   from /Users/philmd/source/qemu/include/qemu/osdep.h:144,
                   from ../../block/qcow2-bitmap.c:28:
  /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gslist.h:127:61: note: expected 'gpointer' {aka 'void *'} but argument is of type '_Bool'
    127 |                                           gpointer          user_data);
        |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
  At top level:
  FAILED: libblock.fa.p/block_qcow2-bitmap.c.o

Fix by adding the missing gpointer cast.

Fixes: 1b6b0562db ("qcow2: support .bdrv_reopen_bitmaps_rw")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220919182755.51967-1-f4bug@amsat.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index ff3309846c..7197754843 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1208,7 +1208,7 @@ int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp)
         }
     }
 
-    g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
+    g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, (gpointer)false);
     ret = 0;
 
 out:
-- 
2.37.3


