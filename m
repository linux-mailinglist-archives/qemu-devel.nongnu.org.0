Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F8161C35
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 21:17:55 +0100 (CET)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3mq2-0005m6-3s
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 15:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1j3moX-0004dU-Dm
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:16:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1j3moW-0003xt-JR
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:16:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42628
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1j3moW-0003xQ-FQ
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581970580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnIw8Q5InPObshax4SFmaQ72ZN8V6mFV2+ZB5oKjEsk=;
 b=X2nj557HsoOwquEJdveRAI+O3rgeYal9GdpJTA/t5YF4LShjFKGYBPu1NyPzLmaCFjhROa
 tLQVDgkcU6wHTtP7x5qnLOjh7c4G7pBn6PgpfCRmkmseXTIyzsuKlZXOJ4UgBkrG2XPuLz
 2bIsE+Eg9sTrY5zyjUDg53UVkPpXvmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-MQgSu1Z0MUuYtAAFTf8_Fg-1; Mon, 17 Feb 2020 15:16:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6A118CA241;
 Mon, 17 Feb 2020 20:16:15 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6773D5D9E2;
 Mon, 17 Feb 2020 20:16:15 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/6] travis.yml: Fix 'GCC check-acceptance' job on Ubuntu
 Bionic
Date: Mon, 17 Feb 2020 15:16:06 -0500
Message-Id: <20200217201609.788825-4-wainersm@redhat.com>
In-Reply-To: <20200217201609.788825-1-wainersm@redhat.com>
References: <20200217201609.788825-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MQgSu1Z0MUuYtAAFTf8_Fg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: fam@euphon.net, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ubuntu Bionic does not provide python3.5-venv and then
the 'GCC check-acceptance' job was changed to use python3.6-venv.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 232f84d196..4089e9672a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -323,7 +323,7 @@ matrix:
           packages:
             - python3-pil
             - python3-pip
-            - python3.5-venv
+            - python3.6-venv
             - rpm2cpio
             - tesseract-ocr
             - tesseract-ocr-eng
--=20
2.24.1


