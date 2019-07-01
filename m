Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035C38C18
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZFOf-0005bl-9p
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hZFKa-0001Qd-18
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:54:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hZFKY-00032C-VZ
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:54:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hZFKO-0002Yb-4N; Fri, 07 Jun 2019 09:54:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09F453001A63;
 Fri,  7 Jun 2019 13:54:38 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5A631001B08;
 Fri,  7 Jun 2019 13:54:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 15:54:21 +0200
Message-Id: <20190607135430.22149-2-kwolf@redhat.com>
In-Reply-To: <20190607135430.22149-1-kwolf@redhat.com>
References: <20190607135430.22149-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 07 Jun 2019 13:54:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH 01/10] monitor: Remove unused password
 prompting fields
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 788cf9f8c removed the code for password prompting from the
monitor. Since then, the Monitor fields password_completion_cb and
password_opaque have been unused. Remove them.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/monitor.c b/monitor.c
index 6428eb3b7e..70ce9e8a77 100644
--- a/monitor.c
+++ b/monitor.c
@@ -220,8 +220,6 @@ struct Monitor {
=20
     MonitorQMP qmp;
     gchar *mon_cpu_path;
-    BlockCompletionFunc *password_completion_cb;
-    void *password_opaque;
     mon_cmd_t *cmd_table;
     QTAILQ_ENTRY(Monitor) entry;
=20
--=20
2.20.1


