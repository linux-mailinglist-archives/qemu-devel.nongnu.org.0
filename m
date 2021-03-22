Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A21343D69
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:03:59 +0100 (CET)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHPi-0004RM-Kf
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOHMJ-0002DF-Nz
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:00:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:31485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOHMH-0006Il-KF
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:00:27 -0400
IronPort-SDR: XdgKnni+pZg6osRvF3J0xe065Wh3E08KcX1uyg6F8B2PcWPOuQUoJFIBQqVDgviSQoIZe8h0xy
 iUcNn3WnnrxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="275333404"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="275333404"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 03:00:23 -0700
IronPort-SDR: 6KG6WpUddPFBhKUwf0wEKH9WO8BwDW7GK03PsosQxBZ81c5GaAt8L+G6nQGRc81JFPoC0RymlE
 1/LMBJDORppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="407742265"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2021 03:00:11 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 03:00:08 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 18:00:06 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Mon, 22 Mar 2021 18:00:06 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Topic: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Index: AQHXHHRy9AmyzOXAOUuzqhkS7ODhyaqLdaKdgAQ8XnA=
Date: Mon, 22 Mar 2021 10:00:06 +0000
Message-ID: <5b75057ecc784296aa271f5f6692906a@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
In-Reply-To: <877dm3i1qk.fsf@dusky.pond.sub.org>
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
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
> Sent: Friday, March 19, 2021 11:48 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Li Zhijian <lizhijian@cn.fujitsu.com>; Lukas Straub <lukasstraub2@web.de>=
;
> Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Add L4_Connection struct for other QMP commands.
> > Except protocol field is necessary, other fields are optional.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  qapi/net.json | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/qapi/net.json b/qapi/net.json index
> > 498ea7aa72..cd4a8ed95e 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -825,3 +825,29 @@
> >  { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udpl=
ite',
> >      'icmp', 'igmp', 'ipv6' ] }
> >
> > +##
> > +# @L4_Connection:
> > +#
> > +# Layer 4 network connection.
> > +#
> > +# Just for IPv4.
> > +#
> > +# @protocol: Transport layer protocol like TCP/UDP...
> > +#
> > +# @id: For specific module with Qemu object ID, If there is no such pa=
rt,
> > +#      it means global rules.
>=20
> Clear as mud.

Sorry, let me re-clear it.
If I understand correctly, The ID shouldn't be here, but I found the 'boxed=
' flag just can add only one 'data' like this:
+##
+{ 'command': 'colo-passthrough-add', 'boxed': true,
+     'data': 'L4_Connection' }

I original want to this:
+##
+{ 'command': 'colo-passthrough-add',=20
+     'data': { 'id': 'str', 'boxed': false, 'conn': 'L4_Connection', 'boxe=
d': true  }

So, I add the @id as an optional argument here.

rewrite the comments:
+# @id: Assign the rule to Qemu network handle module object ID. Like colo-=
compare, net-filter.=20

Please see the ID details in patch3 too.=20

Thanks
Chen

>=20
> See my review of PATCH 3.
>=20
> > +#
> > +# @src_ip: Source IP.
> > +#
> > +# @dst_ip: Destination IP.
> > +#
> > +# @src_port: Source port.
> > +#
> > +# @dst_port: Destination port.
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'L4_Connection',
> > +  'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str',=
 '*dst_ip': 'str',
> > +    '*src_port': 'int', '*dst_port': 'int' } }
> > +


