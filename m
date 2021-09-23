Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848A415490
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:19:07 +0200 (CEST)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCS9-0004Qw-PL
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPl-0001de-TN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPg-0000sa-BF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632356190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WiTuEiQKm8JOsPWadW3pQctkKAW2futR3jRN7jPi4Fw=;
 b=J6v2QeVzYRAIg/CII9K1cZYqzo+okhmwczBpjI5RF6H/6CYuFy7V5Txm/VvAkfs4ArFWI9
 4MJQDjherTkYIEDop7XzDB5/vM+2ZJ/77+8XPGTV3PZP1EBOoYC+p/ym0C7vi5nNBOYBG1
 I6CcbCogGVACf0m5fXD1tqksagJGc+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-tvBk94MPML2knqyC_hF0zA-1; Wed, 22 Sep 2021 20:16:28 -0400
X-MC-Unique: tvBk94MPML2knqyC_hF0zA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AED311084692;
 Thu, 23 Sep 2021 00:16:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B6131017E36;
 Thu, 23 Sep 2021 00:16:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] iotests: update environment and linting configuration
Date: Wed, 22 Sep 2021 20:16:19 -0400
Message-Id: <20210923001625.3996451-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt1=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/375630185=0D
=0D
This series partially supersedes:=0D
  [PATCH v3 00/16] python/iotests: Run iotest linters during Python CI'=0D
=0D
Howdy, this is good stuff we want even if we aren't yet in agreement=0D
about the best way to run iotest 297 from CI.=0D
=0D
- Update linting config to tolerate pylint 2.11.1=0D
- Eliminate sys.path hacking in individual test files=0D
- make mypy execution in test 297 faster=0D
=0D
The rest of the actual "run at CI time" stuff can get handled separately=0D
and later pending some discussion on the other series.=0D
=0D
--js=0D
=0D
John Snow (6):=0D
  iotests: add 'qemu' package location to PYTHONPATH in testenv=0D
  iotests: add warning for rogue 'qemu' packages=0D
  iotests/linters: check mypy files all at once=0D
  iotests/mirror-top-perms: Adjust imports=0D
  iotests/migrate-bitmaps-test: delint=0D
  iotests: Update for pylint 2.11.1=0D
=0D
 tests/qemu-iotests/235                        |  2 -=0D
 tests/qemu-iotests/297                        | 50 ++++++++-----------=0D
 tests/qemu-iotests/300                        |  7 ++-=0D
 tests/qemu-iotests/iotests.py                 |  2 -=0D
 tests/qemu-iotests/pylintrc                   |  6 ++-=0D
 tests/qemu-iotests/testenv.py                 | 35 ++++++++++---=0D
 tests/qemu-iotests/testrunner.py              |  7 +--=0D
 tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------=0D
 tests/qemu-iotests/tests/mirror-top-perms     | 12 ++---=0D
 9 files changed, 95 insertions(+), 76 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


