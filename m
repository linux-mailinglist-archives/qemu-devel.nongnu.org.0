Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60518C81B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 08:27:16 +0100 (CET)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFC3n-0000Kn-EB
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 03:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jFC2W-0007qx-Us
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 03:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jFC2V-0000nn-Mq
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 03:25:56 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:54716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jFC2V-0000nE-JC
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 03:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584689154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AqfJaUwyKKozsHj6p3Arn418LsLAi7FzeMOuWBmvhD4=;
 b=MNufcjQ2vsrc4XwWyDAt3kOl7jHyFtXqjwpGqz0Ke/kq+/iwghzbyRYqyEh0cZ0ahMLUwk
 kjbMiGoMoV7R0XXabBD3qFJEEYGSunJ7ZARMUDQNBBAeq2q72qYPSZsEvtkK6VC0CfprU6
 HY9205FDKveiWh/RL1jFskt7pBsqPyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-oW2kei_3O22pDDo9RSO_4w-1; Fri, 20 Mar 2020 03:25:52 -0400
X-MC-Unique: oW2kei_3O22pDDo9RSO_4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895DD107ACC4;
 Fri, 20 Mar 2020 07:25:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 964DB1001925;
 Fri, 20 Mar 2020 07:25:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 724489DB3; Fri, 20 Mar 2020 08:25:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Vga 20200320 patches
Date: Fri, 20 Mar 2020 08:25:46 +0100
Message-Id: <20200320072547.19003-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e6d567db23219fe9979f16d74e13f27145f07f84=
:

  Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request' i=
nto staging (2020-03-19 15:31:09 +0000)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20200320-pull-request

for you to fetch changes up to 02501fc39381c4dabaf6becdd12c2a4754c3847c:

  compat: disable edid on correct virtio-gpu device (2020-03-20 07:50:52 +0=
100)

----------------------------------------------------------------
vga: edid compat fix for virtio-gpu

----------------------------------------------------------------

Cornelia Huck (1):
  compat: disable edid on correct virtio-gpu device

 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.18.2


