Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4409B3AE413
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:01 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvEIm-0002SB-AU
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 03:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvEHq-0001mP-2O
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:24:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:58154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvEHl-0007iU-CX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:24:01 -0400
IronPort-SDR: pVu816W8rRJEBJAqi4mZVndWPKV4Pn48fHixibXaQFWKXLf6qSlLYJANluGMoRtDeqbMWxG+1O
 dItZZiWGK6cg==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="267934140"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="267934140"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 00:23:52 -0700
IronPort-SDR: Ql8XevipaQdORSw6TPSKaYKZNgVMQwMlKAVBImYqxxpr9VOri+MWZcLB2dkrm+UFuE2rxDmgBl
 m6RQB5cuiChA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="416986136"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2021 00:23:51 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 21 Jun 2021 00:23:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 21 Jun 2021 00:23:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 21 Jun 2021 00:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWj1p9QeAEuhzx4KHH8HM3stPcP57OJcryg2xirPFyvD+3mtpiUXk5TU1FMD+sOxlFPuvQgJ1yBhDgfOzt0TmzDAASVOCMz1isA3wU3tEclqm+fzn0R/CkF/IO2eNMSRzFDhmSKzqXxCZbuXlWjuixb3CNFGdJGAq3txCfNfm+BVSRrm0u/ZID4HN3vD5QhDwXbxfx7mb23+mL7Pp9nMFZFm9YfRWpEAKS0atZiW8dMQcUuGIUf3oc6Ynw4pf1qmhazTGMwR8SH8Hng1WfaqRWv4u/mpN8UBiOdrFwZE4uvOxaAXrJlalmrbXa81uf9uA0KyGF6W04AQfEJP4XVJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtfF0/q3rqL2k8fgjIYW+A9LsDMxOnkk8t2jJ/7RAoE=;
 b=Op9lXY5ZwYqcIQWO2Mt9F65nihzbO785H5c0/MKm+mHAQBIS6h9trq1f/BMh56h3F0TK+6Egvbrx/L9JVKcVPb1ZNfbRBkFzQy01O+SStL827PWetPNAjtTi0xES/KnU6gULsvn91mszESvSFu4ue2E1dn8dRhGgdqqUZ6FTU1+l8mLAj5YESZ2VJx9jUZXXI6C0KKUhVJ0UQxU0J/FDtDhycw3W2KFSX3hDXba+P2Lxh8/Cx2WsvSbs6zgyGNQV8I0lncLQs0ZOhF5I2r0C2Yf3THtXvrhY4p1tPCx6EKuts2KDJSpvHvzkfmncLPb/hyAujy1HEx48YHBRNLO8pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtfF0/q3rqL2k8fgjIYW+A9LsDMxOnkk8t2jJ/7RAoE=;
 b=ekJRQkhvGQzPtZ2piE2hyIUcLLBRZSh8g2T+HLdVeLanqhPComQuOLJnJXvYp8K2mYF+oC7/F9fdGtEqLTcvWWEerqVeFn+Zq7fTlqkgRcYpsaqNp6FE6yGplocIbLcE9ZgsZzvMmmH97fYmvuTF5obsn/g6h8H1IN27W0BwkMs=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Mon, 21 Jun 2021 07:23:47 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 07:23:47 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Thread-Topic: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
