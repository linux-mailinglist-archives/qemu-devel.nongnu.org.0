Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E945907F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:46:28 +0100 (CET)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAaR-00027u-8I
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXo-0007p6-1F
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXi-0004Jp-RL
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fc1HjQg8TpuYwpy2AKGKjA857hvg4Gpmr3FrQ4eW7W8=;
 b=UT3GcpaRDZuzBhKgzSl5LSfFL1dvpE9L58OZAywEt8M7irJhdtaCJpMeLYl3SnW+IoTWnp
 FXKNFHvcIvoQcIP+DT+oFK6hCCHIJrw9h5dCk3yW4cvvcS877adhfyhw4SkL704zSxnNnO
 FTRetU5MJ2wWmIWmE6gL1J76hTYAilU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-7VV_q_0NMFmU9zCHVTZymg-1; Mon, 22 Nov 2021 09:43:30 -0500
X-MC-Unique: 7VV_q_0NMFmU9zCHVTZymg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C74F10151E0;
 Mon, 22 Nov 2021 14:43:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E14B60C25;
 Mon, 22 Nov 2021 14:43:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/6] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
Date: Mon, 22 Nov 2021 15:43:15 +0100
Message-Id: <20211122144320.29178-2-thuth@redhat.com>
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
References: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kashyap Chamarthy <kchamart@redhat.com>

