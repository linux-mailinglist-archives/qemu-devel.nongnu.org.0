Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950F662873
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsoV-0003L1-QK; Mon, 09 Jan 2023 09:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEsoS-0003KH-Pd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:07:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEsoQ-0008PQ-7S
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673273261;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X5OGMY8K9kalCkwlbAEZjPus8PAMndn12OaBZyOjSbY=;
 b=Uq5604x7CSQ0crgeHSGl82rgoVn7QdCbqIgkL7r6aGBA+bow7uubqzRjy2CoMC94t531Zr
 3sSY2PAtkWXhD4NmJuNuqE6BCFLvnsVSWNgO3YxzsnDaeCa0IGn6LNaqIr3j1xgLJmdhrq
 UtcoXOF0wjU+W+QV8e8aG0q4MdImLRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Isn806RKMAajy0Fs_GH6ew-1; Mon, 09 Jan 2023 09:07:38 -0500
X-MC-Unique: Isn806RKMAajy0Fs_GH6ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BAB9101A5BA;
 Mon,  9 Jan 2023 14:07:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B10840C2004;
 Mon,  9 Jan 2023 14:07:31 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:07:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <Y7wfoGpM6iwzy8L1@redhat.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221226053329.157905-2-het.gala@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Mon, Dec 26, 2022 at 05:33:25AM +0000, Het Gala wrote:
> From: Author Het Gala <het.gala@nutanix.com>
> 
> Existing 'migrate' QAPI design enforces transport mechanism, ip address
> of destination interface and corresponding port number in the form
> of a unified string 'uri' parameter. This scheme does seem to have an issue
> in it, i.e. double-level encoding of URIs.
> 
> The current patch maps existing QAPI design into a well-defined data
> structure - 'MigrateChannel' only from the design perspective. Please note that
> the existing 'uri' parameter is kept untouched for backward compatibility.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  qapi/migration.json | 121 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 2 deletions(-)
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..753e187ce2 100644
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
> +
> +##
> +# @MigrateExecAddr:
> + #
> + # Since 8.0
> + ##
> +{ 'struct': 'MigrateExecAddr',
> +   'data' : {'exec-str': 'str' } }

Currently for 'exec:cmdstr' the 'cmdstr' part is a shell command
that is passed

  const char *argv[] = { "/bin/sh", "-c", command, NULL };

I have a strong preference for making it possible to avoid use
of shell when spawning commands, since much of thue time it is
not required and has the potential to open up vulnerabilities.
It would be nice to be able to just take the full argv directly
IOW

 { 'struct': 'MigrateExecAddr',
    'data' : {'argv': ['str'] } }

If the caller wants to keep life safe and simple now they can
use
   ["/bin/nc", "-U", "/some/sock"]

but if they still want to send it via shell, they can also do
so

   ["/bin/sh", "-c", "...arbitrary shell script code...."]

> +
> +##
> +# @MigrateRdmaAddr:
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateRdmaAddr',
> +   'data' : {'rdma-str': 'str' } }

Loooking at the RDMA code it takes the str, and treats it
as an IPv4 address:


        addr = g_new(InetSocketAddress, 1);
        if (!inet_parse(addr, host_port, NULL)) {
            rdma->port = atoi(addr->port);
            rdma->host = g_strdup(addr->host);
            rdma->host_port = g_strdup(host_port);
        } 

so we really ought to accept an InetSocketAddress struct
directly 

 { 'struct': 'MigrateRdmaAddr',
    'data' : {'rdma-str': 'InetSocketAddress' } }



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
> @@ -1479,15 +1575,36 @@
>  # 3. The user Monitor's "detach" argument is invalid in QMP and should not
>  #    be used
>  #
> +# 4. The uri argument should have the Uniform Resource Identifier of default
> +#    destination VM. This connection will be bound to default network
> +#
> +# 5. Both 'uri' and 'channel' arguments, are mututally exclusive but, atleast


Minor typos                                   "mutually"                "at least"

> +#    one of the two arguments should be present.
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
> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": { "channel": { "channeltype": "main",
> +#                                  "addr": { "transport": "exec",
> +#                                            "exec-str": "/tmp/exec" } } } }

Will need updating given my feedback above

> +# <- { "return": {} }
> +#
>  ##
>  { 'command': 'migrate',
> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> -           '*detach': 'bool', '*resume': 'bool' } }
> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


