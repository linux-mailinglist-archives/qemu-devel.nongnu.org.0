Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDE154DE4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:25:02 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izodx-0006lU-JY
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoZR-0007CD-2i
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoZP-0001Mf-VL
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58691
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoZP-0001Kk-RA
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9//qSfsSEYznfx4ZtrCVNTB+uTMFUE/4/3teXfPNJfg=;
 b=DHnDLTUmDan9WvuIzbtalVBJSXjZB4f5QTJmteYJrHGxjGNHwd1Ii0+Kyb5KHLIVckSJMc
 Sc/RSFGj8HnkPnKSg4NdyQv7tjnrl4R4W3QljejBe57CCJXhItgqGfeX+2yQAosNdHFwyh
 hi4FoZr04RdjKO9amXfiSjgPHEFY0yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-tQtZrh3LPFeo5Utx5BPtvw-1; Thu, 06 Feb 2020 16:20:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0A88010CB
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 21:20:16 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B203C60BEC;
 Thu,  6 Feb 2020 21:20:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/46] python/qemu: qmp: Remove unnused attributes
Date: Thu,  6 Feb 2020 22:18:55 +0100
Message-Id: <20200206211936.17098-6-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tQtZrh3LPFeo5Utx5BPtvw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The `error` and `timeout` attributes in QEMUMonitorProtocol are
not used, so this delete them.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20191227134101.244496-6-wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 python/qemu/qmp.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 486a566da0..4b9a362240 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -45,10 +45,6 @@ class QEMUMonitorProtocol:
=20
     #: Logger object for debugging messages
     logger =3D logging.getLogger('QMP')
-    #: Socket's error class
-    error =3D socket.error
-    #: Socket's timeout
-    timeout =3D socket.timeout
=20
     def __init__(self, address, server=3DFalse):
         """
--=20
2.21.1


