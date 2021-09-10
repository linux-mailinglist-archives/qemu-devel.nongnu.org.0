Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B73406CC9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:19:32 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgRG-0001AX-QQ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPH-0006pv-FX
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPD-0004aE-Nr
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631279841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vU9prRHixb2rdw14zSz9mHt65CrCnTyQBK5WuJfMKus=;
 b=HgTcX/To/daZM3uqNA+jVY9FuWPK8scQX5qIVJiw4q2ULwzjIQnPA3CvwTGSQnCmYVMmPo
 NWv3U8xFoI5DtaOxISjJuugkUClcjd3MXmpRm39/GQ7lRKnH8nWnHN5NnZ7l1NNjbumTOq
 /vWYKzX+Uxvn8xUtNyvStnAAiTTmHq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-t1olCFfWNkSmhmCntqnLOA-1; Fri, 10 Sep 2021 09:17:20 -0400
X-MC-Unique: t1olCFfWNkSmhmCntqnLOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 825F8824FAB
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 13:17:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8875D9F4;
 Fri, 10 Sep 2021 13:17:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D6A4018000AA; Fri, 10 Sep 2021 15:17:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Vga 20210910 patches
Date: Fri, 10 Sep 2021 15:17:03 +0200
Message-Id: <20210910131709.3681492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2021090=
8' into staging (2021-09-08 11:06:17 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210910-pull-request=0D
=0D
for you to fetch changes up to 6335c0b56819a5d1219ea84a11a732d0861542db:=0D
=0D
  qxl: fix pre-save logic (2021-09-10 12:23:12 +0200)=0D
=0D
----------------------------------------------------------------=0D
virtio-gpu + ui: fence syncronization.=0D
qxl: unbreak live migration.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (1):=0D
  qxl: fix pre-save logic=0D
=0D
Vivek Kasireddy (5):=0D
  ui/gtk: Create a common release_dmabuf helper=0D
  ui/egl: Add egl helpers to help with synchronization=0D
  ui: Create sync objects and fences only for blobs=0D
  ui/gtk-egl: Wait for the draw signal for dmabuf blobs=0D
  virtio-gpu: Add gl_flushed callback=0D
=0D
 include/ui/console.h            |  3 +++=0D
 include/ui/egl-helpers.h        |  3 +++=0D
 include/ui/gtk.h                |  5 ++--=0D
 hw/display/qxl.c                |  2 +-=0D
 hw/display/virtio-gpu-udmabuf.c |  1 +=0D
 hw/display/virtio-gpu.c         | 32 ++++++++++++++++++++++--=0D
 ui/egl-helpers.c                | 26 ++++++++++++++++++++=0D
 ui/gtk-egl.c                    | 43 +++++++++++++++++++++++++++------=0D
 ui/gtk-gl-area.c                | 20 +++++++++++++++=0D
 ui/gtk.c                        | 26 ++++++++++++++++++--=0D
 10 files changed, 146 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


