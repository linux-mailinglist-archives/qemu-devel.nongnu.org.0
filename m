Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9227345A5F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:08:57 +0100 (CET)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOd20-0004pZ-7Z
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOczZ-0003On-5S
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:06:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:59579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOczW-0006Ng-HX
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:06:24 -0400
IronPort-SDR: uyW2j5cELrXEifmy586StQhtIDAbgVDpmbgq87lzJhB7nbrsiYJOOwL5L5vnTFKeHdPY9hiwON
 4fdlWmOkY0Kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="178002716"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="178002716"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:06:16 -0700
IronPort-SDR: xGNGK9fnFqJDOU4aRHAVuG2iCRDCYWe0VGppbj8/hgESGMyQBi9zdh05E8QR98nmJWvwXerEcJ
 gyf37SHckj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="374168084"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 23 Mar 2021 02:06:15 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 02:06:15 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 17:06:13 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Tue, 23 Mar 2021 17:06:13 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Topic: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Index: AQHXHHRy9AmyzOXAOUuzqhkS7ODhyaqLdaKdgAQ8XnCAAEOtSYABJQqQ
Date: Tue, 23 Mar 2021 09:06:13 +0000
Message-ID: <4ffb0d8b135b40caba777a830b70ae18@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
 <87k0pz4bg8.fsf@dusky.pond.sub.org>
In-Reply-To: <87k0pz4bg8.fsf@dusky.pond.sub.org>
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Monday, March 22, 2021 8:31 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>; qemu-
> dev <qemu-devel@nongnu.org>; Dr. David Alan Gilbert
> <dgilbert@redhat.com>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
>=20
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>=20
> >> -----Original Message-----
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Sent: Friday, March 19, 2021 11:48 PM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> >> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> >> Gilbert <dgilbert@redhat.com>; Markus Armbruster
> <armbru@redhat.com>;
> >> Li Zhijian <lizhijian@cn.fujitsu.com>; Lukas Straub
> >> <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
> >> Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection
> >> definition
> >>
> >> Zhang Chen <chen.zhang@intel.com> writes:
> >>
> >> > Add L4_Connection struct for other QMP commands.
> >> > Except protocol field is necessary, other fields are optional.
> >> >
> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> >> > ---
> >> >  qapi/net.json | 26 ++++++++++++++++++++++++++
> >> >  1 file changed, 26 insertions(+)
> >> >
> >> > diff --git a/qapi/net.json b/qapi/net.json index
> >> > 498ea7aa72..cd4a8ed95e 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -825,3 +825,29 @@
> >> >  { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'u=
dplite',
> >> >      'icmp', 'igmp', 'ipv6' ] }
> >> >
> >> > +##
> >> > +# @L4_Connection:
> >> > +#
> >> > +# Layer 4 network connection.
> >> > +#
> >> > +# Just for IPv4.
> >> > +#
> >> > +# @protocol: Transport layer protocol like TCP/UDP...
> >> > +#
> >> > +# @id: For specific module with Qemu object ID, If there is no such=
 part,
> >> > +#      it means global rules.
> >>
> >> Clear as mud.
> >
> > Sorry, let me re-clear it.
> > If I understand correctly, The ID shouldn't be here, but I found the 'b=
oxed'
> flag just can add only one 'data' like this:
> > +##
> > +{ 'command': 'colo-passthrough-add', 'boxed': true,
> > +     'data': 'L4_Connection' }
> >
> > I original want to this:
> > +##
> > +{ 'command': 'colo-passthrough-add',
> > +     'data': { 'id': 'str', 'boxed': false, 'conn': 'L4_Connection',
> > +'boxed': true  }
> >
> > So, I add the @id as an optional argument here.
> >
> > rewrite the comments:
> > +# @id: Assign the rule to Qemu network handle module object ID. Like
> colo-compare, net-filter.
> >
> > Please see the ID details in patch3 too.
>=20
> So, colo-passthrough-add takes an @id argument (to be tacked onto packets
> to help with further processing, I understand), and arguments to match
> packets.

Yes.

>=20
> Naming the argument type L4_Connection is misleading.
>=20
> Even naming the match arguments L4_Connection would be misleading.
> "Connection" has a specific meaning in networking.  There are TCP
> connections.  There is no such thing as an UDP connection.
>=20
> A TCP connection is uniquely identified by a pair of endpoints, i.e. by s=
ource
> address, source port, destination address, destination port.
> Same for other connection-oriented protocols.  The protocol is not part o=
f
> the connection.  Thus, L4_Connection would be misleading even for the
> connection-oriented case.
>=20
> You need a named type for colo-passthrough-add's argument because you
> share it with colo-passthrough-del.  I'm not sure that's what we want (I'=
m
> going to write more on that in a moment).  If it is what we want, then pl=
ease
> pick a another, descriptive name.

What do you think the "L4BypassRule" or "NetworkRule" ?

Thanks
Chen



