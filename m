Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97065465E2C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 07:20:58 +0100 (CET)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msfSj-00076J-2g
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 01:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1msfQ2-0005WZ-89
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:18:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1msfPx-00046q-BB
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638425884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UQGdl0hlCpESOtGvOD0etQGab0M5Filytmq2VbJh00o=;
 b=W/LF0aery5gveUgk2/2JD8msNUo8CMVtrqHwxrAazmZNXr02YYNZ/X7CdqnAwmikoYHfpR
 u6/lBWSe41SOGyqPnEwb90jIdaYsvrEqlRMTHxnOA2JyqM8mHeIlDs0m14UD36RRRK5keD
 /MUxYbj8Esgds68IzYSvDS3YwtKILRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-BbEWffrPNXqZ1mBavICKqw-1; Thu, 02 Dec 2021 01:18:00 -0500
X-MC-Unique: BbEWffrPNXqZ1mBavICKqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6F52F20;
 Thu,  2 Dec 2021 06:17:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF975D9CA;
 Thu,  2 Dec 2021 06:17:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.2 0/3] Ide patches
Date: Thu,  2 Dec 2021 01:17:53 -0500
Message-Id: <20211202061756.35224-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 682aa69b1f4dd5f2905a94066fa4c853adc33251=
:=0D
=0D
  Update version for v6.2.0-rc3 release (2021-12-01 07:20:06 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/ide-pull-request=0D
=0D
for you to fetch changes up to cc20926e9b8077bff6813efc8dcdeae90d1a3b10:=0D
=0D
  tests/qtest/fdc-test: Add a regression test for CVE-2021-20196 (2021-12-0=
2 01:09:38 -0500)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/block/fdc: Extract blk_create_empty_drive()=0D
  hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196=0D
  tests/qtest/fdc-test: Add a regression test for CVE-2021-20196=0D
=0D
 hw/block/fdc.c         | 23 ++++++++++++++++++++---=0D
 tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 58 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


