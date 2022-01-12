Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8548C1F7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:09:01 +0100 (CET)
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7aYu-0005Lp-I5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:09:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7aXZ-00044v-9H
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7aXW-00007s-Gn
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641982052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR46gLOLwYy3YEBhFi3r0wHmIxB0PhgOGjnDxxrsi6s=;
 b=RrvQBkVz6LKB/W2slbfS0yth9/71vZUSuLuO/o4tLPSYdRGq4qWHI/kGR61Qli2ZSTm98A
 gO19Vjd0E8edLbZzEoCXIdNcMBPX6HvdpZkJ8waY2Hq3RjH+iEsBo0ym9JZM4pF7vTcICx
 lYCaciR0tTzQyfgLZC0sTOOEmWiE+YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-tsiHJeipPNqFIVsOjTClSA-1; Wed, 12 Jan 2022 05:07:27 -0500
X-MC-Unique: tsiHJeipPNqFIVsOjTClSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A13BA64148;
 Wed, 12 Jan 2022 10:07:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A14F1F2EA;
 Wed, 12 Jan 2022 10:07:09 +0000 (UTC)
Date: Wed, 12 Jan 2022 10:07:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC qemu.qmp PATCH 17/24] Makefile: add build and publish targets
Message-ID: <Yd6oS3mCXs1AXVPy@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-18-jsnow@redhat.com>
 <YbsZe9A/Lf2g1Xk8@redhat.com>
 <CAFn=p-bPUsw19uW=gfzGBwT5zDm3t4QHCvzf0nJjbcwcOKkA=g@mail.gmail.com>
 <YbyUlrmexR77cbip@redhat.com>
 <CAFn=p-ZmBfThKMJ-vWyvJ8b7ccD+mv=TynSPDoCM-tdne5jEYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ZmBfThKMJ-vWyvJ8b7ccD+mv=TynSPDoCM-tdne5jEYw@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 02:48:55PM -0500, John Snow wrote:
> On Fri, Dec 17, 2021 at 8:46 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Dec 16, 2021 at 06:35:23PM -0500, John Snow wrote:
> > > On Thu, Dec 16, 2021 at 5:48 AM Daniel P. Berrangé <berrange@redhat.com>
> > > wrote:
> > >
> > > > On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:
> > > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > > ---
> > > > >  Makefile | 32 ++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 32 insertions(+)
> > > > >
> > > > > diff --git a/Makefile b/Makefile
> > > > > index 97d737a..81bfca8 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -110,3 +110,35 @@ distclean: clean
> > > > >       rm -f .coverage .coverage.*
> > > > >       rm -rf htmlcov/
> > > > >       rm -rf test-results/
> > > > > +
> > > > > +.PHONY: pristine
> > > > > +pristine:
> > > > > +     @git diff-files --quiet --ignore-submodules -- || \
> > > > > +             (echo "You have unstaged changes."; exit 1)
> > > > > +     @git diff-index --cached --quiet HEAD --ignore-submodules --
> > || \
> > > > > +             (echo "Your index contains uncommitted changes."; exit
> > 1)
> > > > > +     @[ -z "$(shell git ls-files -o)" ] || \
> > > > > +             (echo "You have untracked files: $(shell git ls-files
> > > > -o)"; exit 1)
> > > > > +
> > > > > +dist: setup.cfg setup.py Makefile README.rst
> > > > > +     python3 -m build
> > > > > +     @touch dist
> > > > > +
> > > > > +.PHONY: pre-publish
> > > > > +pre-publish: pristine dist
> > > > > +     @git describe --exact-match 2>/dev/null || \
> > > > > +             (echo -e "\033[0;31mThere is no annotated tag for this
> > > > commit.\033[0m"; exit 1)
> > > > > +     python3 -m twine check --strict dist/*
> > > > > +     git push -v --atomic --follow-tags --dry-run
> > > > > +
> > > > > +.PHONY: publish
> > > > > +publish: pre-publish
> > > > > +     # Set the username via TWINE_USERNAME.
> > > > > +     # Set the password via TWINE_PASSWORD.
> > > > > +     # Set the pkg repository via TWINE_REPOSITORY.
> > > > > +     python3 -m twine upload --verbose dist/*
> > > > > +     git push -v --atomic --follow-tags
> > > > > +
> > > > > +.PHONY: publish-test
> > > > > +publish-test: pre-publish
> > > > > +     python3 -m twine upload --verbose -r testpypi dist/*
> > > >
> > > > It doesn't feel very pythonic to have a makefile in the project.
> > > >
> > > > If we want some helpers for publishing releases, I would have
> > > > expected to see a python script  eg scripts/publish.py
> > > >
> > > >
> > > Eh, Python folks use Makefiles too. I've been using these little Makefile
> > > targets for hobby things for a while and I had them laying around and
> > ready
> > > to go. I have no strong need to "upgrade" to python scripts for these
> > right
> > > now, unless there's some extra features you want to see.
> >
> > Using make means you have to worry about portability across different
> > impls of make and different impls of shell. Using python means your
> > python project is portable to anywhere that python runs.
> 
> 
> I still like the idea of using a Makefile as a "canonical menu of things
> you can do in this directory", but there's probably room for interactive
> error checking and so on with the TWINE_USERNAME / TWINE_PASSWORD /
> TWINE_REPOSITORY environment variables in a python script. I'll look into
> it as a follow-up, if that's fine. (I'm worried it's a lot of polish and
> effort on a maintainers-only interface that only I will likely use for at
> least the next year or two.)
> 
> Ultimately, what's likely to happen here is that I will generate some oauth
> tokens with publish permissions and a hypothetical user would set e.g.
> TWINE_USERNAME to "__token__", and the password would be
> "pypi-tokengoeshere". Using the "keyring" python package, we could attempt
> to fetch stored values from a session keyring, falling back to an
> interactive prompt if they're unset.

FWIW, don't consider this original comment of mine to be a technical
blocker, rather it is more of a conceptual observation.  If you don't
think it matters, I won't mind.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


