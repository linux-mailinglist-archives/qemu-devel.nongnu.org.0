Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B82DF24
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 16:05:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVzCR-0001CM-Ek
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 10:05:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVzA9-00009c-6J
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVzA8-0003Ei-8l
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:02:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVzA2-00030e-3m; Wed, 29 May 2019 10:02:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B9BFB0AA6;
	Wed, 29 May 2019 14:02:12 +0000 (UTC)
Received: from x1w.bcn.redhat.com (unknown [10.32.224.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ECA32CFE2;
	Wed, 29 May 2019 14:02:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <claudio.fontana@gmail.com>
Date: Wed, 29 May 2019 16:02:07 +0200
Message-Id: <20190529140207.20719-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 29 May 2019 14:02:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] MAINTAINERS: Remove bouncing email in AArch64
 target
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana's email at Huawei is bouncing: remove it.

    From: Mail Delivery Subsystem <mailer-daemon@googlemail.com>
    Auto-Submitted: auto-replied
    Subject: Delivery Status Notification (Failure)
    X-Failed-Recipients: claudio.fontana@huawei.com
    ** Address not found **
    Your message wasn't delivered to claudio.fontana@huawei.com because t=
he address couldn't be found, or is unable to receive mail.

Note that the section still contains his personal email.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f5f8b7a2c..5ed917329d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2290,7 +2290,6 @@ S: Maintained
 F: tcg/
=20
 AArch64 target
-M: Claudio Fontana <claudio.fontana@huawei.com>
 M: Claudio Fontana <claudio.fontana@gmail.com>
 S: Maintained
 L: qemu-arm@nongnu.org
--=20
2.20.1


