Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D90817D2D9
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Mar 2020 10:26:05 +0100 (CET)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAsCC-00049c-3B
	for lists+qemu-devel@lfdr.de; Sun, 08 Mar 2020 05:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jAsB5-0002by-Nx
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 05:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jAsB3-0008PH-HS
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 05:24:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49326
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jAsB3-0008Oj-Ec
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 05:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583659492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZ9hXAgel0JCQem0cV9DcJj66tjzrqDTdBjSfttmMJw=;
 b=PoHxHaWmZwcCDdeVYvJDGSFELFH/QkLomTtGXRFDRzhiEl1NtbdD6vo4VvLoLQk1wfzxAK
 42xP1nLaEn/3p1KzToZsZLHsKAAVmzN0S6WwEDVK1iD3zCreh6Zq6i/GeeIZugtLa3ZiRm
 fnsLL93ijFvWH8505zNpXRyVo1iTx4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-kif1jvKhPRumLhx98vGoEg-1; Sun, 08 Mar 2020 05:24:50 -0400
X-MC-Unique: kif1jvKhPRumLhx98vGoEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B20A08017CC;
 Sun,  8 Mar 2020 09:24:49 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8651B10027B8;
 Sun,  8 Mar 2020 09:24:47 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/11] usb/dev-storage: remove unused include
Date: Sun,  8 Mar 2020 11:24:30 +0200
Message-Id: <20200308092440.23564-2-mlevitsk@redhat.com>
In-Reply-To: <20200308092440.23564-1-mlevitsk@redhat.com>
References: <20200308092440.23564-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/dev-storage.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 90da008df1..5629213d55 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -19,7 +19,6 @@
 #include "hw/scsi/scsi.h"
 #include "ui/console.h"
 #include "migration/vmstate.h"
-#include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 #include "qapi/visitor.h"
--=20
2.17.2


