Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298CB3CCFC0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:01:34 +0200 (CEST)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5P9Z-00075m-7x
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5P8M-0006Nv-9D
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:00:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:6648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5P8J-00072T-Mu
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:00:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211016636"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="211016636"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="414794203"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 19 Jul 2021 02:00:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 19 Jul 2021 02:00:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 02:00:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 02:00:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPpjndYXJph1EkCf3fq6pbxCzkixWG4eNoCpJMxn+W1jJBZ8RdAGt/ER7otfi8k2HQuFpmSLVKgN5NPTy0SHqJpuhMyRnhr8mJfLlIslDanVy+dKijZLLF6bztLPLiXP4XafK6wFI7gO9L5yN02Edje9Gd4ETSocChMT0xvdIk515tYlTM/I/bQey17s+VVePJRviHcqVJD0RHEhJG7eZOswxOn9HuiNVFvbmkFYxhfwhsmPBj1ze2N6zoLUdODrxUrWZg3tTkJHqjX39PRkPRLCZEv1cwEOwftJBrldEqAfJkoWzNIii1BFcEfCBoQ2j7xvS/E38ou5CZXnmKa76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B73kuBAQQDLvwRLvmnIE+T+jmPPwDlNOSmPhPXRim/8=;
 b=PAjm6ZGufNSqyLrDPfk4FeMyxPy55vCO7L383wtN6cd0ZqAg2GcnkO0M5NXxBev8bvviKXeSJDK8MmNjig9eJRa+mLfKjqn3Oy63tQ/IwStPzPrxuyxlx2gcrQlCJl7gZnhkLv60P79xWJYFsODxv+uMaRiKJKGuG1CJSnisR61zxXlBF+7Hrc6uNbc17duOgtbDhQhGRuePtEljjx1BvgaObo4BthfN3TlFjj+MgFuTpdpSG8D+TxiEgqfaqu+VMGzg7zPizYTxI7DpIll6pZtiTRQ7eff+DwpssL88vf4MEkc2MzzcQo33Vtspt1hPQc1KHvtxhSwTAbLKDivS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B73kuBAQQDLvwRLvmnIE+T+jmPPwDlNOSmPhPXRim/8=;
 b=gFBTrfOJGa1sA1n/yQ3Vf6Jl18TeeCeEvRaTYWy3yiTFjPmUdyfZwVivwDiF1SxatwYRXgnzpFoSObugIGNI/7aE+Q6LLjA9k8URg4A0CUQw7pyyCc0uEQKCO+PbRQU0v+lqU55bdZGJRNVfmyKTHiHhWIE4NwgY1WER6xgb5S8=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN6PR11MB1265.namprd11.prod.outlook.com (2603:10b6:404:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 09:00:05 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6%9]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 09:00:05 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PULL V2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Thread-Topic: [PULL V2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Thread-Index: AQHXbloWOO+a9uR+c0GNA0i7TSlx+qtC5MsAgACJzqCAABZDAIAGlz9w
Date: Mon, 19 Jul 2021 09:00:05 +0000
Message-ID: <BN0PR11MB575705AC91B6BECCAFB2A4379BE19@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210701091130.3022093-1-chen.zhang@intel.com>
 <20210701091130.3022093-4-chen.zhang@intel.com> <YO8xWHrtParXqSip@work-vm>
 <BN0PR11MB57570940435B251AA6D8DF3F9B129@BN0PR11MB5757.namprd11.prod.outlook.com>
 <09927fb3-7971-c989-906c-e93cd3114b8c@redhat.com>
In-Reply-To: <09927fb3-7971-c989-906c-e93cd3114b8c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5e60d0d-ca4a-490b-8a44-08d94a939a04
x-ms-traffictypediagnostic: BN6PR11MB1265:
x-microsoft-antispam-prvs: <BN6PR11MB1265BE467B994C0E664E401C9BE19@BN6PR11MB1265.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k1f/5hCMD1mvBNf/0qMVDoui8QkeODnmPV4U9nGl90Bp0N+oeed/pWpb68dfWlScPmmVk+JdMa2W9NFqtx/JpK8co1a0Y+t/srIqWYxlZ/a4NobHz4rGpkML5VHQwoNAevnUipXgpvmd2/lakJC1eYmXXnZemubfZe6bWUzmLY8GFdl2loFn3niuOLoUH6I0SFTnUAnoQFXXSSTN5h3QUgBcEHRq7bfoKPZgB5p3o1Kdi7zsVfbPBlhuEQh53U5lZM+Z0E4c7/cVEy6Le5e+Db+ebKYTkNNFqze4WHIJa/8zcaL8azhDB5vVFvDOIqkfwmhsJ40gudggr1o4spGrDg+tX1CIbDRLyQscsg/UkA9dOBzsVmegDQKvdzDCVvimhoV/thKou4/dSHhfYw+wUPvM3YPqSI1znHcfmEU+t1YhjqYW+263vuqFYEdPBBkSfSixc4ZFot6YiqvwkkMCc/VJUlHFHAU43ZPPc5ESRgv/MDDD9JQGVpISh1hKGOtwHYgqJ7PMHYPcUXqDuHLC9wA5keVPyBIZvvAaiVZJXc+HxrWtlHji7pQ0LOpy9XgtN1yWCmnFHomRYrSYB5ZhLHAjyvwM4zMGWE5rYcE1snEPxaBJjs2/q71pJGrWm/lmTKlsaDZh+lCjgdbLjvtfbCsluUK7Nwn2fMZdIqLTG43R7xASvkwvoE7u/y8DSdIYhtVwwFHCZ3EvAFwA9mE9Qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(4744005)(83380400001)(6506007)(53546011)(7696005)(66446008)(52536014)(64756008)(2906002)(38100700002)(122000001)(186003)(55016002)(316002)(110136005)(54906003)(26005)(86362001)(76116006)(66476007)(66946007)(8676002)(5660300002)(66556008)(8936002)(4326008)(508600001)(33656002)(9686003)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlZBWGhCTHRnVjRjNW5BclNQVFBNUDdhRVo3YnB0ZUM5Vkh6Mm1OZDZ2aG84?=
 =?utf-8?B?a1YzWnJ6WUtrbWc3Zm5zbkRPaWl0NmJlMnVIOElZbHY1VjVKaEJLcW5yUk1s?=
 =?utf-8?B?Z0VoeGh0OGZFODRIbkJOMDk5TkZLRXhERC9KSEFlWVM5RHhqNFY3V2p4QnVV?=
 =?utf-8?B?bXRHdHMzeVJQOE1hbHhsZGV0dHc1eTlleHpaaG10dTFVWnZqR09jTEw0SVRX?=
 =?utf-8?B?aGdWNWxXTkNPdDVzRDRsbFBtOHRIOFZ0VUxTU2FyVDFtVWhQSTN0Y1hLeFFE?=
 =?utf-8?B?OXVXVjdLUXdqT3RQMzlUSVNBcGo2aW9KTnFIa0l3a3Vkc25FMGFBQXQ1UGhh?=
 =?utf-8?B?RDVCcGc2bjNzcXEyeGtPWWFrbjlMRTd1RGdWcWFQa3BMdFlsZWU2UzJhYWp0?=
 =?utf-8?B?UWpnVjdNMjRtNmRKN1VBaWlXLzVlVitYZ20yN0NxV0thTnduWHNpcld3U1Fs?=
 =?utf-8?B?ajNJdld4cUVZQTNqOEw5MFBxejBFVEdQcjl0L3lLWVN3R0VxamFZS0tiR0tQ?=
 =?utf-8?B?OGVUd2lzaUNBOEZNb3dxL1FCV3Q4djBvdlM2UmQrQ3VaMGtGRTRPemZFYXI1?=
 =?utf-8?B?cVVaT2xPVjFucVZOUWxCTnNpdmRKMU5VWW1Ud3JXc1YrZzcwMGwxVVJjZGxx?=
 =?utf-8?B?c2p5MU5VaHRkSmt3VmFOTkF6bE5EdFA2S01OdTBqc0JKMXhUWTg4RDhjUlAr?=
 =?utf-8?B?ZE44ajRwL0dPZGlSNGhKbG54dEQyekpmcGFYMlRramJtVzBkTTJnR3lMaVNV?=
 =?utf-8?B?UlAxcVlBbjhDWGp1TXFqT1lZTE1EcUR1MFRkWjdXWS96enY0K2VFR3pwNXE3?=
 =?utf-8?B?cUsvY0hrRXpFV1gxTzV4SWRrWXdzVk1lV1BsZzcveWJBUndXU3M1Z0RnTXJR?=
 =?utf-8?B?SWNLRlhDQThycFI2Y05lTXhYZGhIMng5QTExQTZrTldzNkkyYkhoTkxOb1hL?=
 =?utf-8?B?UGZlcFVXelBxM2hySmI1V3FHck9lWUMwK2RpdW9TSlhZN0JjSVBVTEp0czJK?=
 =?utf-8?B?SmFPRkRmZGpTUXVGYitlbXhLOXpzRVJDd0luM3ArRVY0TEpPcUtoZGltd2Iv?=
 =?utf-8?B?RFhUQUUyOWZPVHhyZ3FhUkxBOHBuUjdpV0d2Si9qOUh1cmdqVEhNUjRVRXFh?=
 =?utf-8?B?UlRtUFlCYXZlbWtXeXhUaEU2UUx1TXJGY3dEcXRVK3RBZFpYZkVIRmxENldV?=
 =?utf-8?B?ZS9XVXdmNVRZZkMrWDlmZzBFazNJMWt3NFVRclA2YnpSY3Z1TFlGSU5xc2tt?=
 =?utf-8?B?cExBUDFJYmxJcWkvczZUZ3Bvd0s4WXIxTitzemwvNnArV1hUellaUlJURVlE?=
 =?utf-8?B?aytEbmp0RGoyakVjWlhWeHBGTklXK3I0SExIUkZVRnEvVFhjVzUzRFA3SjlD?=
 =?utf-8?B?OUtWRFZ1ZmJOUU5hbUErbDBmRGxRdDU2c3JMNnhQZFZzVkdWSnlqME93RTRZ?=
 =?utf-8?B?cFd5ejdKS1JsMGF1TCtsSmFxNW5WZFk4Z1dPWkR0QkZhS3c3clhESXRzRnNx?=
 =?utf-8?B?L1ROSEIrT0pqbFRPSTBqYjMxT2ExdGxSRlBqWEUrR21XRk9TdTdlUzVrWkxo?=
 =?utf-8?B?c1A5TVJXNWJvMFBlQ3RTNUV4QTRLNEY2eWZCMWJSM1MvNU5tVmw0dEhvYkVi?=
 =?utf-8?B?RlN6dUI0SEU4S0Y5VzdZNnRnU2JrWHlYZDkxTEROM2Q5blZNbUxtTnk4Q0NB?=
 =?utf-8?B?VkZ3VGlSTXpmR0tDNzRnVC9PcDdKVlBDYURmRDZLcEhTUWgvbjBIcUxqR1dD?=
 =?utf-8?Q?BXPlwDpmLkp7j0KwGfPiUx/BMWL6Jru1DhhgJ+e?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e60d0d-ca4a-490b-8a44-08d94a939a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 09:00:05.3177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /cqh0ReYYzfWOs2MAjbbnlFti64g3o+pclmNww2QwST6cFm48HxQNWJvI1dSPUUoJVUf/VChp4qBZGzrtt6fKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1265
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMTUsIDIwMjEgMTI6MjEg
UE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47IERyLiBEYXZpZCBB
bGFuIEdpbGJlcnQNCj4gPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBNYXJrdXMgQXJtYnJ1c3RlciA8
YXJtYnJ1QHJlZGhhdC5jb20+DQo+IENjOiBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3Jn
PjsgRXJpYyBCbGFrZQ0KPiA8ZWJsYWtlQHJlZGhhdC5jb20+OyBEYW5pZWwgUC4gQmVycmFuZ8Op
IDxiZXJyYW5nZUByZWRoYXQuY29tPjsgR2VyZA0KPiBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+OyBMdWthcw0KPiBTdHJh
dWIgPGx1a2Fzc3RyYXViMkB3ZWIuZGU+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCBWMiAzLzZdIGht
cC1jb21tYW5kczogQWRkIG5ldyBITVAgY29tbWFuZCBmb3INCj4gZmlsdGVyIHBhc3N0aHJvdWdo
DQo+IA0KPiANCj4g5ZyoIDIwMjEvNy8xNSDkuIrljYgxMTowNywgWmhhbmcsIENoZW4g5YaZ6YGT
Og0KPiA+IE9oLCBnb29kIGlkZWEuIEkgd2lsbCBxdWljayB1cGRhdGUgaXQuDQo+ID4gQnkgdGhl
IHdheSwgIHBsZWFzZSByZXZpZXcgb3IgdGFnIG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMu
DQo+ID4gTWF5YmUgd2UgY2FuIGNhdGNoIHVwIDYuMSBtZXJnZSB3aW5kb3cuDQo+ID4NCj4gPiBU
aGFua3MNCj4gPiBDaGVuDQo+ID4NCj4gDQo+IE5vdGUgdGhhdCB3ZSBwcm9iYWJseSBtaXNzIHRo
ZSBzb2Z0LWZyZWV6ZSBzaW5jZSBpdCdzIGFjdHVhbGx5IGEgbmV3IGZlYXR1cmUuDQo+IA0KPiBJ
dCBjb3VsZCBvbmx5IGJlIGRvbmUgZm9yIDYuMi4NCg0KT0ssIEkgd2lsbCBhZGQgZm9yIDYuMiB0
YWcgaW4gbmV4dCBwdWxsLg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gVGhhbmtzDQoNCg==

