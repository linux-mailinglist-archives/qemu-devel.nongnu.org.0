Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCB6909CA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:23:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6t5-0002Xu-5l; Thu, 09 Feb 2023 08:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ6t2-0002Ru-Pn
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:22:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ6t0-0000Qo-HS
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675948967;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/Ptw1DIY1N1gHSIpPLEvQdvUyfr2mcSzPmBGcTWt6o=;
 b=C4iZfU+ADAed1y+S9JRxzlwDBEmRMe6qgCS4giig8TUv+skWAxbhJ2wL+CLm3HbRxrTHXh
 CKTK6ViJlV5PjNOIRlT/rqTqNHHAvsI1GHxvbYE8luPgSz6KCHEMge03OfUQbHwsm1N93f
 iZl1Gg8qc71Uqsq4rNAqSlLVCU36PWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-9MoUP6YIPaaiDftQz7Rz-w-1; Thu, 09 Feb 2023 08:22:44 -0500
X-MC-Unique: 9MoUP6YIPaaiDftQz7Rz-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80E9F18E0A64;
 Thu,  9 Feb 2023 13:22:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6866C16022;
 Thu,  9 Feb 2023 13:22:39 +0000 (UTC)
Date: Thu, 9 Feb 2023 13:22:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <Y+TzljkiS2JS0Uhw@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <Y+TLJ9Ui790bIR3b@redhat.com>
 <ce476f1c-a2ec-9dd5-c36a-d60bb2a29286@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce476f1c-a2ec-9dd5-c36a-d60bb2a29286@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Thu, Feb 09, 2023 at 06:41:41PM +0530, Het Gala wrote:
> 
> On 09/02/23 3:59 pm, Daniel P. Berrangé wrote:
> > On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
> > > Existing 'migrate' QAPI design enforces transport mechanism, ip address
> > > of destination interface and corresponding port number in the form
> > > of a unified string 'uri' parameter for initiating a migration stream.
> > > This scheme has a significant flaw in it - double encoding of existing
> > > URIs to extract migration info.
> > > 
> > > The current patch maps QAPI uri design onto well defined MigrateChannel
> > > struct. This modified QAPI helps in preventing multi-level uri
> > > encodings ('uri' parameter is kept for backward compatibility).
> > > 
> > > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > > Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> > > Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> > > Signed-off-by: Het Gala <het.gala@nutanix.com>
> > > ---
> > >   qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
> > >   1 file changed, 129 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index c84fa10e86..79acfcfe4e 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -1449,12 +1449,108 @@
> > >   ##
> > >   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
> > > +
> > > +##
> > > +# @MigrateSocketAddr:
> > > +#
> > > +# To support different type of socket.
> > > +#
> > > +# @socket-type: Different type of socket connections.
> > > +#
> > > +# Since 8.0
> > > +##
> > > +{ 'struct': 'MigrateSocketAddr',
> > > +  'data': {'socket-type': 'SocketAddress' } }
> > I'd really like this struct to go away, but if it must exist,
> > then call this field 'addr', as I think 'socket-type' is overly
> > verbose.
> In v3 patchset, I have already changed from 'socket-type' to 'data'.



> > > +
> > > +##
> > > +# @MigrateExecAddr:
> > > + #
> > > + # Since 8.0
> > > + ##
> > > +{ 'struct': 'MigrateExecAddr',
> > > +   'data' : {'data': ['str'] } }
> > Instead of having the field called 'data' lets me more
> > descriptive, and perhaps rename the struct too:
> > 
> >   { 'struct': 'MigrateCommand',
> >      'data' : {'args': ['str'] } }
> > 
> > Any thoughts on whether we should allow for setting env varibles
> > too ?
> 
> Daniel, won't 'MigrateCommand' be too generic ? I am of the opinion that, if
> its related to 'exec' transport, the struct name should reflect that ?

Mostly I'm indicating that it is not really an address that
we're providing, it is a command argv,  so felt the struct
could reflect that. We could do  MigrateExecCommand.

