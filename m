Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5304E67A1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:18:36 +0100 (CET)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXR6Z-0004sQ-7f
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:18:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXR3k-0002dF-Do
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXR3e-0007M3-8Y
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648142131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ngNj5Z+a8xPN+Lnv4z3qqKxu8TylSFYh7C5Ibh34B2c=;
 b=a7vN+SxO7mChQY42pwENyVyFKgA9IGy2EW9J04CdU7AxJXCBB9ljZ6sOmn3GjX/uqBWtQC
 7mEpfO96TILWUrKOAJtOoOQy+T4dSxlAZa53Fi1MGEj+PSeGPzv9HPftLoba3BlXdpBvtB
 0bIOj9iGfGviGnsnne2H2zqeEk7thFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-IhotfNfbP4-UW0SHdKYofg-1; Thu, 24 Mar 2022 13:15:29 -0400
X-MC-Unique: IhotfNfbP4-UW0SHdKYofg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 514AB89C7DB;
 Thu, 24 Mar 2022 17:15:29 +0000 (UTC)
Received: from localhost (unknown [10.39.195.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B59031454535;
 Thu, 24 Mar 2022 17:15:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-7.0 0/2] Block patches
Date: Thu, 24 Mar 2022 17:15:25 +0000
Message-Id: <20220324171527.1256604-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb30b=
:=0D
=0D
  Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to 2539eade4f689eda7e9fe45486f18334bfbafaf0:=0D
=0D
  hw: Fix misleading hexadecimal format (2022-03-24 10:38:42 +0000)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
Philippe found cases where the 0x%d format string was used, leading to=0D
misleading output. The patches look harmless and could save people time, so=
 I=0D
think it's worth including them in 7.0.=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  block: Fix misleading hexadecimal format=0D
  hw: Fix misleading hexadecimal format=0D
=0D
 block/parallels-ext.c | 2 +-=0D
 hw/i386/sgx.c         | 2 +-=0D
 hw/i386/trace-events  | 6 +++---=0D
 hw/misc/trace-events  | 4 ++--=0D
 hw/scsi/trace-events  | 4 ++--=0D
 5 files changed, 9 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D


