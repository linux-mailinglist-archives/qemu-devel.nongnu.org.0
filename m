Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1C4D8046
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:56:39 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTiNS-0002fx-UV
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:56:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiHB-0004g3-4L
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH7-0004b2-Kp
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647255005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5D5XY94fVZu1yqHQ2EE5JqRtI18NvgF23X8rdwRAHA=;
 b=JFmeGSeVb+3uI/whXLAykVl/16g5x91JaQgvYyoDsJRn36YxF4Dij9CP7Feo2g/NzSZs4r
 hy1eYjsrsRlP0DQS5Kcj8wCfzcravPhFBB0zV6BeyDEtm0yRjHdFpKMtC72gGqJo2s6hqd
 PhNLTclz05aPdjCOCNopZMsvXw91+wU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-ZJx72FyoPVy24kLAfpUADg-1; Mon, 14 Mar 2022 06:49:59 -0400
X-MC-Unique: ZJx72FyoPVy24kLAfpUADg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E949F1875068;
 Mon, 14 Mar 2022 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F17164050C66;
 Mon, 14 Mar 2022 10:49:57 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs: rSTify GettingStartedDevelopers wiki;
 move it to QEMU Git
Date: Mon, 14 Mar 2022 11:49:43 +0100
Message-Id: <20220314104943.513593-4-kchamart@redhat.com>
In-Reply-To: <20220314104943.513593-1-kchamart@redhat.com>
References: <20220314104943.513593-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Converted the wiki[1] from Markdown to rST using:

    $> pandoc -f Mediawiki -t rst getting-started-developers.wiki
        -o getting-started-developers.rst

It's a 1-1 conversion (I double-checked to the best I could).  I've also
checked that the hyperlinks work correctly post-conversion.

[1] https://wiki.qemu.org/Documentation/GettingStartedDevelopers

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/getting-started-developers.rst | 200 ++++++++++++++++++++++
 docs/devel/index.rst                      |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 docs/devel/getting-started-developers.rst

