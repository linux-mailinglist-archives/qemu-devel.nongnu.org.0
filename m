Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9465DE04
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 22:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDAwk-0006bO-TH; Wed, 04 Jan 2023 16:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDAwj-0006b0-Nd
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDAwf-0006rE-HT
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672866300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=33xqhG+IulawvqYqKpPCwlwdDSubkBntNfkN6K8fPmQ=;
 b=GtBhT0eq7pW+YfMFJcCVxIzLvOcGnexdMSdi2WLO6hawPuxsWtOEkbhGNTZg79VBctgv6o
 JQNun30APlOJOGGJXfu4q+uGVPYA1EhAzCDwXmV6c6w5k//LpN5xSFteDwJiaQmK85vZeI
 /O+dC3psOj3GA+jmf/HYU+gXwtE4p4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-edwgjvOwObqGR1L99tDlPw-1; Wed, 04 Jan 2023 16:04:56 -0500
X-MC-Unique: edwgjvOwObqGR1L99tDlPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6001D3C025A2;
 Wed,  4 Jan 2023 21:04:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD5EA2026D4B;
 Wed,  4 Jan 2023 21:04:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 0/5] Python patches
Date: Wed,  4 Jan 2023 16:04:50 -0500
Message-Id: <20230104210455.571473-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit ecc9a58835f8d4ea4e3ed36832032a71ee08fbb2=
:=0D
=0D
  Merge tag 'pull-9p-20221223' of https://github.com/cschoenebeck/qemu into=
 staging (2023-01-04 14:53:59 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 519f3cfce07a067971ff39d4a989b77e7100a947:=0D
=0D
  python: add 3.11 to supported list (2023-01-04 13:46:05 -0500)=0D
=0D
----------------------------------------------------------------=0D
Python patch roundup=0D
=0D
Mostly CI fixes and some small debugging improvements.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (5):=0D
  python/machine: Add debug logging to key state changes=0D
  python/machine: Handle termination cases without QMP=0D
  Python: fix flake8 config=0D
  iotests/check: Fix typing for sys.exit() value=0D
  python: add 3.11 to supported list=0D
=0D
 python/qemu/machine/machine.py | 31 +++++++++++++++++++++++++++++++=0D
 python/setup.cfg               |  6 ++++--=0D
 tests/qemu-iotests/check       |  2 +-=0D
 3 files changed, 36 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D


