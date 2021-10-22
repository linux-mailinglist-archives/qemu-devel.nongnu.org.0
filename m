Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91983437283
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:07:27 +0200 (CEST)
Received: from localhost ([::1]:45544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdoeD-00078b-N1
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=992974b268=pdel@fb.com>)
 id 1mdocQ-00068i-45; Fri, 22 Oct 2021 03:05:34 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:47710
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=992974b268=pdel@fb.com>)
 id 1mdocO-0006cn-BJ; Fri, 22 Oct 2021 03:05:33 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 19M1d7RQ007420;
 Fri, 22 Oct 2021 00:05:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=891EUgz88Na8OVpn7uPqmrfLrsJjVyFo/5MJLufGwGI=;
 b=jXZZ0ErDxCZ8c/olHzUnGtwz/r4IfU8nHpWSYe0KIiqkaEirKRerzDojPNgHynocc+Za
 lFkFEhbGlD3yNRa1bwZcJKgkPq1wkQpSJB2VtxCrd/OMGnyvUkn7mknJBDqjpcbW/AFn
 QLGOBkXROApwRniLrGMtMoZmpkZa8U1mmow= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 3buktt28u4-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 22 Oct 2021 00:05:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 22 Oct 2021 00:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNJQM9i2nfPdiSTSqBCBrkyliZ9THCXF7sUJ7PUlA+wyuCMKD0QJ5UHhB/iPhnbjlVLo8ftEHl0PB9q3nPi5AGoVxXQhKnT6oRK5JXj4rm9OUKaCy7gjakN1GCt8IvX8rfpRYERnfGmX9ZYUPBXw6uXG4iieto4NKyH8zX1XAkHFTNXWzy6MOXV9O4H3TSTjWy8cd6jtQVwJCS4Dn4jytAJ0dWNYMmJmSgyQfPwHo7ClQRjbMMJNBmPWy9P7Gl5PXfVcSY5cjzQdxdpWexb2BNrySsTIOm/D/mdm8EOZMoRiLL6LXZCi+dNso72idaDip9kxtqDMbQ9vTJQKtHDSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=891EUgz88Na8OVpn7uPqmrfLrsJjVyFo/5MJLufGwGI=;
 b=XouUsTDux0gYt6cWenyui/MJXC2ruJIfSU3rGCZ/2DPaD7RN3is2rOmHvIJEJip6dNWscsEsHJ0OxKAgUuM46hSDxKN7HOrp5sFM0hT1BMPuGi4ndovVWiHmO9tlkqcVn2TMA55OH6J7Ebjec9kT05tcGx8tae6zYX5icujxsBxNT85zuE0Kcpd2N6TmStnGaR5rBrn1a/zIxtTcJTAEL38b7p7AMQnESv/IjjH+A1BJSskj969IQU+MsRzR5QdZwtE0WAGUk0bH959H4GNngW4iU+xwWBzfo97zo23Fyb74yTsseeHH2eftWZQ3CBoLcCPkmR2Ydfu8OdpN3RWOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY5PR15MB3554.namprd15.prod.outlook.com (2603:10b6:a03:1b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Fri, 22 Oct
 2021 07:05:14 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e034:cb74:cc86:7f89]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e034:cb74:cc86:7f89%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 07:05:14 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate boot
 function
Thread-Topic: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate
 boot function
Thread-Index: AQHXxW73qnvTQ5gpYka5MggBbmtl+qvbjZ4AgAL+3ACAAA75gA==
Date: Fri, 22 Oct 2021 07:05:14 +0000
Message-ID: <324C08E3-81AF-4B9A-9024-58FC4C9F05D5@fb.com>
References: <20211018132609.160008-1-clg@kaod.org>
 <DDD67A99-FA65-4671-ACE6-5D3BACE3F45A@fb.com>
 <2c54310f-2800-33ac-7c47-500a24f88b8f@kaod.org>
 <c898783c-50e1-df8d-2246-c16e85db6c0f@kaod.org>
