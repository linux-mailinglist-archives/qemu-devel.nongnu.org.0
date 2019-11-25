Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03390109144
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 16:50:13 +0100 (CET)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZGct-0008Ob-Lf
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 10:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iZGTI-0008St-L3
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 10:40:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iZGTH-0001va-Ee
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 10:40:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52359
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iZGTH-0001v9-AK
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 10:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574696414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DFoLM12d/1HqmCMK9NJxuXTqX9TO3LYW/cIhV4z2weo=;
 b=RhQjij8lZkyYRztNNrRL6wyFiDMEqmBxUgflYJiBbpPD9WnUZjEyj46riCP2BsXc70UBmj
 Gg4d+d5Hw0uXxmPvjoHyqgdqG50+Vz/tCVDjFqZQQLwK+w50bwHnhpcJbOMjFwCEyeYG9d
 hyj7n8tcdy9Vqwee4SSU14mYzERO+l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-xx6rlyhHO5GnjFBQp37Mig-1; Mon, 25 Nov 2019 10:40:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E81B718C425E;
 Mon, 25 Nov 2019 15:40:10 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-31.pek2.redhat.com
 [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B39A5D9CA;
 Mon, 25 Nov 2019 15:40:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 0/4] Net patches
Date: Mon, 25 Nov 2019 23:40:03 +0800
Message-Id: <1574696407-4188-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: xx6rlyhHO5GnjFBQp37Mig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 122e6d2a9c1bf8aa1d51409c15809a82621515b1=
:

  Merge remote-tracking branch 'remotes/gkurz/tags/9p-fix-2019-11-23' into =
staging (2019-11-25 13:39:45 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 4d0e59ace29277b2faa5b33c719be9baaa659093:

  net/virtio: return error when device_opts arg is NULL (2019-11-25 23:30:2=
9 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Jens Freimann (4):
      net/virtio: fix dev_unplug_pending
      net/virtio: return early when failover primary alread added
      net/virtio: fix re-plugging of primary device
      net/virtio: return error when device_opts arg is NULL

 hw/net/virtio-net.c | 58 +++++++++++++++++++++++++++++++++++--------------=
----
 migration/savevm.c  |  3 ++-
 2 files changed, 40 insertions(+), 21 deletions(-)

2.5.0


