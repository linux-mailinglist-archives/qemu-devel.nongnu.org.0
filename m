Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F8498E8F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:46:46 +0100 (CET)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5Ib-0002Np-7y
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4WV-0001Xp-Bq
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4WS-0006zx-1n
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643050618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iOLCkNgTkyT6o/n1Q+81esh1O9MIW3Fj+KmMqO7c03c=;
 b=Ne3ZRb42mBYSga80cFbGKjpiZE39manoaO5+RqO5RzG35lAaLtuF6KDS7xOtey4pKKeaWH
 4j3tgU63bKcrgdVT4kW8PJAkIFKXF4zE1vNBv6miZaL2jCcrfuMoAU88t3yBkkrlTEHt9v
 4RKNoZTj0tCDzLohb7rIBeYOldrRwO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-kH7roSjsPaaFzOSQGYRGMA-1; Mon, 24 Jan 2022 13:56:55 -0500
X-MC-Unique: kH7roSjsPaaFzOSQGYRGMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F76310168C0;
 Mon, 24 Jan 2022 18:56:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4C2E348F6;
 Mon, 24 Jan 2022 18:56:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Python: setuptools v60+ workaround
Date: Mon, 24 Jan 2022 13:56:41 -0500
Message-Id: <20220124185643.641848-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Long story short: Python 3.7/3.8 on Fedora with setuptools v60.0.0+=0D
together create a bug that ultimately causes pylint to fail. See the=0D
first commit message for more detail.=0D
=0D
I sent out a hotfix last week to fix this behavior on our CI, but this=0D
series offers a more comprehensive fix and reverts the hotfix.=0D
=0D
John Snow (2):=0D
  Python: setuptools v60.0 workaround=0D
  Revert "python: pin setuptools below v60.0.0"=0D
=0D
 python/Makefile                | 2 --=0D
 python/setup.cfg               | 1 -=0D
 python/tests/iotests-pylint.sh | 3 ++-=0D
 python/tests/pylint.sh         | 3 ++-=0D
 4 files changed, 4 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


