Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23F6351FA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 09:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxkoK-0003xD-Lz; Wed, 23 Nov 2022 03:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxknP-0003s5-Gn
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxknN-00027O-Ou
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669190869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=THgl0bZtR1os6UbxayC2b7Zva4BOn+R614+Dhnp7y1U=;
 b=EA6aTYMpAtBmnDnPGUwSs3CTvrkscOwSjF5aaMPMwR5AxnxyDDjvmJyR87AJFhf/BqIFeE
 m6OAbauOukmSutjgpBPYOKEt57MsTJ0dt7nH3HmwfPewpNCNrd3q4zjx5/Xpmh32wqQfPf
 1NT1Q3mkwDr2MInu1tQpgDVdALXbG8Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-jf2Nr2NlNz2qtYFiVjL7Tw-1; Wed, 23 Nov 2022 03:07:44 -0500
X-MC-Unique: jf2Nr2NlNz2qtYFiVjL7Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C869F862FDF;
 Wed, 23 Nov 2022 08:07:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B868E2166B26;
 Wed, 23 Nov 2022 08:07:41 +0000 (UTC)
Date: Wed, 23 Nov 2022 08:07:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, prerna.saxena@nutanix.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, pbonzini@redhat.com,
 Markus Armbruster <armbru@redhat.com>, eblake@redhat.com,
 Aravind Retnakaran <aravind.retnakaram@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
Message-ID: <Y33UrqcTrXFMqEGl@redhat.com>
References: <20221121110427.198431-1-het.gala@nutanix.com>
 <87pmdgtr9g.fsf@secure.mitica>
 <1192c455-3a06-d4c3-0f35-0ef217fda9ec@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1192c455-3a06-d4c3-0f35-0ef217fda9ec@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Nov 23, 2022 at 01:35:22AM +0530, Het Gala wrote:
> 
> On 21/11/22 6:10 pm, Juan Quintela wrote:
> > Het Gala<het.gala@nutanix.com>  wrote:
> > > To prevent double data encoding of uris, instead of passing transport
> > > mechanisms, host address and port all together in form of a single string
> > > and writing different parsing functions, we intend the user to explicitly
> > > mention most of the parameters through the medium of qmp command itself.
> > Hi
> > 
> > 1st of all, I can't see how this is 7.1 material, I guess we need to
> > move it to 8.0.
> > 
> > Thankyou for informing. I will change it to 8.0
> > > +##
> > > +# @MigrateTransport:
> > > +#
> > > +# The supported communication transport mechanisms for migration
> > > +#
> > > +# @socket: Supported communication type between two devices for migration.
> > > +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
> > > +#          'fd' already
> > > +#
> > > +# @exec: Supported communication type to redirect migration stream into file.
> > > +#
> > > +# Since 7.1
> > > +##
> > > +{ 'enum': 'MigrateTransport',
> > > +  'data': ['socket', 'exec'] }
> > I haven't looked too much into this, but as Danield told in the past, I
> > can see where the rdma falls into this scheme.  I guess it is going to
> > be its own, but who knows.
> So do you mean, 'data' : ['socket', 'exec', 'rdma'] ? or it will be
> separately represented

Yes, you'll need an rdma entry there.  If you follow the patch split
I suggested in the other mail, you'll naturally have to represent
'rdma' in the very first patch, as you introduce the new syntax
for addresses and parse the existing URIs to map onto the new
address struct.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


