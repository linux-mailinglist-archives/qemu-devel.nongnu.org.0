Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3A51A403
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:27:16 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmGuJ-0006XO-De
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmGq7-0007lB-8h
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:22:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmGq3-0003qe-Qz
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:22:54 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244DmtRa004092;
 Wed, 4 May 2022 15:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RV8m8NDLLHQhQh/DrruEdE+UApQcIgX6q45/x5dJ3BQ=;
 b=qcSpJThsprf7lyTerafvOwiYuNQc00C1ALO7gOB63KtyaLDhIhRcrsTeciVIxGrSygVk
 I+B3YLHdj3u2Lpbmi35vAvHylk865CrZkBksBHmM+vGzKhu8p31tJGzyUHSK4h7lyhi/
 0h/phoSacicMsfxO+yBYG39vv+6yQGOajrWNFkfI1rB7OixWZVM7muZAgSity0rhct36
 pWeYGoqqOl14ZOyel4VYftNrSvXjAPfOJ5BMzrNMlFIBfusxdHBBx1meInqdWGUevEgi
 gob7ar6hBiYySgABMbSZ3MFGhvoyIxo24qeg/1Q35omUoKEzst15Nh8INAHq1T9WB/8V sw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0arjdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 15:22:39 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 244FFS7c023753; Wed, 4 May 2022 15:22:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusafn33n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 15:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/OM5Qai1E8zv4PTdMfWKsTJj1aNLucBXPwKiZItEnk71nYLmdb78KenVY2K7cc3rArCoxVEuCMh/0KFb5WBvujf1Vghv+Um43zkMxAGV/k45roNrQp/M0oe3FKgEW0pknfcCJZqJGceg9QSkvsTANCLsaYUKMuusXiIvJrpghMlSNF50pHn+Oe9Y229YFK7gh73DEVA9VHMuaJV7qkoJ0uuoHT7dpHUj4O1iMFiTrlpnrqs7LgI9VK0TAIWQUxc3a+vW2B+xyRB9qIiG9KE2OMZTK2A4mhPlJbUr3UPYYOydriOoJzTJPP6+a3LEFP0/r0N8Aey9sC6PxbMuj3XQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV8m8NDLLHQhQh/DrruEdE+UApQcIgX6q45/x5dJ3BQ=;
 b=frUYPq1n20AXletD2OyP6I31G780iFTtGCiDpUi7S313wePV++K5AbghUNvjb5ygBQkrtp2cnLpAdwlSLLAlIweDWTqXY4rMo/R0S9bvAoR0rklUzx4w3tfYUnCx1N69Wrw9m/a4bcgiPzm3ZoqYc8A+lYDiCd9pT/fVZMHYocg8MY4OtDGC4SktXaitu+7P907pruhkVW1IeWlMMXjlN+p0sbBSTrbVeCYyNTkxHg1AJKr9SViSWpIQfSLbLci9Y/1NYR2juxhNTO7z8whxQiXbJd8Bczms7bASrJssLvjkfiBc82liTD+CBSBWz3KsCu7zGiyfbwkYW0DEiMb35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV8m8NDLLHQhQh/DrruEdE+UApQcIgX6q45/x5dJ3BQ=;
 b=bEWhSQnuIAXQPPYEeliPU1XJeSIX/dnV414LvmozTTsWqM87T20hO+1rl7ekRfRwox7z26YE+0bYZI3Vz+gOyT3MHTjdhIeMaunuVjBgB3yUuwvHD736t89FY01hL2V8tLt81Jaks88cLh69lBVKYBa/VIDF9qMAG7fMlNZ5Qlo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4141.namprd10.prod.outlook.com (2603:10b6:208:1df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 15:22:31 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 15:22:31 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 10/17] vfio-user: run vfio-user context
