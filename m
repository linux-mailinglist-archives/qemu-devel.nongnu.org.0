Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B842A6C6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:07:52 +0200 (CEST)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIRa-0001HQ-9u
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maIL4-00075o-ML
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maIKs-0007CK-Iq
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634047251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D7wC6TU87sFFjLOuC/zZkTRZ/bNQ7vWz1pfl7QSKYVs=;
 b=Dk9StbacHbSKo3fqRqEILmkgv9qw01ViW2WzlZOZm4hTKcPpMSJvIlOi0cYyG9GTxjtjDl
 LMoAM72UAbPnIJsomcriY2y0DLSq9vDP8S+AQTuQyZiZuc2PhUUxq83Vc3MoPhO6C1AVSQ
 Tq3MnX6fPSEFAWwN9IhRVLilzBJc5mo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-dksVnEWbPC2thj0FzH_3ag-1; Tue, 12 Oct 2021 10:00:43 -0400
X-MC-Unique: dksVnEWbPC2thj0FzH_3ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AFCB19057A2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 14:00:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B681970E;
 Tue, 12 Oct 2021 14:00:11 +0000 (UTC)
Date: Tue, 12 Oct 2021 16:00:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YWWU6sUMfhk4UYJV@redhat.com>
References: <YUSuThJtW9ar2wCY@redhat.com> <87a6jrimaf.fsf@dusky.pond.sub.org>
 <YVsKpClmGgq5ki7r@redhat.com> <87mtnnvay7.fsf@dusky.pond.sub.org>
 <YVyFwWHY7a7CKMxN@redhat.com> <874k9uqov5.fsf@dusky.pond.sub.org>
 <YV3QlKi4jeW+54Yb@redhat.com> <87ee8xhz6u.fsf@dusky.pond.sub.org>
 <YV8ccu9MpKjyXT/G@redhat.com> <87wnmn7rc9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wnmn7rc9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.10.2021 um 12:17 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> > Am 07.10.2021 um 13:06 hat Markus Armbruster geschrieben:
> >> What's the smallest set of aliases sufficient to make your -chardev
> >> QAPIfication work?
> >
> > How do you define "make the QAPIfication work"?
> >
> > The -chardev conversion adds the following aliases to the schema:
> >
> > * SocketAddressLegacy: Flatten a simple union (wildcard alias +
> >   non-local alias)
> >
> >     { 'source': ['data'] },
> >     { 'name': 'fd', 'source': ['data', 'str'] }
> >
> > * ChardevFile: Rename local member
> >
> >     { 'name': 'path', 'source': ['out'] }
> >
> > * ChardevHostdev: Rename local member
> >
> >     { 'name': 'path', 'source': ['device'] }
> >
> > * ChardevSocket: Flatten embedded struct (wildcard alias)
> >
> >     { 'source': ['addr'] }
> >
> > * ChardevUdp: Flatten two embedded structs with renaming (wildcard
> >   alias + non-local alias)
> >
> >     { 'source': ['remote'] },
> >     { 'name': 'localaddr', 'source': ['local', 'data', 'host'] },
> >     { 'name': 'localport', 'source': ['local', 'data', 'port'] }
> >
> > * ChardevSpiceChannel: Rename local member
> >
> >     { 'name': 'name', 'source': ['type'] }
> >
> > * ChardevSpicePort: Rename local member
> >
> >     { 'name': 'name', 'source': ['fqdn'] }
> >
> > * ChardevBackend: Flatten a simple union (wildcard alias)
> >
> >     { 'source': ['data'] }
> >
> > * ChardevOptions: Flatten embedded struct (wildcard alias)
> >
> >     { 'source': ['backend'] }
> 
> Aside: most of the renames are due to "reuse" of existing QemuOpts
> parameters.  I'm sure it has saved "lots" of typing.
> 
> > The deeper they are nested in the type hierarchy, especially when unions
> > with different variants come into play, the nastier they are to replace
> > with C code. The C code stays the simplest if all of the aliases are
> > there, and it gets uglier the more of them you leave out.
> >
> > I don't know your idea of "sufficient", so I'll leave mapping that to a
> > scale of sufficiency to you.
> 
> Alright let me see what we got.
> 
> This is the tree structure with branches not mentioned in aliases
> omitted:
> 
>     ChardevOptions
>         backend: ChardevBackend
>             data: ChardevFile
>             data: ChardevHostdev
>             data: ChardevSocket
>                 addr: SocketAddressLegacy
>                     data: String
>                         str: str
>                     data: ...
>             data: ChardevUdp
>                 remote: SocketAddressLegacy
>                     data: String
>                         str: str
>                     data: ...
>                 local: SocketAddressLegacy
>                     data: String
>                         str: str
>                     data: ...
>             data: ChardevSpiceChannel
>             data: ChardevSpicePort
>             data: ...
> 
> This is how we map -chardev's argument to the tree structure:
> 
> * Always, in qemu_chr_new_from_opts(), qemu_chr_parse_opts(),
>   qemu_chr_parse_common():
> log
>   - id=id                       id
>   - [backend=]T                 backend.type
>   - logfile                     backend.data.logfile
>   - logappend                   backend.data.logappend
> 
> * When T is file, in qemu_chr_parse_file_out():
> 
>   - path                        backend.data.out
>   - append                      backend.data.append
> 
>   Note: there is no way to set backend.data.in.
> 
> * When T is serial, parallel, or pipe, in qemu_chr_parse_serial(),
>   qemu_chr_parse_parallel(), qemu_chr_parse_pipe():
> 
>   - path                        backend.data.device
> 
> * When T is socket, in qemu_chr_parse_socket()
> 
>   - delay and nodelay           backend.data.nodelay
>   - server                      backend.data.server
>   - telnet                      backend.data.telnet
>   - tn3270                      backend.data.tn3270
>   - websocket                   backend.data.websocket
>   - wait                        backend.data.wait
>   - reconnect                   backend.data.reconnect
>   - tls-creds                   backend.data.tls-creds
>   - tls-authz                   backend.data.tls-authz
>   - host, path, fd              backend.data.addr.type
> 
>   Note: there is no way to set backend.data.addr.type to vsock.
> 
>   Additionally, when path is present:
> 
>   - path                        backend.data.addr.data.path
>   - abstract                    backend.data.addr.data.abstract
>   - tight                       backend.data.addr.data.tight
> 
>   Additionally, when host is present:
> 
>   - host                        backend.data.addr.data.host
>   - port                        backend.data.addr.data.port
>   - to                          backend.data.addr.data.to
>   - ipv4                        backend.data.addr.data.ipv4
>   - ipv6                        backend.data.addr.data.ipv6
> 
>   Note: there is no way to set backend.data.addr.data.numeric,
>   .keep-alive, .mptcp.
> 
>   Additionally, when fd is present:
> 
>   - fd                          backend.data.addr.data.str
> 
> * When T is udp, in qemu_chr_parse_udp():
> 
>   - host                        backend.data.remote.data.host
>   - port                        backend.data.remote.data.port
>   - ipv4                        backend.data.remote.data.ipv4
>   - ipv6                        backend.data.remote.data.ipv6
>   - localaddr                   backend.data.local.data.host
>   - localport                   backend.data.local.data.port
> 
>   Note: there is no way to set backend.data.remote.type and
>   backend.data.local.type; both can only be inet.  There is no way to
>   set backend.data.{remote,local}.data.to, .numeric, .keep-alive,
>   .mptcp.  There is no way to set backend.data.local.data.ipv4, .ipv6.
> 
> * I'm omitting the remaining values of T.
> 
> * Parameters that exist for any value of T other than the one given are
>   silently ignored.  Example: -chardev null,id=woot,ipv4=on.
> 
>   Do you preserve this wart for compatibility's sake?

