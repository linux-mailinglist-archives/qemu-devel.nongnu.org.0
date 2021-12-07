Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C646B47E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:49:15 +0100 (CET)
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVDt-0004Z0-SR
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVCU-0003qS-7D
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:47:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVCR-0005NL-CO
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:47:45 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74nb4t016355; 
 Tue, 7 Dec 2021 07:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=PqATN1DPGiZ1FmNuSGhwAxc5pk0rdHzejQuYdufH5qg=;
 b=P1aJu1ZRQlLc/sBuLuKt/X+oxRC1pbUsA1BwtUIJDKOZ8lgPVfBMYrVslUQl2+HJuEW1
 dJWANNrSjt329rsG4hidzyvES/YpNqExig2PeANoBVn1BpdZEqevl4OCFeSNPSJ/Lcbe
 cylSVXw+YuetEQa6A4vG0raZmIbjXHQJWvA4rzmBSDLVRz/WqZDL8x88N0WGvkV+utJa
 ybmEDCmQXe0arlLlpdxpzTLlEX+/LTSpehZjIciFSye4dPIMTXowoeNf9ep5LrC6+DTU
 5BbklL9kSt1zMfBQhn4esLajOezWPTqPdqyEGlujlBGZnj5cBMdgv89QoJs4R4N8fzL/ Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csctwmjn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:47:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77fDww179319;
 Tue, 7 Dec 2021 07:47:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3030.oracle.com with ESMTP id 3csc4swwbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxwwMqSaELD9yzOlo0dwDJ3I6n7BLsfxIa9nxhqwxll8y9ZKOfgdR5Lko2OH9hj8j7FdDpuyPkEWpT8FnTQVgBuLjZTuZnsnHqhwRINU3lE1v3/PAXApJhZ5rGSewjKaRT3vV80GgdSZkQUQgwGpcDrPLNi1k0SyoNyFAC04GNldRtKcaeCdcdDbB95EKJy7aPdU7zTH4dI5bJT0wqTiKAGes33zSdmEC8euCYTzCXJppY2jxH+aXvS4mEhmuAm06v0AegyRSb4WDME72DIgyiHdxEVDY+DgVAb4wh06kV/Iz34s4xQ37YOgGyGhAAH5X/Y/PqYnmPlYopIR1QYU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqATN1DPGiZ1FmNuSGhwAxc5pk0rdHzejQuYdufH5qg=;
 b=SLUIa9zQt7MzWhd82nPwxJMewPnGXPNqPi7jKiAQcYE7vjEzKDDpWlXq9+DNUHz+EdypzPJO29m3ysyldQJXeZcv7NpTzvvrHgWhWWCqvKSRWulDtTJhupFXq74Li5HQPaHbR6GSu7j/M7BmSegV7MzUZQ+0HQJKz+SeZz7r7OLHI2OgFaP17kJ3DvnrkgvIeKp+CxJL1QITBjRukxA9I3od2iwoNh7ErO3EV5dTq7mH0WekkrrWbyJ6nTXe7dqnQ/rPhW/Ba6gfGBl+SgbDfOs9PRbXkXn/c80phT0FZONrnUfQ9hovchdZPqD6gALXyu9rqU2bFRMIOC3dieYZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqATN1DPGiZ1FmNuSGhwAxc5pk0rdHzejQuYdufH5qg=;
 b=n8RUYTR9FH7HLwSVpvDhST69tuU3R5zA7AqtpGNC3xQ5PFfd3BRqAzxp3maOPOnxUptqt8UIk3YaTPrThdl+poavb79iQmtXzggzlgdFU+umVC7hvSo8oGidvYy3mX9CzZEMAl0OJo55dUtwyN0O4IOzZY3WVdtjMWdivVCsKmQ=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 07:47:35 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:47:35 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 02/19] vfio-user: add VFIO base abstract class