I completely botched up the merged[0] rST conversion of this document by
accidentally dropping entire hunks (!) of text. :-(  I made it very hard
for reviewers to spot it, as the omitted text was buried deep in the
document.  To fix my hatchet job, I reconverted the "SubmitAPatch"
wiki[1] page from scratch and replaced the existing rST with it, while
making sure I incorporated previous feedback.

In summary, in this reconverted edition:

- I did a careful (to the extent my eyes allowed) para-by-para
  comparison of the wiki and the rST to make sure I didn't omit
  anything accidentally.

- I made sure to work in the cosmetic feedback[2] that Thomas Huth
  pointed out in the merged (and botched) edition:

   - fix the hyperlinks in "Split up long patches"

   - replace ".". with "does not end with a dot" (in "Write a meaningful
     commit message" section)

   - replace "---" with ``---`` so that it doesn't render as an em-dash
     (there were two other occurrences; I fixed those too)

- Use "QEMU" spelling consistently in prose usage

- Add a consistent "refer to git-config" link where appropriate

Thanks to Thomas Huth and Alex Bennée for noticing it on IRC.  And sorry
for my sloppiness.

Fixes: 9f73de8df033 ("docs: rSTify the "SubmitAPatch" wiki")

[0] https://gitlab.com/qemu-project/qemu/-/commit/9f73de8df033
[1] https://wiki.qemu.org/index.php?title=Contribute/SubmitAPatch&oldid=10387
[2] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg03600.html

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Message-Id: <20211119193118.949698-2-kchamart@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[thuth: Some more cosmetical changes, fixed links from external to internal]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/stable-process.rst            |   2 +
 docs/devel/style.rst                     |   2 +
 docs/devel/submitting-a-patch.rst        | 198 +++++++++++++++++------
 docs/devel/submitting-a-pull-request.rst |   9 +-
 docs/devel/trivial-patches.rst           |   2 +
 5 files changed, 161 insertions(+), 52 deletions(-)

diff --git a/docs/devel/stable-process.rst b/docs/devel/stable-process.rst
index e541b983fa..c21fb86645 100644
--- a/docs/devel/stable-process.rst
+++ b/docs/devel/stable-process.rst
@@ -1,3 +1,5 @@
+.. _stable-process:
+
 QEMU and the stable process
 ===========================
 
diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index e00af62e76..9c5c0fffd9 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -1,3 +1,5 @@
+.. _coding-style:
+
 =================
 QEMU Coding Style
 =================
diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 6fefc67d52..6acded5c93 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -1,3 +1,5 @@
+.. _submitting-a-patch:
+
 Submitting a Patch
 ==================
 
@@ -20,11 +22,11 @@ one-shot fix, the bare minimum we ask is that:
    should not be posted on the bug tracker, posted on forums, or
    externally hosted and linked to. (We have other mailing lists too,
    but all patches must go to qemu-devel, possibly with a Cc: to another
-   list.) ``git send-email`` works best for delivering the patch without
-   mangling it (`hints for setting it
-   up <http://lxr.free-electrons.com/source/Documentation/process/email-clients.rst>`__),
-   but attachments can be used as a last resort on a first-time
-   submission.
+   list.) ``git send-email`` (`step-by-step setup
+   guide <https://git-send-email.io/>`__ and `hints and
+   tips <https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
+   works best for delivering the patch without mangling it, but
+   attachments can be used as a last resort on a first-time submission.
 -  You must read replies to your message, and be willing to act on them.
    Note, however, that maintainers are often willing to manually fix up
    first-time contributions, since there is a learning curve involved in
@@ -45,6 +47,8 @@ Reading the table of contents below should already give you an idea of
 the basic requirements. Use the table of contents as a reference, and
 read the parts that you have doubts about.
 
+.. contents:: Table of Contents
+
 .. _writing_your_patches:
 
 Writing your Patches
@@ -60,11 +64,9 @@ check that you are in compliance with our coding standards. Be aware
 that ``checkpatch.pl`` is not infallible, though, especially where C
 preprocessor macros are involved; use some common sense too. See also:
 
-- `QEMU Coding Style
-  <https://qemu-project.gitlab.io/qemu/devel/style.html>`__
-
+-  :ref:`coding-style`
 -  `Automate a checkpatch run on
-   commit <http://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
+   commit <https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
 
 .. _base_patches_against_current_git_master:
 
@@ -76,6 +78,13 @@ of QEMU because development will have moved on from then and it probably
 won't even apply to master. We only apply selected bugfixes to release
 branches and then only as backports once the code has gone into master.
 
+It is also okay to base patches on top of other on-going work that is
+not yet part of the git master branch. To aid continuous integration
+tools, such as `patchew <http://patchew.org/QEMU/>`__, you should `add a
+tag <https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg01288.html>`__
+line ``Based-on: $MESSAGE_ID`` to your cover letter to make the series
+dependency obvious.
+
 .. _split_up_long_patches:
 
 Split up long patches
@@ -104,18 +113,17 @@ Make code motion patches easy to review
 If a series requires large blocks of code motion, there are tricks for
 making the refactoring easier to review. Split up the series so that
 semantic changes (or even function renames) are done in a separate patch
-from the raw code motion. Use a one-time setup of
-``git config diff.renames true; git config diff.algorithm patience``
-(Refer to `git-config <http://git-scm.com/docs/git-config>`__.)  The
-``diff.renames`` property ensures file rename patches will be given in a
-more compact representation that focuses only on the differences across
-the file rename, instead of showing the entire old file as a deletion
-and the new file as an insertion. Meanwhile, the 'diff.algorithm'
-property ensures that extracting a non-contiguous subset of one file
-into a new file, but where all extracted parts occur in the same order
-both before and after the patch, will reduce churn in trying to treat
-unrelated ``}`` lines in the original file as separating hunks of
-changes.
+from the raw code motion. Use a one-time setup of ``git config
+diff.renames true;`` ``git config diff.algorithm patience`` (refer to
+`git-config <http://git-scm.com/docs/git-config>`__). The 'diff.renames'
+property ensures file rename patches will be given in a more compact
+representation that focuses only on the differences across the file
+rename, instead of showing the entire old file as a deletion and the new
+file as an insertion. Meanwhile, the 'diff.algorithm' property ensures
+that extracting a non-contiguous subset of one file into a new file, but
+where all extracted parts occur in the same order both before and after
+the patch, will reduce churn in trying to treat unrelated ``}`` lines in
+the original file as separating hunks of changes.
 
 Ideally, a code motion patch can be reviewed by doing::
 
