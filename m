Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2B53B16A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 04:03:59 +0200 (CEST)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwaBq-0006qX-Na
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 22:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1nwa38-0001a8-4N; Wed, 01 Jun 2022 21:54:59 -0400
Received: from mail-sgaapc01on20702.outbound.protection.outlook.com
 ([2a01:111:f400:feab::702]:8832
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1nwa2i-0006c3-Qs; Wed, 01 Jun 2022 21:54:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYlEYpH/TQlsoltPAGg4pUoEZA2S3EUZ0uL8mNMUO7Kjt3dF4KpdqjSvmHsIiyhOFJE6pl9QbYhZ/PiUvmlGZ/ud68ZuZubDMnFwh4m0Sj4A3EnW4QVQSE/vpzKqSazYh2E6hM8ROFoJwhER9k1UTGSFjfFuGcToJrCFvANrQnriWI/ic6rlaMyZpQKBMoTmZc+GpaZTwIvAib1P3qz69dTY8AT9jNEbKIPTMbvM1GvVETnr/6h8POupyu+oCQd+N5GMBd36f2lebK6WYDJK6p4UAF7KDqXDwzylvspho/TdRAVy1KvWYP9Q9Q8kRJYf1IhPYXjUEUdK1qmc60F/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIw5acT83U5ayniWB0F+UCnVl26JwtCZYDpDeKNsZKk=;
 b=hqXVOvjiB9TsiYlsNyQSuGYmdb1Oj5b4AcXqUIqqYkRh3dm0CLp4NSynS42rMKFLvvg6KCvwyZbCD6zWixhy9qurfkSOIhWlHY+dQOsSo3KdKV5pF3HvJ5nV9IccH7Wj6E4DJCDFDQl0g7lL/KOQIS8YgGsHSqjS3plWhV5No85ZtR6tvwVpqc0Ea640ExW5L4VTiDBjBE25+inod7ZP4MF9pT/nj5qo3mZp/QbGGs6pdobAh7i/ZSYUASNnXEULOILUAvaBqz6DIgFMdsnRagqgtlp1rx6eEqbcGn59+KWJhAw0QIwZ2oehwVmCgAffdP+wLB6G0WBEG99RQFzg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIw5acT83U5ayniWB0F+UCnVl26JwtCZYDpDeKNsZKk=;
 b=YcfLF8Q0L5fjXaCcmQeFW0mH/R27DBzhQotIDUhJ334hyqP5xTvdm+ClTGEKGi0fKtuQtsJq5nUwrsSoliRQO80cdvrvpa1pwTQhCjHj9Qm5HxCUFME7j/nw42YqRg9ymXLao9pLxQ4QmB2QNZtJVU4Z7UEHFUFiAeQtVI/NGljAk3ZjsuRBFIaOY2iDysvm4Ai+uvB5uKrASvlDSO7A1QN1PBk6nMd+WOtJtfDiRof/zGB20lx6OpjfuXDBIMBhzvWuKrm2QJumC7KQ6DPtvSZk7wL3SQ1fhm/T3RdHp1x88H8TE3ks6oUr+/gu2njPuv3KGdIJ1fwQQPvHT7XkJQ==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by SI2PR06MB4345.apcprd06.prod.outlook.com (2603:1096:4:13a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 2 Jun
 2022 01:54:23 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::c800:46b0:8c3b:721c]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::c800:46b0:8c3b:721c%6]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 01:54:23 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Delevoryas
 <pdel@fb.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "zhdaniel@fb.com" <zhdaniel@fb.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>, Joe Komlodi
 <komlodi@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: RE: [RFC 0/1] i2c/aspeed: Add slave device handling in new register
 mode
Thread-Topic: [RFC 0/1] i2c/aspeed: Add slave device handling in new register
 mode
