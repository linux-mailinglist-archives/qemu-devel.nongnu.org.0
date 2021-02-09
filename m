Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D986C315105
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:57:24 +0100 (CET)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TW7-0008PW-Uj
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9TPW-0002Lf-Vk
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9TPU-000557-8t
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bg5Eq9Ssqm3r4H8s2GfMqXVOITZN4aC9qzfv61kwo7I=;
 b=guijaBDHDqNH38iAlUAnLeIDWwwLZP3+PY9MQ2ebGa790aoytVrSSbwpmfUf+0yO59PbUW
 AWWuvxGTZb+rHf5bwta50vPc14a0q89QNgCJywRDYew1ajHLy2YtLhx90lXwnjU4gSZ962
 n3+wEy4XBjXfzpyTVHamIv89BnTrfgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Q6hK25OQNsCmwgGanfhivA-1; Tue, 09 Feb 2021 08:50:16 -0500
X-MC-Unique: Q6hK25OQNsCmwgGanfhivA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1108D107ACE8;
 Tue,  9 Feb 2021 13:50:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-66.ams2.redhat.com
 [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF5AE5D9D0;
 Tue,  9 Feb 2021 13:50:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] travis: remove all use of Travis CI
Date: Tue,  9 Feb 2021 13:50:09 +0000
Message-Id: <20210209135011.1224992-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not sustainable to keep supporting Travis CI when our maintainer=0D
have exhausted their free CI credit allowance and it isn't easily=0D
renewable for most=0D
=0D
While there are still some unique scenarios covered by Travis, this is=0D
not useful when maintainers can't run the pipelines.  If people see=0D
scenarios that are desirable for GitLab CI they can be added as jobs=0D
when desired.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  tests/docker: remove travis container=0D
  travis: remove travis configuration and all references to Travis CI=0D
=0D
 .travis.yml                            | 439 -------------------------=0D
 MAINTAINERS                            |   3 -=0D
 configure                              |   1 -=0D
 contrib/gitdm/filetypes.txt            |   2 +-=0D
 docs/devel/testing.rst                 |  14 -=0D
 scripts/travis/coverage-summary.sh     |  27 --=0D
 tests/docker/Makefile.include          |  11 +-=0D
 tests/docker/docker.py                 |   2 +-=0D
 tests/docker/dockerfiles/travis.docker |  17 -=0D
 tests/docker/travis                    |  22 --=0D
 tests/docker/travis.py                 |  47 ---=0D
 tests/qemu-iotests/079                 |   2 +-=0D
 tests/test-util-filemonitor.c          |  11 -=0D
 13 files changed, 5 insertions(+), 593 deletions(-)=0D
 delete mode 100644 .travis.yml=0D
 delete mode 100755 scripts/travis/coverage-summary.sh=0D
 delete mode 100644 tests/docker/dockerfiles/travis.docker=0D
 delete mode 100755 tests/docker/travis=0D
 delete mode 100755 tests/docker/travis.py=0D
=0D
--=20=0D
2.29.2=0D
=0D


