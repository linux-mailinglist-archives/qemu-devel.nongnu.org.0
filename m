Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6560049B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 02:50:04 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okEKR-00066a-Al
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 20:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEIE-0004TT-Lq; Sun, 16 Oct 2022 20:47:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEIA-0003Wm-TM; Sun, 16 Oct 2022 20:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665967662; x=1697503662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CPe/Jmm9GeUTUkWtWrtHQJl5c7F1yBDCB2hGVgLWIQ4=;
 b=RlMZL9Ary8pyOkeCE8eCaOiDk7eiA8udP6rbcTuLVH4wn+cjDhzwA3FC
 vKGS9SuD6KzIbIhgMTtP0yioL7P/N3vZoVhW7M+XdlXrcKKo5kHdOLRKn
 WyPIHeaSyR5rVLlCxNuNxb8ifWqDQSRL41I7o0iFImp9AXwHHJty2kDVW
 OPw+KONwgCrdqsDhxkNbce3ONqXk4TGzcwRfsSjMxjt8jLEkKSR8EYx8o
 JbViJFZCjXQstTa0PZqqVcd0QNCQLGyV3iGCW/T60ZokTl+75eUXZLpdX
 jYZOK6097MCgB1T27dFyw+07t9xDjDa5Xuk6xM0cuZ7bNBavm+wjZmg0q Q==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219122701"
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:47:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwcDHhH/Wboe2c5yepH/EkQeHsvcwUKiMdL53unc9yxFBJ8jrOG7l98a3jFsGcsCHA++3dLGvQogkBQ+PB/r8/6buqH4vvIDGWZtpGXwkXRNCE2BF2GpODyLVSwIjiiUIkrz1YeOptwmfH/SzQcIgatMiLuuqlttvhcMv2HU5r6YfFstxToFC7vAVLnXqf2upYPJp1M0qL895FW3z+0zfwU3/rC50styoqG+rwi9w6LHJE2Cta8eXyZtYMsosJ6fnBGXANAzdNlfs0iLJ/WhXsayJ7Fxrm6FenD0/eRAKvJkucLs12aH5zacsEZpvU+VrnCSZ1usEateaG84RqaieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPe/Jmm9GeUTUkWtWrtHQJl5c7F1yBDCB2hGVgLWIQ4=;
 b=XuGgzDtbQ6Vs0DJd5qjBTTPnDpPqGecnexJGLomS0aQeVX4+jEsUGgclESRYBcNj4Q3iOUYH8M3nQVBDOH6RQ3BzY4n7j3XwbP/Y4GP3Cp7Z8vL4cpcFcO0QgGjjKfrqdeaGIFmqMid3SX2fG42MlJU0tl93Zb6k5Q8Pn4hElGNqI7zJWwz7INULZfsXk4gNqQThZyye0ZDXyzeLYJ63I/DySb43Du4rOvsln6Q8ZPPvlXrpHhShgRie9fpdMTDzciGde0ePUhwX41fLVjkrjtZpNCs91mCX4F4rSbd445RthwjMT60iRIpgwiZj4IrZC6dVlXLH4BCuGUBpG1DwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPe/Jmm9GeUTUkWtWrtHQJl5c7F1yBDCB2hGVgLWIQ4=;
 b=IVmkbDTUYQz3NP16/ruyrRxoc1SlLsQK0R8MtJ2JSDNIDvdRqkogIgsMHu+e8z1qx6TzHHlST4P0vU3z1HxmGIQrrTaLaNj8qdwhSUuiACDRYu7Omk7Ys+TpfEAoJyDyzvGfwksHxqFC6L5M+6JrOcOlTmM8+q34fLlpjll6qFQ=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by SJ0PR04MB7472.namprd04.prod.outlook.com (2603:10b6:a03:294::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 00:47:33 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:47:32 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "eblake@redhat.com"
 <eblake@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 2/7] file-posix: introduce helper functions for sysfs
 attributes
Thread-Topic: [PATCH v12 2/7] file-posix: introduce helper functions for sysfs
 attributes
