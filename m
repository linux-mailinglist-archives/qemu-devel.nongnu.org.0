Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB8469D35
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:29:52 +0100 (CET)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFw7-0001Hk-Ap
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muFuA-000815-FI
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:27:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muFu7-0003P1-2T
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638804465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PTQvpP0SqKFEC+eMRECEniNB24sAkFB37/G5fBB183o=;
 b=RGANsGYKR6FY8T95r4Ctm9SKOKcnzJTZ3SkA6SODd3pH+DMbKj9f/ELzvPLKMcYP41Wi88
 u+aYDAnn/kGVPOQMu6dLIE+Uu2lnFT96j3UR/10GTooe5zSfdcVVRtS3r2/O0/h81Tm92f
 CPPiyILhrBQuXDoQoaPguBwhsaJpVNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-IE88gnaoP5GFoty6GOsBeA-1; Mon, 06 Dec 2021 10:27:39 -0500
X-MC-Unique: IE88gnaoP5GFoty6GOsBeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE6A83DD24;
 Mon,  6 Dec 2021 15:27:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7A2C60BF1;
 Mon,  6 Dec 2021 15:27:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/1] Block patches
Date: Mon,  6 Dec 2021 15:27:23 +0000
Message-Id: <20211206152724.121030-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99fc08366b06282614daeda989d2fde6ab8a707f=
:=0D
=0D
  Merge tag 'seabios-20211203-pull-request' of git://git.kraxel.org/qemu in=
to staging (2021-12-03 05:26:40 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to 5b807181c27a940a3a7ad1f221a2e76a132cbdc0:=0D
=0D
  virtio-blk: Fix clean up of host notifiers for single MR transaction. (20=
21-12-06 14:21:14 +0000)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Mielke (1):=0D
  virtio-blk: Fix clean up of host notifiers for single MR transaction.=0D
=0D
 hw/block/dataplane/virtio-blk.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


