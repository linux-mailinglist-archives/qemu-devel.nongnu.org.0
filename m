Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FC64C731
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi7-0007hd-3R; Wed, 14 Dec 2022 05:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohu-0007cV-SE
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-00018W-33
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHIes2pzkcfTQ+dXBIJhpv7FL9o7l+cY6fDfdYvtrm4=;
 b=UxbhAjr3+f0HOZLTIF5aj6vzprJ08uylsGdk7EoSt6yJ9jnzhFXZaetnanGADdONAGJktC
 GrzkX72TKZtbuBtvUtOjC3dYtDTBCu1c2Qr/SWI2sMOUfeOX7sy9q+I/g+PWXamnpP8d4R
 wc0V4QcNRDTo6acOZxMYPflwSIxw60Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445--Lxsl8zsO6a-9jUQs_SjYA-1; Wed, 14 Dec 2022 05:09:26 -0500
X-MC-Unique: -Lxsl8zsO6a-9jUQs_SjYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB579181E3F2
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 10:09:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4F8492C14;
 Wed, 14 Dec 2022 10:09:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL 06/23] monitor/misc: Remove superfluous include statements
Date: Wed, 14 Dec 2022 11:08:54 +0100
Message-Id: <20221214100911.165291-7-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These #includes are not required anymore (the likely got superfluous
with commit da76ee76f7 - "hmp-commands-info: move info_cmds content
out of monitor.c").

Message-Id: <20221128133514.220919-1-thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 monitor/misc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 205487e2b9..e2c017d69c 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -25,10 +25,8 @@
 #include "qemu/osdep.h"
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
-#include "hw/usb.h"
 #include "hw/pci/pci.h"
 #include "sysemu/watchdog.h"
-#include "hw/loader.h"
 #include "exec/gdbstub.h"
 #include "net/net.h"
 #include "net/slirp.h"
@@ -39,16 +37,13 @@
 #include "ui/input.h"
 #include "audio/audio.h"
 #include "disas/disas.h"
-#include "sysemu/balloon.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "authz/list.h"
 #include "qapi/util.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/tpm.h"
 #include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
@@ -77,7 +72,6 @@
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
-#include "sysemu/cpus.h"
 #include "qemu/cutils.h"
 
 #if defined(TARGET_S390X)
-- 
2.31.1


