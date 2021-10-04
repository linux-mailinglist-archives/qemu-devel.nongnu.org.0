Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29414218F6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:07:42 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVBV-00035Q-Mv
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9F-0008Pz-TJ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9D-0007GQ-Vb
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E0UpKD2ka3dMhilx1+E9eSdU/EshNATRGaA45x/pYU4=;
 b=R6rq82ovxiKyZH8qsschDJB0WTYsRM4Je0JL87BtiBA3JyffdtcHGafNHAzfREI71QIWCv
 ox3CrPxv2IwmpFU++559sJP1uwc4r2nk44Ql2yqsKs4U1h5TnND7otRohn+hfFxn81XyY+
 zwhYVqDFa0uMKAbeOSmfUgp4ZaDhEXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-eBsljkApNuuf0_ZZzuEQjA-1; Mon, 04 Oct 2021 17:05:17 -0400
X-MC-Unique: eBsljkApNuuf0_ZZzuEQjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F3CF1808309;
 Mon,  4 Oct 2021 21:05:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4C119723;
 Mon,  4 Oct 2021 21:05:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] python/iotests: Run iotest linters during Python CI
Date: Mon,  4 Oct 2021 17:04:50 -0400
Message-Id: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt2=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/382320226=0D
Based-on: <20210923180715.4168522-1-jsnow@redhat.com>=0D
          [PATCH v2 0/6] iotests: update environment and linting configurat=
ion=0D
          (Staged at kwolf/block sans patch #2, not needed here.)=0D
=0D
Factor out pylint and mypy configuration from iotest 297 so that the=0D
Python test infrastructure in python/ can also run these linters. This=0D
will enable what is essentially iotest #297 to run via GitLab CI.=0D
=0D
This series generally aims to split "linter configuration" out of code=0D
so that both iotest #297 and the Python test suite can both invoke the=0D
same linters (nearly) identically.=0D
=0D
The differences occur where the Python entryway involves setting up a=0D
virtual environment and installing linter packages pinned at specific=0D
versions so that the CI test can be guaranteed to behave=0D
deterministically.=0D
=0D
iotest #297 is left as a way to run these tests as a convenience until I=0D
can integrate environment setup and test execution as a part of 'make=0D
check' or similar to serve as a replacement. This invocation just trusts=0D
you've installed the right packages into the right places with the right=0D
versions, as it always has.=0D
=0D
V4:=0D
=0D
- Some optimizations and touchups were included in 'PATCH v2 0/6]=0D
  iotests: update environment and linting configuration' instead, upon=0D
  which this series is now based.=0D
- Rewrote most patches, being more aggressive about the factoring=0D
  between "iotest" and "linter invocation". The patches are smaller now.=0D
- Almost all configuration is split out into mypy.ini and pylintrc.=0D
- Remove the PWD/CWD juggling that the previous versions added; it's not=0D
  strictly needed for this integration. We can re-add it later if we=0D
  wind up needing it for something.=0D
- mypy and pylintrc tests are split into separate tests. The GitLab CI=0D
  now lists them as two separate test cases, so it's easier to see what=0D
  is failing and why. (And how long those tests take.) It is also now=0D
  therefore possible to ask avocado to run just one or the other.=0D
- mypy bug workaround is only applied strictly in cases where it is=0D
  needed, optimizing speed of iotest 297.=0D
=0D
V3:=0D
 - Added patch 1 which has been submitted separately upstream,=0D
   but was necessary for testing.=0D
 - Rebased on top of hreitz/block, which fixed some linting issues.=0D
 - Added a workaround for a rather nasty mypy bug ... >:(=0D
=0D
V2:=0D
 - Added patches 1-5 which do some more delinting.=0D
 - Added patch 8, which scans subdirs for tests to lint.=0D
 - Added patch 17, which improves the speed of mypy analysis.=0D
 - Patch 14 is different because of the new patch 8.=0D
=0D
John Snow (13):=0D
  iotests/297: Move pylint config into pylintrc=0D
  iotests/297: Split mypy configuration out into mypy.ini=0D
  iotests/297: Add get_files() function=0D
  iotests/297: Don't rely on distro-specific linter binaries=0D
  iotests/297: Create main() function=0D
  iotests/297: Separate environment setup from test execution=0D
  iotests/297: Split run_linters apart into run_pylint and run_mypy=0D
  iotests/297: refactor run_[mypy|pylint] as generic execution shim=0D
  iotests: split linters.py out from 297=0D
  iotests/linters: Add entry point for linting via Python CI=0D
  iotests/linters: Add workaround for mypy bug #9852=0D
  python: Add iotest linters to test suite=0D
  iotests: [RFC] drop iotest 297=0D
=0D
 python/tests/iotests-mypy.sh           |  4 ++=0D
 python/tests/iotests-pylint.sh         |  4 ++=0D
 tests/qemu-iotests/297.out             |  2 -=0D
 tests/qemu-iotests/{297 =3D> linters.py} | 88 ++++++++++----------------=
=0D
 tests/qemu-iotests/mypy.ini            | 12 ++++=0D
 tests/qemu-iotests/pylintrc            | 16 +++++=0D
 6 files changed, 71 insertions(+), 55 deletions(-)=0D
 create mode 100755 python/tests/iotests-mypy.sh=0D
 create mode 100755 python/tests/iotests-pylint.sh=0D
 delete mode 100644 tests/qemu-iotests/297.out=0D
 rename tests/qemu-iotests/{297 =3D> linters.py} (52%)=0D
 mode change 100755 =3D> 100644=0D
 create mode 100644 tests/qemu-iotests/mypy.ini=0D
=0D
--=20=0D
2.31.1=0D
=0D


