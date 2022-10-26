Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560A60E6F3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:05:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcs-0008F2-HJ; Wed, 26 Oct 2022 13:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcq-00085e-2b
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcn-0005e3-AD
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r7nq89kJe5CM3CKdA1JBcZAXstUrHS2KhjeX/+oL3ns=;
 b=AKZzf6uwNCGUgBdM2KMYm2WggmrRy4ie0jKYOfHEDipq8CJTsNmFuQbqYl6agtGsT/S51r
 B2qHM/WPlvka35h9V0Tfq3g1I+l16kCsE3QbWySyM9iEmtR/eyXgtFB3j0+jIvzv74+7kd
 d4kJSmjViavdnqMWeQeOC83F42Oay6I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-ZtDRz7K5Pl6YMmWqcY82sg-1; Wed, 26 Oct 2022 13:55:30 -0400
X-MC-Unique: ZtDRz7K5Pl6YMmWqcY82sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03BDA3C11EA0;
 Wed, 26 Oct 2022 17:55:25 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B79C2166B2B;
 Wed, 26 Oct 2022 17:55:21 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/8] QEMU Guest Agent patches
Date: Wed, 26 Oct 2022 20:55:10 +0300
Message-Id: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 79fc2fb685f35a5e71e23629760ef4025d6aba31:

  Merge tag 'trivial-branch-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-10-25 11:37:17 -0400)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-10-26

for you to fetch changes up to 3845ffff8b783680d12a005b493c0959a995f800:

  qga: add channel path to error messages (2022-10-26 20:35:20 +0300)

----------------------------------------------------------------
qga-pull-2022-10-26

----------------------------------------------------------------
Alexander Ivanov (7):
      qga: Add initial FreeBSD support
      qga: Move Linux-specific FS freeze/thaw code to a separate file
      qga: Add UFS freeze/thaw support for FreeBSD
      qga: Add shutdown/halt/reboot support for FreeBSD
      qga: Add support for user password setting in FreeBSD
      qga: Move HW address getting to a separate function
      qga: Add HW address getting for FreeBSD

Bjørn Forsman (1):
      qga: add channel path to error messages

 meson.build           |   2 +-
 qga/channel-posix.c   |  23 +-
 qga/commands-bsd.c    | 200 ++++++++++++++++
 qga/commands-common.h |  51 ++++
 qga/commands-linux.c  | 286 ++++++++++++++++++++++
 qga/commands-posix.c  | 639 +++++++++++++++++---------------------------------
 qga/main.c            |  13 +-
 qga/meson.build       |   6 +
 8 files changed, 780 insertions(+), 440 deletions(-)
 create mode 100644 qga/commands-bsd.c
 create mode 100644 qga/commands-linux.c

--
2.25.1


