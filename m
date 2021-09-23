Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C004162E0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:20:02 +0200 (CEST)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRS5-000877-4X
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKR-0008JD-Td
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKK-0005xO-7v
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632413514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PGYTKaS/UMg140PX+scg+KBWdtmIJkaI/fWHWN7is50=;
 b=UfmfH6CmAH+GqClz2dPXrqrcZ2J+R6PlgM9OnWty2ICuwcv1BcL3lCgWk9L5f+u50usIqH
 J7EGqDHNzQFLr8G36elYWT44jfuYcaounrLFnWudRPIEGsThwN6QM3by1DpuH1nqgpHNUb
 kPoj07hSFN6bP0vHgOw0mwVPjT9rW+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-ZVGrKpHNOQGH-J6EivXk8A-1; Thu, 23 Sep 2021 12:11:52 -0400
X-MC-Unique: ZVGrKpHNOQGH-J6EivXk8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB0411808308;
 Thu, 23 Sep 2021 16:11:51 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A63D1002EF0;
 Thu, 23 Sep 2021 16:11:42 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] tests/Makefile: improvements on make check-acceptance
Date: Thu, 23 Sep 2021 13:11:38 -0300
Message-Id: <20210923161141.232208-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve the documentation about how to run a single test within a file=0D
or all the tests from a file using the standalone avocado command.=0D
=0D
Add a way to run tests based on tags using the `make check-acceptance`=0D
command.=0D
=0D
Add a way to run specific tests using the `make check-acceptance` command.=
=0D
=0D
GitLab pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/376122=
402=0D
=0D
Changes from V2:=0D
  - Rename the environment variable to AVOCADO_TESTS=0D
  - Adjust the documentation to mention `make check-venv`=0D
  - Adjust the documentation to mention `avocado list` command=0D
  - Add the AVOCADO_TAGS implementation patch to the series.=0D
=0D
Changes from V1:=0D
  - Rename TESTFILES to AVOCADO_TEST_FILES on patch 2=0D
  - Add Suggested-by tag on patch 2=0D
=0D
Willian Rampazzo (3):=0D
  tests/Makefile: allow control over tags during check-acceptance=0D
  docs/devel/testing: add instruction to run a single acceptance test=0D
  tests/Makefile: add AVOCADO_TESTS option to make check-acceptance=0D
=0D
 docs/devel/testing.rst | 69 ++++++++++++++++++++++++++++++++++++++++++=0D
 tests/Makefile.include | 17 ++++++++---=0D
 2 files changed, 82 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


