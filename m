Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E5E5576
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 22:51:39 +0200 (CEST)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO6Yc-0002IG-Kc
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 16:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iO6I8-0002Cc-JD
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 16:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iO6I6-0000JG-PR
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 16:34:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42706
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iO6I6-0000Ig-GU
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 16:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572035673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kFOQG1Url58ubdBmLmcdkmGh9cHT7ydVMBZuPvm0HqI=;
 b=R5QMYFvtqlXtPIaE8H6gywMmxnfiJvnj5rFl+01flgj1SJGK8KIGN2aaApkRNB5EP83ShV
 ic3JLLmLR7viSoIb6UpSdBaKd+VDM5Hp7A34yju2aXjzZ+e5hVX1c4Q0v8hNCcitdD/LLX
 O3Fkqc0d/cGPtSuY+gvzN8GydH3Lnl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-XzPVY2dRMrSdpSbVgQFx4Q-1; Fri, 25 Oct 2019 16:34:29 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1554247B;
 Fri, 25 Oct 2019 20:34:29 +0000 (UTC)
Received: from localhost (ovpn-116-62.gru2.redhat.com [10.97.116.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2D921001B33;
 Fri, 25 Oct 2019 20:34:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] Require Python >= 3.5 to build QEMU
Date: Fri, 25 Oct 2019 17:34:26 -0300
Message-Id: <20191025203427.20181-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: XzPVY2dRMrSdpSbVgQFx4Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 03bf012e523ecdf047ac56b2057950247256064d=
:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into stagi=
ng (2019-10-25 14:59:53 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/python-next-pull-request

for you to fetch changes up to d24e417866f85229de1b75bc5c0a1d942451a842:

  configure: Require Python >=3D 3.5 (2019-10-25 16:34:57 -0300)

----------------------------------------------------------------
Require Python >=3D 3.5 to build QEMU

----------------------------------------------------------------

Eduardo Habkost (1):
  configure: Require Python >=3D 3.5

 configure              | 18 ++++--------------
 tests/Makefile.include |  5 -----
 2 files changed, 4 insertions(+), 19 deletions(-)

--=20
2.21.0


