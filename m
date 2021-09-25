Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AF4182BB
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:30:02 +0200 (CEST)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8gi-0006B7-Vl
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8902a650be=pdel@fb.com>)
 id 1mU8fe-0004gT-PY
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:28:54 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:16062
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8902a650be=pdel@fb.com>)
 id 1mU8fc-0002ti-LG
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:28:54 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 18P7KCP3029843;
 Sat, 25 Sep 2021 07:28:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=g8NsCKaPIk22MJsNHtVu6POIR/gDpXrDjnnNQKa7XI8=;
 b=BveBUF0DYe3jKJqMeQgTghsii8uu2rvynDG5ANISKUeRaaTGp7GjLaiEvzE5/nePihq5
 XrqU5R55/DRuWlqZ2Izjj8Ovx0JgGCOUobzOv74KHXbKIsOFe7lGldRYk81k5SSlMsLU
 3QCzQ3WSfUbBCT1HXnUthXBI4t0KJIv2wgQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 3b9y9chgaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 25 Sep 2021 07:28:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sat, 25 Sep 2021 07:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISMIDlmNIRErBI3X8FYy1Hqg0Hh+jJX09eZt2VOYyjVfbPjVdaT8flCj6WJ3sRNVTtruucCoAlyQcl8re007rGBn9hZGjRTQnWzEM41Fs3NRbLDya1CEsSqQ8UhNgcEWbiFwicH03TLoNuGjRTplHxJnPtNAytWL1pvHr2rb3g5fDT3mTKyw94gX6dbZ5o48wk+2QOaMKtxIdmgPtC1zUM9vvGa4NK7JQLYviclKZZkbSauFFRV2oPj+KcysdicNF3Bjtr7813e5+A3nt06BaqxFvO0PA0UISLtnYiwmXjv32cZEVrvf3uwqOgvomYLRUr9ZyG9w+JPAD02H6j7HSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=g8NsCKaPIk22MJsNHtVu6POIR/gDpXrDjnnNQKa7XI8=;
 b=P1VQ9GhmqBniWmyGkQk5l6Zct/2/7J6ZbK6RTX/wpGYqrpFoB528NQRbrvxd6Ji3lEN2891myv6EuCa3HQ0B/wbFMV6ckPNGY412SfWFawvhHy/XY3maei3Xz2oqunC3cYuqjhSPrebA/gUVUMOOP8gJ4a/DTh+bweIcbhCeIJmnVfAZQWWtfEy6vUkk7We8Q4hZtEuFMPEOo5D+94cr017iIa+mzpjdd6GfeyIemlZqyK/DRaeTUC84wKhCXPnFyXVdHZrhyXgjVIHexfdoIuzkketv1t9GQ+XHysnSigT1wWfQEBD+sR0N82Udp5SvVbOp5a6c3T4+LTYlYJLFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY5PR15MB3522.namprd15.prod.outlook.com (2603:10b6:a03:1b5::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Sat, 25 Sep
 2021 14:28:32 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4544.020; Sat, 25 Sep 2021
 14:28:31 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
CC: "clg@kaod.org" <clg@kaod.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "rashmica.g@gmail.com" <rashmica.g@gmail.com>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Thread-Topic: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Thread-Index: AQHXsQw2xaBi8XOu9kGhFFOYyGdENqu0l64AgAA5dL0=
Date: Sat, 25 Sep 2021 14:28:31 +0000
Message-ID: <24C5D588-770A-476C-A329-993619106251@fb.com>
References: <20210924061953.1996620-1-pdel@fb.com>
 <20210924061953.1996620-2-pdel@fb.com>
 <e4a8adf5-5b9f-0617-3b66-98d532187a1b@amsat.org>
In-Reply-To: <e4a8adf5-5b9f-0617-3b66-98d532187a1b@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c287ceb7-3750-49e2-1df2-08d98030c042
x-ms-traffictypediagnostic: BY5PR15MB3522:
x-microsoft-antispam-prvs: <BY5PR15MB352225E1B53C49BD210596B3ACA59@BY5PR15MB3522.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Idza5vzYQiqrh9P/wqcSqMSnP57bcnAVMfkAKQXDkF7B4w6tFZgoI2EjDctD0FDIv4UFOQ1yxFdpg+PEWxhkpfn9z/1EjLo5unx9YnpMoozbkv589k1+fekInTmV1n0AzixfAg053msvczN+ZtDdm+aNMb588jw1/k5QNL2jwcSnevJOcxLddJxC//PSNhHolNfNgVUMzBbVIYP7l4XYkCHXp0FtSSKfuOHODe7JXpXbTsZLNXn+uSJvupCm/m43BqIhjUB2HB5jWNzNZns9a1Cw+v01YQPLCaih2iZxqekMtVY/kZSk7RQeaVUag+yCMuv2pNtuRvotNEdk6KCv5Tc3FuAaYooVDmkmpwTm6eRJebZTt6SWX3I9s7dHbi8IEGFswsEwEAAGsXFEk3W8twBCG6EHWgOhMeEVzzTu5fWnQ8Ji/jjnsYHH6m3Fod84VIbVo1PI60ypZHeLb2JJIeFwDTaQbylhVgfjZbIZfB9rtoFVzVEgMtGbj4Ap05ucI9HEAYS3JmAUh0A+HsyannoSvVBRwINSbqWdRN/D+yHXgytjPz5TFrmFESSOXh5Yr3G27Z2NCP9YxCEsVhjUdmFErTVVY1gCi/OJQbwrrSL200p3P/u8jN4llaZ4inPa79OZ7LydRuLbaVVEaU9CsulMhBukrbhAeFR7xb/uANhsl0xj6GsegVKOoN+HKegbqlwl46ARd5DD1h7dLIavm1uTidOE/peeQr2xrtVq7bE3tK/bXsFgMio06oHYfnUK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(38070700005)(6486002)(76116006)(6512007)(38100700002)(5660300002)(2616005)(36756003)(71200400001)(122000001)(66476007)(508600001)(66446008)(8936002)(186003)(83380400001)(66946007)(26005)(6506007)(8676002)(64756008)(2906002)(53546011)(6916009)(33656002)(54906003)(86362001)(316002)(66556008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXlYbU53bTY2MlBFSGlVVXpqYnlHWXR2NkJkUUdOd25pOCtHVXhaeUNZWWNu?=
 =?utf-8?B?UHBLdnJOUDBwYzNkQ0dNSS8zbzlSU1h0TUtHcFJZdldjQVV3Sy9lUytMd1My?=
 =?utf-8?B?TTN2MXU2cG1DU0ZmQ3dsenhXUHBCeW1JeFVVc3RBcXM0eHB3eU10bWhqblZW?=
 =?utf-8?B?NjNsOFlYYVNXSW9aRzQ2K01iaEZ2Y0pvd2lMYWhaRjZlTThNam5lMzJGY1lH?=
 =?utf-8?B?QldnUUNFTWNDVVF0WGxLbWsweXlZYW1xWTJMcDczWWszK3JwRUhxS0VmWTBL?=
 =?utf-8?B?VWcvcTUzVmY2bnprdGk0QVYzYVl3UjJKOUdTYkQ5Q1plTVJyTWd1OCtFeGlP?=
 =?utf-8?B?TDZkQ0I0aUFSQzk2aFpHN1VxVGhGNmZQMGloTTROdHROSWkrOUlqZXpjQVhU?=
 =?utf-8?B?L3FXVTZFSC83eUFGbEFhVGhia3pGbElyRWJiMlIyNGdRbUg3YjV0QVFCQ3k0?=
 =?utf-8?B?SXJzQXlPUUNEVVQ0K3RTaUJ2d0dGb25tWjJRcFZ3MWlyUVc2RUlqMm5iQnlE?=
 =?utf-8?B?RUNkK3FDTThENVJtckRjcUcrYzJMMk9INUI0Y0paejlGSVNRNU1GQXNrVW5Q?=
 =?utf-8?B?VWdZTENSdXpJZmhsT2c0OVliY21tb0RsWURWRGJpK05hS0IxdUdMQWVvaHFv?=
 =?utf-8?B?NmFPbFNDM1pUVSt6bGFsOGNYTUdIZlBxV2ZwUWZLcno3NlJwak1jVkFwUFhM?=
 =?utf-8?B?UzdadXlXQngxZkN3UjlWaEVmYk1PZ1RlaEJOR3NCMmNjQjBvek15ZE9LdjRY?=
 =?utf-8?B?NWlzUmh2b05TbEVRSlkram5yV05CYVRkVDVVU1BXbWt0aStFSzU4ZWFFMHMy?=
 =?utf-8?B?Z1NaeTNtTHRoRytMT25qcmJleTNKR0VhSS92VHRkN3hNZUYvUnE3VnQ3Vldv?=
 =?utf-8?B?dHpJbGZXZUJpM28wSFdWamlBSlJ3T0JDQ2ZaeUMvVlV3Tlhud001V1o5YkJX?=
 =?utf-8?B?bWY2L1Frb05TTC9ZQTBqYmxGVXo4L1IyZ1psY0trdU5Fbzd5dTZiMXdBVGFI?=
 =?utf-8?B?cWt1MC9zeTdMeENtcGpLZ2lqRXB3bFpyRjdYQm1IdnRBZGUyMktMWWNiVERy?=
 =?utf-8?B?VEY5SFFxQUF0VHpyRUsrdG12R2RkcjZqNXpPRS9sSC9INHJ6M3dsNmU4LzNX?=
 =?utf-8?B?Wk9KcEVGUUJkRzYwN0JJVnN4NDRvUVhYNWhacUkrUm9yQ29ERnJpOStiWnRX?=
 =?utf-8?B?aS9UTHkvTmhsVEd3OGNSSFRRb1kwSS9zcUhHeHJKQzloTXNNNUtCdUcwSDlj?=
 =?utf-8?B?UlMrL2UveGFkSUNkQjFOQjRnMkRUZ1p0Q3cvS1hzQ290ZWpJbU52QkY5a29C?=
 =?utf-8?B?eW91R2dvTHBPSjFiY3RrdndsanRodmRXRXBKYTd0MWN3S1RVVTV0VGlCSzR1?=
 =?utf-8?B?MVB1THV4bGpMZ3h6WXlIcndhUGhGVHdoNlo4RlNWNXByalZnbEdGUE9JeWsz?=
 =?utf-8?B?S1NJSnI2UmV0SkxwT28zNG5FeEwyTXhlQnBEUDFuR2hQV0pGWkhGOEpSQ0dH?=
 =?utf-8?B?V0tqSUp5TENtQlJrQmtUT3ZldGpyVW00S3lSQkRISE5uTEhxeWNLT1M0UnFW?=
 =?utf-8?B?WW5rT1lXTUlNa0o5dXljS2JQZnFoRTkxTzZWMklYRW0vRmVRaFJrTkpVWDF3?=
 =?utf-8?B?Z3FSMU5paHF4MjE4cVhFalJ5S1d4MkVldWFuVWYvOGg4L01Dc2NHVUNYa0cy?=
 =?utf-8?B?RWFkL1VYUFI5UjMvVUhxVUNjb0VSNUttcG51M01UclNyUFJyT29IOCtmWHMx?=
 =?utf-8?Q?s3ZSaEfu9qePjUnvIZuagQP6QNAHEQalYEx1EHs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c287ceb7-3750-49e2-1df2-08d98030c042
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2021 14:28:31.7512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0cWYdZ/DLTHJ3DaX1MaWcbxovlDuaBQLDDbz4dtRNITrUN8Uo4BxoJT2jrb04b2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3522
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: STQ9_SkQHvgd4P8xkIutw7yFDRfJW5dr
X-Proofpoint-GUID: STQ9_SkQHvgd4P8xkIutw7yFDRfJW5dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-25_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=944 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109250108
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8902a650be=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.482,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IE9uIFNlcCAyNSwgMjAyMSwgYXQgNDowMyBBTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PGY0YnVnQGFtc2F0Lm9yZz4gd3JvdGU6DQo+IA0KPiDvu79IaSBQZXRlciwNCj4gDQo+PiBPbiA5
LzI0LzIxIDA4OjE5LCBwZGVsQGZiLmNvbSB3cm90ZToNCj4+IEZyb206IFBldGVyIERlbGV2b3J5
YXMgPHBkZWxAZmIuY29tPg0KPj4gVGhlIGdwaW8gYXJyYXkgaXMgZGVjbGFyZWQgYXMgYSBkZW5z
ZSBhcnJheToNCj4+IC4uLg0KPj4gcWVtdV9pcnEgZ3Bpb3NbQVNQRUVEX0dQSU9fTlJfUElOU107
DQo+PiAoQVNUMjUwMCBoYXMgMjI4LCBBU1QyNDAwIGhhcyAyMTYsIEFTVDI2MDAgaGFzIDIwOCkN
Cj4+IEhvd2V2ZXIsIHRoaXMgYXJyYXkgaXMgdXNlZCBsaWtlIGEgbWF0cml4IG9mIEdQSU8gc2V0
cw0KPj4gKGUuZy4gZ3Bpb1tOUl9TRVRTXVtOUl9QSU5TX1BFUl9TRVRdID0gZ3Bpb1s4XVszMl0p
DQo+PiBzaXplX3Qgb2Zmc2V0ID0gc2V0ICogR1BJT1NfUEVSX1NFVCArIGdwaW87DQo+PiBxZW11
X3NldF9pcnEocy0+Z3Bpb3Nbb2Zmc2V0XSwgISEobmV3ICYgbWFzaykpOw0KPj4gVGhpcyBjYW4g
cmVzdWx0IGluIGFuIG91dC1vZi1ib3VuZHMgYWNjZXNzIHRvICJzLT5ncGlvcyIgYmVjYXVzZSB0
aGUNCj4+IGdwaW8gc2V0cyBkbyBfbm90XyBoYXZlIHRoZSBzYW1lIGxlbmd0aC4gU29tZSBvZiB0
aGUgZ3JvdXBzIChlLmcuDQo+PiBHUElPQUIpIG9ubHkgaGF2ZSA0IHBpbnMuIDIyOCAhPSA4ICog
MzIgPT0gMjU2Lg0KPj4gVG8gZml4IHRoaXMsIEkgY29udmVydGVkIHRoZSBncGlvIGFycmF5IGZy
b20gZGVuc2UgdG8gc3BhcnNlLCB0byB0aGF0DQo+PiBtYXRjaCBib3RoIHRoZSBoYXJkd2FyZSBs
YXlvdXQgYW5kIHRoaXMgZXhpc3RpbmcgaW5kZXhpbmcgY29kZS4NCj4gDQo+IFRoaXMgaXMgb25l
IGxvZ2ljYWwgY2hhbmdlOiAxIHBhdGNoDQo+IA0KPj4gQWxzbywgSSBub3RpY2VkIHRoYXQgc29t
ZSBvZiB0aGUgcHJvcGVydHkgc3BlY2lmaWNhdGlvbnMgbG9va2VkIHdyb25nOg0KPj4gdGhlIGxv
d2VyIDggYml0cyBpbiB0aGUgaW5wdXQgYW5kIG91dHB1dCB1MzIncyBjb3JyZXNwb25kIHRvIHRo
ZSBmaXJzdA0KPj4gZ3JvdXAgbGFiZWwsIGFuZCB0aGUgdXBwZXIgOCBiaXRzIGNvcnJlc3BvbmQg
dG8gdGhlIGxhc3QgZ3JvdXAgbGFiZWwuDQo+IA0KPiBBbm90aGVyIGxvZ2ljYWwgY2hhbmdlOiBh
bm90aGVyIHBhdGNoIDopDQo+IA0KPiBTbyBwbGVhc2Ugc3BsaXQgdGhpcyBwYXRjaCBpbiAyLiBN
YXliZSBlYXNpZXIgdG8gZml4IEdQSU9TZXRQcm9wZXJ0aWVzDQo+IGZpcnN0LCB0aGVuIGNvbnZl
cnQgZnJvbSBkZW5zZSB0byBzcGFyc2UgYXJyYXkuDQo+IA0KDQpHb29kIHBvaW50LCBJ4oCZbGwg
c3BsaXQgaXQgdXAgdGhlbiENCg0KPiBSZWdhcmRzLA0KPiANCj4gUGhpbC4NCj4gDQo+PiBJIGxv
b2tlZCBhdCB0aGUgZGF0YXNoZWV0IGFuZCBzZXZlcmFsIG9mIHRoZXNlIGRlY2xhcmF0aW9ucyBz
ZWVtZWQNCj4+IGluY29ycmVjdCB0byBtZSAoSSB3YXMgYmFzaW5nIGl0IG9mZiBvZiB0aGUgSS9P
IGNvbHVtbikuIElmIHNvbWVib2R5DQo+PiBjYW4gZG91YmxlLWNoZWNrIHRoaXMsIEknZCByZWFs
bHkgYXBwcmVjaWF0ZSBpdCENCj4+IFNvbWUgd2VyZSBkZWZpbml0ZWx5IHdyb25nIHRob3VnaCwg
bGlrZSAiWSIgYW5kICJaIiBpbiB0aGUgMjYwMC4NCj4+IEBAIC03OTYsNyArNzc2LDcgQEAgc3Rh
dGljIGNvbnN0IEdQSU9TZXRQcm9wZXJ0aWVzIGFzdDI1MDBfc2V0X3Byb3BzW10gPSB7DQo+PiAg
ICAgIFszXSA9IHsweGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiTSIsICJOIiwgIk8iLCAiUCJ9
IH0sDQo+PiAgICAgIFs0XSA9IHsweGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiUSIsICJSIiwg
IlMiLCAiVCJ9IH0sDQo+PiAgICAgIFs1XSA9IHsweGZmZmZmZmZmLCAgMHgwMDAwZmZmZiwgIHsi
VSIsICJWIiwgIlciLCAiWCJ9IH0sDQo+PiAtICAgIFs2XSA9IHsweGZmZmZmZjBmLCAgMHgwZmZm
ZmYwZiwgIHsiWSIsICJaIiwgIkFBIiwgIkFCIn0gfSwNCj4+ICsgICAgWzZdID0gezB4MGZmZmZm
ZmYsICAweDBmZmZmZmZmLCAgeyJZIiwgIloiLCAiQUEiLCAiQUIifSB9LA0KPj4gICAgICBbN10g
PSB7MHgwMDAwMDBmZiwgIDB4MDAwMDAwZmYsICB7IkFDIn0gfSwNCj4+ICB9Ow0KPj4gQEAgLTgw
NSw5ICs3ODUsOSBAQCBzdGF0aWMgR1BJT1NldFByb3BlcnRpZXMgYXN0MjYwMF8zXzN2X3NldF9w
cm9wc1tdID0gew0KPj4gICAgICBbMV0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7IkUi
LCAiRiIsICJHIiwgIkgifSB9LA0KPj4gICAgICBbMl0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZm
ZmYsICB7IkkiLCAiSiIsICJLIiwgIkwifSB9LA0KPj4gICAgICBbM10gPSB7MHhmZmZmZmZmZiwg
IDB4ZmZmZmZmZmYsICB7Ik0iLCAiTiIsICJPIiwgIlAifSB9LA0KPj4gLSAgICBbNF0gPSB7MHhm
ZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7IlEiLCAiUiIsICJTIiwgIlQifSB9LA0KPj4gLSAgICBb
NV0gPSB7MHhmZmZmZmZmZiwgIDB4MDAwMGZmZmYsICB7IlUiLCAiViIsICJXIiwgIlgifSB9LA0K
Pj4gLSAgICBbNl0gPSB7MHhmZmZmMDAwMCwgIDB4MGZmZjAwMDAsICB7IlkiLCAiWiIsICIiLCAi
In0gfSwNCj4+ICsgICAgWzRdID0gezB4ZmZmZmZmZmYsICAweDAwZmZmZmZmLCAgeyJRIiwgIlIi
LCAiUyIsICJUIn0gfSwNCj4+ICsgICAgWzVdID0gezB4ZmZmZmZmZmYsICAweGZmZmZmZjAwLCAg
eyJVIiwgIlYiLCAiVyIsICJYIn0gfSwNCj4+ICsgICAgWzZdID0gezB4MDAwMGZmZmYsICAweDAw
MDBmZmZmLCAgeyJZIiwgIloiLCAiIiwgIiJ9IH0sDQo+PiAgfTsNCj4+IFNpZ25lZC1vZmYtYnk6
IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4gLS0tDQo+PiAgaHcvZ3Bpby9hc3Bl
ZWRfZ3Bpby5jICAgICAgICAgfCA4MCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPj4gIGluY2x1ZGUvaHcvZ3Bpby9hc3BlZWRfZ3Bpby5oIHwgIDUgKy0tDQo+PiAgMiBmaWxl
cyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkNCg==

