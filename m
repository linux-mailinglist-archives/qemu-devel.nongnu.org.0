Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312336D46A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:04:15 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbg7B-0001Fp-B0
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lbg5p-0000r2-OO
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lbg5l-0001Yp-Li
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619600564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRcKeuTP9bGXmQHjcAwL2Bn0WaVyNb7aRCc7v/7K2VI=;
 b=EkyyrW9PgVIr39B/yDtuCznxi9ivp+cEL2k3sdhsKjlcvfC2/HIM9HATtVVO9vChzkCfGb
 JeQm8jL4i/aU4oAUSOJrWV9qn7cufSvuOagjy69tI0axQSrrBBZejkyTv0fSmaGOzUrVES
 bXMlW3BxHXg0d1HY0PAU9ahtYN2R53U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-dsEnaTIePviXJ8HNULeTRw-1; Wed, 28 Apr 2021 05:02:39 -0400
X-MC-Unique: dsEnaTIePviXJ8HNULeTRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F352107ACC7;
 Wed, 28 Apr 2021 09:02:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DAEE19C45;
 Wed, 28 Apr 2021 09:02:36 +0000 (UTC)
Date: Wed, 28 Apr 2021 10:02:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <YIkkqZHfMDAUlitX@redhat.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth> <YIL0Ehmfgc1J9Ci9@redhat.com>
 <20210423185408.6d5d14f0@redhat.com> <YIa4iGzTl+ecfbzH@redhat.com>
 <20210427235229.5cf8711c@elisabeth>
