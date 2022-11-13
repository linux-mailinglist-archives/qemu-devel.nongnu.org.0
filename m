Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB669626EE9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 11:17:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouA2H-0007Hl-U7; Sun, 13 Nov 2022 05:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1ouA2D-0007HU-Ad; Sun, 13 Nov 2022 05:16:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1ouA2B-0006FM-5u; Sun, 13 Nov 2022 05:16:17 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2ADAC3O9010085; Sun, 13 Nov 2022 10:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=/gw7RuLtLgsSNuhTfZeNauVxgEgqYUrSR9Eda/BUtAE=;
 b=eu7Jeyirz+Op1LmW1xCu9iawz+jMDFPbrGRySolfovaftHLXnca5klLT16gO5cd9ibFr
 zrvc07ctkOdQAgwC8jXYs8oXVTAtGyNafJf2/aEYJIAU6RSGBE9XseFR1qkaCa0ZwDCm
 bYrd7PAl6DYQDOGEasvTOnYLim4wU9tPuhzTt4HQ8net7QCbJlIudX9r6+bhrYCzLNg0
 3gx1xbHvLpk0PLOxHk/3JcGVOpu7UBt1MF6wtxRTIUdHJtIL+rtEFio74gMSTjsuhmuy
 BHgs2XAbgbatLJsdjuF0m4OUIq2bB1CXJ7rL9wImFZBSd3zy6hhpyTiNnTB0pK/ZMYvP YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ktxm801x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Nov 2022 10:16:11 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ADACg40011741;
 Sun, 13 Nov 2022 10:16:10 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ktxm801wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Nov 2022 10:16:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsZuWGcE/86SdYP8vNyhYQxV/opNk5vnTLlmG2dXkF1s52N3jG+aiIWALmHqIMXeI0Gnj3sKpcOmQvqXV4vRheiSWY6XVvg00M8MvePLcp+4cbe8UNvt6A4zodcUkvSXqs0CS6JFCmArVIR5KnaGFCxTXx4ZXRzE1JGO6ixRgR3SXb3N8e1x50ifnBL1r7HE5Jzmf9KJR4XtAwPna4sYeXt2K/OAx7+VsF8FJgWDBzv234cXavM7FcU3G9PkHuzyPYYSp64oGtlOSCl9ao00m7uAlXcgvFnSg1CQvVqvIuCPUjroH9XbjZhSF9jga3QsZ9xBmr6wRX+QSx94XVY7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gw7RuLtLgsSNuhTfZeNauVxgEgqYUrSR9Eda/BUtAE=;
 b=RWGUKjl5g0NWcDQ6k5kQR6vE8Z00q9ur6vV6xSeCe9XNFEuGnGvfSEQfup7lDTpr100dui+GQ0uIl2rAEdKN/liAE7ZBcGJ8PTNhWPODtgV2myRvlqDiK4vXQaBGtkVsUefnysUTEAo/u08jJrpviBzUAJp313y3NtljN0yxey9GF8RROa5IBuGy1PlXrBNnJwFUaSe9Gu8BST5+8AYAMK/7UMnb3iYCwVVAuuaPcHLspQbKicgMcsmTyq75myyTJ3fShTDKQMZVsRyURDruSkr3Og9TjV1qg4EKikuPoTDap97Ao9q9ZRiU9uDQE3wDBqrrwyu9h9TcZ9Vd3eaaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=il.ibm.com; dmarc=pass action=none header.from=il.ibm.com;
 dkim=pass header.d=il.ibm.com; arc=none
Received: from MN2PR15MB3488.namprd15.prod.outlook.com (2603:10b6:208:a6::17)
 by CY4PR15MB1800.namprd15.prod.outlook.com (2603:10b6:910:21::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14; Sun, 13 Nov
 2022 10:16:08 +0000
Received: from MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::a3a7:e3ec:cb10:263]) by MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::a3a7:e3ec:cb10:263%4]) with mapi id 15.20.5813.013; Sun, 13 Nov 2022
 10:16:08 +0000
