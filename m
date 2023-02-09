Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFC69086F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5qQ-0002Gq-AC; Thu, 09 Feb 2023 07:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5qL-0002G5-59
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:16:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5qJ-0003CZ-Cb
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675944958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNTD5je9fg9x4tT0kDuBphOy/5rSQdvpzRyi0KLLL8w=;
 b=gFB4qktL6PBhihCFgjJQdaKWNT/w7NL62HtwKVw9I69OKE0KjTq+z0YmcoqVnixchYXk7n
 C6wMfTNWAejQRADKuko6RYJ0eL+UA+eboZczOg+O4Na5N/A4l1qnEEW+kL8ZhppAg2BTZH
 hOk9M9t1Qkg4wwvqZb4slMYasNwvqWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-efhSK7TnP7SQvmOyfu6vfQ-1; Thu, 09 Feb 2023 07:15:57 -0500
X-MC-Unique: efhSK7TnP7SQvmOyfu6vfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83AB685A588;
 Thu,  9 Feb 2023 12:15:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 665A61121315;
 Thu,  9 Feb 2023 12:15:53 +0000 (UTC)
Date: Thu, 9 Feb 2023 12:15:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, frankja@linux.ibm.com,
 clg@kaod.org
Subject: Re: [PATCH v15 10/11] qapi/s390x/cpu topology: CPU_POLARITY_CHANGE
 qapi event
Message-ID: <Y+Tj9wjvss5O7GCH@redhat.com>
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-11-pmorel@linux.ibm.com>
 <5b26ee514ccbbfaf5670cbf0cb006d8e706fe5ae.camel@linux.ibm.com>
 <Y+TFRNoOAfZ7QTvp@redhat.com>
 <4622b3c1e565b89132be8b5a8cda61aef9c5d0f6.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4622b3c1e565b89132be8b5a8cda61aef9c5d0f6.camel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 01:12:17PM +0100, Nina Schoetterl-Glausch wrote:
> On Thu, 2023-02-09 at 10:04 +0000, Daniel P. Berrangé wrote:
> > On Wed, Feb 08, 2023 at 06:35:39PM +0100, Nina Schoetterl-Glausch wrote:
> > > On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
> > > > When the guest asks to change the polarity this change
> > > > is forwarded to the admin using QAPI.
> > > > The admin is supposed to take according decisions concerning
> > > > CPU provisioning.
> > > > 
> > > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > > ---
> > > >  qapi/machine-target.json | 30 ++++++++++++++++++++++++++++++
> > > >  hw/s390x/cpu-topology.c  |  2 ++
> > > >  2 files changed, 32 insertions(+)
> > > > 
> > > > diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> > > > index 58df0f5061..5883c3b020 100644
> > > > --- a/qapi/machine-target.json
> > > > +++ b/qapi/machine-target.json
> > > > @@ -371,3 +371,33 @@
> > > >    },
> > > >    'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
> > > >  }
> > > > +
> > > > +##
> > > > +# @CPU_POLARITY_CHANGE:
> > > > +#
> > > > +# Emitted when the guest asks to change the polarity.
> > > > +#
> > > > +# @polarity: polarity specified by the guest
> > > > +#
> > > > +# The guest can tell the host (via the PTF instruction) whether the
> > > > +# CPUs should be provisioned using horizontal or vertical polarity.
> > > > +#
> > > > +# On horizontal polarity the host is expected to provision all vCPUs
> > > > +# equally.
> > > > +# On vertical polarity the host can provision each vCPU differently.
> > > > +# The guest will get information on the details of the provisioning
> > > > +# the next time it uses the STSI(15) instruction.
> > > > +#
> > > > +# Since: 8.0
> > > > +#
> > > > +# Example:
> > > > +#
> > > > +# <- { "event": "CPU_POLARITY_CHANGE",
> > > > +#      "data": { "polarity": 0 },
> > > > +#      "timestamp": { "seconds": 1401385907, "microseconds": 422329 } }
> > > > +#
> > > > +##
> > > > +{ 'event': 'CPU_POLARITY_CHANGE',
> > > > +  'data': { 'polarity': 'int' },
> > > > +   'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM'] }
> > > 
> > > I wonder if you should depend on CONFIG_KVM or not. If tcg gets topology
> > > support it will use the same event and right now it would just never be emitted.
> > > On the other hand it's more conservative this way.
> > > 
> > > I also wonder if you should add 'feature' : [ 'unstable' ].
> > > On the upside, it would mark the event as unstable, but I don't know what the
> > > consequences are exactly.
> > 
> > The intention of this flag is to allow mgmt apps to make a usage policy
> > decision.
> > 
> > Libvirt's policy is that we'll never use features marked unstable.
> 
> Does it enforce that, e.g via compat policies?

The policy is applied at time of code review, in that we'll not
merge patches that use features marked unstable.

> If so, I assume there is some way to allow use of unstable features in libvirt for development?
> If for example you're prototyping a new mgmt feature that uses unstable commands.

You can prototype usage in libvirt in a fork of course, but we
won't take patches into the libvirt upstream repo.

Alternatively in some cases the the libvirt QMP passthrough can
be used for experiemnts (eg virsh qemu-monitor-command ) in a
non-production envionrment.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


