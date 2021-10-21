Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81943699D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:46:16 +0200 (CEST)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdc8t-0005Xb-DP
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdc4E-0003PU-4A
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdc4A-0005l5-Jj
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634838080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t8vVjhgBGG8/VwWiMdlmEalW0dV7eytI8iXiuABXiFo=;
 b=fH+mKx5moRQ1h+6UhCerUqk7J/GIYOlD/yWUlwL0aBhOVY3xkHWQm1joKHT3fnOAITM7y0
 17vfBYtC3ggt/ehIaSQzyGjMnr6eONDSuKpllG5/yT9zbcNUY2MMq83ZY01nZqbYY92cNQ
 XKkIz7wjZOcK2+yollJKOnQ0orRK+fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-gxJ1U0AXPKuWAiiGWCkA4Q-1; Thu, 21 Oct 2021 13:41:17 -0400
X-MC-Unique: gxJ1U0AXPKuWAiiGWCkA4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACAC41B18BCC;
 Thu, 21 Oct 2021 17:41:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9496A5BAE3;
 Thu, 21 Oct 2021 17:41:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/1] Block patches
Date: Thu, 21 Oct 2021 18:41:03 +0100
Message-Id: <20211021174104.52826-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (2021-10-20 06:10:51 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to 4b2b3d2653f255ef4259a7689af1956536565901:=0D
=0D
  coroutine: resize pool periodically instead of limiting size (2021-10-21 =
18:40:07 +0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
Performance optimization when guest applications submit a lot of parallel I=
/O.=0D
This has also been found to improve clang SafeStack performance.=0D
=0D
----------------------------------------------------------------=0D
=0D
Stefan Hajnoczi (1):=0D
  coroutine: resize pool periodically instead of limiting size=0D
=0D
 include/qemu/coroutine-pool-timer.h | 36 ++++++++++++++++=0D
 include/qemu/coroutine.h            |  7 ++++=0D
 iothread.c                          |  6 +++=0D
 util/coroutine-pool-timer.c         | 35 ++++++++++++++++=0D
 util/main-loop.c                    |  5 +++=0D
 util/qemu-coroutine.c               | 64 ++++++++++++++++-------------=0D
 util/meson.build                    |  1 +=0D
 7 files changed, 125 insertions(+), 29 deletions(-)=0D
 create mode 100644 include/qemu/coroutine-pool-timer.h=0D
 create mode 100644 util/coroutine-pool-timer.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


