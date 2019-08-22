Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60A99897
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 17:55:00 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0pQR-00045Z-HX
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 11:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i0pOt-0002dh-8T
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 11:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i0pOs-0003hk-58
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 11:53:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1i0pOm-0003dA-3N; Thu, 22 Aug 2019 11:53:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 279F930B2502;
 Thu, 22 Aug 2019 15:53:14 +0000 (UTC)
Received: from localhost (ovpn-116-61.ams2.redhat.com [10.36.116.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BFBD5DC1E;
 Thu, 22 Aug 2019 15:53:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 16:53:00 +0100
Message-Id: <20190822155302.20916-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 22 Aug 2019 15:53:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Block patches
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 33f18cf7dca7741d3647d514040904ce83edd7=
3d:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20190821-pull-r=
equest' into staging (2019-08-21 15:18:50 +0100)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 5d4c1ed3d46d7e2010b389fe5f3376f605182ab0:

  vhost-user-scsi: prevent using uninitialized vqs (2019-08-22 16:52:23 +=
0100)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Raphael Norwitz (1):
  vhost-user-scsi: prevent using uninitialized vqs

Stefan Hajnoczi (1):
  util/async: hold AioContext ref to prevent use-after-free

 hw/scsi/vhost-user-scsi.c | 2 +-
 util/async.c              | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

--=20
2.21.0


