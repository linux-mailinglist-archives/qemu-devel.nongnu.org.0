Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81F648C930
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:19:38 +0100 (CET)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hHd-000241-Id
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7hDB-0008G5-EU
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7hD8-0005at-5M
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642007696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qu8spKordce78JOHCzeQlJHxu0nmDEShuJK983c8CxE=;
 b=ILlGkihgBfLNPsEejKkpTj2DwWppu9dI2gsCnRI+H/SfK9osgOj2x7QpTUprVHmEWyrAGc
 /kEsv/a+7Sh7lgCYA9+9dtnu1V7S7+vXJYm1vUqNA0/mX1NQ903sjOoszwKEK+GwcvyVRL
 ymjy/T/zvR7C34WtcXSPQgiyEEHm/Qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-x5ASZwEPMzuFdLsFFOCp6w-1; Wed, 12 Jan 2022 12:14:50 -0500
X-MC-Unique: x5ASZwEPMzuFdLsFFOCp6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB628042E1;
 Wed, 12 Jan 2022 17:14:47 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C62E87A405;
 Wed, 12 Jan 2022 17:14:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] Block patches
Date: Wed, 12 Jan 2022 17:13:56 +0000
Message-Id: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Garzarella <sgarzare@redhat.com>,
 Peter Lieven <pl@kamp.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36=
:=0D
=0D
  Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-=
7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to db608fb78444c58896db69495729e4458eeaace1:=0D
=0D
  virtio: unify dataplane and non-dataplane ->handle_output() (2022-01-12 1=
7:09:39 +0000)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
Stefan Hajnoczi (6):=0D
  aio-posix: split poll check from ready handler=0D
  virtio: get rid of VirtIOHandleAIOOutput=0D
  virtio-blk: drop unused virtio_blk_handle_vq() return value=0D
  virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane=0D
  virtio: use ->handle_output() instead of ->handle_aio_output()=0D
  virtio: unify dataplane and non-dataplane ->handle_output()=0D
=0D
 include/block/aio.h             |  4 +-=0D
 include/hw/virtio/virtio-blk.h  |  2 +-=0D
 include/hw/virtio/virtio.h      |  5 +-=0D
 util/aio-posix.h                |  1 +=0D
 block/curl.c                    | 11 ++--=0D
 block/export/fuse.c             |  4 +-=0D
 block/io_uring.c                | 19 ++++---=0D
 block/iscsi.c                   |  4 +-=0D
 block/linux-aio.c               | 16 +++---=0D
 block/nfs.c                     |  6 +--=0D
 block/nvme.c                    | 51 ++++++++++++-------=0D
 block/ssh.c                     |  4 +-=0D
 block/win32-aio.c               |  4 +-=0D
 hw/block/dataplane/virtio-blk.c | 16 +-----=0D
 hw/block/virtio-blk.c           | 14 ++----=0D
 hw/scsi/virtio-scsi-dataplane.c | 60 +++-------------------=0D
 hw/scsi/virtio-scsi.c           |  2 +-=0D
 hw/virtio/virtio.c              | 73 +++++++++------------------=0D
 hw/xen/xen-bus.c                |  6 +--=0D
 io/channel-command.c            |  6 ++-=0D
 io/channel-file.c               |  3 +-=0D
 io/channel-socket.c             |  3 +-=0D
 migration/rdma.c                |  8 +--=0D
 tests/unit/test-aio.c           |  4 +-=0D
 tests/unit/test-fdmon-epoll.c   |  4 +-=0D
 util/aio-posix.c                | 89 +++++++++++++++++++++++++--------=0D
 util/aio-win32.c                |  4 +-=0D
 util/async.c                    | 10 +++-=0D
 util/main-loop.c                |  4 +-=0D
 util/qemu-coroutine-io.c        |  5 +-=0D
 util/vhost-user-server.c        | 11 ++--=0D
 31 files changed, 221 insertions(+), 232 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