Thread-Topic: [PATCH v9 10/17] vfio-user: run vfio-user context
Thread-Index: AQHYXviFJ6gKC1s68E+zRCuFWJP0wa0OmjM5gAA9ZQA=
Date: Wed, 4 May 2022 15:22:30 +0000
Message-ID: <86AE24D4-C203-491D-9FBF-BEE748A52E2C@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
 <877d717cd2.fsf@pond.sub.org>
In-Reply-To: <877d717cd2.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76872286-8b46-4f8f-c8cb-08da2de1e805
x-ms-traffictypediagnostic: MN2PR10MB4141:EE_
x-microsoft-antispam-prvs: <MN2PR10MB41417464C4521D5EC02E9B4D90C39@MN2PR10MB4141.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djWHIZFavVMAw7DOg5YYiP54CXrV3kzSxGIh0UIsXq2LmWWRrIluyrgR9AaFVedmJg4LzLTRZIVSOmMQLmBlLcWL7z3WlZRPKAQoBIEeI5s5o/8wqnLBvEFjNe6PjPOhp3pMNBz4Smbn9k4/6JS67J7U4aaYqAazCP8VTQXXmwA1fz2FS1fob9fIIFYjYtQOdw1lT1O9MyS3zQ4lwjdRUIZpUy8sINLbzqnlrBrNMxvgEhQfAtrq8s+Px3bIA6qkRv86INkn2YqNyLKOrqsr92pDlkYcwcflHW1aK+qYzymKsmEytroWKUDoDGb+cLr00S+1ce9EFw3I9zJQF+yzPoRcF54kF5cW1jNXdXQa4Gi7NDiTVQA0VApgABGLnu5OqdZTWz/b5+ITUCV3sRbnUmfHKwcfj4p1fnCqO7I42aC7hyhYbJ5PNBeISODewzzRpsqOdAX5xEF+A5GGG/y5laVyMMf+Mhdpx2BmzGr+ZD0kXmqe69cnjqYVO5mgsEXKk2YPADwxh+jUCs5tHEy8ViNjL7MPTwS/yXIDQiEmbMj9VFyjiUm42akWAcC3geSUf4aDMjBZaBaR7rsxdkEbiuz8WZRYRS2sB6c4hiIowmubXRQyFxzBClN++HN7XxEcyR5RCNIOJvT8bNh/zTsYnjDuP98BmVXoGxKd4bsVSncJamq3XCCFbzrzhKkV3YGhzzcyEzJXVyZdQy8Z4/YyCu7IsHh7pBhoclri6spwp4X/b5sPLFzFP5WmRFNsSJa9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(38100700002)(6486002)(508600001)(316002)(36756003)(76116006)(4326008)(8676002)(66446008)(66556008)(66476007)(6916009)(54906003)(122000001)(71200400001)(33656002)(2906002)(53546011)(66946007)(64756008)(6506007)(107886003)(2616005)(8936002)(186003)(86362001)(5660300002)(7416002)(44832011)(6512007)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTIza1N0djY3RnVUajFTeE0wSFNSYVNUVk9CakZYeWpod2Y4VTFGbmJ4a29F?=
 =?utf-8?B?UlJTcVBjSkJvV1JjVjFibG9jTlk4em93eXhxM2d3U01jakRBSGE1TWR0N1p6?=
 =?utf-8?B?Rng4bk5WRGh5Wi93N0MyUThXdDlIVHY5M2NRMCtjR3BXVUZENCtNYWcxSmFi?=
 =?utf-8?B?NzZyUXVhVzhPQmlSWmNOSlZ6ZG9LQkVWTHM4blpJNVdVdFFiMzhCOElRekdq?=
 =?utf-8?B?SG9UR2dacEJyOUFsY3cwaE1OZXdtM0lRakNVUmhnbnozV293Wjl5SWtKSGx1?=
 =?utf-8?B?aFdsRGFuU0NaU2tPOE11STNzOUxocWQ5a3hlM0MrYmRTelhCQ3I4akJYbmhM?=
 =?utf-8?B?OE1jQmk0ZjRCQ0lDbXBwNllHZjFQUnk0N2FJMjBRNlpGeUMvcGdRY05hZnRZ?=
 =?utf-8?B?NWJmNnpLcDRvNmNWTE1Gb2tCUHdwaGRyRE9qcDVQSC9hYm9VWlZPSmJMTzRD?=
 =?utf-8?B?bitrUnd4WU5mTFdCOGxxMnVna3FmZkFULzBBRzlJVlpvQUErbDVycTNEeW1o?=
 =?utf-8?B?OUs3SVZGb2puRWxqWndTUXE2am5ZMy9GNHhVV1hLSEMvL3BVSVY0MEt3MzU4?=
 =?utf-8?B?SXZHbVNZWkpoeWlYbjVNdDhwdWFoODh5OElxZkpQU0xtbUxHVGlUSGtGcEJu?=
 =?utf-8?B?aVR2UGRJTjg4OWY0K3BXYVppZGY5L2FRWXBSMWxaQ2plZXhMOFJCSTFOLzIx?=
 =?utf-8?B?NEpheVFGYis2M2FxRTlUYXN0RFVDQ2tDY0xNRmlOU3VCVXZwdHE0bzV1eWhQ?=
 =?utf-8?B?V1FyVmphZkx2b3BEWTRIQmt3OXVNeWxmSXhQT2dQbVpma2xBOWZSYUxWbU5W?=
 =?utf-8?B?MWk2cXpBNnpxQ1JYZUh6aWRxMTZYRERNUHd0SVluWW1TZndnSDY4N01iWGVT?=
 =?utf-8?B?MzQ2N0tLdDJKWnFqQzJFd0dldFlnMDh3dlNtSXlvK2tsQTZoTW1MUXdlcWVK?=
 =?utf-8?B?clZiTHlhT1cxMUN3SEV2K3NOdFRXTGhyNlVqRE9CeGozVEFKZzRpVWxIOTd2?=
 =?utf-8?B?dy92OEFhRGdhWHBSeXNtRjFFbkt1eVZmeFluT044bWhTRE9EMEhhRXh3T0dz?=
 =?utf-8?B?WitmS3NCeHVYSDFFdHpjTy9TeUtaRlA0dldma3RsdXlCTUVraGtEZjVrak9p?=
 =?utf-8?B?Vk5QK2JqeDg2ampEL1RyUUpkV1hFY1B4YUlMZkxJOTlySFFvcVBUYi92Ukhz?=
 =?utf-8?B?b1RkaUpQc29kekc5NWd0UkVMN1dVVkdpTGVtaWRjODdmMzNjWDF0OHpYL21j?=
 =?utf-8?B?WTVTVnZMYmNJcVBWa24wN3hGY2kvc0FNSHRQVHNBSVo1NWlUbmRlSUVlSlVX?=
 =?utf-8?B?Q0lmdnpzdXYweXBwRDRzRmpSRVh5S3huSGk5dHhrbzNVQWtyWkpWdHlBbkFW?=
 =?utf-8?B?R0RmbUFRMnBlUzR4Q0JFaWlldWFmRTFxOGNVQ0lkMUxVYkZHTWhjSjY2Rm9x?=
 =?utf-8?B?cHp3R2RFVllrayswdGhTK2YxcnpKYXNzdDNuYnc0RU9NUEV1NTB0aTVSQTg3?=
 =?utf-8?B?OTRvUXZwZ0tpa0FVWklFUTZyU21BTW5yTVJKaXpVTDcxeXRDcWJSNE5hL2Yy?=
 =?utf-8?B?bEJWSU5CQXNBc2JXQ3RzVGJ2Z3c3bEE2OEJWbkFpdzkxeVVFM1RJT0ZxMm1O?=
 =?utf-8?B?N0IyOUZEMnNQL0JzMWpQSXlaUGIrcXJtU1h1d1VaVnNvaUVWV2ptTWdTRk9x?=
 =?utf-8?B?ZGhVTlRmU1FyTnBibFh0d2syOXEwWGJrMWQrM3RWa0Q2WWVDNzlETU5ER1pJ?=
 =?utf-8?B?UHB2Qlo0eDNzbVAyYmpTRUJTUE1RRGgxdWJoOUh6TU5aeVlUNVV1L1owblNF?=
 =?utf-8?B?VitncTJMakJ4ZDNnRGV1bU1CUWVDdFlaNmRJUU16dUZwRUt3UTNZK0ZqNVhl?=
 =?utf-8?B?RnFQbWpaK2c2MHB0aytwK3FCWWlVUkVtdmd0WFRteUU2U2FHZDZBY0lKcGQx?=
 =?utf-8?B?UG1ScDZ4a3RoNVR4eEJodExBM2pOditVNW1hWGNtUGtIdGczdUNyNEd6eWFw?=
 =?utf-8?B?YnVNMlZwc0VYN1JrUkU1UWJpamltalIwQ2xkTEd4elYwNjJxU0NTcFk0VUNq?=
 =?utf-8?B?VUNjb1BUMjBYTEdHeWVBWjFtd0toSWF3N1FuLzBCVkpJeEFiQzUxeWZWQk0x?=
 =?utf-8?B?RXROV3BHQThkaHF2ZE5Nb0EwY3lmME5FU0hZbFphWXpoUFNhZjczd0J5LzNs?=
 =?utf-8?B?NTB0d3pnZXJMZHlMWmwxdU5WN0MvalU2bEd2emJKcHhrQ2YxZWljTlQ0eGlu?=
 =?utf-8?B?ZDYzcHE5aWRmaG5qUW94eVQzeWtwdUdEbHJsSC90REZuSzNjMWxFWjJIMnA1?=
 =?utf-8?B?TlpMQlhIRDg3c1l2eXMzdHMrOHE1WjN2V1ZscldLczFQUEEwRGM3OE1FLzA0?=
 =?utf-8?Q?ozBZVk3vnzoIhQvRMd/lAZxitQIGtZnuiVbqU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6646435CCC5636479F1F2520909B979E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76872286-8b46-4f8f-c8cb-08da2de1e805
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 15:22:30.9306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rCZVcSVCPb/80UTjSYxnBM0/zRY5/feKKYVxTaiQkw4B8Qc8tcScxuceLZWKTOgdcccTBjcrv36In/6Ba2ktlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4141
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-04_04:2022-05-04,
 2022-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205040098
