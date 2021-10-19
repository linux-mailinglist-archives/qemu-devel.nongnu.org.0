Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333574331DB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:10:05 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcl8G-0008L7-99
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2g-00013G-5U
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2c-0006yK-IF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TC3q6jkQP7DXrgT7NDpkNU+5AI3iGndsylS945PDy+E=;
 b=LNmWgW+EH3VPoxh3l+8NzKJ85cdOI7XtKdpsYVxDBlqSml5hKRWCAXzNvs5gmp27mA6ljA
 T+TtojcPetEDPSgY8hkmCIDrOc3i2X1NdLejy/X7u3HIt8hs1H3lcZllqe+lYzCbgYDmDN
 29EpcOKqTf01habM4Xj7j5lRWI75NT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-pypDYXFMNBiW7mJsY-jCHA-1; Tue, 19 Oct 2021 05:04:10 -0400
X-MC-Unique: pypDYXFMNBiW7mJsY-jCHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4623380A5C8;
 Tue, 19 Oct 2021 09:04:09 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98DC570951;
 Tue, 19 Oct 2021 09:04:06 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] docs: rSTify the "SubmitAPullRequest" wiki
Date: Tue, 19 Oct 2021 11:03:42 +0200
Message-Id: <20211019090344.3054300-5-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
References: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original wiki is here[1].  I converted by copying the wiki source
into a .wiki file and convert to rST using `pandoc`:

    $ pandoc -f Mediawiki -t rst submitting-a-pull-request.wiki \
        -o submitting-a-pull-request.rst

This is a 1-1 conversion; no content changes besides updating the
"KeySigningParty" linkt to the rSTified (HTML) page.

[1] https://wiki.qemu.org/Contribute/SubmitAPullRequest

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/submitting-a-pull-request.rst | 79 ++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 docs/devel/submitting-a-pull-request.rst

diff --git a/docs/devel/submitting-a-pull-request.rst b/docs/devel/submitting-a-pull-request.rst
new file mode 100644
index 0000000000..d2ee84c85a
--- /dev/null
+++ b/docs/devel/submitting-a-pull-request.rst
@@ -0,0 +1,79 @@
+Submit a Pull Request
+=====================
+
+QEMU welcomes contributions of code, but we generally expect these to be
+sent as simple patch emails to the mailing list (see our page on
+`submitting a patch
+<https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html>`__
+for more details).  Generally only existing submaintainers of a tree
+will need to submit pull requests, although occasionally for a large
+patch series we might ask a submitter to send a pull request. This page
+documents our recommendations on pull requests for those people.
+
+A good rule of thumb is not to send a pull request unless somebody asks
+you to.
+
+**Resend the patches with the pull request** as emails which are
+threaded as follow-ups to the pull request itself. The simplest way to
+do this is to use ``git format-patch --cover-letter`` to create the
+emails, and then edit the cover letter to include the pull request
+details that ``git request-pull`` outputs.
+
+**Use PULL as the subject line tag** in both the cover letter and the
+retransmitted patch mails (for example, by using
+``--subject-prefix=PULL`` in your ``git format-patch`` command). This
+helps people to filter in or out the resulting emails (especially useful
+if they are only CC'd on one email out of the set).
+
+**Each patch must have your own Signed-off-by: line** as well as that of
+the original author if the patch was not written by you. This is because
+with a pull request you're now indicating that the patch has passed via
+you rather than directly from the original author.
+
+**Don't forget to add Reviewed-by: and Acked-by: lines**. When other
+people have reviewed the patches you're putting in the pull request,
+make sure you've copied their signoffs across. (If you use the `patches
+tool <https://github.com/stefanha/patches>`__ to add patches from email
+directly to your git repo it will include the tags automatically; if
+you're updating patches manually or in some other way you'll need to
+edit the commit messages by hand.)
+
+**Don't send pull requests for code that hasn't passed review**. A pull
+request says these patches are ready to go into QEMU now, so they must
+have passed the standard code review processes. In particular if you've
+corrected issues in one round of code review, you need to send your
+fixed patch series as normal to the list; you can't put it in a pull
+request until it's gone through. (Extremely trivial fixes may be OK to
+just fix in passing, but if in doubt err on the side of not.)
+
+**Test before sending**. This is an obvious thing to say, but make sure
+everything builds (including that it compiles at each step of the patch
+series) and that "make check" passes before sending out the pull
+request. As a submaintainer you're one of QEMU's lines of defense
+against bad code, so double check the details.
+
+**All pull requests must be signed**. If your key is not already signed
+by members of the QEMU community, you should make arrangements to attend
+a `KeySigningParty
+<https://qemu-project.gitlab.io/qemu/devel/key-signing-party.html>`__
+(for example at KVM Forum) or make alternative arrangements to have your
+key signed by an attendee.  Key signing requires meeting another
+community member \*in person\* so please make appropriate arrangements.
+By "signed" here we mean that the pullreq email should quote a tag which
+is a GPG-signed tag (as created with 'gpg tag -s ...').
+
+**Pull requests not for master should say "not for master" and have
+"PULL SUBSYSTEM whatever" in the subject tag**. If your pull request is
+targeting a stable branch or some submaintainer tree, please include the
+string "not for master" in the cover letter email, and make sure the
+subject tag is "PULL SUBSYSTEM s390/block/whatever" rather than just
+"PULL". This allows it to be automatically filtered out of the set of
+pull requests that should be applied to master.
+
+You might be interested in
+`https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/make-pullreq
+the make-pullreq
+script <https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/make-pullreq_the_make-pullreq_script>`__,
+which automates some of this process for you and includes a few sanity
+checks. Note that you must edit it to configure it suitably for your
+local situation!
-- 
2.31.1


