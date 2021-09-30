Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433A41DC0E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:12:22 +0200 (CEST)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwnN-000645-FR
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVwld-0003pH-82
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:10:34 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:57127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVwla-0002eh-Mx
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:10:32 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UDgnRv010016; 
 Thu, 30 Sep 2021 07:10:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=kjoHrupeROKdu7cp3Igd1LZg7DyoM6Y/zA854Sn7m0c=;
 b=Tp5/aYzY0Y6w6+c9HFRsa93fGzVGmrv30TX7AA/ADIZ95L0HB3+HsgCxk421Jkx0NzGD
 KxdajAmj7Rx2y19FYgDbJLUwZmwHfSnHYHn7tEHH6DJ5M7ZJT6wmFj3c5Yw7IvUXNinG
 6KR+GH+/ZY8IU2i4hMVUFYChm42NzKMLjTY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bd3thuvne-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Sep 2021 07:10:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 07:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhEaTA0OFfO3Q27tQEQOtEQxF2mtIWxVs7reJ6s0xuc+zRIzcqef7AP963lELkfNLvJWsFY+b5TSTt7pvQc79KfVOsvjvtf5izCVzc8u/EIDlPItmXSc5FrC03XPKDeGV3MO1WhCid41MkfiMwIHJ+o7rvvnNnbWH+JKUYYlIBExmqseXkemeylNNGNKcuqrDclf9Bj4s2MWhaSktxqne8iycX8xFAdkuHZj8p48Lz2Rzh9WUaZyB7pczZuJK9xsMm3vwO+Xbzna6onqycS1nh79JkplN9EZ7GYAdmRHzvN5H9uueM9+ACqW5lbhfRJ4A7qjZzoYleQ8/YuB4NkV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kjoHrupeROKdu7cp3Igd1LZg7DyoM6Y/zA854Sn7m0c=;
 b=bGkfX2Bbvyiyrp8u677EmuvN6isYZMbpEJNEMsHm5YXqaXoB1RmGTwu4GLdZWZx9Ht2edszF9K0K+XgHOGgADAN2BbmhM0ahfSdeXKJrKtQIo/27ZvJGPZuhl+0veAxYE+E5k6ArSLH87gpTkfkLL1pCVE9QIy9YAIkx65NdBD8xIlRj5j3z9Xy5T9uxL88E7FxSMy4esK8Y7cwAzrMozrM2oyfA5IMYZ7uXFwBjEuDw2Ai1NulqqbH5jYb5D1Ew+kTvZUkAJl2perRDoR2G4hIf0W9LzSLbIwcXH886HvmM+jIRdjSrjtqQSg/JswN4H9wbQDses2lEc507xOKhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB3144.namprd15.prod.outlook.com (2603:10b6:a03:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 14:09:56 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 14:09:56 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Dan Zhang <zhdaniel@fb.com>, "damien.hedde@greensocs.com"
 <damien.hedde@greensocs.com>, "rashmica.g@gmail.com" <rashmica.g@gmail.com>
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
Thread-Topic: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
Thread-Index: AQHXtBhvyGkUUD0zdEGBkIvSFwZ2p6u5ReCAgAJ6+oCAAL3DAIAAIuMA
Date: Thu, 30 Sep 2021 14:09:56 +0000
Message-ID: <E59EED1D-3911-4D4F-B3D2-38970AB5ACC9@fb.com>
References: <20210928032456.3192603-1-pdel@fb.com>
 <20210928032456.3192603-2-pdel@fb.com>
 <00f8b06a-337a-2a93-8f22-642760424905@greensocs.com>
 <7B801EC5-8A3B-4C06-8FDA-194AD84C437C@fb.com>
 <3ff823c0ca926013ba057280bba533c8fd571570.camel@gmail.com>
In-Reply-To: <3ff823c0ca926013ba057280bba533c8fd571570.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 633a60f5-b851-481a-1d56-08d9841bfb7a
x-ms-traffictypediagnostic: BYAPR15MB3144:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3144CBE1A23EDF88447F7C66ACAA9@BYAPR15MB3144.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9OPqnrIoA+elIvn6X1vjKisUjj/UjgNd0/IZs+wt1FHxqJkVnbiQ3PvyoYalNtVOLkQAC6wCHUnw+ZhDMkIZ8kyoC3a88e8pZAbcfeTnppSUzX+WJBi6C4AADdbYjzOqr+4qAjXG6JDIvw1fk6/HfD9Z5p6P2iIcLp97BktCkwPiAq2FKuc7RqiGwKMoGGCejjt4oruabSjjwac19v/suKCvMSu7+AVSmvGslkqnkGJ+B4JwhE2YkBN3sKc9Hl/9u5zR+oDjPfrApchMZrkUuuorL7YabkRfrFjNibF8GXly/8FD1q0PbcXIWYR3UU3AWH4qkHXdCO2CpeEUFISVHf7Z7rG0t/K7jezi3J1vCXD0yOPNjIeTU4aOKEa2glI4xtzcI3DgeGshACr4nJvdDW55tRJCSv4sj1qZa9xMEaUXnDwWgKhHVupue7ysQmeyxtM9gvXcW9oMBUbI/LisXiNowbcu7kfjbNbUR5ar0f/ti5QA6THvodRoHwA8CAImIZU2/JKdeEHb/1wmPyKmbr27OLRk665w8eO6DeMd7n1nu9rY7DAwrS7N58433bFkY6zxh+GqWzUrG+rQWicMUvdy4GAuLXm+svnUh4BrHMFRLV3R3QHHWc/ao7FugqOMQJaAZ0gpcR9Uzc9V7llhtQ4S4Pq56L4rUbi8KSefnkuZUEPEG/EdFqdDc/NXiAjLeB6TSmbr5zmMtEyGTQTIhs0I8wFKV76Ip0cIAC3iMec=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(316002)(86362001)(186003)(8936002)(4326008)(8676002)(66946007)(76116006)(508600001)(66556008)(66446008)(109986005)(64756008)(66476007)(54906003)(6506007)(6486002)(5660300002)(33656002)(53546011)(6512007)(36756003)(38070700005)(71200400001)(122000001)(2906002)(2616005)(83380400001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2EvQVNURmhDOEJSMThmRitHUUlRa1IyZjBKcjByUEZIM0toaGI5MUFWdERK?=
 =?utf-8?B?RE8rVGcrS1IyYmxIRnkwRGtwZnZsZlZjcFdMWUExZWZOWVNYSyt0U2tpc3Zt?=
 =?utf-8?B?Qyt4OG9LWlg4UXVYUmpSTmJDd2U3dFppS1IwNGE4a1daUlljOW1rSDhPMnNx?=
 =?utf-8?B?RW56dFpzaWw0OHU3Uy9mWVRqN25hNjJEZ0QwZ0FlejQ1UTFDRTMxcjlsMGZL?=
 =?utf-8?B?SUVyN0pzUVVFdzFkYXRnYmJVL3ZmVnNDUSsyREVNVXgxdE44dTlMV0NDcy9o?=
 =?utf-8?B?Y0ZmUGpndS92aVZtYjVZZW9xUjREYzIxMGU0WXo0NGxBclR5REtTUTZKN0VH?=
 =?utf-8?B?VkRtVXNJNkJ5OVNkc1Zmd2pDVGdzOTUyeGJiVUxERDFYSHFPd1kwU3p6UmRz?=
 =?utf-8?B?bDZ3R2NDWjlNMnFCR1BEaW1yT2FvZmpMMDlEb01CdzN1ZVYrU1c4T1ZpZE5Q?=
 =?utf-8?B?ZytvRmFVaWhtQzIwVllHYkJCMURWc2RKZmRLbFlkLzVuWXF6a1J4LzMrTDlC?=
 =?utf-8?B?RUUxME1NZVVJcU9UVlZBb2tiVXZ4MkI2V053WkNkcyt4N1RWWVZuN0FUTmRH?=
 =?utf-8?B?ZUZ0amJCZnJXL1JreVNIakFZSSs3RzZpN0Q0Ri9VYTFhd0hxK0ZwTjdpOFNl?=
 =?utf-8?B?RE1VME4yekdUOVFGazlxOWJaN1FYWVI1ck5NYnUwUTd0T3U4djhnbEhHWkZa?=
 =?utf-8?B?WU5ScUpJZjdNYy9WV2E2blQ1VXZGU0YyUFdCdWZIejloenlaVUQrOGFmZGNY?=
 =?utf-8?B?SEZMK1Q5Z293UnViVk0wRFhlTDVlVnVvWUQ0OFRySS9SbjhMQkxTWkpXdDZ6?=
 =?utf-8?B?alQzaFNpa1R4MTE0cWlLd3UxUzdZZ2FVSU1rOXF5RVVTcFpBN2cza1E0ckRh?=
 =?utf-8?B?NzV2d29ybXBBdlZsYnZHRVowM0FLOVpTOTVscldncjFNcllnZzVMcGw4dm1o?=
 =?utf-8?B?bVhJemZsQ2pDN1dIQnJFb0VyaXJPTG9FMnN6bzAwVGhjTHFvclZaWXNod3Vj?=
 =?utf-8?B?YTR3NjBDZ1phZTFYMkJab09YVE10Vy9hdHNQZlJGc1g0RWR3NVpFNWFRQ0di?=
 =?utf-8?B?SmNxVU9JWGxkeklyMnVkb1FVZnlUdW41eDRkRkRCaUZnM1NWbHNaWlpncDRr?=
 =?utf-8?B?ajFkRkxoeGlKWmxJR0w0NVduTVhJU3lpWWlsalp6WlQ2MFlZZkVoT0hyMkVz?=
 =?utf-8?B?NGtpZmtUWEQ1L3huVlVvK1dzVTdGVncrMVR3c1VNenZIL2F2WlV6WHpTT3py?=
 =?utf-8?B?MWR4WkhMMjVLZGFTYWVpVFc2dHRXdXhVVzd2K1F6Q1IzaElSSThGSUZSdzBy?=
 =?utf-8?B?ai9JTUZpdUN4bEsrMFJ6VEp2MUM0VkRNR3NrTnFzNXlGY0p0YjJIR2x6dDNI?=
 =?utf-8?B?YU16dDVKODJBV21wZW0zdGZpdnUzVDdwWElKSzkrVFRkRjZSTXhvU3BjU2g3?=
 =?utf-8?B?eGttSStnUStyeFBxV2RmMUVYK2xFTE1FaXpwZ3JGbHdzWExDSThqdVp3WGxv?=
 =?utf-8?B?bnh3aVpIME8zbm9PaHdFcTJTbEY2NG5UOE5pL0l5VDJSUjY1YVcyVnU1bzBz?=
 =?utf-8?B?UWZUTUlObysyQ3NtcDNmMmF5WTVKc281aDhsRDNDb0RFN1liL211M1I0TUh5?=
 =?utf-8?B?MmJRMnNFNlZ2MnFqbHdiWDF5blArQnZ4ZFlxa09QT3cyNnVPSWZ2dmZGUVNl?=
 =?utf-8?B?ZXhmSy9WUEp1MTZ2eXpCMHovbHF5ZUlFZ2ZtbVpkaHNycWZHWVlvcFR2SUhV?=
 =?utf-8?B?eVhRTGxzVU0vZkNOazg2YkUxN1I4WmlrY0FWMnk4KzQrcjFlYzhyWCtvM1N4?=
 =?utf-8?Q?CvB94YjNo2TTvNrGXeCjXH5QCyEBd7033o5vM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <924450CC4EBCD842BB83158CF900AE86@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633a60f5-b851-481a-1d56-08d9841bfb7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 14:09:56.6214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jr+yWlwg9xIdL05zS1cJplI8I8gTmB8/qRAWDLbAOPQB8xw+i3ROfsFN62FocSr8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3144
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: 1vV86j5lgWKRxFX0HdhsIQ7Ugn9w1Pwi
X-Proofpoint-GUID: 1vV86j5lgWKRxFX0HdhsIQ7Ugn9w1Pwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_04,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 mlxlogscore=860 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109300090
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=9907073e8e=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

DQo+IE9uIFNlcCAzMCwgMjAyMSwgYXQgNTowNSBBTSwgUmFzaG1pY2EgR3VwdGEgPHJhc2htaWNh
LmdAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMjAyMS0wOS0zMCBhdCAwMDo0NSAr
MDAwMCwgUGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+IA0KPj4+IE9uIFNlcCAyOCwgMjAyMSwg
YXQgMzo1MyBBTSwgRGFtaWVuIEhlZGRlDQo+Pj4gPGRhbWllbi5oZWRkZUBncmVlbnNvY3MuY29t
PiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiA5LzI4LzIxIDA1OjI0LCBwZGVsQGZi
LmNvbSB3cm90ZToNCj4+Pj4gRnJvbTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+
Pj4+IFNvbWUgb2YgdGhlIHBpbiBkZWNsYXJhdGlvbnMgaW4gdGhlIEFzcGVlZCBHUElPIG1vZHVs
ZSB3ZXJlDQo+Pj4+IGluY29ycmVjdCwNCj4+Pj4gcHJvYmFibHkgYmVjYXVzZSBvZiBjb25mdXNp
b24gb3ZlciB3aGljaCBiaXRzIGluIHRoZSBpbnB1dCBhbmQNCj4+Pj4gb3V0cHV0DQo+Pj4+IHVp
bnQzMl90J3MgY29ycmVzcG9uZCB0byB3aGljaCBncm91cHMgaW4gdGhlIGxhYmVsIGFycmF5LiBT
aW5jZQ0KPj4+PiB0aGUNCj4+Pj4gdWludDMyX3QgbGl0ZXJhbHMgYXJlIGluIGJpZyBlbmRpYW4s
IGl0J3Mgc29ydCBvZiB0aGUgb3Bwb3NpdGUgb2YNCj4+Pj4gd2hhdA0KPj4+PiB3b3VsZCBiZSBp
bnR1aXRpdmUuIFRoZSBsZWFzdCBzaWduaWZpY2FudCBiaXQgaW4NCj4+Pj4gYXN0MjUwMF9zZXRf
cHJvcHNbNl0NCj4+Pj4gY29ycmVzcG9uZHMgdG8gR1BJT1kwLCBub3QgR1BJT0FCNy4NCj4gDQo+
IExvb2tzIGxpa2UgSSBkaWRuJ3QgdGhpbmsgYWJvdXQgZW5kaWFubmVzcyEgSSByZW1lbWJlciB0
aGVyZSB3YXMNCj4gY29uZmxpY3RpbmcgaW5mb3JtYXRpb24gYWJvdXQgd2hpY2ggZ3JvdXBzIG9m
IEdQSU9zIHdlcmUgaW5wdXQgb25seSAtDQo+IHRoZSBpbnB1dC9vdXRwdXQgdGFibGUgc2F5cyBn
cm91cHMgVyBhbmQgWCBmb3IgYXN0MjYwMCB3aGlsZSB0aGUgaW5mbw0KPiBpbiBkaXJlY3Rpb24g
cmVnaXN0ZXJzIHNheXMgVCBhbmQgVS4gSSBkb24ndCByZWNhbGwgd2h5IEkgd2VudCB3aXRoIHRo
ZQ0KPiBmb3JtZXIgb3ZlciB0aGUgbGF0dGVyIGJ1dCB0aGUgbGF0dGVyIHNlZW1zIHRvIGJlIGNv
cnJlY3QgYXMgdGhpcyBpcw0KPiB3aGF0IGlzIGluIHRoZSBrZXJuZWwgZHJpdmVyLg0KDQpPaCBJ
IHNlZSwgdGhhbmtzIGZvciBjaGVja2luZy4NCg0KPiANCj4+Pj4gR1BJT3h4IGluZGljYXRlcyBp
bnB1dCBhbmQgb3V0cHV0IGNhcGFiaWxpdGllcywgR1BJeHggaW5kaWNhdGVzDQo+Pj4+IG9ubHkN
Cj4+Pj4gaW5wdXQsIEdQT3h4IGluZGljYXRlcyBvbmx5IG91dHB1dC4NCj4+Pj4gQVNUMjUwMDoN
Cj4+Pj4gLSBQcmV2aW91c2x5IGhhZCBHUElXMC4uR1BJVzcgYW5kIEdQSVgwLi5HUElYNywgdGhh
dCdzIGNvcnJlY3QuDQo+Pj4+IC0gUHJldmlvdXNseSBoYWQgR1BJT1kwLi5HUElPWTMsIHNob3Vs
ZCBoYXZlIGJlZW4gR1BJT1kwLi5HUElPWTcuDQo+Pj4+IC0gUHJldmlvdXNseSBoYWQgR1BJT0FC
MC4uR1BJT0FCMyBhbmQgR1BJQUI0Li5HUElBQjcsIHNob3VsZCBvbmx5DQo+Pj4+IGhhdmUNCj4+
Pj4gICBiZWVuIEdQSU9BQjAuLkdQSU9BQjMuDQo+Pj4+IEFTVDI2MDA6DQo+Pj4+IC0gR1BJT1Qw
Li5HUElPVDcgc2hvdWxkIGhhdmUgYmVlbiBHUElUMC4uR1BJVDcuDQo+Pj4+IC0gR1BJT1UwLi5H
UElPVTcgc2hvdWxkIGhhdmUgYmVlbiBHUElVMC4uR1BJVTcuDQo+Pj4+IC0gR1BJVzAuLkdQSVc3
IHNob3VsZCBoYXZlIGJlZW4gR1BJT1cwLi5HUElPVzcuDQo+Pj4+IC0gR1BJT1kwLi5HUElPWTcg
YW5kIEdQSU9aMC4uLkdQSU9aNyB3ZXJlIGRpc2FibGVkLg0KPj4+PiBGaXhlczogNGI3Zjk1Njg2
MmRjMmRiNGM1YyAoImh3L2dwaW86IEFkZCBiYXNpYyBBc3BlZWQgR1BJTyBtb2RlbA0KPj4+PiBm
b3IgQVNUMjQwMCBhbmQgQVNUMjUwMCIpDQo+Pj4+IEZpeGVzOiAzNmQ3MzdlZTgyYjI5NzIxNjdl
ICgiaHcvZ3BpbzogQWRkIGluIEFTVDI2MDAgc3BlY2lmaWMNCj4+Pj4gaW1wbGVtZW50YXRpb24i
KQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+
PiANCj4+PiBSZXZpZXdlZC1ieTogRGFtaWVuIEhlZGRlIDxkYW1pZW4uaGVkZGVAZ3JlZW5zb2Nz
LmNvbT4NCj4+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IFJhc2htaWNhIEd1cHRhIDxyYXNobWljYS5n
QGdtYWlsLmNvbT4NCg0KVGhhbmtzIFJhc2htaWNhIQ0KDQpQZXRlcg0KDQo+IA0KPj4gY2PigJlp
bmcgRGFuDQo+PiANCj4+PiANCj4+Pj4gLS0tDQo+Pj4+ICBody9ncGlvL2FzcGVlZF9ncGlvLmMg
fCA4ICsrKystLS0tDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPj4+PiBkaWZmIC0tZ2l0IGEvaHcvZ3Bpby9hc3BlZWRfZ3Bpby5jIGIvaHcv
Z3Bpby9hc3BlZWRfZ3Bpby5jDQo+Pj4+IGluZGV4IGRmYTZkNmNiNDAuLjMzYTQwYTYyNGEgMTAw
NjQ0DQo+Pj4+IC0tLSBhL2h3L2dwaW8vYXNwZWVkX2dwaW8uYw0KPj4+PiArKysgYi9ody9ncGlv
L2FzcGVlZF9ncGlvLmMNCj4+Pj4gQEAgLTc5Niw3ICs3OTYsNyBAQCBzdGF0aWMgY29uc3QgR1BJ
T1NldFByb3BlcnRpZXMNCj4+Pj4gYXN0MjUwMF9zZXRfcHJvcHNbXSA9IHsNCj4+Pj4gICAgICBb
M10gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7Ik0iLCAiTiIsICJPIiwgIlAifSB9LA0K
Pj4+PiAgICAgIFs0XSA9IHsweGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiUSIsICJSIiwgIlMi
LCAiVCJ9IH0sDQo+Pj4+ICAgICAgWzVdID0gezB4ZmZmZmZmZmYsICAweDAwMDBmZmZmLCAgeyJV
IiwgIlYiLCAiVyIsICJYIn0gfSwNCj4+Pj4gLSAgICBbNl0gPSB7MHhmZmZmZmYwZiwgIDB4MGZm
ZmZmMGYsICB7IlkiLCAiWiIsICJBQSIsICJBQiJ9IH0sDQo+Pj4+ICsgICAgWzZdID0gezB4MGZm
ZmZmZmYsICAweDBmZmZmZmZmLCAgeyJZIiwgIloiLCAiQUEiLCAiQUIifSB9LA0KPj4+PiAgICAg
IFs3XSA9IHsweDAwMDAwMGZmLCAgMHgwMDAwMDBmZiwgIHsiQUMifSB9LA0KPj4+PiAgfTsNCj4+
Pj4gIEBAIC04MDUsOSArODA1LDkgQEAgc3RhdGljIEdQSU9TZXRQcm9wZXJ0aWVzDQo+Pj4+IGFz
dDI2MDBfM18zdl9zZXRfcHJvcHNbXSA9IHsNCj4+Pj4gICAgICBbMV0gPSB7MHhmZmZmZmZmZiwg
IDB4ZmZmZmZmZmYsICB7IkUiLCAiRiIsICJHIiwgIkgifSB9LA0KPj4+PiAgICAgIFsyXSA9IHsw
eGZmZmZmZmZmLCAgMHhmZmZmZmZmZiwgIHsiSSIsICJKIiwgIksiLCAiTCJ9IH0sDQo+Pj4+ICAg
ICAgWzNdID0gezB4ZmZmZmZmZmYsICAweGZmZmZmZmZmLCAgeyJNIiwgIk4iLCAiTyIsICJQIn0g
fSwNCj4+Pj4gLSAgICBbNF0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmZmYsICB7IlEiLCAiUiIs
ICJTIiwgIlQifSB9LA0KPj4+PiAtICAgIFs1XSA9IHsweGZmZmZmZmZmLCAgMHgwMDAwZmZmZiwg
IHsiVSIsICJWIiwgIlciLCAiWCJ9IH0sDQo+Pj4+IC0gICAgWzZdID0gezB4ZmZmZjAwMDAsICAw
eDBmZmYwMDAwLCAgeyJZIiwgIloiLCAiIiwgIiJ9IH0sDQo+Pj4+ICsgICAgWzRdID0gezB4ZmZm
ZmZmZmYsICAweDAwZmZmZmZmLCAgeyJRIiwgIlIiLCAiUyIsICJUIn0gfSwNCj4+Pj4gKyAgICBb
NV0gPSB7MHhmZmZmZmZmZiwgIDB4ZmZmZmZmMDAsICB7IlUiLCAiViIsICJXIiwgIlgifSB9LA0K
Pj4+PiArICAgIFs2XSA9IHsweDAwMDBmZmZmLCAgMHgwMDAwZmZmZiwgIHsiWSIsICJaIn0gfSwN
Cj4+Pj4gIH07DQo+Pj4+ICAgIHN0YXRpYyBHUElPU2V0UHJvcGVydGllcyBhc3QyNjAwXzFfOHZf
c2V0X3Byb3BzW10gPSB7DQoNCg==

