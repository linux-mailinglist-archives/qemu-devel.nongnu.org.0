Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC941DBFE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:07:01 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwiC-0003yL-JY
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVwdZ-00016E-U0
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVwdV-0003xx-PZ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633010527;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ok8331cXZuaIDU4yRXEbjL/pkkhxrYJlIUZC3yiRlzA=;
 b=et9/P4+522/+3PUQGWel0FhjUk1kmFQpgi3HPgmba9ngp7mcmOO80OkhHhOkwo9+mgzycG
 e+SxGuaDHnWoqUlRu1NML70yTNNZBtM+YN4VKoM4KEGKaeL8rC78bQhaFEoQIGwvh3+Lyx
 hSgiWhzPFofKzN2qK2/2dczTPoS7ryk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-lWWZ-7cLNdWL8qh2dojmcw-1; Thu, 30 Sep 2021 10:01:55 -0400
X-MC-Unique: lWWZ-7cLNdWL8qh2dojmcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8DF18125DB;
 Thu, 30 Sep 2021 14:01:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B0F652A4;
 Thu, 30 Sep 2021 14:01:41 +0000 (UTC)
Date: Thu, 30 Sep 2021 15:01:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Message-ID: <YVXDQkKdt0bM/w2G@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <12467459.urXsdUxXdL@silver> <YVW8HlNfGuR7NHsq@redhat.com>
 <4707830.eRlNOxMu1p@silver>
MIME-Version: 1.0
In-Reply-To: <4707830.eRlNOxMu1p@silver>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 03:55:36PM +0200, Christian Schoenebeck wrote:
> On Donnerstag, 30. September 2021 15:31:10 CEST Daniel P. Berrangé wrote:
> > On Thu, Sep 30, 2021 at 03:20:19PM +0200, Christian Schoenebeck wrote:
> > > On Mittwoch, 29. September 2021 19:48:38 CEST Daniel P. Berrangé wrote:
> > > > On Wed, Sep 29, 2021 at 07:32:39PM +0200, Christian Schoenebeck wrote:
> > > > > On Dienstag, 28. September 2021 18:41:17 CEST Daniel P. Berrangé 
> wrote:
> > > > > > On Tue, Sep 28, 2021 at 06:23:23PM +0200, Christian Schoenebeck 
> wrote:
> > > > > > > On Dienstag, 28. September 2021 15:04:36 CEST Daniel P. Berrangé
> > > 
> > > wrote:
> > > > > > > > On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian Schoenebeck
> > > 
> > > wrote:
> > > > > [...]
> > > > > 
> > > > > > The GLib automatic memory support is explicitly designed to be
> > > > > > extendd
> > > > > > with support for application specific types. We already do exactly
> > > > > > that
> > > > > > all over QEMU with many calls to G_DEFINE_AUTOPTR_CLEANUP_FUNC(..)
> > > > > > to
> > > > > > register functions for free'ing specific types, such that you can
> > > > > > use 'g_autoptr' with them.
> > > > > 
> > > > > Ok, just to make sure that I am not missing something here, because
> > > > > really
> > > > > if there is already something that does the job that I simply haven't
> > > > > seen, then I happily drop this QArray code.
> > > > 
> > > > I don't believe there is anything that currently addresses this well.
> > > > 
> > > > > But AFAICS this G_DEFINE_AUTOPTR_CLEANUP_FUNC() & g_autoptr concept
> > > > > does
> > > > > not have any notion of "size" or "amount", right?
> > > > 
> > > > Correct, all it knows is that there's a data type and an associated
> > > > free function.
> > > 
> > > Ok, thanks for the clarification.
> > > 
> > > > > So let's say you already have the following type and cleanup function
> > > > > in
> > > > > your existing code:
> > > > > 
> > > > > typedef struct MyScalar {
> > > > > 
> > > > >     int a;
> > > > >     char *b;
> > > > > 
> > > > > } MyScalar;
> > > > > 
> > > > > void myscalar_free(MayScalar *s) {
> > > > > 
> > > > >     g_free(s->b);
> > > > > 
> > > > > }
> > > > > 
> > > > > Then if you want to use G_DEFINE_AUTOPTR_CLEANUP_FUNC() for an array
> > > > > on
> > > > > that scalar type, then you still would need to *manually* write
> > > > > additionally a separate type and cleanup function like:
> > > > > 
> > > > > typedef struct MyArray {
> > > > > 
> > > > >     MyScalar *s;
> > > > >     int n;
> > > > > 
> > > > > };
> > > > > 
> > > > > void myarray_free(MyArray *a) {
> > > > > 
> > > > >     for (int i = 0; i < a->n; ++i) {
> > > > >     
> > > > >         myscalar_free(a->s[i]);
> > > > >     
> > > > >     }
> > > > >     g_free(a);
> > > > > 
> > > > > }
> > > > > 
> > > > > Plus you have to manually populate that field 'n' after allocation.
> > > > > 
> > > > > Am I wrong?
> > > > 
> > > > Yes and no.  You can of course manually write all these stuff
> > > > as you describe, but since we expect the array wrappers to be
> > > > needed for more than one type it makes more sense to have
> > > > that all done via macros.
> > > > 
> > > > Your patch contains a DECLARE_QARRAY_TYPE and DEFINE_QARRAY_TYPE
> > > > that provide all this reqiured boilerplate code.  The essential
> > > > difference that I'm suggesting is that the array struct type emitted
> > > > by the macro is explicitly visible as a concept to calling code such
> > > > that it is used directly used with g_autoptr.
> > > 
> > > I got that, but your preferred user pattern was this:
> > >     DECLARE_QARRAY_TYPE(Foo);
> > > 	 
> > > 	 ...
> > > 	 
> > >     g_autoptr(FooArray) foos = foo_array_new(n);
> > > 
> > > I don't see a portable way to do upper-case to lower-case conversion with
> > > the> 
> > > C preprocessor. So you would end up like this instead:
> > >     g_autoptr(FooArray) foos = Foo_array_new(n);
> > > 
> > > Which does not really fit into common QEMU naming conventions either, does
> > > it?
> > Right, it would need to be a two arg macro:
> > 
> >   DECLARE_QARRAY_TYPE(Foo, foo);
> > 
> > similar to what we do with macros for declaring QOM types becuase of
> > the same case conversion needs.
> > 
> > > And I can help it, I don't see what's wrong in exposing a regular C-array
> > > to user code. I mean in the Linux kernel for instance it is absolutely
> > > normal to convert from a compound structure to its parent structure. I
> > > don't find anything magical about that and it is simply less code and
> > > better readable.
> > QEMU code is not Linux code. We're following the GLib practices for
> > automatic memory deallocation, and QOM is also modelled on GLib. The
> > proposal looks magical from the POV of QEMU's code patterns, as it is
> > not making use of GLib's g_auto* code.
> 
> Hmm, I start to think whether I should just make it some 9p local utility code 
> for now instead, e.g. "P9Array" or something.

IMHO even if it was private to a subsystem it should still be using the
standard g_auto functionality for automatically deallocating memory,
because this is a QEMU wide standard.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