Thread-Index: AQHY4W7O+I1WlznMmkaEH5fW/WP3kq4RwTYA
Date: Mon, 17 Oct 2022 00:47:32 +0000
Message-ID: <742bfb087520aebafae915b742275a370ad38564.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-3-faithilikerun@gmail.com>
In-Reply-To: <20221016145110.171262-3-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|SJ0PR04MB7472:EE_
x-ms-office365-filtering-correlation-id: 2f075700-bfc2-4504-909d-08daafd92d4a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /NS3mRxo9J+Oc+VzWNhGhTPsPPLHyKgd2qdCYEglfAbUkrKCpCAyQotbQSZUNeoWkiaIorYaesSB5ldej7SoNWQ6wdFnVGMMMFGoevJLg59L6HVAjEYm8Avl7YVhpjwZSko/3kOlbl6LTL1CRUeuQy/WzWtft5lMly5R/7+ouSFDuD/Luw+tV1oMIlHWPoyFNIa1OZD0FqfW1LGfMgKfxoubFPuqCsWQhFayoQkalF98fg5vip4zJGAKCEPoJPKAQNKNQBaWJhWfvD2sJ4GGhBxkx78blZhoKL45cp6FQanZ7Ju8E6UftWUkdMiP4UlJD0BTKrvchzAnAIJ79ohCcIHg27WuK5b9sPJGSCHElAqgrmx6IH1LRg1ny3x3WbXkUUoga0BgTea95XEgcpTU3s4xhGtLCOWEHeyIEWxSb+oL+CdrHUNkgmK1j4MASPkZZbqTfs/jTJx7f8jMTFpokEc9gjx8s6aPBXUxXlpTvpLqhSJJS1D1MZV/h3+FD8Sig1dnHz7J26d6CLTUzEulS9CPXl9IH0I3SfPe0f/mnenw9yoriAgzoNRAbXwdGWmyaotL8+uEuaTwhT5XeQiqtc1atzfFfXS1UlB0DMvHQbw7n7bP1sgSWFwaEVrOP2wl26ckopbdMeQ9VSlqksB/L9szhrx+0xkCKNXCJWtTj9wBji7i2YLMvRCsZDo9doAfVHQrZxAhnXd1talFiXP2NcR6c01kYmBi8MFH0N7o49/Ol/rt2EVwOqGi0wV7uZ2GdAiajmUaGlw1XA17w6acaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(38100700002)(6486002)(478600001)(71200400001)(38070700005)(122000001)(82960400001)(4001150100001)(2616005)(186003)(316002)(8676002)(4326008)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(110136005)(76116006)(91956017)(6506007)(5660300002)(36756003)(26005)(41300700001)(6512007)(8936002)(7416002)(86362001)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkR5YVYwUFlaSU5xYkJyVUxLOWlleG5sb1lIOHJHVXh2SFkyK01UMWoxQkdB?=
 =?utf-8?B?RGovbGdVRUtWVWptQVJBOSsvYy91WVNyTmpRUy96STFEa0NVcTc5di9xV1Nv?=
 =?utf-8?B?WUxOMU11a21YU3pWQzlIZDdENGFrZzQzN2xGVWNUVFNXRVNkRzUyV3d6VFY2?=
 =?utf-8?B?ZURtWFE4R3RRdTYyYlJrS2FhR3hZTU1peHBzbURtV2p0V2JCcTZzRFd2VEFt?=
 =?utf-8?B?eGZ2NlBNMUFEQU9DdElVa3JFcTV0UkFlMEt0bXNsSVRCRDNlbnpyQ2NEaTFL?=
 =?utf-8?B?eWQ0TFExSm5mWStGeWVRa0QvUUlrTHl1RlR6UnNpbXNsbTZkNDVEc1VPdjl5?=
 =?utf-8?B?SFZUNmc3WEJKVTNTbC9sR3Y0QjcvbGZ2c0xiN2NTNUx4SGlPU2Y5SXJ5SC92?=
 =?utf-8?B?MExwMlU5Yldwc1BFZXlFRTJ5Z2dDK1pMakJNMkRrL251bFhTaDRZdklGWHpX?=
 =?utf-8?B?S2RCdU50YWQyeCtCS09lUnc0bnVndmFmQUk3aTlyQ0xMT0lOaHpPb1hKaDI1?=
 =?utf-8?B?NHdENFJoOU9ZMHozd2YvZ1NvekVOaUlTam50cnZ1Unl6TzVzRTlPRXIrNHdo?=
 =?utf-8?B?NDZzSEZ4K3g5RUVUK01wbWp4U094RDFxNThmODZpWStzY1pQMXdaUXhmSUJT?=
 =?utf-8?B?Wjc5OHlINVV3bTlBeGlBOXJmMHBoY0orZnFpN0QrMHFja2d4amFCajBVU3BN?=
 =?utf-8?B?UHRHS0gwbWdkWVlBVU9Falk0RjlOanMvN2NrVDh1dW1hUUVwWTBJUGVHRjha?=
 =?utf-8?B?UUpyM2t6aHliQ0U5SUp4Slk4d0hFSTB5WnNLVGtXTU5XSlg4anBSVmhGUDFJ?=
 =?utf-8?B?RU5wQlgxNDVVbnpUTUhMNDdhSzNDQWhPY3ZqOXNxRmZ2TW9FSDZvWm9kMGFu?=
 =?utf-8?B?cWtYTk5iRndMRVB2Z1A3VWlLWHBKVFZ5ZzdVK2xmL1FFU2EvRk8yMWRXMXpl?=
 =?utf-8?B?NTJhK2dKNlc3akpkWVVoYzZlM1VjNElLbzMwaG9aMlk2cDZVSGlndE9BdExI?=
 =?utf-8?B?R2NHaWJuZDQ4c3FCS3lLd2VEYmhSajdlVms3b3hlUnc1djJaTVVsb2NBVU11?=
 =?utf-8?B?R2Rzb013WnBZZVVjU0JNSjkzTWxTd0tjTzd5OGs2MUQrZzFHMjcyY1Uwa2FP?=
 =?utf-8?B?Ni9sMlJabHpXSG11NU01Y0ZJZFF4WHc0UnNtZERPVnRpdDJleXlJZHIyOUIr?=
 =?utf-8?B?K3RuR3pDd0Yva2c2bGg0SFRKMW0yV3JXTTk2c2xWNlJ4MWZCNGJ4MVpHMGxS?=
 =?utf-8?B?UUN6ZGJzdmZPNlFkYWlOOHZEWFA1SXBNS3lUcFA1Vi9MOU5vRVVjRUVraHNw?=
 =?utf-8?B?N0FBdTVRVkdtSFBSY1c4TVpIbGxDVGtvSVZLRVJ4bTJyYUp0UVo1OG9FYVZ6?=
 =?utf-8?B?NlJoV3Ruc1hXN1BoNGZkalZ1SWlLVWVMZzh6SlIzMDlwcXJ1d1JIcDdoNk1s?=
 =?utf-8?B?SWd4U1hUc1RMR1FLdllYNklQYStZeHdacHlueWMrWkpTbXQrNGxscGd5c0ho?=
 =?utf-8?B?b3dSMEE2WHhRaHk2aHIveFBuWCt4eUxhQXBmS1l1U3JvVmZXUUZHNWVZSUNx?=
 =?utf-8?B?cU5tMDNNMlNyc3NlWXdMdlJ3aSs1VGNHWWwxWWNQZzlsRThjVGd6VVZYUDYx?=
 =?utf-8?B?RTRTU0RhUUpUVmUwQnJUUUxMZGpoZkY4RHQ5VFFFQnlqTHFtaTZoRWsyMGNN?=
 =?utf-8?B?VURPVVcwUE5YVE80VnFBUFRhb1NpM0Y1WE0vLzVQL0h1ZlpxRjhTRXdGN1M3?=
 =?utf-8?B?dk84eEFObWJhT2o2ZGE4MzNlSHRUSGZQUzgrcDlCRjA0Slp6ZFUvTk93cytt?=
 =?utf-8?B?RkN6MTlsZW5ZNUV6eVFtOCt3bUNjSS9VMlZXQ0FwdGtjNnFHMWN6ZnZsWEdp?=
 =?utf-8?B?QzJlY2Fwd084TnphbllVempiK3ZSL1U2RFhtWVFNbUZFd0oxN1dJRXh5YnpD?=
 =?utf-8?B?TWdMYTZuUXYyTElTdnVZOWxGYTJoVG41YmI1VitrS1BwdktBbnkwWENWdzk4?=
 =?utf-8?B?cEk2bG9kcS9hQWQ3d3hEdlFSQUtkZ0FQelFNSDU3OXhBSnRPWlk1TGVhN2hT?=
 =?utf-8?B?UU52MUp2L1N6WG1aSEx3YWdwV3l1anhVa05XRmZUSExqcWxjb29SUUgyU2s5?=
 =?utf-8?B?VHlEVTNGVHArbXFqRlAzdFJ3d2dJd1d0ZytlbTVaSjlhQU5JWm9JN01DNGVO?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <730B11C9B2201F4E9D565151A4C25BCE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f075700-bfc2-4504-909d-08daafd92d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:47:32.8659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvXrFMIVOwXwwgNn8WOCo5LDgqwXhAhQALo27yDW/US3kghVFw91RFwPfBcrSD/hOo+HsL44XFy3W0oc1t/lqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7472
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIyOjUxICswODAwLCBTYW0gTGkgd3JvdGU6Cj4gVXNlIGdl
dF9zeXNmc19zdHJfdmFsKCkgdG8gZ2V0IHRoZSBzdHJpbmcgdmFsdWUgb2YgZGV2aWNlCj4gem9u
ZWQgbW9kZWwuIFRoZW4gZ2V0X3N5c2ZzX3pvbmVkX21vZGVsKCkgY2FuIGNvbnZlcnQgaXQgdG8K
PiBCbG9ja1pvbmVNb2RlbCB0eXBlIG9mIFFFTVUuCj4gCj4gVXNlIGdldF9zeXNmc19sb25nX3Zh
bCgpIHRvIGdldCB0aGUgbG9uZyB2YWx1ZSBvZiB6b25lZCBkZXZpY2UKPiBpbmZvcm1hdGlvbi4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gTGkgPGZhaXRoaWxpa2VydW5AZ21haWwuY29tPgo+IFJl
dmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KPiBSZXZpZXdlZC1ieTog
U3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgo+IFJldmlld2VkLWJ5OiBEYW1p
ZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEBvcGVuc291cmNlLndkYy5jb20+CgpSZXZpZXdlZC1i
eTogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9taWNoZXZAd2RjLmNvbT4KCj4gLS0tCj4gwqBi
bG9jay9maWxlLXBvc2l4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTI0ICsrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiDCoGluY2x1ZGUvYmxvY2svYmxvY2tfaW50LWNv
bW1vbi5oIHzCoMKgIDMgKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAz
NiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYmxvY2svZmlsZS1wb3NpeC5jIGIvYmxv
Y2svZmlsZS1wb3NpeC5jCj4gaW5kZXggMjNhY2ZmYjlhNC4uOGNiMDdmZGI4YSAxMDA2NDQKPiAt
LS0gYS9ibG9jay9maWxlLXBvc2l4LmMKPiArKysgYi9ibG9jay9maWxlLXBvc2l4LmMKPiBAQCAt
MTIwMSw2NiArMTIwMSwxMTIgQEAgc3RhdGljIGludCBoZGV2X2dldF9tYXhfaHdfdHJhbnNmZXIo
aW50IGZkLCBzdHJ1Y3QKPiBzdGF0ICpzdCkKPiDCoCNlbmRpZgo+IMKgfQo+IMKgCj4gLXN0YXRp
YyBpbnQgaGRldl9nZXRfbWF4X3NlZ21lbnRzKGludCBmZCwgc3RydWN0IHN0YXQgKnN0KQo+IC17
Cj4gKy8qCj4gKyAqIEdldCBhIHN5c2ZzIGF0dHJpYnV0ZSB2YWx1ZSBhcyBjaGFyYWN0ZXIgc3Ry
aW5nLgo+ICsgKi8KPiArc3RhdGljIGludCBnZXRfc3lzZnNfc3RyX3ZhbChzdHJ1Y3Qgc3RhdCAq
c3QsIGNvbnN0IGNoYXIgKmF0dHJpYnV0ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hhciAqKnZhbCkgewo+IMKgI2lmZGVmIENP
TkZJR19MSU5VWAo+IC3CoMKgwqAgY2hhciBidWZbMzJdOwo+IC3CoMKgwqAgY29uc3QgY2hhciAq
ZW5kOwo+IC3CoMKgwqAgY2hhciAqc3lzZnNwYXRoID0gTlVMTDsKPiArwqDCoMKgIGdfYXV0b2Zy
ZWUgY2hhciAqc3lzZnNwYXRoID0gTlVMTDsKPiDCoMKgwqDCoCBpbnQgcmV0Owo+IC3CoMKgwqAg
aW50IHN5c2ZkID0gLTE7Cj4gLcKgwqDCoCBsb25nIG1heF9zZWdtZW50czsKPiArwqDCoMKgIHNp
emVfdCBsZW47Cj4gwqAKPiAtwqDCoMKgIGlmIChTX0lTQ0hSKHN0LT5zdF9tb2RlKSkgewo+IC3C
oMKgwqDCoMKgwqDCoCBpZiAoaW9jdGwoZmQsIFNHX0dFVF9TR19UQUJMRVNJWkUsICZyZXQpID09
IDApIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IC3CoMKgwqDCoMKg
wqDCoCB9Cj4gK8KgwqDCoCBpZiAoIVNfSVNCTEsoc3QtPnN0X21vZGUpKSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVOT1RTVVA7Cj4gwqDCoMKgwqAgfQo+IMKgCj4gLcKgwqDCoCBpZiAo
IVNfSVNCTEsoc3QtPnN0X21vZGUpKSB7Cj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PVFNV
UDsKPiArwqDCoMKgIHN5c2ZzcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiL3N5cy9kZXYvYmxvY2sv
JXU6JXUvcXVldWUvJXMiLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYWpvcihzdC0+c3RfcmRldiksIG1pbm9yKHN0LT5z
dF9yZGV2KSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXR0cmlidXRlKTsKPiArwqDCoMKgIHJldCA9IGdfZmlsZV9nZXRf
Y29udGVudHMoc3lzZnNwYXRoLCB2YWwsICZsZW4sIE5VTEwpOwo+ICvCoMKgwqAgaWYgKHJldCA9
PSAtMSkgewo+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0VOVDsKPiDCoMKgwqDCoCB9Cj4g
wqAKPiAtwqDCoMKgIHN5c2ZzcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiL3N5cy9kZXYvYmxvY2sv
JXU6JXUvcXVldWUvbWF4X3NlZ21lbnRzIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFqb3Ioc3QtPnN0X3JkZXYpLCBt
aW5vcihzdC0+c3RfcmRldikpOwo+IC3CoMKgwqAgc3lzZmQgPSBvcGVuKHN5c2ZzcGF0aCwgT19S
RE9OTFkpOwo+IC3CoMKgwqAgaWYgKHN5c2ZkID09IC0xKSB7Cj4gLcKgwqDCoMKgwqDCoMKgIHJl
dCA9IC1lcnJubzsKPiAtwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gK8KgwqDCoCAvKiBUaGUg
ZmlsZSBpcyBlbmRlZCB3aXRoICdcbicgKi8KPiArwqDCoMKgIGNoYXIgKnA7Cj4gK8KgwqDCoCBw
ID0gKnZhbDsKPiArwqDCoMKgIGlmICgqKHAgKyBsZW4gLSAxKSA9PSAnXG4nKSB7Cj4gK8KgwqDC
oMKgwqDCoMKgICoocCArIGxlbiAtIDEpID0gJ1wwJzsKPiDCoMKgwqDCoCB9Cj4gLcKgwqDCoCBk
byB7Cj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IHJlYWQoc3lzZmQsIGJ1Ziwgc2l6ZW9mKGJ1Zikg
LSAxKTsKPiAtwqDCoMKgIH0gd2hpbGUgKHJldCA9PSAtMSAmJiBlcnJubyA9PSBFSU5UUik7Cj4g
K8KgwqDCoCByZXR1cm4gcmV0Owo+ICsjZWxzZQo+ICvCoMKgwqAgcmV0dXJuIC1FTk9UU1VQOwo+
ICsjZW5kaWYKPiArfQo+ICsKPiArc3RhdGljIGludCBnZXRfc3lzZnNfem9uZWRfbW9kZWwoc3Ry
dWN0IHN0YXQgKnN0LCBCbG9ja1pvbmVNb2RlbCAqem9uZWQpCj4gK3sKPiArwqDCoMKgIGdfYXV0
b2ZyZWUgY2hhciAqdmFsID0gTlVMTDsKPiArwqDCoMKgIGludCByZXQ7Cj4gKwo+ICvCoMKgwqAg
cmV0ID0gZ2V0X3N5c2ZzX3N0cl92YWwoc3QsICJ6b25lZCIsICZ2YWwpOwo+IMKgwqDCoMKgIGlm
IChyZXQgPCAwKSB7Cj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IC1lcnJubzsKPiAtwqDCoMKgwqDC
oMKgwqAgZ290byBvdXQ7Cj4gLcKgwqDCoCB9IGVsc2UgaWYgKHJldCA9PSAwKSB7Cj4gLcKgwqDC
oMKgwqDCoMKgIHJldCA9IC1FSU87Cj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IMKgwqDCoMKgIH0KPiAtwqDCoMKgIGJ1ZltyZXRdID0g
MDsKPiAtwqDCoMKgIC8qIFRoZSBmaWxlIGlzIGVuZGVkIHdpdGggJ1xuJywgcGFzcyAnZW5kJyB0
byBhY2NlcHQgdGhhdC4gKi8KPiAtwqDCoMKgIHJldCA9IHFlbXVfc3RydG9sKGJ1ZiwgJmVuZCwg
MTAsICZtYXhfc2VnbWVudHMpOwo+IC3CoMKgwqAgaWYgKHJldCA9PSAwICYmIGVuZCAmJiAqZW5k
ID09ICdcbicpIHsKPiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gbWF4X3NlZ21lbnRzOwo+ICsKPiAr
wqDCoMKgIGlmIChzdHJjbXAodmFsLCAiaG9zdC1tYW5hZ2VkIikgPT0gMCkgewo+ICvCoMKgwqDC
oMKgwqDCoCAqem9uZWQgPSBCTEtfWl9ITTsKPiArwqDCoMKgIH0gZWxzZSBpZiAoc3RyY21wKHZh
bCwgImhvc3QtYXdhcmUiKSA9PSAwKSB7Cj4gK8KgwqDCoMKgwqDCoMKgICp6b25lZCA9IEJMS19a
X0hBOwo+ICvCoMKgwqAgfSBlbHNlIGlmIChzdHJjbXAodmFsLCAibm9uZSIpID09IDApIHsKPiAr
wqDCoMKgwqDCoMKgwqAgKnpvbmVkID0gQkxLX1pfTk9ORTsKPiArwqDCoMKgIH0gZWxzZSB7Cj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PVFNVUDsKPiDCoMKgwqDCoCB9Cj4gK8KgwqDCoCBy
ZXR1cm4gMDsKPiArfQo+IMKgCj4gLW91dDoKPiAtwqDCoMKgIGlmIChzeXNmZCAhPSAtMSkgewo+
IC3CoMKgwqDCoMKgwqDCoCBjbG9zZShzeXNmZCk7Cj4gKy8qCj4gKyAqIEdldCBhIHN5c2ZzIGF0
dHJpYnV0ZSB2YWx1ZSBhcyBhIGxvbmcgaW50ZWdlci4KPiArICovCj4gK3N0YXRpYyBsb25nIGdl
dF9zeXNmc19sb25nX3ZhbChzdHJ1Y3Qgc3RhdCAqc3QsIGNvbnN0IGNoYXIgKmF0dHJpYnV0ZSkK
PiArewo+ICsjaWZkZWYgQ09ORklHX0xJTlVYCj4gK8KgwqDCoCBnX2F1dG9mcmVlIGNoYXIgKnN0
ciA9IE5VTEw7Cj4gK8KgwqDCoCBjb25zdCBjaGFyICplbmQ7Cj4gK8KgwqDCoCBsb25nIHZhbDsK
PiArwqDCoMKgIGludCByZXQ7Cj4gKwo+ICvCoMKgwqAgcmV0ID0gZ2V0X3N5c2ZzX3N0cl92YWwo
c3QsIGF0dHJpYnV0ZSwgJnN0cik7Cj4gK8KgwqDCoCBpZiAocmV0IDwgMCkgewo+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+ICvCoMKgwqAgfQo+ICsKPiArwqDCoMKgIC8qIFRoZSBmaWxl
IGlzIGVuZGVkIHdpdGggJ1xuJywgcGFzcyAnZW5kJyB0byBhY2NlcHQgdGhhdC4gKi8KPiArwqDC
oMKgIHJldCA9IHFlbXVfc3RydG9sKHN0ciwgJmVuZCwgMTAsICZ2YWwpOwo+ICvCoMKgwqAgaWYg
KHJldCA9PSAwICYmIGVuZCAmJiAqZW5kID09ICdcMCcpIHsKPiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gdmFsOwo+IMKgwqDCoMKgIH0KPiAtwqDCoMKgIGdfZnJlZShzeXNmc3BhdGgpOwo+IMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4gwqAjZWxzZQo+IMKgwqDCoMKgIHJldHVybiAtRU5PVFNVUDsKPiDC
oCNlbmRpZgo+IMKgfQo+IMKgCj4gK3N0YXRpYyBpbnQgaGRldl9nZXRfbWF4X3NlZ21lbnRzKGlu
dCBmZCwgc3RydWN0IHN0YXQgKnN0KQo+ICt7Cj4gKyNpZmRlZiBDT05GSUdfTElOVVgKPiArwqDC
oMKgIGludCByZXQ7Cj4gKwo+ICvCoMKgwqAgaWYgKFNfSVNDSFIoc3QtPnN0X21vZGUpKSB7Cj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChpb2N0bChmZCwgU0dfR0VUX1NHX1RBQkxFU0laRSwgJnJldCkg
PT0gMCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gK8KgwqDCoMKg
wqDCoMKgIH0KPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9UU1VQOwo+ICvCoMKgwqAgfQo+
ICvCoMKgwqAgcmV0dXJuIGdldF9zeXNmc19sb25nX3ZhbChzdCwgIm1heF9zZWdtZW50cyIpOwo+
ICsjZWxzZQo+ICvCoMKgwqAgcmV0dXJuIC1FTk9UU1VQOwo+ICsjZW5kaWYKPiArfQo+ICsKPiDC
oHN0YXRpYyB2b2lkIHJhd19yZWZyZXNoX2xpbWl0cyhCbG9ja0RyaXZlclN0YXRlICpicywgRXJy
b3IgKiplcnJwKQo+IMKgewo+IMKgwqDCoMKgIEJEUlZSYXdTdGF0ZSAqcyA9IGJzLT5vcGFxdWU7
Cj4gwqDCoMKgwqAgc3RydWN0IHN0YXQgc3Q7Cj4gK8KgwqDCoCBpbnQgcmV0Owo+ICvCoMKgwqAg
QmxvY2tab25lTW9kZWwgem9uZWQ7Cj4gwqAKPiDCoMKgwqDCoCBzLT5uZWVkc19hbGlnbm1lbnQg
PSByYXdfbmVlZHNfYWxpZ25tZW50KGJzKTsKPiDCoMKgwqDCoCByYXdfcHJvYmVfYWxpZ25tZW50
KGJzLCBzLT5mZCwgZXJycCk7Cj4gQEAgLTEyOTgsNiArMTM0NCwxMiBAQCBzdGF0aWMgdm9pZCBy
YXdfcmVmcmVzaF9saW1pdHMoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsCj4gRXJyb3IgKiplcnJwKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicy0+YmwubWF4X2h3X2lvdiA9IHJldDsKPiDCoMKg
wqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoCB9Cj4gKwo+ICvCoMKgwqAgcmV0ID0gZ2V0X3N5c2Zz
X3pvbmVkX21vZGVsKCZzdCwgJnpvbmVkKTsKPiArwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4gK8Kg
wqDCoMKgwqDCoMKgIHpvbmVkID0gQkxLX1pfTk9ORTsKPiArwqDCoMKgIH0KPiArwqDCoMKgIGJz
LT5ibC56b25lZCA9IHpvbmVkOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IGNoZWNrX2Zvcl9k
YXNkKGludCBmZCkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ibG9jay9ibG9ja19pbnQtY29tbW9u
LmggYi9pbmNsdWRlL2Jsb2NrL2Jsb2NrX2ludC0KPiBjb21tb24uaAo+IGluZGV4IDg5NDdhYmFi
NzYuLjdmNzg2M2NjOWUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ibG9jay9ibG9ja19pbnQtY29t
bW9uLmgKPiArKysgYi9pbmNsdWRlL2Jsb2NrL2Jsb2NrX2ludC1jb21tb24uaAo+IEBAIC04MjUs
NiArODI1LDkgQEAgdHlwZWRlZiBzdHJ1Y3QgQmxvY2tMaW1pdHMgewo+IMKgCj4gwqDCoMKgwqAg
LyogbWF4aW11bSBudW1iZXIgb2YgaW92ZWMgZWxlbWVudHMgKi8KPiDCoMKgwqDCoCBpbnQgbWF4
X2lvdjsKPiArCj4gK8KgwqDCoCAvKiBkZXZpY2Ugem9uZSBtb2RlbCAqLwo+ICvCoMKgwqAgQmxv
Y2tab25lTW9kZWwgem9uZWQ7Cj4gwqB9IEJsb2NrTGltaXRzOwo+IMKgCj4gwqB0eXBlZGVmIHN0
cnVjdCBCZHJ2T3BCbG9ja2VyIEJkcnZPcEJsb2NrZXI7Cgo=

