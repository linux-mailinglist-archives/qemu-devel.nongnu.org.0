Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E2405B90
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:54:52 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mONK7-0001ng-KF
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mONJI-000182-PA
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mONJE-0005iA-4j
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631206435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hgzvLZ+bps/IMxHY/+cYbgGfrS9AUPdVQ7RxM8iRCZ0=;
 b=IboYGf1IcvGWijfrOpiUKtAK9vJPprk/TYex0CCLLCWiYC2bpLRN7k6KLPO3/rEvxynnhC
 dWvAbHLMUqSSzRmwlv3OUGJjx30gPLo6DnU5QmjNt8nSXpWnf4rNT6UUBGYyG0jOPUMb34
 CWS3bxj88e9MeRqeWlEvdFwcBmBbIe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-AFFlzRH2MrOdUKzvi8FPRw-1; Thu, 09 Sep 2021 12:53:52 -0400
X-MC-Unique: AFFlzRH2MrOdUKzvi8FPRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4617284A5E1;
 Thu,  9 Sep 2021 16:53:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2431B46B;
 Thu,  9 Sep 2021 16:53:46 +0000 (UTC)
Date: Thu, 9 Sep 2021 17:53:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
Message-ID: <YTo8GPGphaD4Xx3b@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
 <CAJ+F1C+xL5_2c+7pSequokT-0yJ=pUT2V81iX_A_WLyVsWywEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+xL5_2c+7pSequokT-0yJ=pUT2V81iX_A_WLyVsWywEQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Ian Jackson <iwj@xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 08:29:58PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Sep 9, 2021 at 8:04 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > On Tue, 7 Sept 2021 at 13:32, <marcandre.lureau@redhat.com> wrote:
> > >
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Most likely, QEMU will want tighter control over the sources, rather
> > > than relying on crates.io downloading, use a git submodule with all the
> > > dependencies. However, cargo --offline was added in 1.36.
> > >
> > > "cargo vendor" helps gathering and updating the dependencies.
> > >
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  configure                 | 8 ++++++++
> > >  meson.build               | 7 ++++++-
> > >  .cargo/config.toml.in     | 5 +++++
> > >  .cargo/meson.build        | 5 +++++
> > >  .gitmodules               | 4 ++++
> > >  rust/vendored             | 1 +
> > >  scripts/archive-source.sh | 2 +-
> > >  scripts/cargo_wrapper.py  | 1 +
> > >  8 files changed, 31 insertions(+), 2 deletions(-)
> > >  create mode 100644 .cargo/config.toml.in
> > >  create mode 100644 .cargo/meson.build
> > >  create mode 160000 rust/vendored

> > Overall, I think that to the extent that we can look like a "normal"
> > user of Rust, that's a good plan. Distros may well want to be able
> > to do "build against our packaged rust stuff rather than downloading
> > from crates.io" but I imagine they have machinery for that already;
> > if we act like most other Rust programs we have better chances of
> > not breaking that machinery.
> >
> 
> True, at least on Fedora, there is machinery to package "regular" Rust
> programs/crates in an automated way.  Vendoring dependencies should work
> equally, but may not conform with distro policies, so they have extra work
> eventually (it seems vendoring is more and more common though, with go
> projects for example)

I wouldn't assume that we're going to be able to use that RPM support
for rust, if we bundle our rust code inside the QEMU tarball and hidden
behind meson. It generally only works well in single language projects
using the preferred build tool exclusively (Cargo in this case).

> > (I'm not personally a fan of the "download everything from crates.io"
> > Rust ecosystem, but it is what it is, and wishing the Rust world
> > worked more like a trad Linux-distro-provides-all-your-dependencies
> > isn't, alas, going to make it so :-))
> >
> >
> A nice alternative to vendoring that could work well for QEMU is to mirror
> the Rust crate we use, so we have similar control and guarantee over them
> as submodules, and use `[patch.crates-io]` to point at qemu-project
> locations.

The Cargo metadata specifies the versions we'll get so we have full
control over what deps are pulled in. All the mirroring our do is to
cope with occassions where the main crate download website is
inaccessible for some reason. I'm not convinced that's enough to
justify creating extra work for ourselves through mirroring. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


