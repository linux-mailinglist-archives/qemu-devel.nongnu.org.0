Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8093F3C37
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 21:06:38 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHWKD-0004lc-6a
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 15:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHWIi-0003Ko-7y
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHWId-0001Rp-UZ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629572697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mn41FdOMZAIsatqa6fzeqQEJ6zKdo3OIhFp61Mj50aM=;
 b=C/Cb0r3MTgY17suNf2hr0x/F5Z1WQdMFl34dOmSy7FW97lnlPiJGAZCGlWbJ9B2TWKRYRB
 dPBaaVk8vDFgEhgPGSAKH27zQC2UYGDuJqLqWzGM9OWNyRfhFkudb4IYubxtm/V94VqHzU
 PX2qYbliTYYs7HkqH2UZLidFNthJxOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-EARSHBNcO5C0uLpDPjgzsA-1; Sat, 21 Aug 2021 15:04:56 -0400
X-MC-Unique: EARSHBNcO5C0uLpDPjgzsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F83C1082925;
 Sat, 21 Aug 2021 19:04:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4FB17010;
 Sat, 21 Aug 2021 19:04:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Update check-python-tox test for pylint 2.10
Date: Sat, 21 Aug 2021 15:04:50 -0400
Message-Id: <20210821190451.3039867-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: John Snow <jsnow@redhat.com>, G S Niteesh Babu <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'check-python-tox' CI test will probably start showing warnings=0D
without this. This can go into the next release, just ignore the CI=0D
warning until the tree opens.=0D
=0D
John Snow (1):=0D
  python: Update for pylint 2.10=0D
=0D
 python/qemu/machine/machine.py | 6 ++++--=0D
 python/setup.cfg               | 1 +=0D
 2 files changed, 5 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


