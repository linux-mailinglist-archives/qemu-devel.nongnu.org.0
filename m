Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E744569E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:54:27 +0100 (CET)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mif4M-00013N-5k
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mif2l-00084E-Vu
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mif2h-0007ql-7s
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636041162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bZqwnFzqwo7Q35gzV1BZvZu32Q+RxGPwCS2gtZ/8Z5w=;
 b=MrnNaNk9c7ZArFVhbJPTb628hfnZWrzd06r0Apa/GGLod4XmKPvUCjPI9o+fe5/Iic4x5P
 DGa31XE7jITQyTqEPalEh5dnn6Bc4t+jk3GFa3+KI/lbfvn4aI+v9TCTGffzL4w3ILmDYM
 6V5dLuwN0JCKEkqgQB8XkgVTdzP0BPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-_j_m2EZUOWumambLy1kraw-1; Thu, 04 Nov 2021 11:52:41 -0400
X-MC-Unique: _j_m2EZUOWumambLy1kraw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 776B887505D
 for <qemu-devel@nongnu.org>; Thu,  4 Nov 2021 15:52:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85D6B5C1D5;
 Thu,  4 Nov 2021 15:52:00 +0000 (UTC)
Date: Thu, 4 Nov 2021 16:51:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Message-ID: <YYQBn800tIXyYoOa@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
 <YYOiyTcA6zZgtWBs@redhat.com>
 <13f8981a-55e5-e5d9-415f-4658aba16270@redhat.com>
 <YYPtokwlkWzhrJ2u@redhat.com>
 <b6d97674-d1d3-222a-c6a5-d9ce8f724ca7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b6d97674-d1d3-222a-c6a5-d9ce8f724ca7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, berrange@redhat.com, eblake@redhat.com,
 armbru@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 15:49 hat Paolo Bonzini geschrieben:
> On 11/4/21 15:26, Kevin Wolf wrote:
> > It took me a while to figure out how to deal with this, but I'm quite
> > happy with the result.
> 
> I like it too.
> 
> > > > Oh, and I also wanted to say something about why not just directly using
> > > > the class name, which was my first idea: 'foo': 'iothread' looks more
> > > > like referencing an existing iothread rather than the configuration for
> > > > a new one. I wanted to leave us the option that we could possibly later
> > > > take a string for such options (a QOM path) and then pass the referenced
> > > > object to QMP commands as the proper QOM type.
> > > 
> > > I agree that 'iothread' is going to be confusing when you're referring to
> > > the configuration.
> > > 
> > > Anyway I'm totally fine with 'qom-config:classname'.  Given this
> > > explanation, however, one alternative that makes sense could be
> > > 'classname:full-config'. Then you could use 'classname:config' for the
> > > autoboxed configs---and reserve 'classname' to mean the pointer to an
> > > object.  Classes are (generally) lowercase and QAPI structs are
> > > CamelCase, so there is not much potential for collisions.
> > 
> > Makes sense to me, too.
> > 
> > I just checked and I actually already forbid class names with colons in
> > them (check_name_str() takes care of this), so yes, suffixes actually
> > work on the QAPI level.
> > 
> > If we actually want to use these types in manually written C code, we
> > might have to convert the name to CamelCase, though, for consistency
> > with the coding style.
> > 
> > We already have a function camel_to_upper(), we'd need a new
> > lower_to_camel(), so that from a class 'rng-random', you would get types
> > 'RngRandomConfig' (the local ones) and 'RngRandomFullConfig' (with
> > parent options).
> 
> That's nice.  IMO with these changes the autoboxing becomes again more
> appealing.  With the auto-generated local config struct,
> 
>     { 'class': 'rng-egd',
>       'parent': 'rng-backend',
>       'config': { 'chardev': 'str' } }
> 
> now maps to
> 
>     bool qom_rng_egd_config(Object *obj, RngEgdConfig *config,
>                             Error **errp)
>     {
>         RngEgd *s = RNG_EGD(obj);
> 
>         s->chr_name = g_strdup(config->chardev);
>         return true;
>     }
> 
> The three arguments follow the same prototype as .instance_config:
> 
>     bool (*instance_config)(Object *obj, Visitor *v, Error **errp);
> 
> just with the visitor replaced by a nice C struct.  You started (obviously)
> with the simplest cases, and it's good to check whether easy things remain
> easy, but it seems to me that all but the simplest objects would end up
> using boxed config anyway.

I think I'd still like to have the option of unboxed arguments for the
simpler objects (most user creatable objects are relatively simple), but
flipping the default would make sense if we just automatically create a
named type.

But before I implement anything like this, I'd first like to hear
Markus's opinion because I would prefer to avoid -EMAGIC during review.

> Also (and this is something Markus and I have discussed in the past, but I'm
> not sure if we have actually reached an agreement), I would make
> instance_config return void.  The usual convention *is* to return bool from
> functions that have an Error** and no other return value; however, that's
> because in general there will be more calls to the function than
> definitions.
> 
> In this case, there will be just one call to the ti->instance_config
> function pointer, in object_configure, and N definitions of the function, so
> the ratio and the rationale are reversed.  See object_property_get for an
> example in qom/object.c.

Good point. Though not necessarily one for ti->instance_config because
that's the automatically generated marshaller and returning a bool from
there isn't a problem at all. The function that should definitely return
void is the idiomatic C one that is manually written and called by the
marshaller.

Kevin


