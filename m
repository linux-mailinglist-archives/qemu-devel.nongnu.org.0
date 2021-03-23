Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1F345AA9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:21:38 +0100 (CET)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdE7-0000GL-1y
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOdCU-0007yz-8Y
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:19:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:27936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOdCR-00064d-Fj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:19:45 -0400
IronPort-SDR: q68iip9FFF8CMRqGnlYfuGq1GiXxY62WnM5zQeoXP4dZ86yHCb7lgSy8kk99Z0pdPthm6rm9kL
 67bDidq/rJow==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="254437253"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="254437253"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:19:39 -0700
IronPort-SDR: +N+NvRZy070dfa0Q/9cBYDZrB0OcamONiTtKK2rjVBSIe7pwtqz97DTSCd3zSX1wSClrPAAwP2
 QWN545IKzYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="592910959"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 23 Mar 2021 02:19:39 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 02:19:38 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 17:19:36 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Tue, 23 Mar 2021 17:19:36 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHXHHR2COkU3F5OI06xFEZCxXoB9aqP9vp0gAFX/fA=
Date: Tue, 23 Mar 2021 09:19:36 +0000
Message-ID: <63966964f3ea447bac59561cc1174f9f@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-4-chen.zhang@intel.com>
 <87ft0n4b7u.fsf@dusky.pond.sub.org>
In-Reply-To: <87ft0n4b7u.fsf@dusky.pond.sub.org>
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
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
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
> Sent: Monday, March 22, 2021 8:36 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Luk=
as
> Straub <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO
> passthrough
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Since the real user scenario does not need COLO to monitor all traffic.
> > Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
> > network passthrough list.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/net.c     | 10 ++++++++++
> >  qapi/net.json | 40 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 725a4e1450..7c7cefe0e0 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -1199,6 +1199,16 @@ void qmp_netdev_del(const char *id, Error
> **errp)
> >      }
> >  }
> >
> > +void qmp_colo_passthrough_add(L4_Connection *conn, Error **errp) {
> > +    /* Setup passthrough connection */ }
> > +
> > +void qmp_colo_passthrough_del(L4_Connection *conn, Error **errp) {
> > +    /* Delete passthrough connection */ }
> > +
> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)  {
> >      char *str;
> > diff --git a/qapi/net.json b/qapi/net.json index
> > cd4a8ed95e..ec7d3b1128 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -851,3 +851,43 @@
> >    'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str',=
 '*dst_ip': 'str',
> >      '*src_port': 'int', '*dst_port': 'int' } }
> >
> > +##
> > +# @colo-passthrough-add:
> > +#
> > +# Add passthrough entry according to customer's needs in COLO-compare.
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "colo-passthrough-add",
> > +#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip":
> "192.168.1.1",
> > +#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'colo-passthrough-add', 'boxed': true,
> > +     'data': 'L4_Connection' }
> > +
> > +##
> > +# @colo-passthrough-del:
> > +#
> > +# Delete passthrough entry according to customer's needs in COLO-
> compare.
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "colo-passthrough-del",
> > +#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip":
> "192.168.1.1",
> > +#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'colo-passthrough-del', 'boxed': true,
> > +     'data': 'L4_Connection' }
> > +
>=20
> Now let's look at colo-passthrough-del.  I figure it is for deleting the =
kind of
> things colo-passthrough-add adds.
>=20

Yes.

> What exactly is deleted?  The thing created with the exact same arguments=
?
>=20

Delete the rule from the module's private bypass list.
When user input a rule, the colo-passthrough-del will find the specific mod=
ule by the object ID,
Then delete the rule.

> This would be unusual.  Commonly, FOO-add and FOO-del both take a string
> ID argument.  The FOO created by FOO-add remembers its ID, and FOO-del
> deletes by ID.

The ID not for rules itself, it just logged the modules(ID tagged) affected=
 by the rule.

Thanks
Chen=20




