Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D668E41D0BD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:48:32 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVkFT-0006f4-TR
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVkDY-00058r-A7
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:46:32 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:3236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVkDW-0007Ih-2v
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:46:31 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TNkG4u029266; 
 Wed, 29 Sep 2021 17:46:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=5zwpvkBbcZeWGyoNrC3/9NA7xmn64cLFY2DumPFyt+A=;
 b=QzbHN8ke4VaQ4IuF9IdgTWsboYHNch3cBpT5uUMUnvLvWuYN3vAXpNQjWF5YA6lD33VM
 r0159y1uqDPoLwKPPrKdMmTWpgeN2MZ4QjwknOEd4JmqKkFj0TTfy8NgKgTFyG5W+HUr
 xvY1AQq4WPCHV7r+SXXcqbdFDAo7uGYfuTo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bcrv64ykc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Sep 2021 17:46:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 29 Sep 2021 17:46:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLz+7IqJTJkDbo2s+mm4mXYGPr6W0QuAT6p/9uTQdSORxCd5Xx1YMhJRUOgPRJ2G6pGhhh8B7AhZyj7MtaDw6R+FRm5NcM+FUA3De7hBkGSQ52iFKURb4XwvMtnNtTAn8NZecRMlUcYjyHdiiI8Jsfx6bXoDWWryFXhySYQKD0bqF+mJtoSXFoNQTLJtuSNwETHjOQ4o22yiqx0t3Xd3rBvK+Gbnzr7jyhGwAhmIYBHVtulfIpPZbdLRSZoqx0j0FHRzsCe0OL/vkJGIJLpUh0NZ4vf8UtO0TKSBD88FjEerWbD+GuzUSKx+/4Xsoe7kTDBiU2+ysxk2/Q2TVHOu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5zwpvkBbcZeWGyoNrC3/9NA7xmn64cLFY2DumPFyt+A=;
 b=gFWTLjY7karOG3YEyMrJDfC1yPZ02IhrrVPlgQe0bwfih4wG+7mCYQiXXp9QisNCwWG4W3+Xh0CgQJ0FyN/m36KtXrQJLRF83ERN07Kr8OLeVLi/QDiyKx0dMYiLAi3kXdFjMzaPWHIrf5HHl2x9qZQ2AYvQ+OlEG0m+kqYMf7nXCJk+EcG6vuhTd+7q8NSuBXC2bTdcVgHtn2N1rAknLbksL171dseg3g1dU8/ctGqB1FbQGxTGyjxCHUbjaTk16djjt65Vdgmt1fJTe3T6qZnHbpdQRgjTn/JS7U9ITGf5/+oXCeWGEk5i/TOxQWanQvQlYlQPsRq8xO4PK4W+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB3030.namprd15.prod.outlook.com (2603:10b6:a03:fb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 00:45:59 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 00:45:53 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, "rashmica.g@gmail.com" <rashmica.g@gmail.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Dan Zhang <zhdaniel@fb.com>,
 "damien.hedde@greensocs.com" <damien.hedde@greensocs.com>
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
Thread-Topic: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
Thread-Index: AQHXtBhvyGkUUD0zdEGBkIvSFwZ2p6u5ReCAgAJ6+oA=
Date: Thu, 30 Sep 2021 00:45:53 +0000
Message-ID: <7B801EC5-8A3B-4C06-8FDA-194AD84C437C@fb.com>
References: <20210928032456.3192603-1-pdel@fb.com>
 <20210928032456.3192603-2-pdel@fb.com>
 <00f8b06a-337a-2a93-8f22-642760424905@greensocs.com>
In-Reply-To: <00f8b06a-337a-2a93-8f22-642760424905@greensocs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de1dad7f-ec34-41eb-5d8e-08d983aba858
x-ms-traffictypediagnostic: BYAPR15MB3030:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3030FE5193FB073C622940CCACAA9@BYAPR15MB3030.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IxVegPCAfaSsu/xmPMMeqFAm4fOCYKeE5nw1Q5V+G2BPAL4zKgkZNABpF4x3QY2ZFs/DCLlgRRJVhTISnJCANmpvkCgtxf5NBBgWYxYedpB2MOE8aNxY9vBTvsUatIavNInhFYjyHpZIM8pyHVzi5AugVEqYlqC4MePqnQs3sJKEca1lnxMDjhMRsgfWvDSr3LakIdsEskOnlSDXr9PGwF15kxDEOZDF1+hIDMOHV1PEDcyAwoOe+ViyGZhcrnNtOz5I2GN1QjEzm/QvlO1T1UUo0/9oP/ub87hJFWmMtEK5t+7go38cNlxLoHoOpDYwWWNm4FqzkHrnc04addZ3VLrf0kR5bVU3cHuLSoaav2N75q1AaKQkaJMC7Gdh/iRnjDQw7FhFZUjVQPgNDS+IeCA71YPjJr47vOepnFJy55ZbGUc3DRaesnBeeFUGUKMtx15uKLxEuzvlC45w5HrPyFsYxf9qIYMMY+/QYXz/cMQunCR2gD07YMN8tCStvf6Ts0/PB8OfFDDhCZohrxFNT8UXP8caMneDs9iMK4/d+Zt5ftaL6NvlLs3OThMyyy8Pb2+I6o7gDapw5ZBIlLXlfrq2qxX5YCBqGATEHqQwWXKydNnZ+GRw9WJNdg/MXFHM5hzU7cZMazBDabepDghu2Q1GmhmxvJ/GhLAkUl63xoCQiy+y2oQg7246xde7dbWPiJtXZnsHQfOWJBg2cUvcfB8ONeUMlfNyC65jAFQWVQY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(6486002)(186003)(86362001)(122000001)(38070700005)(508600001)(71200400001)(38100700002)(76116006)(6512007)(8936002)(8676002)(5660300002)(54906003)(36756003)(2906002)(6506007)(53546011)(2616005)(109986005)(66556008)(66476007)(66446008)(66946007)(316002)(83380400001)(4326008)(64756008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3pkbjlKSkk4QVdvdS9JYXZaL0lWVkp6czlwU0FxWm9tOElhM2dLMWUvRXFH?=
 =?utf-8?B?aHBCdVF0ajdWby91YlIxbXZlNlNKRmNJdmgybGkrbGtwQWk1bG1IdlhCV2N1?=
 =?utf-8?B?SmEyREtJQ2VLdzNuQ0JhNmlFSVhXR28yT2ZrT05sem1ZWUlIK0NQZDhHcFM5?=
 =?utf-8?B?cCs0YVdybndqOTR1L2NJa2xYSWlRL0hRdEhNY3YzTFhhekhZVWZyYW1SR2JB?=
 =?utf-8?B?bnB4YzYyckp1YW1qWnVVT01yOVhwdFczT1NZbXFOSXlaUzhnVlBHdk54S1N1?=
 =?utf-8?B?VHhQb2l1eFpMT2gvS3BiN2RCdDc2bTYzYnE4VUpNOCtDdlY0enJtTnZkYlZO?=
 =?utf-8?B?K1hYd2h5MFRYY3A4emZnS2VYUFROOFNXRDFMRXhuYTRmM0dDOHVBdjdVeWNy?=
 =?utf-8?B?US91WXJRQ29CWW9RdXl1NkFIRDRmZ1BoS0w4ZWU1V0JOOTFIMkFMZjFGSmpm?=
 =?utf-8?B?cks5bnFWZEJnanpHRThuc3Q4QlhyK0E3aXp6eUc3TUxZUitSa2xNb0RlZE5z?=
 =?utf-8?B?d3RmZW9Qa0JZVnViN0hRZytFL3ZHVW1jMHRIdXdqSnBZelRFWkkvQXpMVzhE?=
 =?utf-8?B?Wk4vb2Z5c0xLYnJBcDhhejI1UnZOSis5NmFwSlJSN2dRYTBVSFhFbEVqbVh6?=
 =?utf-8?B?Vk9kTndhdnF4bmhnQXJPa21wVzc0bE4xMjFObFVGZ1FVUGo5RVM0S0lab1NT?=
 =?utf-8?B?eEM4L3M5UFZrM0FKUktRZStVaUxkanF5VkNiRDkrUkYyQXlGUzJoYis0Q0FQ?=
 =?utf-8?B?eTJDNW1yK3d2dTNkM3hKeVJQZTBJWTYxcm9UNE9jOVl4SVoraEtOOXplZDlj?=
 =?utf-8?B?MC9iMmoyaHRIeUIrenY1aWFZVEFQNkFEU3g3dDZTbndPcFdtekZzWlJpWFpR?=
 =?utf-8?B?RnA1UXpDeUlPbzV3VXhScFNJVUN6TFdFQzNiTnRJVmZIR0VRT1VxN2VvTEdy?=
 =?utf-8?B?dGRaa25YU1F0eXhPeTVDNEx4Mi9jam85THlRSC8yYW5hQ0Q1WVA2WHZvNUFw?=
 =?utf-8?B?aDQyeDJyQTVQbVMyTmxpcWxpU1RIQVRQcUlWOHBHbFJUblB6Tk5HZXdkcURn?=
 =?utf-8?B?MFJXRnBEb29WMXZUQ2dnVmZYcDJLTGxjd29wTnl3Nzdyck1XZ3ZpT1JhOEhM?=
 =?utf-8?B?elBDTjcyZTBmWlBVKzVTNFJSa0paYXFrT0ladUUwYm00eXN1Y2YwTTQ0Ti9r?=
 =?utf-8?B?MXljNHhKcTRlaFdVV2h0dmppYXVjcUk5d2kreHhUMnlCMmFyeGs0d0packZv?=
 =?utf-8?B?aUxDL0d6TnduY2xRUXdMcDdSdXFPaWVEWDVwdS81SFRCYUdRWHJ5VVVZWDN4?=
 =?utf-8?B?TFNmNVkxNGZocUhYdllXMVQxbE1UQk50V0ZXaXdzSjVXR2VyUTJsZkUzTmRi?=
 =?utf-8?B?czY1SGZCL1gwcTcvSmlxdlB6cVBlbG13eXRBMTZMcFpBSTZrTjIrNEZ5NnIz?=
 =?utf-8?B?clQ0OXJXWVM2NXVNZWh4d1pHN1c2T2hDOE9odU5wQ29LTlpJeWtmVytla3hS?=
 =?utf-8?B?dEdIRmRCOHZ2N3NZcFNxamZhMTB6Q0hFV2dJTEdiajFGMUNkd1lHOGdCV2Mx?=
 =?utf-8?B?YVhyVFZzTW9VNmVEVFZjSmQ3cVhUQjU5MDJSdjBVQ25UTlJyYlVENi9DNStl?=
 =?utf-8?B?RFpXdDR4V2JkQklZQXZUOC85SHYxRS91TnpxbThFbWlXR2pULzNLdXlQbmVo?=
 =?utf-8?B?YWE2amE1enQ2YUIwSjNKOGJZZnlGRXNVclY5bHdWL1huRmpaelZxTXgzRk05?=
 =?utf-8?B?M0NxRWxTcVRWQTdHNklkNWY0MkE5Sm83RUt4NElCS2JOQ3dJK1JORlZzSVov?=
 =?utf-8?Q?r4PPe9wr0jEdCPiSP7AqTVMy/8xW8d/uI6pg0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <474E0CB4B4681542896957650CE20F05@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1dad7f-ec34-41eb-5d8e-08d983aba858
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 00:45:53.5466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mgUWCG4tfo2B1LF6XCKvZ1x/qcn6xStEDGWWXTB7NgdNaYkC7/8V2jw9PMPknVgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3030
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: _RUyY0xk2MZnKO0eBbJKkhWt409vrXYN
X-Proofpoint-ORIG-GUID: _RUyY0xk2MZnKO0eBbJKkhWt409vrXYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_09,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=842 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300001
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9907073e8e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQo+IE9uIFNlcCAyOCwgMjAyMSwgYXQgMzo1MyBBTSwgRGFtaWVuIEhlZGRlIDxkYW1pZW4uaGVk
ZGVAZ3JlZW5zb2NzLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDkvMjgvMjEgMDU6MjQs
IHBkZWxAZmIuY29tIHdyb3RlOg0KPj4gRnJvbTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5j
b20+DQo+PiBTb21lIG9mIHRoZSBwaW4gZGVjbGFyYXRpb25zIGluIHRoZSBBc3BlZWQgR1BJTyBt
b2R1bGUgd2VyZSBpbmNvcnJlY3QsDQo+PiBwcm9iYWJseSBiZWNhdXNlIG9mIGNvbmZ1c2lvbiBv
dmVyIHdoaWNoIGJpdHMgaW4gdGhlIGlucHV0IGFuZCBvdXRwdXQNCj4+IHVpbnQzMl90J3MgY29y
cmVzcG9uZCB0byB3aGljaCBncm91cHMgaW4gdGhlIGxhYmVsIGFycmF5LiBTaW5jZSB0aGUNCj4+
IHVpbnQzMl90IGxpdGVyYWxzIGFyZSBpbiBiaWcgZW5kaWFuLCBpdCdzIHNvcnQgb2YgdGhlIG9w
cG9zaXRlIG9mIHdoYXQNCj4+IHdvdWxkIGJlIGludHVpdGl2ZS4gVGhlIGxlYXN0IHNpZ25pZmlj
YW50IGJpdCBpbiBhc3QyNTAwX3NldF9wcm9wc1s2XQ0KPj4gY29ycmVzcG9uZHMgdG8gR1BJT1kw
LCBub3QgR1BJT0FCNy4NCj4+IEdQSU94eCBpbmRpY2F0ZXMgaW5wdXQgYW5kIG91dHB1dCBjYXBh
YmlsaXRpZXMsIEdQSXh4IGluZGljYXRlcyBvbmx5DQo+PiBpbnB1dCwgR1BPeHggaW5kaWNhdGVz
IG9ubHkgb3V0cHV0Lg0KPj4gQVNUMjUwMDoNCj4+IC0gUHJldmlvdXNseSBoYWQgR1BJVzAuLkdQ
SVc3IGFuZCBHUElYMC4uR1BJWDcsIHRoYXQncyBjb3JyZWN0Lg0KPj4gLSBQcmV2aW91c2x5IGhh
ZCBHUElPWTAuLkdQSU9ZMywgc2hvdWxkIGhhdmUgYmVlbiBHUElPWTAuLkdQSU9ZNy4NCj4+IC0g
UHJldmlvdXNseSBoYWQgR1BJT0FCMC4uR1BJT0FCMyBhbmQgR1BJQUI0Li5HUElBQjcsIHNob3Vs
ZCBvbmx5IGhhdmUNCj4+ICAgYmVlbiBHUElPQUIwLi5HUElPQUIzLg0KPj4gQVNUMjYwMDoNCj4+
IC0gR1BJT1QwLi5HUElPVDcgc2hvdWxkIGhhdmUgYmVlbiBHUElUMC4uR1BJVDcuDQo+PiAtIEdQ
SU9VMC4uR1BJT1U3IHNob3VsZCBoYXZlIGJlZW4gR1BJVTAuLkdQSVU3Lg0KPj4gLSBHUElXMC4u
R1BJVzcgc2hvdWxkIGhhdmUgYmVlbiBHUElPVzAuLkdQSU9XNy4NCj4+IC0gR1BJT1kwLi5HUElP
WTcgYW5kIEdQSU9aMC4uLkdQSU9aNyB3ZXJlIGRpc2FibGVkLg0KPj4gRml4ZXM6IDRiN2Y5NTY4
NjJkYzJkYjRjNWMgKCJody9ncGlvOiBBZGQgYmFzaWMgQXNwZWVkIEdQSU8gbW9kZWwgZm9yIEFT
VDI0MDAgYW5kIEFTVDI1MDAiKQ0KPj4gRml4ZXM6IDM2ZDczN2VlODJiMjk3MjE2N2UgKCJody9n
cGlvOiBBZGQgaW4gQVNUMjYwMCBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiIpDQo+PiBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5
OiBEYW1pZW4gSGVkZGUgPGRhbWllbi5oZWRkZUBncmVlbnNvY3MuY29tPg0KDQpjY+KAmWluZyBE
YW4NCg0KPiANCj4+IC0tLQ0KPj4gIGh3L2dwaW8vYXNwZWVkX2dwaW8uYyB8IDggKysrKy0tLS0N
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4g
ZGlmZiAtLWdpdCBhL2h3L2dwaW8vYXNwZWVkX2dwaW8uYyBiL2h3L2dwaW8vYXNwZWVkX2dwaW8u
Yw0KPj4gaW5kZXggZGZhNmQ2Y2I0MC4uMzNhNDBhNjI0YSAxMDA2NDQNCj4+IC0tLSBhL2h3L2dw
aW8vYXNwZWVkX2dwaW8uYw0KPj4gKysrIGIvaHcvZ3Bpby9hc3BlZWRfZ3Bpby5jDQo+PiBAQCAt
Nzk2LDcgKzc5Niw3IEBAIHN0YXRpYyBjb25zdCBHUElPU2V0UHJvcGVydGllcyBhc3QyNTAwX3Nl
dF9wcm9wc1tdID0gew0KPj4gICAgICBbM10gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7
Ik0iLCAiTiIsICJPIiwgIlAifSB9LA0KPj4gICAgICBbNF0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZm
ZmZmZmYsICB7IlEiLCAiUiIsICJTIiwgIlQifSB9LA0KPj4gICAgICBbNV0gPSB7MHhmZmZmZmZm
ZiwgIDB4MDAwMGZmZmYsICB7IlUiLCAiViIsICJXIiwgIlgifSB9LA0KPj4gLSAgICBbNl0gPSB7
MHhmZmZmZmYwZiwgIDB4MGZmZmZmMGYsICB7IlkiLCAiWiIsICJBQSIsICJBQiJ9IH0sDQo+PiAr
ICAgIFs2XSA9IHsweDBmZmZmZmZmLCAgMHgwZmZmZmZmZiwgIHsiWSIsICJaIiwgIkFBIiwgIkFC
In0gfSwNCj4+ICAgICAgWzddID0gezB4MDAwMDAwZmYsICAweDAwMDAwMGZmLCAgeyJBQyJ9IH0s
DQo+PiAgfTsNCj4+ICBAQCAtODA1LDkgKzgwNSw5IEBAIHN0YXRpYyBHUElPU2V0UHJvcGVydGll
cyBhc3QyNjAwXzNfM3Zfc2V0X3Byb3BzW10gPSB7DQo+PiAgICAgIFsxXSA9IHsweGZmZmZmZmZm
LCAgMHhmZmZmZmZmZiwgIHsiRSIsICJGIiwgIkciLCAiSCJ9IH0sDQo+PiAgICAgIFsyXSA9IHsw
eGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiSSIsICJKIiwgIksiLCAiTCJ9IH0sDQo+PiAgICAg
IFszXSA9IHsweGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiTSIsICJOIiwgIk8iLCAiUCJ9IH0s
DQo+PiAtICAgIFs0XSA9IHsweGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiUSIsICJSIiwgIlMi
LCAiVCJ9IH0sDQo+PiAtICAgIFs1XSA9IHsweGZmZmZmZmZmLCAgMHgwMDAwZmZmZiwgIHsiVSIs
ICJWIiwgIlciLCAiWCJ9IH0sDQo+PiAtICAgIFs2XSA9IHsweGZmZmYwMDAwLCAgMHgwZmZmMDAw
MCwgIHsiWSIsICJaIiwgIiIsICIifSB9LA0KPj4gKyAgICBbNF0gPSB7MHhmZmZmZmZmZiwgIDB4
MDBmZmZmZmYsICB7IlEiLCAiUiIsICJTIiwgIlQifSB9LA0KPj4gKyAgICBbNV0gPSB7MHhmZmZm
ZmZmZiwgIDB4ZmZmZmZmMDAsICB7IlUiLCAiViIsICJXIiwgIlgifSB9LA0KPj4gKyAgICBbNl0g
PSB7MHgwMDAwZmZmZiwgIDB4MDAwMGZmZmYsICB7IlkiLCAiWiJ9IH0sDQo+PiAgfTsNCj4+ICAg
IHN0YXRpYyBHUElPU2V0UHJvcGVydGllcyBhc3QyNjAwXzFfOHZfc2V0X3Byb3BzW10gPSB7DQoN
Cg==

