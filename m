Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D525161C3D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 21:19:22 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3mrR-0007iu-Gz
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 15:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1j3moX-0004dJ-EO
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:16:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1j3moW-0003xa-BL
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:16:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20667
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1j3moW-0003w9-7m
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581970579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vq8ck5RZ9xQ4ebnDZ2QLj/sCBOacEgeCGaNxq3US+9g=;
 b=Nh8IAzyqC+3kuaB7gKILyfGOAS089hFpCSE3ftSBluauUL20SAJCuxoQzKX6EqXA98ROu2
 sxXBP77prv03X+KMBicxFrzHAdNZMx0cj/soW/cDs72AS33L7CS4sELGgESMkWgPwPVVsp
 2A1aNo44Gt5kjgE3/3/NPg/0lfO04Vs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-waJtkUuaP-m4sIzBd2O3hQ-1; Mon, 17 Feb 2020 15:16:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A955D801E66;
 Mon, 17 Feb 2020 20:16:16 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 208D45D9E2;
 Mon, 17 Feb 2020 20:16:16 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/6] travis.yml: Fix 'Clang (main-softmmu)' job on Ubuntu
 Bionic
Date: Mon, 17 Feb 2020 15:16:07 -0500
Message-Id: <20200217201609.788825-5-wainersm@redhat.com>
In-Reply-To: <20200217201609.788825-1-wainersm@redhat.com>
References: <20200217201609.788825-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: waJtkUuaP-m4sIzBd2O3hQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: fam@euphon.net, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Ubuntu Bionic environment the build with Clang's sanitizer
fails with error:

```
LINK    tests/qemu-iotests/socket_scm_helper

tests/qemu-iotests/socket_scm_helper.o: In function `send_fd':

/home/travis/build/wainersm/qemu/tests/qemu-iotests/socket_scm_helper.c:53:=
 undefined reference to `__ubsan_handle_type_mismatch_v1'
```

In order to solve that problem it was needed to explicitly pass
'--cxx=3Dclang++' to the configure.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 4089e9672a..59b9eb20b7 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -215,7 +215,7 @@ matrix:
       compiler: clang
       before_script:
         - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags=3D"-fsanitize=3Dun=
defined -Werror" || { cat config.log && exit 1; }
+        - ${SRC_DIR}/configure ${CONFIG} --cc=3Dclang --cxx=3Dclang++ --ex=
tra-cflags=3D"-fsanitize=3Dundefined -Werror" || { cat config.log && exit 1=
; }
=20
=20
     - name: "Clang (other-softmmu)"
--=20
2.24.1


