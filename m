Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5744C7919
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:58:46 +0100 (CET)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmAO-00034r-Un
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOm7a-0000DY-2x
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:55:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOm7X-00046e-QN
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:55:49 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJ7r1009555; 
 Mon, 28 Feb 2022 19:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=OYGbQFMCsEmwtxk+kQY5e1Ky91aYMNyNm090M8QmJjg=;
 b=HEzZ71jn1sBbiraGGfuOL9jqNQUNEsdctpqd8j+MQQHsa2tGqMP0w5ooQZupOdGSkEEt
 8uQQiLu/3rm6xaCQG062CiJI631BZCE/NXMsyuSH3djSxRUckdJ1XR9KJkyFxC+hhdPM
 4TEUvqy2SyEaXlMxkcjrXjUxJIvXYraeaUxdH/G02R4unVVaQgDrjMNSQv47qmUbye2C
 HzeFBGuLXx/EGDfGjE7BQ0rTRQYzzfzbFdkJsUAKy03kKR8tnBwzI10MIY0YJY9fUoDg
 IeRwBvFo03h34YuJy0nQ1ikUY9RIbn9CI17ZBQUlNowOqBBplHlHuL+29x/DgiWw19yE Gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efamcdap0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:55:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SJlCLw084865;
 Mon, 28 Feb 2022 19:55:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by aserp3030.oracle.com with ESMTP id 3efa8cxuf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xl219XvL0C3QQPHfQAv7udxWIUF54Si8YFCuVS/dVer6pMh44cwG70ZQqG4nNn29CAvEq9pOtqcA2UYPdYPWn/DrxIGkcHEAntYhr71UuEt9ZGEqm08+WcLuZwZhEkNibNzzF8OkTN2rXCqbwNNPgGeBJpVlnpB+7wBEOzymLBvXR98RIAKfnV05asiaxKlGlgHnkWVWre0SlFK070Ulz18aOXmcWAV+6BXGfXefMEQYC8uxFjjkf8YowL8w/GWw+3LNxac3hwxjpv9APpqL0iBVBOxjr/znP2dhOkFIQDKdOeQusM5I9cXW7My9VRRhWb3Da+Tjnfydhlp9nKh4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYGbQFMCsEmwtxk+kQY5e1Ky91aYMNyNm090M8QmJjg=;
 b=FiBYDkgx4tSUz4f4SCX/jFRbvmnDhdiEA1WCXU2ZMTaXHStPtGPKO6zG+b1NEpHW76QDnta9+vbQRMfySkrYK9g6KU4IEpmEPML6Hx3MZgdS63N7etaouYIIBveGilPSnh3P6LbHAc3LpGOlHuMILiZKo+HRVpoKkCxIqPzQpomYvmEn461+BWjpQYbiVG4/MqmDdXgjTy91+9KOIJuxxEzk7tUrJGMG8Skk9ohXk7HCZ2Tk+owfwSqnIsPM40c0BhGAMvqg2rn2LFToLu2T15+7p95NftkSUCJ+a5RXsQjbbqqP18AILTScr3693KByuDMyCIDUdWCyHeAgZB78vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYGbQFMCsEmwtxk+kQY5e1Ky91aYMNyNm090M8QmJjg=;
 b=amQqYYIUL4NAqyfl/1nbUpPPUnHnfrE9JhzAFyg9Ug3x3qEotmy4Aou+UmxgePeQ9N5OsVaV53owWsu557Ai1MINM9aMoIh2jlwAjI+xR0iBwPHZhAFuYJNeUIYKS1FPjyxJpz3UsLpGZ1bQGHIfXpRNC8Zy7rClecXh0TZPeMg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR1001MB2416.namprd10.prod.outlook.com (2603:10b6:301:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:55:40 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:55:40 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAEENACAAI9eAIAAK1gAgAK56gCAA9cogIADECaAgACqxICABaQnAIAAHNaA
Date: Mon, 28 Feb 2022 19:55:40 +0000
Message-ID: <B1E454BD-5499-4D4A-9812-AE1411A7ED47@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
 <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
 <FB3E0606-9B09-44B2-BAE0-771BB8E3B3AA@oracle.com>
 <e5e88bcb-6573-709f-5c17-229cde3a0a5f@redhat.com>
 <1399787E-BB5C-48A3-A848-44520EA52A1C@oracle.com>
 <6802128b-f66b-91a4-aae2-d0f38ceea423@redhat.com>
In-Reply-To: <6802128b-f66b-91a4-aae2-d0f38ceea423@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb898249-6552-45e8-0ca1-08d9faf44c46
x-ms-traffictypediagnostic: MWHPR1001MB2416:EE_
x-microsoft-antispam-prvs: <MWHPR1001MB2416B859237C3DA03316695790019@MWHPR1001MB2416.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IQANYi8R1MgEXC9yhCcLLWYrDoowKz63XNhJEu2CTvm12bDveLo+imWAMcEjp1AmNOZ4+Hv4HY+uH6aCVrEthI93T9GYR57cgAIhqV3v1N5EBNfTzFQX8A3uNkiH0xWIbGjLxC0/6MykCQAsuVm5Tozjt1I5bVxLBZIlVa8H8skY45Hk+yL2z5Lb0Lws3Qqu6tFO5018Pm5QhRoOFBlH7pR+Ok/yl0tgNwVU3gu2M/OU/Ru5vfKe4i/hZL+QEdrnvPQcT4Ncown888ZngiY4A2UOvE5xXJYJlp7jkA8+P8wWSIRERIcVZYW7NGYQcJTx795R/lvkjFwr5Sft8i0yIEPakLrdpEssFQ89PFtdcaabXcK0ofHK9Kj9Kj+COBAqHgqGPwYqEs2cG7A94qYtteUejth/0qQVkO5qu6INr/IJGatB7ZZbjukz9iLHaq/iulIJwM53pugFtW33GHgmtP1tdN8UUN9biIjjMe22dyTYMQ4P9nc4ryYgCbaU16IksZrADeLmjemRQ4aJAiUsW1hWFe258zcdQj1HIqUKWvOTeRdoo12alz5Y1F1mdzi0SEq34IdKaFUbJCmYGepqfszzmzEorHXVBqNQWZ5UcUC5BLmZ6fM70r+36WmuRTP1QBf52vjBGLQ3eWTneQuTofPVQg0AoLOnzlCQ/S0XUuTC+nDDZK46Xhtv6MMYJiMzIV16Rsqa9T9a7S82vTinFIrXkdXQnowl0Bqg+Oz0812UEuJhKEDVNJKHJqRI0J6X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(316002)(6506007)(7416002)(6512007)(86362001)(44832011)(38100700002)(54906003)(38070700005)(6916009)(8936002)(53546011)(64756008)(186003)(33656002)(76116006)(66946007)(6486002)(66476007)(66556008)(4326008)(2906002)(508600001)(66446008)(71200400001)(2616005)(8676002)(122000001)(5660300002)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K05uN1lWdDlwVnhHRVYyV0lrL0tHY1JYeGVRRkFnL2NDdW9NOUtNRWkvb3lm?=
 =?utf-8?B?enNHaEs1eWEzMlErbG9DaTdZT1JuYUdIMlBnWkY5UDc3ekRocTlBbzNDQVB2?=
 =?utf-8?B?UExXSURuSFo2TVF6bUZBem8yZFZST3B6SFF3ampnOENyYzlmekJpOGhzWTZD?=
 =?utf-8?B?NnU5dFJEZmUyem1ER0VRaTc4V3k5STZrVW0xT0lOQUhkZU1KZlc2THdjN2pu?=
 =?utf-8?B?dHVScjExcFhsdXJLcmgzdmhRdkF1R25oTi9BR25ReXprY0ZXSGt3TFV2c1do?=
 =?utf-8?B?NVcvU1g4OEkyNmlOQjIySkxCazFMcFJZaHo1Mi9HYWcyU01XaFJYT3QwaElM?=
 =?utf-8?B?UWVFUVNzQ3ZmTVJ1WHg2Vi9KbnRoZW1FL0IvNDlXWktESDZ2NnJ2U3pPUS9N?=
 =?utf-8?B?T3VEcjB0ZEpGZ0xWVzJRN2hGdUdNM3FSQ0JXNk1lWXJzNi9VdlRTakJQQ2ov?=
 =?utf-8?B?VjA5VG5ta281dEhMM1FYUndtaUNtZ2lJbDZUcWJvUmxVcCtHcTRibGUwVGQz?=
 =?utf-8?B?OVJ1TW5ycWl2VUlmMjE3QlBXOVR4NVFjTDYyOWg3bjBuVzFqTmZIUHZ2Y1Bu?=
 =?utf-8?B?b0crTHkxR21XRTVnd2hCNHV2ZUlCNG5MTm5ncys0TkNxNWZiQ2hSQ1VGTzNK?=
 =?utf-8?B?SE9PZUF0MGY3MkpjeDBVQktMQkJ6bkpDN1NUdkVmUzVDZXpVdjhKWmt2T0Mw?=
 =?utf-8?B?cUh2QUVlbW1TMU5QRURFT0xGZ3lONFZBcUIvREsyUFdjK3cxeWVZam1mQzF4?=
 =?utf-8?B?L282aC96aTdRNThjbk1wSmJXVVpSbEF2TmtmNU4wUWpWYytpME9EUDJWMW5M?=
 =?utf-8?B?UlM0aWpheStYa0RVenZFNFlBVnBNMFZrcnFkRDFvRmZMaFMycUxWQkJKUWMr?=
 =?utf-8?B?VGNXOElvQ3p4YldwMFB0YmtnQ0VXU0hRSXdMWXo2UysyZzNQV01vMXR1eUhB?=
 =?utf-8?B?M0lwZDdDOUpROWJPOGczbEN6SVhUcW1VN2RlOG4wdm9JNjhOU0lIU2V2aE1u?=
 =?utf-8?B?d0hPeHFFWmhQbEYyb2FOd0t4R214aEM3bm5reWk5QzNYOW13cExYNnJlOGJO?=
 =?utf-8?B?d0tiZ1U2NGhIeGdIZzRnUG9nSFc4K295YUxrbWxTcEJmRVdPUG10TGovMlVT?=
 =?utf-8?B?c243RzBhNkN6a2NESVgyc1JjS0d4Ums4MjNtUzhJY1dZN1kzNms2NE9za2VH?=
 =?utf-8?B?TjJReU1Sc1FtK2hOQXdONm9XOTN3aE9nU3NHY0cvOVVsRWxUQkQyenVIRUpH?=
 =?utf-8?B?end6MFBkcHk2QStpZkVSVStXUDg0M0FJaDF2RmN2VWMxVmNzV0JxTmwrekgw?=
 =?utf-8?B?OWVjWGNGUXF5aFpjQmZrN0R4NEdXc0RSNDVPOElTVS91S3AyZ1NZMFlmNjJJ?=
 =?utf-8?B?b0NDNEZXS25nMHFwQkpVS2VTaURSQ1N2K2tBNWN1d1BsanNqR2JUcDJ5ZUhN?=
 =?utf-8?B?TFhrMjlrcjdPekpqdVRXRm0vQ3IzdkVMbjgrVnM1TEhpWlhxWlRjTmF0M0lL?=
 =?utf-8?B?Z0p6VTkxckdSZ1RRREFOWXJIQ0hDS0oxMFppUnJmTlZ5MElvY2RhT1Q0WWNI?=
 =?utf-8?B?b1YvM0pSUjF5SnFwcVo3RWtlZG9DWnBKZTNTYk40bURNaGpncHBOZTd5Y3ZT?=
 =?utf-8?B?UVh0aFFFMWYzUFhoVFRkQzRwNUpSVFh2Q2ZTSjhTRkhGcjEwWVIvWW82WTRh?=
 =?utf-8?B?NVV2WlFkV1JDM1FmUmhLOFR6Yy9lQ1hnMnN3MU10d2hlUDZ4dDltTzlBMFYy?=
 =?utf-8?B?dFkwUXBnNHVMWjFzS0dPQVFaVzR4VmEzVkx3MkUyOVZUNGZXY0tldHZ4WER1?=
 =?utf-8?B?ODdEY1RTS0VVSG1Pb3BUTno0d0ZRaFdNVjYrbjhGSTF2RzVWbFhpZ0JNa3FK?=
 =?utf-8?B?ZVNldFp4WS9kcFJFMjB0bTZ0Z0VpRXV0RE9qcVBFcnJYMVBwMnVIdDd4TTE1?=
 =?utf-8?B?RFNNemZiUDNNYW9zdXNwVy95KzVCbDI4OTAzeFVyTVNMclhVanV6dHoyTFpM?=
 =?utf-8?B?RWEwbHhQM1ZmT1RuYkk2Nkpta0FsSGpFTW1pSDBZNk5OaXVCMExNZmJXRUNS?=
 =?utf-8?B?WHpHakkvSURIeGNFL09JdmpJdGVNQ0NJYXZjTXYyOVZGcGpJWHVMcXlxUkI4?=
 =?utf-8?B?clovbkhaczB1eDUyazcvcklRNHcvd1FEbGIzdThQZG1VY0Q4bUhCZzZuSmVi?=
 =?utf-8?B?ZDZPbGs5MWVoT3NFSlpIT2JKN2pZRlhGUkFXblJjUDFMZmJINlBZTy9CTlly?=
 =?utf-8?B?bmRnQ2h2bGVaWEMxMTN6amFsOXR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5069474C745124795440FEE63B641DD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb898249-6552-45e8-0ca1-08d9faf44c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:55:40.7634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/UK1WtLJZo9END/BegDe5MBT9c+zegsCTjZWsl2yRPk13luE+GWQsKrjd2fpgSVHNR1WTklSzd4p32tNypimQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2416
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280097
X-Proofpoint-ORIG-GUID: KJu2rifvcBvjiFvfP2QxNHfHnnqQUYeO
X-Proofpoint-GUID: KJu2rifvcBvjiFvfP2QxNHfHnnqQUYeO
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDI4LCAyMDIyLCBhdCAxOjEyIFBNLCBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIvMjUvMjIgMDU6MDMsIEphZyBSYW1hbiB3
cm90ZToNCj4+PiBPbiBGZWIgMjQsIDIwMjIsIGF0IDEyOjUyIFBNLCBQYW9sbyBCb256aW5pIDxw
Ym9uemluaUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAyLzIyLzIyIDIwOjA1LCBK
YWcgUmFtYW4gd3JvdGU6DQo+Pj4+PiAtICAgICAgICAgICAgZGVmYXVsdHNbcHJlZml4ICsgJ0NP
TVBJTEVSJ10gPSBleGVfbGlzdA0KPj4+Pj4gKyAgICAgICAgICAgIGRlZmF1bHRzW2Yne3ByZWZp
eH1DT01QSUxFUiddID0gW2V4ZV9saXN0WzBdXQ0KPj4+Pj4gKyAgICAgICAgICAgIGZvciBpIGlu
IHJhbmdlKDEsIGxlbihleGVfbGlzdCkpOg0KPj4+Pj4gKyAgICAgICAgICAgICAgICBkZWZhdWx0
c1tmJ3twcmVmaXh9Q09NUElMRVJfQVJHe2l9J10gPSBbZXhlX2xpc3RbaV1dDQo+Pj4+PiArDQo+
Pj4+PiAgICAgICAgICAgICBpZiBjb21wX29iai5nZXRfaWQoKSA9PSAnY2xhbmctY2wnOg0KPj4+
Pj4gICAgICAgICAgICAgICAgIGRlZmF1bHRzWydDTUFLRV9MSU5LRVInXSA9IGNvbXBfb2JqLmdl
dF9saW5rZXJfZXhlbGlzdCgpDQo+Pj4+IFRoaXMgZml4IHdvcmtzIGF0IG15IGVuZC4NCj4+PiAN
Cj4+PiBXb3VsZCB5b3UgcGxlYXNlIGNoZWNrIHRoYXQgLW02NCBhbmQgLW1jeDE2IGFyZSBwYXNz
ZWQgaW5kZWVkIHRvIHRoZSBjb21waWxlcj8NCj4+IEhpIFBhb2xvLA0KPj4gWWVzLCBJ4oCZbSBh
YmxlIHRvIHNlZSB0aGF0IC1tNjQgYW5kIC1tY3gxNiBhcmUgcGFzc2VkIHRvIHRoZSBjb21waWxl
ci4NCj4+ICMgY2F0IC4vc3VicHJvamVjdHMvbGlidmZpby11c2VyL19fQ01ha2VfYnVpbGQvQ01h
a2VNZXNvblRvb2xjaGFpbkZpbGUuY21ha2UNCj4+IOKApg0KPj4gc2V0KENNQUtFX0NfQ09NUElM
RVIgIi9vcHQvcmgvZGV2dG9vbHNldC05L3Jvb3QvdXNyL2Jpbi9jYyIpDQo+PiBzZXQoQ01BS0Vf
Q19DT01QSUxFUl9BUkcxICItbTY0IikNCj4+IHNldChDTUFLRV9DX0NPTVBJTEVSX0FSRzIgIi1t
Y3gxNiIpDQo+PiDigKYNCj4gDQo+IEkgcmVwcm9kdWNlZCB0aGlzIHdpdGggQ01ha2UgMy4xNy54
IGFuZCBpdCdzIGZpeGVkIGJ5IDMuMTkueC4gIEknbGwgc2VuZCB0aGUgZml4IHRvIE1lc29uLCBi
dXQgZm9yIG5vdyBJIHJlY29tbWVuZCByZXF1aXJpbmcgYSBuZXdlciBDTWFrZSBhbmQganVzdCBk
cm9wcGluZyB0aGlzIHBhdGNoLg0KDQpPSywgZ290IGl0Lg0KDQpUaGFuayB5b3UhDQotLQ0KSmFn
DQoNCj4gDQo+IFBhb2xvDQoNCg==

