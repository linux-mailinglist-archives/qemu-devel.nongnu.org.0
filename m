Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C612B4ED
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Dec 2019 14:47:04 +0100 (CET)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikpxH-0003D3-42
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 08:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ikprl-0006Sd-7E
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ikprj-0003Cx-1D
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60785
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ikpri-0003BI-UJ
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577454077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/g0/t8tWVEaHSz/dulzIlsqxeIhd6paNZMvmjPyJhI=;
 b=ItWXsap9m5cWh9rAHfRvJryvBOEQzxDZcuQB62XkCFYsFct3MYmHxTyUxWZu07rv0fD+5A
 HrVxyUVek+XNgpX0c+30THA54CWIoep9U+LssYQnsSGZ42ccDIDW3UfgB38x4vJdm7qjZg
 B2JZKYVVUan2mS3uE0V5cJ1q/7hVA7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-YwYLRECYPSSJXv11M6rf_g-1; Fri, 27 Dec 2019 08:41:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA68800D48
 for <qemu-devel@nongnu.org>; Fri, 27 Dec 2019 13:41:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-24.gru2.redhat.com
 [10.97.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A49B81C00;
 Fri, 27 Dec 2019 13:41:13 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] python/qemu: qmp: Remove unnused attributes
Date: Fri, 27 Dec 2019 10:41:01 -0300
Message-Id: <20191227134101.244496-6-wainersm@redhat.com>
In-Reply-To: <20191227134101.244496-1-wainersm@redhat.com>
References: <20191227134101.244496-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: YwYLRECYPSSJXv11M6rf_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The `error` and `timeout` attributes in QEMUMonitorProtocol are
not used, so this delete them.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/qmp.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 6d55f53595..cddb94bb3c 100644
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
2.23.0


