Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D49157F3B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 16:52:39 +0100 (CET)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1BMU-0006XP-Mn
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 10:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1j1BLd-0005om-6y
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 10:51:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1j1BLa-0005Lk-U4
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 10:51:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54619
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1j1BLa-0005LM-QT
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 10:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581349901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B428S6t7fwDA1FdsGpLCSaitq94UQfprQMXKrS97/So=;
 b=CABuIaEe61SocFL7oHj95OZrxxan6u8KcqH31h6vZPc+X7XGJIe4sP6BELmwKqjZ24jPbb
 nUzVT1UQ30yRdDpT/D+ck4ETmKwMXnyAf6GyzuS4bgx80IawjpKdkLWT0gEofCPt+tQRgP
 hE4TlZIqsVowwNR/2b8IQMArQx77Fq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-pFnRvKdSMMSXE333sxmiFA-1; Mon, 10 Feb 2020 10:51:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1275A10753F3;
 Mon, 10 Feb 2020 15:51:25 +0000 (UTC)
Received: from thuth.com (ovpn-116-219.ams2.redhat.com [10.36.116.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9139977958;
 Mon, 10 Feb 2020 15:51:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add Philippe,
 Alex and Wainer to the Gitlab-CI section
Date: Mon, 10 Feb 2020 16:51:15 +0100
Message-Id: <20200210155115.9371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: pFnRvKdSMMSXE333sxmiFA-1
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initially, I was the only one who was using Gitlab while most developers
had their git trees still on other systems, but that has changed nowadays.
There is now much more interest in the Gitlab-CI today, so it would be
good to have more than only one maintainer / reviewer for the gitlab-ci.yml
file. Alex, Wainer and Philippe kindly offered their help here, so let's
add them to the corresponding section in the MAINTAINERS file now.

Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Cc: Wainer Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e72b5e5f69..64ef7a1906 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2743,6 +2743,9 @@ W: https://cirrus-ci.com/github/qemu/qemu
=20
 GitLab Continuous Integration
 M: Thomas Huth <thuth@redhat.com>
+M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
+R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Maintained
 F: .gitlab-ci.yml
=20
--=20
2.18.1


