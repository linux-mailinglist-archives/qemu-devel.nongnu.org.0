Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA811E31A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 13:00:50 +0100 (CET)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifjcm-0006nq-L4
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 07:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifjae-0005rN-58
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:58:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifjad-0001vY-5g
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:58:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47772
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifjad-0001tl-1Q
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576238314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7asAq2FFGpqRVjmV3tPPYhEAVmNdYMYAjM4bntVSLVE=;
 b=ZD+8YF65zn/3/hsheNL+6aUcs3cY7UE2tHaRrjwv2lpeRCqAeQPT1bwv+pvXUGC5LYYrqS
 CnAIcbtmN+aukP4QdekLnyX6RopO9l23qVkkm8Bp8hvO4QGtlR5khTbShXV9EDOiLU1MmD
 YP6pYKgEi23CxlSl06qV2cTZmWMORGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-PqkOhAY9Mey3LL9qHSJJPA-1; Fri, 13 Dec 2019 06:58:32 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5D45800D41
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 11:58:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.117.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31D2619C4F;
 Fri, 13 Dec 2019 11:58:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] virtiofs queue
Date: Fri, 13 Dec 2019 11:58:20 +0000
Message-Id: <20191213115822.77260-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: PqkOhAY9Mey3LL9qHSJJPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit b0ca999a43a22b38158a222233d3f5881648bb4f=
:

  Update version for v4.2.0 release (2019-12-12 16:45:57 +0000)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-virtiofs-20191213a

for you to fetch changes up to 366844f3d1329c6423dd752891a28ccb3ee8fddd:

  virtio-fs: fix MSI-X nvectors calculation (2019-12-13 10:53:57 +0000)

----------------------------------------------------------------
virtiofs pull 2019-12-13: Minor fixes and cleanups

Cleanup from Marc-Andr=C3=A9 and MSI-X fix from Stefan.

----------------------------------------------------------------
Marc-Andr=C3=A9 Lureau (1):
      vhost-user-fs: remove "vhostfd" property

Stefan Hajnoczi (1):
      virtio-fs: fix MSI-X nvectors calculation

 hw/virtio/vhost-user-fs-pci.c     | 3 ++-
 hw/virtio/vhost-user-fs.c         | 1 -
 include/hw/virtio/vhost-user-fs.h | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)


