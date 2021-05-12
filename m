Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A692B37B691
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:07:11 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgixa-0008Ae-9A
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lgiwM-0007Vb-73
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:05:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:29076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lgiwJ-0002Gw-Do
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:05:53 -0400
IronPort-SDR: fkcRhzXXu6L2k3WNFm8qakwNYQXqz4Z1tSuxFbtHLBT119GnT2/RGBSwR03d8djROcPxxOCgGR
 iaM8gYRC08OA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186769683"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="186769683"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 00:05:45 -0700
IronPort-SDR: w102LNBKXEqI4zIP2ZF4dIjdyvPnm66e1E0s479trRZzcetHd0Nu/hOXpVRFkpGGwX5M26hepA
 3ux6qfuX9sWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="625131767"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2021 00:05:44 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 00:05:43 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 15:05:41 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Wed, 12 May 2021 15:05:41 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Zhang, Chen" <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: RE: [PATCH V6 0/6] Passthrough specific network traffic in COLO
Thread-Topic: [PATCH V6 0/6] Passthrough specific network traffic in COLO
Thread-Index: AQHXNfjlRIjnq99tzk2zKjLrwVWDearJUGqQgBY7ixA=
Date: Wed, 12 May 2021 07:05:41 +0000
Message-ID: <a3c43db01ab4440da66cc17f2252a584@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <17dd014de70d4181858198d0187e4fea@intel.com>
In-Reply-To: <17dd014de70d4181858198d0187e4fea@intel.com>
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
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus, Jason and Dave.

This series has been modified according to previous suggestions.=20
Please review it again to make sure I fully understand comments.

Thanks
Chen

> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Zhang, Chen
> Sent: Wednesday, April 28, 2021 11:27 AM
> To: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Lukas Straub <lukasstraub2@web.de>; Zhang Chen
> <zhangckid@gmail.com>
> Subject: RE: [PATCH V6 0/6] Passthrough specific network traffic in COLO
>=20
> Please give me for comments for this series, Ping....
>=20
> Thanks
> Chen
>=20
> > -----Original Message-----
> > From: Zhang, Chen <chen.zhang@intel.com>
> > Sent: Tuesday, April 20, 2021 11:16 PM
> > To: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> > Gilbert <dgilbert@redhat.com>; Markus Armbruster
> <armbru@redhat.com>;
> > Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> > <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Cc: Zhang Chen <zhangckid@gmail.com>; Zhang, Chen
> > <chen.zhang@intel.com>; Lukas Straub <lukasstraub2@web.de>
> > Subject: [PATCH V6 0/6] Passthrough specific network traffic in COLO
> >
> > Due to some real user scenarios don't need to monitor all traffic.
> > And qemu net-filter also need function to more detailed flow control.
> > This series give user ability to passthrough kinds of COLO network stre=
am.
> >
> > For example, windows guest user want to enable windows remote
> desktop
> > to touch guest(UDP/TCP 3389), This case use UDP and TCP mixed, and the
> > tcp part payload always different caused by real desktop display
> > data(for guest time/ mouse display....).
> >
> > Another case is some real user application will actively transmit
> > information include guest time part, primary guest send data with time
> > 10:01.000, At the same time secondary guest send data with time
> > 10:01.001, it will always trigger COLO checkpoint(live migrate) to drop=
 guest
> performance.
> >
> >   V6:
> >     - Change QAPI IPFlowSpec protocol from enum to str.
> >     - Use getprotobyname to handle the protocols.
> >     - Optimize code in net.
> >
> >   V5:
> >     - Squash original 1-3 QAPI patches together.
> >     - Rename some data structures to avoid misunderstanding.
> >     - Reuse InetSocketAddressBase in IPFlowSpec.
> >     - Add new function in util/qemu-sockets.c to parse
> >       InetSocketAddressBase.
> >     - Update HMP command define to reuse current code.
> >     - Add more comments.
> >
> >   V4:
> >     - Fix QAPI code conflict for V6.0 merged patches.
> >     - Note this feature for V6.1.
> >
> >   V3:
> >     - Add COLO passthrough list lock.
> >     - Add usage demo and more comments.
> >
> >   V2:
> >     - Add the n-tuple support.
> >     - Add some qapi definitions.
> >     - Support multi colo-compare objects.
> >     - Support setup each rules for each objects individually.
> >     - Clean up COLO compare definition to .h file.
> >     - Rebase HMP command for stable tree.
> >     - Add redundant rules check.
> >
> >
> > Zhang Chen (6):
> >   qapi/net: Add IPFlowSpec and QMP command for COLO passthrough
> >   util/qemu-sockets.c: Add inet_parse_base to handle
> >     InetSocketAddressBase
> >   hmp-commands: Add new HMP command for COLO passthrough
> >   net/colo-compare: Move data structure and define to .h file.
> >   net/colo-compare: Add passthrough list to CompareState
> >   net/net.c: Add handler for COLO passthrough connection
> >
> >  hmp-commands.hx        |  26 +++++++
> >  include/monitor/hmp.h  |   2 +
> >  include/qemu/sockets.h |   1 +
> >  monitor/hmp-cmds.c     |  82 ++++++++++++++++++++
> >  net/colo-compare.c     | 162 +++++++++++-----------------------------
> >  net/colo-compare.h     | 118 +++++++++++++++++++++++++++++
> >  net/net.c              | 166
> +++++++++++++++++++++++++++++++++++++++++
> >  qapi/net.json          |  68 +++++++++++++++++
> >  util/qemu-sockets.c    |  14 ++++
> >  9 files changed, 519 insertions(+), 120 deletions(-)
> >
> > --
> > 2.25.1
>=20


