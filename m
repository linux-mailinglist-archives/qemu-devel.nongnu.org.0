Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B703E4B590D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:47:16 +0100 (CET)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJfRT-0004iJ-SS
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:47:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJfOr-0002xI-MZ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:44:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJfOp-00035E-6B
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644860670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DjKgXOPGdkhvM05livl5Rx+nIIsdPTzkuU1XgLIUYT4=;
 b=DvNHAtQVKafFy1fVWXpqfByDec0LwbwZ97IoofPpHzgRt2SFkzPb38gU7/P0JffouBGOtu
 8PMzHaAbbGL78bMA0yhr3ei0kgvxSKUiIFvtbhpFIrS9N/tg8prWjcZ3+XGtFY1XA2p2H5
 dnEcGw1sZPsHRQ6oOKipqioMshFEOF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-2yv6J0S7O--XGuPdaHftxA-1; Mon, 14 Feb 2022 12:44:28 -0500
X-MC-Unique: 2yv6J0S7O--XGuPdaHftxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B65F51853026;
 Mon, 14 Feb 2022 17:44:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A1477454;
 Mon, 14 Feb 2022 17:43:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] Block patches
Date: Mon, 14 Feb 2022 17:15:42 +0000
Message-Id: <20220214171545.10242-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cc5ce8b8b6be83e5fe3b668dbd061ad97c534e3f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220210' in=
to staging (2022-02-13 20:33:28 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to 4c41c69e05fe28c0f95f8abd2ebf407e95a4f04b:=0D
=0D
  util: adjust coroutine pool size to virtio block queue (2022-02-14 17:11:=
25 +0000)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
This contains coroutine poll size scaling, virtiofsd rseq seccomp for new g=
libc=0D
versions, and the QEMU C virtiofsd deprecation notice.=0D
=0D
----------------------------------------------------------------=0D
=0D
Christian Ehrhardt (1):=0D
  tools/virtiofsd: Add rseq syscall to the seccomp allowlist=0D
=0D
Dr. David Alan Gilbert (1):=0D
  Deprecate C virtiofsd=0D
=0D
Hiroki Narukawa (1):=0D
  util: adjust coroutine pool size to virtio block queue=0D
=0D
 docs/about/deprecated.rst             | 17 +++++++++++++++++=0D
 include/qemu/coroutine.h              | 10 ++++++++++=0D
 hw/block/virtio-blk.c                 |  5 +++++=0D
 tools/virtiofsd/passthrough_seccomp.c |  3 +++=0D
 util/qemu-coroutine.c                 | 20 ++++++++++++++++----=0D
 5 files changed, 51 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


