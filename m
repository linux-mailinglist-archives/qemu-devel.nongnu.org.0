Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7FC68F8B8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:18:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqsf-0000Pi-NE; Wed, 08 Feb 2023 15:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPqsa-0000Mh-Ma
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:17:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPqsY-0001OF-Hz
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675887437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SzJ2jg7gOAPuK7eojaO3K+xFnEbZfpLaBArnmcXk2y8=;
 b=AZPf8XFelCijwZHpUStiCRUtVBhwVTndud/cHUO0Xi67/ylftll0Q7VpVQZQUazBJmM8er
 uGjF4D4jM0/5d/3wPynyG00u6Z9pyS8d98bPXaRbqwwFwa3rJat6iZrbYaMPtkeNrAKh8I
 /HOevM5Ffbf2LntnI50C6zvB5TAvWWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-qIy3piJTPmGhLl6IsSS1UA-1; Wed, 08 Feb 2023 15:17:15 -0500
X-MC-Unique: qIy3piJTPmGhLl6IsSS1UA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 455F8811E6E;
 Wed,  8 Feb 2023 20:17:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC3140B3FE1;
 Wed,  8 Feb 2023 20:17:14 +0000 (UTC)
Date: Wed, 8 Feb 2023 14:17:12 -0600
From: Eric Blake <eblake@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 armbru@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <20230208201712.b3a5xtufscrvncqt@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208093600.242665-3-het.gala@nutanix.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
> Existing 'migrate' QAPI design enforces transport mechanism, ip address
> of destination interface and corresponding port number in the form
> of a unified string 'uri' parameter for initiating a migration stream.
> This scheme has a significant flaw in it - double encoding of existing
> URIs to extract migration info.
> 
> The current patch maps QAPI uri design onto well defined MigrateChannel
> struct. This modified QAPI helps in preventing multi-level uri
> encodings ('uri' parameter is kept for backward compatibility).
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 129 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..79acfcfe4e 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1449,12 +1449,108 @@
>  ##
>  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>  
> +##
> +# @MigrateTransport:
> +#
> +# The supported communication transport mechanisms for migration
> +#
> +# @socket: Supported communication type between two devices for migration.
> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
> +#          'fd' already
> +#
> +# @exec: Supported communication type to redirect migration stream into file.
> +#
> +# @rdma: Supported communication type to redirect rdma type migration stream.
> +#
> +# Since 8.0
> +##
> +{ 'enum': 'MigrateTransport',
> +  'data': ['socket', 'exec', 'rdma'] }
> +
> +##
> +# @MigrateSocketAddr:
> +#
> +# To support different type of socket.
> +#
> +# @socket-type: Different type of socket connections.
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateSocketAddr',
> +  'data': {'socket-type': 'SocketAddress' } }

Here, you use 'socket-type',...

> +
> +##
> +# @MigrateExecAddr:
> + #
> + # Since 8.0
> + ##
> +{ 'struct': 'MigrateExecAddr',
> +   'data' : {'data': ['str'] } }

Inconsistent on whether you have a space before :.  Most of our qapi
files prefer the layout:

'key': 'value'

that is, no space before, one space after.  It doesn't affect
correctness, but a consistent visual style is worth striving for.

> +
> +##
> +# @MigrateRdmaAddr:
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateRdmaAddr',
> +   'data' : {'data': 'InetSocketAddress' } }

...while these branches supply everything else under 'data'. Also,
while you documented @socket-type above, you did not document @data in
either of these two types.  [1]

> +
> +##
> +# @MigrateAddress:
> +#
> +# The options available for communication transport mechanisms for migration
> +#
> +# Since 8.0
> +##
> +{ 'union' : 'MigrateAddress',
> +  'base' : { 'transport' : 'MigrateTransport'},
> +  'discriminator' : 'transport',
> +  'data' : {
> +    'socket' : 'MigrateSocketAddr',
> +    'exec' : 'MigrateExecAddr',
> +    'rdma': 'MigrateRdmaAddr' } }

Another example of inconsistent spacing around :.

I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
is that SocketAddress is itself a discriminated union, and Markus does
not yet have the QAPI generator wired up to support one union as a
branch of another larger union?  It leads to extra nesting on the wire
[2]

> +
> +##
> +# @MigrateChannelType:
> +#
> +# The supported options for migration channel type requests
> +#
> +# @main: Support request for main outbound migration control channel
> +#
> +# Since 8.0
> +##
> +{ 'enum': 'MigrateChannelType',
> +  'data': [ 'main'] }

A different spacing issue: most arrays in QAPI either have spaces at
both ends (as in [ 'string' ]) or neither (as in ['string']).  Here,
it looks lopsided with space at the front but not the back.

> +
> +##
> +# @MigrateChannel:
> +#
> +# Information regarding migration Channel-type for transferring packets,
> +# source and corresponding destination interface for socket connection
> +# and number of multifd channels over the interface.
> +#
> +# @channeltype: Name of Channel type for transfering packet information
> +#
> +# @addr: SocketAddress of destination interface

More than just a SocketAddress, per the discriminated union type defined above.

> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateChannel',
> +  'data' : {
> +	'channeltype' : 'MigrateChannelType',
> +	'addr' : 'MigrateAddress' } }
> +
>  ##
>  # @migrate:
>  #
>  # Migrates the current running guest to another Virtual Machine.
>  #
>  # @uri: the Uniform Resource Identifier of the destination VM
> +#       for migration thread
> +#
> +# @channel: Struct containing migration channel type, along with all
> +#           the details of destination interface required for initiating
> +#           a migration stream.
>  #
>  # @blk: do block migration (full disk copy)
>  #
> @@ -1479,15 +1575,46 @@
>  # 3. The user Monitor's "detach" argument is invalid in QMP and should not
>  #    be used
>  #
> +# 4. The uri argument should have the Uniform Resource Identifier of default
> +#    destination VM. This connection will be bound to default network
> +#
> +# 5. Both 'uri' and 'channel' arguments, are mutually exclusive but, at least
> +#    one of the two arguments should be present.

Grammar suggestion:

'uri' and 'channel' are mutually exclusive; exactly one of the two
should be present.

> +#
>  # Example:
>  #
>  # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>  # <- { "return": {} }
>  #
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channel": { "channeltype": "main",
> +#                        "addr": { "transport": "socket",
> +#                                  "socket-type": { "type': "inet',
> +#                                                   "host": "10.12.34.9",
> +#                                                   "port": "1050" } } } } }

[2] This is the extra nesting that occurs because of the
'socket-type':'MigrateSocketAddr' above; getting rid of the nesting
would require 'socket-type':'SocketAddress', but QAPI would need to
support that first.

> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channel": { "channeltype": "main",
> +#                       "addr": { "transport": "exec",
> +#                                 "exec": ["/bin/nc", "-U",
> +#                                          "/some/sock" ] } } } }

Another lopsided spacing in [].

> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channel": { "channeltype": "main",
> +#                       "addr": { "transport": "rdma",
> +#                                 "rdma": { "host": "10.12.34.9",
> +#                                           "port": "1050" } } } } }

[1] These examples look wrong; above, the schema named the nesting as 'data', rather than 'exec' or 'rdma'.

> +# <- { "return": {} }
> +#
>  ##
>  { 'command': 'migrate',
> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> -           '*detach': 'bool', '*resume': 'bool' } }
> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>

But overall, I'm a fan of using a more type-accurate description of
the channel than the open-coded 'uri':'str'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


