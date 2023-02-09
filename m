Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D3690493
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ45t-0007XI-Rq; Thu, 09 Feb 2023 05:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ45r-0007LF-Di
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ45p-0007D9-EI
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675938232;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PtDbNajDBDNaM54xmkHOW/QeT5tl8v6fNKGSvtPfacs=;
 b=TfEaRU8pKwbIFdSilMtpB/5gds9fUNZ2iKKwT8du0hn0zppDinbTxWlvgoR4Ox8m9U7tIn
 +yKlRNnflBm7Qg7QfFyVQ+OXbzSShGxgbIuNyzbKC2qMlkQ0isBTsORD0TRB+jCq2GTGXF
 rvA13kOVA42UU8yeeitS0ILzs2YP+/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-c6Xdlk5dOEirfODHnfk9Mw-1; Thu, 09 Feb 2023 05:23:48 -0500
X-MC-Unique: c6Xdlk5dOEirfODHnfk9Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC861869B6F;
 Thu,  9 Feb 2023 10:23:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C39318EC1;
 Thu,  9 Feb 2023 10:23:46 +0000 (UTC)
Date: Thu, 9 Feb 2023 10:23:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <Y+TJr7An261VcVJ/@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208201712.b3a5xtufscrvncqt@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Wed, Feb 08, 2023 at 02:17:12PM -0600, Eric Blake wrote:
> On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
> > Existing 'migrate' QAPI design enforces transport mechanism, ip address
> > of destination interface and corresponding port number in the form
> > of a unified string 'uri' parameter for initiating a migration stream.
> > This scheme has a significant flaw in it - double encoding of existing
> > URIs to extract migration info.
> > 
> > The current patch maps QAPI uri design onto well defined MigrateChannel
> > struct. This modified QAPI helps in preventing multi-level uri
> > encodings ('uri' parameter is kept for backward compatibility).
> > 
> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> > Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> > Signed-off-by: Het Gala <het.gala@nutanix.com>
> > ---
> >  qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 129 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index c84fa10e86..79acfcfe4e 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -1449,12 +1449,108 @@
> >  ##
> >  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
> >  
> > +##
> > +# @MigrateTransport:
> > +#
> > +# The supported communication transport mechanisms for migration
> > +#
> > +# @socket: Supported communication type between two devices for migration.
> > +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
> > +#          'fd' already
> > +#
> > +# @exec: Supported communication type to redirect migration stream into file.
> > +#
> > +# @rdma: Supported communication type to redirect rdma type migration stream.
> > +#
> > +# Since 8.0
> > +##
> > +{ 'enum': 'MigrateTransport',
> > +  'data': ['socket', 'exec', 'rdma'] }
> > +
> > +##
> > +# @MigrateSocketAddr:
> > +#
> > +# To support different type of socket.
> > +#
> > +# @socket-type: Different type of socket connections.
> > +#
> > +# Since 8.0
> > +##
> > +{ 'struct': 'MigrateSocketAddr',
> > +  'data': {'socket-type': 'SocketAddress' } }
> 
> Here, you use 'socket-type',...
> 
> > +
> > +##
> > +# @MigrateExecAddr:
> > + #
> > + # Since 8.0
> > + ##
> > +{ 'struct': 'MigrateExecAddr',
> > +   'data' : {'data': ['str'] } }
> 
> Inconsistent on whether you have a space before :.  Most of our qapi
> files prefer the layout:
> 
> 'key': 'value'
> 
> that is, no space before, one space after.  It doesn't affect
> correctness, but a consistent visual style is worth striving for.
> 
> > +
> > +##
> > +# @MigrateRdmaAddr:
> > +#
> > +# Since 8.0
> > +##
> > +{ 'struct': 'MigrateRdmaAddr',
> > +   'data' : {'data': 'InetSocketAddress' } }
> 
> ...while these branches supply everything else under 'data'. Also,
> while you documented @socket-type above, you did not document @data in
> either of these two types.  [1]
> 
> > +
> > +##
> > +# @MigrateAddress:
> > +#
> > +# The options available for communication transport mechanisms for migration
> > +#
> > +# Since 8.0
> > +##
> > +{ 'union' : 'MigrateAddress',
> > +  'base' : { 'transport' : 'MigrateTransport'},
> > +  'discriminator' : 'transport',
> > +  'data' : {
> > +    'socket' : 'MigrateSocketAddr',
> > +    'exec' : 'MigrateExecAddr',
> > +    'rdma': 'MigrateRdmaAddr' } }
> 
> Another example of inconsistent spacing around :.
> 
> I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
> is that SocketAddress is itself a discriminated union, and Markus does
> not yet have the QAPI generator wired up to support one union as a
> branch of another larger union?  It leads to extra nesting on the wire
> [2]

I don't know the backstory on this limitation. Is it something that
is very difficult to resolve ? I think it is highly desirable to have
'socket': 'SocketAddress' here. It would be a shame to introduce this
better migration API design and then have it complicated by a possibly
short term limitation of QAPI.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


