Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758153E5C0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:45:35 +0200 (CEST)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFr8-0005hb-5k
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nyFpT-0004HO-65
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nyFpQ-0005Q6-Cs
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654533823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MggeN51B46F56DD5951fRLJU42fuQgMz49JTcX8cs7w=;
 b=dxAYJ2Zj0lqDqsml0bJE4H9tiTFN2rar9aA4s8xqDkk84kBGAhAXfU6gkWSPa/A+P5uR3v
 rCSH20vRimhntQ0+EQPNu+wV4lO3/Et2uKRNgKORSctFZhc2nOYoji/sunFLHEyz78ck9s
 Phs4Mp31hxxcXVziwq8qx/K7YFnstuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-GTXhutPiNta3iL8CxFfj-A-1; Mon, 06 Jun 2022 12:43:40 -0400
X-MC-Unique: GTXhutPiNta3iL8CxFfj-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDC0185A79C;
 Mon,  6 Jun 2022 16:43:39 +0000 (UTC)
Received: from pinwheel.redhat.com (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5E0DC15E72;
 Mon,  6 Jun 2022 16:43:37 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, thuth@redhat.com, peter.maydell@linaro.org,
 eblake@redhat.com, Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v3 0/4] In v3:
Date: Mon,  6 Jun 2022 18:43:32 +0200
Message-Id: <20220606164336.245740-1-kchamart@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Add back the "<commit hash/link>" fragment in security-process.rst
  [Thomas]
- Add a docs/about/contacting-the-project.rst as per Peter's feedback
  here:
  https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05178.html
  [pm215]
- Keep Thomas' R-by for "docs: rSTify MailingLists wiki; move it to QEMU
  Git"

v2 cover letter:
-----------------------------------------------------------------------
rSTify a few more docs; move them to QEMU Git

This series rST-ifies:

  - security-process[1]
  - MailingLists[2]
  - GettingStartedDevelopers[3]

The 'security-process' page is from the QEMU web and is moved to
docs/devel/ in QEMU Git.  This is based on Paolo's feedback here[4].
The next two docs are converted from the Wiki.

[1] https://www.qemu.org/contribute/security-process
[2] https://wiki.qemu.org/Contribute/MailingLists
[3] https://wiki.qemu.org/Documentation/GettingStartedDevelopers
[4] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
-----------------------------------------------------------------------

Kashyap Chamarthy (4):
  docs: rSTify "security-process" page; move it to QEMU Git
  docs: rSTify MailingLists wiki; move it to QEMU Git
  docs: rSTify GettingStartedDevelopers wiki; move it to QEMU Git
  Add a new doc "contacting-the-project.rst"

 docs/about/contacting-the-project.rst     |  16 ++
 docs/about/index.rst                      |   1 +
 docs/devel/getting-started-developers.rst | 200 ++++++++++++++++++++++
 docs/devel/index.rst                      |   3 +
 docs/devel/mailing-lists.rst              |  51 ++++++
 docs/devel/security-process.rst           | 190 ++++++++++++++++++++
 6 files changed, 461 insertions(+)
 create mode 100644 docs/about/contacting-the-project.rst
 create mode 100644 docs/devel/getting-started-developers.rst
 create mode 100644 docs/devel/mailing-lists.rst
 create mode 100644 docs/devel/security-process.rst

-- 
2.36.1


