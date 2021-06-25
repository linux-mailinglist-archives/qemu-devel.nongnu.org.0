Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685163B43A3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlNl-000129-SO
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwlMF-00074r-IN
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwlMC-0004LW-S7
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624625691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/G7frXQdauR3pTqtKxxAFRBTFsFNVe7X61r+2XV4WkE=;
 b=XasyiXRxnPIEN9alPQnSE9ZeO4doIj/of4GdZ2c8a3fwCSf1flhS/+MM+9OaD2AyUpU0qD
 1mGSSUF95H3orYaCkMFhi5gAevbf0ufFTCKbvB7qz7i2lEE6z+2FmK3UAxeHaZHcGD1xSb
 x+XDD3AnHCBHy56wGQ0jRO1n8psU1tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-LwOXdYKIOq6Zd9l2EfZcwA-1; Fri, 25 Jun 2021 08:54:50 -0400
X-MC-Unique: LwOXdYKIOq6Zd9l2EfZcwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96D33804140;
 Fri, 25 Jun 2021 12:54:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 848F16091B;
 Fri, 25 Jun 2021 12:54:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Floppy patches
Date: Fri, 25 Jun 2021 08:54:35 -0400
Message-Id: <20210625125441.756802-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-reques=
t' into staging (2021-06-25 09:10:37 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/floppy-pull-request=0D
=0D
for you to fetch changes up to 9362984f569a5b979714dfba556e370847d5fb87:=0D
=0D
  hw/block/fdc: Add description to floppy controllers (2021-06-25 08:53:28 =
-0400)=0D
=0D
----------------------------------------------------------------=0D
FDC Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
  hw/block/fdc: Add description to floppy controllers=0D
=0D
 hw/block/fdc-internal.h | 158 ++++++++++=0D
 hw/block/fdc-isa.c      | 320 +++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   | 251 ++++++++++++++++=0D
 hw/block/fdc.c          | 621 +---------------------------------------=0D
 MAINTAINERS             |   3 +=0D
 hw/block/Kconfig        |  12 +-=0D
 hw/block/meson.build    |   2 +=0D
 hw/block/trace-events   |   3 +=0D
 hw/i386/Kconfig         |   2 +-=0D
 hw/isa/Kconfig          |   7 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 13 files changed, 763 insertions(+), 622 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