diff --git a/docs/devel/getting-started-developers.rst b/docs/devel/getting-started-developers.rst
new file mode 100644
index 0000000000..1299e1dfee
--- /dev/null
+++ b/docs/devel/getting-started-developers.rst
@@ -0,0 +1,200 @@
+.. _getting-started-developers:
+
+Getting Started for Developers
+==============================
+
+You want to contribute code, documentation or patches to QEMU?
+
+Then...
+
+-  ... you should probably first join the :ref:`mailing-lists`.
+
+   -  Mailing lists are moderated. Non-subscribers may post, so list
+      policy is reply-to-all to ensure original poster is included.
+   -  Be prepared for upwards of one thousand messages per week if you
+      subscribe.
+   -  First-time posts (whether subscribed or not) are subject to a
+      moderation delay until a human can whitelist your email address.
+
+-  Also check out the `patch
+   submission <https://www.qemu.org/docs/master/devel/submitting-a-patch.html>`__
+   page for some hints on mail contributions.
+
+Wiki
+----
+
+-  To create an account in the QEMU wiki, you must ask on the mailing
+   list for someone else to do it on your behalf (self-creation is
+   prohibited to cut down on spam accounts).
+-  Start with reading the QEMU wiki.
+-  Contribute to the QEMU wiki by adding new topics or improving and
+   expanding existing topics. It should help you and others in the
+   future.
+
+Documentation
+-------------
+
+-  Continue with reading the `existing documentation <Documentation>`__
+   and `Contributions Guide <Contribute>`__.
+
+   Be prepared that all written documentation might be invalid - either
+   because it is too old or because it was never correct. And it is
+   never complete...
+
+-  If you find bugs in the documentation then fix them and send patches
+   to the mailing list. See
+   `Contribute/ReportABug <Contribute/ReportABug>`__.
+-  If you find problems in the wiki, then fix them if you can, or add
+   notes to either the applicable page or the Discussion page.
+-  Depending on how much computer architecture / hardware background you
+   have, it may help to read some general books. Suggestions include:
+
+   -  "Computers as Components, Second Edition: Principles of Embedded
+      Computing System Design", Wayne Wolf, ISBN-13: 978-0123743978
+
+Code
+----
+
+-  Get the code. If you want to be a developer, you almost certainly
+   want to be building from git (see the
+   `Download <http://www.qemu-project.org/download/#source>`__ page for
+   the right tree).
+-  Compile the code. Here are some instructions how to do this:
+
+   -  `QEMU on Linux hosts <Hosts/Linux>`__
+   -  `QEMU on OS X (macOS) hosts <Hosts/Mac>`__
+   -  `QEMU on Windows hosts <Hosts/W32>`__
+
+-  Run the QEMU system and user mode emulation for different targets
+   (x86, mips, powerpc, ...). Images can be obtained from the
+   `Testing <Testing>`__ page.
+-  QEMU has a lot of different parts (hardware device emulation, target
+   emulation, code generation for different hosts, configuration, ...).
+
+   -  Choose an interesting part and concentrate on it for some time and
+      read the code. Its going to take some effort, so try to find
+      something that you are really interested in - something that will
+      be a least a little bit fun for you.
+   -  It will be easier if you choose a part of the code that has an
+      active / responsive maintainer (since this gives you someone to
+      discuss things with).
+
+-  If you find bugs in the code, then fix them and send a patch to the
+   mailing list (see `patch submission
+   process <https://www.qemu.org/docs/master/devel/submitting-a-patch.html>`__)
+
+   -  Patches need to go the mailing list, and possibly also to a
+      specific maintainer (read the MAINTAINERS text file in the top of
+      the source code tree).
+   -  Read the HACKING and CODING_STYLE text files (in the top of the
+      source code tree) before writing the patch
+   -  Run your patch through the . See
+      http://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html
+      for how to hook it into git.
+   -  For very small, simple changes, you can do it as a single patch.
+      If your change is more complex, you need to break it into smaller,
+      separate patches (which together form a set of patches, or a
+      patchset). Each step in the patch process can rely on previous
+      patches, but not later patches - otherwise "git bisect" will
+      break. This will require more effort on your part, but it saves a
+      lot of work for everyone else.
+   -  If you have a lot of patches in a patchset (say five or more),
+      then it may help to have a public git tree. You can get hosting
+      from many places (repo.or.cz and github seem popular).
+
+.. _getting_to_know_the_code:
+
+Getting to know the code
+------------------------
+
+-  QEMU does not have a high level design description document - only
+   the source code tells the full story.
+-  There are some useful (although usually dated) descriptions for
+   infrastructure code in various parts of the wiki, and sometimes in
+   mailing list descriptions:
+
+   -  Tracing framework is described at
+      `Features/Tracing <Features/Tracing>`__ and in docs/tracing.txt in
+      the source tree.
+   -  Some of the internal functionality (and a bit of the human
+      monitoring / control interface) is implemented in
+      `QAPI <Features/QAPI>`__ and `QMP <Documentation/QMP>`__. See also
+      https://www.linux-kvm.org/images/1/17/2010-forum-qmp-status-talk.pp.pdf
+   -  If you're into devices (new virtual hardware) it will help to know
+      about QDEV:
+      http://www.linux-kvm.org/images/f/fe/2010-forum-armbru-qdev.pdf
+      and docs/qdev-device-use.txt in the source tree
+
+-  Things do change -- we improve our APIs and develop better ways of
+   doing things all the time. Reading the mailing list is important to
+   keep on top of these changes. You may also find the
+   `DeveloperNews <DeveloperNews>`__ wiki page a useful summary. We try
+   to track API and design changes currently in progress on the
+   `ToDo/CodeTransitions <ToDo/CodeTransitions>`__ page; this may help
+   you avoid accidentally copying existing code which is out-of-date or
+   no longer following best practices.
+
+   -  We also maintain a list of
+      `Contribute/BiteSizedTasks <Contribute/BiteSizedTasks>`__ that can
+      help
+
+getting familiar with the code, and complete those transitions to make
+things easier for the next person!
+
+-  QEMU converts instructions in the guest system into instructions on
+   the host system via Tiny Code Generator (TCG). See tcg/README in the
+   source tree as a starting point if you want to understand this.
+-  Some of QEMU makes extensive use of pre-processor operations
+   (especially token pasting with ## operation) which can make it harder
+   to determine where a particular function comes from. Mulyadi Santosa
+   pointed out that you can use the gcc "--save-temps" option to see the
+   results of the pre-processor stage - see
+   http://the-hydra.blogspot.com/2011/04/getting-confused-when-exploring-qemu.html
+   for more detail.
+
+Bugs
+----
+
+-  Read the Bug Tracker.
+-  Check for topics in it for which you feel capable of handling and try
+   to fix the issue. Send patches.
+
+.. _testing_your_changes:
+
+Testing your changes
+--------------------
+
+-  You must compile test for all targets (i.e. don't restrict the
+   target-list at configure time). Make sure its a clean build if you
+   are not sure.
+-  Think about what you've changed (review the patches) and do testing
+   consistent with those changes. For example:
+
+   -  If you've developed a new driver (say an AHCI virtual device -
+      used for SATA disks), make sure that it works. Make sure anything
+      related still works (e.g. for AHCI, check the IDE driver, and no
+      disk configurations). If your new device supports migration, make
+      sure migration and snapshots work.
+   -  If you're working on Xen Hardware Virtual Machine (HVM - full
+      virtualization), then make sure that Xen para-virtualization
+      works.
+
+-  Its OK if your new implementation doesn't do everything (or has some
+   deficiencies / bugs). You do need to declare that in the patch
+   submission though.
+-  Main page for testing resources: `Testing <Testing>`__
+
+.. _getting_help:
+
+Getting Help
+------------
+
+-  IRC might be useful
+
+   -  The #qemu channel is on irc://irc.oftc.net (note: no longer on
+      Freenode).
+   -  You may also get a response on the #kvm channel on
+      irc://irc.freenode.net
+
+Please don't post large text dumps on IRC. Use a pastebin service to
+post logs so the channel doesn't get flooded.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index fb9d9f3a80..afead67200 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -13,6 +13,7 @@ modifying QEMU's source code.
    code-of-conduct
    conflict-resolution
    mailing-lists
+   getting-started-developers
    build-system
    style
    kconfig
-- 
2.33.1