Thread-Index: AQHXZDIfHJcen+WIR0WYeKfsyBDVzasZtNJAgARWmQCAAAPZEA==
Date: Mon, 21 Jun 2021 07:23:47 +0000
Message-ID: <DM8PR11MB57176186A481ACE8F5924AB8AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
In-Reply-To: <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eec3136-35ac-4f89-4013-08d9348582a8
x-ms-traffictypediagnostic: DM6PR11MB4659:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB465997B9EB1F7123A084D92AAF0A9@DM6PR11MB4659.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LWvFPPD/N7E9oAUWbhLUcUD3Q7CgJq/seY+dTCcsV0fswgvFzNpqNKPUM0NI+b+WhBUvTGoHnNMZhExv0alB/AtotVNzh0erunkCveAQypEHMkwz144Fc+rj+zywjHn+9DIQAN38b3MydfAiWpFRmiDQRFLwDL7IZhKypLVNorRalUIXm21Bdiqu8MmU5Wohv6pI7nS16dfyWO+U7QcAyvp48WD6BD5z3016QRFDkMMBYZ6CMYi+qPo+khoDGJQYjTDFfmAUVw8t38U6lmhWNrJNh8lrFJt4bxrrwTPOSG5w7IH4Ke4qULRJeo4mHhlM0vSO4kJbs/rIXUmLp+1AyadAn+nFyrkry2pXBlIKl6CTsdpaDTGXVcafpqZJ8/Bi0fELeuXr4j9Lo96XH99PVKCnq4kAPeYZ6oY0qMY+bPXZFiwCPQ0IzYn1I/YxKkO5klueqEh32Eqqns7GloMwB+F/UA9l75FyWAypd+rZ9QZxXSafWBMXYvi11sO+IIGJ+sgVe3tFn624qK+D0slx0TbQiDCZwUlNmkooLC1Tkznf3aXxJ8AeM48WUq0lFB7FPAAVNakEkQaH317uM4ZRGwoQmczeRVYIwlJhFBcnjiA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(39860400002)(136003)(346002)(2906002)(66446008)(66476007)(66556008)(53546011)(64756008)(66946007)(71200400001)(7696005)(76116006)(6506007)(26005)(4326008)(122000001)(5660300002)(107886003)(8936002)(55016002)(316002)(38100700002)(9686003)(6916009)(86362001)(52536014)(83380400001)(8676002)(186003)(478600001)(33656002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHJxWGdxaVJzZWMyL21xZFJXRzRMVkxxcXZzUGxPL0l3UDJXQkYzbE1pRlpt?=
 =?utf-8?B?U0dObFJrL2ZtZ0dtRXZFcVRiRGhZVGxFaWpUYlR3MURoR3BMTlZRbDZlNzR0?=
 =?utf-8?B?UFY0QXdRbmR6TGZJVGppdE9LcmZodTlQVjdocGF1REUyVWEzM1JtRzQwTHpz?=
 =?utf-8?B?MVdiTXJkVVNYQ3VXMkl6K3N2cGF5NGw5c2JsdU9VTGRYaTU5Mm5JM3pDKy9Q?=
 =?utf-8?B?b1NOSFJtcS9BZjFXdEJoMFY1YXliZTkxQThTa0U4dmZIbHJEYVJ1ZnoyVm9G?=
 =?utf-8?B?YUxCQndsZG5Pdzloeldrd1FVRFRTZE9JMWdZekgvVjE2aHBqakZTdXZyWXQx?=
 =?utf-8?B?VEkxNW9HVU5lR1VxUFdqMEppVXVxWVhUVWdLODk4RnFVN0hYNjVYOVJERCtF?=
 =?utf-8?B?d1daeGRhYjYyYlArU0ZMNUdlU2tzU1EvMnFFRTkrVGVQQlNUVXFCK2Z0amRp?=
 =?utf-8?B?K1d1QTBrVkJuc3Q2VFdvTFdENUNXVmYyMDR1RTNjR3JkUHhzeTJPOEE1clcv?=
 =?utf-8?B?MFFrMVRsQTNQcm53bE1GZU8yOG11YTFJcTQrNGx4Q21NOUtoMlJDMllQc2Fi?=
 =?utf-8?B?bzRtZDJtUXhQbkgzb29Wa1NMMTFOeEVNdTlFM2Z1QytEdXg2RWsrZEdjUHVI?=
 =?utf-8?B?RXoxMUFwRFc5b2QyVU9ZSVhLdHE3Nkg0OE8wYVNpNFJMVldjNmN1UXd2YmlL?=
 =?utf-8?B?QnhHaSs5aWMyc3A0SmcwMVE5dk5XODhrbzYzMmN3K1p5ZU1aQW1qcmdoV3dw?=
 =?utf-8?B?TXJEdlYxNmNoQ1czbzBaNkJDemdBTHNJL0d1aEFoVXdNck5VM2UvMXdKZDJK?=
 =?utf-8?B?eWlLV1ZIR1kyMmdqVnkrSXRZeThyQldqOGpVa2hHaFVuN0FiZjFDRDMxSGsx?=
 =?utf-8?B?d1N3OHJCMnYxdHJIeGRNUEVFZ01scTg5ZTFva1AwUlRHK0p1Y3pHeVhxeWRp?=
 =?utf-8?B?ZVJyazV6aDh6eDQrMjBPdXRyeEVYSDVPeHViU0gzVWNCQU9OM2lQdFlFMXNQ?=
 =?utf-8?B?OGlCbk85akJTdGZhdTdyY25wZC9SdjFMdnFwV3RGTWV5YXpsdU5tSWVlQmZS?=
 =?utf-8?B?YkJkTVFpQlVXaDVmUzFqc2hPc0tQS014a2ZEdjBmNGlFM1hISFNobFkxbEs4?=
 =?utf-8?B?NElndFl2d001Tm9lb2tadG4wTm9Jek9na1FJd0I3eXJCN2ZrM0RUQlhWY1B6?=
 =?utf-8?B?WGVUbHJLd3hzTHlGNFVFbnVlMDdWNVdBempaVURlSFNuaWRBSzhYelQ2V2xz?=
 =?utf-8?B?NGo4TjZId2xtc2ZkdUg4eFErMzRBa2RGU2tDcGF3cGdXeXVTS0xmOTdCWDY1?=
 =?utf-8?B?dzJmbi9Ed0hMRzMyT1dNUnFnUHhuZVk3VWFYMDYreVZpOFJwV05FZXAwQ05M?=
 =?utf-8?B?RUY5SWpVUEk0ZlI3RnVQWEpjTkFhbytyQXNmU0FLTVVrb09XNlZLTWFvcVQz?=
 =?utf-8?B?QUtlZThYdSs5cStocG1JZWFkWEc1RW95ajc5TVpRbEdCYlRveWtIWjl0Vm9T?=
 =?utf-8?B?ZTBwb20rNG4zZ1lOZ3g1UHlQMVZFdlRISU1ZdGNveTRnTWp0SUxvbzBib2Ix?=
 =?utf-8?B?OVZhclN5dm9WSFBuQ0VaYkg4NlZhVnRtOUk2c2xmSjMvV2JDWHl4bmplekpN?=
 =?utf-8?B?dlB1Mit1Q0NGa3hRS3JiWTBpR0toR01EZ1A2SWJVcUZmRGp4WHdyUlZ6YTFS?=
 =?utf-8?B?bGZZaHN0K01rNXF5VEFtMjAvL0IzUlVrekVuOXFVUlNwR01SZEpnVm1BWkty?=
 =?utf-8?Q?PICPkDT3bz+Mk0gqG3+kI1BRpenn+f9P3fa7huV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eec3136-35ac-4f89-4013-08d9348582a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 07:23:47.5670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSRUxFr/I5K9nq9k6dUGA4axGgmU97+JBG72X5KcQN5MN3hSs9Z8EIq4T9NN7pjYsTosCYtsqFr6ehe+St6x3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=swee.aun.khor@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, "eblake@redhat.com" <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgR2VyZCwNCg0KU3RhcnQgY291bnRpbmcgZnJvbSB6ZXJvIG1ha2VzIHNlbnNlIHRvby4gIE1h
dHRlciBvZiB0YXN0cy4gIFdlIGhhdmUgZXhhbXBsZXMgZm9yIGJvdGggaW4gdGhlIHFlbXUgc291
cmNlIHRyZWUuICBTbywgd2hhdGV2ZXIgeW91IHBpY2ssIHRoaXMgY2xlYXJseSBuZWVkcyBkb2N1
bWVudGF0aW9uIChpbiB1aS5qc29uIG9wdGlvbiBkZXNjcmlwdGlvbikuDQpzd2VlYXVuOiBTdXJl
LCBJIHdpbGwgbWFrZSBzdXJlIHRoYXQgaXMgbWVudGlvbmVkIGNsZWFybHkgaW4gZG9jdW1lbnRh
dGlvbi4gIA0KDQpXZWxsLCB3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUgbW9uaXRvcj08
bnI+IHdvcmsgZm9yIGJvdGggZnVsbC1zY3JlZW49b24gYW5kIGZ1bGwtc2NyZWVuPW9mZiBjYXNl
cz8NCnN3ZWVhdW46ICBZZXMuIFRoYXQgd2lsbCBiZSBiZXR0ZXIgb3B0aW9uIGZvciB1c2VyLiBI
b3dldmVyLCBJIG5vdCBtYW5hZ2VkIHRvIGZpbmQgb3RoZXIgR1RLIHdpbmRvdyBBUEkgdGhhdCBj
YW4gc2V0IHdpbmRvdyBpbnRvIG1vbml0b3IgcmF0aGVyIHRoYW4gZ3RrX3dpbmRvd19mdWxsc2Ny
ZWVuX29uX21vbml0b3Igc28gZmFyLiAgICANCg0KV2VsbCwgdGhhdCBwcm9iYWJseSBkZXBlbmRz
IG9uIHRoZSBkaXNwbGF5IHNlcnZlciBhbmQgbWlnaHQgZXZlbiBiZSBjb25maWd1cmFibGUuICBJ
J3ZlIHNlZW4gZGlmZmVyZW50IHdheXMgdG8gaGFuZGxlIHRoYXQsIG1vc3QgY29tbW9uIG9uZXMg
YmVpbmcgKGEpIGRvIG5vdGhpbmcgb3IgKGIpIHRyeWluZyBtb3ZlIGFsbCB3aW5kb3dzIHRvIHRo
ZSBtb25pdG9yIHdoaWNoIGlzIHN0aWxsIGNvbm5lY3RlZC4NCkkgZG9uJ3QgdGhpbmsgcWVtdSBo
YXMgdG8gd29ycnkgbXVjaCBoZXJlLCBhbmQgdHJ5aW5nIHRvIGF1dG9tYXRpY2FsbHkgYWRhcHQg
dG8gaG90LXBsdWdnZWQgbW9uaXRvcnMgbWlnaHQgZXZlbiBoYXZlIGJhZCBpbnRlcmFjdGlvbnMg
d2l0aCB3aGF0ZXZlciB0aGUgZGlzcGxheSBzZXJ2ZXIgaXMgZ29pbmcgdG8gZG8uDQpzd2VlYXVu
OiBBbHJpZ2h0LiANCg0KUmVnYXJkcywNClN3ZWVBdW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiANClNlbnQ6IE1v
bmRheSwgSnVuZSAyMSwgMjAyMSAyOjUyIFBNDQpUbzogS2hvciwgU3dlZSBBdW4gPHN3ZWUuYXVu
Lmtob3JAaW50ZWwuY29tPg0KQ2M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNv
bT47IFJvbWxpLCBLaGFpcnVsIEFudWFyIDxraGFpcnVsLmFudWFyLnJvbWxpQGludGVsLmNvbT47
IGVibGFrZUByZWRoYXQuY29tOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IEthc2lyZWRkeSwgVml2
ZWsgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB1
aS9ndGs6IEFsbG93IHVzZXIgdG8gc2VsZWN0IG1vbml0b3IgbnVtYmVyIHRvIGRpc3BsYXkgcWVt
dSBpbiBmdWxsIHNjcmVlbiB0aHJvdWdoIG5ldyBndGsgZGlzcGxheSBvcHRpb24NCg0KICBIaSwN
Cg0KPiAiIFlvdXIgbmV3IG9wdGlvbiBhcmd1bWVudCBzZWVtcyB0byBjb3VudCBtb25pdG9ycyBm
cm9tIDEsIHdoaWxlIEdUSyBjb3VudHMgdGhlbSBmcm9tIHplcm8uICBXaHkgdGhlIGRpZmZlcmVu
Y2U/Ig0KPiBzd2VlYXVuOiBJdCBpcyBkdWUgdG8gZ3RrX3dpbmRvd19mdWxsc2NyZWVuX29uX21v
bml0b3IgbW9uaXRvciBpbmRleCBpcyBzdGFydGVkIGZyb20gemVyby4gSSBhbSBub3QgdXNpbmcg
emVybyBhcyBzdGFydGluZyBpbmRleCBvZiBuZXcgb3B0aW9uIGFyZ3VtZW50IHRvIG1ha2UgZWFz
aWVyIGZvciB1c2VyLiBFeGFtcGxlLCBpZiB0aGVyZSBpcyAyIG1vbml0b3JzLCB0aGVuIGFyZ3Vt
ZW50IG9wdGlvbiBjYW4gYmUgbW9uaXRvciAxIG9yIDIuIExhc3QgbnVtYmVyIHdpbGwgbWF0Y2hl
ZCB3aXRoIHRvdGFsIG1vbml0b3JzIHdoaWNoIGNhbiBhdm9pZCBjb25mdXNpb24gZm9yIHVzZXIu
IFRoYXQgaXMgbXkgdGhvdWdodC4gICANCg0KU3RhcnQgY291bnRpbmcgZnJvbSB6ZXJvIG1ha2Vz
IHNlbnNlIHRvby4gIE1hdHRlciBvZiB0YXN0cy4gIFdlIGhhdmUgZXhhbXBsZXMgZm9yIGJvdGgg
aW4gdGhlIHFlbXUgc291cmNlIHRyZWUuICBTbywgd2hhdGV2ZXIgeW91IHBpY2ssIHRoaXMgY2xl
YXJseSBuZWVkcyBkb2N1bWVudGF0aW9uIChpbiB1aS5qc29uIG9wdGlvbiBkZXNjcmlwdGlvbiku
DQoNCj4gIllvdXIgZG9jdW1lbnRhdGlvbiBzdGF0ZXMgdGhhdCBAbW9uaXRvciBhcHBsaWVzIG9u
bHkgImluIGZ1bGwgc2NyZWVuIiwgYnV0IHRoaXMgY29kZSBpcyBub3QgZ3VhcmRlZCBieSBpZiAo
b3B0cy0+ZnVsbF9zY3JlZW4pLiAgV2h5IGlzIHRoYXQgb2theT8iDQo+IHN3ZWVhdW46IEl0IGRv
ZXNu4oCZdCBuZWVkIHRvIGJlIGd1YXJkZWQgYnkgaWYgKG9wdHMtPmZ1bGxfc2NyZWVuKSwgYXMg
Z3RrX3dpbmRvd19mdWxsc2NyZWVuX29uX21vbml0b3Igd2lsbCBlbmFibGUgdGhlIGZ1bGwgc2Ny
ZWVuIGJ5IGl0c2VsZi4gIA0KDQpXZWxsLCB3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUg
bW9uaXRvcj08bnI+IHdvcmsgZm9yIGJvdGggZnVsbC1zY3JlZW49b24gYW5kIGZ1bGwtc2NyZWVu
PW9mZiBjYXNlcz8NCg0KPiBzd2VlYXVuOiBCYXNlZCBvbiBteSBvYnNlcnZhdGlvbiwgd2hlbiBz
cGVjaWZpYyBtb25pdG9yIGRldmljZSBkaXNjb25uZWN0ZWQgYWZ0ZXIgUUVNVSBsYXVuY2hlZCBv
biBpdCwgUUVNVSBhcHBsaWNhdGlvbiB3aWxsIG5vdCBiZSB2aXNpYmxlIGJ1dCBRRU1VIGFwcGxp
Y2F0aW9uIHN0aWxsIHJ1bm5pbmcgYW5kIHNjcmVlbiBmcmFtZWJ1ZmZlciBzaXplIGlzIG5vdCBi
ZWluZyBjaGFuZ2VkIGF0IGFsbC4gUUVNVSBhcHBsaWNhdGlvbiB3aWxsIGJlIHZpc2libGUgb25j
ZSB5b3UgY29ubmVjdCBiYWNrIHRoZSBtb25pdG9yLiANCg0KV2VsbCwgdGhhdCBwcm9iYWJseSBk
ZXBlbmRzIG9uIHRoZSBkaXNwbGF5IHNlcnZlciBhbmQgbWlnaHQgZXZlbiBiZSBjb25maWd1cmFi
bGUuICBJJ3ZlIHNlZW4gZGlmZmVyZW50IHdheXMgdG8gaGFuZGxlIHRoYXQsIG1vc3QgY29tbW9u
IG9uZXMgYmVpbmcgKGEpIGRvIG5vdGhpbmcgb3IgKGIpIHRyeWluZyBtb3ZlIGFsbCB3aW5kb3dz
IHRvIHRoZSBtb25pdG9yIHdoaWNoIGlzIHN0aWxsIGNvbm5lY3RlZC4NCg0KSSBkb24ndCB0aGlu
ayBxZW11IGhhcyB0byB3b3JyeSBtdWNoIGhlcmUsIGFuZCB0cnlpbmcgdG8gYXV0b21hdGljYWxs
eSBhZGFwdCB0byBob3QtcGx1Z2dlZCBtb25pdG9ycyBtaWdodCBldmVuIGhhdmUgYmFkIGludGVy
YWN0aW9ucyB3aXRoIHdoYXRldmVyIHRoZSBkaXNwbGF5IHNlcnZlciBpcyBnb2luZyB0byBkby4N
Cg0KdGFrZSBjYXJlLA0KICBHZXJkDQoNCg==

