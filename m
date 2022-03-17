Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBC4DCBF5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:01:41 +0100 (CET)
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtVL-0006Qy-Ok
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:01:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUtRi-0004Ix-Fd
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUtRf-0000q1-E3
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647536269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R/8CJBOsMaz+8/bnN/zluiUia1lX8AvWlV8SH1tlyu8=;
 b=PpeqCWvQVtHgeGJrUUsRJnSpVPZmPm9M1TP8Xjm4FF5rFHb6qzTdzbdkGsziGYA0HQ7pbF
 FQ+l6+S7WMiokFayKBAxRj6f6hZ7W3MNMfqwfXFHH6YZfwXgSGPeU79Ly3XET5WmVr3iuv
 sazE3YLmbgGfSIbeiJpyApjM7Yn4fRI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-hrQJjiV1NFiPGVgqoPLoPw-1; Thu, 17 Mar 2022 12:57:46 -0400
X-MC-Unique: hrQJjiV1NFiPGVgqoPLoPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 645A28002BF;
 Thu, 17 Mar 2022 16:57:45 +0000 (UTC)
Received: from localhost (unknown [10.39.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5A7E4010A2F;
 Thu, 17 Mar 2022 16:57:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-7.0 0/2] Block patches
Date: Thu, 17 Mar 2022 16:57:41 +0000
Message-Id: <20220317165743.238662-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
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
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to fc8796465c6cd4091efe6a2f8b353f07324f49c7:=0D
=0D
  aio-posix: fix spurious ->poll_ready() callbacks in main loop (2022-03-17=
 11:23:18 +0000)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
Bug fixes for 7.0.=0D
=0D
----------------------------------------------------------------=0D
=0D
Haiyue Wang (1):=0D
  aio-posix: fix build failure io_uring 2.2=0D
=0D
Stefan Hajnoczi (1):=0D
  aio-posix: fix spurious ->poll_ready() callbacks in main loop=0D
=0D
 util/aio-posix.h      |  1 +=0D
 util/aio-posix.c      | 32 ++++++++++++++++++--------------=0D
 util/fdmon-io_uring.c |  4 ++++=0D
 3 files changed, 23 insertions(+), 14 deletions(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D


