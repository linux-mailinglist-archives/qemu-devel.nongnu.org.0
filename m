Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739144DA38
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:17:42 +0100 (CET)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlClh-0002ry-2V
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:17:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mlCbq-0001Pj-GF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:07:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mlCbn-0001iR-U0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636646846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z3JQAsoo6e5Fvxxeewovz7gMHOhF88PdHyRwBZ+N2I0=;
 b=WJ6NK+Jxf8nY/BsFvBNNDDYBMO+6lcFWt7nONEoZhOKWrvhGIsopZysCbg4jhjXtxOAWL9
 wgEj17arAtiJdtP51LwfduqaP3nH42Y2Dba9xMGxzA0LRlwSONDtbMO6p+HUT6ol8kV5Yt
 nuAev97ZYKYXOptiyzVLY/ZfpYYgj1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-NjOL5uhvNhyd8YrFRG6CZA-1; Thu, 11 Nov 2021 11:06:16 -0500
X-MC-Unique: NjOL5uhvNhyd8YrFRG6CZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F3DD871814;
 Thu, 11 Nov 2021 16:06:15 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.32.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA4D5D6D7;
 Thu, 11 Nov 2021 16:05:06 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Jobs based on custom runners: add CentOS Stream 8
Date: Thu, 11 Nov 2021 11:05:00 -0500
Message-Id: <20211111160501.862396-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a new custom runner, showing an example of how other=0D
entities can add their own custom jobs to the GitLab CI pipeline.=0D
=0D
The runner (the machine and job) is to be managed by Red Hat, and=0D
adds, at the very least, bare metal x86_64 KVM testing capabilities to=0D
the QEMU pipeline.  This brings extra coverage for some unittests, and=0D
the ability to run the Avocado tests that depend on KVM.=0D
=0D
The runner is already completely set up and registered to the=0D
https://gitlab.com/qemu-project/qemu project instance.  Jobs will be=0D
triggered according to the same rules for the jobs s390x and aarch64=0D
jobs running on QEMU project's custom runners, that is, pushes to the=0D
staging branch of the "qemu-project" project, or by setting a specific=0D
variable.=0D
=0D
Still, the job is set with mode "allow failures", so it should not=0D
disrupt the existing pipeline.  Once its reliability is proved (rules=0D
and service levels are to be determined), it can be "upgraded" to=0D
a "gating" condition.=0D
=0D
Even though the formal method of tracking machine/job maintainers have=0D
not been formalized, it should be known that the contacts/admins for=0D
this machine and job are:=0D
=0D
 - Willian Rampazzo=0D
   <willianr@redhat.com>=0D
   willianr on #qemu=0D
=0D
 - Cleber Rosa=0D
   <crosa@redhat.com>=0D
   clebergnu on #qemu=0D
=0D
One example of a job introduced here, running on the host reserved for=0D
this purpose can be seen at:=0D
=0D
 - https://gitlab.com/cleber.gnu/qemu/-/jobs/1773761640=0D
=0D
Changes from v1[1]:=0D
=0D
 * Replaced "--disable-fdt" for "--enable-fdt", given that according=0D
   to "TARGET_NEED_FDT=3Dy" in "configs/targets/x86_64-softmmu.mak" it=0D
   is required for x86_64-softmmu.=0D
=0D
 * Added libfdt-devel to list of package requirements (see previous=0D
   point for reasoning).=0D
=0D
 * Removed patch 1 that contained a duplicate bug fix.=0D
=0D
 * Removed patches 2 and 3 that implemented a "feature probe" and=0D
   "feature requirement" that would cancel tests if features were not=0D
   present.  That will be treated in a different patch series.=0D
=0D
 * Removed --disable-jemalloc and --disabletcmalloc according to=0D
   3b4da1329.=0D
=0D
 * Introduced "test-avocado" script with a list of vetted tests=0D
=0D
 * Do not install meson from CentOS Stream 8 PowerTools repo, instead=0D
   meson from git submodule due to minimum version requirements.=0D
=0D
 * Sync with commit f68d21ab8eac56c4097a3d63a8c86689bb507911 (HEAD of=0D
   c8s-stream-rhel branch) from CentOS repo at=0D
   https://git.centos.org/rpms/qemu-kvm/.=0D
=0D
 * Further separated distribution version and architecture specific=0D
   files into separate sub directories.=0D
=0D
 * Added a gitlab CI rule and variable to allow other repos/users who=0D
   have a CentOS Stream 8 x86_64 runner to trigger the job.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02066.html=0D
=0D
Cleber Rosa (1):=0D
  Jobs based on custom runners: add CentOS Stream 8=0D
=0D
 .gitlab-ci.d/custom-runners.yml               |  29 +++=0D
 docs/devel/ci-jobs.rst.inc                    |   7 +=0D
 .../org.centos/stream/8/build-environment.yml |  51 +++++=0D
 .../ci/org.centos/stream/8/x86_64/configure   | 208 ++++++++++++++++++=0D
 .../org.centos/stream/8/x86_64/test-avocado   |  70 ++++++=0D
 scripts/ci/org.centos/stream/README           |  17 ++=0D
 scripts/ci/setup/build-environment.yml        |  38 ++++=0D
 7 files changed, 420 insertions(+)=0D
 create mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml=0D
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure=0D
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado=0D
 create mode 100644 scripts/ci/org.centos/stream/README=0D
=0D
--=20=0D
2.33.1=0D
=0D


