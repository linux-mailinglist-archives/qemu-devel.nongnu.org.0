Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6172DE1B6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:04:54 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDZ7-00054p-AB
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCh-0003HN-Gn
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCe-0004ZV-Kk
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiuSidoZ4b3nzeLi7xd9yoxYKpdJwxFrBO3uu3stHxo=;
 b=KXoTMwtOn/pIURoyKR0a1DwiuXWrVl/JoLWV9CakZcmHsDfWm47faiH2OvUHdUX7a/SCM6
 u4b9PaBLfKJynxYUOLYSiX5MB8SiIPkNMKaq22/dbhjLQPijmDiIpp9vwZcT3CJCLzZuZa
 F+vTsmyP6lNAdlAGi9n4TevHx+yJRp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-CZi41f2OOCCa3NWcj05f6w-1; Fri, 18 Dec 2020 05:41:35 -0500
X-MC-Unique: CZi41f2OOCCa3NWcj05f6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970C5107ACE3;
 Fri, 18 Dec 2020 10:41:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C9B60C15;
 Fri, 18 Dec 2020 10:41:32 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 04/15] hmp-commands.hx: List abbreviation after command for
 cont, quit, print
Date: Fri, 18 Dec 2020 10:41:06 +0000
Message-Id: <20201218104117.199096-5-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We have four HMP commands which have a single-character abbreviated
version: cont ('c'), quit ('q'), print ('p') and help ('h').  For
cont, quit and print, we list the abbreviation first in the help
documentation and the command name.  This has the odd effect that in
the full 'help' command list these commands end up sorted out of
alphabetical order (they end up after all the other commands that
start with the same letter).  As it happens, the only place this
currently changes the order is for 'cont'.

Abbreviation first is also not a very logical order, and it doesn't
match what we use for 'help' (which is 'help|?').  Put the full
command name first in both the help text and the .name field for
cont, quit and print.

Fixes: https://bugs.launchpad.net/qemu/+bug/1614609
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201121151711.20783-1-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands.hx | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 470a420c2d..73e0832ea1 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -40,7 +40,7 @@ SRST
 ERST
 
     {
-        .name       = "q|quit",
+        .name       = "quit|q",
         .args_type  = "",
         .params     = "",
         .help       = "quit the emulator",
@@ -49,7 +49,7 @@ ERST
     },
 
 SRST
-``q`` or ``quit``
+``quit`` or ``q``
   Quit the emulator.
 ERST
 
@@ -401,7 +401,7 @@ SRST
 ERST
 
     {
-        .name       = "c|cont",
+        .name       = "cont|c",
         .args_type  = "",
         .params     = "",
         .help       = "resume emulation",
@@ -409,7 +409,7 @@ ERST
     },
 
 SRST
-``c`` or ``cont``
+``cont`` or ``c``
   Resume emulation.
 ERST
 
@@ -554,7 +554,7 @@ SRST
 ERST
 
     {
-        .name       = "p|print",
+        .name       = "print|p",
         .args_type  = "fmt:/,val:l",
         .params     = "/fmt expr",
         .help       = "print expression value (use $reg for CPU register access)",
@@ -562,7 +562,7 @@ ERST
     },
 
 SRST
-``p`` or ``print/``\ *fmt* *expr*
+``print`` or ``p/``\ *fmt* *expr*
   Print expression value. Only the *format* part of *fmt* is
   used.
 ERST
-- 
2.29.2


