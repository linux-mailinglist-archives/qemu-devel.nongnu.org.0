Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6D4D8035
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:52:17 +0100 (CET)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTiJE-00063w-CU
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:52:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH4-0004bP-WB
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH1-0004O0-9g
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647254997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9/B1O7//yUKVRvdvZmJxSPvGnas7D/J907/UTN/Maq4=;
 b=NJdnwUQaneoMj/GXg89E23ZNWMjYMWLUmfLgu+6BoXA1cWQkNtIXvYMFccI8irEVfw+5aM
 tj32C8sJUNec2GnjIUgJEwyw6breMntNLaJ0DNU/NBJ/NjcR6yYar2Nl/g98CAW3tAxBPz
 vh84kaZufqtPJGVDxuWiuAM9RX1VCak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-j-ye0j3QOQS1xMl2Hf0olA-1; Mon, 14 Mar 2022 06:49:54 -0400
X-MC-Unique: j-ye0j3QOQS1xMl2Hf0olA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 771CF185A7B2;
 Mon, 14 Mar 2022 10:49:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78ABA4050C65;
 Mon, 14 Mar 2022 10:49:52 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] rSTify a few more docs; move them to QEMU Git
Date: Mon, 14 Mar 2022 11:49:40 +0100
Message-Id: <20220314104943.513593-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 Kashyap Chamarthy <kchamart@redhat.com>, eblake@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series rST-ifies:=0D
=0D
  - security-process[1]=0D
  - MailingLists[2]=0D
  - GettingStartedDevelopers[3]=0D
=0D
The 'security-process' page is from the QEMU web and is moved to=0D
docs/devel/ in QEMU Git.  This is based on Paolo's feedback here[4].=0D
The next two docs are converted from the Wiki.=0D
=0D
[1] https://www.qemu.org/contribute/security-process=0D
[2] https://wiki.qemu.org/Contribute/MailingLists=0D
[3] https://wiki.qemu.org/Documentation/GettingStartedDevelopers=0D
[4] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html=
=0D
=0D
Kashyap Chamarthy (3):=0D
  docs: rSTify "security-process" page; move it to QEMU Git=0D
  docs: rSTify MailingLists wiki; move it to QEMU Git=0D
  docs: rSTify GettingStartedDevelopers wiki; move it to QEMU Git=0D
=0D
 docs/devel/getting-started-developers.rst | 200 ++++++++++++++++++++++=0D
 docs/devel/index.rst                      |   3 +=0D
 docs/devel/mailing-lists.rst              |  53 ++++++=0D
 docs/devel/security-process.rst           | 190 ++++++++++++++++++++=0D
 4 files changed, 446 insertions(+)=0D
 create mode 100644 docs/devel/getting-started-developers.rst=0D
 create mode 100644 docs/devel/mailing-lists.rst=0D
 create mode 100644 docs/devel/security-process.rst=0D
=0D
--=20=0D
2.33.1=0D
=0D


