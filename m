Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7603F35E8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 23:12:58 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHBot-00023S-Jt
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 17:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mHBm7-0007pE-2E
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mHBm4-0000t2-7c
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629493797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d2Tb4hJxDFTbiugVDU942U4bYfs3BHD1T3PgzI4g07s=;
 b=Y72VcWaNFYgoaC4bAE9OhBZBrubJzLeGtHCg+HPWq9/kWewO1CWtkF7tPLvFkKeVHjN3aa
 l0Ymfhi13NwA0xF/bhH/t3hnxmIDkSXAHv6pmXoIgytdBk9tjnhJuJ6wwQVl0mJIq1RZHT
 c+zNbi6X0fMCPRHkskyHtMCFgQuIaqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-Z1R6ARopMkWspK4yT0DnqQ-1; Fri, 20 Aug 2021 17:09:54 -0400
X-MC-Unique: Z1R6ARopMkWspK4yT0DnqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84B5E760C0;
 Fri, 20 Aug 2021 21:09:53 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE78360C4A;
 Fri, 20 Aug 2021 21:09:47 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] docs: add definitions of terms for CI/testing
Date: Fri, 20 Aug 2021 18:09:44 -0300
Message-Id: <20210820210946.291335-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To understand the current state of QEMU CI/testing and have a base to=0D
discuss the plans for the future, it is important to define some usual=0D
terms. This patch defines the terms for "Automated tests", "Unit=0D
testing", "Functional testing", "System testing", "Flaky tests",=0D
"Gating", and "Continuous Integration".=0D
=0D
The first patch was borrowed from=0D
20210812180403.4129067-1-berrange@redhat.com.=0D
=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  docs: split the CI docs into two files=0D
=0D
Willian Rampazzo (1):=0D
  docs: add definitions of terms for CI/testing=0D
=0D
 docs/devel/ci-definitions.rst | 121 +++++++++++++++++++++++++=0D
 docs/devel/ci-jobs.rst        |  40 +++++++++=0D
 docs/devel/ci-runners.rst     | 117 +++++++++++++++++++++++++=0D
 docs/devel/ci.rst             | 160 +---------------------------------=0D
 4 files changed, 281 insertions(+), 157 deletions(-)=0D
 create mode 100644 docs/devel/ci-definitions.rst=0D
 create mode 100644 docs/devel/ci-jobs.rst=0D
 create mode 100644 docs/devel/ci-runners.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


