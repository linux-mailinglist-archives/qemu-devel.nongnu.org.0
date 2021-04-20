Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA53365C12
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:22:52 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsDD-0005Tu-9D
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsBb-0004Ug-Rw
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:21:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsBW-0003tX-3N
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:21:10 -0400
IronPort-SDR: CK8IeChbPt3SoUkX6rCuaOBW6AN+FioAmqqMDGgXvvMujkzdn0NPzjEFBIlaEYPHVknQ4oihHW
 E/h+06EJkgXw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="183017139"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="183017139"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:20:59 -0700
IronPort-SDR: VCjcgjF1pdzes4uLS/Fy5bwEVybZ4cf1BmTLNFxLLkuHZ7HPAchC5emkx9a/r+dVuxRoVD0NVJ
 FpfFESBodcJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="401043694"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2021 08:20:59 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 08:20:58 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 23:20:53 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Tue, 20 Apr 2021 23:20:53 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: RE: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Thread-Topic: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Thread-Index: AQHXHHRwhE0xw39XiECnAJAI55tWJqqRf5aAgCDVHfCAA4akoYAA9uVwgAA4+4+ABd/4AIAAlUDQ
Date: Tue, 20 Apr 2021 15:20:53 +0000
Message-ID: <549c2c7678ad48ffba1c2106acf1bb39@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com> <YFpJFahbhS+cVZvT@work-vm>
 <5a9d9778f4784b4b96fa9e0831635c8d@intel.com>
 <87czuvbmvi.fsf@dusky.pond.sub.org>
 <e3d3a24a770f4dada58159ece42da330@intel.com>
 <87k0p2porn.fsf@dusky.pond.sub.org> <YH61ho1ITCfv2LFT@work-vm>
In-Reply-To: <YH61ho1ITCfv2LFT@work-vm>
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
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Jason Wang <jasowang@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, Zhang
 Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Tuesday, April 20, 2021 7:06 PM
> To: Markus Armbruster <armbru@redhat.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; Lukas Straub
> <lukasstraub2@web.de>; Li Zhijian <lizhijian@cn.fujitsu.com>; Jason Wang
> <jasowang@redhat.com>; qemu-dev <qemu-devel@nongnu.org>; Zhang
> Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
>=20
> * Markus Armbruster (armbru@redhat.com) wrote:
> > "Zhang, Chen" <chen.zhang@intel.com> writes:
> >
> > >> -----Original Message-----
> > >> From: Markus Armbruster <armbru@redhat.com>
> > >> Sent: Thursday, April 15, 2021 11:15 PM
> > >> To: Zhang, Chen <chen.zhang@intel.com>
> > >> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>; Lukas Straub
> > >> <lukasstraub2@web.de>; Li Zhijian <lizhijian@cn.fujitsu.com>; Jason
> > >> Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Zhang
> > >> Chen <zhangckid@gmail.com>
> > >> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL
> > >> definition
> > >>
> > >> "Zhang, Chen" <chen.zhang@intel.com> writes:
> > >>
> > >> >> -----Original Message-----
> > >> >> From: Qemu-devel <qemu-devel-
> > >> >> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Dr.
> David
> > >> Alan
> > >> >> Gilbert
> > >> >> Sent: Wednesday, March 24, 2021 4:01 AM
> > >> >> To: Zhang, Chen <chen.zhang@intel.com>
> > >> >> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
> > >> >> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>;
> > >> >> qemu- dev <qemu-devel@nongnu.org>; Markus Armbruster
> > >> <armbru@redhat.com>;
> > >> >> Zhang Chen <zhangckid@gmail.com>
> > >> >> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL
> > >> >> definition
> > >> >>
> > >> >> * Zhang Chen (chen.zhang@intel.com) wrote:
> > >> >> > Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other
> QMP
> > >> >> commands.
> > >> >> >
> > >> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > >> >> > ---
> > >> >> >  qapi/net.json | 31 +++++++++++++++++++++++++++++++
> > >> >> >  1 file changed, 31 insertions(+)
> > >> >> >
> > >> >> > diff --git a/qapi/net.json b/qapi/net.json index
> > >> >> > 87361ebd9a..498ea7aa72 100644
> > >> >> > --- a/qapi/net.json
> > >> >> > +++ b/qapi/net.json
> > >> >> > @@ -794,3 +794,34 @@
> > >> >> >  #
> > >> >> >  ##
> > >> >> >  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
> > >> >> > +
> > >> >> > +##
> > >> >> > +# @IP_PROTOCOL:
> > >> >> > +#
> > >> >> > +# Transport layer protocol.
> > >> >> > +#
> > >> >> > +# Just for IPv4.
> > >> >> > +#
> > >> >> > +# @tcp: Transmission Control Protocol.
> > >> >> > +#
> > >> >> > +# @udp: User Datagram Protocol.
> > >> >> > +#
> > >> >> > +# @dccp: Datagram Congestion Control Protocol.
> > >> >> > +#
> > >> >> > +# @sctp: Stream Control Transmission Protocol.
> > >> >> > +#
> > >> >> > +# @udplite: Lightweight User Datagram Protocol.
> > >> >> > +#
> > >> >> > +# @icmp: Internet Control Message Protocol.
> > >> >> > +#
> > >> >> > +# @igmp: Internet Group Management Protocol.
> > >> >> > +#
> > >> >> > +# @ipv6: IPv6 Encapsulation.
> > >> >> > +#
> > >> >> > +# TODO: Need to add more transport layer protocol.
> > >> >> > +#
> > >> >> > +# Since: 6.1
> > >> >> > +##
> > >> >> > +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp=
', 'udplite',
> > >> >> > +    'icmp', 'igmp', 'ipv6' ] }
> > >> >>
> > >> >> Isn't the right thing to do here to use a string for protocol
> > >> >> and then pass it to getprotobyname;  that way your list is never
> > >> >> out of date, and you never have to translate between the order
> > >> >> of this enum and the integer assignment set in stone.
> > >> >>
> > >> >
> > >> > Hi Dave,
> > >> >
> > >> > Considering that most of the scenes in Qemu don't call the
> > >> getprotobyname, looks keep the string are more readable.
> > >>
> > >> Unless I'm missing something,
> > >>
> > >> (1) this enum is only used for matching packets by source IP,
> > >> source port, destination IP, destination port, and protocol, and
> > >>
> > >> (2) the packet matching works just fine for *any* protocol.
> > >>
> > >> By using an enum for the protocol, you're limiting the matcher to
> > >> whatever protocols we bother to include in the enum for no
> > >> particular reason.  Feels wrong to me.
> > >
> > > Should we remove the IP_PROTOCOL enum here? Make user input string
> protocol name for this field?
> > > Or any other detailed comments here?
> >
> > I believe that's Dave's point.  I.e.:
> >
> >     { 'struct': 'L4_Connection',
> >       'data': { 'protocol': 'str', ... }
> >
> > If we ever need to specify protocols by number in addition to name, we
> > can compatibly evolve the 'str' into an alternation of 'str' and
> > 'uint8'.  Unlikely.
>=20
> Right; just using a string and sending it via getprotobyname() actually s=
eems
> easier than using the enum and having all the conversions.

OK, Thanks for clear it.  I already fixed it.
Please review the V6 of this series.

Thanks
Chen

>=20
> Dave
>=20
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


