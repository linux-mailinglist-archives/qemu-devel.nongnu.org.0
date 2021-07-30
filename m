Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3161B3DB5C8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 11:20:24 +0200 (CEST)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Ogo-0008Tl-Nl
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 05:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m9Og1-0007ob-Fp
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m9Ofy-0008Vn-4p
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627636768;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hHkFxavtldeABMl9VoceioRxVgBsv0Ar2FxFc2vlakw=;
 b=XEfc34g20qd/Of84/oLC4Z1mUqLAz7Qwm55GSJ91BkX/ybn4Si4BXTZ3BMC+mOhC6hsIS1
 MP3PfBvow58M+G+n8FnQR+HdQBwyqKBPncpxleXiZ5SyYyDW3XMBfvubhwOFMcIYLjU2id
 n9qPAZNk4zEx65gJC/QKMjua9n+t5Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-ayvnkUsMM5u-J_pxGUwsDw-1; Fri, 30 Jul 2021 05:19:22 -0400
X-MC-Unique: ayvnkUsMM5u-J_pxGUwsDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC601800D41;
 Fri, 30 Jul 2021 09:19:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58561100164C;
 Fri, 30 Jul 2021 09:19:20 +0000 (UTC)
Date: Fri, 30 Jul 2021 10:19:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class
 typedefs from example
Message-ID: <YQPEFQN+E+JJn4WI@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-7-ehabkost@redhat.com>
 <87eebg43ns.fsf@dusky.pond.sub.org>
 <CAFEAcA8rMcRm90acsrJqUg-TKt1Tj6R9ZTGM7pnvs_M4-5=rPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8rMcRm90acsrJqUg-TKt1Tj6R9ZTGM7pnvs_M4-5=rPQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 09:43:55AM +0100, Peter Maydell wrote:
> On Fri, 30 Jul 2021 at 09:18, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Eduardo Habkost <ehabkost@redhat.com> writes:
> >
> > > When there's no specific class struct used for a QOM type, we
> > > normally don't define a typedef for it.  Remove the typedef from
> > > the minimal example, as it is unnecessary.
> > >
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > >  docs/devel/qom.rst | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > > index 05d045bf570..dee60a64c0a 100644
> > > --- a/docs/devel/qom.rst
> > > +++ b/docs/devel/qom.rst
> > > @@ -20,9 +20,6 @@ features:
> > >
> > >     #define TYPE_MY_DEVICE "my-device"
> > >
> > > -   // No new virtual functions: we can reuse the typedef for the
> > > -   // superclass.
> > > -   typedef DeviceClass MyDeviceClass;
> > >     typedef struct MyDevice
> > >     {
> > >         DeviceState parent;
> >
> > Documenting existing practice makes sense, but I'm not sure the existing
> > practice to elide this typedef makes sense.
> 
> The QOMConventions page on the wiki
> https://wiki.qemu.org/Documentation/QOMConventions
> makes what I think is a reasonable distinction:
> 
> # If your class (a) will be subclassed or (b) has member fields it needs
> # to put in its class struct then you should write all of:
> #
> # a FOO_CLASS macro
> # a FOO_GET_CLASS macro
> # a FooClass structure definition containing at least the parent class field
> #
> # and your TypeInfo for this class should set the .class_size field to
> sizeof(FooClass).
> #
> # These ensure that nothing in future should need changing if new fields are
> # added to your class struct, and that any subclasses have the correct typenames
> # available so they won't need to change either even if your
> implementation changes.
> #
> # If your class meets neither of the above requirements (ie it is a
> simple leaf class) then:
> #
> # don't provide FOO_CLASS or FOO_GET_CLASS
> # don't provide a FooClass structure
> # leave the TypeInfo's .class_size field unset.
> #
> # If a change means a class which didn't provide these macros/types now needs to
> # provide them, then your change should add all of them (ie move the class from
> # the latter category to the former).
> 
> By those principles, we should never do "typedef DeviceClass MyDeviceClass" --
> either we have a real MyDeviceClass which contains at least the parent
> class field (ie is not a mere typedef), or we don't provide MyDeviceClass
> at all.
> 
> I would say the rationale for the wiki's distinction is that we don't
> want to require unnecessary boilerplate for leaf classes without
> methods (which are by far the most common kind of class), but we don't
> want a free-for-all regarding how you write things either. So we define
> a standard pattern for leaves and a standard pattern for everything else.

Neither the wiki page above nor this part of the docs is really
showing best practice. The best practice is much later in this
doc where it shows the macros that eliminate all of tedious
boilerplate code:

https://qemu-project.gitlab.io/qemu/devel/qom.html#standard-type-declaration-and-definition-macros

Personally I'd suggest we reverse the documentation order, so that the
first thing we tell people about at the simple macros for declaring
types, and strongly recomend that they are used. Only document the
manual boilerplate at the end, merely as reference material, and
recommend against its use.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


