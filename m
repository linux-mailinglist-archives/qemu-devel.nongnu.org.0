Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAEFF451F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 11:57:55 +0100 (CET)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT1xh-0001O7-VX
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 05:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iT1we-0000cq-Mx
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iT1wd-0001Si-IJ
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:56:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46032
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iT1uh-0000Tk-By
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573210486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8cgCck1b1/AVPG1uORZy1QC/lvtdExRjsiyYw+1YUVI=;
 b=gG4h/EqsNKxT+vcZ0iPCSR24JdF1eKNv3fQuP4itT3/BYyM+eqly6mAmfklwOP2cxf1j2b
 4wFt7su9TthHgiubgJ5lhjZ8v1xGKB1rNNvudLiUlN4BU6z/CeJsIAR9XMwpkDNYpCQFiI
 kci+46ScGZx8sWSd7XF4zieyLsWpAyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-IiBTYAqRPXmFnsSwXdJrHA-1; Fri, 08 Nov 2019 05:54:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 252D31800D7B
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 10:54:43 +0000 (UTC)
Received: from localhost (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 255EB60BE1;
 Fri,  8 Nov 2019 10:54:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v3] documentation: link to nightly documentation
Date: Fri,  8 Nov 2019 11:54:35 +0100
Message-Id: <20191108105435.403161-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: IiBTYAqRPXmFnsSwXdJrHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Link to the documentation built from qemu.git/master once a day.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v3:
 * Use a qemu.org URL, not a wiki.qemu.org URL [danpb]
v2:
 * This revision was broken - please ignore! :)
---
 documentation.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation.md b/documentation.md
index f4ef9f4..5198e02 100644
--- a/documentation.md
+++ b/documentation.md
@@ -3,6 +3,8 @@ title: QEMU documentation
 permalink: /documentation/
 ---
=20
+The latest development version documentation is available [here](https://q=
emu.org/docs/master/index.html).
+
 The [QEMU user manual](https://qemu.weilnetz.de/qemu-doc.html) can be read=
 online, courtesy of Stefan Weil.
 More documentation is found in the <a href=3D"https://git.qemu.org/?p=3Dqe=
mu.git;a=3Dtree;f=3Ddocs;hb=3Dmaster">`docs`</a>
 directory of the QEMU git tree.
--=20
2.23.0