Thread-Index: AQHYcHkiArSjbEJPmkeaho3fgMD0c606LFaAgAE36UA=
Date: Thu, 2 Jun 2022 01:54:23 +0000
Message-ID: <HK0PR06MB2145F5C5899FA0C7B43FF0268ADE9@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <20220525205024.1158075-1-pdel@fb.com>
 <983fc0e3-6166-74d4-1164-161c277e4a96@kaod.org>
In-Reply-To: <983fc0e3-6166-74d4-1164-161c277e4a96@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9678e0d-5ae3-4c5e-a56a-08da443ad112
x-ms-traffictypediagnostic: SI2PR06MB4345:EE_
x-microsoft-antispam-prvs: <SI2PR06MB43457422CE1221484BF2F43D8ADE9@SI2PR06MB4345.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Hs2vXQ+Nlr3Umu7mXT6bLWBamef93CSjmh3cjE2LYyVTJC5iTiWamI+Aqh7BeePv/FjZ1JjDWsw4WyieFfShcfujvMa07IU7Nsg+ijoBrLGLknFghSMPLUJMagTqF402s8Q3d39V/WPkSoHBZXtd1iHbRe9J6aATHGglqB8hwawk4dBoL1AOg1ZRMWePJURwoxLBeWvqAQiP+kUcEUMvr3Xr2aDqxwDUSlnL/nJn/lPJaihSPfgkuupp5FTK8ueu+JfNRbshDGzmEXwkkUxwYLhXiEdvTMif+mFE46GQ+6Lj4Bx4r2iOup37mEYHvruwAx67mK8/jGa/92NR0qumr+cnXwOVZXAaHlmxrzpNIzAHmQNggPVrXA+5JaAUemok1p3wOQR37aHNQWnerMpeeG38VXSPRU95iXLPS4upiemqu3BUONBKZzQIo5DVU/BBEQMKbK5V/kG3Ptd62vIczK/NdylYyf4Dp4MQdXBblV2MSsYeMGSnDNQbpkDG+Tq8JjSSoR0az9dDjXyEU1IN35J6P+EQuR9YN+Cc18DfnMfi9vLuzLqtEqRTXWfEGj59B4WN2P2NzW0G6jNL3SODvVxAmMPBj1HJR022XihK69Rtpe7sLzgyv0gAFDO/Hz1CvSamClQf2sY8bYfgKbKcvcuAz8oOc/7+v5/r7nxsBquptdpdBHMekKt4nL7y3zY7Esbppq43OOfGLkKTm0jzAQrvbEfWNtOUrGLZsS376T/XsB2YyksoevrPAHMYLWyc2xbuITMSiM35zQCztDL90WVnZtPppPPBB+YsAufFzG6p37F/+JYKWZ4ub8oxi+WrWkvDduNVWkL9WRnLv4vFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(346002)(136003)(366004)(376002)(39850400004)(8936002)(186003)(38100700002)(55016003)(316002)(4326008)(66446008)(76116006)(110136005)(8676002)(66476007)(83380400001)(38070700005)(54906003)(64756008)(6506007)(66574015)(7696005)(41300700001)(86362001)(52536014)(53546011)(966005)(508600001)(5660300002)(66946007)(33656002)(66556008)(122000001)(9686003)(26005)(71200400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnZUUFVlSENXQjFWT0xZckVGVjRKOUxyTFNDdGcwTFZDeXJNQTN5TjNiZmo2?=
 =?utf-8?B?UGZYc1dNL2xTbURXMXp5L2FRQTR4TnkxUVl5S3pYOGJGK2FRb0RoVHJHbDZp?=
 =?utf-8?B?V2pKSG1wK1BOWGlMSU9iUVF6TEVBbVZQc09CU1l3WDJCOXdwVVMvWkljY0VY?=
 =?utf-8?B?SXBRUUFxbDhMTGZib2UzTGtmRDV3SCtrL0EvakxXN2F2TzgreFRmN1BLamc4?=
 =?utf-8?B?bXlaWm5IZEgxVkk5T09ZTlVGcmkySXFUODVMNGdZVGJNZk9RK3VDUnlSNVdQ?=
 =?utf-8?B?MVQ3dHlUald3cjRpcS9WL3FqOTBkS05XS3FJYWlmbW01d29xa3IyRWpVOVRo?=
 =?utf-8?B?SUZTVG0vYmVEMDc3Ymt1YzFHRTRCOWk5T0VaUG9xRzk5d2pqaHc2cndzOW01?=
 =?utf-8?B?Z09BYjNaZU1sS0x4TnVhU0w4V0NobHA1QkxYTVNsSlhXaGpmcWIybUhpSEs0?=
 =?utf-8?B?Yi9KQlF5Q0ZuYUk0N2plT0JaK0dtUjdlc1RWaXN6dTV1TW1aSmlOenFzVExI?=
 =?utf-8?B?M1VRNDhGYnZrUDR0Rnpqb1FKRHFGWXZEWHJmOU0vNmdWWXVHQVdlZGRWQWRL?=
 =?utf-8?B?K2ZqVWt2azRzYlN4MUNyY2luVVFDNW42RVQyY28xTjNmZWFubFo5c20yVk1y?=
 =?utf-8?B?ci9MdS90cmZlV0h2STFxZ0VRYnVYYVh2cFU0UmUxdnhmeXlidUNpZ3F4TGwv?=
 =?utf-8?B?SnVHQk04b1FTTTN3clVhYVh2YU5NTmxhK1lsNmZPdy9DOWhZUkEyVVRObk16?=
 =?utf-8?B?MUo2MHJBUGNzTEZBdmplTHYxbTJaSDZucXR4eUk5aVA0aERxYkY5bTM5K0tE?=
 =?utf-8?B?QnRxZm9uOUZJT01OV2V6aThiTlVleU5DdCsxNmw5WDJkU3RLZ0p2S2lLYW95?=
 =?utf-8?B?SFJ0c0VURkQ2SDFyM2JieTV1Rmt6c0hqcHBUdklqQWJQWnJiMDNkN3hxNTVQ?=
 =?utf-8?B?NUYyMXlpM3BTQ0ZCT2hlTlFRbXdvTStCN1JsSTcwSFppT2s2R1VkL0wwNFov?=
 =?utf-8?B?YUNjUEJyRjg1d05xU3VUVGl1Zy9xNEl0RU8zOUdQWWVSWGdOZDlETDNjV2l6?=
 =?utf-8?B?anpia3lyY2RuejlsMlV4UGNMODhWcWJUQUZNSTR2eWlTVGdYZnEwNEg3V2Q1?=
 =?utf-8?B?eW1UaVlGY3NJSXM0UGtqTUJDdFlhKy90dnJWZ0hXdW9ONnVrb0diOC8yYy9v?=
 =?utf-8?B?SG1xSDFEQ2Z1V0VzcnJDVUxxUzNnZFpNRVhXUGx5anA1M1BuK0E4NVduWjZ2?=
 =?utf-8?B?QXpPbUlBWEpNRWFyNkR1aDY2ZEVOTkxRSWl6MCs1TFU3TGdKQ1UxbnpXblk5?=
 =?utf-8?B?VjFoenU0VHVmWHhVanBsN0t2M2NNN0J1Ny9uQzNFeFlJRzBnQlY0NHlia2t3?=
 =?utf-8?B?Sk9oWjc3SzZ1cHdnUFVoL1JZSnZxQytDMjM3TUdzS2NNRWJTUkZQWmhheE5t?=
 =?utf-8?B?dDlDb2ZXRmtOb0tUME1xenNrWUVENFhtS0hWTVJzL3Q3bVRldDMzeGV6UlFW?=
 =?utf-8?B?VUViZWVObWJpSUZHOENGZHBTb1dXNnVOaThrYmhKRWVUci9OaVczdmRKbTJU?=
 =?utf-8?B?eW0xSlQrZTNOZCtXampUaVlpZDhHY3A0U2trbnozTnpkYjN3Vzd4T05iUEhp?=
 =?utf-8?B?ZjJSNG5KNjdPU1c2aHR5di8zRUIzekZnTkhYdlBFaDR3MkpIQWNTR2Rhc3Yy?=
 =?utf-8?B?UW04VHZ1ZUdkWmdzUmVsS0JrWVhMcWtVSzl1MXdTQS9qZEhqa1hIcWs5dHJz?=
 =?utf-8?B?dDZFNlpxV1BLLzRFRFVmZytPYmhTU0I4NTVuZ3J3ZWxQalRKZ0R4YUdORUJ1?=
 =?utf-8?B?YzhtS0JvRHdzQmtuOHlkcXlSdFNlNXJ4djgxbkpGcFFhQk4vc1NaK004NURP?=
 =?utf-8?B?R2ZSblFudG1ZUEx5d1FsY2VqbnE2UzdoK3MwbFcxUkloNGNoa3I1V1hmbVdE?=
 =?utf-8?B?WS84OUNBMXIvOFdCZEpuU1FxN2RNYnR1V1Y4NHg1cHlGSlFMM0VMRUgzSGZk?=
 =?utf-8?B?YXEvdHhNbVdROXhzMk1VVGE0U01MQk1lRjM1NFJHdXJ2TXJKOERRNEVERUda?=
 =?utf-8?B?cWVGSU9CTlZnNTBCeFM3ck5BRmUyZWM4dmpxK1lvZUtjWUhTb3FDUXJ6eGp1?=
 =?utf-8?B?OU43QTlrU1hLTmVkRVlrejFTdStRL0VnQnZPbUtrMEVWRWtzQThiUXpqcGE3?=
 =?utf-8?B?SWl1RjRFaWREV1VSZG1YMUQ0bjFidHUra3VXU1AxeEF4ZjZMVklFSnh5OVZN?=
 =?utf-8?B?Wnlrd2dkVTdhTStOWW41WllJVGxCencySVVZeXprb2hCMVFmUDlnOEVML3cy?=
 =?utf-8?B?YS9OUHJoUEl4YlorVklFcm9mcVkvRVg3ZmJ3bWRzeVQvcDd2OUFuUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9678e0d-5ae3-4c5e-a56a-08da443ad112
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 01:54:23.2173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5yJPZF4rQ1BhjX5P9C2ATf52r5bnKwWDWlgJIJLz+p7KQln5zgpUTAwFJI7N3OIEybB7vYwyqHTnjdOjUCJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4345
Received-SPF: pass client-ip=2a01:111:f400:feab::702;
 envelope-from=troy_lee@aspeedtech.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

SGkgQ2VkcmljLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxLCAy
MDIyIDM6MTAgUE0NCj4gVG86IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPiBDYzog
cWVtdS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyB6aGRhbmllbEBmYi5j
b207IFRyb3kNCj4gTGVlIDx0cm95X2xlZUBhc3BlZWR0ZWNoLmNvbT47IEphbWluIExpbiA8amFt
aW5fbGluQGFzcGVlZHRlY2guY29tPjsNCj4gU3RldmVuIExlZSA8c3RldmVuX2xlZUBhc3BlZWR0
ZWNoLmNvbT47IGsuamVuc2VuQHNhbXN1bmcuY29tOyBKb2UNCj4gS29tbG9kaSA8a29tbG9kaUBn
b29nbGUuY29tPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldw0KPiBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIDAvMV0gaTJjL2FzcGVl
ZDogQWRkIHNsYXZlIGRldmljZSBoYW5kbGluZyBpbiBuZXcgcmVnaXN0ZXINCj4gbW9kZQ0KPiAN
Cj4gWyBBZGRpbmcgSm9lIF0NCj4gDQo+IE9uIDUvMjUvMjIgMjI6NTAsIFBldGVyIERlbGV2b3J5
YXMgd3JvdGU6DQo+ID4gVGhlIEFTVDI2MDAvQVNUMTAzMCBuZXcgcmVnaXN0ZXIgbW9kZSBwYXRj
aGVzWzFdIGFuZCB0aGUgSTJDIHNsYXZlDQo+ID4gZGV2aWNlIHBhdGNoZXNbMl0gd2lsbCBiZSBy
ZWFsbHkgdXNlZnVsLCBidXQgd2Ugc3RpbGwgbmVlZCBETUEgc2xhdmUNCj4gPiBkZXZpY2UgaGFu
ZGxpbmcgaW4gdGhlIG5ldyByZWdpc3RlciBtb2RlIHRvbyBmb3IgdGhlIHVzZS1jYXNlcyBJJ20N
Cj4gPiB0aGlua2luZyBvZiAoT3BlbkJJQyBaZXBoeXIga2VybmVsIHVzaW5nIEFzcGVlZCBTREsg
ZHJpdmVyc1szXSkuDQo+ID4NCj4gPiBNeSB0ZXN0IGltYWdlcyBhcmUgb24gR2l0aHViWzRdLiBU
aGV5IGNhbiBiZSB1c2VkIHdpdGggdGhlDQo+ID4gYXN0MTAzMC1ldmIsIG9yIHRoZSBvYnkzNS1j
bCBhbmQgb2J5MzUtYmIgbWFjaGluZXMgaW4gdGhlIGZiIHFlbXUNCj4gYnJhbmNoWzVdLg0KPiA+
DQo+ID4gSSdtIHN1Ym1pdHRpbmcgdGhpcyBhcyBhbiBSRkMgY2F1c2UgSSBqdXN0IHdhbnQgdG8g
c2VlIGhvdyBvdGhlcg0KPiA+IHBlb3BsZSBleHBlY3QgdGhlc2UgY2hhbmdlcyB0byBiZSBtYWRl
IGJhc2VkIG9uIHRoZSBwcmV2aW91c2x5DQo+ID4gc3VibWl0dGVkICJuZXcgcmVnaXN0ZXIgbW9k
ZSIgYW5kICJvbGQgcmVnaXN0ZXIgbW9kZSBzbGF2ZSBkZXZpY2UiIHBhdGNoZXMuDQo+IA0KPiAN
Cj4gQ3VycmVudGx5LCBteSBwcmVmZXJyZWQgYXBwcm9hY2ggd291bGQgYmUgdG8gc3RhcnQgd2l0
aCBKb2UncyBwYXRjaHNldCBiZWNhdXNlDQo+IHRoZSByZWdpc3RlcmZpZWxkcyBjb252ZXJzaW9u
IGlzIGEgaHVnZSBlZmZvcnQgYW5kIGl0J3MgYWRkaW5nIG5ldyBtb2RlIHN1cHBvcnQNCj4gd2hp
Y2ggc2hvdWxkIGNvdmVyIHRoZSBuZWVkcyBmb3IgdGhlIEFTVDEwMzAgU29DIFsxXS4NCj4gDQo+
IFRyb3ksIGNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB0aGlzIGlzIE9LIHdpdGggeW91ID8gSSBo
YXZlIHB1c2hlZCB0aGUgcGF0Y2hlcw0KPiBvbiA6DQo+IA0KPiAgICBodHRwczovL2dpdGh1Yi5j
b20vbGVnb2F0ZXIvcWVtdS9jb21taXRzL2FzcGVlZC03LjENCj4gDQoNClllcywgSSdtIG9rIHdp
dGggdGhpcy4gV2UgaGF2ZSB0ZXN0ZWQgSm9lJ3MgcGF0Y2ggc2V0IGFzIHdlbGwuDQoNCj4gVGhl
biwgYWRkaW5nIHNsYXZlIHN1cHBvcnQgZm9yIG9sZCBbMl0gYW5kIG5ldyBtb2RlICh0aGlzIHBh
dGNoKSBzaG91bGRuJ3QgYmUNCj4gdG9vIG11Y2ggb2YgYSBwcm9ibGVtIHNpbmNlIHRoZXkgYXJl
IHNtYWxsLg0KPiANCg0KSSdtIGxvb2tpbmcgZm9yd2FyZCB0byBoYXZlIHNsYXZlIGRldmljZSBz
dXBwb3J0LCB3aXRoIHRoYXQgd2UgY291bGQgaGF2ZSBtb3JlIGZpcm13YXJlIHRlc3QgY2FzZSBp
biBRRU1VLg0KDQpUaGFua3MsDQpUcm95IExlZQ0KDQo+IHdlIGxhY2sgYSB0ZXN0IGNhc2UgZm9y
IHRoaXMgY29udHJvbGxlciBhbmQgd3JpdGluZyBhIEkyQyBBc3BlZWQgYnVzIGRyaXZlciBmb3IN
Cj4gcXRlc3QgaXMgbm90IGFuIGVhc3kgdGFzay4NCj4gDQo+IEl0IG1pZ2h0IGJlIGVhc2llciB0
byBzdGFydCBhbiBhc3QyNjAwLWV2YiBtYWNoaW5lIHdpdGggYSBsaWdodHdlaWdodCB1c2Vyc3Bh
Y2UNCj4gKGJ1aWxkcm9vdCwgSSBjYW4gaG9zdCB0aGF0IHNvbWV3aGVyZSBvbiBHSCkgYW5kIHJ1
biBzb21lIEkyQyBnZXQvc2V0L2RldGVjdA0KPiBjb21tYW5kcyBmcm9tIGEgcHl0aG9uL2V4cGVj
dCBmcmFtZXdvcmssIGxpa2UgYXZvY2Fkby4NCj4gSTJDIGRldmljZXMgY2FuIGJlIGFkZGVkIG9u
IHRoZSBjb21tYW5kIGxpbmUgZm9yIHRoZSBwdXJwb3NlLg0KPiANCj4gDQo+IFRoYW5rcywNCj4g
DQo+IEMuDQo+IA0KPiANCj4gPiBUaGFua3MsDQo+ID4gUGV0ZXINCj4gPg0KPiA+IFsxXQ0KPiA+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVsL2xpc3QvP3Nl
cmllcz02MjYwMjgmYXINCj4gPiBjaGl2ZT1ib3RoIFsyXQ0KPiA+IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVsL2xpc3QvP3Nlcmllcz02Mjc5MTQmYXINCj4g
PiBjaGl2ZT1ib3RoIFszXQ0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9Bc3BlZWRUZWNoLQ0KPiBC
TUMvemVwaHlyL2Jsb2IvZGIzZGJjYzljNTJlNjdhNDcxODA4OTBhDQo+ID4gYzkzOGVkMzgwYjMz
ZjkxYy9kcml2ZXJzL2kyYy9pMmNfYXNwZWVkLmMjTDEzNjItTDEzNjgNCj4gPiBbNF0NCj4gPiBo
dHRwczovL2dpdGh1Yi5jb20vcGV0ZXJkZWxldm9yeWFzL09wZW5CSUMvcmVsZWFzZXMvdGFnL29i
eTM1LWNsLTIwMjIuDQo+ID4gMTMuMDEgWzVdIGh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay9v
cGVuYm1jLXFlbXUNCj4gPg0KPiA+IFBldGVyIERlbGV2b3J5YXMgKDEpOg0KPiA+ICAgIGkyYy9h
c3BlZWQ6IEFkZCBzbGF2ZSBkZXZpY2UgaGFuZGxpbmcgaW4gbmV3IHJlZ2lzdGVyIG1vZGUNCj4g
Pg0KPiA+ICAgaHcvaTJjL2FzcGVlZF9pMmMuYyAgICAgICAgIHwgMTE4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystDQo+IC0NCj4gPiAgIGluY2x1ZGUvaHcvaTJjL2FzcGVlZF9p
MmMuaCB8ICAxNCArKystLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkNCj4gPg0KDQo=

