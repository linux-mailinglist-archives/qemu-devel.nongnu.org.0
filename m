Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653E46EB10
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:23:25 +0100 (CET)
Received: from localhost ([::1]:56360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLGW-0006rV-49
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:23:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvLEr-0005CX-Es
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:21:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvLEn-0000LF-DT
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639063296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nb7+xuu3zMOu/VdyTpJzvTr+QfwT7UeFCg/D+udp8ik=;
 b=aR7jsGNSV577GkrwH6XqaLWBCKx8kc0/w078wF/+VPynyloZcSsd8SZFX8z67KF+6HO799
 Cp2vLnBviWMnAHqxqPLcDoJekbD60j3USrCN0pURCVvfm5vSB2MlqussbVl0pxGnSmnt+8
 QsjNOCZqBQ+VXyClIMRoLYUy9g7kb5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-Nw4XeDM5PEe1CVgnszEPgg-1; Thu, 09 Dec 2021 10:21:33 -0500
X-MC-Unique: Nw4XeDM5PEe1CVgnszEPgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EFDA185303A;
 Thu,  9 Dec 2021 15:21:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 378074DA21;
 Thu,  9 Dec 2021 15:21:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] Block patches
Date: Thu,  9 Dec 2021 15:21:16 +0000
Message-Id: <20211209152117.383832-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a3607def89f9cd68c1b994e1030527df33aa91d0=
:=0D
=0D
  Update version for v6.2.0-rc4 release (2021-12-07 17:51:38 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to cf4fbc3030c974fff726756a7ceef8386cdf500b:=0D
=0D
  block/nvme: fix infinite loop in nvme_free_req_queue_cb() (2021-12-09 09:=
19:49 +0000)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
An infinite loop fix for the userspace NVMe driver.=0D
=0D
----------------------------------------------------------------=0D
=0D
Stefan Hajnoczi (1):=0D
  block/nvme: fix infinite loop in nvme_free_req_queue_cb()=0D
=0D
 block/nvme.c | 5 +++--=0D
 1 file changed, 3 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


