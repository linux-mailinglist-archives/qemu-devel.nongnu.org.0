Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1854262E8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 05:22:26 +0200 (CEST)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYgSm-000528-Ec
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 23:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=991596d384=pdel@fb.com>)
 id 1mYgQB-0003rR-GQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 23:19:43 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:61146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=991596d384=pdel@fb.com>)
 id 1mYgQ9-0002ds-AG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 23:19:43 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1981GVd4017189; 
 Thu, 7 Oct 2021 20:19:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=NMjy+eLkvGG8LJ6omez0yeZzFce63qLIRlEbk5WqaI8=;
 b=IT8NzkvckK3dN+obONikPnpyqOsocZv2FI2WU/Zsm0A8tiXcOj1q6ZvU55pbSTSOi3Ad
 JarkGCT9DYduJQ086rheDflMI/i/mpp9cymHl7sUxp/ZntyVl2Le13MQlT3gBvbljwHL
 pkOfGSoJ9SaHQKcFAuQoJE7Iw7RpujqwNw4= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bjc610rcx-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Oct 2021 20:19:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 7 Oct 2021 20:19:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irM9majifqy/hHK97Y9aHKEE40roN+BgTDl+83xtvJ75w3HpsrWdcs6tHAxwkG4MaeWcKoinrDAf1kG6aYubVSG+6ZexTA74lYjmF5aBwEHRDIUXzleN2FY0YJAiZCalTw3p23cXa36Cp4zd8qk7Wz6O/uOqgxeuiKylxJA8oxeSD+tx+1Uy1EtlbdVUYWOkAZNdOfPlyyEPCoVnQFUes0JONupbfAQ4Nj9Mm56YOBUmx9tZc7Rh9u1W53/tZXV3bozlsV+qFldYrHIDnsg7RDpGvSmLNMjIhOW5W9bVLsYotP74GZzb3S4ZagIS/wwBlxpxCeJv1qGwdc6X1TY/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMjy+eLkvGG8LJ6omez0yeZzFce63qLIRlEbk5WqaI8=;
 b=T7Bd0mWpq7uKUtaVoTJBYrKKHFrzBl63zGGmoLHb+OhxzU/xO5NdGNnxP6F/Wxu6AKXbaFmGaJ0ljAyysAYhA66r3SAzlL+Dtnkw+kz3zUGpmr1rymD0fQrFUkonQngNoLbWQJzeKfInyYyDf5XKIdW53O3VtpFcSROPn+0QFMSv3n/I2RL5qNVE577BhsyL/6cS99yx1Xn+DvRY7QzmIwjev377UZEXdvnv0OUfxnn0NC54F2KiCOpSwrPjkOQzo6ZgfVlLwto83JnPryOtQPmymtKvqkmNzfvFIKyUyUu33Qb7kjvowEJsROOjiMXPtsIz/+4KHknn8AkpxEwk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY5PR15MB3555.namprd15.prod.outlook.com (2603:10b6:a03:1f5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 03:19:25 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e034:cb74:cc86:7f89]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e034:cb74:cc86:7f89%6]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 03:19:25 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Joel Stanley <joel@jms.id.au>, "rashmica.g@gmail.com"
 <rashmica.g@gmail.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "Cameron
 Esfahani via" <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Thread-Topic: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Thread-Index: AQHXtBsSd2n/kc4CzEKiD3j0fIYPQavClmCAgAArlQCABbxqAA==
Date: Fri, 8 Oct 2021 03:19:25 +0000
Message-ID: <D52F5640-81C7-4218-976F-E4B9CEB83A06@fb.com>
References: <20210928034356.3280959-1-pdel@fb.com>
 <20210928034356.3280959-2-pdel@fb.com>
 <c1d2a714-1073-310b-e75c-2f6b5b5a025f@kaod.org>
 <74fefbb4-af1c-a95e-a747-74866a8ad44c@kaod.org>
