Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760434DF7B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 05:39:52 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR5EN-0002PW-5B
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 23:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lR5DA-0001nn-Ka
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 23:38:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:1997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lR5D7-0006Ov-Tc
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 23:38:36 -0400
IronPort-SDR: UCL6PnLHhMEGTbLf8JUWaINYNy4AogKAGh7Kr26fNCiSsTGnxKbuRJdmRt3m/8DnU6cvtonimW
 5OmgTPGN9esg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="171081085"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="171081085"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 20:38:24 -0700
IronPort-SDR: TkDhdlDmv1PXqLYfvVCC9rZbJu1v/3CC6AXVi9ETgC9fPwcHlBJsQ389bqFnvum9TE5oCStMOn
 nGNQCRDlrUtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="516269239"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 20:38:24 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 20:38:24 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 30 Mar 2021 11:38:22 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Tue, 30 Mar 2021 11:38:22 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHXHHR2COkU3F5OI06xFEZCxXoB9aqP9vp0gAFX/fCAAT46kIAJZLCg
Date: Tue, 30 Mar 2021 03:38:22 +0000
Message-ID: <d30a03502f8e4600be6f11c775ac858c@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-4-chen.zhang@intel.com>
 <87ft0n4b7u.fsf@dusky.pond.sub.org>
 <63966964f3ea447bac59561cc1174f9f@intel.com>
 <87tup2tcn6.fsf@dusky.pond.sub.org>
In-Reply-To: <87tup2tcn6.fsf@dusky.pond.sub.org>
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Markus
> Armbruster
> Sent: Tuesday, March 23, 2021 5:58 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>; qemu-
> dev <qemu-devel@nongnu.org>; Dr. David Alan Gilbert
> <dgilbert@redhat.com>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO
> passthrough
>=20
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>=20
> >> -----Original Message-----
> >> From: Markus Armbruster <armbru@redhat.com>
> [...]
> >> Now let's look at colo-passthrough-del.  I figure it is for deleting
> >> the kind of things colo-passthrough-add adds.
> >>
> >
> > Yes.
> >
> >> What exactly is deleted?  The thing created with the exact same
> arguments?
> >>
> >
> > Delete the rule from the module's private bypass list.
> > When user input a rule, the colo-passthrough-del will find the
> > specific module by the object ID, Then delete the rule.
> >
> >> This would be unusual.  Commonly, FOO-add and FOO-del both take a
> >> string ID argument.  The FOO created by FOO-add remembers its ID, and
> >> FOO-del deletes by ID.
> >
> > The ID not for rules itself, it just logged the modules(ID tagged) affe=
cted by
> the rule.
>=20
> I'm not sure I understand.
>=20
> If you're pointing out that existing colo-passthrough-del parameter @id i=
s not
> suitable for use as unique rule ID: you can always add another parameter
> that is suitable.

Sorry to missed this mail.

For example:
The VM running with filter-mirror(object id=3D=3D0), filter-redirector(obje=
ct id=3D=3D1) and colo-compare(object id=3D=3D2),
We use  colo-passthrough-add/del to add/del a rule with a ID, if the ID=3D=
=3D2, the rule just affect to colo-compare.
The filter-mirror and filter-redirector feel nothing after the add/del.

Thanks
Chen

>=20