@@ -138,8 +146,7 @@ as a separate patch which makes no semantic changes; don't put it in the
 same patch as your bug fix.
 
 For smaller patches in less frequently changed areas of QEMU, consider
-using the `trivial patches process
-<https://qemu-project.gitlab.io/qemu/devel/style.html>`__.
+using the :ref:`trivial-patches` process.
 
 .. _write_a_meaningful_commit_message:
 
@@ -154,7 +161,7 @@ QEMU follows the usual standard for git commit messages: the first line
 (which becomes the email subject line) is "subsystem: single line
 summary of change". Whether the "single line summary of change" starts
 with a capital is a matter of taste, but we prefer that the summary does
-not end in ".". Look at ``git shortlog -30`` for an idea of sample
+not end in a dot. Look at ``git shortlog -30`` for an idea of sample
 subject lines. Then there is a blank line and a more detailed
 description of the patch, another blank and your Signed-off-by: line.
 Please do not use lines that are longer than 76 characters in your
@@ -170,11 +177,75 @@ displays the subject line some distance apart (that is, a body that
 starts with "... so that" as a continuation of the subject line is
 harder to follow).
 
+If your patch fixes a commit that is already in the repository, please
+add an additional line with "Fixes: <at-least-12-digits-of-SHA-commit-id>
+("Fixed commit subject")" below the patch description / before your
+"Signed-off-by:" line in the commit message.
+
+If your patch fixes a bug in the gitlab bug tracker, please add a line
+with "Resolves: <URL-of-the-bug>" to the commit message, too. Gitlab can
+close bugs automatically once commits with the "Resolved:" keyword get
+merged into the master branch of the project. And if your patch addresses
+a bug in another public bug tracker, you can also use a line with
+"Buglink: <URL-of-the-bug>" for reference here, too.
+
+Example::
+
+ Fixes: 14055ce53c2d ("s390x/tcg: avoid overflows in time2tod/tod2time")
+ Resolves: https://gitlab.com/qemu-project/qemu/-/issues/42
+ Buglink: https://bugs.launchpad.net/qemu/+bug/1804323``
+
+.. _test_your_patches:
+
+Test your patches
+~~~~~~~~~~~~~~~~~
+
+Although QEMU has `continuous integration
+services <Testing#Continuous_Integration>`__ that attempt to test
+patches submitted to the list, it still saves everyone time if you have
+already tested that your patch compiles and works. Because QEMU is such
+a large project, it's okay to use configure arguments to limit what is
+built for faster turnaround during your development time; but it is
+still wise to also check that your patches work with a full build before
+submitting a series, especially if your changes might have an unintended
+effect on other areas of the code you don't normally experiment with.
+See `Testing <Testing>`__ for more details on what tests are available.
+Also, it is a wise idea to include a testsuite addition as part of your
+patches - either to ensure that future changes won't regress your new
+feature, or to add a test which exposes the bug that the rest of your
+series fixes. Keeping separate commits for the test and the fix allows
+reviewers to rebase the test to occur first to prove it catches the
+problem, then again to place it last in the series so that bisection
+doesn't land on a known-broken state.
+
 .. _submitting_your_patches:
 
 Submitting your Patches
 -----------------------
 
