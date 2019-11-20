Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97AA103ECA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 16:33:29 +0100 (CET)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXRyy-0007qi-GA
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 10:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iXRr9-0006tc-FC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:25:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iXRr8-00062b-DZ
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:25:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56881
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iXRr8-000619-9K
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574263521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mf236o4Q1vWCoYU4IYZ8YS4BnDMpC15gQm/zl+Bmt4=;
 b=Z/vO+nrIBFIfc+crHzkXSkTMJBJiBuU+WXagGjSzX3QXDby/BkOEfr3jqBWeptwj8xyFrK
 sTmYRiJ4pTp9RW/hFqjRk4v7lbqvE9r15uSWxV0Fm9u1g1tH5DOJ5HSrWhu7LSflnHV/7U
 f4tLvGJgTXaH02Nd448A/7uweMw23mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-MqghrysfPhaVRs6xFR1z-A-1; Wed, 20 Nov 2019 10:25:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A92100550E;
 Wed, 20 Nov 2019 15:25:19 +0000 (UTC)
Received: from localhost (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B2C46E76;
 Wed, 20 Nov 2019 15:25:17 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/37] sysbus: remove outdated comment
Date: Wed, 20 Nov 2019 19:24:08 +0400
Message-Id: <20191120152442.26657-4-marcandre.lureau@redhat.com>
In-Reply-To: <20191120152442.26657-1-marcandre.lureau@redhat.com>
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: MqghrysfPhaVRs6xFR1z-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The init callback is no more since commit
817a17fc60f44e29a1944b60d32f45ea127f0cf9 ("core/sysbus: remove the
SysBusDeviceClass::init path")

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/sysbus.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 2eb0484388..c4a1c0adfa 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -24,10 +24,6 @@ typedef struct SysBusDevice SysBusDevice;
=20
 /**
  * SysBusDeviceClass:
- * @init: Callback function invoked when the #DeviceState.realized propert=
y
- * is changed to %true. Deprecated, new types inheriting directly from
- * TYPE_SYS_BUS_DEVICE should use #DeviceClass.realize instead, new leaf
- * types should consult their respective parent type.
  *
  * SysBusDeviceClass is not overriding #DeviceClass.realize, so derived
  * classes overriding it are not required to invoke its implementation.
--=20
2.24.0


