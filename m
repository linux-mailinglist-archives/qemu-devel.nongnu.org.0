Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3545C752
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:29:15 +0100 (CET)
Received: from localhost ([::1]:55284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptGt-0006jB-0I
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:29:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mptFT-0004CT-Ly
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:27:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mptFQ-000632-RJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637764063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TBBPluFoWvCiU0FYxkN5Hb05Z5dpqmRH1BKV/6OsAAo=;
 b=NQ+q6mRe5glA1V677H+aGhWSsJ+KUwm9YJyHEjmkVTx/cCM7aVD6iZv180y2nyrGYG9bHu
 IBP2/mmBqBJ9QsnU0B/AqSM5UlgeD2HtYfXF6T265kVtBB1LqNECmFpvqeOwbJjRea0VvW
 itX7BL+FJrUcsOWWbja2j8og0BVhjfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-271-C4iQNFyUWMZud-tQvQ-1; Wed, 24 Nov 2021 09:27:38 -0500
X-MC-Unique: 271-C4iQNFyUWMZud-tQvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96605835E23;
 Wed, 24 Nov 2021 14:27:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FAC360843;
 Wed, 24 Nov 2021 14:27:32 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] rSTify 'report-a-bug' and 'security-process';
 move them to QEMU Git
Date: Wed, 24 Nov 2021 15:27:26 +0100
Message-Id: <20211124142728.1221817-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 Kashyap Chamarthy <kchamart@redhat.com>, eblake@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series rSTifies the said web pages[1][2] from the QEMU web and=0D
moves them to docs/devel/ in QEMU Git.  This is based on Paolo's=0D
feedback here[3].=0D
=0D
The rename to 'reporting-a-bug' is done to be consistent with the other=0D
in-tree docs.  And I put 'security-process' first because, we refer to=0D
it from 'reporting-a-bug'.  (If we reverse the order, the build fails --=0D
correctly so.)=0D
=0D
[1] https://www.qemu.org/contribute/report-a-bug/=0D
[2] https://www.qemu.org/contribute/security-process=0D
[3] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html=
=0D
=0D
Kashyap Chamarthy (2):=0D
  docs: rSTify "security-process" page; move it to QEMU Git=0D
  docs: rSTify "report-a-bug" page; move it to QEMU Git=0D
=0D
 docs/devel/index.rst            |   9 +-=0D
 docs/devel/reporting-a-bug.rst  |  37 +++++++=0D
 docs/devel/security-process.rst | 190 ++++++++++++++++++++++++++++++++=0D
 3 files changed, 233 insertions(+), 3 deletions(-)=0D
 create mode 100644 docs/devel/reporting-a-bug.rst=0D
 create mode 100644 docs/devel/security-process.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


