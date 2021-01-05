Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251902EA3ED
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 04:31:18 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwd41-00042G-4v
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 22:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kwd1w-00033D-BU
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 22:29:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kwd1u-0006Uj-IL
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 22:29:08 -0500
IronPort-SDR: Mw9zrYs/Bie0w5P+JdeaRqtwz2UJpX9v+HXpTZsIQpsXfD+slpHPUOaX+l4f04TMbHCpHdyYQe
 3baLItg7lexw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="164747341"
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; d="scan'208";a="164747341"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 19:28:52 -0800
IronPort-SDR: 7EqF17bvtejB9ZTqDhjjp17WA6JEdBwfwHWjnOoBvS4Xr23K9Ig2kDrTusj+uhO8mUXw9jWMPk
 u5YsMQwPwLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; d="scan'208";a="496634786"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 04 Jan 2021 19:28:52 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 4 Jan 2021 19:28:49 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 5 Jan 2021 11:28:48 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Tue, 5 Jan 2021 11:28:48 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH 0/3] Bypass specific network traffic in COLO
Thread-Topic: [PATCH 0/3] Bypass specific network traffic in COLO
Thread-Index: AQHW2ZH2TQccpom8pUur848MxDH3B6oW+52AgAFzEVA=
Date: Tue, 5 Jan 2021 03:28:48 +0000
Message-ID: <9f11d2a350574fe485e9c16908e65054@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20210104130637.GE2972@work-vm>
In-Reply-To: <20210104130637.GE2972@work-vm>
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 qemu-dev <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Monday, January 4, 2021 9:07 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH 0/3] Bypass specific network traffic in COLO
>=20
> * Zhang Chen (chen.zhang@intel.com) wrote:
> > From: Zhang Chen <chen.zhang@intel.com>
> >
> > Since the real user scenario does not need to monitor all traffic.
>=20
> Can you explain the type of real user case where they only need to compar=
e
> some connections?

Sure.
For example, windows guest user want to enable windows remote desktop to to=
uch guest(UDP/TCP 3389),
This case use UDP and TCP mixed, and the tcp part payload always different =
caused by real desktop display data(for guest time/ mouse display....).
Another case is some real user application will actively transmit informati=
on include guest time part,  primary guest send data with time 10:01.000,
At the same time secondary guest send data with time 10:01.001, it will alw=
ays trigger COLO checkpoint to drop guest performance.

Thanks
Chen


>=20
> Dave
>=20
> > This series give user ability to bypass kinds of network stream.
> >
> > Zhang Chen (3):
> >   qapi/net: Add new QMP command for COLO passthrough
> >   hmp-commands: Add new HMP command for COLO passthrough
> >   net/colo-compare: Add handler for passthrough connection
> >
> >  hmp-commands.hx       | 26 +++++++++++++++++++++++
> >  include/monitor/hmp.h |  2 ++
> >  monitor/hmp-cmds.c    | 20 ++++++++++++++++++
> >  net/colo-compare.c    | 49
> +++++++++++++++++++++++++++++++++++++++++++
> >  net/colo-compare.h    |  2 ++
> >  net/net.c             | 39 ++++++++++++++++++++++++++++++++++
> >  qapi/net.json         | 46
> ++++++++++++++++++++++++++++++++++++++++
> >  7 files changed, 184 insertions(+)
> >
> > --
> > 2.17.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


