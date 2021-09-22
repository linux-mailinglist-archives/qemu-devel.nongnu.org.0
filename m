Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05B4148AC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:20:04 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1EJ-0006Tt-53
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT15q-00061C-BJ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT15o-0007rM-Da
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632312673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXUghhpOOj5Opiny6Hfy0OkONZUOcbTVfgkcsgaEIsY=;
 b=is3VA9Ft6DIuqbDw5BpQWlI052qVLBBBpLczH3nh6ZFr9ey3Ewcu4sSneXWBrHQVHKhzeU
 nOw+G4WcR58QBPzIq/n1GZscAPPiqazzElw/A92L8CiopuDUE59fsU/Fjt0ToJpzLa4wIK
 xDD26TKcUcmCNSehYJzlLdGQXaRQGrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-5HmU_4UWPbGWnT_gisZkbA-1; Wed, 22 Sep 2021 08:11:07 -0400
X-MC-Unique: 5HmU_4UWPbGWnT_gisZkbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A76271023F5A;
 Wed, 22 Sep 2021 12:11:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BAA517AE2;
 Wed, 22 Sep 2021 12:11:03 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] docs: rSTify the "TrivialPatches" wiki
Date: Wed, 22 Sep 2021 14:10:53 +0200
Message-Id: <20210922121054.1458051-3-kchamart@redhat.com>
In-Reply-To: <20210922121054.1458051-1-kchamart@redhat.com>
References: <20210922121054.1458051-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original wiki is here[1].  I converted by copying the wiki source
into a .wiki file and convert to rST using `pandoc`:

        $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst

[1] https://wiki.qemu.org/Contribute/TrivialPatches

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/trivial-patches.rst | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 docs/devel/trivial-patches.rst

diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
new file mode 100644
index 0000000000..4ad0d25b9d
--- /dev/null
+++ b/docs/devel/trivial-patches.rst
@@ -0,0 +1,53 @@
+===============
+Trivial Patches
+===============
+
+Overview
+========
+
+Trivial patches that change just a few lines of code sometimes languish
+on the mailing list even though they require only a small amount of
+review. This is often the case for patches that do not fall under an
+actively maintained subsystem and therefore fall through the cracks.
+
+The trivial patches team take on the task of reviewing and building pull
+requests for patches that:
+
+- Do not fall under an actively maintained subsystem.
+- Are single patches or short series (max 2-4 patches).
+- Only touch a few lines of code.
+
+**You should hint that your patch is a candidate by CCing
+qemu-trivial@nongnu.org.**
+
+Repositories
+============
+
+Since the trivial patch team rotates maintainership there is only one
+active repository at a time:
+
+- git://git.corpit.ru/qemu.git trivial-patches - `browse <http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches>`__
+- git://github.com/vivier/qemu.git trivial-patches - `browse <https://github.com/vivier/qemu/tree/trivial-patches>`__
+
+Workflow
+========
+
+The trivial patches team rotates the duty of collecting trivial patches
+amongst its members. A team member's job is to:
+
+1. Identify trivial patches on the development mailing list.
+2. Review trivial patches, merge them into a git tree, and reply to state
+   that the patch is queued.
+3. Send pull requests to the development mailing list once a week.
+
+A single team member can be on duty as long as they like. The suggested
+time is 1 week before handing off to the next member.
+
+Team
+====
+
+If you would like to join the trivial patches team, contact Michael
+Tokarev. The current team includes:
+
+- Michael Tokarev
+- `Laurent Vivier <mailto:laurent@vivier.eu>`__
-- 
2.31.1


