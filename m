Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398C3D0424
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:57:20 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xjr-00052d-BJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5xho-000366-3M
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5xhh-000394-10
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626818103;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tjrEonBLEQaFUWSOalEHIdAfcRQHdroEW6zEcUlPTTs=;
 b=Qiru6S9xNN7S4EGnqjaQzypoj/yiZj3v/3Jie5lx/Q8D6zuBsSwtTA39E5qNCEEUAf6U1B
 yBMjnP8B8eDT/MviiVjBdVrZfWAD96RPFEvxzkekgo0H46Gr92G4BLGzEFpi/JG0IgyumH
 zzUK9GpHrVj5WErN4ZXnZXFQvHcBN6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-0juPyDSiPWKxqAjSERV_RQ-1; Tue, 20 Jul 2021 17:55:02 -0400
X-MC-Unique: 0juPyDSiPWKxqAjSERV_RQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95198804143;
 Tue, 20 Jul 2021 21:55:00 +0000 (UTC)
Received: from redhat.com (ovpn-112-43.ams2.redhat.com [10.36.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7458E5D705;
 Tue, 20 Jul 2021 21:54:53 +0000 (UTC)
Date: Tue, 20 Jul 2021 22:54:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
Message-ID: <YPdFfSI7RdXOSnhE@redhat.com>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
 <87h7gy4990.fsf@dusky.pond.sub.org>
 <20210720194212.vjmsktx2ti3apv2d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210720194212.vjmsktx2ti3apv2d@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 02:42:12PM -0500, Michael Roth wrote:
> On Tue, Jul 13, 2021 at 03:46:19PM +0200, Markus Armbruster wrote:
> > Brijesh Singh <brijesh.singh@amd.com> writes:
> > 
> > > To launch the SEV-SNP guest, a user can specify up to 8 parameters.
> > > Passing all parameters through command line can be difficult. To simplify
> > > the launch parameter passing, introduce a .ini-like config file that can be
> > > used for passing the parameters to the launch flow.
> > >
> > > The contents of the config file will look like this:
> > >
> > > $ cat snp-launch.init
> > >
> > > # SNP launch parameters
> > > [SEV-SNP]
> > > init_flags = 0
> > > policy = 0x1000
> > > id_block = "YWFhYWFhYWFhYWFhYWFhCg=="
> > >
> > >
> > > Add 'snp' property that can be used to indicate that SEV guest launch
> > > should enable the SNP support.
> > >
> > > SEV-SNP guest launch examples:
> > >
> > > 1) launch without additional parameters
> > >
> > >   $(QEMU_CLI) \
> > >     -object sev-guest,id=sev0,snp=on
> > >
> > > 2) launch with optional parameters
> > >   $(QEMU_CLI) \
> > >     -object sev-guest,id=sev0,snp=on,launch-config=<file>
> > >
> > > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > 
> > I acknowledge doing complex configuration on the command line can be
> > awkward.  But if we added a separate configuration file for every
> > configurable thing where that's the case, we'd have too many already,
> > and we'd constantly grow more.  I don't think this is a viable solution.
> > 
> > In my opinion, much of what we do on the command line should be done in
> > configuration files instead.  Not in several different configuration
> > languages, mind, but using one common language for all our configuration
> > needs.
> > 
> > Some of us argue this language already exists: QMP.  It can't do
> > everything the command line can do, but that's a matter of putting in
> > the work.  However, JSON isn't a good configuration language[1].  To get
> > a decent one, we'd have to to extend JSON[2], or wrap another concrete
> > syntax around QMP's abstract syntax.
> > 
> > But this doesn't help you at all *now*.
> > 
> > I recommend to do exactly what we've done before for complex
> > configuration: define it in the QAPI schema, so we can use both dotted
> > keys and JSON on the command line, and can have QMP, too.  Examples:
> > -blockdev, -display, -compat.
> > 
> > Questions?
> 
> Hi Markus, Daniel,
> 
> I'm dealing with similar considerations with some SNP config options
> relating to CPUID enforcement, so I've started looking into this as
> well, but am still a little confused on the best way to proceed.
> 
> I see that -blockdev supports both JSON command-line arguments (via
> qobject_input_visitor_new) and dotted keys
> (via qobject_input_vistior_new_keyval).
> 
> We could introduce a new config group do the same, maybe something specific
> to ConfidentialGuestSupport objects, e.g.:
> 
>   -confidential-guest-support sev-guest,id=sev0,key_a.subkey_b=...

We don't wnt to be adding new CLI options anymore. -object with json
syntx should ultimately be able to cover everything we'll ever need
to do.

> 
> and use the same mechanisms to parse the options, but this seems to
> either involve adding a layer of option translations between command-line
> and the underlying object properties, or, if we keep the 1:1 mapping
> between QAPI-defined keys and object properties, it basically becomes a
> way to pass a different Visitor implementation into object_property_set(),
> in this case one created by object_input_visitor_new_keyval() instead of
> opts_visitor_new().
> 
> In either case, genericizing it beyond CGS/SEV would basically be
> introducing:
> 
>   -object2 sev-guest,id=sev0,key_a.subkey_b=...
>
> Which one seems preferable? Or is the answer neither?

Yep, neither is the answer.

> 
> I've also been looking at whether this could all be handled via -object,
> and it seems -object already supports JSON command-line arguments, and that
> switching it from using OptsVisitor to QObjectVisitor for non-JSON case
> would be enough to have it handle dotted keys, but I'm not sure what the
> fall-out would be compatibility-wise.
> 
> All lot of that falls under making sure the QObject/keyval parser is
> compatible with existing command-lines parsed via OptsVisitor. One example
> where there still seems to be a difference is lack of support for ranges
> such as "cpus=1-4" in keyval parser. Daniel had a series that addressed
> this:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg08248.html
> 
> but it doesn't seem to have made it into the tree, which is why I feel like
> maybe there are complications with this approach I haven't considered?

The core problem with QemuOpts is that it has hacked various hacks
grafted onto it to cope with non-scalar data. My patch was adding
yet another hack. It very hard to introduce new hacks without risk
of causing incompatibility with other existing hacks, or introducing
unexpected edge cases that we don't anticipate.

Ultimately I think we've come to the conclusion that QemuOpts is an
unfixable dead end that should be left alone. Our future is trending
towards being entirely JSON, configured via the QMP monitor not the
CLI. As such the json support for -object is a step towards the pure
JSON world.

IOW, if you have things that work today with QemuOpts that's fine.

If, however, you're coming across situations that need non-scalar
data and it doesn't work with QemuOpts, then just declare that
-object json syntax is mandatory for that scenario. Don't invest
time trying to improve QemuOpts for non-scalar data, nor inventing
new CLI args.


FWIW, specificallly in the case of parameters that take an integer
range, like cores=1-4, in JSON we'd end up representing that as a
array of integers and having to specify all values explicitly.
This is quite verbose, but functionally works.

I think it would have been nice if we defined an explicit 'bitmap'
scalar data type in QAPI for these kind of things, but at this point
in time I think that ship has sailed, and trying to add that now
would create an inconsistent representation across different places.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


