Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0063384B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPVY-0005zk-O6; Tue, 22 Nov 2022 04:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxPVV-0005zW-D6
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxPVS-0007ym-S0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669109033;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OGVLxzzQ9J5YOO7f1BmVV5rGQuENIbHh7eZLs1V282o=;
 b=EWo3eXHuG3jLUOXhqqkCRLlFU8NDFah53OotaqEPNa0Jf1ARvXaljes8O+s9Rw4aqAiGw5
 QfmlqFQQvgtn7XzgbNPEFTkOS6mb+/cMjEbd7iubfVRV+MJtfOQJ5tXPAGwNPRzUmdpXyt
 nCPA35pHtLHVsfVx+i6HV18SiwxJuTw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Mi8KSxEaME6t_VUdZllLPw-1; Tue, 22 Nov 2022 04:23:49 -0500
X-MC-Unique: Mi8KSxEaME6t_VUdZllLPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26EE5185A794;
 Tue, 22 Nov 2022 09:23:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B38D240C6DC7;
 Tue, 22 Nov 2022 09:23:46 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:23:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
Message-ID: <Y3yVHpH2080Dm9eM@redhat.com>
References: <20221121110427.198431-1-het.gala@nutanix.com>
 <87pmdgtr9g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pmdgtr9g.fsf@secure.mitica>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Mon, Nov 21, 2022 at 01:40:27PM +0100, Juan Quintela wrote:
> Het Gala <het.gala@nutanix.com> wrote:
> > To prevent double data encoding of uris, instead of passing transport
> > mechanisms, host address and port all together in form of a single string
> > and writing different parsing functions, we intend the user to explicitly
> > mention most of the parameters through the medium of qmp command itself.
> >
> > The current patch is continuation of patchset series
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg901274.html
> > and reply to the ongoing discussion for better QAPI design here
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg903753.html.
> >
> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> > Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> > Signed-off-by: Het Gala <het.gala@nutanix.com>




> 
> > +{ 'struct': 'MigrateChannel',
> > +  'data' : {
> > +    'channeltype' : 'MigrateChannelType',
> > +    '*src-addr' : 'MigrateAddress',
> > +    'dest-addr' : 'MigrateAddress',
> 
> Why do we want *both* addresses?

This is part of their goal to have source based routing, so that
traffic exits the src host via a particular NIC.

I think this patch would be better if we split it into two parts.

First introduce "MigrateChannel" struct with *only* the 'dest-addr'
field, and only allow one element in the list, making 'uri' optional.

Basically the first patch would *only* be about switching the
'migrate' command from using a plain string to a MigrateAddress
structure.

A second patch would then extend it to allow multiple MigrateChannel
elements, to support different destinations for each channel.

A third patch would then  extend it to add src-addr to attain the
source based routing.

A fourth patch can then deprecate the existing 'uri' field.

> 
> > +    '*multifd-count' : 'int' } }
> 
> And if we are passing a list, why do we want to pass the real number?

Yeah, technically I think this field is redundant, as you can just
add many entires to the 'channels' list, using the same addresses.
All this field does is allow a more compact JSON arg list. I'm
not sure this is neccessary, unless we're expecting huge numbers
of 'channels', and even then this isn't likely to be a performance
issue.

> 
> >  # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
> >  # <- { "return": {} }
> >  #
> > +# -> { "execute": "migrate",
> > +#      "arguments": {
> > +#          "channels": [ { 'channeltype': 'control',
> > +#                          'dest-addr': {'transport': 'socket',
> > +#                                        'type': 'inet',
> > +#                                        'host': '10.12.34.9', 'port': '1050'}},
> > +#                        { 'channeltype': 'data',
> > +#                          'src-addr': {'transport': 'socket',
> > +#                                        'type': 'inet',
> > +#                                        'host': '10.12.34.9',
> > +#                                        'port': '4000', 'ipv4': 'true'},
> > +#                          'dest-addr': { 'transport': 'socket',
> > +#                                          'type': 'inet',
> > +#                                          'host': '10.12.34.92',
> > +#                                          'port': '1234', 'ipv4': 'true'},
> > +#                          'multifd-count': 5 },
> > +#                        { 'channeltype': 'data',
> > +#                          'src-addr': {'transport': 'socket',
> > +#                                        'type': 'inet',
> > +#                                        'host': '10.2.3.4', 'port': '1000'},
> > +#                          'dest-addr': {'transport': 'socket',
> > +#                                         'type': 'inet',
> > +#                                         'host': '0.0.0.4', 'port': '3000'},
> > +#                          'multifd-count': 3 } ] } }
> > +# <- { "return": {} }
> > +#
> >  ##
> >  { 'command': 'migrate',
> > -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> > -           '*detach': 'bool', '*resume': 'bool' } }
> > +  'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
> 
> I think that "uri" bit should be dropped, right?

No, it is required for back compatibility with existing clients.
It should be marked deprecated, and removed several releases later,
at which point 'chanels' can become mandatory instead of optional.

> 
> > +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
> >  
> >  ##
> >  # @migrate-incoming:
> 
> I can't see how to make the old one to work on top of this one (i.e. we
> would have to create strings from lists on QAPI, I think that is just
> too much).

All we need is a piece of code that parses the 'uri' parameter and
creates a MigrateAddress address from it. This can be called in
the qmp_migrate() handler, and thereafter, everything else in the
migration code can work with the MigrateAddress structs. SHould
be pretty easy.

> 
> So I think that the best way (I know I am contradicting myself) is to
> create a new migrate command and just let the old one alone.  That way:
> - you can drop blk and blk

blk & inc

> - you can do anything that you want with the uris, as assuming that they
>   are always sockets.

Regardless of whether we use the existing or new QMP command, we still
have to convert the code to use the MigrateAddress struct, so I don't
think it makes any difference. Both cases will require that we write
code to convert from the legacy 'string' URI, to the new MigrateAddress
struct.

> - I would not care at all about the "exec" protocol, just leave that
>   alone in the deprecated command.  Right now:
>   * we can't move it to multifd without a lot of PAIN
>   * there are patches on the list suggesting that what we really want is
>     to create a file that is the size of RAM and just write all the RAM
>     at the right place.
>   * that would make the way to create snapshots (I don't know if anyones
>     still wants them, much easier).
>   * I think that the only real use of exec migration was to create
>     snapshots, for real migration, using a socket is much, much saner.
>   * I.e. what I mean here is that for exec migration, we need to think
>     if we want to continue supporting it for normal migration, or only
>     as a way to create snapshots.

The main challenge with 'exec' protocol is that it only sets up a
uni-directional data channel. The main migration channel protocol
has always been unidirectional, and that's responsible for alot of
our pain in migration. There's no way todo a protocol handshake to
negotiate features between client&server during connection. As such
we've invented a ridiculous number of migration parameters that
libvirt and other mgmt apps need to set on both sides - basically
we have punted negotiation out of band to the mgmt app which is
crazy.

For our future sanity I think we need to define a brand new migration
protocol which is bidirectional from the start. A large number of the
MigrateParameters would become obsolete immediately, as QEMU could
negotiate them automatically. This would let QEMU introduce new
migration features without requiring any work in libvirt in many
cases. Libvirt should only be required when there are performance
tunables that need exposing, never for protocol feature negotiation.

I think introducing a new QMP command, without introducing a fully
new protocol would be a big mistake as the QMP command is not the
problem we have.

I've written much more detail about this here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03655.html

I don't think this should be a dependancy for this patch proposal
though. This is purely about making the 'migrate' command follow
QMP best practice, by using a struct instead of encoding data in
a string URI, and can be retrofitted to the existing command without
difficulty.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


