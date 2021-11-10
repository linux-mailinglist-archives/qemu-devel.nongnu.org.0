Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1E44C366
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:52:49 +0100 (CET)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkoxy-0002jB-A1
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mkouc-0000Qt-Uc
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mkoua-0007Oy-G0
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636555755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeUYQwa9yvn4ixeCrDp6G43rNBPGoPA9tRvu0OivA80=;
 b=N5m1IpU8me6iubjZfMiXcGvhewoux1qjOW2z+tVjyYGVC0Zoo2ay96ZNiP8qGMkI3m2R3R
 BKl6wg2y8cAQdrXrRRneXcFwG6VP0YVx4R8SRCx3bshB0nWNFbXIyWKdf0rcaO+d5vrZqI
 N47GP3k0S5m/NvGyTRz9Rb6c9MU1XZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-DYL66gpQN5uxNzVPLyK_iw-1; Wed, 10 Nov 2021 09:49:12 -0500
X-MC-Unique: DYL66gpQN5uxNzVPLyK_iw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2880804018;
 Wed, 10 Nov 2021 14:49:10 +0000 (UTC)
Received: from paraplu.lan (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D298468397;
 Wed, 10 Nov 2021 14:49:06 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] docs: rSTify the "TrivialPatches" wiki
Date: Wed, 10 Nov 2021 15:49:00 +0100
Message-Id: <20211110144902.388183-2-kchamart@redhat.com>
In-Reply-To: <20211110144902.388183-1-kchamart@redhat.com>
References: <20211110144902.388183-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9=20?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original wiki is here[1].  I converted by copying the wiki source
into a .wiki file and convert to rST using `pandoc`:

        $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst

Update the active maintainer names (and drop Michael Tokarev's inactive
repo) to reflect current reality.

[1] https://wiki.qemu.org/Contribute/TrivialPatches

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/index.rst           |  1 +
 docs/devel/trivial-patches.rst | 50 ++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 docs/devel/trivial-patches.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f95df10b3e..f1822a35bf 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -45,3 +45,4 @@ modifying QEMU's source code.
    vfio-migration
    qapi-code-gen
    writing-qmp-commands
+   trivial-patches
diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
new file mode 100644
index 0000000000..db3f2001da
--- /dev/null
+++ b/docs/devel/trivial-patches.rst
@@ -0,0 +1,50 @@
+Trivial Patches
+===============
+
+Overview
+--------
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
+------------
+
+Since the trivial patch team rotates maintainership there is only one
+active repository at a time:
+
+- git://github.com/vivier/qemu.git trivial-patches - `browse <https://github.com/vivier/qemu/tree/trivial-patches>`__
+
+Workflow
+--------
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
+----
+
+If you would like to join the trivial patches team, contact Laurent
+Vivier. The current team includes:
+
+- `Laurent Vivier <mailto:laurent@vivier.eu>`__
-- 
2.31.1


