Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA803479378
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 19:02:11 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myHYS-0006qu-MH
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 13:02:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1myHWV-0005YL-7D
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 13:00:03 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1myHWO-0004U9-U1
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 13:00:02 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHGY5xl011724; 
 Fri, 17 Dec 2021 17:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aPtRCDJxc7nMbLOAJbITajgnabNGdOwmiWAWx6K8SXA=;
 b=06Sq6VlUr8Ni/xLpB+wC5dWRUFwlDBum0iUZ0i8HKeCeh/M42nL7bdVcevUBjhQwGlQN
 /N3YkCpx0IY8CBiXWXQjxqKnxp3sYTmNnaiIEUKOoIC1ps56cFMQnD7OKjTkmHAijy7G
 v/OSHsQTfGpsrHhG1evT+uzYetdYytkpneKsSfpFEciUrlZRGaePAQeF8WxyLcVB3KYR
 qj7CjRrXePpOkJiVgIoxFonV0sWgObt2rSyGt6+8Vf2sxX4COw3GGfrTbPM1ydgo25DG
 ZVsYMbXWW8Tlb9LsCdzjgUzRRlnRlBOkwAfqrHq1j59DCxZYp6mDt+pns1aYVIClkTOE iA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykm5ehae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 17:59:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BHHv2dw150859;
 Fri, 17 Dec 2021 17:59:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 3cvh4435hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 17:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Csje0zT4SqJLnEPQwJ8ZjTalfaL6tjvYfa+LBaZN8wQhQyk2Sie+53Me7kQEHMmzHPQw7qg9pqooosJv8cqAiyH9jzuTD7lvwIdJhzEvMwyJKI7d4y/p6pPyd9o5L32Lh5ffqbCnL47MCTiLBh6z3u4eBv9LJ8V8PR1sYRH0ueOSye0hTVLH4n2+s0eFzFpHH2GWJp0uq7fNQnp3WOAuKOXkfvOyUu6/zdfyqv0oyarKvZ7u5NdXsLFxjOGQfEP8AFT4sBmd0isHQ139qUHMZzd1PCBVP1D/45fJwl6qR/JQ03+CNJtISqG/nkFyaPlgXBK/UXUO0z0aKL1SZfQBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPtRCDJxc7nMbLOAJbITajgnabNGdOwmiWAWx6K8SXA=;
 b=EH3KQ6nZvTnd+UbqTk82ui1NWSEp6DSoc8JpdBDHThkst4QrH30nYf6j50h6KURNtY7nLsox8+IIr0ks0HTxvEov4iSBLsSBVEm1GX/67SiScv8s3HppSx52lLdl+ztPPZlauuAK+KLpNhWRoqjMQ2xrl2tuMQ2Xq+TKb/97vD3bnbWKkU7ltXogN1p9mXRlTm3ZY2PBvILWJfKHMSgILIdMJ8UKrbXNH5kbKOzLiFwytJXMXBrocZgVvZgbsiGA5dlqJEJc6ogbOkjwq7h6xxU/ER9SOo+sMVJj5d0oUH1qdNQReljQm2kfiDlyu90Eaur0h6rNBJr7n78XwBO0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPtRCDJxc7nMbLOAJbITajgnabNGdOwmiWAWx6K8SXA=;
 b=vAEIETRRbk/h4p9dohW1MvqjNbjDb/vbllu/jS21k2TPYJVsa0xOapQZZ80TOnc/34s3YUONu6aCaxX8CE8CytikKapRk0987x+efAouSA8DBYzAFVpJEtHU9LLE81XQztoSv1awY1IwfpM0rcE+Wy9v0KSbq2P+IWy253Ya3gk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 17:59:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 17:59:48 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Topic: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Index: AQHX8YApP455uSlkD0+QKeZz8trhfaw0+iYAgAICnAA=