In-Reply-To: <74fefbb4-af1c-a95e-a747-74866a8ad44c@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91c5ad8f-c7ea-48ef-881d-08d98a0a6e4e
x-ms-traffictypediagnostic: BY5PR15MB3555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB35554008488D856F414BADBBACB29@BY5PR15MB3555.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MRJAy5TCsuCUVpkrPE6j7DGq1FQIFXCFFYwUNjgzSIrHZ3cWAfHN43sdvHwUiKus/rjUtBbpsRJt/TTbZp4lqL4eW2DfJjNwmO6wjwLgRvxbYlpQHnMHATd8oVeCuRGYPkiIfdtiwSEseDkPdubUBIuUgqSOxeC8SnIF2yvHHBezAdFYPzklulPH77n5VbynLaYJ4QvjRrI/HMazD6TDij/Nfyiosrmw+6JlOajM6IWduyr7Lnv5vdcjcGnkrY8yR1Vd3+X6W+UCVqedd8F0+I6O1CAWcIGR+R5aCsvElCoECoJLthuU69CytuzQpejFx4G1p1IkWiY6SV9h5TbkvWnVt9eRAMuRGEtdrAgHc74zSNvUhF/7awe7OTezr0BtOK3wb3WKM0IqkXKL50JhDwY7MfEIioHlBZ7EBcf3YIscPQ42cfSyTv92tHUCHWMnkLOSIEhWRsOWyx+nMRHfrmpgXw7Ya+TxPV5zF/hLkrpfU84N/hAVHkPvNN9MWlTBJYGyn/zY4Tu8iWjj5xOBpyiujGyMnTimkOGbVmb6pgThE0HWnZ+yf2SpP7G/WUlN0XQH7E6r/AxUYNlAdAbGhAcHSV2qxNvXlSBFTlWntcYMSMsdUxkvL9V/pslYqp8LXI/J1jYT4Om1laPoDRQIQ0vyo6uHln1DSSE7fQYK5V3tDbOqHICS6GcUl7NaVFVijKOIfLTfli0PpGCnB189u9sHhOFd38d2RBUbvuN7EpwQ54/K2coJOE9lk2qbwAJE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(109986005)(6486002)(8676002)(54906003)(53546011)(8936002)(64756008)(36756003)(66946007)(186003)(66556008)(5660300002)(316002)(66446008)(71200400001)(91956017)(76116006)(66574015)(122000001)(6506007)(2616005)(508600001)(66476007)(83380400001)(4326008)(86362001)(2906002)(38100700002)(38070700005)(6512007)(33656002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFJOb3psMlp3UnlCTGh1TU1LRjg2YVJQWld1bDhGU3NRUWxxZmJoMFBpOEIv?=
 =?utf-8?B?MnFiWnp1eElOV2JVcXc4V2picGorZ1VZalErTGhlN2czSTI4bkxlb3VCd3pQ?=
 =?utf-8?B?cTRCem43dlJWK1huY1V3NFdWU1ZLbFduNGV0VzRSWEpMSVNqdDZ2Q1BqZ3Yv?=
 =?utf-8?B?R0Z1VW0ycHJIZE1QMGFUcnRUamhKd3Q2N3JQMHVldGhuR3dMQXl5a2s0VHZl?=
 =?utf-8?B?Y0JGQUU5VGFmU0tYTjhnUXJzdGQxUHZ5WktaZVZRNGExL2ZHcUQ0cWRhRnQz?=
 =?utf-8?B?b1B3enFndi9lL3ZGVEp0aDlacXB2eEx2Z1N2NmtyR1JHT2U0T2dtbSs0bURa?=
 =?utf-8?B?UUJvZjloR2ZiVnlFM1NMTUNYend1dWRvR1dxWFpwZmx1TDBTRzJpR0xKR3lG?=
 =?utf-8?B?dEc0N21RNythYjkxa0ZTSmV5Q3dOT3F1eHZGR25SbW1WcWROdUlMWHRFT0hZ?=
 =?utf-8?B?ZXFEMTVwckZ3eVNYRjhHb0FhZmdENFJEU3pheU1RMDBNNDE0WURpakFUWjJN?=
 =?utf-8?B?V3JKa2dCUWRNSXVxSXlub3V2TWIrSnVsd3VmU2t3WlVlVFY2ZUxydnhLOURG?=
 =?utf-8?B?bzJOQTQrM3ZvZ1BSR2UzdnJ3REtpQXRtWFRDNFQrcFhuVTJtVThvOVgwdEE0?=
 =?utf-8?B?SS9EWGJFNHpFaWxqWGlYN0F6L2RYN0o4VVdWY1FWdVZ6SFhUOGd2S2tPWENU?=
 =?utf-8?B?T25DLzRSV3NLc2VQdWd5alpOUjdVY1ZKN0NmUGI3T2FQY01LdHNicHQ4QkNh?=
 =?utf-8?B?a21YWVY1c2wreWZpRHlETUNpTEpwVkhmR1BXSjA2QTE3K28zM2UvMUZFWi9i?=
 =?utf-8?B?WklwajBxVlNzWlcyQVNvbGtkV1hxaExYRnJkZUYyaHZhNjBDVVlYRzJQMHQ1?=
 =?utf-8?B?Z2V4eGFKNndxTG03VDlhRTBxbmRWbjBBZVpZelQ4enMzcmdHbHNwMWg2R2dH?=
 =?utf-8?B?RXFSazY0MVdzN3M2VUE3QUZjYmJOaGN5MUtycmd5WTZkdk80NjBGQjliTzIy?=
 =?utf-8?B?OG8rMFlsVk1ObFpxZTZKcDBZanpnOGZSOFdUMHc0cU1XTElVNGVlNDlrMDdT?=
 =?utf-8?B?ZENJZDhmTEkvUDhGZGFaV1FQSXA0ME9FUW1EWTFEV21paVpEbnBhVU9Ec0xz?=
 =?utf-8?B?YXJIOWpZMWFNaTIxUVNza29XVlRST25iVGpxUDdnOWxhMTdIc1g4Q1ZKdU10?=
 =?utf-8?B?NWc4cStlTWs2aEpwY2IycmlrbHp6b2orLzlwWEZNc2tFaFgxWW5qZmYwQ1JJ?=
 =?utf-8?B?UGN4VlZ3a2hpbklmcUVLSGFsdXZ3WDVQMXNjSkkydDJQb1k3YkNEMXFwRCt2?=
 =?utf-8?B?Y0hQTTlURjRkN3lVYkFHR3REdi9CZUNpajhXaEZLOHFSdUhJUkFIbkRLWWJQ?=
 =?utf-8?B?czBNWE1XSngvYkxlTU9MNjVtUEU3QU9YdVQrdUFXZktrZDN3R1grSE5NbFJ3?=
 =?utf-8?B?SDhSMGRkV04wZFN0YWtsWmh0Vm9hTVhuZ3pEYnBaMWFGREJ4TlRWUlpKZEp4?=
 =?utf-8?B?aTZsSWJBK0NoNWVLVlZ5b1doN1JQYTRFa1MwT0JSb0NBdFhJOWlmUmFNbFdB?=
 =?utf-8?B?OG9KcFdSaWZpL0FDd1krRHhTYXJFQlIxMHpuUVZEaWh2Ums4L0Q3Q2VOQUpI?=
 =?utf-8?B?VnhqY3hYSjZOZkprS0hzZVJBcDByOGtZK2JUM21BS3llMk5uaWI3TFBTMTFG?=
 =?utf-8?B?b3VxeGRWZlBqM0pFVlhrYkxQb3A3T3RZV2t4T1JNeTFwV1lCWWI3cVVXeGRl?=
 =?utf-8?B?ODdOaFlEaU5IUEkyZ0Jxb3p4dnl6U1FOZ1phQWo3U2JTNlhyOWVZajFSeSth?=
 =?utf-8?Q?qFU7+qCDfGhFGGB4yjt6uHvwFDg6g6WgwcvOI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35212327DB5DD447AA8AC074FDBF9726@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c5ad8f-c7ea-48ef-881d-08d98a0a6e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 03:19:25.3263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6xEeMdaBFPrOkWR+lcPumj7ORY5f9aytV87sZ/v1rH8kN6LmaLE3fB9WrVrCyCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3555
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: sRD4-94TKZvUru-NzOXk0EagDTbRrljL
X-Proofpoint-GUID: sRD4-94TKZvUru-NzOXk0EagDTbRrljL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080018
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=991596d384=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gT2N0IDQsIDIwMjEsIGF0IDQ6NDMgQU0sIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gMTAvNC8yMSAxMTowNywgQ8OpZHJpYyBMZSBHb2F0
ZXIgd3JvdGU6DQo+PiBPbiA5LzI4LzIxIDA1OjQzLCBwZGVsQGZiLmNvbSB3cm90ZToNCj4+PiBG
cm9tOiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+PiANCj4+PiBUaGUgZ3BpbyBh
cnJheSBpcyBkZWNsYXJlZCBhcyBhIGRlbnNlIGFycmF5Og0KPj4+IA0KPj4+ICAgIHFlbXVfaXJx
IGdwaW9zW0FTUEVFRF9HUElPX05SX1BJTlNdOw0KPj4+IA0KPj4+IChBU1QyNTAwIGhhcyAyMjgs
IEFTVDI0MDAgaGFzIDIxNiwgQVNUMjYwMCBoYXMgMjA4KQ0KPj4+IA0KPj4+IEhvd2V2ZXIsIHRo
aXMgYXJyYXkgaXMgdXNlZCBsaWtlIGEgbWF0cml4IG9mIEdQSU8gc2V0cw0KPj4+IChlLmcuIGdw
aW9bTlJfU0VUU11bTlJfUElOU19QRVJfU0VUXSA9IGdwaW9bOF1bMzJdKQ0KPj4+IA0KPj4+ICAg
IHNpemVfdCBvZmZzZXQgPSBzZXQgKiBHUElPU19QRVJfU0VUICsgZ3BpbzsNCj4+PiAgICBxZW11
X3NldF9pcnEocy0+Z3Bpb3Nbb2Zmc2V0XSwgISEobmV3ICYgbWFzaykpOw0KPj4+IA0KPj4+IFRo
aXMgY2FuIHJlc3VsdCBpbiBhbiBvdXQtb2YtYm91bmRzIGFjY2VzcyB0byAicy0+Z3Bpb3MiIGJl
Y2F1c2UgdGhlDQo+Pj4gZ3BpbyBzZXRzIGRvIF9ub3RfIGhhdmUgdGhlIHNhbWUgbGVuZ3RoLiBT
b21lIG9mIHRoZSBncm91cHMgKGUuZy4NCj4+PiBHUElPQUIpIG9ubHkgaGF2ZSA0IHBpbnMuIDIy
OCAhPSA4ICogMzIgPT0gMjU2Lg0KPj4+IA0KPj4+IFRvIGZpeCB0aGlzLCBJIGNvbnZlcnRlZCB0
aGUgZ3BpbyBhcnJheSBmcm9tIGRlbnNlIHRvIHNwYXJzZSwgdG8gbWF0Y2gNCj4+PiBib3RoIHRo
ZSBoYXJkd2FyZSBsYXlvdXQgYW5kIHRoaXMgZXhpc3RpbmcgaW5kZXhpbmcgY29kZS4NCj4+PiAN
Cj4+PiBGaXhlczogNGI3Zjk1Njg2MmRjMmRiNGM1YyAoImh3L2dwaW86IEFkZCBiYXNpYyBBc3Bl
ZWQgR1BJTyBtb2RlbCBmb3IgQVNUMjQwMCBhbmQgQVNUMjUwMCIpDQo+Pj4gU2lnbmVkLW9mZi1i
eTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+PiBUaGlzIHBhdGNoIGlzIHJhaXNp
bmcgYW4gZXJyb3IgaW4gcXRlc3QtYXJtL3FvbS10ZXN0IHdoZW4gY29tcGlsZWQNCj4+IHdpdGgg
Y2xhbmcgOg0KPj4gUnVubmluZyB0ZXN0IHF0ZXN0LWFybS9xb20tdGVzdA0KPj4gVW5leHBlY3Rl
ZCBlcnJvciBpbiBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZCgpIGF0IC4uL3FvbS9vYmplY3QuYzox
MjI0Og0KPj4gcWVtdS1zeXN0ZW0tYXJtOiBhdHRlbXB0IHRvIGFkZCBkdXBsaWNhdGUgcHJvcGVy
dHkgJ2dwaW8wJyB0byBvYmplY3QgKHR5cGUgJ2FzcGVlZC5ncGlvLWFzdDI2MDAtMV84dicpDQo+
PiBCcm9rZW4gcGlwZQ0KPj4gRVJST1IgcXRlc3QtYXJtL3FvbS10ZXN0IC0gdG9vIGZldyB0ZXN0
cyBydW4gKGV4cGVjdGVkIDc4LCBnb3QgMCkNCj4+IG1ha2U6ICoqKiBbTWFrZWZpbGUubXRlc3Q6
MjQ6IHJ1bi10ZXN0LTFdIEVycm9yIDENCj4gDQo+IFRoZSBHUElPU2V0UHJvcGVydGllcyBhcnJh
cnkgaXMgc21hbGxlciBmb3IgdGhlIGFzdDI2MDBfMV84diBtb2RlbCA6DQo+IA0KPiAgc3RhdGlj
IEdQSU9TZXRQcm9wZXJ0aWVzIGFzdDI2MDBfMV84dl9zZXRfcHJvcHNbXSA9IHsNCj4gICAgICBb
MF0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7IjE4QSIsICIxOEIiLCAiMThDIiwgIjE4
RCJ9IH0sDQo+ICAgICAgWzFdID0gezB4MDAwMDAwMGYsICAweDAwMDAwMDBmLCAgeyIxOEUifSB9
LA0KPiAgfTsNCj4gDQo+IGFuZCBpbiBhc3BlZWRfZ3Bpb19pbml0KCkgOg0KPiANCj4gICAgZm9y
IChpbnQgaSA9IDA7IGkgPCBBU1BFRURfR1BJT19NQVhfTlJfU0VUUzsgaSsrKSB7DQo+IA0KPiB3
ZSBsb29wIGJleW9uZC4NCj4gDQo+IFRvIGNvbmZpZ3VyZSBjb21waWxhdGlvbiB3aXRoIGNsYW5n
LCB1c2UgdGhlIGNvbmZpZ3VyZSBvcHRpb24gOg0KPiANCj4gIC0tY2M9Y2xhbmcNCj4gDQo+IGFu
ZCBzaW1wbHkgcnVuICdtYWtlIGNoZWNrLXF0ZXN0LWFybScNCg0KVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGlzIG91dCEgVG8gZml4IGl0LCBJIHRoaW5rIHRoZSBzaW1wbGVzdCB0aGluZyBJIGNvdWxk
IGRvDQppcyBqdXN0IG1ha2Ugc3VyZSBhbGwgb2YgdGhlIEdQSU9TZXRQcm9wZXJ0aWVzIGFycmF5
cyBoYXZlIHRoZSBzYW1lIGxlbmd0aCwNCkFTUEVFRF9HUElPX01BWF9OUl9TRVRTLiBUaGVyZSBp
cyBhbHJlYWR5IGEgZmlsdGVyaW5nIG1lY2hhbmlzbSBpbiBwbGFjZSBpbg0KdGhlIGNvZGUgdGhh
dCBpdGVyYXRlcyBvdmVyIHRoZSBwcm9wZXJ0aWVzIHRvIHNraXAgemVyb2VkIGVudHJpZXMuIEFs
dGVybmF0aXZlbHksDQp3ZSBjb3VsZCBrZWVwIHNvbWUgdmFyaWFibGUgbGVuZ3RoIG5yX3NldHMg
dmFsdWUgd2l0aCBlYWNoIGNsYXNzLCBidXQgSSBmaWd1cmVkDQp0aGF0IGlzIG1vcmUgY29tcGxp
Y2F0ZWQgYW5kIGVycm9yLXByb25lLiBJ4oCZbSBzdWJtaXR0aW5nIHRoZSB2MiB2ZXJzaW9uDQp3
aXRoIHRoaXMgZml4Lg0KDQpUaGFua3MsDQpQZXRlcg0KDQpkaWZmIC0tZ2l0IGEvaHcvZ3Bpby9h
c3BlZWRfZ3Bpby5jIGIvaHcvZ3Bpby9hc3BlZWRfZ3Bpby5jDQppbmRleCA5MTFkMjFjOGNmLi43
OGIwZjY0YjAzIDEwMDY0NA0KLS0tIGEvaHcvZ3Bpby9hc3BlZWRfZ3Bpby5jDQorKysgYi9ody9n
cGlvL2FzcGVlZF9ncGlvLmMNCkBAIC03NTksNyArNzU5LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVk
X2dwaW9fc2V0X3BpbihPYmplY3QgKm9iaiwgVmlzaXRvciAqdiwgY29uc3QgY2hhciAqbmFtZSwN
CiB9DQoNCiAvKioqKioqKioqKioqKioqKioqIFNldHVwIGZ1bmN0aW9ucyAqKioqKioqKioqKioq
KioqKiovDQotc3RhdGljIGNvbnN0IEdQSU9TZXRQcm9wZXJ0aWVzIGFzdDI0MDBfc2V0X3Byb3Bz
W0FTUEVFRF9HUElPX01BWF9OUl9TRVRTXSA9IHsNCitzdGF0aWMgY29uc3QgR1BJT1NldFByb3Bl
cnRpZXMgYXN0MjQwMF9zZXRfcHJvcHNbXSA9IHsNCiAgICAgWzBdID0gezB4ZmZmZmZmZmYsICAw
eGZmZmZmZmZmLCAgeyJBIiwgIkIiLCAiQyIsICJEIn0gfSwNCiAgICAgWzFdID0gezB4ZmZmZmZm
ZmYsICAweGZmZmZmZmZmLCAgeyJFIiwgIkYiLCAiRyIsICJIIn0gfSwNCiAgICAgWzJdID0gezB4
ZmZmZmZmZmYsICAweGZmZmZmZmZmLCAgeyJJIiwgIkoiLCAiSyIsICJMIn0gfSwNCkBAIC03Njks
NyArNzY5LDcgQEAgc3RhdGljIGNvbnN0IEdQSU9TZXRQcm9wZXJ0aWVzIGFzdDI0MDBfc2V0X3By
b3BzW0FTUEVFRF9HUElPX01BWF9OUl9TRVRTXSA9IHsNCiAgICAgWzZdID0gezB4MDAwMDAwMGYs
ICAweDBmZmZmZjBmLCAgeyJZIiwgIloiLCAiQUEiLCAiQUIifSB9LA0KIH07DQoNCi1zdGF0aWMg
Y29uc3QgR1BJT1NldFByb3BlcnRpZXMgYXN0MjUwMF9zZXRfcHJvcHNbQVNQRUVEX0dQSU9fTUFY
X05SX1NFVFNdID0gew0KK3N0YXRpYyBjb25zdCBHUElPU2V0UHJvcGVydGllcyBhc3QyNTAwX3Nl
dF9wcm9wc1tdID0gew0KICAgICBbMF0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7IkEi
LCAiQiIsICJDIiwgIkQifSB9LA0KICAgICBbMV0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYs
ICB7IkUiLCAiRiIsICJHIiwgIkgifSB9LA0KICAgICBbMl0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZm
ZmZmZmYsICB7IkkiLCAiSiIsICJLIiwgIkwifSB9LA0KQEAgLTc4MCw3ICs3ODAsNyBAQCBzdGF0
aWMgY29uc3QgR1BJT1NldFByb3BlcnRpZXMgYXN0MjUwMF9zZXRfcHJvcHNbQVNQRUVEX0dQSU9f
TUFYX05SX1NFVFNdID0gew0KICAgICBbN10gPSB7MHgwMDAwMDBmZiwgIDB4MDAwMDAwZmYsICB7
IkFDIn0gfSwNCiB9Ow0KDQotc3RhdGljIEdQSU9TZXRQcm9wZXJ0aWVzIGFzdDI2MDBfM18zdl9z
ZXRfcHJvcHNbQVNQRUVEX0dQSU9fTUFYX05SX1NFVFNdID0gew0KK3N0YXRpYyBHUElPU2V0UHJv
cGVydGllcyBhc3QyNjAwXzNfM3Zfc2V0X3Byb3BzW10gPSB7DQogICAgIFswXSA9IHsweGZmZmZm
ZmZmLCAgMHhmZmZmZmZmZiwgIHsiQSIsICJCIiwgIkMiLCAiRCJ9IH0sDQogICAgIFsxXSA9IHsw
eGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiRSIsICJGIiwgIkciLCAiSCJ9IH0sDQogICAgIFsy
XSA9IHsweGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiSSIsICJKIiwgIksiLCAiTCJ9IH0sDQpA
QCAtNzkwLDcgKzc5MCw3IEBAIHN0YXRpYyBHUElPU2V0UHJvcGVydGllcyBhc3QyNjAwXzNfM3Zf
c2V0X3Byb3BzW0FTUEVFRF9HUElPX01BWF9OUl9TRVRTXSA9IHsNCiAgICAgWzZdID0gezB4MDAw
MGZmZmYsICAweDAwMDBmZmZmLCAgeyJZIiwgIloifSB9LA0KIH07DQoNCi1zdGF0aWMgR1BJT1Nl
dFByb3BlcnRpZXMgYXN0MjYwMF8xXzh2X3NldF9wcm9wc1tBU1BFRURfR1BJT19NQVhfTlJfU0VU
U10gPSB7DQorc3RhdGljIEdQSU9TZXRQcm9wZXJ0aWVzIGFzdDI2MDBfMV84dl9zZXRfcHJvcHNb
XSA9IHsNCiAgICAgWzBdID0gezB4ZmZmZmZmZmYsICAweGZmZmZmZmZmLCAgeyIxOEEiLCAiMThC
IiwgIjE4QyIsICIxOEQifSB9LA0KICAgICBbMV0gPSB7MHgwMDAwMDAwZiwgIDB4MDAwMDAwMGYs
ICB7IjE4RSJ9IH0sDQogfTsNCg0KPiANCj4gVGhhbmtzDQo+IA0KPiBDLg0KDQo=

