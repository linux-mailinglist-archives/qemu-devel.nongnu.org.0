Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A7391989
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:08:53 +0200 (CEST)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluDM-0005Di-Ge
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBH-0002zS-Cq
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBE-0003oO-Vu
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ojHvILIGkn3S+xsubT+fKvLyg0uSvsdYsxoXeegcu1U=;
 b=MF9YXsI4DSp3W8Ep5l5vF3zXW9VrWy62gQ91gHahJhksRrCCqHcWQYz/MpLBzI+txJevrh
 TdxvYOzk3QSwj18TbtDRPPExPEBn9zbfxySdkQh65A1jOGtf0pZOEClHvI1uEGk4aA4uxs
 FmguU6geIROpdPHR3N/tXWUNwfeC8WA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-GA0pE_jwMmmqKwIY2UK55Q-1; Wed, 26 May 2021 10:06:37 -0400
X-MC-Unique: GA0pE_jwMmmqKwIY2UK55Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5DC380293F;
 Wed, 26 May 2021 14:06:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D93791037E80;
 Wed, 26 May 2021 14:06:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 68B4C18000B7; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] Input 20210526 patches
Date: Wed, 26 May 2021 16:06:13 +0200
Message-Id: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
525' into staging (2021-05-25 16:17:06 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/input-20210526-pull-request=0D
=0D
for you to fetch changes up to 96376ab154cfb7a8f0b985e26db5b0074b86c2ee:=0D
=0D
  hw/input/ps2: Use ps2_raise_irq() instead of open coding it (2021-05-26 1=
1:33:49 +0200)=0D
=0D
----------------------------------------------------------------=0D
input: a bunch of ps2 fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  hw/input: expand trace info reported for ps2 device=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/input/ps2: Use ps2_raise_irq() instead of open coding it=0D
=0D
Volker R=C3=BCmelin (12):=0D
  ps2: fix mouse stream corruption=0D
  ps2: don't raise an interrupt if queue is full=0D
  ps2: don't deassert irq twice if queue is empty=0D
  pckbd: split out interrupt line changing code=0D
  pckbd: don't update OBF flags if KBD_STAT_OBF is set=0D
  pckbd: PS/2 keyboard throttle=0D
  pckbd: add state variable for interrupt source=0D
  pckbd: add controller response queue=0D
  pckbd: add function kbd_pending()=0D
  pckbd: correctly disable PS/2 communication=0D
  pckbd: remove duplicated keyboard and mouse defines=0D
  pckbd: clear outport_present in outer pre_load()=0D
=0D
 hw/core/machine.c     |   1 +=0D
 hw/input/pckbd.c      | 351 +++++++++++++++++++++++++++++++++---------=0D
 hw/input/ps2.c        |  22 ++-=0D
 hw/input/trace-events |   2 +-=0D
 4 files changed, 292 insertions(+), 84 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


