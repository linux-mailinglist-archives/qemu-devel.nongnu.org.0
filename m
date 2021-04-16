Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2663619AC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:04:59 +0200 (CEST)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXHb8-0005t7-BY
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lXHaF-0005Sy-Hv
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:04:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:8385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lXHaC-0006OI-IP
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:04:03 -0400
IronPort-SDR: DV1Pem/Ilu0WM2xQIUmr7vxfZ23R9OYaPtbzBnHIuqgho/id89TbeAqf8XGdRHnoY+P1wg+cLO
 NVcwYeHzfGCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="175101517"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="175101517"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 23:03:56 -0700
IronPort-SDR: uDLT/5IORbc+xxjDsPk5bz105vUblpCPaeOe1FpOGhiep/Kb+Cg3SeYjcXzGI6sanGQop9DW43
 DgXvQBo2QV/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="382967225"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2021 23:03:56 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 23:03:55 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 16 Apr 2021 14:03:53 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Fri, 16 Apr 2021 14:03:53 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Thread-Topic: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Thread-Index: AQHXHHRwhE0xw39XiECnAJAI55tWJqqRf5aAgCDVHfCAA4akoYAA9uVw
Date: Fri, 16 Apr 2021 06:03:53 +0000
Message-ID: <e3d3a24a770f4dada58159ece42da330@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com>	<YFpJFahbhS+cVZvT@work-vm>
 <5a9d9778f4784b4b96fa9e0831635c8d@intel.com>
 <87czuvbmvi.fsf@dusky.pond.sub.org>
In-Reply-To: <87czuvbmvi.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Thursday, April 15, 2021 11:15 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>; Lukas Straub
> <lukasstraub2@web.de>; Li Zhijian <lizhijian@cn.fujitsu.com>; Jason Wang
> <jasowang@redhat.com>; qemu-dev <qemu-devel@nongnu.org>; Zhang
> Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
>=20
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>=20
> >> -----Original Message-----
> >> From: Qemu-devel <qemu-devel-
> >> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Dr. David
> Alan
> >> Gilbert
> >> Sent: Wednesday, March 24, 2021 4:01 AM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
> >> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>; qemu-
> >> dev <qemu-devel@nongnu.org>; Markus Armbruster
> <armbru@redhat.com>;
> >> Zhang Chen <zhangckid@gmail.com>
> >> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
> >>
> >> * Zhang Chen (chen.zhang@intel.com) wrote:
> >> > Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP
> >> commands.
> >> >
> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> >> > ---
> >> >  qapi/net.json | 31 +++++++++++++++++++++++++++++++
> >> >  1 file changed, 31 insertions(+)
> >> >
> >> > diff --git a/qapi/net.json b/qapi/net.json index
> >> > 87361ebd9a..498ea7aa72 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -794,3 +794,34 @@
> >> >  #
> >> >  ##
> >> >  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
> >> > +
> >> > +##
> >> > +# @IP_PROTOCOL:
> >> > +#
> >> > +# Transport layer protocol.
> >> > +#
> >> > +# Just for IPv4.
> >> > +#
> >> > +# @tcp: Transmission Control Protocol.
> >> > +#
> >> > +# @udp: User Datagram Protocol.
> >> > +#
> >> > +# @dccp: Datagram Congestion Control Protocol.
> >> > +#
> >> > +# @sctp: Stream Control Transmission Protocol.
> >> > +#
> >> > +# @udplite: Lightweight User Datagram Protocol.
> >> > +#
> >> > +# @icmp: Internet Control Message Protocol.
> >> > +#
> >> > +# @igmp: Internet Group Management Protocol.
> >> > +#
> >> > +# @ipv6: IPv6 Encapsulation.
> >> > +#
> >> > +# TODO: Need to add more transport layer protocol.
> >> > +#
> >> > +# Since: 6.1
> >> > +##
> >> > +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'u=
dplite',
> >> > +    'icmp', 'igmp', 'ipv6' ] }
> >>
> >> Isn't the right thing to do here to use a string for protocol and
> >> then pass it to getprotobyname;  that way your list is never out of
> >> date, and you never have to translate between the order of this enum
> >> and the integer assignment set in stone.
> >>
> >
> > Hi Dave,
> >
> > Considering that most of the scenes in Qemu don't call the
> getprotobyname, looks keep the string are more readable.
>=20
> Unless I'm missing something,
>=20
> (1) this enum is only used for matching packets by source IP, source port=
,
> destination IP, destination port, and protocol, and
>=20
> (2) the packet matching works just fine for *any* protocol.
>=20
> By using an enum for the protocol, you're limiting the matcher to whateve=
r
> protocols we bother to include in the enum for no particular reason.  Fee=
ls
> wrong to me.

Should we remove the IP_PROTOCOL enum here? Make user input string protocol=
 name for this field?
Or any other detailed comments here?

Thanks
Chen

>=20
> > Please review the V5 patches, Thanks.
> >
> > Thanks
> > Chen
> >
> >> Dave
> >>
> >> > +
> >> > --
> >> > 2.25.1
> >> >
> >> --
> >> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >>


