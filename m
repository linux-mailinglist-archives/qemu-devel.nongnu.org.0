Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0FFE298
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:20:10 +0100 (CET)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVeKO-0004Kc-Rv
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iVeEm-000722-T5
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:14:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iVeEk-0002yN-SC
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:14:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36366
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iVeEk-0002xr-OT
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573834457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOwlAYHOTjYOMcGKDZ8yJvfBbJmA7j/FyCrJYrukFS8=;
 b=Ht0IsBH9Q9AQ+4KGYHP0uAXI7TM5aDDRrwwjmDRbq93Tl7NS5mvJoZ+Ba5Vyb3P06+k8rk
 pJSW8n0uDJ9cq8CrKbDXcDc4UjWNVmzrgXo6Cn83BHIimuUgB1msMqepDSO6T0vLgsquxD
 kwvz7E/Tt65zxSTe1TPCXv38VJZrNWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-e8q_RBReNO2_nEyTthrbvw-1; Fri, 15 Nov 2019 11:13:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 539EF8EF28A
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 16:13:44 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 505005E263;
 Fri, 15 Nov 2019 16:13:43 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] docs/microvm.rst: fix alignment in "Limitations"
Date: Fri, 15 Nov 2019 17:13:37 +0100
Message-Id: <20191115161338.42864-2-slp@redhat.com>
In-Reply-To: <20191115161338.42864-1-slp@redhat.com>
References: <20191115161338.42864-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: e8q_RBReNO2_nEyTthrbvw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the alignment of the items in the "Limitations" section.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 docs/microvm.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/microvm.rst b/docs/microvm.rst
index aae811a922..4cf84746b9 100644
--- a/docs/microvm.rst
+++ b/docs/microvm.rst
@@ -33,9 +33,9 @@ Limitations
=20
 Currently, microvm does *not* support the following features:
=20
- - PCI-only devices.
- - Hotplug of any kind.
- - Live migration across QEMU versions.
+- PCI-only devices.
+- Hotplug of any kind.
+- Live migration across QEMU versions.
=20
=20
 Using the microvm machine type
--=20
2.23.0


