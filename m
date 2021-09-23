Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD741650A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:14:28 +0200 (CEST)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTEo-0005EM-Dd
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT84-0005FT-GV
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT7x-0003MR-6Y
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632420440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=04XUqMymTwyYFyl7q0yV0VK8XAgIXtYlrhpjul5u0DY=;
 b=NMQA1HzQfPtmP7qq70Ca2VeeCFZlM0UKjOcpDC543TvC/haxoTB9XFWEuYLStW22+pwnLy
 ZUdWoU6NvH1eczcVO9QA0aedHv/yj+BC7Xzo7wf061BQC5b+qJJY4tDJT4ZUTaDZYEG+SL
 GJIoigoU5kXheyEITQ3UyJHsFssolWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-c-bHS_uOO9-78WlUVe9Y0A-1; Thu, 23 Sep 2021 14:07:18 -0400
X-MC-Unique: c-bHS_uOO9-78WlUVe9Y0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE0EF100C612;
 Thu, 23 Sep 2021 18:07:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3632560BE5;
 Thu, 23 Sep 2021 18:07:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] iotests: update environment and linting configuration
Date: Thu, 23 Sep 2021 14:07:09 -0400
Message-Id: <20210923180715.4168522-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt1=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/376236687=0D
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
V2:=0D
=0D
001/6:[0011] [FC] 'iotests: add 'qemu' package location to PYTHONPATH in te=
stenv'=0D
002/6:[0025] [FC] 'iotests: add warning for rogue 'qemu' packages'=0D
=0D
- Squashed in a small optimization from Vladimir to 001, kept R-Bs.=0D
- Fixed the package detection logic to not panic if it can't find=0D
  'qemu' at all (kwolf)=0D
- Updated commit messages for the first two patches.=0D
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
 tests/qemu-iotests/testenv.py                 | 39 ++++++++++++---=0D
 tests/qemu-iotests/testrunner.py              |  7 +--=0D
 tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------=0D
 tests/qemu-iotests/tests/mirror-top-perms     | 12 ++---=0D
 9 files changed, 99 insertions(+), 76 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


