Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E52C8C48
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:12:26 +0100 (CET)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnez-0000SW-AQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjndX-0007uW-OZ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjndU-0008WT-Nb
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606759851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ltWhn7T/XmmMibXkcx9unToRFgJm5VFEYxrt91zUv9c=;
 b=UmCkfgtaQqHx7Ckzee0Ijy5L3wfcrCV0vuQl5GX/1HXUGVRxDeNoN0Z08anzTrYt4LYeyh
 Fh/mx/ZNCyfhk3Pc0idQZXvl3+lmzDuvkA0iYtuidxdeI+DPiX/bXwshjrdC1Zv0V60vJr
 /ndJXofxlmP17E8ZLpAa5pFry6ik0sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-MUvLXSBHP2aC6fwSHZW8Jg-1; Mon, 30 Nov 2020 13:10:48 -0500
X-MC-Unique: MUvLXSBHP2aC6fwSHZW8Jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDDC3800D55;
 Mon, 30 Nov 2020 18:10:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EE1D5D9C0;
 Mon, 30 Nov 2020 18:10:38 +0000 (UTC)
Date: Mon, 30 Nov 2020 19:10:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201130181037.GG5078@merkur.fritz.box>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.11.2020 um 17:57 hat Paolo Bonzini geschrieben:
> On 30/11/20 16:46, Kevin Wolf wrote:
> > Am 30.11.2020 um 15:58 hat Paolo Bonzini geschrieben:
> > > With this series it's basically pointless to have QOM properties at
> > > all.
> > 
> > Not entirely, because there are still some writable properties that can
> > be changed later on.
> 
> Are there really any (that are not bugs like opened/loaded)? That's also why
> Eduardo and I discussed a class-wide allow_set function for his field
> properties series.

Yes. I don't really know most objects apart from what I had to learn for
this series, but I know at least two that actually allow this
intentionally: iothread and throttle-group.

> > So with this in mind, I think I'm in favour of completely leaving the
> > initialisation of properties on object creation to QAPI, and only
> > providing individual setters if we actually intend to allow property
> > changes after creation.
> 
> The main problem is that it wouldn't extend well, if at all, to
> machines and devices.  So those would still not be integrated into the
> QAPI schema.

What do you think is the biggest difference there? Don't devices work
the same as user creatable objects in that you first set a bunch of
properties (which would now be done through QAPI instead) and then call
the completion/realize method that actually makes use of them?

I must admit that I don't know how machine types work.

> > > So the question is, are we okay with shoveling half of QEMU's backend data
> > > model into a single struct?  If so, there are important consequences.
> > 
> > Yeah, the single struct bothers me a bit, both in the QAPI schema and in
> > the C source.
> 
> The single struct doesn't bother me _too much_ actually.  What bothers me is
> that it won't be a single source of all QOM objects, only those that happen
> to be created by object-add.

But isn't it only natural that a list of these objects will exist in
some way, implicitly or explicitly? object-add must somehow decide which
object types it allows the user to create.

Once we describe the object types in the schema (rather than only their
properties), which is required if we want to generate the QOM
boilerplate, this can possibly become implicit because then QAPI can
know which objects implement USER_CREATABLE.

> So I start to wonder if QOM as it exists now is the right solution for
> all kind of objects:
> 
> - backends and other object-add types (not per-target, relatively few
> classes and even fewer hierarchies)
> 
> - machine (per-target, many classes, no hierarchy)
> 
> - device (can be treated as not per-target, many many classes, very few
> hierarchies)
> 
> - accelerator (per-target, few classes, no hierarchy)
> 
> - chardev (ok those are the same as the first category)
> 
> If QOM is the right solution, this patch goes in the wrong direction.
> 
> If QOM is the wrong solution, this patch is okay but then we have another
> problem to solve. :)

I think the requirements for all of them are probably similar enough
that they can potentially be covered by a single thing.

I'm also pretty sure that QOM as it exists now is not the right solution
for any of them because it has some major shortcomings. It's too easy to
get things wrong (like the writable properties after creation), its
introspection is rather weak and separated from the QAPI introspection,
it doesn't encourage documentation, and it involves quite a bit of
boilerplate and duplicated code between class implementations.