X-Proofpoint-GUID: QPRAYq0Gx1B716uReMW-dEi_-p2XpBeZ
X-Proofpoint-ORIG-GUID: QPRAYq0Gx1B716uReMW-dEi_-p2XpBeZ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gTWF5IDQsIDIwMjIsIGF0IDc6NDIgQU0sIE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFu
QG9yYWNsZS5jb20+IHdyaXRlczoNCj4gDQo+PiBTZXR1cCBhIGhhbmRsZXIgdG8gcnVuIHZmaW8t
dXNlciBjb250ZXh0LiBUaGUgY29udGV4dCBpcyBkcml2ZW4gYnkNCj4+IG1lc3NhZ2VzIHRvIHRo
ZSBmaWxlIGRlc2NyaXB0b3IgYXNzb2NpYXRlZCB3aXRoIGl0IC0gZ2V0IHRoZSBmZCBmb3INCj4+
IHRoZSBjb250ZXh0IGFuZCBob29rIHVwIHRoZSBoYW5kbGVyIHdpdGggaXQNCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUu
Y29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFj
bGUuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4NCj4+IC0tLQ0KPj4gcWFwaS9taXNjLmpzb24gfCAzMCArKysrKysrKysrKw0KPj4gaHcv
cmVtb3RlL3ZmaW8tdXNlci1vYmouYyB8IDEwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvcWFwaS9taXNjLmpzb24gYi9xYXBpL21pc2Mu
anNvbg0KPj4gaW5kZXggYjgzY2MzOTAyOS4uZmE0OWYyODc2YSAxMDA2NDQNCj4+IC0tLSBhL3Fh
cGkvbWlzYy5qc29uDQo+PiArKysgYi9xYXBpL21pc2MuanNvbg0KPj4gQEAgLTU1MywzICs1NTMs
MzMgQEANCj4+ICMjDQo+PiB7ICdldmVudCc6ICdSVENfQ0hBTkdFJywNCj4+ICdkYXRhJzogeyAn
b2Zmc2V0JzogJ2ludCcsICdxb20tcGF0aCc6ICdzdHInIH0gfQ0KPj4gKw0KPj4gKyMjDQo+PiAr
IyBAVkZVX0NMSUVOVF9IQU5HVVA6DQo+PiArIw0KPj4gKyMgRW1pdHRlZCB3aGVuIHRoZSBjbGll
bnQgb2YgYSBUWVBFX1ZGSU9fVVNFUl9TRVJWRVIgY2xvc2VzIHRoZQ0KPj4gKyMgY29tbXVuaWNh
dGlvbiBjaGFubmVsDQo+PiArIw0KPj4gKyMgQHZmdS1pZDogSUQgb2YgdGhlIFRZUEVfVkZJT19V
U0VSX1NFUlZFUiBvYmplY3QNCj4+ICsjDQo+PiArIyBAdmZ1LXFvbS1wYXRoOiBwYXRoIHRvIHRo
ZSBUWVBFX1ZGSU9fVVNFUl9TRVJWRVIgb2JqZWN0IGluIHRoZSBRT00gdHJlZQ0KPj4gKyMNCj4+
ICsjIEBkZXYtaWQ6IElEIG9mIGF0dGFjaGVkIFBDSSBkZXZpY2UNCj4+ICsjDQo+PiArIyBAZGV2
LXFvbS1wYXRoOiBwYXRoIHRvIGF0dGFjaGVkIFBDSSBkZXZpY2UgaW4gdGhlIFFPTSB0cmVlDQo+
IA0KPiBJJ20gc3RpbGwgdW5zdXJlIHdoYXQga2luZChzKSBvZiBJRCBAdmZ1LWlkIGFuZCBAZGV2
LWlkIGFyZS4gU2VlIGJlbG93Lg0KDQpJ4oCZbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IGtp
bmQgb2YgSUQgLSBJIHRob3VnaHQgb2YgSUQgYXMgYQ0KdW5pcXVlIHN0cmluZy4gSeKAmWxsIHRy
eSBteSBiZXN0IHRvIGV4cGxhaW4uDQoNCmRldi1pZCBhbmQgdmZ1LWlkIGFyZSB0aGUg4oCcaWQi
IHN1Yi1vcHRpb25zIG9mIOKAnC1kZXZpY2XigJ0gYW5kIOKAnC1vYmplY3TigJ0gY29tbWFuZC1s
aW5lDQpvcHRpb25zIHJlc3BlY3RpdmVseS4NCg0KImRldi1pZOKAnSBpcyB0aGUg4oCcaWTigJ0g
bWVtYmVyIG9mIOKAnERldmljZVN0YXRl4oCdIHdoaWNoIFFFTVUgc2V0cyB1c2luZw0KcWRldl9z
ZXRfaWQoKSB3aGVuIHRoZSBkZXZpY2UgaXMgYWRkZWQuIA0KDQpUaGUgT2JqZWN0IElEICh2ZnUt
aWQgaW4gdGhpcyBjYXNlKSBpcyBhIGJpdCB0cmlja3kuIEl04oCZcyBhbHNvIHRoZSDigJxpZOKA
nQ0KY29tbWFuZC1saW5lIHN1Yi1vcHRpb24sIGJ1dCBRRU1VIHN0b3JlcyBpdCBhcyBhIGNoaWxk
IHByb3BlcnR5DQpvZiB0aGUgcGFyZW50IG9iamVjdC4NCg0KPiANCj4+ICsjDQo+PiArIyBTaW5j
ZTogNy4xDQo+PiArIw0KPj4gKyMgRXhhbXBsZToNCj4+ICsjDQo+PiArIyA8LSB7ICJldmVudCI6
ICJWRlVfQ0xJRU5UX0hBTkdVUCIsDQo+PiArIyAiZGF0YSI6IHsgInZmdS1pZCI6ICJ2ZnUxIiwN
Cj4+ICsjICJ2ZnUtcW9tLXBhdGgiOiAiL29iamVjdHMvdmZ1MSIsDQo+PiArIyAiZGV2LWlkIjog
InNhczEiLA0KPj4gKyMgImRldi1xb20tcGF0aCI6ICIvbWFjaGluZS9wZXJpcGhlcmFsL3NhczEi
IH0sDQo+PiArIyAidGltZXN0YW1wIjogeyAic2Vjb25kcyI6IDEyNjUwNDQyMzAsICJtaWNyb3Nl
Y29uZHMiOiA0NTA0ODYgfSB9DQo+PiArIw0KPj4gKyMjDQo+PiAreyAnZXZlbnQnOiAnVkZVX0NM
SUVOVF9IQU5HVVAnLA0KPj4gKyAnZGF0YSc6IHsgJ3ZmdS1pZCc6ICdzdHInLCAndmZ1LXFvbS1w
YXRoJzogJ3N0cicsDQo+PiArICdkZXYtaWQnOiAnc3RyJywgJ2Rldi1xb20tcGF0aCc6ICdzdHIn
IH0gfQ0KPj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMgYi9ody9yZW1v
dGUvdmZpby11c2VyLW9iai5jDQo+PiBpbmRleCAzY2E2YWEyYjQ1Li4zYTRjNmE5ZmEwIDEwMDY0
NA0KPj4gLS0tIGEvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gKysrIGIvaHcvcmVtb3Rl
L3ZmaW8tdXNlci1vYmouYw0KPj4gQEAgLTI3LDYgKzI3LDkgQEANCj4+ICoNCj4+ICogZGV2aWNl
IC0gaWQgb2YgYSBkZXZpY2Ugb24gdGhlIHNlcnZlciwgYSByZXF1aXJlZCBvcHRpb24uIFBDSSBk
ZXZpY2VzDQo+PiAqIGFsb25lIGFyZSBzdXBwb3J0ZWQgcHJlc2VudGx5Lg0KPj4gKyAqDQo+PiAr
ICogbm90ZXMgLSB4LXZmaW8tdXNlci1zZXJ2ZXIgY291bGQgYmxvY2sgSU8gYW5kIG1vbml0b3Ig
ZHVyaW5nIHRoZQ0KPj4gKyAqIGluaXRpYWxpemF0aW9uIHBoYXNlLg0KPj4gKi8NCj4+IA0KPj4g
I2luY2x1ZGUgInFlbXUvb3NkZXAuaCINCj4+IEBAIC00MCwxMSArNDMsMTQgQEANCj4+ICNpbmNs
dWRlICJody9yZW1vdGUvbWFjaGluZS5oIg0KPj4gI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4+
ICNpbmNsdWRlICJxYXBpL3FhcGktdmlzaXQtc29ja2V0cy5oIg0KPj4gKyNpbmNsdWRlICJxYXBp
L3FhcGktZXZlbnRzLW1pc2MuaCINCj4+ICNpbmNsdWRlICJxZW11L25vdGlmeS5oIg0KPj4gKyNp
bmNsdWRlICJxZW11L3RocmVhZC5oIg0KPj4gI2luY2x1ZGUgInN5c2VtdS9zeXNlbXUuaCINCj4+
ICNpbmNsdWRlICJsaWJ2ZmlvLXVzZXIuaCINCj4+ICNpbmNsdWRlICJody9xZGV2LWNvcmUuaCIN
Cj4+ICNpbmNsdWRlICJody9wY2kvcGNpLmgiDQo+PiArI2luY2x1ZGUgInFlbXUvdGltZXIuaCIN
Cj4+IA0KPj4gI2RlZmluZSBUWVBFX1ZGVV9PQkpFQ1QgIngtdmZpby11c2VyLXNlcnZlciINCj4+
IE9CSkVDVF9ERUNMQVJFX1RZUEUoVmZ1T2JqZWN0LCBWZnVPYmplY3RDbGFzcywgVkZVX09CSkVD
VCkNCj4+IEBAIC04Niw2ICs5Miw4IEBAIHN0cnVjdCBWZnVPYmplY3Qgew0KPj4gUENJRGV2aWNl
ICpwY2lfZGV2Ow0KPj4gDQo+PiBFcnJvciAqdW5wbHVnX2Jsb2NrZXI7DQo+PiArDQo+PiArIGlu
dCB2ZnVfcG9sbF9mZDsNCj4+IH07DQo+PiANCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5p
dF9jdHgoVmZ1T2JqZWN0ICpvLCBFcnJvciAqKmVycnApOw0KPj4gQEAgLTE2NCw2ICsxNzIsNzYg
QEAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9zZXRfZGV2aWNlKE9iamVjdCAqb2JqLCBjb25zdCBj
aGFyICpzdHIsIEVycm9yICoqZXJycCkNCj4+IHZmdV9vYmplY3RfaW5pdF9jdHgobywgZXJycCk7
DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2N0eF9ydW4odm9pZCAqb3Bh
cXVlKQ0KPj4gK3sNCj4+ICsgVmZ1T2JqZWN0ICpvID0gb3BhcXVlOw0KPj4gKyBjb25zdCBjaGFy
ICp2ZnVfaWQ7DQo+PiArIGNoYXIgKnZmdV9wYXRoLCAqcGNpX2Rldl9wYXRoOw0KPj4gKyBpbnQg
cmV0ID0gLTE7DQo+PiArDQo+PiArIHdoaWxlIChyZXQgIT0gMCkgew0KPj4gKyByZXQgPSB2ZnVf
cnVuX2N0eChvLT52ZnVfY3R4KTsNCj4+ICsgaWYgKHJldCA8IDApIHsNCj4+ICsgaWYgKGVycm5v
ID09IEVJTlRSKSB7DQo+PiArIGNvbnRpbnVlOw0KPj4gKyB9IGVsc2UgaWYgKGVycm5vID09IEVO
T1RDT05OKSB7DQo+PiArIHZmdV9pZCA9IG9iamVjdF9nZXRfY2Fub25pY2FsX3BhdGhfY29tcG9u
ZW50KE9CSkVDVChvKSk7DQo+PiArIHZmdV9wYXRoID0gb2JqZWN0X2dldF9jYW5vbmljYWxfcGF0
aChPQkpFQ1QobykpOw0KPiANCj4gSG1tLiBAdmZ1X2lkIGlzIGFsd2F5cyB0aGUgbGFzdCBjb21w
b25lbnQgb2YgQHZmdV9wYXRoLiBXaHkgZG8gd2UgbmVlZA0KPiB0byBzZW5kIGJvdGg/DQoNCnZm
dV9pZCBpcyB0aGUgSUQgdGhhdCB0aGUgdXNlci9PcmNoZXN0cmF0b3IgcGFzc2VkIGFzIGEgY29t
bWFuZC1saW5lIG9wdGlvbg0KZHVyaW5nIGFkZGl0aW9uL2NyZWF0aW9uLiBTbyBpdCBtYWRlIHNl
bnNlIHRvIHJlcG9ydCBiYWNrIHdpdGggdGhlIHNhbWUgSUQNCnRoYXQgdGhleSB1c2VkLiBCdXQg
SeKAmW0gT0sgd2l0aCBkcm9wcGluZyB0aGlzIGlmIHRoYXTigJlzIHdoYXQgeW91IHByZWZlci4N
Cg0KPiANCj4+ICsgZ19hc3NlcnQoby0+cGNpX2Rldik7DQo+PiArIHBjaV9kZXZfcGF0aCA9IG9i
amVjdF9nZXRfY2Fub25pY2FsX3BhdGgoT0JKRUNUKG8tPnBjaV9kZXYpKTsNCj4+ICsgcWFwaV9l
dmVudF9zZW5kX3ZmdV9jbGllbnRfaGFuZ3VwKHZmdV9pZCwgdmZ1X3BhdGgsDQo+PiArIG8tPmRl
dmljZSwgcGNpX2Rldl9wYXRoKTsNCj4gDQo+IFdoZXJlIGlzIG8tPmRldmljZSBzZXQ/IEknbSBh
c2tpbmcgYmVjYXVzZSBJIGl0IG11c3Qgbm90IGJlIG51bGwgaGVyZSwNCj4gYW5kIHRoYXQncyBu
b3QgbG9jYWxseSBvYnZpb3VzLg0KDQpZZWFoLCBpdOKAmXMgbm90IG9idmlvdXMgZnJvbSB0aGlz
IHBhdGNoIHRoYXQgby0+ZGV2aWNlIGlzIGd1YXJhbnRlZWQgdG8gYmUNCm5vbi1OVUxMLiBJdOKA
mXMgc2V0IGJ5IHZmdV9vYmplY3Rfc2V0X2RldmljZSgpLiBQbGVhc2Ugc2VlIHRoZSBmb2xsb3dp
bmcNCnBhdGNoZXMgaW4gdGhlIHNlcmllczoNCnZmaW8tdXNlcjogZGVmaW5lIHZmaW8tdXNlci1z
ZXJ2ZXIgb2JqZWN0DQp2ZmlvLXVzZXI6IGluc3RhbnRpYXRlIHZmaW8tdXNlciBjb250ZXh0DQoN
ClRoZXJl4oCZcyBhbHJlYWR5IGFuIGFzc2VydCBmb3Igby0+cGNpX2RldiBoZXJlLCBidXQgd2Ug
Y291bGQgYWRkIG9uZQ0KZm9yIG8tPmRldmljZSB0b28/DQoNClRoYW5rIHlvdSENCuKAlA0KSmFn
DQoNCj4gDQo+PiArIHFlbXVfc2V0X2ZkX2hhbmRsZXIoby0+dmZ1X3BvbGxfZmQsIE5VTEwsIE5V
TEwsIE5VTEwpOw0KPj4gKyBvLT52ZnVfcG9sbF9mZCA9IC0xOw0KPj4gKyBvYmplY3RfdW5wYXJl
bnQoT0JKRUNUKG8pKTsNCj4+ICsgZ19mcmVlKHZmdV9wYXRoKTsNCj4+ICsgZ19mcmVlKHBjaV9k
ZXZfcGF0aCk7DQo+PiArIGJyZWFrOw0KPj4gKyB9IGVsc2Ugew0KPj4gKyBWRlVfT0JKRUNUX0VS
Uk9SKG8sICJ2ZnU6IEZhaWxlZCB0byBydW4gZGV2aWNlICVzIC0gJXMiLA0KPj4gKyBvLT5kZXZp
Y2UsIHN0cmVycm9yKGVycm5vKSk7DQo+PiArIGJyZWFrOw0KPj4gKyB9DQo+PiArIH0NCj4+ICsg
fQ0KPj4gK30NCj4gDQo+IFsuLi5dDQoNCg==