+.. _if_you_cannot_send_patch_emails:
+
+If you cannot send patch emails
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+In rare cases it may not be possible to send properly formatted patch
+emails. You can use `sourcehut <https://sourcehut.org/>`__ to send your
+patches to the QEMU mailing list by following these steps:
+
+#. Register or sign in to your account
+#. Add your SSH public key in `meta \|
+   keys <https://meta.sr.ht/keys>`__.
+#. Publish your git branch using **git push git@git.sr.ht:~USERNAME/qemu
+   HEAD**
+#. Send your patches to the QEMU mailing list using the web-based
+   ``git-send-email`` UI at https://git.sr.ht/~USERNAME/qemu/send-email
+
+`This video
+<https://spacepub.space/videos/watch/ad258d23-0ac6-488c-83fc-2bacf578de3a>`__
+shows the web-based ``git-send-email`` workflow. Documentation is
+available `here
+<https://man.sr.ht/git.sr.ht/#sending-patches-upstream>`__.
+
 .. _cc_the_relevant_maintainer:
 
 CC the relevant maintainer
@@ -219,17 +290,26 @@ such as 'git-email' on Fedora-based systems.) Patch series need a cover
 letter, with shallow threading (all patches in the series are
 in-reply-to the cover letter, but not to each other); single unrelated
 patches do not need a cover letter (but if you do send a cover letter,
-use --numbered so the cover and the patch have distinct subject lines).
+use ``--numbered`` so the cover and the patch have distinct subject lines).
 Patches are easier to find if they start a new top-level thread, rather
 than being buried in-reply-to another existing thread.
 
+.. _avoid_posting_large_binary_blob:
+
+Avoid posting large binary blob
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If you added binaries to the repository, consider producing the patch
+emails using ``git format-patch --no-binary`` and include a link to a
+git repository to fetch the original commit.
+
 .. _patch_emails_must_include_a_signed_off_by_line:
 
 Patch emails must include a ``Signed-off-by:`` line
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-For more information see `1.12) Sign your work
-<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n296>`__.
+For more information see `SubmittingPatches 1.12
+<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__.
 This is vital or we will not be able to apply your patch! Please use
 your real name to sign a patch (not an alias or acronym).
 
@@ -246,8 +326,13 @@ that author's Signed-off-by: line is mandatory, with the same spelling.
 Include a meaningful cover letter
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-This usually applies only to a series that includes multiple patches;
-the cover letter explains the overall goal of such a series.
+This is a requirement for any series with multiple patches (as it aids
+continuous integration), but optional for an isolated patch. The cover
+letter explains the overall goal of such a series, and also provides a
+convenient 0/N email for others to reply to the series as a whole. A
+one-time setup of ``git config format.coverletter auto`` (refer to
+`git-config <http://git-scm.com/docs/git-config>`__) will generate the
+cover letter as needed.
 
 When reviewers don't know your goal at the start of their review, they
 may object to early changes that don't make sense until the end of the
@@ -288,6 +373,18 @@ it's best to:
    of the patchset you're looking for review on, and why reviewers
    should care
 
+.. _consider_whether_your_patch_is_applicable_for_stable:
+
+Consider whether your patch is applicable for stable
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If your patch fixes a severe issue or a regression, it may be applicable
+for stable. In that case, consider adding ``Cc: qemu-stable@nongnu.org``
+to your patch to notify the stable maintainers.
+
+For more details on how QEMU's stable process works, refer to the
+:ref:`stable-process` page.
+
 .. _participating_in_code_review:
 
 Participating in Code Review
@@ -367,19 +464,19 @@ Include version history in patchset revisions
 
 For later versions of patches, include a summary of changes from
 previous versions, but not in the commit message itself. In an email
-formatted as a git patch, the commit message is the part above the "---"
+formatted as a git patch, the commit message is the part above the ``---``
 line, and this will go into the git changelog when the patch is
 committed. This part should be a self-contained description of what this
 version of the patch does, written to make sense to anybody who comes
 back to look at this commit in git in six months' time. The part below
