Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7654DDB45
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:09:01 +0100 (CET)
Received: from localhost ([::1]:50760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDHo-0000rv-0y
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:09:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5u-0005we-DU
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5r-00084j-DH
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647611797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JqgTfYvUYcYmUov+JVkY/x3p1r+zhJ9k9JHnlsFfgns=;
 b=XqpDz3tk7h5/XvWAM6XgT2j2oJrTP2uSP4IIj/+M5b4Mq9mz05O4be4tHQD4QX4mHjf2XL
 P+qut0MN0Gib0ppfQfF1MqVLo7kHO8kNPxcKt0/onCfIc/7H6EFHbSF8v+aWd30jIrOUcr
 9Tp/jdJ8/9QWrR6YkC3W9Y6AgpTHAQU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-J_hsLFqMPfuOAZB03Na8WA-1; Fri, 18 Mar 2022 09:56:36 -0400
X-MC-Unique: J_hsLFqMPfuOAZB03Na8WA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040FB10544A6
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 13:56:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F9B1457F13;
 Fri, 18 Mar 2022 13:56:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E81B1800091; Fri, 18 Mar 2022 14:56:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Fixes 20220318 patches
Date: Fri, 18 Mar 2022 14:56:28 +0100
Message-Id: <20220318135634.2851040-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3=
:=0D
=0D
  Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu in=
to staging (2022-03-16 10:43:58 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20220318-pull-request=0D
=0D
for you to fetch changes up to 9eb840a20998a97c0ad0f5ced6ebc7e6a88a4dc4:=0D
=0D
  hw/display/vga: Report a proper error when adding a 2nd ISA VGA (2022-03-=
18 10:15:57 +0100)=0D
=0D
----------------------------------------------------------------=0D
bugfixes for vga, audio, vnc=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (1):=0D
  audio/mixeng: Do not declare unused variables=0D
=0D
K. Lange (1):=0D
  ui/gtk: Ignore 2- and 3-button press events=0D
=0D
Thomas Huth (3):=0D
  hw/display/cirrus_vga: Clean up indentation in=0D
    pci_cirrus_vga_realize()=0D
  hw/display: Allow vga_common_init() to return errors=0D
  hw/display/vga: Report a proper error when adding a 2nd ISA VGA=0D
=0D
Wen, Jianxian (1):=0D
  ui: avoid unnecessary memory operations in=0D
    vnc_refresh_server_surface()=0D
=0D
 hw/display/vga_int.h        |  2 +-=0D
 audio/mixeng.c              | 20 ++++++-------=0D
 hw/display/ati.c            |  4 ++-=0D
 hw/display/cirrus_vga.c     | 57 +++++++++++++++++++------------------=0D
 hw/display/cirrus_vga_isa.c |  4 ++-=0D
 hw/display/qxl.c            |  6 +++-=0D
 hw/display/vga-isa.c        |  5 +++-=0D
 hw/display/vga-mmio.c       |  5 +++-=0D
 hw/display/vga-pci.c        |  8 ++++--=0D
 hw/display/vga.c            | 17 +++++++++--=0D
 hw/display/virtio-vga.c     |  4 ++-=0D
 hw/display/vmware_vga.c     |  2 +-=0D
 ui/gtk.c                    |  4 +++=0D
 ui/vnc.c                    | 26 +++++++++++------=0D
 14 files changed, 106 insertions(+), 58 deletions(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D


