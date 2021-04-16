Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952DA361CCC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 11:24:52 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXKiZ-0007Gc-1W
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 05:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXKge-0006W7-Oi
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXKgZ-0000I9-7e
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618564962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZvdJe7K53NlMMmjpD1JevkiqbYhKXqcZzPT6c/5zGD8=;
 b=bmbMpMlPBU/QUKrC0+AJ+bmOD13LJbhHRKbETKePapszvKVUEtcZWrD1/S2Ra0JuhBvLdn
 8DfnxncuJQiiyvddOcMHuf3HiF/hD2jxHRThq5JyP8ND2LGSmib6WiiVn9tGuV3KYqxO8i
 26y6bZcE6lBMQQAF2AbEx9tHkCBT2ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-vKcDUd7ZP4-k0WmE4jTi_Q-1; Fri, 16 Apr 2021 05:22:40 -0400
X-MC-Unique: vKcDUd7ZP4-k0WmE4jTi_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 732996D249;
 Fri, 16 Apr 2021 09:22:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4835C626;
 Fri, 16 Apr 2021 09:22:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84557113525D; Fri, 16 Apr 2021 11:22:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com>
 <YFpJFahbhS+cVZvT@work-vm>
 <5a9d9778f4784b4b96fa9e0831635c8d@intel.com>
 <87czuvbmvi.fsf@dusky.pond.sub.org>
 <e3d3a24a770f4dada58159ece42da330@intel.com>
Date: Fri, 16 Apr 2021 11:22:36 +0200
In-Reply-To: <e3d3a24a770f4dada58159ece42da330@intel.com> (Chen Zhang's
 message of "Fri, 16 Apr 2021 06:03:53 +0000")
Message-ID: <87k0p2porn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Thursday, April 15, 2021 11:15 PM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>; Lukas Straub
>> <lukasstraub2@web.de>; Li Zhijian <lizhijian@cn.fujitsu.com>; Jason Wang
>> <jasowang@redhat.com>; qemu-dev <qemu-devel@nongnu.org>; Zhang
>> Chen <zhangckid@gmail.com>
>> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
>> 
>> "Zhang, Chen" <chen.zhang@intel.com> writes:
>> 
>> >> -----Original Message-----
>> >> From: Qemu-devel <qemu-devel-
>> >> bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Dr. David
>> Alan
>> >> Gilbert
>> >> Sent: Wednesday, March 24, 2021 4:01 AM
>> >> To: Zhang, Chen <chen.zhang@intel.com>
>> >> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
>> >> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>; qemu-
>> >> dev <qemu-devel@nongnu.org>; Markus Armbruster
>> <armbru@redhat.com>;
>> >> Zhang Chen <zhangckid@gmail.com>
>> >> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
>> >>
>> >> * Zhang Chen (chen.zhang@intel.com) wrote:
>> >> > Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP
>> >> commands.
>> >> >
>> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> >> > ---
>> >> >  qapi/net.json | 31 +++++++++++++++++++++++++++++++
>> >> >  1 file changed, 31 insertions(+)
>> >> >
>> >> > diff --git a/qapi/net.json b/qapi/net.json index
>> >> > 87361ebd9a..498ea7aa72 100644
>> >> > --- a/qapi/net.json
>> >> > +++ b/qapi/net.json
>> >> > @@ -794,3 +794,34 @@
>> >> >  #
>> >> >  ##
>> >> >  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
>> >> > +
>> >> > +##
>> >> > +# @IP_PROTOCOL:
>> >> > +#
>> >> > +# Transport layer protocol.
>> >> > +#
>> >> > +# Just for IPv4.
>> >> > +#
>> >> > +# @tcp: Transmission Control Protocol.
>> >> > +#
>> >> > +# @udp: User Datagram Protocol.
>> >> > +#
>> >> > +# @dccp: Datagram Congestion Control Protocol.
>> >> > +#
>> >> > +# @sctp: Stream Control Transmission Protocol.
>> >> > +#
>> >> > +# @udplite: Lightweight User Datagram Protocol.
>> >> > +#
>> >> > +# @icmp: Internet Control Message Protocol.
>> >> > +#
>> >> > +# @igmp: Internet Group Management Protocol.
>> >> > +#
>> >> > +# @ipv6: IPv6 Encapsulation.
>> >> > +#
>> >> > +# TODO: Need to add more transport layer protocol.
>> >> > +#
>> >> > +# Since: 6.1
>> >> > +##
>> >> > +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
>> >> > +    'icmp', 'igmp', 'ipv6' ] }
>> >>
>> >> Isn't the right thing to do here to use a string for protocol and
>> >> then pass it to getprotobyname;  that way your list is never out of
>> >> date, and you never have to translate between the order of this enum
>> >> and the integer assignment set in stone.
>> >>
>> >
>> > Hi Dave,
>> >
>> > Considering that most of the scenes in Qemu don't call the
>> getprotobyname, looks keep the string are more readable.
>> 
>> Unless I'm missing something,
>> 
>> (1) this enum is only used for matching packets by source IP, source port,
>> destination IP, destination port, and protocol, and
>> 
>> (2) the packet matching works just fine for *any* protocol.
>> 
>> By using an enum for the protocol, you're limiting the matcher to whatever
>> protocols we bother to include in the enum for no particular reason.  Feels
>> wrong to me.
>
> Should we remove the IP_PROTOCOL enum here? Make user input string protocol name for this field?
> Or any other detailed comments here?

I believe that's Dave's point.  I.e.:

    { 'struct': 'L4_Connection',
      'data': { 'protocol': 'str', ... }

If we ever need to specify protocols by number in addition to name, we
can compatibly evolve the 'str' into an alternation of 'str' and
'uint8'.  Unlikely.