Date: Fri, 17 Dec 2021 17:59:48 +0000
Message-ID: <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
In-Reply-To: <YbsgZDU06gcanadE@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d4f83bd-9c4c-4025-3b0a-08d9c187046c
x-ms-traffictypediagnostic: BLAPR10MB5124:EE_
x-microsoft-antispam-prvs: <BLAPR10MB5124461D8E7A0AA3832EADB890789@BLAPR10MB5124.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SY0s3YoXlOlxop7TUSfgFavXEhnuUPICKCAxzXa3pYEzm5zfZ5CYUq2jMEAfxYp+WwlPw/Z35P6efdG4WWT340lhkuMId3mZLKCjzk7jn4JrBcYehpPLDQdO2XM36FbeLmwRKHczzCT+NGhEXMuWOo1JmHMOytabqUfwglohCX98ljNHTgn2tlMu3KtlRfn3w8YKOoKMMHuycY1dRCk/2ZzsM5qCt8OhELQoDKLclj0g4l38fY87RqWWd3nVt5oFFlokmjqhs/a7VT7c75zqq9smH4+FqhVrB5iOnLcrvQ0uKd/jeg7ij5OrSwux4ImAN9U1TsOe3NKqudY12skOb5OdMALem8JIB4RU9SZ+3UDUYilX0jh+f299KlcET7AdY/t1T91QoxH+zgiXvO+7u5X//LoH8PZm8UW5Z24zKkpVuYLoy9w0iYGhLWNtV8EEdFgXdKs2QBDqVqKNkLXn/u7Maauf3y+O69XUOPCdF3Nj2jPva/H/A8Rme+w2IxcBmMD0At7YeQjF57shCb7N13bbvNYvZ9lM4BRgEuSB9lr/ezrlOQ5tkMOtmmf8Nj2emHVJQxku2XRzVXX9dnu+c87Mj9B+IstBy6aA6c6Q0cy7sSPT9rx9wq9OO8jwoZzvWN/0tn6pM3M30Y5UWei470rcoBoQdV6rmKebxdKCBKnmXZUEQZXiiFxx9m4Nh10XKRtHxmPa9FWcgzI9FPnRPiHeBsPwDOwls3r8aDrs2vonrO4N9qbvYNiH1cDFll5U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(6486002)(36756003)(6512007)(2616005)(33656002)(508600001)(316002)(86362001)(8936002)(38100700002)(122000001)(54906003)(4326008)(38070700005)(53546011)(6506007)(8676002)(44832011)(71200400001)(83380400001)(91956017)(76116006)(66556008)(5660300002)(2906002)(66946007)(64756008)(66476007)(110136005)(66446008)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3ZzNjc0QWVqcml5dDBnRnBPbWhVVDZQM04wdVZKb3Y2TVB4Wlg2TDZMTjZM?=
 =?utf-8?B?Zzlqc2ZmOTVyVXlKNzBpRXJXazlMRTE0a3Y5WWdGOCs2Vm5NbklkRUdoUkF4?=
 =?utf-8?B?VzhlcC9Gd3diWXJSenkraDZLM01FY1gyaVpwRGN0RnRDdmw5aXM5S3FIQm9n?=
 =?utf-8?B?a1E0UEhrZCtVbU1qcmVJRUZBUm4xWjNkQXpaNTlSM29leHdmUjZhNHBsWEpE?=
 =?utf-8?B?eGRlUGtkckRXQ1VpMU01ejFGRnJmK0FUeEtZZkRNcG8rMysyeUZtc1NiRERB?=
 =?utf-8?B?OEhtc0lBa3VIa1FRbkM2RS90TU5uWmNzbmRzb1RlSThSMVAxdVMyekNscHVZ?=
 =?utf-8?B?M2x3czlZa2lIMlp4aGhXZEk3a3BuNVVPZlVWNkhmZ0xlNlBQRU5rbkkyTko1?=
 =?utf-8?B?clBlVk9zdm5HVi9scEZiRjQ4MkNpVGxoVXFjWFE3NWpPaTRBekFHMURVRit6?=
 =?utf-8?B?cDVrbWFPRTlidXlWYlhwemxlQzhuKzBpMWxXWXhmS1o3aElML0NGeGk4bVZy?=
 =?utf-8?B?VnY3VjJESWJrZk82b0QxMFI4TWVQb2pQZlJKRGpGdzZXcEtzVlJHM0Q3SVlR?=
 =?utf-8?B?RVk4bi94UEJoK2VsaENxYjhDWndhRERGYmtYUThaanNDZ2p5RU90Zzd3QmZm?=
 =?utf-8?B?OXEvNGtYM2c5TWZTL25jT3B5OU85UUgyWDB0cWRodVVjUzlTaUtuRjRIdHVN?=
 =?utf-8?B?RFVlL3lHMGhyM3QwNGlWZU9meW9LV2kwTzlnQ1Zac2FydWM3Y3hOMUFpZHF1?=
 =?utf-8?B?dXUrMTkybzhpakN6TklJeXF4NS81R3puWVlaUy9rS0ZTTkpBdFp1TUg3WjRN?=
 =?utf-8?B?aktvQjFEaERDZnY0Um56L1VsT3RnRndGeUFNZkpMN0UrWDBSa3FqYTV5YmY0?=
 =?utf-8?B?Rk5pVHN1cEJHaHR1WGJpZTkzem9XWkhnN0loZGlPZzN1OEdPbEszZnRqRG9F?=
 =?utf-8?B?OHZKOVptNlJMQ0lDMHQvNmI3SHVJMjZFNDhFa3ZlNW1uZDNneUx0SnJLREdt?=
 =?utf-8?B?M1RYajFuNm9sZml2MnBSL0o1WEJIbjlrTEwyanBseUo0VFlnZVpNMit0TEZM?=
 =?utf-8?B?NHJRUTVNa2V1clV4TU1jUHNKRlg4MWNpOCtKbjRmMHhOMEd2NDhTWVFZaVVN?=
 =?utf-8?B?NnFpdzEzMVluelFDSGpXT3dLSkE2eUhoekNiMlM1RTQzSk9tUWFzUTg4L2lC?=
 =?utf-8?B?bXVZNDR2KzBDbDd6ekJ5Vi9nL1BKdTdsMGo0MVFnMVl3a3J2SFB6OEdNeG00?=
 =?utf-8?B?NGdRbG1nSG1kYXcwb3JZM0VjRnh1bnhXaVNoUG9OaitxUUZWeXJCQ2hicnZQ?=
 =?utf-8?B?RFN2a0IvZTdPQ1J6NVd3SE9NRUh0czNIeWNSRW1OWmNUWkFSTHdRNDFFNC9B?=
 =?utf-8?B?QnJJZ3ZHeEhUV3RDdStOWE04YlEzSDN1WFVsVTVJNXpDSm1iWnp3ZU9QQlFX?=
 =?utf-8?B?bW40d2tISDdHeTdONFc5WDFWTDBOM1JUa1VFZGJDYk1TTERueFJSZjFlelNG?=
 =?utf-8?B?K0RuU3RMRkJrM1o5cEhHdzFBVUN5SDlyZVY3K2xVeEtrUjgyazRvbnJoejY4?=
 =?utf-8?B?Q0hzNUN4RUUrVHB2WW9kOVlMM1pCTlZYS25ZanhIVkliVlRmWGFQY3RYNUFS?=
 =?utf-8?B?K3dzaFBxYjA4THZSWm02UlN2Y1ltQVNDY05kK2pWOXpiVmlmTnA0bXlpbGRY?=
 =?utf-8?B?MzkzQnFiSEdwZEQ4SDRrYVNmWldqc09ncXluMGtTeTY2L1hpZzNMZWFSV25t?=
 =?utf-8?B?V080Z0tOQlQ3R0c2QVA5akc5aW01aUNXWHdsa0pyOEoxRndka09ETU5vSjNv?=
 =?utf-8?B?UnhFcEMxc2JhaHAwYWxhN09WbHQ2eng5Zk9zOW9DRjFrZWRVOEJnNDhZNzR6?=
 =?utf-8?B?aDVoVmlTRm9KRFpJd3pFQ0VQWVFyWG90TERHbnpxOHZnZDR5YzRWdU5tam8z?=
 =?utf-8?B?KzZ5QWZtNUhhVDFPMEcxOHpqdGlpQzhBTm9kVHRoSVNiRGRFM0FIT1habElx?=
 =?utf-8?B?SVY1YVR0RTlMSzhKWU43MzBtWEw2a0U3MGkwMzF3ZHY2WkYweVdodlRoaWI4?=
 =?utf-8?B?VFZOdVorNkhTbERDeUhEUVN1aFMrU3Z1V3NMNHNjTExSOVhKQ2xqZGxrQll6?=
 =?utf-8?B?RDB2U2lodUwvQUdsUEV6YnNOcjMyeDhib21keDI3dXQ4VCtyQXhLM3V2c1Zj?=
 =?utf-8?B?SkoramR4ZXdvc1JUUXVvYllwRVk1aXRXVDg5NzVabUcydHFqWkxZMDdST1RR?=
 =?utf-8?B?MWhCRStCM00yaTFZQmNIMVV2NllRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <802477844E90E9408827B31DB20FC03F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4f83bd-9c4c-4025-3b0a-08d9c187046c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 17:59:48.7958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hoZDBZ/jXQzFTImfetWpelwg+mxniFOAIMuncN/ot19wNLdCaeNWJKKgxOlbaJQeBb0RqnCSMpSMNOlbwoFJYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5124
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10201
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112170101
X-Proofpoint-GUID: BMGpkFcTo9NIruaWH-AtoCSikrPSaedW
X-Proofpoint-ORIG-GUID: BMGpkFcTo9NIruaWH-AtoCSikrPSaedW
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRGVjIDE2LCAyMDIxLCBhdCA2OjE3IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTA6
MzU6MzFBTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBAQCAtMTE0LDYgKzEx
OCw2MiBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpY2UoT2JqZWN0ICpvYmosIGNv
bnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4gICAgIHZmdV9vYmplY3RfaW5pdF9jdHgo
bywgZXJycCk7DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2N0eF9ydW4o
dm9pZCAqb3BhcXVlKQ0KPj4gK3sNCj4+ICsgICAgVmZ1T2JqZWN0ICpvID0gb3BhcXVlOw0KPj4g
KyAgICBpbnQgcmV0ID0gLTE7DQo+PiArDQo+PiArICAgIHdoaWxlIChyZXQgIT0gMCkgew0KPj4g
KyAgICAgICAgcmV0ID0gdmZ1X3J1bl9jdHgoby0+dmZ1X2N0eCk7DQo+PiArICAgICAgICBpZiAo
cmV0IDwgMCkgew0KPj4gKyAgICAgICAgICAgIGlmIChlcnJubyA9PSBFSU5UUikgew0KPj4gKyAg
ICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgICAgICB9IGVsc2UgaWYgKGVycm5v
ID09IEVOT1RDT05OKSB7DQo+PiArICAgICAgICAgICAgICAgIHFlbXVfc2V0X2ZkX2hhbmRsZXIo
by0+dmZ1X3BvbGxfZmQsIE5VTEwsIE5VTEwsIE5VTEwpOw0KPj4gKyAgICAgICAgICAgICAgICBv
LT52ZnVfcG9sbF9mZCA9IC0xOw0KPj4gKyAgICAgICAgICAgICAgICBvYmplY3RfdW5wYXJlbnQo
T0JKRUNUKG8pKTsNCj4+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+IA0KPiBJZiBub3RoaW5n
IGVsc2UgbG9ncyBhIG1lc3NhZ2UgdGhlbiBJIHRoaW5rIHRoYXQgc2hvdWxkIGJlIGRvbmUgaGVy
ZSBzbw0KPiB1c2VycyBrbm93IHdoeSB0aGVpciB2ZmlvLXVzZXIgc2VydmVyIG9iamVjdCBkaXNh
cHBlYXJlZC4NCg0KU3VyZSB3aWxsIGRvLg0KDQpEbyB5b3UgcHJlZmVyIGEgdHJhY2UsIG9yIGEg
bWVzc2FnZSB0byB0aGUgY29uc29sZT8gVHJhY2UgbWFrZXMgc2Vuc2UgdG8gbWUuDQpQcmVzZW50
bHksIHRoZSBjbGllbnQgY291bGQgdW5wbHVnIHRoZSB2ZmlvLXVzZXIgZGV2aWNlIHdoaWNoIHdv
dWxkIHRyaWdnZXIgdGhlDQpkZWxldGlvbiBvZiB0aGlzIG9iamVjdC4gVGhpcyBwcm9jZXNzIGNv
dWxkIGhhcHBlbiBxdWlldGx5Lg0KDQo+IA0KPj4gKyAgICAgICAgICAgIH0gZWxzZSB7DQo+PiAr
ICAgICAgICAgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1OiBGYWlsZWQgdG8g
cnVuIGRldmljZSAlcyAtICVzIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBvLT5k
ZXZpY2UsIHN0cmVycm9yKGVycm5vKSk7DQo+IA0KPiBlcnJvcl9hYm9ydCBpcyBlcXVpdmFsZW50
IHRvIGFzc3VtaW5nICFvLT5kYWVtb24uIEluIHRoZSBjYXNlIHdoZXJlIHRoZQ0KPiB1c2VyIGRv
ZXNuJ3Qgd2FudCB0byBhdXRvbWF0aWNhbGx5IHNodXQgZG93biB0aGUgcHJvY2VzcyB3ZSBuZWVk
IHRvIGxvZw0KPiBhIG1lc3NhZ2Ugd2l0aG91dCBhYm9ydGluZy4NCg0KT0ssIG1ha2VzIHNlbnNl
Lg0KDQo+IA0KPj4gKyAgICAgICAgICAgICAgICAgYnJlYWs7DQo+IA0KPiBJbmRlbnRhdGlvbiBp
cyBvZmYuDQo+IA0KPj4gKyAgICAgICAgICAgIH0NCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2F0dGFjaF9jdHgodm9pZCAq
b3BhcXVlKQ0KPj4gK3sNCj4+ICsgICAgVmZ1T2JqZWN0ICpvID0gb3BhcXVlOw0KPj4gKyAgICBH
UG9sbEZEIHBmZHNbMV07DQo+PiArICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgIHFlbXVfc2V0
X2ZkX2hhbmRsZXIoby0+dmZ1X3BvbGxfZmQsIE5VTEwsIE5VTEwsIE5VTEwpOw0KPj4gKw0KPj4g
KyAgICBwZmRzWzBdLmZkID0gby0+dmZ1X3BvbGxfZmQ7DQo+PiArICAgIHBmZHNbMF0uZXZlbnRz
ID0gR19JT19JTiB8IEdfSU9fSFVQIHwgR19JT19FUlI7DQo+PiArDQo+PiArcmV0cnlfYXR0YWNo
Og0KPj4gKyAgICByZXQgPSB2ZnVfYXR0YWNoX2N0eChvLT52ZnVfY3R4KTsNCj4+ICsgICAgaWYg
KHJldCA8IDAgJiYgKGVycm5vID09IEVBR0FJTiB8fCBlcnJubyA9PSBFV09VTERCTE9DSykpIHsN
Cj4+ICsgICAgICAgIHFlbXVfcG9sbF9ucyhwZmRzLCAxLCA1MDAgKiAoaW50NjRfdClTQ0FMRV9N
Uyk7DQo+PiArICAgICAgICBnb3RvIHJldHJ5X2F0dGFjaDsNCj4gDQo+IFRoaXMgY2FuIGJsb2Nr
IHRoZSB0aHJlYWQgaW5kZWZpbml0ZWx5LiBPdGhlciBldmVudHMgbGlrZSBtb25pdG9yDQo+IGNv
bW1hbmRzIGFyZSBub3QgaGFuZGxlZCBpbiB0aGlzIGxvb3AuIFBsZWFzZSBtYWtlIHRoaXMgYXN5
bmNocm9ub3VzDQo+IChzZXQgYW4gZmQgaGFuZGxlciBhbmQgcmV0dXJuIGZyb20gdGhpcyBmdW5j
dGlvbiBzbyB3ZSBjYW4gdHJ5IGFnYWluDQo+IGxhdGVyKS4NCj4gDQo+IFRoZSB2ZnVfYXR0YWNo
X2N0eCgpIGltcGxlbWVudGF0aW9uIHN5bmNocm9ub3VzbHkgbmVnb3RpYXRlcyB0aGUNCj4gdmZp
by11c2VyIGNvbm5lY3Rpb24gOiguIFRoYXQncyBhIHNoYW1lIGJlY2F1c2UgZXZlbiBpZiBhY2Nl
cHQoMikgaXMNCj4gaGFuZGxlZCBhc3luY2hyb25vdXNseSwgdGhlIG5lZ290aWF0aW9uIGNhbiBz
dGlsbCBibG9jay4gSXQgd291bGQgYmUNCj4gY2xlYW5lc3QgdG8gaGF2ZSBhIGZ1bGx5IGFzeW5j
IGxpYnZmaW8tdXNlcidzIHZmdV9hdHRhY2hfY3R4KCkgQVBJIHRvDQo+IGF2b2lkIGJsb2NraW5n
LiBJcyB0aGF0IHBvc3NpYmxlPw0KDQpUaGFub3MgLyBKb2huLA0KDQogICAgQW55IHRob3VnaHRz
IG9uIHRoaXM/DQoNCj4gDQo+IElmIGxpYnZmaW8tdXNlciBjYW4ndCBtYWtlIHZmdV9hdHRhY2hf
Y3R4KCkgZnVsbHkgYXN5bmMgdGhlbiBpdCBtYXkgYmUNCj4gcG9zc2libGUgdG8gc3Bhd24gYSB0
aHJlYWQganVzdCBmb3IgdGhlIGJsb2NraW5nIHZmdV9hdHRhY2hfY3R4KCkgY2FsbA0KPiBhbmQg
cmVwb3J0IHRoZSByZXN1bHQgYmFjayB0byB0aGUgZXZlbnQgbG9vcCAoZS5nLiB1c2luZyBFdmVu
dE5vdGlmaWVyKS4NCj4gVGhhdCBhZGRzIGEgYnVuY2ggb2YgY29kZSB0byB3b3JrIGFyb3VuZCBh
IGJsb2NraW5nIEFQSSB0aG91Z2gsIHNvIEkNCj4gZ3Vlc3Mgd2UgY2FuIGxlYXZlIHRoZSBibG9j
a2luZyBwYXJ0IGlmIG5lY2Vzc2FyeS4NCj4gDQo+IEF0IHRoZSB2ZXJ5IG1pbmltdW0sIHBsZWFz
ZSBtYWtlIEVBR0FJTi9FV09VTERCTE9DSyBhc3luYyBhcyBtZW50aW9uZWQNCj4gYWJvdmUgYW5k
IGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB0aGUgc2l0dWF0aW9uIHdpdGggdGhlDQo+IHBhcnRp
YWxseS1hc3luYyB2ZnVfYXR0YWNoX2N0eCgpIEFQSSBzbyBpdCdzIGNsZWFyIHRoYXQgdGhpcyBj
YW4gYmxvY2sNCj4gKHRoYXQgd2F5IGl0J3MgY2xlYXIgdGhhdCB5b3UncmUgYXdhcmUgb2YgdGhl
IGlzc3VlIGFuZCB0aGlzIGlzbid0IGJ5DQo+IGFjY2lkZW50KS4NCg0KU3VyZSwgd2UgY291bGQg
bWFrZSB0aGUgYXR0YWNoIGFzeW5jIGF0IFFFTVUgZGVwZW5kaW5nIG9uIGhvdyB0aGUNCmxpYnJh
cnkgcHJlZmVycyB0byBkbyB0aGlzLg0KDQo+IA0KPj4gKyAgICB9IGVsc2UgaWYgKHJldCA8IDAp
IHsNCj4+ICsgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAidmZ1OiBGYWlsZWQgdG8gYXR0YWNoIGRldmljZSAlcyB0byBjb250ZXh0IC0gJXMi
LA0KPj4gKyAgICAgICAgICAgICAgICAgICBvLT5kZXZpY2UsIHN0cmVycm9yKGVycm5vKSk7DQo+
IA0KPiBlcnJvcl9hYm9ydCBhc3N1bWVzICFvLT5kYWVtb24uIFBsZWFzZSBoYW5kbGUgdGhlIG8t
PmRhZW1vbiA9PSB0cnVlDQo+IGNhc2UgYnkgbG9nZ2luZyBhbiBlcnJvciB3aXRob3V0IGFib3J0
aW5nLg0KPiANCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBv
LT52ZnVfcG9sbF9mZCA9IHZmdV9nZXRfcG9sbF9mZChvLT52ZnVfY3R4KTsNCj4+ICsgICAgaWYg
KG8tPnZmdV9wb2xsX2ZkIDwgMCkgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0ZygmZXJyb3JfYWJv
cnQsICJ2ZnU6IEZhaWxlZCB0byBnZXQgcG9sbCBmZCAlcyIsIG8tPmRldmljZSk7DQo+IA0KPiBT
YW1lIGhlcmUuDQo+IA0KPj4gQEAgLTIwOCw2ICsyODQsOCBAQCBzdGF0aWMgdm9pZCB2ZnVfb2Jq
ZWN0X2luaXQoT2JqZWN0ICpvYmopDQo+PiAgICAgICAgICAgICAgICAgICAgVFlQRV9WRlVfT0JK
RUNULCBUWVBFX1JFTU9URV9NQUNISU5FKTsNCj4+ICAgICAgICAgcmV0dXJuOw0KPj4gICAgIH0N
Cj4+ICsNCj4+ICsgICAgby0+dmZ1X3BvbGxfZmQgPSAtMTsNCj4+IH0NCj4gDQo+IFRoaXMgbXVz
dCBjYWxsIHFlbXVfc2V0X2ZkX2hhbmRsZXIoby0+dmZ1X3BvbGxfZmQsIE5VTEwsIE5VTEwsIE5V
TEwpDQo+IHdoZW4gby0+dmZ1X3BvbGxfZmQgIT0gLTEgdG8gYXZvaWQgbGVhdmluZyBhIGRhbmds
aW5nIGZkIGhhbmRsZXINCj4gY2FsbGJhY2sgcmVnaXN0ZXJlZC4NCg0KVGhpcyBpcyBkdXJpbmcg
dGhlIGluaXQgcGhhc2UsIGFuZCB0aGUgRkQgaGFuZGxlcnMgYXJlIG5vdCBzZXQuIERvIHlvdSBt
ZWFuDQp0byBhZGQgdGhpcyBhdCBmaW5hbGl6ZT8NCg0KSSBhZ3JlZSBpdOKAmXMgZ29vZCB0byBl
eHBsaWNpdGx5IGFkZCB0aGlzIGF0IGZpbmFsaXplLiBCdXQgdmZ1X2Rlc3Ryb3lfY3R4KCkgc2hv
dWxkDQp0cmlnZ2VyIGEgRU5PVENPTk4sIHdoaWNoIHdvdWxkIGRvIGl0IGFueXdheS4NCg0KVGhh
bmsgeW91IQ0KLS0NCkphZw0KDQo=

