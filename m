Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A048A39E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:27:47 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n744o-00036J-Fb
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n742w-0000XR-LA
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n742u-0007sI-Ae
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P8Ntixc+BLZVcfmjqdjieNjjTDQmZ/cAOd2V1bxowOQ=;
 b=HDTigWoy4MAW02Ub0HQg/MWCMoohiSOQJtwRi42ZSTI6KEDf/RagcpQBBkl2+JLPGTPlKB
 Bv0PSOevRodvFbw57ZhhAN0/TsDCLC/ElDKTT1XCE9rM8E/Pci5+fLITY0qlGz8rEJvCDo
 iChy47vb2b1hETUxVt/4CKiECxoe5r8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-jYaXlzbsPfuAHD8TW0J65A-1; Mon, 10 Jan 2022 18:25:44 -0500
X-MC-Unique: jYaXlzbsPfuAHD8TW0J65A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08851083F60;
 Mon, 10 Jan 2022 23:25:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EC845E275;
 Mon, 10 Jan 2022 23:25:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Python patches
Date: Mon, 10 Jan 2022 18:25:17 -0500
Message-Id: <20220110232521.1922962-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit de3f5223fa4cf8bfc5e3fe1fd495ddf468edcdf7=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-7.0-pull-reque=
st' into staging (2022-01-10 14:43:03 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 9ebfc5a583d8aa94bf1bc37c1f71559187fd809c:=0D
=0D
  simplebench: Fix Python syntax error (reported by LGTM) (2022-01-10 18:23=
:10 -0500)=0D
=0D
----------------------------------------------------------------=0D
Python pull request=0D
=0D
Fixes for the tests that broke during vacation, plus a simple syntax fix=0D
for a python script.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (3):=0D
  python/aqmp: use absolute import statement=0D
  Python/aqmp: fix type definitions for mypy 0.920=0D
  python: update type hints for mypy 0.930=0D
=0D
Stefan Weil (1):=0D
  simplebench: Fix Python syntax error (reported by LGTM)=0D
=0D
 python/qemu/aqmp/aqmp_tui.py         | 3 ++-=0D
 python/qemu/aqmp/protocol.py         | 5 +++--=0D
 python/qemu/qmp/qom_common.py        | 6 +-----=0D
 scripts/simplebench/bench-example.py | 2 +-=0D
 4 files changed, 7 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


