Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44F346E6A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:01:18 +0100 (CET)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOrtd-0006GR-Fo
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOrrm-0005Qe-3e
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 20:59:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:8265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOrrj-00024N-7h
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 20:59:21 -0400
IronPort-SDR: dfeWT6FVo94SA5yfbYZ9xUtwWIdV2ECpkdbLYaxWtKkJ/00LmtAcjQcU8KpJkhjvAh2ftllu2h
 Cn9aP+yZNz8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="177716738"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="177716738"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 17:59:12 -0700
IronPort-SDR: XrT1ofADyJftNnM5pdrfzncDzJOjJFtGVuxKWnZCvwUEWPthxdV9Q+60VDpbehIQqbflFaLRDt
 dqh+LBXuuKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="435774700"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2021 17:59:12 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 17:59:11 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 08:59:09 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Wed, 24 Mar 2021 08:59:09 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Topic: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Thread-Index: AQHXHHRy9AmyzOXAOUuzqhkS7ODhyaqLdaKdgAQ8XnCAAEOtSYABJQqQgABBkvuAAPu6sA==
Date: Wed, 24 Mar 2021 00:59:09 +0000
Message-ID: <e107af35a1cd4143b1da89b3fc27c68a@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
 <87k0pz4bg8.fsf@dusky.pond.sub.org>
 <4ffb0d8b135b40caba777a830b70ae18@intel.com>
 <871rc6urdc.fsf@dusky.pond.sub.org>
In-Reply-To: <871rc6urdc.fsf@dusky.pond.sub.org>
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Tuesday, March 23, 2021 5:55 PM
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
> [...]
> >> Naming the argument type L4_Connection is misleading.
> >>
> >> Even naming the match arguments L4_Connection would be misleading.
> >> "Connection" has a specific meaning in networking.  There are TCP
> >> connections.  There is no such thing as an UDP connection.
> >>
> >> A TCP connection is uniquely identified by a pair of endpoints, i.e.
> >> by source address, source port, destination address, destination port.
> >> Same for other connection-oriented protocols.  The protocol is not
> >> part of the connection.  Thus, L4_Connection would be misleading even
> >> for the connection-oriented case.
> >>
> >> You need a named type for colo-passthrough-add's argument because
> you
> >> share it with colo-passthrough-del.  I'm not sure that's what we want
> >> (I'm going to write more on that in a moment).  If it is what we
> >> want, then please pick a another, descriptive name.
> >
> > What do you think the "L4BypassRule" or "NetworkRule" ?
>=20
> NetworkRule is too generic.
>=20
> What about ColoPassthroughRule?

It can be used by net filter modules(filter mirror,filter-dump....) in the =
future, that's not just for COLO.
PassthroughRule is better?

Thanks
Chen



