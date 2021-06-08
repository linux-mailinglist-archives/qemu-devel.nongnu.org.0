Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18039F11E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:40:41 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXHs-0004KO-An
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqXG5-00021s-Kx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:38:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqXFv-0004dE-Ja
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:38:49 -0400
IronPort-SDR: LZGARbiQzXEt87UU95tbjTRiMYc4AR3jaYNaxaYt+v+nDOW3rtXcrnqShnUsqXRiRnopfC5tDu
 of7A/C97nX+A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226143542"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226143542"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:38:17 -0700
IronPort-SDR: 2PleF7SDaNCia4gk9Fw0b2j4cxwBJlk36tJFwNgrvwVbUoAy/A34xp/143agn0G6+Quz4xWmIW
 6enTmZoqXWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="485134884"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2021 01:38:17 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 8 Jun 2021 01:38:16 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 8 Jun 2021 16:38:14 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Tue, 8 Jun 2021 16:38:14 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Eric
 Blake" <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: RE: [PATCH V7 0/6] Passthrough specific network traffic in COLO
Thread-Topic: [PATCH V7 0/6] Passthrough specific network traffic in COLO
Thread-Index: AQHXUdtgur4IchF7uUiYHT2k4NVQJ6sJ3tTQ
Date: Tue, 8 Jun 2021 08:38:14 +0000
Message-ID: <e2461a3612984f3b8431be19bbea86af@intel.com>
References: <20210526025424.1319994-1-chen.zhang@intel.com>
In-Reply-To: <20210526025424.1319994-1-chen.zhang@intel.com>
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
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

Hi Jason and Markus,

No news for a while.
If you have time, please give me more comments for this series.

Thanks
Chen


> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Wednesday, May 26, 2021 10:54 AM
> To: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Zhang Chen <zhangckid@gmail.com>; Zhang, Chen
> <chen.zhang@intel.com>; Lukas Straub <lukasstraub2@web.de>
> Subject: [PATCH V7 0/6] Passthrough specific network traffic in COLO
>=20
> Due to some real user scenarios don't need to monitor all traffic.
> And qemu net-filter also need function to more detailed flow control.
> This series give user ability to passthrough kinds of COLO network stream=
.
>=20
> For example, windows guest user want to enable windows remote desktop
> to touch guest(UDP/TCP 3389), This case use UDP and TCP mixed, and the tc=
p
> part payload always different caused by real desktop display data(for gue=
st
> time/ mouse display....).
>=20
> Another case is some real user application will actively transmit informa=
tion
> include guest time part, primary guest send data with time 10:01.000, At =
the
> same time secondary guest send data with time 10:01.001, it will always
> trigger COLO checkpoint(live migrate) to drop guest performance.
>=20
>   V7:
>     - Keep some data structure stay in .c (patch 4/6).
>     - Fix mutex init issue (patch 5/6).
>     - Make the IPFlowSpec 'protocol' field optional (patch 1/6).
>     - Add compare_passthrough_find function in net.c (patch 6/6).
>=20
>   V6:
>     - Change QAPI IPFlowSpec protocol from enum to str.
>     - Use getprotobyname to handle the protocols.
>     - Optimize code in net.
>=20
>   V5:
>     - Squash original 1-3 QAPI patches together.
>     - Rename some data structures to avoid misunderstanding.
>     - Reuse InetSocketAddressBase in IPFlowSpec.
>     - Add new function in util/qemu-sockets.c to parse
>       InetSocketAddressBase.
>     - Update HMP command define to reuse current code.
>     - Add more comments.
>=20
>   V4:
>     - Fix QAPI code conflict for V6.0 merged patches.
>     - Note this feature for V6.1.
>=20
>   V3:
>     - Add COLO passthrough list lock.
>     - Add usage demo and more comments.
>=20
>   V2:
>     - Add the n-tuple support.
>     - Add some qapi definitions.
>     - Support multi colo-compare objects.
>     - Support setup each rules for each objects individually.
>     - Clean up COLO compare definition to .h file.
>     - Rebase HMP command for stable tree.
>     - Add redundant rules check.
>=20
>=20
> Zhang Chen (6):
>   qapi/net: Add IPFlowSpec and QMP command for COLO passthrough
>   util/qemu-sockets.c: Add inet_parse_base to handle
>     InetSocketAddressBase
>   hmp-commands: Add new HMP command for COLO passthrough
>   net/colo-compare: Move data structure and define to .h file.
>   net/colo-compare: Add passthrough list to CompareState
>   net/net.c: Add handler for COLO passthrough connection
>=20
>  hmp-commands.hx        |  26 +++++++
>  include/monitor/hmp.h  |   2 +
>  include/qemu/sockets.h |   1 +
>  monitor/hmp-cmds.c     |  82 ++++++++++++++++++++
>  net/colo-compare.c     | 160 +++++++++++++--------------------------
>  net/colo-compare.h     |  98 ++++++++++++++++++++++++
>  net/net.c              | 168 +++++++++++++++++++++++++++++++++++++++++
>  qapi/net.json          |  68 +++++++++++++++++
>  util/qemu-sockets.c    |  14 ++++
>  9 files changed, 510 insertions(+), 109 deletions(-)
>=20
> --
> 2.25.1


