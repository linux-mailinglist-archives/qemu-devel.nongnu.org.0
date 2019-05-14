Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E31CF43
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:40:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQcLg-00028I-2Z
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:40:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHH-000754-3M
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHG-0001Zx-4g
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQcHF-0001ZI-Vr
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D5DA307EA8E;
	Tue, 14 May 2019 18:35:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
	[10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8860608A6;
	Tue, 14 May 2019 18:35:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
	ehabkost@redhat.com, richardw.yang@linux.intel.com,
	yury-kotov@yandex-team.ru, chen.zhang@intel.com
Date: Tue, 14 May 2019 19:34:45 +0100
Message-Id: <20190514183454.12758-8-dgilbert@redhat.com>
In-Reply-To: <20190514183454.12758-1-dgilbert@redhat.com>
References: <20190514183454.12758-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 14 May 2019 18:35:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/16] migration/colo.h: Remove obsolete codes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Message-Id: <20190426090730.2691-3-chen.zhang@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/colo.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index ddebe0ad27..f6fbe23ec9 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -22,8 +22,6 @@ enum colo_event {
     COLO_EVENT_FAILOVER,
 };
=20
-void colo_info_init(void);
-
 void migrate_start_colo_process(MigrationState *s);
 bool migration_in_colo_state(void);
=20
--=20
2.21.0


