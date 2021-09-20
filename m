Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FCF412783
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:52:05 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQGi-00061X-Dp
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEZ-0003x2-3D
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQES-00084y-V4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632170983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l6FNH49gFaHqKFk3gfInNLK9NiMwGsTH/O+v5YOY14E=;
 b=CWH0VYmMqCIL1bbvQdRqh47E2tWkvUd80nMb2xQlxhV6+7ji61yhSd5JRSscDQEFrIqAUT
 6+sGCnRac4nhC1v8jyKayvW6xWZdde9UF39OWt/DJLexqEMyXTeW6wE8l3z1j/mRmrwNes
 0EActjXbWCqrfJEiZCfitxPz4FvqfRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-CjC5rheePSmL4R0dhjuoqA-1; Mon, 20 Sep 2021 16:49:40 -0400
X-MC-Unique: CjC5rheePSmL4R0dhjuoqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38EA1084681
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 20:49:39 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDC6319D9D;
 Mon, 20 Sep 2021 20:49:33 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] avocado_qemu: small fixes and tweaks
Date: Mon, 20 Sep 2021 17:49:26 -0300
Message-Id: <20210920204932.94132-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Standardize the super() calls according to PEP3135; fix import order based =
on=0D
isort; fix and tweak the ssh `connect` method; explicitly return None on=0D
`pick_default_qemu_bin` function to avoid linters R1710; and fix inheritanc=
e=0D
order on `LinuxTest` to avoid future problems.=0D
=0D
Note: borrowed https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg051=
17.html=0D
      for completeness.=0D
=0D
Cleber Rosa (1):=0D
  Acceptance Tests: add standard clean up at test tearDown()=0D
=0D
Willian Rampazzo (5):=0D
  avocado_qemu: standardize supper() call following PEP3135=0D
  avocado_qemu: fix import module based on isort=0D
  avocado_qemu: tweak ssh connect method=0D
  avocado_qemu: explicitly return None to avoid R1710=0D
  avocado_qemu: fix inheritance order on LinuxTest class=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py | 30 +++++++++--------------=0D
 1 file changed, 12 insertions(+), 18 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


