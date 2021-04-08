Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F00357AC2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 05:26:37 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lULJV-0007Jj-1I
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 23:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lULHy-0006JR-Hw
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 23:25:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:64657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lULHv-0003so-NU
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 23:25:01 -0400
IronPort-SDR: xGa5SEp/N2+EMoXWeByJuxrYhZAwELaPup/A4rpSBMJGvVPGb45VdHhm6qgBnJMVTVbEsVplNu
 uMivt0YhYCoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193562540"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="193562540"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 20:24:50 -0700
IronPort-SDR: YdexVwC035hxMZOnVTZmewrw8cl5sEgPbWUCmzdZ2pcpGcbQphPLaHX55R/bhewn7I1UYOV/NR
 tkbO0wYN2u9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="449460409"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2021 20:24:50 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 20:24:49 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 11:24:47 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 11:24:47 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHXHHR2COkU3F5OI06xFEZCxXoB9aqP9vp0gAFX/fCAAT46kIAJZLCggAtLSc2AAtXIIA==
Date: Thu, 8 Apr 2021 03:24:47 +0000
Message-ID: <6fc5752051744ada96fbbca67a7958ac@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-4-chen.zhang@intel.com>
 <87ft0n4b7u.fsf@dusky.pond.sub.org>
 <63966964f3ea447bac59561cc1174f9f@intel.com>
 <87tup2tcn6.fsf@dusky.pond.sub.org>
 <d30a03502f8e4600be6f11c775ac858c@intel.com>
 <87mtubdepg.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtubdepg.fsf@dusky.pond.sub.org>
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
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
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
> Sent: Tuesday, April 6, 2021 4:01 PM
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
> >> From: Qemu-devel <qemu-devel-
> >> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Markus
> >> Armbruster
> >> Sent: Tuesday, March 23, 2021 5:58 PM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: Lukas Straub <lukasstraub2@web.de>; Li Zhijian
> >> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>; qemu-
> >> dev <qemu-devel@nongnu.org>; Dr. David Alan Gilbert
> >> <dgilbert@redhat.com>; Zhang Chen <zhangckid@gmail.com>
> >> Subject: Re: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO
> >> passthrough
> >>
> >> "Zhang, Chen" <chen.zhang@intel.com> writes:
> >>
> >> >> -----Original Message-----
> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> [...]
> >> >> Now let's look at colo-passthrough-del.  I figure it is for
> >> >> deleting the kind of things colo-passthrough-add adds.
> >> >>
> >> >
> >> > Yes.
> >> >
> >> >> What exactly is deleted?  The thing created with the exact same
> >> arguments?
> >> >>
> >> >
> >> > Delete the rule from the module's private bypass list.
> >> > When user input a rule, the colo-passthrough-del will find the
> >> > specific module by the object ID, Then delete the rule.
> >> >
> >> >> This would be unusual.  Commonly, FOO-add and FOO-del both take a
> >> >> string ID argument.  The FOO created by FOO-add remembers its ID,
> >> >> and FOO-del deletes by ID.
> >> >
> >> > The ID not for rules itself, it just logged the modules(ID tagged)
> >> > affected by
> >> the rule.
> >>
> >> I'm not sure I understand.
> >>
> >> If you're pointing out that existing colo-passthrough-del parameter
> >> @id is not suitable for use as unique rule ID: you can always add
> >> another parameter that is suitable.
> >
> > Sorry to missed this mail.
> >
> > For example:
> > The VM running with filter-mirror(object id=3D=3D0),
> > filter-redirector(object id=3D=3D1) and colo-compare(object id=3D=3D2),=
 We use
> colo-passthrough-add/del to add/del a rule with a ID, if the ID=3D=3D2, t=
he rule
> just affect to colo-compare.
> > The filter-mirror and filter-redirector feel nothing after the add/del.
>=20
> I think you're trying to explain existing parameter @id.  The point I was=
 trying
> to make is unrelated to this parameter, except by name collision.
>=20
> My point is: our existing "delete" operations select the object to be del=
eted
> by some unique name that is assigned by the "add" operation.
> The unique name is a property of the object.  The property name is often,
> but not always "id".
>=20
> Examples:
>=20
>     device_add argument "id" sets the device's unique name.
>     device_del argument "id" selects the device to delete by its name.
>=20
>     blockdev-add argument "node-name" sets the block backend device's
>     unique name.
>     blockdev-del argument "node-name" selects the block backend device
>     to delete by its name.
>=20
> Is there any particular reason why deletion of your kind of object can't =
work
> the same way?

Current command can work in this way, It seems that name "ID" can be misund=
erstood.
The id=3Dobject0 is OK here. I will change the "id" to "object-name".
Thank you for clear the comments.

Thanks  =20
Chen


