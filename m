Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C0533A28
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:45:34 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntna8-00044O-LF
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnKz-00050b-2D
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnKw-0007Bb-V0
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653470990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1yNORnmty/4mJxKo6H/gWZoj6wK6Y0tV5INPyxvRHDI=;
 b=Ikd3EnmaAHeQ81hsTx7aM/a7ywMeqbLqbySxpzi5SkivAj5YH+RA16sHDHHTDQN7cXs4qV
 VKS1P2eZWkdtThnbEwFpNsZgQtbevl2OAdZx/tHWGXx16ZT0JLS3LWPw7vh4H0C2UN3vet
 Yh1cv8NNVuZ443+f1PL1Q6VNjWmrr58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-iQ0eyz52N8ymPT6nR7ww9A-1; Wed, 25 May 2022 05:29:41 -0400
X-MC-Unique: iQ0eyz52N8ymPT6nR7ww9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32FFC858EEE;
 Wed, 25 May 2022 09:29:41 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BAD2112131E;
 Wed, 25 May 2022 09:29:40 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 0/4] qemu-ga patches
Date: Wed, 25 May 2022 12:29:34 +0300
Message-Id: <20220525092938.945611-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0cac736e73723850a99e5142e35d14d8f8efb232:

  Merge tag 'pull-riscv-to-apply-20220525' of github.com:alistair23/qemu into staging (2022-05-24 15:55:12 -0700)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-05-25

for you to fetch changes up to b9a002609fd887447eca8ee10777690d691f91d4:

  qga-win32: Add support for NVME bus type (2022-05-25 12:12:02 +0300)

----------------------------------------------------------------
qga-win32-pull-2022-05-25

v2:
- fix Fedora cross-compilation

----------------------------------------------------------------
Konstantin Kostiuk (3):
      trivial: qga: Log version on start
      tests: Bump Fedora image version for cross-compilation
      qga-win32: Add support for NVME bus type

luzhipeng (1):
      qga: add guest-get-diskstats command for Linux guests

 qga/commands-posix.c                               | 123 +++++++++++++++++++++
 qga/commands-win32.c                               |  11 ++
 qga/main.c                                         |   2 +
 qga/qapi-schema.json                               |  86 ++++++++++++++
 tests/docker/dockerfiles/fedora-win32-cross.docker |   2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker |   2 +-
 6 files changed, 224 insertions(+), 2 deletions(-)


--
2.25.1