MIME-Version: 1.0
In-Reply-To: <20210427235229.5cf8711c@elisabeth>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 11:52:29PM +0200, Stefano Brivio wrote:
> On Mon, 26 Apr 2021 13:56:40 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > The pain we're feeling is largely because the design of the net
> > option syntax is one of the oldest parts of QEMU and has only
> > been very partially improved upon. It is certainly not using
> > QAPI best practice, if we look at this:
> > 
> >   { 'struct': 'NetdevSocketOptions',
> >     'data': {
> >       '*fd':        'str',
> >       '*listen':    'str',
> >       '*connect':   'str',
> >       '*mcast':     'str',
> >       '*localaddr': 'str',
> >       '*udp':       'str' } }
> > 
> > Then some things come to mind
> > 
> >  - We're not provinding a way to say what kind of "fd" is
> >    passed in - is it a UDP/TCP FD, is it a listener or
> >    client FD, is it unicast or multicast FD. Though QEMU
> >    can interogate the socket to discover this I guess.
> 
> Some form of probing was already added in commit 894022e61601 ("net:
> check if the file descriptor is valid before using it"). Does qemu need
> to care, though, once the socket is connected? That is, what would it
> do with that information?

The only thing it really has to care about is the distinction between
a listener socket and a data socket.

> >  - All of the properties there except "fd" are encoding two values
> >    in a single property - address + port. This is an anti-pattern
> > 
> >  - No support for ipv4=on|off and ipv6=on|off flags to control
> >    dual-stack usage.
> 
> I wonder if this needs to be explicit -- it might simply derive from
> addressing.

This is explicitly everywhere we use sockets in QEMU - it is part
of the SocketAddress QAPI schema.

Consider an address "::", this is an IPv6 address, but depending on
how you configure the socket it can accept either IPv6-only or both
IPv6 and IPv4 incoming connections.

If passing a hostname instead of a raw address, then  the ipv4/ipv6
flags control whether we use all the returned DNS entries.

> > The "right" way to fix most of this long term is a radical change
> > to introduce use of the SocketAddress struct.
> > 
> > I could envisage something like this
> > 
> >   { 'enum': 'NetdevSocketMode',
> >     'data':  ['dgram', 'client', 'server'] }
> > 
> >   { 'struct': 'NetdevSocketOptions',
> >     'data': {
> >       'addr':      'SocketAddress',
> >       '*localaddr': 'SocketAddress',
> >       '*mode':      'NetdevSocketMode' } }
> > 
> > 
> >  - A TCP client
> > 
> >       addr.type = inet
> >       addr.host = 192.168.1.1
> >       mode = client
> >
> >  - A TCP server on all interfaces
> > 
> >       addr.type = inet
> >       addr.host = 
> >       mode = server
> > 
> >  - A TCP server on a specific interface
> > 
> >       addr.type = inet
> >       addr.host = 192.168.1.1
> >       mode = server
> > 
> >  - A TCP server on all interfaces, without IPv4
> > 
> >       addr.type = inet
> >       addr.host = 
> >       addr.has_ipv4 = true
> >       addr.ipv4 = false
> >       mode = server
> 
> ...perhaps it would be more consistent with other consolidated
> practices to have addr.type = inet | inet6... and perhaps call it
> addr.family.
>
> Also, for "mode" (that could be called "type" to reflect
> parameters for socket(2)), we should probably support SOCK_SEQPACKET as
> well ("seq"?).

The naming I use here is determined by the QAPI 'SocketAddress'
struct which has a 'type' field, and separate 'ipv4' and 'ipv6'
flags.

> 
> >  - A UDP unicast transport
> > 
> >       addr.type = inet
> >       addr.host = 192.168.1.1
> >       mode = dgram
> > 
> >  - A UDP unicast transport with local addr
> > 
> >       addr.type = inet
> >       addr.host = 192.168.1.1
> >       localaddr.type = inet
> >       localaddr.host = 192.168.1.2
> >       mode = dgram
> > 
> >  - A UDP multicast transport
> > 
> >      addr.type = inet
> >      addr.host = 224.0.23.166
> >      mode = dgram
> > 
> >  - A UNIX stream client
> > 
> >       addr.type = unix
> >       addr.path = /some/socket
> >       mode = client
> > 
> >  - A UNIX stream server
> > 
> >       addr.type = unix
> >       addr.path = /some/socket
> >       mode = server
> > 
> >  - A UNIX dgram transport
> > 
> >       addr.type = unix
> >       addr.path = /some/socket
> >       mode = dgram
> > 
> > 
> > Now, of course you're just interested in adding UNIX socket support.
> > 
> > This design I've outlined above is very much "boiling the ocean".
> > Thus I'm not requesting you implement this, unless you have a strong
> > desire to get heavily involved in some QEMU refactoring work.
> 
> I don't really have a strong desire to do that, but to my naive eyes it
> doesn't look that complicated, I'll give it a try.

The hard bit is always the backwards compatibility for existing usage....


> > The key question is whether we try to graft UNIX socket support onto
> > the existing args ("connect"/"listen") or try to do something more
> > explicit.
> > 
> > Given the desire to have both dgram + stream support, I'd be inclined
> > to do something more explicit, that's slightly more aligned with a
> > possible future best praactice QAPI design
> > 
> > 
> > IOW, we could take a simplified variant of the above as follows:
> > 
> > 
> >   { 'enum': 'NetdevSocketMode',
> >     'data':  ['dgram', 'client', 'server'] }
> > 
> >   { 'struct': 'NetdevSocketOptions',
> >     'data': {
> >       '*fd':        'str',
> >       '*listen':    'str',
> >       '*connect':   'str',
> >       '*mcast':     'str',
> >       '*localaddr': 'str',
> >       '*udp':       'str',
> >       '*path':      'str' } }
> >       '*localpath': 'str' } }
> > 
> > 
> > Cli examples:
> > 
> >  * Unix stream client
> > 
> >   -netdev socket,path=/wibble,mode=client
> > 
> >  * Unix stream server
> >  
> >   -netdev socket,path=/wibble,mode=server
> > 
> >  * Unix datagram 
> > 
> >   -netdev socket,path=/wibble,mode=dgram
> >   -netdev socket,path=/wibble,localpath=/fish,mode=dgram
> 
> I think this looks reasonable, I'm not sure about "localpath",
> because also /wibble is local in some sense.

"local" as in local to the process, rather than "local" as in
local to the host.

> I don't know what would be a good implementation practice to keep the
> current options available -- should this be done with some new code
> that applies a translation to the new parameters?

At the CLI parser side we'd just do translation to the new QAPI style
usually, but I'm not sure how to handle the existing QAPI stuff though.

Perhaps just add new fields to "NetdevSocketOptions" and deprecate
existing ones that become obsolete.

The only other alternative is a parallel type to completely obsolete
NetdevSocketOptions, but I'm not sure what we'd call that.

I had added Markus / Eric to CC to get advice on QAPI side here..

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