No, unless someone can show me some important real life user that would
be affected by it, I think it should be considered a bug and just be
fixed.

If contrary to all expectations users do come and shout at us, we can
consider adding back those silently ignored options that are actually
in use.

> Observations:
> 
> * Your replacement of this mapping code makes the dotted keys
>   corresponding to the schema available in addition to the traditional
>   key.  Example: backend.data.addr.data.host in addition to host.
> 
> * This makes some parameters available that weren't before.  Example:
>   backend.data.addr.data.numeric and numeric.  Also
>   backend.data.local.data.host but not host, because that's already
>   backend.data.remote.data.host.
> 
> * It also creates "ghost" aliases, i.e. keys that don't exist in either
>   of the two interfaces before.  These are artifacts of the alias chain
>   from traditional key to schema member.  Example:
>   backend.data.addr.host, backend.addr.data.host, backend.addr.host,
>   data.addr.host, addr.data.host, and addr.host.  I think.  No, I missed
>   backend.host.  Did I get them all?  No idea :)

At least it feels like a quite consistent way of having "ghost"
aliases...

> All this should be spelled out in commit message(s).  I didn't peek
> ahead to check them.
> 
> A different way to skin this cat would be putting the aliases at the
> top, i.e. ChardevOptions.  I'm aware of your arguments against this.
> Let's explore it anyway.
> 
>     backend                     backend.type
>     path                        backend.data.out
>     path                        backend.data.device
>     *                           backend.data.*
>     fd                          backend.data.addr.data.str
>     *                           backend.data.addr.data.*
>     *                           backend.data.remote.data.*
>     localaddr                   backend.data.local.data.host
>     localport                   backend.data.local.data.port
> 
> Observations / questions:
> 
> * Look ma, no "ghosts"!

I assume '*' doesn't mean wildcard aliases like in the current series
(because this would add back some ghosts for nested objects), but an
individual listing of all aliased scalar members?

> * We need "path" twice.  They resolve to different branches of the
>   union.  Hmm.
> 
>   Aliases pointing into union branches give me a queasy feeling.  What
>   if we define an alias just for one branch, but then have it resolve in
>   an unwanted way in another branch?  "Ghost" aliases, I guess.

...compared to this one where they appear only sporadically on name
collisions.

>   Perhaps we should attach the aliases to the union branch instead.  The
>   "put them at the top" idea falls apart then.
> 
>   The issue exists just as much with "chained" use of aliases.  But
>   there, it's just a few more ghosts joining ghost congress.
> 
> * How to provide full access to backend.data.local.data.*?  Assuming
>   that's desired.

I think having access to all options is desirable.

My simple approach gives you "local.*". It's considered a ghost by your
listing, but it's actually not because the individual fields are
inaccessible on the top level (they are shadowed by "remote.*").

All of this goes on top of the problems we already knew, like that this
list of aliases is hard to maintain because you don't necessarily think
of updating ChardevOptions when you add something to SocketAddress.

So I still feel like having aliases only on the top level is a dead end.

Kevin


