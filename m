Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4803A8E73
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:37:59 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKVC-0001Ym-4K
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ltKEd-00058Y-5m
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:20:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:38943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ltKEZ-0004iS-OO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:20:50 -0400
IronPort-SDR: JfA/dc8MTHMY3xUW2/I3old1ww2XEa+Z6kbeA7K87QFhMSatkDJp1WYzE4/PWX1cI/NCE2ecN4
 i/G9sBj+itvw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="193406749"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="193406749"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 18:20:41 -0700
IronPort-SDR: 0zRWnpryrEeOeQn0BQCM8C2bNWPyGyx58CD7zTHAGDZxqS/r3ChmveBy167HLUlX0f66xcUUCd
 VbxVA1iE5ncQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="487974853"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2021 18:20:41 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 18:20:40 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 16 Jun 2021 09:20:38 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Wed, 16 Jun 2021 09:20:38 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Topic: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Index: AQHXYdvRnAFVnsFtTkm0a8aMTFNiOqsUpOYAgAEySYA=
Date: Wed, 16 Jun 2021 01:20:38 +0000
Message-ID: <7ca6cb5007db4b9fa11564fed20c4996@intel.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <20210615170148.707b092e@gecko.fritz.box>
In-Reply-To: <20210615170148.707b092e@gecko.fritz.box>
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
Cc: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Eric
 Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Tuesday, June 15, 2021 11:02 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Zhang Chen
> <zhangckid@gmail.com>
> Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command
> for COLO passthrough
>=20
> On Tue, 15 Jun 2021 19:37:35 +0800
> Zhang Chen <chen.zhang@intel.com> wrote:
>=20
> > Since the real user scenario does not need COLO to monitor all traffic.
> > Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
> > network passthrough list. Add IPFlowSpec struct for all QMP commands.
> > All the fields of IPFlowSpec are optional.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/net.c     | 10 +++++++
> >  qapi/net.json | 74
> > +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 84 insertions(+)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 76bbb7c31b..f913e97983 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error
> **errp)
> >      }
> >  }
> >
> > +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp) {
> > +    /* TODO implement setup passthrough rule */ }
> > +
> > +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp) {
> > +    /* TODO implement delete passthrough rule */ }
> > +
> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)  {
> >      char *str;
> > diff --git a/qapi/net.json b/qapi/net.json index
> > 7fab2e7cd8..91f2e1495a 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -7,6 +7,7 @@
> >  ##
> >
> >  { 'include': 'common.json' }
> > +{ 'include': 'sockets.json' }
> >
> >  ##
> >  # @set_link:
> > @@ -696,3 +697,76 @@
> >  ##
> >  { 'event': 'FAILOVER_NEGOTIATED',
> >    'data': {'device-id': 'str'} }
> > +
> > +##
> > +# @IPFlowSpec:
> > +#
> > +# IP flow specification.
> > +#
> > +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol =
is
> the
> > +#            string instead of enum, because it can be passed to
> getprotobyname(3)
> > +#            and avoid duplication with /etc/protocols.
> > +#
> > +# @object-name: The @object-name means packet handler in Qemu.
> Because not
> > +#               all the network packet must pass the colo-compare modu=
le,
> > +#               the net-filters are same situation. There modules atta=
ch to
> > +#               netdev or chardev to work, VM can run multiple modules
> > +#               at the same time. So it needs the object-name to set
> > +#               the effective module.
>=20
> Again: "@object-name: The id of the colo-compare object to add the filter
> to."

According to the previous discussion,
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01088.html

In order to avoid misunderstanding looks use "@object-name: The name of the=
 colo-compare object to add the filter " is better?

Thanks
Chen


>=20
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
> > +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
> > +# The protocol and source/destination IP/ports are optional. if the
> > +user # only inputs part of the information, this will match all traffi=
c.
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
> > +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
> > +# The protocol and source/destination IP/ports are optional. if the
> > +user # only inputs part of the information, this will match all traffi=
c.
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
>=20
>=20
>=20
> --


