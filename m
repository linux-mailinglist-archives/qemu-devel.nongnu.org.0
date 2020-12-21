Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85362DFC64
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:47:42 +0100 (CET)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLXJ-0006ma-Vv
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLV3-0005Ow-UX
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLUy-0003TD-Bc
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608558314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+BFlrDLzZrrzA0J0vpWhftmGbaQ5z+l8GOi8MR6M+IY=;
 b=OInvN/AxFpeIdLxFKIMeGzpC8Oa6vDNpjQM8HGDK2uC2VLTjMy4wjFt5xxSqhfN8yRb6Of
 wOTUxE9pS4Ncn5J0d1ssNcjt+/jRhwk0LdkU+KTE88JYB0iYffUOZ1j03kkoAI5b17DnX9
 YXmqRnho5Yo0DatPOVqdQWLxV9UcxMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-szM-ACw4MGuCfM_oLA8NHQ-1; Mon, 21 Dec 2020 08:45:12 -0500
X-MC-Unique: szM-ACw4MGuCfM_oLA8NHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2646E107ACE3;
 Mon, 21 Dec 2020 13:45:11 +0000 (UTC)
Received: from thuth.com (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E6905D9CA;
 Mon, 21 Dec 2020 13:45:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/5] fuzzer and gitlab-CI patches
Date: Mon, 21 Dec 2020 14:44:59 +0100
Message-Id: <20201221134504.764-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request'
  into staging (2020-12-17 18:53:36 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-21

for you to fetch changes up to df063546c2de1a5045e356253abd9a2e6e2bec6d:

  gitlab-ci: Archive logs of acceptance tests (2020-12-18 12:25:42 +0100)

----------------------------------------------------------------
* Two fuzzer patches from Alexander
* Show logs of failed acceptance jobs in the gitlab-CI
----------------------------------------------------------------

Alexander Bulekov (2):
      fuzz: Add more i386 configurations for fuzzing
      fuzz: fix the generic-fuzz-floppy config

Wainer dos Santos Moschetta (3):
      tests/acceptance: Bump avocado requirements to 83.0
      gitlab-ci: Refactor code that show logs of failed acceptances
      gitlab-ci: Archive logs of acceptance tests

 .gitlab-ci.yml                          |  7 ++-
 tests/qtest/fuzz/generic_fuzz_configs.h | 84 ++++++++++++++++++++++++++++++++-
 tests/requirements.txt                  |  2 +-
 3 files changed, 89 insertions(+), 4 deletions(-)