> I did not get your question allowing setting environment variables. Could
> you explain it in more detail ?

When spawning processes, execvp() lets use provide argv + env. If
env is not provided, we inherit from QEMU. Currently we're only
providing argv, so I was wondering if we should allow env too.
Probably overkill, but at least having the 'MigrateCommand'
struct lets us add it later.

> 
> > > +##
> > > +# @MigrateRdmaAddr:
> > > +#
> > > +# Since 8.0
> > > +##
> > > +{ 'struct': 'MigrateRdmaAddr',
> > > +   'data' : {'data': 'InetSocketAddress' } }
> > InetSocketAddress is a plain struct, so I think we can use
> > that directly, no ?
> Yes, we can use it directly. Just to keep consistency with other transport
> mechanisms, I made a separate struct even for rdma.
> > > +
> > > +##
> > > +# @MigrateAddress:
> > > +#
> > > +# The options available for communication transport mechanisms for migration
> > > +#
> > > +# Since 8.0
> > > +##
> > > +{ 'union' : 'MigrateAddress',
> > > +  'base' : { 'transport' : 'MigrateTransport'},
> > > +  'discriminator' : 'transport',
> > > +  'data' : {
> > > +    'socket' : 'MigrateSocketAddr',
> > > +    'exec' : 'MigrateExecAddr',
> > > +    'rdma': 'MigrateRdmaAddr' } }
> > Ideally this would be
> > 
> >     'data' : {
> >       'socket' : 'SocketAddress',
> >       'exec' : 'MigrateCommand',
> >       'rdma': 'InetSocketAddress' } }
> > 
> > though the first SocketAddress isn't possible unless it is easy to
> > lift the QAPI limitation.
> 
> Yes, I agree with you Daniel. If we can fix the first one - SocketAddress
> one, can we also allow ['str'] to also be directly represented by modifying
> QAPI ?
> 
> ex: 'exec': ['str'] ... something like this ?

No, I think it is important to use a struct for 'exec' to allow
future expansion of parameters.


> > > +# -> { "execute": "migrate",
> > > +#      "arguments": {
> > > +#          "channel": { "channeltype": "main",
> > > +#                        "addr": { "transport": "socket",
> > > +#                                  "socket-type": { "type': "inet',
> > > +#                                                   "host": "10.12.34.9",
> > > +#                                                   "port": "1050" } } } } }
> > > +# <- { "return": {} }
> > > +#
> > > +# -> { "execute": "migrate",
> > > +#      "arguments": {
> > > +#          "channel": { "channeltype": "main",
> > > +#                       "addr": { "transport": "exec",
> > > +#                                 "exec": ["/bin/nc", "-U",
> > > +#                                          "/some/sock" ] } } } }
> > > +# <- { "return": {} }
> > > +#
> > > +# -> { "execute": "migrate",
> > > +#      "arguments": {
> > > +#          "channel": { "channeltype": "main",
> > > +#                       "addr": { "transport": "rdma",
> > > +#                                 "rdma": { "host": "10.12.34.9",
> > > +#                                           "port": "1050" } } } } }
> > > +# <- { "return": {} }
> > > +#
> > >   ##
> > >   { 'command': 'migrate',
> > > -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> > > -           '*detach': 'bool', '*resume': 'bool' } }
> > > +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
> > > +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
> > IIRC, the intention was to allow multiple channels to be set in a
> > follow up to this series. If so that would require adding yet another
> > field as an array of MigrateChannel.  Should we just go for the
> > array straight away, and just limit it to 1 element  as a runtime
> > check ? eg
> > 
> >    'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
> >             '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
> Yes, I got your point Daniel. But I feel it is better to introduce it in
> follow up series along with introducing different channel types (main, data,
> postcopy). It would then also make sense to introduce a list of
> 'MigrateChannel'.

Right, that means if we release QEMU 8.0.0 with the 'channel' parameter,
and your next series doesn't get merged until 8.1.0, we're stuck
supporting both 'channel' and 'channels'.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


