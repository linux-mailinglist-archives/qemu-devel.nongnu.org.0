Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A637940D2EF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 07:58:13 +0200 (CEST)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQkPU-0001Kr-64
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 01:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkNz-0008Ix-TO
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkNv-0006bk-UM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631771794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ERhfMAbsjlS2wwdC917Ee8XSi+YRkkjxgB34tHdW+LU=;
 b=dB/XnmN2dKt7teehmGyJy2i2VTGPQ8LNpOvdrHimqxg359q+R8RCT1/r4NtY5U/X5n0V+F
 BHGdaxd7KlRRQlhk+QaqqnPH3GU8QtcbYK6sTb4fvudQcmjhkA/5cLBAFSdlocmpcKdHz2
 G3P6yW47g83Xq2R4mbE8WbY3g6m+jRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-_PGPmvJ0MJO-um5YYk_Gvw-1; Thu, 16 Sep 2021 01:56:33 -0400
X-MC-Unique: _PGPmvJ0MJO-um5YYk_Gvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4291006AA0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:56:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8637F19736;
 Thu, 16 Sep 2021 05:56:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D3AD618000A9; Thu, 16 Sep 2021 07:56:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Vga 20210916 patches
Date: Thu, 16 Sep 2021 07:56:17 +0200
Message-Id: <20210916055623.1846418-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529=
:=0D
=0D
  Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' i=
nto staging (2021-09-14 18:14:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210916-pull-request=0D
=0D
for you to fetch changes up to b3a5dfdea99da55fdc70538eeeb2227ebe6d6a5f:=0D
=0D
  virtio-gpu: Add gl_flushed callback (2021-09-15 08:42:00 +0200)=0D
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
 hw/display/virtio-gpu.c         | 32 ++++++++++++++++++++--=0D
 ui/egl-helpers.c                | 26 ++++++++++++++++++=0D
 ui/gtk-egl.c                    | 48 +++++++++++++++++++++++++++------=0D
 ui/gtk-gl-area.c                | 26 ++++++++++++++++++=0D
 ui/gtk.c                        | 26 ++++++++++++++++--=0D
 10 files changed, 157 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


