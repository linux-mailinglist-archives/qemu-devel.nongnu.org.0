Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EAD115438
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 16:28:16 +0100 (CET)
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idFWh-0004hk-AH
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 10:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1idEkR-0008B0-Vt
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:38:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1idEkQ-0000Qi-U0
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:38:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59027
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1idEkQ-0000P4-4z
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575643101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bIJvzQpnEMApOElCaCk2lLQMQ09zgb2vjn7tNHApnQk=;
 b=GJOUBr/b/NWsPqsxQm6sfWiv2uef8xgf0kJf/A/AJdYPHpBjIQJrmrO5kBph0sxwB0rdIy
 GdPW74u/tcf96E2E3NFzo6a1EHXaEV1VE+lwbPd2Bzns+GSkCz0Nt8vdhibfYEemSuEG91
 d5EQQig4UlxMjibqXx5j/VfuCo3tV/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-w70AkRktMg-X9ARXWebacw-1; Fri, 06 Dec 2019 09:38:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6466B8051BE;
 Fri,  6 Dec 2019 14:38:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 240DC6016D;
 Fri,  6 Dec 2019 14:38:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: better document NVMe blockdev @device parameter
Date: Fri,  6 Dec 2019 14:38:11 +0000
Message-Id: <20191206143811.3777524-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: w70AkRktMg-X9ARXWebacw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mention that this is a PCI device address & give the format it is
expected it. Also mention that it must be first unbound from any
host kernel driver.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 qapi/block-core.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0cf68fea14..fcb52ec24f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2963,9 +2963,13 @@
 #
 # Driver specific block device options for the NVMe backend.
 #
-# @device:    controller address of the NVMe device.
+# @device:    PCI controller address of the NVMe device in
+#             format hhhh:bb:ss.f (host:bus:slot.function)
 # @namespace: namespace number of the device, starting from 1.
 #
+# Note that the PCI @device must have been unbound from any host
+# kernel driver before instructing QEMU to add the blockdev.
+#
 # Since: 2.12
 ##
 { 'struct': 'BlockdevOptionsNVMe',
--=20
2.23.0


