Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A2349FCD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 03:28:49 +0100 (CET)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPcDQ-0000Bx-G7
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 22:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lPcBs-0007kw-Rj
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 22:27:13 -0400
Received: from mga17.intel.com ([192.55.52.151]:64926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lPcBq-0000yA-3Q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 22:27:12 -0400
IronPort-SDR: ahRkpu3I6qnq+DW6iVaC0JWg9OvFTYKKnW2N+z/T1PeWH8CPIVdJO4C5DQxSU7A39bCfr6pv8m
 at04BmlBBRwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="171044071"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="171044071"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 19:27:05 -0700
IronPort-SDR: qj1F8Ez26oZTbSuXRWnQOi7Q/jpQtsCEgdaFBj+h6DrvHY0KpUc+QfV3Y156O/HEj/p6e17ZX4
 4C/GHMgv4TfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="514890968"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2021 19:27:05 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 19:27:04 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 26 Mar 2021 10:27:03 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Fri, 26 Mar 2021 10:27:03 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: RE: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Topic: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Index: AQHXHHRy9AmyzOXAOUuzqhkS7ODhyaqLdaKdgAQ8XnCAAEOtSYABJQqQgABBkvuAACb/gIABNt4YgAHDRvA=
Date: Fri, 26 Mar 2021 02:27:03 +0000
Message-ID: <7434f936ae5540af930ca5c97aa812ee@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
 <87k0pz4bg8.fsf@dusky.pond.sub.org>
 <4ffb0d8b135b40caba777a830b70ae18@intel.com>
 <871rc6urdc.fsf@dusky.pond.sub.org> <YFpML7sdeUiciL3B@work-vm>
 <87mtutf3pv.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtutf3pv.fsf@dusky.pond.sub.org>
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
Cc: Jason Wang <jasowang@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, Zhang
 Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Wednesday, March 24, 2021 2:47 PM
> To: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>; qemu-
> dev <qemu-devel@nongnu.org>; Zhang, Chen <chen.zhang@intel.com>;
> Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
>=20
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>=20
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> "Zhang, Chen" <chen.zhang@intel.com> writes:
> >>
> >> >> -----Original Message-----
> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> [...]
> >> >> Naming the argument type L4_Connection is misleading.
> >> >>
> >> >> Even naming the match arguments L4_Connection would be
> misleading.
> >> >> "Connection" has a specific meaning in networking.  There are TCP
> >> >> connections.  There is no such thing as an UDP connection.
> >> >>
> >> >> A TCP connection is uniquely identified by a pair of endpoints,
> >> >> i.e. by source address, source port, destination address, destinati=
on
> port.
> >> >> Same for other connection-oriented protocols.  The protocol is not
> >> >> part of the connection.  Thus, L4_Connection would be misleading
> >> >> even for the connection-oriented case.
> >> >>
> >> >> You need a named type for colo-passthrough-add's argument because
> >> >> you share it with colo-passthrough-del.  I'm not sure that's what
> >> >> we want (I'm going to write more on that in a moment).  If it is
> >> >> what we want, then please pick a another, descriptive name.
> >> >
> >> > What do you think the "L4BypassRule" or "NetworkRule" ?
> >>
> >> NetworkRule is too generic.
> >>
> >> What about ColoPassthroughRule?
> >
> > Which is a bit specific; there's not actually anything Colo specific
> > in there; can I suggest 'L4FlowSpec';
>=20
> "A bit too specific" is mostly harmless, since we can rename types at any=
 time
> (they are not visible in external interfaces).
>=20
> This is *not* an objection to less specific names.  All I want is names t=
hat
> don't give me wrong ideas on the thing's purpose.  L4FlowSpec and
> IPFlowSpec (below) feel fine in that regard.
>=20
> >                                     I think there should also beb a
> > separate type that represents an IP address+port, so that what you end
> > up with is:
> >
> >   IPFlowSpec
> >      ID
> >      Protocol
> >      Source
> >      Dest
>=20
> I understand the motivation.  Three drawbacks, though.
>=20
> One, it gets us another level of nesting on the wire, i.e. something like
>=20
>     {"source": {"address": SRC-ADDR, "port": SRC-PORT},
>      "destination": {"address": DST-ADDR, "port": DST-PORT}}
>=20
> instead of
>=20
>     {"source-address": SRC-ADDR, "source-port": SRC-PORT,
>      "destination-address": DST-ADDR, "destination-port": DST-PORT}
>=20
> QMP clients shouldn't care.
>=20
> Two, we have many (address, port) pairs in the schema that don't use
> nesting.  Adding nesting sometimes makes QMP less consistent.
>=20
> Three, human-friendly interface wrappers tend to dislike nesting.  This
> particular case seems okay; we end up with dotted keys like source.addres=
s
> instead of source-address.  In a case where we need just one (address, po=
rt),
> we'd get some-silly-name.address instead of just address, though.
>=20
> I've occasionally felt a mild need for letting me say "this struct member
> should be unboxed on the wire", i.e. have its curlies peeled off.
> Never enough to justify the additional generator complexity, though.

The initial patch of this series used unboxed struct, Eric's comments is ch=
ange it to boxed.
I think it's OK, for the unused field we can keep 0 for it. The n-tuple(src=
 IP, dst IP, src port, dst port, protocol)
will be used in many place on Qemu network related code(like migrate, NBD..=
..). =20
For the name, I think Dave's comments is well, for the @InetSocketAddressBa=
se we can remove it and change it to use IPFlowSpec.
Markus, what do you think about it?

Thanks
Chen





