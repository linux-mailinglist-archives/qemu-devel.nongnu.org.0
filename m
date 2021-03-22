Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6983442B1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:44:56 +0100 (CET)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJvT-0003nY-Va
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOJu7-0003KE-Ei
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOJu5-0007dn-Ei
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616417007;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MidbfzWzinA5LnIPEjrFaI1NNP0flnUCvOOCrsKV4To=;
 b=QKhJUTLKujXIXRPdXUxKipK3OdNkJJyOMkPo8LjEBKByFQrBRVOSFfCZiiSp8T5xvR0EG9
 DwufimIemEoRf1eJFQGzGVKWI+pRF6W2kdpvJ4XOLrB78y+Vre9WsOZODOj6AB5Ova1NLw
 1BZYFjElv39ZX9AyXHncvZnTTIPU63w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-MrsHXz2dMkyZSrWOJYcmeQ-1; Mon, 22 Mar 2021 08:43:19 -0400
X-MC-Unique: MrsHXz2dMkyZSrWOJYcmeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C050A881282;
 Mon, 22 Mar 2021 12:43:17 +0000 (UTC)
Received: from redhat.com (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7541C4;
 Mon, 22 Mar 2021 12:43:15 +0000 (UTC)
Date: Mon, 22 Mar 2021 12:43:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Message-ID: <YFiQ4F1gMHS0K9mF@redhat.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com>
 <87blbfi1t4.fsf@dusky.pond.sub.org>
 <12145159a33b4fbc85db2ce6534e62d8@intel.com>
MIME-Version: 1.0
In-Reply-To: <12145159a33b4fbc85db2ce6534e62d8@intel.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 qemu-dev <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 09:59:54AM +0000, Zhang, Chen wrote:
> 
> 
> > -----Original Message-----
> > From: Markus Armbruster <armbru@redhat.com>
> > Sent: Friday, March 19, 2021 11:47 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> > Gilbert <dgilbert@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Lukas
> > Straub <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
> > Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
> > 
> > Zhang Chen <chen.zhang@intel.com> writes:
> > 
> > > Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP
> > commands.
> > >
> > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > ---
> > >  qapi/net.json | 31 +++++++++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > >
> > > diff --git a/qapi/net.json b/qapi/net.json index
> > > 87361ebd9a..498ea7aa72 100644
> > > --- a/qapi/net.json
> > > +++ b/qapi/net.json
> > > @@ -794,3 +794,34 @@
> > >  #
> > >  ##
> > >  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
> > > +
> > > +##
> > > +# @IP_PROTOCOL:
> > > +#
> > > +# Transport layer protocol.
> > > +#
> > > +# Just for IPv4.
> > 
> > Really?
> 
> Current tcp/udp/icmp field from IPv4 header definition,
> I think maybe we need add more to support IPv6.
> So, looks change to #TODO support IPv6 part is better?

I'm inclined to say that this should implement IPv6 from the start.

No modern software should be implementing network functionality
for IPv4 only anymore IMHO.   Especially when there are potential
implications for the design of public APIs like QMP, we should
expect dual-stack support from the start.

> 
> > 
> > > +#
> > > +# @tcp: Transmission Control Protocol.
> > > +#
> > > +# @udp: User Datagram Protocol.
> > > +#
> > > +# @dccp: Datagram Congestion Control Protocol.
> > > +#
> > > +# @sctp: Stream Control Transmission Protocol.
> > > +#
> > > +# @udplite: Lightweight User Datagram Protocol.
> > > +#
> > > +# @icmp: Internet Control Message Protocol.
> > > +#
> > > +# @igmp: Internet Group Management Protocol.
> > > +#
> > > +# @ipv6: IPv6 Encapsulation.
> > > +#
> > > +# TODO: Need to add more transport layer protocol.
> > > +#
> > > +# Since: 6.1
> > > +##
> > > +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
> > > +    'icmp', 'igmp', 'ipv6' ] }
> > > +
> > 
> > docs/devel/qapi-code-gen.txt: "type definitions should always use
> > CamelCase".
> > 
> > Make this something like 'enum': 'IpProtocol', please.
> 
> OK, I will fix it in next version.
> 
> Thanks
> Chen
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


