Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EE446496
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:05:14 +0100 (CET)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizqC-0005vN-CD
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mizhG-0005o2-BP
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mizhE-0003mi-Nf
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636120555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+W9VVVqXqicoLF50h50RXvHCuO9/QQ7PXTAwdCjkr0=;
 b=TsjLLeN92EXhLpA9xPdzmzNA4Eb3QmNhyTpWVlrW0aNdIaE/ZSOoqAw6IrMmp5KF2O1nTr
 v4TXwzhJPFSwcmzKHhrWcyHSua7wFOXEFZWmr1VDjXdemWJqTd0viRf1UVSO+AnyCMlEKH
 n7ADAYNbtcBkiG1LsrE/fsXmnJbF2Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-wcO-FkRmNGCJWLg9tmh3Kg-1; Fri, 05 Nov 2021 09:55:52 -0400
X-MC-Unique: wcO-FkRmNGCJWLg9tmh3Kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F46410168D8;
 Fri,  5 Nov 2021 13:55:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 976C01803D;
 Fri,  5 Nov 2021 13:55:49 +0000 (UTC)
Date: Fri, 5 Nov 2021 14:55:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Message-ID: <YYU34xFC7gxRNhf6@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
 <YYOiyTcA6zZgtWBs@redhat.com>
 <d97fef26-9ec5-8504-ed72-808fcfa3c3db@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <d97fef26-9ec5-8504-ed72-808fcfa3c3db@greensocs.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 16:52 hat Damien Hedde geschrieben:
> On 11/4/21 10:07, Kevin Wolf wrote:
> > Am 03.11.2021 um 22:26 hat Paolo Bonzini geschrieben:
> > > On 11/3/21 18:29, Kevin Wolf wrote:
> > > > This series adds QOM class definitions to the QAPI schema, introduces
> > > > a new TypeInfo.instance_config() callback that configures the object at
> > > > creation time (instead of setting properties individually) and is
> > > > separate from runtime property setters (which often used to be not
> > > > really tested for runtime use), and finally generates a marshalling
> > > > function for .instance_config() from the QAPI schema that makes this a
> > > > natural C interface rather than a visitor based one.
> > > 
> > > That's pretty cool!
> 
> Hi,
> 
> Just to be sure I understand. Is this config a generalization of the
> qdev-properties we have to describe the parameter used to create a
> device ?

Everything I'm doing here is on the QOM level. But qdev is just a layer
on top of QOM, so yes, eventually qdev properties should be declared in
the schema, too. It's useful to keep this long-term goal in mind, but
for now, the immediate goal is making it work for user-creatable
objects.

> > > Just one question: why not always use boxed configuration?  It should not
> > > make the instance_config types any larger, and it avoids unwieldy argument
> > > lists.
> > 
> > Basically for the same reason as for commands (and for consistency with
> > commands): If you have only one or two options, then creating a separate
> > type for them feels just a little over the top, and boxing doesn't work
> > with implicit types.
> > 
> > I really like the concise definitions without a separate struct like in:
> > 
> > { 'class': 'rng-egd',
> >    'parent': 'rng-backend',
> >    'config': { 'chardev': 'str' } }
> > 
> > Though maybe we could make it work by giving the implicit type another
> > prefixed name?
> 
> What's an implicit type in this context ?

The value of 'config' creates an implicit struct type that is considered
anonymous on the QAPI level. With an explicit type, you wouldn't put an
object containing all the options there, but just a type name, like
this:

{ 'struct': 'RngEgdConfig',
  'data': { 'chardev': 'str' } }

{ 'class': 'rng-egd',
   'parent': 'rng-backend',
   'config': 'RngEgdConfig' }

> > 
> > > Also, for the obligatory bikeshedding remark, do you have any other plans or
> > > ideas for the colon-separated auto generated typenames?  Having both the
> > > "namespace" (qom) and the more specific use (config) before the classname is
> > > a bit weird, compared to the existing structs like RngRandomProperties.
> > > Especially if boxed config is more used (or becomes the only possibility),
> > > it might be that qom:class-name:config, or even just class-name:config, make
> > > for nicer code in the object implementation.
> > 
> > 'qom-config:classname' isn't a type that is useful for the object
> > implementations at all. Its only use is really storing the whole
> > configuration temporarily in a QAPI C struct before applying it.
> 
> Would not this type be useful to generate read-only properties (and store
> the values) corresponding to the config if we expect to always have such
> properties ?

No, that's what I explained in the following paragraph. That would be a
different type, because 'qom-config:classname' contains the options for
the parent class, too, but you only want to store the options for the
class itself.

Kevin


