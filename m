Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B239BD1D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:29:08 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCh1-00074l-9O
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lpCCb-0006Pz-SV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:57:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:16822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lpCCY-0002dj-Hk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:57:41 -0400
IronPort-SDR: YSQM7BP/yF8tWHVW6j5vdPsB6Vf2dXaSA9uI2tb8G9lbTHBCmeipPJwsRP/GYTbu7LJRPEAZIS
 5q0jqCknarnQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="204344147"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="204344147"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 08:57:30 -0700
IronPort-SDR: H4HMONUsOGVCSm64OZXpeMxsw2pPiN6zrUDcXxJRt6gwctoSZTl+t/SQ3pJYJfWWU6lHMvRVjf
 n/o7MbhP8wgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="551203278"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2021 08:57:30 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 4 Jun 2021 08:57:29 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 4 Jun 2021 23:57:27 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Fri, 4 Jun 2021 23:57:27 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: RE: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Topic: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Index: AQHXUdthkZsZrNXk3keJMgxjCRGGYqsDc96AgACWN9A=
Date: Fri, 4 Jun 2021 15:57:27 +0000
Message-ID: <9a7a70304c304d2f99e5ee952eddf49f@intel.com>
References: <20210526025424.1319994-1-chen.zhang@intel.com>
 <20210526025424.1319994-2-chen.zhang@intel.com>
 <20210604143521.ej6n7g5tlawkhwpj@redhat.com>
In-Reply-To: <20210604143521.ej6n7g5tlawkhwpj@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Eric Blake <eblake@redhat.com>
> Sent: Friday, June 4, 2021 10:35 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>; Markus
> Armbruster <armbru@redhat.com>; Daniel P. Berrang=E9
> <berrange@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Zhang Chen <zhangckid@gmail.com>; Lukas
> Straub <lukasstraub2@web.de>
> Subject: Re: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command
> for COLO passthrough
>=20
> On Wed, May 26, 2021 at 10:54:19AM +0800, Zhang Chen wrote:
> > Since the real user scenario does not need COLO to monitor all traffic.
> > Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
> > network passthrough list. Add IPFlowSpec struct for all QMP commands.
> > Except protocol field is necessary, other fields are optional.
>=20
> That last sentence reads awkwardly, and I don't see a protocol field in t=
he
> patch below.

Oh, We move the protocol field to optional by Lukas's comments in V6.
I will remove this comments here.

>=20
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/net.c     | 10 ++++++++
> >  qapi/net.json | 68
> > +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 78 insertions(+)
> >
>=20
> > +++ b/qapi/net.json
> > @@ -7,6 +7,7 @@
> >  ##
> >
> >  { 'include': 'common.json' }
> > +{ 'include': 'sockets.json' }
> >
> >  ##
> >  # @set_link:
> > @@ -694,3 +695,70 @@
> >  ##
> >  { 'event': 'FAILOVER_NEGOTIATED',
> >    'data': {'device-id': 'str'} }
> > +
> > +##
> > +# @IPFlowSpec:
> > +#
> > +# IP flow specification.
> > +#
> > +# @protocol: Transport layer protocol like TCP/UDP...
>=20
> Why is this open-coded as 'str' instead of an enum?

The original code use enum, but we change it by Dave and Markus's comments.
Please check the history:
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03919.html

>=20
> > +#
> > +# @object-name: Point out the IPflow spec effective range of object,
> > +#               If there is no such part, it means global spec.
> > +#
> > +# @source: Source address and port.
> > +#
> > +# @destination: Destination address and port.
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'IPFlowSpec',
> > +  'data': { '*protocol': 'str', '*object-name': 'str',
> > +    '*source': 'InetSocketAddressBase',
> > +    '*destination': 'InetSocketAddressBase' } }
> > +
> > +##
> > +# @colo-passthrough-add:
> > +#
> > +# Add passthrough entry according to user's needs in COLO-compare.
> > +# Source IP/port and destination IP/port both optional, If user just
> > +# input parts of infotmation, it will match all.
>=20
> information
>=20
> Grammar suggestion:
>=20
> The source and destination IP/ports are both optional; if the user only i=
nputs
> part of the information, this will match all traffic.
>=20
> except I'm not sure if my rewrite conveys the actual intent.

Looks good to me, It should add the "protocol" to optional too.
Sorry, I'm not a native speaker, I will fix it in next version.

>=20
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "colo-passthrough-add",
> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'colo-passthrough-add', 'boxed': true,
> > +     'data': 'IPFlowSpec' }
> > +
> > +##
> > +# @colo-passthrough-del:
> > +#
> > +# Delete passthrough entry according to user's needs in COLO-compare.
> > +# Source IP/port and destination IP/port both optional, If user just
> > +# input parts of infotmation, it will match all.
>=20
> Same problems as above.

OK.

Thanks
Chen

>=20
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "colo-passthrough-del",
> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'colo-passthrough-del', 'boxed': true,
> > +     'data': 'IPFlowSpec' }
> > --
> > 2.25.1
> >
>=20
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org


