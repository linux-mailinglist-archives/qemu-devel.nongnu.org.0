Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC27508DD1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:54:32 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDb5-0008QK-Do
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCfp-0000cW-WD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:55:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCfo-0004Es-0O
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650470119;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhzX+wlz9s9SxF5uYzo1c72qRKULz7eNPvhbGr9RtjU=;
 b=Twl6SNQaYTVHFZ5G4in0DIt/vdmTeFoqnmb0m6OcwkFkfqU90NKi7ZbzKX1By9pzkepzHj
 9cbT/hgtRp/dSHMmCVszRUYwAXfGPWN12vrCqAa2JT30QvcVV18qWogS3UUiBX9+Z8OYVH
 leI+IY/SuY0uL+bOiLHNXk1zLqUessc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-8pTx1B9INpWcwEi7tMnlcg-1; Wed, 20 Apr 2022 11:55:17 -0400
X-MC-Unique: 8pTx1B9INpWcwEi7tMnlcg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 957FF811E80
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 15:55:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D54CC572346;
 Wed, 20 Apr 2022 15:55:15 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:55:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
Message-ID: <YmAs4K5NYcpNwCAc@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
 <CAMxuvax4SaY7TBAc_fWfQHv9X49WRKvCLJ+Hd5wenVGA7Nr6Vg@mail.gmail.com>
 <YmAlm0WXIf2n4VRX@redhat.com>
 <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 07:32:38PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Apr 20, 2022 at 7:24 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 06:50:12PM +0400, Marc-André Lureau wrote:
> > > Hi
> > >
> > > On Wed, Apr 20, 2022 at 6:46 PM Marc-André Lureau
> > > <marcandre.lureau@redhat.com> wrote:
> > > >
> > > > Hi
> > > >
> > > > On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
> > > > >
> > > > > On 20/04/2022 16.10, Daniel P. Berrangé wrote:
> > > > > > On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com wrote:
> > > > > >> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > > >>
> > > > > >> According to our configure checks, this is the list of supported
> > > > > >> compilers.
> > > > > >>
> > > > > >> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > > >> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> > > > > >> ---
> > > > > >>   docs/about/build-platforms.rst | 10 ++++++++++
> > > > > >>   1 file changed, 10 insertions(+)
> > > > > >>
> > > > > >> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> > > > > >> index c29a4b8fe649..1980c5d2476f 100644
> > > > > >> --- a/docs/about/build-platforms.rst
> > > > > >> +++ b/docs/about/build-platforms.rst
> > > > > >> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> > > > > >>   The version of the Windows API that's currently targeted is Vista / Server
> > > > > >>   2008.
> > > > > >>
> > > > > >> +Supported compilers
> > > > > >> +-------------------
> > > > > >> +
> > > > > >> +To compile, QEMU requires either:
> > > > > >> +
> > > > > >> +- GCC >= 7.4.0
> > > > > >> +- Clang >= 6.0
> > > > > >> +- XCode Clang >= 10.0
> > > > > >
> > > > > > Do we need to spell out the versions explicitly ? These versions are
> > > > > > all derived from what's available in the repos of the supported build
> > > > > > platforms, similar to any other build deps we have. I don't think we
> > > > > > want to start a precedent of duplicating versions in this doc for
> > > > > > build deps we have, and there's nothing particularly special about
> > > > > > compilers in this respect.
> > > > >
> > > > > I agree with Daniel - when I saw this patch, the first thought that I had
> > > > > was: "This will be getting out of sync quickly" ...
> > > >
> > > > I don't have the impression we bump our compiler requirement regularly
> > > > or lightly.
> > > >
> > > > > so I'd also recommend to rather not add this here.
> > > >
> > > > Outdated documentation is still better than no documentation. YMMV.
> > >
> > > Another question that is difficult to answer without being familiar
> > > with QEMU details is whether it can compile with MSVC. This
> > > documentation would, since it is explicit about the requirement.
> >
> > Documenting that we mandate GCC or Clang is reasonable. Ideally we could
> > have a list of all 3rd party deps we have in fact, I'm just not a fan of
> > copying the version numbers across from configure/meson.
> >
> 
> I agree, duplicating the version information is not optimal... Yet it
> is better than not having it, or having to read or run configure imho.
> 
> Sorry (or not) to insist, but it would help having an explicit list of
> supported compilers in the human doc (because configure/meson doesn't
> rule others out, afaik, nor it really can or should)

Perhaps I'm misunderstanding what you mean, but configure certainly
does rules out other compilers, giving a clear message:

if ! compile_prog "" "" ; then
    error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
fi

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


