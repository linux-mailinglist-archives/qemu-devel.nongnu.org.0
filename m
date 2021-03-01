Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C0532917E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:28:46 +0100 (CET)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGp9p-0006m9-A3
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lGp73-0005U9-SY
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:25:55 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53468)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lGp70-0008No-0I
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614630349; x=1646166349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3YkegBJ/mne5UvQq5FKU1YOtRt5jPL6w6j4n78AaNAQ=;
 b=s5e5F4H/KhoZXZj1WtxAXKsnMhh13lZTDL8upIjfa/N1L3MDkUpQarqY
 9fHyS9405nOJRew+EfeTvNGti81Wiu/8RcrmtpJo0RgzXsaxGG3dLSiF0
 EkKHmi/1gODWYfI9UQoOJAFun/DmF8FFtCcSSbA3CVZOW1ZIYoTP+0td0 U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Mar 2021 12:25:46 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Mar 2021 12:25:46 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Mar 2021 12:25:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 1 Mar 2021 12:25:46 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7583.namprd02.prod.outlook.com (2603:10b6:a03:32a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 20:25:45 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 20:25:45 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
Thread-Topic: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
Thread-Index: AQHXDiBX9BXDORfVtU6el0y7TRVHhapvlWpg
Date: Mon, 1 Mar 2021 20:25:45 +0000
Message-ID: <BYAPR02MB4886E9F1CB100BADF9A1A0F6DE9A9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210228222314.304787-1-f4bug@amsat.org>
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80cfc1b-74e9-4cba-4407-08d8dcf0315c
x-ms-traffictypediagnostic: SJ0PR02MB7583:
x-ms-exchange-minimumurldomainage: mail-archive.com#8356
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7583656DC796189F0A802A20DE9A9@SJ0PR02MB7583.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Gc8kIvBwFvh2IJOmbhQGaZkuGw9Cy9J4c2dYMPJAIbt9MJQI5YScsczYx2QznjK6k0RP1pqFsbCw1SFRyHk8Qrnn1FDsx9N0iRGzPGu35mcmWcNTIUrg35Vi/oE8di2lWDm/tD8csE+W72Ridj6S8ybDGVcRXolHUIAWCuayJ2bkN4K22g9fHDJCvY7cDeLFE27XH3KxK5EBLL/bwMhTInMOXLRSTpL9Dvl96fxug13oPnjMMNGio1V/gREN7a2owYNAEZw3izxbzOUhhWonBLzuqWyTvzT77nPCtRdKJUS4rJGJqhgwAEuUfiKg4Gj1JgSDrJUxEdivmg6QMmApZJyj/rwi9k7scApWwCnblNc/cjtFMNadOoXmkSyAz936Qi7wH76EEtCAC1S0vBEgJ4Zyuex9YFXcgZkekwv9vF54YltZOyH7ywduc7KJVaMRWmUR85SfusTe55U3Oc4f4fJNdtTe2cX3jpQ8AsWpgIUR+vCELDEBYb1JsBrN/m/tjXSbgUcP/EVNLReO1w5m+WVtrg+x8knYL+297EeoMx0BgTm/T5knkehZDmVXAxTXl4vAhDoIYtILEiPTHXyoeFhaZLV+TdIuXmI77A/jBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(478600001)(66446008)(76116006)(55016002)(107886003)(64756008)(66476007)(66556008)(66946007)(5660300002)(54906003)(110136005)(7696005)(9686003)(966005)(6506007)(83380400001)(53546011)(8936002)(86362001)(186003)(71200400001)(8676002)(4326008)(26005)(33656002)(316002)(2906002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N2hyZGQyMmdyWVFzcENuVU15VG5BbG5rZ2orMUJFYlI1cXdSMzBWYVBhcXZm?=
 =?utf-8?B?WEpMNEhqYWFmR2ozZ215NVRvOS9sRzhqTHJLc2RHbEhTL01EcVlIYWhIM1Vt?=
 =?utf-8?B?SGI2MWxNcGFCa0VsL1RHVkdTbGVkZ2dWS0NzMFhJcU5XNkFldGRrdGVNcUlu?=
 =?utf-8?B?WkhuZ3RKVDNDeThuTUQ0OEZJcFVyeEp0dnZoVGhhdzJBWWZuSi9mRFZiaVhG?=
 =?utf-8?B?UUdQS2RpSTVHU2NJOXk5UnlCa3FyT0lXUkQxZWg1OVcxOTBzYWpyQXJwRFVn?=
 =?utf-8?B?andmbXZKS1ZaemRVSFluZmdoY0ZNbG1hK2EwamhIRWNiRDh0ZFRXMjI5WWo4?=
 =?utf-8?B?ZjFhSktaMEZnck1Tb3VpT25LTlRVY0l3SEhJcUNtbzJhVUJrV2N1c1pRb3c2?=
 =?utf-8?B?VnpEN05KSDhPaWt6N1ljRTFqb0xYMXMrcGpNaXFERE5US3VyeXlTdWFKaHFU?=
 =?utf-8?B?cnd2SHd3M1B4VktMY0d1SXlpS0Z0S2RTT1lNOVJOOENqajV6L1VXS3V0MlRt?=
 =?utf-8?B?VzlXWlhTaDNUQVJ5RWpucXhJNEZOQ0VwaGgyWDl5N2ZTbVljV2xCSHpxYW5S?=
 =?utf-8?B?eEx3M0ZDdm94eEhKUHpXZ1FuOEdqS0tjSVBJNUVIblRoVFlVRUw4T2ZXeC9u?=
 =?utf-8?B?emJMUXZodGdIUXhvRFY3NEdJRHlpS2pCbGpxSGxYUlR0aDNqK0lSK1lBQU11?=
 =?utf-8?B?TVZqeDdGdEdScm9mU1VUaXdZejJxanpETXg1di9WVVcyRG9uaUlFRlJkV2Uv?=
 =?utf-8?B?OXlGNGdVZGZGQ2ZGUWxQTE80WThBaTJIZzdzOWNIaG9KU3o2TitNNGtIQ25x?=
 =?utf-8?B?b0lNcXFidUwwd212VCtFWitBaTZyZWlpK1FaclU3T283eHkyR0I1OUZzdVB5?=
 =?utf-8?B?SGRyRm13dncxSWcxWDZqTFhMYjdlNm44YVlST0V2cjdWcVRIQk5MemFxN3JS?=
 =?utf-8?B?bTJ2a0xoZGl3amNKaHA4UVN6YkNvUHRUcm9kY1dPc2l3Y2VTb2QvR3cxK09T?=
 =?utf-8?B?YmJISkIwakxuaDlwa1ZLcjZESUpkZk9OaUN5U1piSFhDOExUYjNZbFQvQVlG?=
 =?utf-8?B?dDBjNjh2Z1FBY01hY3JCeVJtdlBwcmYxeFZJcGFCV01RL28xbGM4TXFTeHZv?=
 =?utf-8?B?bWhyaktSKzZnMjJsMGc5dE1lckJmTDlkWWNBS0pqRmQ1UUZudTM5THRlUC9X?=
 =?utf-8?B?c3drY01KcGphb2k5bXFwU2FBL2UyUzBucGU4V1RTUHJUNnJuenpyWHFUKzRs?=
 =?utf-8?B?NjVzaE5yb0FuNUpKdS9iSFV2b1FRVFVBNzM2LzR4cmwxZVRNKzBjVHozN25o?=
 =?utf-8?B?c24zSGlqcW0yWURCWXBIN3hpVEVqaTByTUcycThWdnIzZTNwK00yYjF1OGRT?=
 =?utf-8?B?VStydkhxc3JrQm5kbldBNmFqMFlrZlhycFpzZUd6dUZIL3BWMUhUaWp6ZkFi?=
 =?utf-8?B?RFZLQzVEeDJnS3VlNzRGK2RHZU81Um5heDkzdUFwWGVDT2pIZXFkUVEreFlp?=
 =?utf-8?B?b1lVQ243ekdzWWVXa0NBZUtIOEJXY25YNlF4cllSdTZiMW9pYnp2UXpXeWNP?=
 =?utf-8?B?MUhES3ZKREZUaklYSVh6d2ZBMUZ0YUxQT1pBYmVRbEVJNDMzZktMYmRYWFZj?=
 =?utf-8?B?TS9TMmJCR1BXTHRST20ySS9nRU9xSjl0WWhibDlBdENIVGlzQzBrbkdjOFpE?=
 =?utf-8?B?SEhvSFBhcktkcXEzSWlubUVJV0VUTVBlNGZTV3dtTzNWRTkzR2o4NkU5bGxt?=
 =?utf-8?Q?EjfiZExvKTX7A1nvppC90ylyszymAqjqXEVwsF4?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGimGCImP3xkNMmMGOSvPH7J6+2SmAQnV7OEYvFdA0rHVpd4HAav+1eeDnJJDJ7EzulddzaVdmjGkd2TzAOCkONeQRIFlhSaPugk2D4JLB1H3/k0ME42jcF0AxNrWwOJVFC+qWcWyKfwM4u8qwU4V3Lf28x+aWnjDhUwhaGAqPR0mSk4eRD18aBqZ4F+CJehkxwpKvwd3KcRNHjmXT/L0bva3dAMXaititq8t4DK/pJF522KB7+GK0XGXAyWFBB7toG+WyuRou925CM1NsmzH96bc4huiOCgPp4UfG6nG8IL6JSf7CrPoapHRo/HmfYJXL6ciRA+eQaGh/bGVh4gEQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8V+Nplqa4+P88+4AMDuD63oeo3KadwFKmwJTENxLlA=;
 b=JeCaclRt/s3kc9rSmWi2XrHN8kmFHFXQOrj8zl/ncwO4syxY1rGmDFlm7s5Ic9evrI67smcWCEK5GyCl4xuOK9yEfvBDUqJc8GnYJjijUHRDGGNMZ87DJhg26IBsq6z5UNOsdfVFzxsgpmQzr104YVSr3658+6f3oSUm2yd0th3yTJvHq1BCiFhzDAp/c41Wmj0JJ9WXUUABxUsZkKINm8+YUJbUnvFNHzVY5cMsrD8xDSabJt19lQUXScnWnGLnxkySF1qVF+vQvGzX4q/q/4avFPOYxil6XHU87xVKsN3T2lAcgsr801BxJmQiU7I8nE+gtKJcAdj77l12i2vgbg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: a80cfc1b-74e9-4cba-4407-08d8dcf0315c
x-ms-exchange-crosstenant-originalarrivaltime: 01 Mar 2021 20:25:45.0657 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: xpVKbfhZfAi9pbvRUMe/Bgjbh6PVTZamMRBPfmbjYFhjAX1NFjupIIf58C8nIE281kncjsPEs2oGhyIsyP1erA==
x-ms-exchange-transport-crosstenantheadersstamped: SJ0PR02MB7583
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Brian Cain <bcain@quicinc.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Alessandro Di Federico <ale.qemu@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogU3VuZGF5LCBGZWJydWFyeSAyOCwg
MjAyMSA0OjIzIFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEZhbSBaaGVu
ZyA8ZmFtQGV1cGhvbi5uZXQ+OyBUYXlsb3IgU2ltcHNvbg0KPiA8dHNpbXBzb25AcXVpY2luYy5j
b20+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ow0KPiBBbGV4
IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBBbGVzc2FuZHJvIERpIEZlZGVyaWNv
DQo+IDxhbGUucWVtdUByZXYubmc+OyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT47IFBo
aWxpcHBlIE1hdGhpZXUtDQo+IERhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTdWJqZWN0OiBb
UEFUQ0ggMC80XSBoZXhhZ29uOiBBZGQgRG9ja2VyIGltYWdlICYgdGVzdGluZyB0byBnaXRsYWIt
Y2kNCj4NCj4gSGksDQo+DQo+IFRoaXMgc2VyaWVzIGlzIGEgcmV3b3JrIG9mIHRoZSAnQWRkIERv
Y2tlcmZpbGUgZm9yIGhleGFnb24nIHBhdGNoDQo+IGZyb20gQWxlc3NhbmRyby9CcmlhbiB0aGF0
IFRheWxvciBzZW50IGluIHY4Og0KPiBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUt
ZGV2ZWxAbm9uZ251Lm9yZy9tc2c3ODAzMzAuaHRtbA0KPiBidXQgYWRhcHRlZCB0byBtYWluc3Ry
ZWFtLg0KPg0KPiBHaXRsYWIgc2hhcmVkIHJ1bm5lciBhcmUgdXN1YWxseSBjYXBwZWQgdG8gMi80
IGNvcmVzIGFuZCB0aW1lb3V0DQo+IGFmdGVyIDJoMzAgdG8gM2guIFdlIG5lZWQgYSBiZWVmeSBj
dXN0b20gcnVubmVyIHRvIGdldCB0aGUgaW1hZ2UNCj4gYnVpbHQgYW5kIHN0b3JlZCBpbiB0aGUg
cmVnaXN0cnkuIEZvciBub3cgdGhlIGltYWdlIGlzIGFkZGVkIGluDQo+IG1hbnVhbCBtb2RlLCBo
b3BwaW5nIHdlJ2xsIGhhdmUgbWFnaWMgcnVubmVycyBhZGRlZCBzb21lIGRheSB0bw0KPiBidWls
ZCB0aGUgaW1hZ2UsIHRoZW4gZGV2ZWxvcGVycyBjYW4gZGlyZWN0bHkgcHVsbCBpdCBmcm9tIHRo
ZQ0KPiByZWdpc3RyeS4NCg0KVGhhbmtzIGEgdG9uIGZvciBkb2luZyB0aGlzLg0KDQpEbyBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5IHRoYXQgc29tZW9uZSB3aWxsIG1hbnVhbGx5IHJ1biB0aGUgdG9v
bGNoYWluIGJ1aWxkIHNjcmlwdHMgdG8gY3JlYXRlIHRoZSBjb250YWluZXIgYW5kIG90aGVycyB3
aWxsIGJlIGFibGUgdG8gdXNlIHRoZSBwcmVidWlsdCBjb250YWluZXIgYWZ0ZXIgdGhhdD8NCg0K
VGF5bG9yDQoNCg0K