A modified QOM might be the right solution, though. I would like to
bring QAPI and QOM together because most of these weaknesses are
strengths of QAPI.

I guess the real question is what aspects of QOM need to be changed to
make it the right solution.

> > > The problem with this series is that you are fine with deduplicating things
> > > as a third step, but you cannot be sure that such deduplication is possible
> > > at all.  So while I don't have any problems in principle with the
> > > ObjectOptions concept, I don't think it should be committed without a clear
> > > idea of how to do the third step.
> > 
> > Do you have any specific concerns why the deduplication might not
> > possible, or just because it's uncharted territory?
> 
> Mostly because it's more or less the same issue that you have with
> BlockdevOptions, with the extra complication that this series only deals
> with the easy one of the four above categories.

I'm not sure which exact problem with BlockdevOptions you mean. The
reason why the block layer doesn't use BlockdevOptions everywhere is
-drive support.

> > Maybe if we don't want to commit to keeping the ObjectOptions schema,
> > the part that should wait is object-add and I should do the command line
> > options first? Then the schema remains an implementation detail for now
> > that is invisible in introspection.
> 
> I don't see much benefit in converting _any_ of the three actually.  The
> only good reason I see for QAPIfying this is the documentation, and the
> promise of deduplicating QOM boilerplate.  The latter is only a promise, but
> documentation alone is a damn good reason and it's enough to get this work
> into a mergeable shape as soon as possible!

I think having some input validation done by QAPI instead of in each QOM
object individually is nice, too. You get it after CLI, QMP and HMP all
go through QAPI.

> But maybe, we could start in the opposite direction: start with the use QAPI
> to eliminate QOM boilerplate.  Basing your work on Eduardo's field
> properties series, you could add a new 'object' "kind" to QAPI that would
> create an array of field properties (e.g. a macro expanding to a compound
> literal?)

There is a very simple reason why I don't want to start with the QAPI
generator: John has multiple series pending that touch basically every
part of the QAPI generator. This means not only that I need to be
careful about merge conflict (or base my work on top of five other
series, which feels adventurous), but also that I would be competing
with John for Markus' reviewer capacity, further slowing things down.

Well, two reasons: Also because this series for the external interface
of the objects already exists and it's an incremental step towards your
proposal: The types for 'properties' will already exist then and I won't
have to convert both internal state and external interfaces at the same
time.

> .  Something like
> 
> 
> +{ 'object': 'InputBarrier',
> +  'data': { 'name': 'str',
> +            'x-origin': 'int16',
> +            'y-origin': 'int16',
> +            'width': 'int16',
> +            'height': 'int16' },
> +  'properties': { 'server': 'str',
> +                  'port': 'str' } }

I think we have similar ideas there (see my reply to Dan), just that I
see it as an incremental step on top of this one.

> would create a macro QOM_InputBarrier_FIELDS defining properties for the
> following fields of the InputBarrier struct:
> 
>     gchar *name;
>     int16_t x_origin, y_origin;
>     int16_t width, height;
> 
> while server and port would only appear in the documentation (or
> alternatively you could leave them out completely, as you wish).
> The advantages would be noticeable:
> 
> 1) the information would be moved in the QAPI schema JSON from the
> beginning, decoupling the conflict-heavy part from the complex question of
> how to expose the QOM schema in the introspection data
> 
> 2) there would not be any more duplication than before (there would be
> duplication between structs and QAPI schema, but not between structs and C
> code that defines properties).
> 
> 3) it would be opt-in, so it doesn't put on you the burden of keeping the
> series in sync with new objects that are added (I have one for the qtest
> server for example).  At the same time it would be quite appealing for
> owners of QOM code to convert their objects to field properties and get
> documentation for free.
> 
> 4) we could special-case 'object' definitions and generate them in the
> system manual as well, since they are also useful to document -object.
> 
> Yes it's a huge change but you have the boring part already done.  What do
> you think?

Yes, I would be happy to work on something like that. Just not as the
first step, because I think it's nothing that would help us get this
series in a mergable state as soon as possible.

Kevi


