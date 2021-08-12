Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1C3EA9E7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 20:05:44 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEF5L-0005dB-4T
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 14:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mEF41-0004Ny-3o
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 14:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mEF3y-0000mX-Tt
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 14:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628791458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7FXafNrIpIKKq+NB3V7zBxwduaTuUXd8um5+sb0or5s=;
 b=hAW77jh9dIx27LHAw5t8Vw2vekNpfha4wz51pFc+LtX5sgw2+H004TX1REWQi1tn5Zupv7
 u4IfOeN3FQvZg3aGfzq3b9ZCMzX0pqHDka3CzCWHw975D07zHg2mE+QSy3nwXbiuKGlWbR
 jw5eCtIU9PVr7hRup0TeOpHQCkJfnWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-TlYK07o-OHWf-R9uz2yIMA-1; Thu, 12 Aug 2021 14:04:14 -0400
X-MC-Unique: TlYK07o-OHWf-R9uz2yIMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C33828042F0;
 Thu, 12 Aug 2021 18:04:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F0B23AB2;
 Thu, 12 Aug 2021 18:04:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab: prepare for limited CI minutes by not running by
 default
Date: Thu, 12 Aug 2021 19:04:01 +0100
Message-Id: <20210812180403.4129067-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A while ago GitLab announced it would be ending the free unlimited CI=0D
minutes for public projects. It hasn't happened yet, but it is certainly=0D
still on the radar. It is possible for OSS projects to get a greater=0D
allowance, but it is still unclear how this will work for contributors'=0D
forks. Even with the greater allowance, we'll burn through it in just=0D
a few pipeline runs. People creating brand new gitlab accounts are=0D
already getting hurt by the new limits IIUC.=0D
=0D
This series isn't a full solution, but it gets us started in a more=0D
sustainable direction. See the second patch commit message and the=0D
docs that it adds for full details.=0D
=0D
At a high level though, with this series applied, we no longer run=0D
any CI jobs by default, except for the 'staging' branch in the=0D
'qemu-project' namespace.=0D
=0D
Users can manually start any individual job from the web UI still=0D
though. Further, they can opt-in to various sets of jobs=0D
=0D
 - 100% manual jobs (the new default):=0D
=0D
    https://gitlab.com/berrange/qemu/-/pipelines/352393697=0D
=0D
 - A minimal set of jobs=0D
=0D
    https://gitlab.com/berrange/qemu/-/pipelines/352397093=0D
=0D
 - A full set of jobs (the old default)=0D
=0D
    https://gitlab.com/berrange/qemu/-/pipelines/352123582=0D
=0D
 - A gating set of jobs (identical to what's run on staging)=0D
=0D
    https://gitlab.com/berrange/qemu/-/pipelines/352195185=0D
=0D
With this starting point, the common "rules" definition across=0D
all jobs, makes it easy for us to add more refinements. We can=0D
defining further sets of interesting jobs.=0D
=0D
eg could define a set of cross-compilation, or a set for=0D
non-Linux, or a set of Windows, or sets for particular host=0D
architectures, etc.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  docs: split the CI docs into two files=0D
  gitlab: don't run CI jobs by default on push to user forks=0D
=0D
 .gitlab-ci.d/buildtest-template.yml  |  17 +--=0D
 .gitlab-ci.d/buildtest.yml           |  43 +++----=0D
 .gitlab-ci.d/cirrus.yml              |   6 +-=0D
 .gitlab-ci.d/container-core.yml      |   4 +=0D
 .gitlab-ci.d/container-cross.yml     |   9 +-=0D
 .gitlab-ci.d/container-template.yml  |   1 +=0D
 .gitlab-ci.d/containers.yml          |   4 +=0D
 .gitlab-ci.d/crossbuild-template.yml |   3 +=0D
 .gitlab-ci.d/crossbuilds.yml         |   3 +=0D
 .gitlab-ci.d/qemu-project.yml        |   1 +=0D
 .gitlab-ci.d/rules.yml               | 116 +++++++++++++++++++=0D
 .gitlab-ci.d/static_checks.yml       |  18 +--=0D
 .gitlab-ci.yml                       |   4 -=0D
 docs/devel/ci-jobs.rst               | 161 +++++++++++++++++++++++++++=0D
 docs/devel/ci-runners.rst            | 117 +++++++++++++++++++=0D
 docs/devel/ci.rst                    | 159 +-------------------------=0D
 16 files changed, 459 insertions(+), 207 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/rules.yml=0D
 create mode 100644 docs/devel/ci-jobs.rst=0D
 create mode 100644 docs/devel/ci-runners.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


