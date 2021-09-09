Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0964405B51
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:51:30 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mONGr-0000D9-Bd
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mONFC-0007tP-5H
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mONF5-00025z-Jz
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631206176;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoB3RrGobgBvnDNcksk/rXabSPl3/H9YJ+LdfjiOGgY=;
 b=gx9TaKh23qODtzNrjleixNzhtSZdpgut4l4X3btiTj1tS59OzCLMq3WT1RppZwuhh/AezB
 vXoV3oNk5A477Oo+82bzsJtiE781CV9Y+3Sxo6PZiuEj7KDx/rlh464m1RHESgx/AVQ53u
 44CoDpG9ZAfB63lYTfqglGPswYIa5Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-vOWn0fXZPzy3XYuVccahGA-1; Thu, 09 Sep 2021 12:49:31 -0400
X-MC-Unique: vOWn0fXZPzy3XYuVccahGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5370FCC621;
 Thu,  9 Sep 2021 16:49:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7DE61141;
 Thu,  9 Sep 2021 16:49:18 +0000 (UTC)
Date: Thu, 9 Sep 2021 17:49:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
Message-ID: <YTo7C9h6DxZDYdL9@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Ian Jackson <iwj@xenproject.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 05:02:01PM +0100, Peter Maydell wrote:
> On Tue, 7 Sept 2021 at 13:32, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > Most likely, QEMU will want tighter control over the sources, rather
> > than relying on crates.io downloading, use a git submodule with all the
> > dependencies. However, cargo --offline was added in 1.36.
> >
> > "cargo vendor" helps gathering and updating the dependencies.
> >
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >  configure                 | 8 ++++++++
> >  meson.build               | 7 ++++++-
> >  .cargo/config.toml.in     | 5 +++++
> >  .cargo/meson.build        | 5 +++++
> >  .gitmodules               | 4 ++++
> >  rust/vendored             | 1 +
> >  scripts/archive-source.sh | 2 +-
> >  scripts/cargo_wrapper.py  | 1 +
> >  8 files changed, 31 insertions(+), 2 deletions(-)
> >  create mode 100644 .cargo/config.toml.in
> >  create mode 100644 .cargo/meson.build
> >  create mode 160000 rust/vendored
> 
> So, this is a lot of extra code in a submodule. Historically we've
> found that submodules are a colossal pain, and so I think we should
> think about whether we really want to have all our rust dependencies
> in a submodule forever.
> 
> I am definitely only at the beginner stage with Rust, but I think
> we should have a discussion about what the different alternative
> options are here, and what we want to achieve, so that we know
> why we're doing this and what we're gaining from the pain...
> 
> For instance, could we instead commit Cargo.lock in git and
> use that to nail down specific versions of the dependencies ?
> 
> FWIW, the "why submodules" for the C dependencies we ship
> like that is basically
>  * C doesn't have a package manager, so if we need a dependency that
>    distros don't ship then we need to wrap it up and provide it ourselves
>  * where we ship binary blobs (guest BIOS etc) we want to also ship
>    the source code for those blobs
> I think for Rust dependencies those don't really apply.

Even for our existing non-rust usage of submodules, it is very
borderline questionable whether the benefit outweighs the pain
they are causing us. I frequently wish we would just go "cold
turkey" and drop all our submodules and spin off all the bundled
blobs into separate downloads, despite the disruption it would
cause in the short term.

> Overall, I think that to the extent that we can look like a "normal"
> user of Rust, that's a good plan. Distros may well want to be able
> to do "build against our packaged rust stuff rather than downloading
> from crates.io" but I imagine they have machinery for that already;
> if we act like most other Rust programs we have better chances of
> not breaking that machinery.

Yes, distros do have machinery for this, although it is often
hard to fit in with it when you have a mixed language project.
Their machinery typically assumes pure single language project,
so would work nicer if any QEMU rust pieces were separately
released from the rest of QEMU. Obviously this is easier said
than done since QEMU tends towards a monolothic repo approach
historically.

> We do already effectively do "download code when QEMU is built" --
> the makefile invokes scripts/git-submodule-update which pulls
> down submodule code. (Thanks to Ian for pointing out this framing
> of the question.)
> 
> (I'm not personally a fan of the "download everything from crates.io"
> Rust ecosystem, but it is what it is, and wishing the Rust world
> worked more like a trad Linux-distro-provides-all-your-dependencies
> isn't, alas, going to make it so :-))

Yes, I'm inclined to agree here. For better or worse the battle is
over and "download everything from <repo> on the fly" is the accepted
approach for pretty much all modern languages. The language specific
repo essentially is the OS distro from their POV.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


