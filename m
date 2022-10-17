Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4F6004B2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 03:07:45 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okEbY-0007jM-Ek
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 21:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okERg-0002w8-D5; Sun, 16 Oct 2022 20:57:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okERd-0004xf-Nx; Sun, 16 Oct 2022 20:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665968249; x=1697504249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qYtK5HYINmY4mpneRKCPp6wt1AXMzaIViO4GGi5/SF4=;
 b=cm4va5TtfBalTeoNQH5tVPq6k1/G2ZTz/KWvnC4M1BgQxWgEG10Dzhtg
 l1nLfvQ8hMJo1M4TJyzZNCXc4o0RCGl7gbGS0dfpRSoSfmsi0J8iOUSuU
 yOOGLNCW9xkopm80JTO5AKqm6O1fRDQMYrw6Vts8lNvT4TrlKAIKexaAu
 tZcKXwt39p8V1zC+46x5kq6AMUO03hHGNdC4zlDUPNK2KoAEKVdibZDIf
 aCl6g7U90qtrj7YLbkYAa3cFVeZLxbYFEdG0/cXaRyjxF2UJpA5wVwXyF
 uXZSOQt7wZzkgJ65jx1/P7E+ez/GSI7HH246o1YboVHY6qUyt82gxeDev Q==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="213963290"
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:57:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EScm4qXXTin0fXLt1mRcYoTqmOnMuUQ9kMlRWmvXfyAI4S73wlDn03ZRw3xorEsIS2WKMyfbV4JmDa0RKbGsTCGxm2k/IbBUYtqywMRI/dKk5CXbqHHJDLo9bq6s4cb6qAbFKtZMajTvon0I4FLHLc2syPFuz3wIhHK8hzl2cSka39oR/+Ij8Koo/Z1Oh5Ykt9P3S5fhhRj/5b3uRBacBO0pBpItc+k3fCjTvAEJihWt92fgZ2Y4x3EMpoTVs8hw9vOVRZDEK2RtiJHz/1ofGOSVlgki2GfLCp3m2Lb6U1Zwcx6b8kWm3fqtV5O6lhgbpvZOVUy4HMu1xFGrv57M8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYtK5HYINmY4mpneRKCPp6wt1AXMzaIViO4GGi5/SF4=;
 b=jmayvtJJAjW2fN/5JLjHzn/7wR2x35LaQ+ZGgQImppjey1bHY2j40HInafk37Y/7LMsgudf2F5SB+0RaQhploO/AhxpFzJbmUPBlBCBbPB9T3NBD+EjPh/jXjvxKLcdWCOdVVBMX9/wYzrzYlxonZwziUCZ1eKGP/Yf2sB1zvozmfbEv+4DPWu/NEzAPIyYK9+/h6+ZB0jQLYo9x22ScbxMQpA3BIWF9JYw4LbUTHiqZziftVtC2l4bTA6zetXvIBhdHv3d/byYzhD1aF64W0KL8+r99flopjX11UPNdbfaWKNhJImj2SDfIOlx+Nv9MyceQGIf99YxUsGdVuqXlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYtK5HYINmY4mpneRKCPp6wt1AXMzaIViO4GGi5/SF4=;
 b=CsMWQf1h2jRT8VU4jhMYz5M2HbydxBL9DtC2X+dxkVxkqTJFAScwbon5VHguEOJjmTOC8Tz5lMFwHvvHJEaKaMN7Oyk+MfQ4SMpyWZYbUUQWmrtqqYmhUNEaRWxa2gzl/KAvIjMO3paOmgSv3k3qH7NT4vpoY3Y9CJRKGr54jdY=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MWHPR04MB0512.namprd04.prod.outlook.com (2603:10b6:300:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 00:57:21 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:57:21 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "eblake@redhat.com"
 <eblake@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 5/7] config: add check to block layer
