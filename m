Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8F3E0328
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:29:29 +0200 (CEST)
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHtg-0005Ss-Pi
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHs8-0002jY-DI
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHs6-0003Hq-3m
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iVOqwtUz2hI0lWRguHVPuzAYs3Fnnl3d3NM/GwAyH2s=;
 b=PGA2riVUXGrxN10ADVJM0aya4SdfXkIN9mgetLIeU6g5M4zuC+V7P5jh4nDmKfqbq4OAPJ
 eT3f+uBZTOz0ei3YUcJZ23DU+qCgFBertAf+DFslxs2uRoMvOWEf7K/F42+mAPyFotnR6z
 YxDQqadWe23YDdXKF+01c/ZeE3Kmu44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-t6WBdvxsNjao3_oyTs1GNg-1; Wed, 04 Aug 2021 10:27:47 -0400
X-MC-Unique: t6WBdvxsNjao3_oyTs1GNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1142387D553;
 Wed,  4 Aug 2021 14:27:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F06D75D6B1;
 Wed,  4 Aug 2021 14:27:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 34A0F1800983; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] floppy: build as modules.
Date: Wed,  4 Aug 2021 16:27:30 +0200
Message-Id: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some code shuffling needed beforehand due to floppy being part of=0D
several platforms.  While being at it also make floppy optional=0D
in pc machine type.=0D
=0D
Gerd Hoffmann (7):=0D
  floppy: move isa_fdc_get_drive_type to separate source file.=0D
  floppy: move isa_fdc_init_drives + fdctrl_init_drives=0D
  floppy: move fdctrl_init_sysbus=0D
  floppy: move sun4m_fdctrl_init=0D
  floppy: move cmos_get_fd_drive_type=0D
  floppy: build as modules.=0D
  pc: add floppy=3DOnOffAuto=0D
=0D
 hw/block/fdc-internal.h |  31 ++++++++++=0D
 include/hw/i386/pc.h    |   2 +=0D
 hw/block/fdc-isa.c      |  54 +----------------=0D
 hw/block/fdc-module.c   | 125 ++++++++++++++++++++++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   |  54 ++---------------=0D
 hw/block/fdc.c          |  19 +-----=0D
 hw/i386/pc.c            |  23 ++++++++=0D
 hw/i386/pc_piix.c       |   8 ++-=0D
 hw/block/meson.build    |  18 +++++-=0D
 9 files changed, 211 insertions(+), 123 deletions(-)=0D
 create mode 100644 hw/block/fdc-module.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