In-Reply-To: <c898783c-50e1-df8d-2246-c16e85db6c0f@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39b9fc15-b121-4f88-0bf9-08d9952a4bc3
x-ms-traffictypediagnostic: BY5PR15MB3554:
x-microsoft-antispam-prvs: <BY5PR15MB35546FA7A62606255E370D0FAC809@BY5PR15MB3554.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /K5+X7zh5zU6AcJdHfvMDZpci68OhnnDKsSMGeZ1sEq7Owln2x8HWh28jltw+Fpxd5xwPJGMmSZcHmN0QQ4eWHlpyLMypbH1nHHOxcoeknaF9RhNDb49Xk63JIbb5hNKrblYmEU8DTda4LRTjadX1dvGhoNT7MPme86JZoTqy9kiM14CYcB693OwiXOXCQTSF/y9lWT205DU0XF8O7UwdA4bigwgwPggwoMNlT3COBVImSmzTqAqGheZ8zXis3kIqS+Q7X2KB/ORKDKFkMzG46n8KBLgdsgf7MgDjvovpz5vI9swYirRzkCxtfHTYzRt5P2Q3GP+JyWWIcPyok202YmDyja9gtiU36lJBY0LviLp6v9HRVCWJhcIQXP+bOBhw3vUfc/pjr5oozlCOuOoNzl+BTwaqqd/RhnqIaiB7u/rG5yAtNQ1dze1QXt2Itbgf0T7EOt38/raqMP8+QfE6+m0CyvDx4IArYKBZEkMuOkxae/Xteg3cQxd/9mtQlAFRswJObdAAutcXAK4oWusP29gZXbUqOx8QMvxM+QMqHwXzB5g3qU7RNpWK6S6WwDfhfM41J7FvoqjNhf3ps3uUA+/HZvFnB0uOLzeP9VRAJHCKjDFizfqDADCAURTlsnykOLADWhimNmz1HfRsweTbQ0UlRXaJx5Yr3q7cEjp+9tXZ3stQi1kigaPlle5dd19SvpVEQ37hX22n5CLRyxlleDyK2J4e/gq1Kt1tN2G1z8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(508600001)(6506007)(5660300002)(2906002)(66556008)(66476007)(8676002)(8936002)(36756003)(122000001)(53546011)(71200400001)(38070700005)(66946007)(86362001)(91956017)(6512007)(54906003)(33656002)(83380400001)(76116006)(66574015)(316002)(6486002)(64756008)(66446008)(2616005)(4326008)(109986005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekZTeW1mbTlURDdnKzVZUzN1c0R2NnRUSWxDZEFndWFmY25qaDN1NlZML0pz?=
 =?utf-8?B?VkxXL1A0MFJsS0lWbkUvU1NNMjdpSTNVck1JTmlISXR3ZmhOaC9pejVJVkVT?=
 =?utf-8?B?S0svMzNlYlV4KzRHLzFKT0M1L3Btek4xWTF0ZXlUK09JSUNMMmNRWlJGeWo5?=
 =?utf-8?B?VE5WZ1dxNGJmOVREdVhlRFVvVmk5RlRNcS9JOGZlZEhXMmZJZ3ZaV2laWmVk?=
 =?utf-8?B?Ym5vR2xYQkt0ZnBnRHk4RWN1cUF4elZSTVRvOE1oeHJieTdFZmpTV3BOYkFr?=
 =?utf-8?B?Y2kxZlBqT0lkUWFBemhtbWlDeEVhK2lZY3A2RmVlRDFFQTB1ck8yclhNVFN0?=
 =?utf-8?B?dGZ3RFVESlpFd29RZ2VZYnZ6aHVJbGE1MXVaTUtlV3gxN2JSNHNtYk9oSkJk?=
 =?utf-8?B?UTJ3QVM4SDhCSXRUSERSWVZxeVlZWm9JQjJDLzl3WkNJbHJQQmtwbEMyN1RB?=
 =?utf-8?B?WnF1eU1KY0pES0lqUTVkZE1XYlVrVkhlbmQwejVGWkZMUlJ1S0JaeVFkdUF3?=
 =?utf-8?B?R3pCQjdNVXlTcjl6YXBmeVJJQzI2Y3ZUV3ZXZERtNFBySWcvMi9TcExjV2JM?=
 =?utf-8?B?T3crQXdDc1RibC9WTDA1NVJCYUViK2JPV2IvNEpkS1R3Y2VzNzZGRVRiVWdQ?=
 =?utf-8?B?RnE3dm16VGovcjU2c1A1N0doeHBBZnZhbXpRVGZWcnJhWXh3amRmam1oSTZY?=
 =?utf-8?B?em15RmJTazFKcFpzbnVKT25WWnQ5bTB4SmYwTlJVWFMzemF6VHVxTVJ0M1VG?=
 =?utf-8?B?Sk1BRXh6djBTNVJzdVU5Tk5KbDAvN29WOW5LeVJTMUFodjFnSk9hWW1LWHlM?=
 =?utf-8?B?UXg2ZmZOVWRyejZSUEl4V2t0SWtPTE5ESWdIK1JkM0JMa0JtN3ArdDJ2RU1U?=
 =?utf-8?B?aldmcGQvOTFWTzU2V0lUSTFtNS8wRjNNMGREWEhKNVhCWDhxMlY2Z3ZzZnBs?=
 =?utf-8?B?eWRsSHZlSjJUbjFTOUxZZFZaelhhbmdXQVE5UG1mdzlvRFBqbGFZTHZlaDVw?=
 =?utf-8?B?RWZ4NnRUSGhWSVdqOUlOdmszUEExKzVwc3hKaExNVmNVbVFmQXhEZ3Azcm1q?=
 =?utf-8?B?RWNVbnhDR0xzNmhiSVZTZTRqYWljbXNWNGw3R1RUU053ZklwdTJvWlMxRUlu?=
 =?utf-8?B?cVMyYWhsbjhYb093eVZLekcvYy92OVNCd09OelVNa2ViaFpWUUFEdkNQZ0hU?=
 =?utf-8?B?Mm5FMklVTEZFVzZmWTJkcTZkdkRacjZWMkhZODJrYjdWbE5iMDFXVnkvM3pL?=
 =?utf-8?B?cm8ydlhndkl4YXJCRDI2S25JbWl0a0NZODgySDVzTEE2UHJDNldPUm9NdFF4?=
 =?utf-8?B?a0VOa2d5Z29mTG9EWnpBM2thTm54eXRaZ2wxU05LVlRPZ2k4Mzc4VkNMQmhy?=
 =?utf-8?B?dnYrS0RHcmFXcU5TY3NsNkRNSzdIdmhDdkZoQk1JaURpMzhSQ0p6ZnZ5K041?=
 =?utf-8?B?QjN6cEtORFk3V0hWRnlCQUFHL2Q4azI0WEhyZGJMajRmTVA1Z25vMkIrMisz?=
 =?utf-8?B?UWhDTlhabXArWkNKRDhBRUxQNC95bXFDMWdZNENENkNXMnVVOGlleVhtcmN6?=
 =?utf-8?B?enBFUXFydk11NVRzT09qcHV0cDBZSjBHL0FmN1pGaHF0L1BYWFBDdG0zYmVi?=
 =?utf-8?B?S25LczdXOTJDaS9ab3ZhQmZvWCttcWRldGo1dE9Kb1JUZGExSUZMZGpvbWUr?=
 =?utf-8?B?MFRUd3dXcnkrUzF4TGtBcW50dlR2Qm9sdmZ3MnN1RGRGRWFMdk1QMlNpRTVo?=
 =?utf-8?B?Y2tLTFVhenNPNE1rSkNkdnR2aGY2Y2cxQ2Y5bytyQnJaWGJYNHJvdTZZY2pz?=
 =?utf-8?B?S0hKZ0RKbEVxenR2OGFmZzJDb2M1eHVqa0RLQkpJRkwwMnBDdjV3ZDkzeml2?=
 =?utf-8?B?eW9NSTNMZjhMYXpoZ2N2UUE4dVl6Qzg2UW9uT1pTOWNTZ2NYRDJXUDU1bE50?=
 =?utf-8?Q?xO30OTUIDiZk0em+x51TYFyD04D/BSON?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8E6DE61B5FF574EA35C0F4AE65AC745@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b9fc15-b121-4f88-0bf9-08d9952a4bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 07:05:14.0155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdel@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3554
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: tnOQvBkbYL8P5imYfUWDIb-_qJ0PNJlm
X-Proofpoint-ORIG-GUID: tnOQvBkbYL8P5imYfUWDIb-_qJ0PNJlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_02,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=742
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110220037
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=992974b268=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

DQoNCj4gT24gT2N0IDIxLCAyMDIxLCBhdCAxMToxMSBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPj4+IEFuZCB0aGUgRk1DIHJlZ2lzdGVycyBhcmUganVz
dCBhbiBhbGlhcyB0byB3cml0ZQ0KPj4+IHRvIHRoZXNlIHdhdGNoZG9nIDIgcmVnaXN0ZXJzPyAN
Cj4+IElmIHRoaXMgaXMgdGhlIHNhbWUgd2F0Y2hkb2cgbWFwcGVkIGludG8gdGhlIEZNQywgSSB3
b3VsZCBzYXkgeWVzDQo+PiBhbmQgdGhlIGxvZ2ljIGdlbmVyYXRlIGxvYWQvc3RvcmVzIHRyYW5z
YWN0aW9ucyBvbiB0aGUgQUhCIGJ1cy4NCj4+IEFkZGluZyBhbiBhZGRyZXNzIHNwYWNlIGZvciB0
aGUgV0RUIHJlZ2lzdGVycyBpbiB0aGUgbW9kZWwgaXMgdGhlDQo+PiBjbG9zZXIgd2UgY2FuIGdl
dCB3aXRob3V0IGltcGxlbWVudGluZyB0aGUgYnVzIHByb3RvY29sLg0KPj4+IEp1c3QgY3VyaW91
cywgaXMgaXQNCj4+PiBzdHJpY3RseSBuZWNlc3NhcnkgdG8gdXNlIHRoZSBGTUMgcmVnaXN0ZXJz
IHRvIGRpc2FibGUNCj4+PiB0aGUgYWx0ZXJuYXRlIGJvb3Qgd2F0Y2hkb2csIG9yIGNvdWxkIHlv
dSBqdXN0IHVzZSB0aGUNCj4+PiBvbGQgYWRkcmVzcywgMHgxZTc4NTA0Qz8gDQo+PiBIZXksIHRo
aXMgaXMgc29tZXRoaW5nIHRvIHRyeSBvbiBIVyBhbmQgY2hlY2sgaG93IGJvdGggcmVnaXN0ZXIN
Cj4+IHNldHMgZXZvbHZlLiBXb3VsZCB5b3UgaGF2ZSB0aW1lID8NCj4gDQo+IEFuZHJldyBkaWQg
c29tZSBleHBlcmltZW50cyBpbiB0aGUgcGFzdCBhbmQgdGhlIHR3byByZWdpc3RlciBzZXRzDQo+
IHdlcmUgZXZvbHZpbmcgaW5kZXBlbmRlbnRseS4NCg0KSSBzZWUsIHllYWggSSBsb29rZWQgYXQg
c29tZSBoYXJkd2FyZSB0b2RheSBhbmQgaGF2ZW7igJl0IGZpbmlzaGVkIHRoZSBleHBlcmltZW50
cywNCmJ1dCBpdCBkaWQgc2VlbSB0aGF0IHdheS4gQWxzbyBhc2tlZCBzb21lIG1vcmUga25vd2xl
ZGdlYWJsZSBwZW9wbGUNCm9uIG15IHRlYW0gYW5kIHRoZXkgY29uZmlybWVkIGl0IHdhcyBuZWNl
c3NhcnkgdG8gdXNlIEZNQ19XRFQyLg0KDQo+IA0KPj4+IEluIG91ciBPcGVuQk1DIGluaXRpYWxp
emF0aW9uDQo+Pj4gZm9yIEZ1amksIHdl4oCZcmUgdXNpbmcgdGhlIEZNQyByZWdpc3RlcnMsIGJ1
dCB3b3VsZA0KPj4+IGl0IHN0aWxsIHdvcmsgaWYgd2UgdXNlZCB0aGUgb2xkIGFkZHJlc3Nlcz8g
SnVzdCBjdXJpb3VzLA0KPj4+IHRoZSBtb3JlIEkgdGhpbmsgYWJvdXQgaXQsIGl0IHNlZW1zIG9k
ZCB0byBtZSB0aGF0IHRoZXNlDQo+Pj4gRk1DIHdhdGNoZG9nIHJlZ2lzdGVycyBleGlzdCBpZiB0
aGV54oCZcmUganVzdCBhbiBhbGlhcy4NCj4+IFdlIHNob3VsZCBhc2sgdGhlIEhXIGRlc2lnbmVy
cy4NCj4gDQo+IEFzcGVlZCB0ZWxscyBtZSBpdHMgYW4gaW5kZXBlbmRlbnQgbG9naWMuIFNvLCBJ
IHdpbGwgZHJvcCB0aGUNCj4gbW9kZWwgZnJvbSB0aGlzIHBhdGNoc2V0Lg0KPiANCg0KSSBzZWUh
IE9rLCB0aGFua3MgZm9yIGludmVzdGlnYXRpbmcgdGhhdCENCg0KPiBUaGFua3MsDQo+IA0KPiBD
Lg0KPiANCg0K

