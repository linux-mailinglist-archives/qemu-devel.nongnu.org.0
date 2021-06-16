Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E7D3A8EBE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 04:13:47 +0200 (CEST)
Received: from localhost ([::1]:43382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltL3q-0006mW-68
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 22:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ltL30-00066e-EK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 22:12:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ltL2w-0001GP-Od
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 22:12:53 -0400
IronPort-SDR: Qf6thYNBvZ4Iy7ZLN5XD1ZgNTQjb8zVxUi7QFPumD/8FjycXHeR9QazpQCrCBEzZNOHsFwVuI/
 EfH0JpKbivfw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="186477178"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="186477178"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 19:12:36 -0700
IronPort-SDR: +S+qqPDfNHhkenx8mdorl2UBD5XBO7i4wfRUxoOlqgr5399l923nuDIHAlmrUmuDdpwsMtL9Rf
 R3UoiZ0AyMmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="553884372"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2021 19:12:36 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 19:12:35 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 16 Jun 2021 10:12:33 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Wed, 16 Jun 2021 10:12:33 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Topic: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Index: AQHXYdvRnAFVnsFtTkm0a8aMTFNiOqsVJeadgACyDuA=
Date: Wed, 16 Jun 2021 02:12:33 +0000
Message-ID: <8f58a8dcb58849dd917deaea2a728358@intel.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgvrnq7w.fsf@dusky.pond.sub.org>
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?iso-8859-1?Q?Daniel_P=2EBerrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Eric
 Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Tuesday, June 15, 2021 10:43 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Daniel P.Berrang=E9 <berrange@redhat.com>;
> Gerd Hoffmann <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>;
> Lukas Straub <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command
> for COLO passthrough
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Since the real user scenario does not need COLO to monitor all traffic.
> > Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
> > network passthrough list. Add IPFlowSpec struct for all QMP commands.
> > All the fields of IPFlowSpec are optional.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
>=20
> The QAPI schema looks good to me, but the interface documentation is stil=
l
> not quite clear enough.  To make progress, I'm going to make concrete
> suggestions wherever I can despite being quite clueless about the subject
> matter.  Risks me writing something that's clearer, but wrong.  Keep that=
 in
> mind, please.
>=20
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
>=20
> The rationale is good, but it doesn't really belong into the interface
> documentation.  Suggest:
>=20
>    # @protocol: Transport layer protocol like TCP/UDP, etc.  This will be
>    #            passed to getprotobyname(3).
>=20

OK.

>=20
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
> I still don't understand this, and I'm too ignorant of COLO and networkin=
g to
> suggest improvements.

Let me use qemu boot parameter to clear it.
For colo-compare, it needs chardev as the source to handle network packet.
-object colo-compare,id=3Dcomp0,primary_in=3Dchardev-input0,secondary_in=3D=
chardev-input1,outdev=3Dchardev-output0,iothread=3Diothread0.

For net filters, it needs attached on netdev.
-object filter-redirector,id=3Dred0,netdev=3Dhn0,queue=3Drx,outdev=3Dcharde=
v-output1
-object filter-mirror,id=3Dmirror0,netdev=3Dhn0,queue=3Drx,outdev=3Dchardev=
-output2

And we can use -chardev socket combine the filter and the colo-compare.

Back to the @object-name, One guest maybe have multi colo-compare as the sa=
me time, with different object name from different source.
So we need assign the IPFlowSpec to one object as the handler. Same as the =
net-filters.
Each object instance has its own passthrough list.


>=20
> Jason or David, perhaps?
>=20
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
> > +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
> > +# The protocol and source/destination IP/ports are optional. if the
> > +user # only inputs part of the information, this will match all traffi=
c.
>=20
> Actually, all arguments are optional.
>=20
> Suggest:
>=20
>    # Add an entry to the COLO network passthrough list.
>    # Absent protocol, host addresses and ports match anything.
>=20
> If there is more than one such list, then "to a COLO network passthrough =
list"
> instead.

Yes, more than one list.

>=20
> Still missing then: meaning of absent @object-name.  Does it select the C=
OLO
> network passthrough list, perhaps?

Yes, Please see the explanation above. Each object instance has its own pas=
sthrough list.

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
> > +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
> > +# The protocol and source/destination IP/ports are optional. if the
> > +user # only inputs part of the information, this will match all traffi=
c.
>=20
> I suspect this command doesn't actually match traffic, it matches entries
> added with colo-passthrough-add.

Yes.

>=20
> Can it delete more than one such entry?
>=20

Currently no, but it easy to match one more entry to delete.

> Suggest:
>=20
>    # Delete an entry from the COLO network passthrough list.
>=20
> and then explain how the command arguments select entries.

Search the object's passthrough list, if find same entry,  delete it.

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