-the "---" line and above the patch proper (git format-patch puts the
+the ``---`` line and above the patch proper (git format-patch puts the
 diffstat here) is a good place to put remarks for people reading the
 patch email, and this is where the "changes since previous version"
-summary belongs. The
-`git-publish <https://github.com/stefanha/git-publish>`__ script can
-help with tracking a good summary across versions. Also, the
-`git-backport-diff <https://github.com/codyprime/git-scripts>`__ script
-can help focus reviewers on what changed between revisions.
+summary belongs. The `git-publish
+<https://github.com/stefanha/git-publish>`__ script can help with
+tracking a good summary across versions. Also, the `git-backport-diff
+<https://github.com/codyprime/git-scripts>`__ script can help focus
+reviewers on what changed between revisions.
 
 .. _tips_and_tricks:
 
@@ -411,27 +508,32 @@ If your patch seems to have been ignored
 If your patchset has received no replies you should "ping" it after a
 week or two, by sending an email as a reply-to-all to the patch mail,
 including the word "ping" and ideally also a link to the page for the
-patch on
-`patchwork <http://patchwork.ozlabs.org/project/qemu-devel/list/>`__ or
-GMANE. It's worth double-checking for reasons why your patch might have
-been ignored (forgot to CC the maintainer? annoyed people by failing to
-respond to review comments on an earlier version?), but often for
-less-maintained areas of QEMU patches do just slip through the cracks.
-If your ping is also ignored, ping again after another week or so. As
-the submitter, you are the person with the most motivation to get your
-patch applied, so you have to be persistent.
+patch on `patchew <https://patchew.org/QEMU/>`__ or
+`lore.kernel.org <https://lore.kernel.org/qemu-devel/>`__. It's worth
+double-checking for reasons why your patch might have been ignored
+(forgot to CC the maintainer? annoyed people by failing to respond to
+review comments on an earlier version?), but often for less-maintained
+areas of QEMU patches do just slip through the cracks. If your ping is
+also ignored, ping again after another week or so. As the submitter, you
+are the person with the most motivation to get your patch applied, so
+you have to be persistent.
 
 .. _is_my_patch_in:
 
 Is my patch in?
 ~~~~~~~~~~~~~~~
 
+QEMU has some Continuous Integration machines that try to catch patch
+submission problems as soon as possible.  `patchew
+<http://patchew.org/QEMU/>`__ includes a web interface for tracking the
+status of various threads that have been posted to the list, and may
+send you an automated mail if it detected a problem with your patch.
+
 Once your patch has had enough review on list, the maintainer for that
 area of code will send notification to the list that they are including
 your patch in a particular staging branch. Periodically, the maintainer
-then sends a `pull request
-<https://qemu-project.gitlab.io/qemu/devel/submitting-a-pull-request.html>`__
-for aggregating topic branches into mainline qemu. Generally, you do not
+then takes care of :ref:`submitting-a-pull-request`
+for aggregating topic branches into mainline QEMU. Generally, you do not
 need to send a pull request unless you have contributed enough patches
 to become a maintainer over a particular section of code. Maintainers
 may further modify your commit, by resolving simple merge conflicts or
diff --git a/docs/devel/submitting-a-pull-request.rst b/docs/devel/submitting-a-pull-request.rst
index 8729d29036..c9d1e8afd9 100644
--- a/docs/devel/submitting-a-pull-request.rst
+++ b/docs/devel/submitting-a-pull-request.rst
@@ -1,10 +1,11 @@
-Submit a Pull Request
-=====================
+.. _submitting-a-pull-request:
+
+Submitting a Pull Request
+=========================
 
 QEMU welcomes contributions of code, but we generally expect these to be
 sent as simple patch emails to the mailing list (see our page on
-`submitting a patch
-<https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html>`__
+:ref:`submitting-a-patch`
 for more details).  Generally only existing submaintainers of a tree
 will need to submit pull requests, although occasionally for a large
 patch series we might ask a submitter to send a pull request. This page
diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
index db3f2001da..9380c730f7 100644
--- a/docs/devel/trivial-patches.rst
+++ b/docs/devel/trivial-patches.rst
@@ -1,3 +1,5 @@
+.. _trivial-patches:
+
 Trivial Patches
 ===============
 
-- 
2.27.0


