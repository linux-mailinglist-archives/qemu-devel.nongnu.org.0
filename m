Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF08415060
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:14:05 +0200 (CEST)
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7gy-0002Mv-8N
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT7XD-0007co-KF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:03:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT7X6-0001B2-93
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632337429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UE+QLTDLBAHuPabGnbiT3a/w8laqLoe+QTxPd2cm63M=;
 b=H9QdFLa0w+U/p98O3ZZeaJTIfM5cdtbiJjmZsGqOYcj2a8BqeDW0jptgrJMq4WJE+vj3L0
 ZPiILKIuQ5r+FBFXIQzt1d8kFTh8I7/l6jeRomaXoss+xkzuYA0NQp+uVcJzdxZvoZdGu/
 WMQEURSUi8yyFrm58lXLvYCNJd55p3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-gHe0QB_VMNm7vMyTFXDJUA-1; Wed, 22 Sep 2021 15:03:48 -0400
X-MC-Unique: gHe0QB_VMNm7vMyTFXDJUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BDC9100D681;
 Wed, 22 Sep 2021 19:03:47 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C89455D9DD;
 Wed, 22 Sep 2021 19:03:25 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] docs/devel/testing: improvements on make check-acceptance
Date: Wed, 22 Sep 2021 16:03:22 -0300
Message-Id: <20210922190324.190227-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve the documentation about how to run a single test within a file=0D
or all the tests from a file using the standalone avocado command.=0D
=0D
Add a way to run specific tests using the `make check-acceptance` command.=
=0D
=0D
GitLab pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/375486=
996=0D
=0D
Willian Rampazzo (2):=0D
  docs/devel/testing: add instruction to run a single acceptance test=0D
  tests/Makefile: add TESTFILES option to make check-acceptance=0D
=0D
 docs/devel/testing.rst | 41 +++++++++++++++++++++++++++++++++++++++++=0D
 tests/Makefile.include |  5 ++++-=0D
 2 files changed, 45 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