Thread-Topic: [RFC v3 02/19] vfio-user: add VFIO base abstract class
Thread-Index: AQHX1P3+h4rVkp/xI02TAmLBc+ai4qwLg2sAgBtP/QA=
Date: Tue, 7 Dec 2021 07:47:34 +0000
Message-ID: <488419E0-0438-4606-9BE9-B30D4303A4A7@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <c3c41abc74603d5d2cb56a20bb0a056b8c338b88.1636057885.git.john.g.johnson@oracle.com>
 <20211119154216.0cb72af5.alex.williamson@redhat.com>
In-Reply-To: <20211119154216.0cb72af5.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99cebeb5-612a-496b-849e-08d9b955d544
x-ms-traffictypediagnostic: BYAPR10MB2999:EE_
x-microsoft-antispam-prvs: <BYAPR10MB299967D41DF395B71D252C60B66E9@BYAPR10MB2999.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mWjxm+RdrX6MZcKB918i1QWptc2q18SHXauulbaZAzK2BXH/HWAj5pnA7k0GUV9jlt7xuwYARawGtCPGdUVXoZBC57j++4fQb3NzkS85jzBRI4V+78FSpFnexmvaDJxTBrn0j1jdEf2KdM8k8/6BFrismt103GGwzevLbI5eDH13iePH3nZCiLf+QprEkBBp5FkUdXKU1BHjlUq3YjAUKbkmYOL9T+A2yfPVn+mmSyJ0W5HJJUbYaPVxjgoPk+tRYos72PYF6LRXihL7KGWAJPB5knYkm2ItyOXtBCpT/c+feQz/tvQyFDxfNT0XPsxRQbDgL9ZbcsMLXL8jy27ONNnmYN9y6UO3E+XE29DtHtFlTOMOSQFvBqAn53Be50DDbiUEfvLFlEXEeM3r3+N9roTo6Gte+vI0xNrREmmir+Q0QK6dREY3sspH5aD3Mupvk2NxGdfEUot8mXSTNpkBpgX7Reme+pYg+GPEYz9LuBg2QXQhMb1sw/PqmJz6A6U3t96mFpSCPsCjIT7X863PIcgwc8wsAAqwQJKa9uBgFqTMSUsI7h7NX7pHEXwkjzj122VbGUjwcWA+GJLDpU30akf458Z+YwXcl09n1RYIoB0ctU5gMLO+dgkPis4Z8MsPmMjMSLj7204UoNXjEZ4OZYbftS3M5AQ+ZZaCYsAhbTxzs3o36wbGjfnkNdbCaeumt19aybe0VSe3LNyxte5ES3r2VsxSuYPNt52GnEDvU0R9q47B3Ud4DamY7VhCWBfD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(316002)(186003)(8936002)(2906002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(6506007)(53546011)(26005)(4326008)(83380400001)(86362001)(36756003)(6512007)(5660300002)(6486002)(38100700002)(122000001)(71200400001)(6916009)(33656002)(8676002)(2616005)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHNsUkkveml1ZFpteU1FV1lVYUs2L3R1TFFxLytoTzkrK2pjYk0rdzZoWGoz?=
 =?utf-8?B?ZVNqYWxYTU1XK1ZlTVUrV2hPUzVsMElScno0ZUJVVkVWYXBqQUtBZ3Y5SEVT?=
 =?utf-8?B?cjZJYmtzNm5sNE1TLzc0blNIZzJsVFRMc2c4SkpaYWNQTEZaTXhjUTZIVmhD?=
 =?utf-8?B?MjVYb3grc2ZwR3h0cS9LTlZsVGcrdXRwbzB0Y2ZTaWFOcmRkVk9jaU9TUmFV?=
 =?utf-8?B?SWZiK3gyb3hwcERheklIQ3Q0TFFrR2ViNHJLR3VRRk0wZEp2ZWhQZ2VKbXkw?=
 =?utf-8?B?WU1LZmpEMmM3UDN5M01GOVBuQk5OTHFtc1F2a25zWEN6ODA4MlVMSjFQbTdq?=
 =?utf-8?B?SGtJbFFQa3A4V2xpZGxYUWZkbWFJWjVwd3hoV04zNGlUeGMzcmtnakI2OUZE?=
 =?utf-8?B?NWFWWGNTeEltdnE2Rjk3eC92cXFGQnZueW0rTmJOK2o2KzM1NWJZQmlZN1ZS?=
 =?utf-8?B?aTkrc01oNTFjRVRnL2MwbVBIQjc0Yi9ObHZCdlRlZTFRQXJuSFAvcnk4N2Yv?=
 =?utf-8?B?MFFodEhMM1lFeWE3MU1ESW1YbkJPbzZyNHdCU3MvU3JtSDZFR3RXbHJFWU5z?=
 =?utf-8?B?UTVrdnZhMkx3aFBUNUZyRUFlZHExZCtWR2Y3WGQ1RmVXb2orekM3cTlpMHJp?=
 =?utf-8?B?TU9tcEkzODJ0cWRzdk1QOTBTS09qVjIvdU5ETEdHbGdyNVRacitvZGgxTm4y?=
 =?utf-8?B?QUFVYVVEK09HOWNHUFo3bTNBbnpESjRvOVMveXpscmJmTkU4TWhrSVd5UVo1?=
 =?utf-8?B?enBUcjBzL3UvcE1VQ1M5cFdtU3UzaEpLcXVPem9GdHhCNitEL3JmK3ZQdURQ?=
 =?utf-8?B?Wm5FdjEyOUR0bDBGS20vOUZFckJ4SGpmKzhjL2MvSzZaQnJuSi9iem9QNHVy?=
 =?utf-8?B?ZnhEL0wxMzFoUm9FcHcra3ZybHlFZzdEYmpsUHlxNzJmaURiT1BHTGxsZExQ?=
 =?utf-8?B?UkpRNWJ4clplWDNNamVmN09NV1hDd1hjOVdXTU5SZVNNdktxd3lZbUFRc3Jl?=
 =?utf-8?B?aDFIamF2K1lwRUVacXlNUWhaZHZxbVBCQlhiL0FHKzlublpkT21KVTZiWVF5?=
 =?utf-8?B?cmx6YVF5K0dDZEpvc3ZhS292eXhOd05vblRUTXllTXJpZ3YycjFXUHFSWity?=
 =?utf-8?B?TzUvemEwbDR5aS9HVGtTQVhkc3BZWmp0MVYwcWxYRmJZSTZGaXc3NW9SMmZT?=
 =?utf-8?B?OVU0aFlMdE1ES0x5YzRLeU9pdWVodXlWNytGckNaeXUwZW4zMmZCVitEaXVU?=
 =?utf-8?B?MXVLelVmS3BzMDdKT2xkMFEzTnRUTEsrYVBGS0J5Qit2azI2R1dLQlJaekR3?=
 =?utf-8?B?ZU1JYTkrWmE0NVVPZEVFTlVwMWdkalVMSUkyclJ3QnpVNjUyVWFzZFpNblc3?=
 =?utf-8?B?dEM3eFUwaXhwTThFalFqRFZ1VzZtMG95eVF1QzEwOC9tUVJnd3cwNE1mL0pX?=
 =?utf-8?B?RW5MY0k1R05yb2lPVWdBczV6K3UwWUZoOXYzajhLc0E4dCtIWUJlYlJYRmNm?=
 =?utf-8?B?WDBaN1RPZWFZM08xbTZMM1o0RUJkelpzaE9Ia1g0cnN5Q1czeFVkUERleW1n?=
 =?utf-8?B?ejJoWk9JM2hvdGloOW1WSXZkM01lcmJlQnFYRVJNYUorR1lnVXU4K01pODVo?=
 =?utf-8?B?UWxiOUtlWlhVV3dWWlkvL2hJL1h1ejJpVk42RTloM28xRTBYR0ZSU2pEcU5U?=
 =?utf-8?B?aUt6SnpqU0xvSXhiVUJKbm02d3R4WVR1aU5EeTRoNmdVS3dJODhzK2Q4eW9R?=
 =?utf-8?B?cUVyYnJOQ2lUaFBacWFKMEVMWUhGWnlmOUk0U2hzeVFRQ1N0c0RncFo1ci9T?=
 =?utf-8?B?OVdOR2Q5SlB3Ty9vNGFlTVNYRWF3SFh0LzdlUmMvdDU0blZWSWRyeEJsV1pi?=
 =?utf-8?B?SEtPTWNMcUVuY0tCNlVLQ1I5aUVDUHArQ1Jrc3V4cjl1a3RmY0hGNG5xWmRo?=
 =?utf-8?B?NndHTmVBMzkrbEd3RnBObVFrWTc4OEloK3FwZ014U3lHeTVWaWsxOC90Y0Fm?=
 =?utf-8?B?V0lmSVh4MmpsTHhvVWFhV0xUbnB3djJKR28yUFRGck5DdktJa3o3TEFFZ1Vv?=
 =?utf-8?B?bUFlTlo1TjZ4M0xUTG9JTTdlRUphYitwN2xMSFJ3NGUvMTZRdnhGQy9EWDV5?=
 =?utf-8?B?Ly9GRFZJOGVNZDJxTll2b20welQrUHZENU40SFVBVjQxNnBzK0FqdmFha0FV?=
 =?utf-8?B?c1o4eEMyNElyaG5EdVJvWlhhOWh1ZnVRTTdOSytJVWM5cXZwNTVkazh5VU1T?=
 =?utf-8?Q?tCet1nGBPTubO4TTmmOAb0oYvXevqhCLlvTzD+p3OA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D7CB6532DBF4E4FB3C8B6C2421C58C1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cebeb5-612a-496b-849e-08d9b955d544
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:47:34.9938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntSqamiZD8hVt/wiAWjw0MIGFQaSsgACP3QG6UWtdXVmHaKLVSgHXiCKR3Mtx9SiEc+nvFth0TXXVJh6dm6qs1hm6hApAjSaISx2yw3ap20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2999
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: ndNzCvCu9-U4wGjHNB6UjGWkgBP3L30g
X-Proofpoint-GUID: ndNzCvCu9-U4wGjHNB6UjGWkgBP3L30g
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgIDggTm92IDIwMjEg
MTY6NDY6MzAgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiArDQo+PiArc3RhdGljIFByb3BlcnR5IHZmaW9fcGNpX2Rldl9wcm9w
ZXJ0aWVzW10gPSB7DQo+PiArICAgIERFRklORV9QUk9QX1BDSV9IT1NUX0RFVkFERFIoImhvc3Qi
LCBWRklPUENJRGV2aWNlLCBob3N0KSwNCj4+ICsgICAgREVGSU5FX1BST1BfU1RSSU5HKCJzeXNm
c2RldiIsIFZGSU9QQ0lEZXZpY2UsIHZiYXNlZGV2LnN5c2ZzZGV2KSwNCj4+ICAgICBERUZJTkVf
UFJPUF9PTl9PRkZfQVVUTygiZGlzcGxheSIsIFZGSU9QQ0lEZXZpY2UsDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGlzcGxheSwgT05fT0ZGX0FVVE9fT0ZGKSwNCj4+ICAgICBERUZJ
TkVfUFJPUF9VSU5UMzIoInhyZXMiLCBWRklPUENJRGV2aWNlLCBkaXNwbGF5X3hyZXMsIDApLA0K
Pj4gICAgIERFRklORV9QUk9QX1VJTlQzMigieXJlcyIsIFZGSU9QQ0lEZXZpY2UsIGRpc3BsYXlf
eXJlcywgMCksDQo+PiAtICAgIERFRklORV9QUk9QX1VJTlQzMigieC1pbnR4LW1tYXAtdGltZW91
dC1tcyIsIFZGSU9QQ0lEZXZpY2UsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBpbnR4Lm1t
YXBfdGltZW91dCwgMTEwMCksDQo+PiAgICAgREVGSU5FX1BST1BfQklUKCJ4LXZnYSIsIFZGSU9Q
Q0lEZXZpY2UsIGZlYXR1cmVzLA0KPj4gICAgICAgICAgICAgICAgICAgICBWRklPX0ZFQVRVUkVf
RU5BQkxFX1ZHQV9CSVQsIGZhbHNlKSwNCj4+ICAgICBERUZJTkVfUFJPUF9CSVQoIngtcmVxIiwg
VkZJT1BDSURldmljZSwgZmVhdHVyZXMsDQo+PiAgICAgICAgICAgICAgICAgICAgIFZGSU9fRkVB
VFVSRV9FTkFCTEVfUkVRX0JJVCwgdHJ1ZSksDQo+PiAgICAgREVGSU5FX1BST1BfQklUKCJ4LWln
ZC1vcHJlZ2lvbiIsIFZGSU9QQ0lEZXZpY2UsIGZlYXR1cmVzLA0KPj4gICAgICAgICAgICAgICAg
ICAgICBWRklPX0ZFQVRVUkVfRU5BQkxFX0lHRF9PUFJFR0lPTl9CSVQsIGZhbHNlKSwNCj4+IC0g
ICAgREVGSU5FX1BST1BfQk9PTCgieC1lbmFibGUtbWlncmF0aW9uIiwgVkZJT1BDSURldmljZSwN
Cj4+IC0gICAgICAgICAgICAgICAgICAgICB2YmFzZWRldi5lbmFibGVfbWlncmF0aW9uLCBmYWxz
ZSksDQo+PiAtICAgIERFRklORV9QUk9QX0JPT0woIngtbm8tbW1hcCIsIFZGSU9QQ0lEZXZpY2Us
IHZiYXNlZGV2Lm5vX21tYXAsIGZhbHNlKSwNCj4+ICAgICBERUZJTkVfUFJPUF9CT09MKCJ4LWJh
bGxvb24tYWxsb3dlZCIsIFZGSU9QQ0lEZXZpY2UsDQo+PiAgICAgICAgICAgICAgICAgICAgICB2
YmFzZWRldi5yYW1fYmxvY2tfZGlzY2FyZF9hbGxvd2VkLCBmYWxzZSksDQo+PiAtICAgIERFRklO
RV9QUk9QX0JPT0woIngtbm8ta3ZtLWludHgiLCBWRklPUENJRGV2aWNlLCBub19rdm1faW50eCwg
ZmFsc2UpLA0KPj4gLSAgICBERUZJTkVfUFJPUF9CT09MKCJ4LW5vLWt2bS1tc2kiLCBWRklPUENJ
RGV2aWNlLCBub19rdm1fbXNpLCBmYWxzZSksDQo+PiAtICAgIERFRklORV9QUk9QX0JPT0woIngt
bm8ta3ZtLW1zaXgiLCBWRklPUENJRGV2aWNlLCBub19rdm1fbXNpeCwgZmFsc2UpLA0KPj4gICAg
IERFRklORV9QUk9QX0JPT0woIngtbm8tZ2Vmb3JjZS1xdWlya3MiLCBWRklPUENJRGV2aWNlLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgbm9fZ2Vmb3JjZV9xdWlya3MsIGZhbHNlKSwNCj4+IC0g
ICAgREVGSU5FX1BST1BfQk9PTCgieC1uby1rdm0taW9ldmVudGZkIiwgVkZJT1BDSURldmljZSwg
bm9fa3ZtX2lvZXZlbnRmZCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICBmYWxzZSksDQo+PiAt
ICAgIERFRklORV9QUk9QX0JPT0woIngtbm8tdmZpby1pb2V2ZW50ZmQiLCBWRklPUENJRGV2aWNl
LCBub192ZmlvX2lvZXZlbnRmZCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICBmYWxzZSksDQo+
PiAgICAgREVGSU5FX1BST1BfVUlOVDMyKCJ4LXBjaS12ZW5kb3ItaWQiLCBWRklPUENJRGV2aWNl
LCB2ZW5kb3JfaWQsIFBDSV9BTllfSUQpLA0KPj4gICAgIERFRklORV9QUk9QX1VJTlQzMigieC1w
Y2ktZGV2aWNlLWlkIiwgVkZJT1BDSURldmljZSwgZGV2aWNlX2lkLCBQQ0lfQU5ZX0lEKSwNCj4+
ICAgICBERUZJTkVfUFJPUF9VSU5UMzIoIngtcGNpLXN1Yi12ZW5kb3ItaWQiLCBWRklPUENJRGV2
aWNlLA0KPiANCj4gDQo+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCBzb21lIG9mIHRoZXNlIGNob2lj
ZXMuICBUaGUga2VybmVsIGludGVyZmFjZQ0KPiBvcHRpb25zIGxpa2UgImhvc3QiIGFuZCAic3lz
ZnNkZXYiIG9idmlvdXNseSBiZWxvbmcgaGVyZSwgYW5kIGl0IG1ha2VzDQo+IHNlbnNlIGZvciBx
dWlya3MgcmVsYXRlZCB0byByZWFsIGhhcmR3YXJlIHRvIGJlIGhlcmUsIGlnZCwgbnZpZGlhLCBn
cHUNCj4gZGlyZWN0LCBldGMuICBCdXQgdGhlIHJlc3QgSSdtIGEgYml0IGxvc3QuICBXaHkgd291
bGQgb3ZlcnJpZGluZyB0aGUNCj4gUENJIElEcywgZGlzYWJsaW5nIGJhbGxvb25pbmcsIGRpc2Fi
bGluZyB0aGUgZGV2aWNlIHJlcXVlc3QgaW50ZXJydXB0LA0KPiBlbmFibGluZyBleHBvc2luZyBh
IFZHQSByZWdpb24sIHN1cHBvcnRpbmcgYSBkaXNwbGF5LCBiZSB1bmlxdWUgdG8gdGhlDQo+IGtl
cm5lbCBpbnRlcmZhY2U/ICBUaGFua3MsDQo+IA0KDQoNCglJIHRob3VnaHQgdGhlIG92ZXJyaWRl
cyB3ZXJlIHdvcmthcm91bmRzIGZvciBicm9rZW4gSFcuICBJIGRvbuKAmXQNCnNlZSBhIHByb2Js
ZW0gd2l0aCBzdXBwb3J0aW5nIHRoZW07IGl0IGp1c3Qgc2VlbWVkIHVubmVjZXNzYXJ5IGV4dHJh
IGNvZGUuDQoNCglUaGUgVkdBIHByb3BlcnRpZXMgYXJlIGludGVudGlvbmFsbHkgZGVsZXRlZCwg
YXMgd2UgZG8gbm90IHN1cHBvcnQNCmdyYXBoaWNzIGNvbnNvbGUgZGlzcGxheXMuICBUaGF0IGNv
dWxkIGJlIGFkZGVkIGFzIGFuIGxhdGVyIFJGRSBpZiB0aGVyZSBpcw0KaW50ZXJlc3QgaW4gbGli
dmZpby11c2VyIGJhc2VkIGdyYXBoaWNzIGRldmljZSBlbXVsYXRpb24uDQoNCgkJCQkJCQkJSkoN
Cg0K

