Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94F458EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:47:10 +0100 (CET)
Received: from localhost ([::1]:42492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8iy-0007ti-Pw
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8cj-0004dt-T4
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8ch-00007y-Ou
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1FatMmfZ9Zfboiia4m5y4PvHftyzu2tkQKvaiCIuKHY=;
 b=T7tWT+OUc5CEuHlv/oFOeVcWgln3LrLN7R/d6CuaftSfQmFPSVITYqRmUFy1TKEvwCJSwu
 FutLc9A97GGDmy8AMMKEEDz6ybk+dbryHdIXGocrJbVx4W6oKF+B7u7c+c9cVZDt3V/WHG
 YJp9UrR6xMAIArMiPcnNk0rnsF6TK5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-5bcRjVPQPJSy8BiZ-d_Z_Q-1; Mon, 22 Nov 2021 07:40:35 -0500
X-MC-Unique: 5bcRjVPQPJSy8BiZ-d_Z_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07851018721;
 Mon, 22 Nov 2021 12:40:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AF225D6BA;
 Mon, 22 Nov 2021 12:40:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 47595180039D; Mon, 22 Nov 2021 13:40:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Fixes 20211122 patches
Date: Mon, 22 Nov 2021 13:40:07 +0100
Message-Id: <20211122124015.909318-1-kraxel@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c5fbdd60cf1fb52f01bdfe342b6fa65d5343e1b1=
:=0D
=0D
  Merge tag 'qemu-sparc-20211121' of git://github.com/mcayland/qemu into st=
aging (2021-11-21 14:12:25 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20211122-pull-request=0D
=0D
for you to fetch changes up to b9e5628ca5d42994cc6f82752d9bf0bc98f51f64:=0D
=0D
  microvm: check g_file_set_contents() return value (2021-11-22 11:14:28 +0=
100)=0D
=0D
----------------------------------------------------------------=0D
fixes for 6.2: microvm, ui, modules.=0D
=0D
----------------------------------------------------------------=0D
=0D
Alexander Orzechowski (2):=0D
  ui: fix incorrect scaling on highdpi with gtk/opengl=0D
  ui: fix incorrect pointer position on highdpi with gtk=0D
=0D
Dongwon Kim (1):=0D
  ui/gtk: graphic_hw_gl_flushed after closing dmabuf->fence_fd=0D
=0D
Gerd Hoffmann (2):=0D
  microvm: add missing g_free() call=0D
  microvm: check g_file_set_contents() return value=0D
=0D
Laurent Vivier (1):=0D
  migration: fix dump-vmstate with modules=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/i386/microvm: Reduce annoying debug message in dt_setup_microvm()=0D
=0D
Vladimir Sementsov-Ogievskiy (1):=0D
  ui/vnc-clipboard: fix adding notifier twice=0D
=0D
 hw/i386/microvm-dt.c | 11 +++++++++--=0D
 softmmu/vl.c         |  1 +=0D
 ui/gtk-gl-area.c     |  7 ++++---=0D
 ui/gtk.c             | 17 ++++++++++-------=0D
 ui/vnc-clipboard.c   | 10 ++++++----=0D
 5 files changed, 30 insertions(+), 16 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


