Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6AF3B168C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:13:35 +0200 (CEST)
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyww-0006Iw-Mf
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyvO-0004LE-F5
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyvM-0007yp-4C
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624439514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ADh6S6P5NuVzxmN0sSCjIkzFo6ay+nGwJtyBtaP/snU=;
 b=QJOQQ6sh5fBHqODGCZBrcI6Lzmk3x0/Eog3mhZnrQSz9fuwSOsqRAefjrX24xSwd3+5agf
 Eh1D819Ins0w7JKcbaGYJjAfKvU5IKWJWKTyGsJ+TH7rSsg3qOuQXXjDESHWOJzx96tqTj
 VQ5NVQY7so0bFWBLTl2uwl42i/rQY9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-e6CD3hLgMAGkZxnJm2fY9w-1; Wed, 23 Jun 2021 05:11:51 -0400
X-MC-Unique: e6CD3hLgMAGkZxnJm2fY9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2600318D6A2A;
 Wed, 23 Jun 2021 09:11:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4011B60854;
 Wed, 23 Jun 2021 09:11:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 57EFE18007AD; Wed, 23 Jun 2021 11:11:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] [RfC] build windows installers in ci
Date: Wed, 23 Jun 2021 11:11:34 +0200
Message-Id: <20210623091137.1156959-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Side product of making usb-host work on windows.=0D
=0D
I'll go disappear into my summer vacation soon,=0D
so posting my current state as RfC.=0D
=0D
If someone feels like picking this up feel free=0D
to do so.  Otherwise I'll go continue this when=0D
I'm back, but it most likely wouldn't make it=0D
into the 6.1 release then.=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (3):=0D
  ci: build & store windows installer=0D
  [hack] scripts/copy-dlls=0D
  ci: build & store guest agent msi=0D
=0D
 .gitlab-ci.d/crossbuild-template.yml          |  7 +++=0D
 .gitlab-ci.d/crossbuilds.yml                  |  8 +++=0D
 scripts/copy-dlls                             | 56 +++++++++++++++++++=0D
 .../dockerfiles/fedora-win32-cross.docker     |  1 +=0D
 .../dockerfiles/fedora-win64-cross.docker     |  2 +=0D
 5 files changed, 74 insertions(+)=0D
 create mode 100755 scripts/copy-dlls=0D
=0D
--=20=0D
2.31.1=0D
=0D


