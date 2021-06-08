Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDA39F882
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:10:57 +0200 (CEST)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcRV-0003vt-2h
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQS-0002qC-FE
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:09:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQQ-0001wT-Iu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ekybRASnZbFapBoW+E2EM8b42hqfSwbke1GpLrXFCaE=;
 b=WmqsUev8UyBqyl29TexKY7hVXrYIybtXQbc8gmf6LDRuQEBFYxW4o2XqqhHj7suf/MvFsx
 iVkRc+Ga0b6+WibLCeHJLgRF+6CeLCgx1pEA147ewvRPIf2JBYvzfBdwdv1w5bWQ2A8WSt
 Q+n8e2WDBAolmO+E95ShwPwV0T4wNOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-219sB7t4MQ6Z2x7rPejFCg-1; Tue, 08 Jun 2021 10:09:48 -0400
X-MC-Unique: 219sB7t4MQ6Z2x7rPejFCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 996461802226;
 Tue,  8 Jun 2021 14:09:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B50E5D9DE;
 Tue,  8 Jun 2021 14:09:39 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Jobs based on custom runners: add CentOS Stream 8
Date: Tue,  8 Jun 2021 10:09:34 -0400
Message-Id: <20210608140938.863580-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds on top the "GitLab Custom Runners and Jobs (was: QEMU=0D
Gating CI)" series, showing an example of how other entities can=0D
add their own custom jobs to the GitLab CI pipeline.=0D
=0D
First of all, it may be useful to see an actual pipeline (and the=0D
reespective job introduced here) combined with the jobs introduced=0D
on "GitLab Custom Runners and Jobs (was: QEMU Gating CI)":=0D
=0D
 * https://gitlab.com/cleber.gnu/qemu/-/pipelines/316527166=0D
 * https://gitlab.com/cleber.gnu/qemu/-/jobs/1325976765=0D
=0D
The runner (the machine and job) is to be managed by Red Hat, and=0D
adds, at the very least, bare metal x86_64 KVM testing capabilities to=0D
the QEMU pipeline.  This brings extra coverage for some unittests, and=0D
the ability to run the acceptance tests dependent on KVM.=0D
=0D
The runner is already completely set up and registered to the=0D
https://gitlab.com/qemu-project/qemu project instance, and jobs will=0D
be triggered according to the same rules for the jobs introduced on=0D
"GitLab Custom Runners and Jobs (was: QEMU Gating CI)", that is,=0D
but pushes to the staging branch.  Still, the job is set with mode=0D
"allow failures", so it should not disrupt the existing pipeline.=0D
Once its reliability is proved (rules and service levels are to be=0D
determined), that can be reverted.=0D
=0D
Even though the formal method of tracking machine/job maintainers have=0D
not been formalized, it should be known that the contacts/admins for=0D
this machine and job are:=0D
=0D
 - Cleber Rosa=0D
   <crosa@redhat.com>=0D
   clebergnu on #qemu=0D
=0D
 - Willian Rampazzo=0D
   <willianr@redhat.com>=0D
   willianr on #qemu=0D
=0D
Based-on: <20210608031425.833536-1-crosa@redhat.com>=0D
=0D
Cleber Rosa (4):=0D
  block.c: fix compilation error on possible unitialized variable=0D
  Python QEMU utils: introduce a generic feature list=0D
  Acceptance Tests: introduce method to require a feature and option=0D
  Jobs based on custom runners: add CentOS Stream 8=0D
=0D
 .gitlab-ci.d/custom-runners.yml           |  29 ++++=0D
 block.c                                   |   2 +-=0D
 python/qemu/utils/__init__.py             |   2 +=0D
 python/qemu/utils/accel.py                |  15 +-=0D
 python/qemu/utils/feature.py              |  44 +++++=0D
 scripts/ci/org.centos/stream/README       |   2 +=0D
 scripts/ci/org.centos/stream/configure    | 190 ++++++++++++++++++++++=0D
 scripts/ci/setup/build-environment.yml    |  38 +++++=0D
 tests/acceptance/avocado_qemu/__init__.py |  29 +++-=0D
 tests/acceptance/multiprocess.py          |   1 +=0D
 10 files changed, 337 insertions(+), 15 deletions(-)=0D
 create mode 100644 python/qemu/utils/feature.py=0D
 create mode 100644 scripts/ci/org.centos/stream/README=0D
 create mode 100755 scripts/ci/org.centos/stream/configure=0D
=0D
--=20=0D
2.25.4=0D
=0D


