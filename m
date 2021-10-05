Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9592422CE6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:46:54 +0200 (CEST)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmeb-0004e1-OY
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXmWA-0003w2-QE
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXmW6-00039z-9M
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633448284;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f50UsSyL8CM/8jFbmFg0YCG56xVWR+/JFwgQX4lmel4=;
 b=E8xefpXLKcI2boTweRVqbKlRlYQEbBWH/1mHgfUHwNwhk0U5nOB+kjmrLCyn5Zupng5+gw
 S631rf33pKTJl+np5cB0cSxqvx9UyTQFJOZTPEYnFQ+xg7cGYONIRFyJB4yHKJLj3RpWoe
 i5Z7N7J+IyLZgBccb1EEGy/45UKEa6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Eb1xPE1uNiqycEC_OKZyCg-1; Tue, 05 Oct 2021 11:37:55 -0400
X-MC-Unique: Eb1xPE1uNiqycEC_OKZyCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7746802CB8;
 Tue,  5 Oct 2021 15:37:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0DB060BF4;
 Tue,  5 Oct 2021 15:37:52 +0000 (UTC)
Date: Tue, 5 Oct 2021 16:37:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
Message-ID: <YVxxTgCxQ39nIQxc@redhat.com>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain>
 <YVxdKpks4ARkVHlj@paraplu>
 <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
 <e91b1c71-63dc-644c-bdab-308b989d5b94@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e91b1c71-63dc-644c-bdab-308b989d5b94@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 05:07:06PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/5/21 16:24, Stefan Hajnoczi wrote:
> > On Tue, Oct 05, 2021 at 04:11:54PM +0200, Kashyap Chamarthy wrote:
> >> On Tue, Oct 05, 2021 at 03:01:17PM +0100, Stefan Hajnoczi wrote:
> >>> On Wed, Sep 22, 2021 at 02:10:51PM +0200, Kashyap Chamarthy wrote:
> >>>> As of writing this, qemu.org is down, so I've used a one-month old
> >>>> copy[1] of the wiki from 27Aug2021 to do the rST conversion.
> >>>>
> >>>> My main motivation was to convert SubmitAPatch (when Peter Maydell
> >>>> pointed out on IRC that it's still on the wiki).  But it links to a
> >>>> couple more small wiki pages; so I converted them too:
> >>>>
> >>>>   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
> >>>>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> >>>
> >>> What is the motivation for moving these pages from the wiki to qemu.git
> >>> (https://qemu-project.gitlab.io/qemu/devel/index.html)?
> >>
> >> They were linked to from the SubmitAPatch page.  I thought having one
> >> doc in qemu.git and the other two related docs on the Wiki was clunky.
> >> I can leave them on the Wiki as-is.  But I thought upstream is wants to
> >> move away from the Wiki to in-tree docs where it makes sense.
> > 
> > I meant SubmitAPatch too :). I may have forgotten or missed the IRC
> > discussion so I wanted to understand the reason.
> 
> One point Peter raised on IRC is it is easier to update a Wiki page
> than get a patch merged into the repository. IOW we are making things
> harder.

There are factors to consider beyond ease of contributions.

Certain information here is documenting a fundamental part of the
QEMU community operation & processes. That ought to have a high
trust level and be subject to review of content changes.  I'd say
the SubmitAPatch page falls in this category.

Other information is essentially random adhoc user written content
that isn't critical to the project. This can live with a low trust
level and little-to-no review.

IMHO, the wiki should only be considered for the latter type of
content, with any important project content being subject to
review.

I also feel like docs in git is more likely to be kept upto date
by the regular maintainers, than wikis which can become a bit of
outdated mess.

It is a shame that our normal contribution workflow doesn't make
it easy for simple docs changes to be accepted and merged :-(

> GitLab provides a wiki for all tiers, but requires contributors to have
> the Developer role to be able to modify the wiki:
> https://docs.gitlab.com/ee/user/project/wiki/#edit-a-wiki-page
> I suppose this is a no-go since currently it is enought having
> contributors as reporters (to fill issues).

It is a no-go because "Developer" role gives people commit privs to
the git repo and other related services. We can't give that perm,
even to 99% of our regular contributors, as it puts a hole in our
trust model for code changes, let alone give it to passing one-off
contributors.

> Alternative could be to have a qemu-wiki project within qemu-project
> gitlab namespace, and have point to this one instead (currently we
> point to the external wiki).

I don't consider that all that much better, as even with a separate
project you're giving users permissions todo pretty much anything
with this project, on top of the wiki. 

IMHO gitlab wiki is simply unusable for any projects where the likely
contributors are 3rd parties. Its permission model is clearly designed
only for usage by a trusted development team, all directly committing
to the same repo. This doesn't work in an open source world, only for
private on-site gitlab hosting.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