Thread-Topic: [PATCH v12 5/7] config: add check to block layer
Thread-Index: AQHY4W7YTveYEemwZ0mn7I54KUDO+a4Rw/MA
Date: Mon, 17 Oct 2022 00:57:20 +0000
Message-ID: <39a059f5cad519dd066aca7357f2150c47b0a0dd.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-6-faithilikerun@gmail.com>
In-Reply-To: <20221016145110.171262-6-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|MWHPR04MB0512:EE_
x-ms-office365-filtering-correlation-id: 4aead4e6-9dcf-4dbd-a94d-08daafda8bc9
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eRlbWJhsA+YyeARg3n2yVlKQgsBbwc0EsiVTFX+Gw40SuKQ5B2vZFuNg1K7XKX5Uf5cPi86ha5pkWDqKoKMFXOBy7jO4LtA6H3nACL1peNXxhhCEhf5XUOLf5cCrQtyi7HcjrSZ/pZ+sYNm9tjz0ue2NKJ2KNbn0OBDsld8HCySb1r3TBCEr8w4rgyZw+pV3prZy7zDajtXNg6UF2luaU0seVK/xysuRQUGkZCpK2mBPsKNDX8bkMhXPh2sRgOxAPcJD8hui84mIPscWwnZbeLXSTFKrUqV+g+ayyGhHrYuZw+vJV/gXE8O3uY3I0fi1MvvUFYqxGOVUv7CUDBti8mvKZd/r36Nt7tsV/G41JfjqP73I2QtFzRkh1H6xWXnGZBR3vMWbU4axTbvvUagFcRsSbF5PEwGZsCLRtsXhpmcZpfHEQeZFX4fdrtpn0ru+ntSDd9CpLeB5TwNLEOqyUVjzUX07n08mS28h9AsmNERq0jJiE74cIfVhbHE5T8NBXrQQBILzK9hEnKs+BaofiHD5KbBBDfatyLsioRsX3Gyr2VRNO018HiiijrOXKPJRwUrKW/jtAgGtFuEuhwjIyrqd3Z9Gm3bNs8iCCDFk9grhMiCTKi6fXcVtFYd5efMI2c+ZC8NuZSGUk6B44GfCL7f5IAqa6/m1BCf9j1gm/ANC8mmcgbOSWnXI60PROuHUqooM2Ah4KjRpvDK4YKq5XXRGjaGaCtYmFIyIgd1o+M2uBPur3USPp/WeSx5t4MxMpmCTOrGzFHQ5Y0PhkODztQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(6506007)(71200400001)(478600001)(110136005)(54906003)(6486002)(66446008)(26005)(64756008)(8676002)(4326008)(91956017)(76116006)(66556008)(66946007)(41300700001)(6512007)(8936002)(5660300002)(7416002)(66476007)(2616005)(316002)(83380400001)(82960400001)(38070700005)(186003)(2906002)(4001150100001)(122000001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXRZREZ5ZW15QnVYSUVlRGlObWRqWldGcTlqUEJTeVo5NG5lNGU2SnJUTjMv?=
 =?utf-8?B?WEpoR2hDME5xa3Q0NmFpcVFHRlRENzF4Qmk1VnRoMFlmSzF1QXM1NS8wR2ND?=
 =?utf-8?B?c2ZrTGVFeS85Y1RPR3lhY3F1TVE2T2Y3QTNBMDIycFgxbFJNOXpNdDdOSkw5?=
 =?utf-8?B?a0lzczVSM3VHbUo4MThOMDczM3ZaajN2bVhhcVNLWTZTRi9ERmhvS2Z4THVZ?=
 =?utf-8?B?b3RJMkRFK2tUcHVlaC9ibkZheCsrbE9ZMVk5RVk0M2NNSXY0Q056NkpOTHph?=
 =?utf-8?B?eEdROTV4OGEweEF1dGRYU3VFaXVJT1o0d3VoQUY2c2U5WEdFQ2hqWG54NXBO?=
 =?utf-8?B?ZXE1MFFzMlVVTVlvc2MwRWhNVlN5Yno5ZVhxVVdZdG4xaUsyZWdzbHdVSC9U?=
 =?utf-8?B?ODIrdHBXSDlzS0ZjQjdvMmFBVnVKa3JWamgzVjVXT3MyeU5laG1UaVNYYjdX?=
 =?utf-8?B?WjdmUUE5cE0rbHRqN1F4WkVXMzhxbDU0OTIvYU4yUXZJb0Zmdk5oRy9QVWN5?=
 =?utf-8?B?dGUvUlBORlY5QWtrT2tYaGsvYmNaZ0NkMmpSVDhlZ1lLM1gzdVBzVmNjS0V6?=
 =?utf-8?B?eUZpSVZjVjZ6ZDFBZjBucUs5dm1XbkdGci9PSHVzRFZ4aXVQMkVwcWNHTDNi?=
 =?utf-8?B?aXkxUkxnRHJmV1pIY24zWEFwUjYvR3czSGt5bkxrdUpvRlNVamMrT2V2cldW?=
 =?utf-8?B?VlhGUVRSRGkyakVGenpWTUJzdmtJRHVKa0xhK00wZ0pJcEJBYnFCdDIveHpF?=
 =?utf-8?B?RjlHVDZYRm1RaWRMQ0hPSEszOEZ6ck5XOThPRG5nNWhhb0lzaWhVL3l0ZFBI?=
 =?utf-8?B?Mjg1SGlsZUJ4Z2x2alNndzg0MWpubmZCYnNjdDN5alVRRnJ0L29YRGZKN3pW?=
 =?utf-8?B?Rml1U0w1ZlZQZ2lIZVlqeWo0ZW5OY0hyU0tVNkJ6Y21qRkJkWFU3NTlici9w?=
 =?utf-8?B?azUrYnkwRXFVelpjaC9NV29wRGIxbXpSa2R2TGIxaXhIUlJMOEZ2Z2E4TnNZ?=
 =?utf-8?B?bVFYeE9Qd3Q4Z0JJcVJNcGJHQit5a3FpQmNIckJRaUVWNHdaL25RTWh1d1hp?=
 =?utf-8?B?aVRtN1R0bThTT3ZCSDhjdTZ5K1FxNU9YKzhKaHNDMmpUMVo5K0syZ2oxM25i?=
 =?utf-8?B?dFJFSGhRakVRWWlxd3huZ3Rzb0J5ZWVQTzM3cEVCclFIWmhQZm9XWkRULy9K?=
 =?utf-8?B?OU1Kc3g5Nm85c3JkdFhkWUF6RTVTS3ZpV29QUEFic1lZSC9vMWRuNjJBcDRy?=
 =?utf-8?B?SnVCK3hQRDlHdTVUNDVKRUg5QVkrMkh2ejgrQnBmdDJ6a2VJMTI3SE5Genh5?=
 =?utf-8?B?bDZ2Y2ZkbE9SNXBxMWZub0p5YXJxMEZIRFVuQzZMOHd3U2pOU0ZzNkRPTW1M?=
 =?utf-8?B?K2U4SEc3RHJQWG9STHVMbTBwTVhMbDE4cjNUVWRSenJvRjQrSG8vS2RGYTgv?=
 =?utf-8?B?dCtOcnFaYjJ5eVdScnJrbWZtei82Y1dmOEVNKzFsK25jbjNTYko3akxhejNx?=
 =?utf-8?B?YmxBTU05M1hTZ3dFbjl1b3dlSVJQNDF0VldFVHl3SnFQSWlqRDZzWE5oZU43?=
 =?utf-8?B?L05aakRYbnpqTVp3Y0pDNkhRRmtnYjdsems1ZlJGOXBOZnJjWkhaclRwSDRI?=
 =?utf-8?B?cCt3Y0h3Mjl3cDlwbXQ2eVBJcTZOQ0ZJUmlNMWhlRDQyTEN3ZDBUeGdwT2pB?=
 =?utf-8?B?bVlwcHFMU2lEdVVXYUNZWTdsc3VIRGJtZVZqRytSQVBtTkMvTDVFZ0YxbUZL?=
 =?utf-8?B?MHZlZ1poZlRXZ2VxMk5pcUNTcmY4eGQ2NUQyNnd4L04wc2JaeU1RQXRLSmZn?=
 =?utf-8?B?M3FhOXMwQXAySkhVUkx5elA5N2Uwa0MyT1oyYkFyTDBGeEdxMUZZQm8raG1s?=
 =?utf-8?B?Qnc1RTE4K2V2a29qYlBZVWJxWVVFRjRRQlJFTGtzSWM5dDV1bmhrbDdLajlN?=
 =?utf-8?B?R2FlS2V1bG43Q1IxZlY0QnUzTnhmWE55YjRCTTdvSmNHWUpqbmp0bzhnVG1M?=
 =?utf-8?B?eStvZWpRczVGYzlwWitRbmdQNUMxaU9HNjZ4QkNycURxbHBIaGNlcHNqeDVC?=
 =?utf-8?B?QktkcHp3ckd1cy9NU3NnTTVON0pLbmtETHJ3THY1WVRCODh1bDNaZVRNY1Na?=
 =?utf-8?B?WHNSYW1BeVVZUUwzbHdmeGxvTXpBSDd5REJrbEVtL2hHbElZVWg1UUgwaW5u?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51137A0D1986F449A398197C857FBD15@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aead4e6-9dcf-4dbd-a94d-08daafda8bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:57:20.9014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9KpENPbtX/nsB431e2dKYnqQFHCGx1i0lOw0q82RwbDfw7YsCB6j+DcIQTbgrykOczhR6xALWf6xeu7dTC5Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa5.hgst.iphmx.com
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

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIyOjUxICswODAwLCBTYW0gTGkgd3JvdGU6Cj4gUHV0dGlu
ZyB6b25lZC9ub24tem9uZWQgQmxvY2tEcml2ZXJzIG9uIHRvcCBvZiBlYWNoIG90aGVyIGlzIG5v
dAo+IGFsbG93ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtIExpIDxmYWl0aGlsaWtlcnVuQGdt
YWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQu
Y29tPgo+IFJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KClJldmll
d2VkLWJ5OiBEbWl0cnkgRm9taWNoZXYgPGRtaXRyeS5mb21pY2hldkB3ZGMuY29tPgoKPiAtLS0K
PiDCoGJsb2NrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiDCoGJsb2NrL2ZpbGUtcG9zaXguY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArKysrKysrKysrKysKPiDCoGJsb2NrL3Jhdy1m
b3JtYXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+IMKgaW5jbHVkZS9i
bG9jay9ibG9ja19pbnQtY29tbW9uLmggfMKgIDUgKysrKysKPiDCoDQgZmlsZXMgY2hhbmdlZCwg
MzcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay5jIGIvYmxvY2suYwo+IGlu
ZGV4IDFmYmY2YjllNjkuLjVkNmZhNGEyNWEgMTAwNjQ0Cj4gLS0tIGEvYmxvY2suYwo+ICsrKyBi
L2Jsb2NrLmMKPiBAQCAtNzk1MSw2ICs3OTUxLDI1IEBAIHZvaWQgYmRydl9hZGRfY2hpbGQoQmxv
Y2tEcml2ZXJTdGF0ZSAqcGFyZW50X2JzLAo+IEJsb2NrRHJpdmVyU3RhdGUgKmNoaWxkX2JzLAo+
IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+IMKgwqDCoMKgIH0KPiDCoAo+ICvCoMKgwqAgLyoK
PiArwqDCoMKgwqAgKiBOb24tem9uZWQgYmxvY2sgZHJpdmVycyBkbyBub3QgZm9sbG93IHpvbmVk
IHN0b3JhZ2UgY29uc3RyYWludHMKPiArwqDCoMKgwqAgKiAoaS5lLiBzZXF1ZW50aWFsIHdyaXRl
cyB0byB6b25lcykuIFJlZnVzZSBtaXhpbmcgem9uZWQgYW5kIG5vbi16b25lZAo+ICvCoMKgwqDC
oCAqIGRyaXZlcnMgaW4gYSBncmFwaC4KPiArwqDCoMKgwqAgKi8KPiArwqDCoMKgIGlmICghcGFy
ZW50X2JzLT5kcnYtPnN1cHBvcnRzX3pvbmVkX2NoaWxkcmVuICYmCj4gK8KgwqDCoMKgwqDCoMKg
IGNoaWxkX2JzLT5ibC56b25lZCA9PSBCTEtfWl9ITSkgewo+ICvCoMKgwqDCoMKgwqDCoCAvKgo+
ICvCoMKgwqDCoMKgwqDCoMKgICogVGhlIGhvc3QtYXdhcmUgbW9kZWwgYWxsb3dzIHpvbmVkIHN0
b3JhZ2UgY29uc3RyYWludHMgYW5kIHJhbmRvbQo+ICvCoMKgwqDCoMKgwqDCoMKgICogd3JpdGUu
IEFsbG93IG1peGluZyBob3N0LWF3YXJlIGFuZCBub24tem9uZWQgZHJpdmVycy4gVXNpbmcKPiAr
wqDCoMKgwqDCoMKgwqDCoCAqIGhvc3QtYXdhcmUgZGV2aWNlIGFzIGEgcmVndWxhciBkZXZpY2Uu
Cj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqAgZXJyb3Jfc2V0ZyhlcnJw
LCAiQ2Fubm90IGFkZCBhICVzIGNoaWxkIHRvIGEgJXMgcGFyZW50IiwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoaWxkX2JzLT5ibC56b25lZCA9PSBCTEtfWl9ITSA/
ICJ6b25lZCIgOiAibm9uLXpvbmVkIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBhcmVudF9icy0+ZHJ2LT5zdXBwb3J0c196b25lZF9jaGlsZHJlbiA/Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAic3VwcG9ydCB6b25lZCBjaGlsZHJlbiIg
OiAibm90IHN1cHBvcnQgem9uZWQgY2hpbGRyZW4iKTsKPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+ICvCoMKgwqAgfQo+ICsKPiDCoMKgwqDCoCBpZiAoIVFMSVNUX0VNUFRZKCZjaGlsZF9icy0+
cGFyZW50cykpIHsKPiDCoMKgwqDCoMKgwqDCoMKgIGVycm9yX3NldGcoZXJycCwgIlRoZSBub2Rl
ICVzIGFscmVhZHkgaGFzIGEgcGFyZW50IiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjaGlsZF9icy0+bm9kZV9uYW1lKTsKPiBkaWZmIC0tZ2l0IGEvYmxvY2svZmls
ZS1wb3NpeC5jIGIvYmxvY2svZmlsZS1wb3NpeC5jCj4gaW5kZXggYmQyOGUzZWFlYS4uN2M1YTMz
MGZjMSAxMDA2NDQKPiAtLS0gYS9ibG9jay9maWxlLXBvc2l4LmMKPiArKysgYi9ibG9jay9maWxl
LXBvc2l4LmMKPiBAQCAtNzc2LDYgKzc3NiwxOCBAQCBzdGF0aWMgaW50IHJhd19vcGVuX2NvbW1v
bihCbG9ja0RyaXZlclN0YXRlICpicywgUURpY3QKPiAqb3B0aW9ucywKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBmYWlsOwo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgIH0K
PiArI2lmZGVmIENPTkZJR19CTEtaT05FRAo+ICvCoMKgwqAgLyoKPiArwqDCoMKgwqAgKiBUaGUg
a2VybmVsIHBhZ2UgY2FjaGUgZG9lcyBub3QgcmVsaWFibHkgd29yayBmb3Igd3JpdGVzIHRvIFNX
UiB6b25lcwo+ICvCoMKgwqDCoCAqIG9mIHpvbmVkIGJsb2NrIGRldmljZSBiZWNhdXNlIGl0IGNh
biBub3QgZ3VhcmFudGVlIHRoZSBvcmRlciBvZiB3cml0ZXMuCj4gK8KgwqDCoMKgICovCj4gK8Kg
wqDCoCBpZiAoKHN0cmNtcChicy0+ZHJ2LT5mb3JtYXRfbmFtZSwgInpvbmVkX2hvc3RfZGV2aWNl
IikgPT0gMCkgJiYKPiArwqDCoMKgwqDCoMKgwqAgKCEocy0+b3Blbl9mbGFncyAmIE9fRElSRUNU
KSkpIHsKPiArwqDCoMKgwqDCoMKgwqAgZXJyb3Jfc2V0ZyhlcnJwLCAiZHJpdmVyPXpvbmVkX2hv
c3RfZGV2aWNlIHdhcyBzcGVjaWZpZWQsIGJ1dCBpdCAiCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAicmVxdWlyZXMgY2FjaGUuZGlyZWN0PW9uLCB3aGljaCB3YXMgbm90
IHNwZWNpZmllZC4iKTsKPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7IC8qIE5vIGhv
c3Qga2VybmVsIHBhZ2UgY2FjaGUgKi8KPiArwqDCoMKgIH0KPiArI2VuZGlmCj4gwqAKPiDCoMKg
wqDCoCBpZiAoU19JU0JMSyhzdC5zdF9tb2RlKSkgewo+IMKgI2lmZGVmIF9fbGludXhfXwo+IGRp
ZmYgLS1naXQgYS9ibG9jay9yYXctZm9ybWF0LmMgYi9ibG9jay9yYXctZm9ybWF0LmMKPiBpbmRl
eCBiYWM0M2YxZDI1Li4xOGRjNTJhMTUwIDEwMDY0NAo+IC0tLSBhL2Jsb2NrL3Jhdy1mb3JtYXQu
Ywo+ICsrKyBiL2Jsb2NrL3Jhdy1mb3JtYXQuYwo+IEBAIC02MTUsNiArNjE1LDcgQEAgc3RhdGlj
IHZvaWQgcmF3X2NoaWxkX3Blcm0oQmxvY2tEcml2ZXJTdGF0ZSAqYnMsIEJkcnZDaGlsZAo+ICpj
LAo+IMKgQmxvY2tEcml2ZXIgYmRydl9yYXcgPSB7Cj4gwqDCoMKgwqAgLmZvcm1hdF9uYW1lwqDC
oMKgwqDCoMKgwqDCoMKgID0gInJhdyIsCj4gwqDCoMKgwqAgLmluc3RhbmNlX3NpemXCoMKgwqDC
oMKgwqDCoCA9IHNpemVvZihCRFJWUmF3U3RhdGUpLAo+ICvCoMKgwqAgLnN1cHBvcnRzX3pvbmVk
X2NoaWxkcmVuID0gdHJ1ZSwKPiDCoMKgwqDCoCAuYmRydl9wcm9iZcKgwqDCoMKgwqDCoMKgwqDC
oMKgID0gJnJhd19wcm9iZSwKPiDCoMKgwqDCoCAuYmRydl9yZW9wZW5fcHJlcGFyZcKgID0gJnJh
d19yZW9wZW5fcHJlcGFyZSwKPiDCoMKgwqDCoCAuYmRydl9yZW9wZW5fY29tbWl0wqDCoCA9ICZy
YXdfcmVvcGVuX2NvbW1pdCwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ibG9jay9ibG9ja19pbnQt
Y29tbW9uLmggYi9pbmNsdWRlL2Jsb2NrL2Jsb2NrX2ludC0KPiBjb21tb24uaAo+IGluZGV4IGNk
YzA2ZTc3YTYuLjM3ZGRkYzYwM2MgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ibG9jay9ibG9ja19p
bnQtY29tbW9uLmgKPiArKysgYi9pbmNsdWRlL2Jsb2NrL2Jsb2NrX2ludC1jb21tb24uaAo+IEBA
IC0xMjcsNiArMTI3LDExIEBAIHN0cnVjdCBCbG9ja0RyaXZlciB7Cj4gwqDCoMKgwqDCoCAqLwo+
IMKgwqDCoMKgIGJvb2wgaXNfZm9ybWF0Owo+IMKgCj4gK8KgwqDCoCAvKgo+ICvCoMKgwqDCoCAq
IFNldCB0byB0cnVlIGlmIHRoZSBCbG9ja0RyaXZlciBzdXBwb3J0cyB6b25lZCBjaGlsZHJlbi4K
PiArwqDCoMKgwqAgKi8KPiArwqDCoMKgIGJvb2wgc3VwcG9ydHNfem9uZWRfY2hpbGRyZW47Cj4g
Kwo+IMKgwqDCoMKgIC8qCj4gwqDCoMKgwqDCoCAqIERyaXZlcnMgbm90IGltcGxlbWVudGluZyBi
ZHJ2X3BhcnNlX2ZpbGVuYW1lIG5vciBiZHJ2X29wZW4gc2hvdWxkIGhhdmUKPiDCoMKgwqDCoMKg
ICogdGhpcyBmaWVsZCBzZXQgdG8gdHJ1ZSwgZXhjZXB0IG9uZXMgdGhhdCBhcmUgZGVmaW5lZCBv
bmx5IGJ5IHRoZWlyCgo=

