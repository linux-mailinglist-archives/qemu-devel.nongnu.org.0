Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A79115202
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:08:38 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idEHc-0001bM-F4
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1idEGC-0000oX-He
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:07:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1idEG9-0006gu-Si
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:07:06 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47889
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1idEG9-0006fV-Kj
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575641224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uL6xgSKpIW04lcKl/oQ5qUW1xPRml+iMeURzo8n7Duk=;
 b=bpXWIkXk9Sg2aiT/LYF/eNws+z1vt7cCJb7sXDsc3PDLMdlOmxZcm9OTylOXkeXTM6E41J
 BFFTsHYjHpL5W0iCWNUJBXSVHT+0cGel0T0zDr9HalvyVqizI760A79Thj3eDXYj9CKyVa
 fYipGMFH/AxbpB8DDPBItwi+Pxh1YUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-_sgUj_zxOxivOOt7eiW6Uw-1; Fri, 06 Dec 2019 09:00:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 961C81856A6C;
 Fri,  6 Dec 2019 14:00:18 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0DD160FC1;
 Fri,  6 Dec 2019 14:00:17 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] .travis.yml: Add kernel build deps for acceptance tests
Date: Fri,  6 Dec 2019 09:00:12 -0500
Message-Id: <20191206140012.15517-3-wainersm@redhat.com>
In-Reply-To: <20191206140012.15517-1-wainersm@redhat.com>
References: <20191206140012.15517-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _sgUj_zxOxivOOt7eiW6Uw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: fam@euphon.net, alex.bennee@linaro.org, wrampazz@redhat.com,
 crosa@redhat.com, philmd@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests/acceptance/pvh.py test builds the Linux kernel
at runtime so it needs dependencies installed in the
container. Current used container image misses only
libelf-dev, which is then added with this change.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 .travis.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 445b0646c1..d8fe98eb63 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -277,6 +277,8 @@ matrix:
             - python3.5-venv
             - tesseract-ocr
             - tesseract-ocr-eng
+            # Additional kernel build dependencies
+            - libelf-dev
=20
=20
     # Using newer GCC with sanitizers
--=20
2.21.0


