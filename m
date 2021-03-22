Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8B343D65
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:02:47 +0100 (CET)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHOY-0002y4-7J
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOHLw-0001vu-Dg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:00:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:61563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOHLu-000610-9X
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:00:04 -0400
IronPort-SDR: UfXI9qqAmMa9WrjWtanKLsnoetVAWogq0RdUVe1z1Zg4YJHFQYXnmtoafVHzOM6ejkUXYIICTk
 6a59WSSUZUbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="170200056"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="170200056"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 02:59:57 -0700
IronPort-SDR: a2QMMsf/+U/d8ObWSEG6EjMVkNFSFAAzigduAQu1tCWdbkSl2Q31N6bAOD9PPKq8nX8fe98bRv
 gva8KnoH6ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="435095175"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2021 02:59:57 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 02:59:56 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 17:59:55 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Mon, 22 Mar 2021 17:59:55 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Thread-Topic: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Thread-Index: AQHXHHRwhE0xw39XiECnAJAI55tWJqqLdVUIgAQ7QHA=
Date: Mon, 22 Mar 2021 09:59:54 +0000
Message-ID: <12145159a33b4fbc85db2ce6534e62d8@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com>
 <87blbfi1t4.fsf@dusky.pond.sub.org>
In-Reply-To: <87blbfi1t4.fsf@dusky.pond.sub.org>
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



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Friday, March 19, 2021 11:47 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Luk=
as
> Straub <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP
> commands.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  qapi/net.json | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/qapi/net.json b/qapi/net.json index
> > 87361ebd9a..498ea7aa72 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -794,3 +794,34 @@
> >  #
> >  ##
> >  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
> > +
> > +##
> > +# @IP_PROTOCOL:
> > +#
> > +# Transport layer protocol.
> > +#
> > +# Just for IPv4.
>=20
> Really?

Current tcp/udp/icmp field from IPv4 header definition,
I think maybe we need add more to support IPv6.
So, looks change to #TODO support IPv6 part is better?

>=20
> > +#
> > +# @tcp: Transmission Control Protocol.
> > +#
> > +# @udp: User Datagram Protocol.
> > +#
> > +# @dccp: Datagram Congestion Control Protocol.
> > +#
> > +# @sctp: Stream Control Transmission Protocol.
> > +#
> > +# @udplite: Lightweight User Datagram Protocol.
> > +#
> > +# @icmp: Internet Control Message Protocol.
> > +#
> > +# @igmp: Internet Group Management Protocol.
> > +#
> > +# @ipv6: IPv6 Encapsulation.
> > +#
> > +# TODO: Need to add more transport layer protocol.
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udpl=
ite',
> > +    'icmp', 'igmp', 'ipv6' ] }
> > +
>=20
> docs/devel/qapi-code-gen.txt: "type definitions should always use
> CamelCase".
>=20
> Make this something like 'enum': 'IpProtocol', please.

OK, I will fix it in next version.

Thanks
Chen


