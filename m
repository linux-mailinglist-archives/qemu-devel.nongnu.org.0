Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECEA41510A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:06:55 +0200 (CEST)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8W4-0006AQ-NW
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT8TG-0004Ws-7T
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT8TC-0002a7-Hy
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632341033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ra631/+JOA2EIbmW6ChienYoNe+v9pxYpzSSDNziDas=;
 b=jPotx0Tycguh+Q8kM4Xtv7b8DP4WhDzLjwD5ooVIxYi0bVpHM5G5+TAW4ORHgbwDobKnHY
 JTZ0va11EYPWiNR8JkEAC4zQmpKpH/s6k9nozaTV88ehzOQgkl6jaujlRZSP5iPfT9y/qX
 dfbo7OJwe1nStA40Pk8ZxfSBh9x6bi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-7XQya3C9NxWnuQbnn1-_lw-1; Wed, 22 Sep 2021 16:03:52 -0400
X-MC-Unique: 7XQya3C9NxWnuQbnn1-_lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC721084683;
 Wed, 22 Sep 2021 20:03:51 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAF145FC23;
 Wed, 22 Sep 2021 20:03:41 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] docs/devel/testing: improvements on make
 check-acceptance
Date: Wed, 22 Sep 2021 17:03:38 -0300
Message-Id: <20210922200340.196329-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve the documentation about how to run a single test within a file=0D
or all the tests from a file using the standalone avocado command.=0D
=0D
Add a way to run specific tests using the `make check-acceptance` command.=
=0D
=0D
GitLab pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/375517=
782=0D
=0D
Changes from V1:=0D
  - Rename TESTFILES to AVOCADO_TEST_FILES on patch 2=0D
  - Add Suggested-by tag on patch 2=0D
=0D
Willian Rampazzo (2):=0D
  docs/devel/testing: add instruction to run a single acceptance test=0D
  tests/Makefile: add AVOCADO_TEST_FILES option to make check-acceptance=0D
=0D
 docs/devel/testing.rst | 41 +++++++++++++++++++++++++++++++++++++++++=0D
 tests/Makefile.include |  5 ++++-=0D
 2 files changed, 45 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