From: Or Ozeri <ORO@il.ibm.com>
To: Ilya Dryomov <idryomov@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Danny Harnik <DANNYH@il.ibm.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v1] block/rbd: Add support for layered
 encryption
Thread-Index: AQHY6RfIlldlnETy2EiJ77oJUp1rra45yQKAgAL2QeA=
Date: Sun, 13 Nov 2022 10:16:08 +0000
Message-ID: <MN2PR15MB34884E9308FA492030A81E3A8A029@MN2PR15MB3488.namprd15.prod.outlook.com>
References: <20221026084836.1819572-1-oro@il.ibm.com>
 <CAOi1vP8X6xeuYmPwTS=LivU=XeCM-WDERrCOAySWJauvsOs_iA@mail.gmail.com>
In-Reply-To: <CAOi1vP8X6xeuYmPwTS=LivU=XeCM-WDERrCOAySWJauvsOs_iA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3488:EE_|CY4PR15MB1800:EE_
x-ms-office365-filtering-correlation-id: 20e2c1dc-0bf4-49ee-5559-08dac56014e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nmuQbpaUksBwxDoS/7eBUIH0n7ZVCsC7V6L7X/pGno5fGRaRnk3O6qQ7AesYVI1mk/yQpGI2jnIBABsMA9+vXjfhAo1e9GySjvZnTdDJrryReI9v9t/oBoBMoQMbb8V4MEJHzEb8eO12Q70wnC8jUabmV+bqBqxS7lcilZJ+uIN+uqh4h/josSdNqFBxbJxgREpbkcwvpdLY8j3N/7nPL3h9tUq4DyJGMjQl6+E8y6aJgoHdKmjr7gr5cmfk37OZgGbDDMB43eBkNUw1GSPPfWHfcmsdqkhM0HHBzE3OKjto09NwFV9zM4Y2X7k0DpnO2wqiK9+pBDvoCCQjCcLKOC7oQhIIFR7o9rSyDg56Zvg1DfI/ML3x73siBA5OAd8T1+yhPrI9PqsXQaWaB92VPSB0Ucd8/GMtdRF+TTv9wc2VYQBLHwzsv+SDNvEL38wXdaHIHkWsssGha4SJ4f51t9FKAAnZhsj/2mjIlHmABKCa3DTS6E/h/ubtJ7P9YLiw2nt5vymA3vnSTbv+4ANoSQeGq1NPjR3zH4S0+7JDCRnUprdljv1mADdkgUez/weSdqT5q2Cwp2yxwy6Dj5nDByrFYBMlDwo24XbQKf1GObP9w+HD+9RMZc/9Oz5rdfovj6gnQz1WaQP9CWsmZgYAi8gfgnkAc8EljaSCpT33DEAZ/eB7HaqLcJQZk/lCingvHCMZcWvbnvHONk1WQKAazXrLZELIXDT5Z0eurAVvf2mSiuIwzROMLr6PP/TuSoIuSopoSI28Rs7aj8RAHMwyeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3488.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(186003)(478600001)(9686003)(38100700002)(26005)(53546011)(6506007)(7696005)(38070700005)(33656002)(86362001)(55016003)(5660300002)(83380400001)(52536014)(122000001)(8936002)(6916009)(2906002)(4744005)(41300700001)(54906003)(316002)(71200400001)(8676002)(4326008)(66446008)(66946007)(76116006)(66556008)(64756008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U29RWEw2SjlOdlpCQWR3M000QUorZEtZKzlzSTRNdFUzQ2FNc04zZjhDbzZZ?=
 =?utf-8?B?LyswdHpWMXNOS2JLTStndnFMYnJFTW8vSkMrU0Y3ckdFdlFHM1pIK3ZuRXRu?=
 =?utf-8?B?MFpDUk1YYU5TTEx1K2tqTkdZeHdVNTgvcFY1RnFIbDgraGZUaFVWeEFkcjk3?=
 =?utf-8?B?WHNYdjZRRnI2OSs0Z3MzbDlrZDFNUTRsZThrRkk5Y1pMVHNVN0VJNVh3WlY4?=
 =?utf-8?B?Y2I3NW1LUmR2TEZSMzZXbUxDVE12d0pYL1VRdlJlQW5yQnBzUjVKL2NoTk5H?=
 =?utf-8?B?YW9xckdEdFVrRURQOEZ1ZGU1WEJxUmZXM1VIUlBMVHlZZUk4SVFLcWhVYnhU?=
 =?utf-8?B?dHJlVDc3dnpKUlpxcEJ5VlB0ek1hb0JSRGpwbFh4S3JOZGtVNWJkdlA0MHpw?=
 =?utf-8?B?eDZ2SzhlOEEwK3dMYUtrVStralAzN0JmeVJ6Q2ZMN29yZDVNL2Q4eUtJcWQ2?=
 =?utf-8?B?cjBwMmgrN0RPdVBXT05Yc05IQm5WbU9nSXZhRHljYVJaOGcrVVVyamxRMUM5?=
 =?utf-8?B?Y0lQSnJaUlNJWExLZHJkSXppWWFYdWw0UjNaOXhVK2pqL2hWUHZaRUZVMVpx?=
 =?utf-8?B?dFkxTVovbDNudWpDc0FWMk51SFRwSnlTcVFyaEpFZVY0aHc0M3MzNTh2YlJp?=
 =?utf-8?B?dFN0SVRjTlR0NGxGVTdCK3R4RXR0dlNySmhYeS9yT01OUDZ6d2xVS08yU1pj?=
 =?utf-8?B?cGlLL3BuYmIySUVpNWxzSVNuT0d4OHFKbWI5NXdEWkJCRldRWW9TR096T1dr?=
 =?utf-8?B?U1B6YXE0OGVsTytvUlBib3Fra01QYTk0K2dnZ1pBM0tNa3lVZExkMG9qSFJy?=
 =?utf-8?B?ditzMnlmUXZvQXVYT25EUmxmdExrM2xQSUVYZk8vRExvdE5BQko4ODhDMDBl?=
 =?utf-8?B?WU9RaWlZc01URnRzUzFLYnJtc3hjMVd1VzJQcjJoK2MwbkhvMndLVXVDZFA5?=
 =?utf-8?B?SDBzWmNuYTY1NkJDVllheDdnMEtxbVRFWnhzcVRZV3NPdkRyY0hIVCtRZnVz?=
 =?utf-8?B?bzBObUNEODdBRE4rTzJDTzlJaUN0bUJxZW9IUXg0aFYxb1BZYi9GU2ZZOHhW?=
 =?utf-8?B?NzNHY2xXV1FYOWtUTExjZklBL0hTMGZnUDBCSWF6bEJqVnRibi9NUGJuOHcw?=
 =?utf-8?B?cUxwUE5HS3d1RGMwY0NDM2lJSVRCMW5QcVQxanRQZUYxZDU4bm81TXBmc0lF?=
 =?utf-8?B?cDlORHZLZlRPdmh1eElIYTNWVHViUDN4QVFzYWZYQ2s1RjdYa1NUd01mNVU1?=
 =?utf-8?B?cmVkT0FDMFMyaFF6UHJlOWhXWklLQ0VmeUFHT1ZLUGhvRGI3WitUTTJmenFU?=
 =?utf-8?B?WmI2eWdyNmpCeEsrZCt0TVBBQVhQRm5BREZNdWFPUTBZSVA3Q25tVk1ldCti?=
 =?utf-8?B?Ym50a1ZJVWdJYmZvV0VTTEZlU05QdzcxRXdzQ1NsV041Um1Rc2VxSUFBb2Zu?=
 =?utf-8?B?MWhyU2srVkQwZHk4SEVZZjlkZ29XV1pNWWY2dTFXMVVNYkwxMWkwbFh0Snd1?=
 =?utf-8?B?R0hNaC8yTlpyYlB0LzNGZGM3M21SSno0S2RlTWJIWVMwZXl0WkZoa3oyU1Vt?=
 =?utf-8?B?WlJJYzRhV2EzNm5DUm9VcUZQd3AyZW90Yjk4amF3dDhDRWpwcElRZWhXQ0Y3?=
 =?utf-8?B?SXVxM3ZVUWJCVWRCbnIrbkI1R2JNWGsyOFI1Qm8vblhJbHVSZE92ay9nYVZx?=
 =?utf-8?B?N29KOWdLbExEMHNRMyt6bEVyczcwV0ZaM0syVlZNMGVYbUJ0S1pWcmU3cWpT?=
 =?utf-8?B?QTQ1dis1OFFVOHZoSzNJcHdZOElUcnpuVG8xOFZJMHJOdEQyWUtTSHF4NFBE?=
 =?utf-8?B?TFJMaGppN0V2cUxzK1J1VGRPQVZvdmpvTStuS2RZSXk5WndnZy8wS2lLdjlS?=
 =?utf-8?B?ZC9pdmdOQ2NOZkEwSjRUSDk0dWJoZTNTMGJJZGUyS2tqZXVTQnBkbmdrTmhG?=
 =?utf-8?B?Q1lEOTg2Ync1MVg3OUlocnNhN1pqYXVKd2NqbWxibUtlbUxyUTBuR2JPZUUz?=
 =?utf-8?B?U045YVpaMGNpcEJ3am1zUWdQT0RsRnVhbkhPTmV2c1VwMGpJb1ZsS29obVh1?=
 =?utf-8?B?WXdoWHlsTjlzbmRtVXFWSjlwSEVFUTIzS1oxbEVVNWhibUM1dWs4YlI4OWs3?=
 =?utf-8?Q?cgZI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: il.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3488.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e2c1dc-0bf4-49ee-5559-08dac56014e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 10:16:08.3812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FgKS/1poOYX0MtZHlhPPMCntCwhLnJYK7ym7R39eq3QC85+j/IUJa8GLQ+qbWzdC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1800
X-Proofpoint-GUID: 3gYIZlYluyeCdwCwFrt9cQwZ10vD1b2R
X-Proofpoint-ORIG-GUID: dteHd-KOtVIhLhu8SdwRKaUF_dwgCwZd
Subject: RE: [PATCH v1] block/rbd: Add support for layered encryption
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-13_07,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=657 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211130066
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ORO@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWx5YSBEcnlvbW92IDxp
ZHJ5b21vdkBnbWFpbC5jb20+DQo+IFNlbnQ6IDExIE5vdmVtYmVyIDIwMjIgMTU6MDENCj4gVG86
IE9yIE96ZXJpIDxPUk9AaWwuaWJtLmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
cWVtdS1ibG9ja0Bub25nbnUub3JnOyBEYW5ueSBIYXJuaWsNCj4gPERBTk5ZSEBpbC5pYm0uY29t
Pg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjFdIGJsb2NrL3JiZDogQWRkIHN1
cHBvcnQgZm9yIGxheWVyZWQNCj4gZW5jcnlwdGlvbg0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5k
IHRoZSBuZWVkIGZvciB0aGlzIGNoYXIqIGFycmF5LiAgSXMgdGhlcmUgYSBwcm9ibGVtIHdpdGgN
Cj4gcHV0dGluZyB0aGUgYmxvYiBkaXJlY3RseSBpbnRvIGx1a3NfYWxsX29wdHMtPnBhc3NwaHJh
c2UganVzdCBsaWtlIHRoZSBzaXplIGlzDQo+IHB1dCBpbnRvIGx1a3NfYWxsX29wdHMtPnBhc3Nw
aHJhc2Vfc2l6ZT8NCj4gDQoNCmx1a3NfYWxsX29wdHMtPnBhc3NwaHJhc2UgaGFzIGEgY29uc3Qg
bW9kaWZpZXIuDQo=

