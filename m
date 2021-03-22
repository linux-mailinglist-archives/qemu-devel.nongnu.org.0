Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883763440CD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:22:44 +0100 (CET)
Received: from localhost ([::1]:56582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJZz-00050L-Hk
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOJQ4-0000NP-CC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOJQ0-0007VI-Sd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616415141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ixSeezVGfygokPfWhHchbWLpJKS7oQkAAvb6hou/2/s=;
 b=ag4EdYsuwchyCNYiOKOsXrR48K0OvVXwwJ3MbdZXz3EYWAeOB86fNDPr40SCsAgMAcRg9q
 zgh2XsNW78acPcu6Rc6OglKYKFzvEqE905TfWksGicnw8s6hfSpDT5O8wYc1fEOuMFyPvK
 lKJnLhxtKbHECkaaN7ZYCCOB9E2r3/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-6U4WYZp8NHmgTknejxCtuA-1; Mon, 22 Mar 2021 08:12:18 -0400
X-MC-Unique: 6U4WYZp8NHmgTknejxCtuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC7A1084D68;
 Mon, 22 Mar 2021 12:12:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAC89614FA;
 Mon, 22 Mar 2021 12:12:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FA7811327E1; Mon, 22 Mar 2021 13:12:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com>
 <87blbfi1t4.fsf@dusky.pond.sub.org>
 <12145159a33b4fbc85db2ce6534e62d8@intel.com>
Date: Mon, 22 Mar 2021 13:12:15 +0100
In-Reply-To: <12145159a33b4fbc85db2ce6534e62d8@intel.com> (Chen Zhang's
 message of "Mon, 22 Mar 2021 09:59:54 +0000")
Message-ID: <87zgyv4cbk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Friday, March 19, 2021 11:47 PM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
>> Gilbert <dgilbert@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Lukas
>> Straub <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
>> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
>> 
>> Zhang Chen <chen.zhang@intel.com> writes:
>> 
>> > Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP
>> commands.
>> >
>> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> > ---
>> >  qapi/net.json | 31 +++++++++++++++++++++++++++++++
>> >  1 file changed, 31 insertions(+)
>> >
>> > diff --git a/qapi/net.json b/qapi/net.json index
>> > 87361ebd9a..498ea7aa72 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -794,3 +794,34 @@
>> >  #
>> >  ##
>> >  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
>> > +
>> > +##
>> > +# @IP_PROTOCOL:
>> > +#
>> > +# Transport layer protocol.
>> > +#
>> > +# Just for IPv4.
>> 
>> Really?
>
> Current tcp/udp/icmp field from IPv4 header definition,
> I think maybe we need add more to support IPv6.
> So, looks change to #TODO support IPv6 part is better?

IPv4 and IPv6 share internet protocol numbers.  IPv4 has it in header
field "protocol", IPv6 in "next header".

Canonical registry:
https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml

>> > +#
>> > +# @tcp: Transmission Control Protocol.
>> > +#
>> > +# @udp: User Datagram Protocol.
>> > +#
>> > +# @dccp: Datagram Congestion Control Protocol.
>> > +#
>> > +# @sctp: Stream Control Transmission Protocol.
>> > +#
>> > +# @udplite: Lightweight User Datagram Protocol.
>> > +#
>> > +# @icmp: Internet Control Message Protocol.
>> > +#
>> > +# @igmp: Internet Group Management Protocol.
>> > +#
>> > +# @ipv6: IPv6 Encapsulation.
>> > +#
>> > +# TODO: Need to add more transport layer protocol.

If there's a need *now*, we should add them now.  If the may be a need
in the future, then this isn't a TODO.  Perhaps

      # Additional protocols may be added as needed.

How did you pick the ones to add now?

What if a user wants to use a protocol number not in this enum?  If that
makes no sense (say because use requires code in QEMU), fine.  If it
does make sense, we need to talk.  You tell me :)

>> > +#
>> > +# Since: 6.1
>> > +##
>> > +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
>> > +    'icmp', 'igmp', 'ipv6' ] }
>> > +
>> 
>> docs/devel/qapi-code-gen.txt: "type definitions should always use
>> CamelCase".
>> 
>> Make this something like 'enum': 'IpProtocol', please.
>
> OK, I will fix it in next version.
>
> Thanks
> Chen


