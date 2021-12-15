Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D44758B7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:20:32 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTGp-0001lw-CR
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:20:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT9M-0001yb-Qq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT9K-0008Ap-OE
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639570366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBOIWkJi/Q3jdVgCHyFqQtp2PCTkyBPVQLBs0qKc5Zo=;
 b=e7yrKm8KCle5lNlquDhjJxO1ac29BgqX5gAaNsm6KEnvZee1MEPr1wRhsCSbVoSbVzf9pT
 mvNMGhCqSE5gCP8sPiTDdCztxLIkHBDH9+hs9F88oAp8w+6Pj1lfQhAg60/Ofv0aylgH22
 +3697FoxnhtxGPKIZnjpV4lbYm1Cbak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-8sJGo7jtPoehFXAj60PCpA-1; Wed, 15 Dec 2021 07:12:45 -0500
X-MC-Unique: 8sJGo7jtPoehFXAj60PCpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA611054F92;
 Wed, 15 Dec 2021 12:12:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 687147A446;
 Wed, 15 Dec 2021 12:12:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/3] include/sysemu/blockdev.h: remove drive_get_max_devs
Date: Wed, 15 Dec 2021 07:11:40 -0500
Message-Id: <20211215121140.456939-4-eesposit@redhat.com>
In-Reply-To: <20211215121140.456939-1-eesposit@redhat.com>
References: <20211215121140.456939-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove drive_get_max_devs, as it is not used by anyone.

Last use was removed in commit 8f2d75e81d5
("hw: Drop superfluous special checks for orphaned -drive").

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockdev.c                | 17 -----------------
 include/sysemu/blockdev.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 9839e234cb..5f332c6ebd 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -168,23 +168,6 @@ void blockdev_auto_del(BlockBackend *blk)
     }
 }
 
-/**
- * Returns the current mapping of how many units per bus
- * a particular interface can support.
- *
- *  A positive integer indicates n units per bus.
- *  0 implies the mapping has not been established.
- * -1 indicates an invalid BlockInterfaceType was given.
- */
-int drive_get_max_devs(BlockInterfaceType type)
-{
-    if (type >= IF_IDE && type < IF_COUNT) {
-        return if_max_devs[type];
-    }
-
-    return -1;
-}
-
 static int drive_index_to_bus_id(BlockInterfaceType type, int index)
 {
     int max_devs = if_max_devs[type];
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index b236425c6e..9e4c68b6ca 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -48,7 +48,6 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
-int drive_get_max_devs(BlockInterfaceType type);
 DriveInfo *drive_get_next(BlockInterfaceType type);
 
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
-- 
2.31.1


