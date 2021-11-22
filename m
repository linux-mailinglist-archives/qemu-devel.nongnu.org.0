Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329C458C35
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 11:22:31 +0100 (CET)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp6Sz-00066j-ML
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 05:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mp6RV-0005Qo-OB
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mp6RS-0004hU-63
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637576452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM8yGWGO2snVd9PQqmdrEfztpoZc3fFYEdkXeJBIS0k=;
 b=P6umelzTQbd+IJuLlbxDaXrB3fseqLGedkElNW+H6M2EFyCvVEohLmWcoXSlm9bM2MB+w5
 fhEqFMvc+Q5prkFnL7v0VYXKb63X4uEgkQS/XdwTNHdsqDr7pEuxZjjGbJJqLhJB6UH83n
 xQAInECOHie990PLYStDbO0hQIqosHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-_tSK2XJxOJizBeWWbw5fZA-1; Mon, 22 Nov 2021 05:20:49 -0500
X-MC-Unique: _tSK2XJxOJizBeWWbw5fZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AC71A0BC1;
 Mon, 22 Nov 2021 10:20:48 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC38757CAD;
 Mon, 22 Nov 2021 10:20:26 +0000 (UTC)
Date: Mon, 22 Nov 2021 11:20:23 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
Message-ID: <YZtu59t8DoZZ15nQ@paraplu>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 10:51:15AM +0100, Thomas Huth wrote:
> On 19/11/2021 20.31, Kashyap Chamarthy wrote:
> > I completely botched up the merged[0] rST conversion of this document by
> > accidentally dropping entire hunks (!) of text. :-(  I made it very hard
> > for reviewers to spot it, as the omitted text was buried deep in the
> > document.  To fix my hatchet job, I reconverted the "SubmitAPatch"
> > wiki[1] page from scratch and replaced the existing rST with it, while
> > making sure I incorporated previous feedback.
> 
> Thanks for the quick update! I've now tripple-checked the differences
> between the old wiki page and the new rst page, and I think with some
> additional small changes on top (which I will do while picking up your
> patch, see below), we should be fine now.

Thanks for your eagle eyes.

[...]

> > -- `QEMU Coding Style
> > -  <https://qemu-project.gitlab.io/qemu/devel/style.html>`__
> > -
> > +-  `QEMU Coding Style <https://qemu-project.gitlab.io/qemu/devel/style.html>`__
> 
> While we're at it, I'll replace the link with an internal link when picking
> up this patch (so that it can also be used in offline documentation).

Sure.

> >   -  `Automate a checkpatch run on
> > -   commit <http://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
> > +   commit <https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
> > +-  Spell check your patches
> 
> I'll add the link to https://wiki.qemu.org/Contribute/SpellCheck again.

Please don't -- I intentionally dropped it in a previous iteration based
on this feedback from Peter Maydell:

    "I'm not sure that SpellCheck in particular is sufficiently baked
    to be in the actual docs. I'd rather just drop the reference to it
    from SubmitAPatch."
    
    (https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg00137.html)

> > @@ -85,7 +91,7 @@ Split up longer patches into a patch series of logical code changes.
> >   Each change should compile and execute successfully. For instance, don't
> >   add a file to the makefile in patch one and then add the file itself in
> >   patch two. (This rule is here so that people can later use tools like
> > -`git bisect <http://git-scm.com/docs/git-bisect>`__ without hitting
> > +```git bisect`` <http://git-scm.com/docs/git-bisect>`__ without hitting
> 
> You've re-introduced the broken git-bisect link. I'll fix it again.

Oops; thanks!  It's hard to spot these double-ticks.

> > @@ -170,11 +175,74 @@ displays the subject line some distance apart (that is, a body that
> >   starts with "... so that" as a continuation of the subject line is
> >   harder to follow).
> > +If your patch fixes a commit that is already in the repository, please
> > +add a line with "Fixes: ("Fixed commit subject")" below the patch
> 
> Missing the "<at-least-12-digits-of-SHA-commit-id>" from the Wiki page. I'll
> add it.
>
> > +description / before your "Signed-off-by:" line in the commit message.
> > +
> > +If your patch fixes a bug in the gitlab bug tracker, please add a line
> > +with "Resolves: " to the commit message, too. Gitlab can close bugs
> 
> Missing the "<URL-of-the-bug>" from the Wiki. I'll add it.

Uh, not sure how I missed the above two bits.

> > +automatically once commits with the "Resolved:" keyword get merged into
> > +the master branch of the project. And if your patch addresses a bug in
> > +another public bug tracker, you can also use a line with "Buglink: " for
> 
> dito.
> 
> > @@ -223,13 +291,22 @@ use --numbered so the cover and the patch have distinct subject lines).
> 
> I noticed that the --numbered will be translated into –numbered, so I'll add
> some `` quotes here.

Good catch; my eyes glazed over it.

> > @@ -288,6 +370,18 @@ it's best to:
> >      of the patchset you're looking for review on, and why reviewers
> >      should care
> > +.. _consider_whether_your_patch_is_applicable_for_stable:
> > +
> > +Consider whether your patch is applicable for stable
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +If your patch fixes a severe issue or a regression, it may be applicable
> > +for stable. In that case, consider adding ``Cc: qemu-stable@nongnu.org``
> > +to your patch to notify the stable maintainers.
> > +
> > +For more details on how QEMU's stable process works, refer to
> > +`docs/devel/stable-process.rst <https://git.qemu.org/?p=qemu.git;a=blob_plain;f=docs/devel/stable-process.rst;hb=HEAD>`__.
> 
> While at this, I'll also replace this external link with an internal one.

[...]

> >   your patch in a particular staging branch. Periodically, the maintainer
> >   then sends a `pull request
> >   <https://qemu-project.gitlab.io/qemu/devel/submitting-a-pull-request.html>`__
> 
> I'll also use an internal link for this reference here.

Sure.

Many thanks for the careful combing!

[...]

-- 
/kashyap


