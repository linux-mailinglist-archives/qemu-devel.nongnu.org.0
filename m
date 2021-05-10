Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE2378CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:22:28 +0200 (CEST)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5rf-0003ic-CU
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qQ-0002Nw-Ro
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qM-0002Mu-2Q
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JdoBnj6A0uMJj53knadFVcRFMSo3ZpIDpXSqr4S16AE=;
 b=H5uCRhiybiRVf8Kd8NKG6enSmFTtNyBKOg35dxRrVTAZXWRSC15OUvJ47hGheJS1ye3p9x
 6o/DkmD5r5PyOxuXBjmrtfBMHcRnvtB2FnASFqPAsuWz4nimyOT8aIrYQyUTFMPDTFqkrV
 nPr+qw2VqMJ6Yy8WqpBZGVb+7ZTtxKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-hTIQTRcRNSKRng-eLq9fvw-1; Mon, 10 May 2021 09:21:01 -0400
X-MC-Unique: hTIQTRcRNSKRng-eLq9fvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC038107ACC7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D100819EF1;
 Mon, 10 May 2021 13:20:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1179318000B9; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] Vga 20210510 patches
Date: Mon, 10 May 2021 15:20:26 +0200
Message-Id: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504=
' into staging (2021-05-05 20:29:14 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210510-pull-request=0D
=0D
for you to fetch changes up to b36eb8860f8f4a9c6f131c3fd380116a3017e022:=0D
=0D
  virtio-gpu: add virtio-vga-gl (2021-05-10 13:55:28 +0200)=0D
=0D
----------------------------------------------------------------=0D
edid: display id support (for 5k+), bugfixes.=0D
virtio-gpu: iommu fix, device split.=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (1):=0D
  edid: Make refresh rate configurable=0D
=0D
Gerd Hoffmann (21):=0D
  qemu-edid: use qemu_edid_size()=0D
  edid: edid_desc_next=0D
  edid: move xtra3 descriptor=0D
  edid: use dta extension block descriptors=0D
  virtio-gpu: handle partial maps properly=0D
  virtio-gpu: rename virgl source file.=0D
  virtio-gpu: add virtio-gpu-gl-device=0D
  virtio-gpu: move virgl realize + properties=0D
  virtio-gpu: move virgl reset=0D
  virtio-gpu: use class function for ctrl queue handlers=0D
  virtio-gpu: move virgl handle_ctrl=0D
  virtio-gpu: move virgl gl_flushed=0D
  virtio-gpu: move virgl process_cmd=0D
  virtio-gpu: move update_cursor_data=0D
  virtio-gpu: drop VIRGL() macro=0D
  virtio-gpu: move virtio-gpu-gl-device to separate module=0D
  virtio-gpu: drop use_virgl_renderer=0D
  virtio-gpu: move fields to struct VirtIOGPUGL=0D
  virtio-gpu: add virtio-gpu-gl-pci=0D
  modules: add have_vga=0D
  virtio-gpu: add virtio-vga-gl=0D
=0D
Konstantin Nazarov (3):=0D
  edid: move timing generation into a separate function=0D
  edid: allow arbitrary-length checksums=0D
  edid: add support for DisplayID extension (5k resolution)=0D
=0D
 include/hw/display/edid.h                     |  12 +-=0D
 include/hw/display/vga.h                      |   6 +=0D
 include/hw/virtio/virtio-gpu.h                |  34 ++-=0D
 hw/display/edid-generate.c                    | 232 +++++++++++++-----=0D
 hw/display/vga-pci.c                          |   2 +-=0D
 hw/display/vga.c                              |   2 +=0D
 hw/display/virtio-gpu-base.c                  |   6 +-=0D
 hw/display/virtio-gpu-gl.c                    | 163 ++++++++++++=0D
 hw/display/virtio-gpu-pci-gl.c                |  55 +++++=0D
 .../{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c}   |   7 +-=0D
 hw/display/virtio-gpu.c                       | 218 +++++-----------=0D
 hw/display/virtio-vga-gl.c                    |  47 ++++=0D
 qemu-edid.c                                   |   6 +-=0D
 util/module.c                                 |   7 +=0D
 hw/display/meson.build                        |  19 +-=0D
 15 files changed, 579 insertions(+), 237 deletions(-)=0D
 create mode 100644 hw/display/virtio-gpu-gl.c=0D
 create mode 100644 hw/display/virtio-gpu-pci-gl.c=0D
 rename hw/display/{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c} (99%)=0D
 create mode 100644 hw/display/virtio-vga-gl.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


