Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62841CB44
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:50:24 +0200 (CEST)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVdin-00017F-U9
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVdhW-0000Nt-Sf
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVdhP-0003Uh-Ud
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632937735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpohJeeEckFd17JmraQBupGUGPuIibHAgNXrsGdPVJA=;
 b=TCaZRdHE6PKlSEvj5uEIinhg9nKk6SUD71fTV8gGPUv1iSQk4748i30SQpYftMdB+6vpL2
 vx+IIXJ3e7b+dzrBZDp0nRuEmX01SzlK+dYeL0xG/wm2Eh6XUiqOM9b0Z5NSPWE69MRZFH
 8uamo+01FTWG1PEgaOI7QGt3h49sI+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-5_1WkH8vMC6Z7VJXLA2m2g-1; Wed, 29 Sep 2021 13:48:44 -0400
X-MC-Unique: 5_1WkH8vMC6Z7VJXLA2m2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED332802C8A;
 Wed, 29 Sep 2021 17:48:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A9D604CC;
 Wed, 29 Sep 2021 17:48:41 +0000 (UTC)
Date: Wed, 29 Sep 2021 18:48:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Message-ID: <YVSm9s4pUKOzsLqV@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <3048101.GpayOE22Id@silver> <YVNFlwiw9sJS4cea@redhat.com>
 <3065428.eF6XsjkFDY@silver>
MIME-Version: 1.0
In-Reply-To: <3065428.eF6XsjkFDY@silver>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 07:32:39PM +0200, Christian Schoenebeck wrote:
> On Dienstag, 28. September 2021 18:41:17 CEST Daniel P. Berrangé wrote:
> > On Tue, Sep 28, 2021 at 06:23:23PM +0200, Christian Schoenebeck wrote:
> > > On Dienstag, 28. September 2021 15:04:36 CEST Daniel P. Berrangé wrote:
> > > > On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian Schoenebeck wrote:
> [...]

> > > Personally I would not mix in this case macros of foreign libraries (glib)
> > > with macros of a local framework (QArray), because if for some reason one
> > > of the two deviate in future in a certain way, you would need to refactor
> > > a whole bunch of user code. By just separating those definitions from day
> > > one, you can avoid such future refactoring work right from the start.
> > 
> > The GLib automatic memory support is explicitly designed to be extendd
> > with support for application specific types. We already do exactly that
> > all over QEMU with many calls to G_DEFINE_AUTOPTR_CLEANUP_FUNC(..) to
> > register functions for free'ing specific types, such that you can
> > use 'g_autoptr' with them.
> 
> Ok, just to make sure that I am not missing something here, because really if 
> there is already something that does the job that I simply haven't seen, then 
> I happily drop this QArray code.

I don't believe there is anything that currently addresses this well.


> But AFAICS this G_DEFINE_AUTOPTR_CLEANUP_FUNC() & g_autoptr concept does not 
> have any notion of "size" or "amount", right?

Correct, all it knows is that there's a data type and an associated
free function.

> So let's say you already have the following type and cleanup function in your 
> existing code:
> 
> typedef struct MyScalar {
>     int a;
>     char *b;
> } MyScalar;
> 
> void myscalar_free(MayScalar *s) {
>     g_free(s->b);
> }
> 
> Then if you want to use G_DEFINE_AUTOPTR_CLEANUP_FUNC() for an array on that 
> scalar type, then you still would need to *manually* write additionally a 
> separate type and cleanup function like:
> 
> typedef struct MyArray {
>     MyScalar *s;
>     int n;
> };
> 
> void myarray_free(MyArray *a) {
>     for (int i = 0; i < a->n; ++i) {
>         myscalar_free(a->s[i]);
>     }
>     g_free(a);
> }
> 
> Plus you have to manually populate that field 'n' after allocation.
> 
> Am I wrong?

Yes and no.  You can of course manually write all these stuff
as you describe, but since we expect the array wrappers to be
needed for more than one type it makes more sense to have
that all done via macros.

Your patch contains a DECLARE_QARRAY_TYPE and DEFINE_QARRAY_TYPE
that provide all this reqiured boilerplate code.  The essential
difference that I'm suggesting is that the array struct type emitted
by the macro is explicitly visible as a concept to calling code such
that it is used directly used with g_autoptr.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


