Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29524EAF1B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:14:32 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCcB-0004qp-L0
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZCag-00042F-Hh
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:12:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZCab-0003NX-2F
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:12:56 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TCkmBS012700; 
 Tue, 29 Mar 2022 14:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kkJ5MrRvToQtyakxPJelJiu/zWnXorJM7/eMaRXynjQ=;
 b=SzCYwbsdcdmCUzH2kHcrDuZUlY0FkAMAU+0+Z8jvbLGyLhS29tisPkwYJU46WQ32Pe9g
 ygtvNlfTUtCSEy5mfXmSyWVjwwpr2QRYKOozkj/zOUsjbLn6F6Rg3HqxlJlVJ2Iqo4YT
 MIHuIuV/JYYTPrsX3JNaYi55RCPf+/paG+MUsKs3jfrXFKFMNKK6lzsQnGLaMykD+dkw
 CHJUDisRSOKaC92d6QKicONIVSwd+EIZRFoFzap2uGYlGtqfnWC+BhPhGQQOzuyRGF6V
 U+TojzV2e22di+a7jzglzqlLhaoLIh9nlOk2NTwiaF8jxdHbDMDRjy+cdMdabh7anqVk cA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3f1se0erd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 14:12:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TEBX0m149150;
 Tue, 29 Mar 2022 14:12:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by userp3030.oracle.com with ESMTP id 3f1qxqenn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 14:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj4fIC1aGsiavMgu4LZzHKy8N9EcfHCDYyTLWyeRvWvFQbTP5NDWEGrs3YOhAwbfHVVNm+PPMDuR9JD9Z18nUPLPQFvbSqVvnia5eKTgDtWeiva1jvFS8lUIsE38cSCyfpAE3a/54Ak51cixgXeLoiccwnTI3eQZZ0tBMolBbCpt58Cf1HhVve3lnOdLGu/VHjmaSaZl7rfPIkT/IzZV+Bab4QjtdoD786aDvIHuh1uS5v7RVwhEQ1AoTXJhpwaotoixuNEaR6vBGtSMFBjNQPTH99LKegUn5MpkX4kO/2UFuIgzFa5u9WXYKm2YDME8BT/FfsyuqRcHkaXmQuUAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkJ5MrRvToQtyakxPJelJiu/zWnXorJM7/eMaRXynjQ=;
 b=GbkrmjaEiu2EDrXv5FRU6OmdpXkej1gs+lXlL/Dm6tFgco2G7ILQ8+D+i7LVHceahcZN8+EarFzYnCW83VjXGq3yk7ribw1oTswv2utFeByIDgYfjxFvsQwgKfEi1zXgP+YQSM1Q9gKr5p70f8p+IDIthnYlsDX0HpTAcgD+LRquUufGZP5OSrrYTmbzm6OtY2VwmDIYaBObwxc1+/gTyqm+wZUwg7v/tI5eJTHneqU5BMxEgne2L04wlRXQVPZSVEY8ZUWlW8WcI+OeEcK6XX5dj3XjN6y4utEBpIZGhAlBhIg50hPUzRkqHn/WV6Cyq67Fb3lF+jCPEbreFTT0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkJ5MrRvToQtyakxPJelJiu/zWnXorJM7/eMaRXynjQ=;
 b=ydh8M3q9HoDhYqWSsqDuvIlMIfGibi1e+K3SF79pJ9ZIe8gj2ACE7T/3qUPPgsF/zwgr7Drea24o8c7Hl9jM0f5LxF3L3lUxKgcHqqRPtLKAb2jdg1qKiYEzAGFex+QwnDJ+Hu9NT11Iyf5OXEark8ikU5ImTzeBAxmprMK7z5Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR1001MB2138.namprd10.prod.outlook.com (2603:10b6:4:36::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 14:12:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5123.016; Tue, 29 Mar 2022
 14:12:41 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYQH1dtH36jxsvk0ChB2A9jkjfZazWUfCAgAAbLgA=
Date: Tue, 29 Mar 2022 14:12:40 +0000
Message-ID: <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
In-Reply-To: <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e4e28ca-9a24-4a91-9ed9-08da118e2fbd
x-ms-traffictypediagnostic: DM5PR1001MB2138:EE_
x-microsoft-antispam-prvs: <DM5PR1001MB2138C894398ED5006AF1A054901E9@DM5PR1001MB2138.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sfUtEKfiyvzDdJbMoIOfIgHDFYA/ZjcDtfzB1Lygb/2jfIXuXHXPZ57kKJLDcCl0nz8mgSyEBOa6yZQgk8rmuHSmc4sbDZShjH9xxG+TtzZg3GS45T98ThGJvlBBGxVhp5ofKoCRAHU7tE2fUcTKiclE8zGBVirgwvrPNigYOrSv1JDLrOx0MdWyQwCc9Tj8ksgx+aEngxSLvwY9sh55RDfd2XBkAyTO9N7ETHHLMMZIfV55JbuvIl8ZINJ9buf7nEQVyVLMGdGHI9+g50nNJVIsMdmV8zViD3Rqv9+8TnbvmqELiOuv6dVdSTUKQvacFuYBJBw0JmSLiZwfzAOwbvriKQ/STyPhqvXgRzH7UZlZoPb/da7Ew3GOBAWn66qVCAeDpYeAOhIyXQCDbMFPcL8ikTlBIlcGwTZ+e7qWHFP1IuGPr5ZfbGNYj2URTeBBHWmIbgqWtC3nKXJ7lkHqI6+2CVXhNMMBc/yxbWr5p96qfev66u5iIg9/Ux196w/IGOz0Ks4QceRhxzJrGBSJZARO/mzxaPEbzFgtM0+eYY6luFtNKaiPLtIbtvrZ3fTV0QfDyIUwS5XNko2qnuLufvdKahxPwhzgV84TiANYgYSkbQJvES7355IXSUoNn7V3XyIRjVdGvu4QTBwdF/FoSBayH90NKFWm34XMRFo1Ko2veTyZZp+3E1YISq4buHI67oHdGgzs09x3S2NgNb4RKqXUQ5WC9zsZ6/NUAe/Fs84meXvvjMClh4eojsW8EAEC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(186003)(6512007)(122000001)(107886003)(2616005)(91956017)(86362001)(71200400001)(508600001)(6506007)(38070700005)(53546011)(83380400001)(6486002)(54906003)(36756003)(4326008)(66446008)(8676002)(7416002)(2906002)(33656002)(8936002)(66556008)(66476007)(66946007)(64756008)(6916009)(44832011)(5660300002)(316002)(76116006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk5QcEMrTUtRZTZEcFZUWk5nNEEzbXpLZERsMHFCVmJrL2ptaldnbms1eDRF?=
 =?utf-8?B?STZpcWdDcEo2M3pYT05zSWIwTFI0T2JjL2pxZjNlbjRmWUVZMDNGRUM1Y3dz?=
 =?utf-8?B?TElVMm9HWlU4cS8yNzlhVEZPU3NkbElTNHFtZk1QWjJnUVlYUEJ1ZjRqeDF2?=
 =?utf-8?B?VTV6cEFGYWJwZ3NsMFord3Nhd0ZCd2preHhSQWxnaWdrV1VZU2NZazFJUFdt?=
 =?utf-8?B?RlFab0RIaXpHNGNmYU8yVG1Ma0ZPaUFZZDVPVnl0dG9Zb0dMZlJRVzhoRzV2?=
 =?utf-8?B?Nk1VMmw0K0N0Wk5CTnJDa1lMcWx4eXZBbXpOWVdEMVI5S2lmNTBicmx1Q1Vv?=
 =?utf-8?B?cDNHYzRLZE82aTZrSm1uZFc1Ynd2RXNpNGlNeXVLdFh3Ukw4d0FKT0gwVkYx?=
 =?utf-8?B?bmRhL3lVOW1rWUxZWGJ2KzQyMTA5Wk1mT2E5WmV1K203Tm05bm9hdllmRlcw?=
 =?utf-8?B?cDUzQVBHTFpDZVY0d0o4NFdaSU1GNFNmbzBIWHBEZkFiVEdaWGZXb0kxT0tx?=
 =?utf-8?B?emhWczl2YXV0VGlweGxZMThUL0ZpRmlMMC9zUlVvSm9seFVCU2pIUitpZ09K?=
 =?utf-8?B?QVFqQjdrMWMzYmw1Y016ck9Xczh1MHJKdC9lSUJrRjdqdUtxczVuME4zZXNr?=
 =?utf-8?B?TysxaUhyYks0Z05qbjB6bVFXL1NYeVNha1VxN2xTZUxLWkRNNE1Da0JZaFJG?=
 =?utf-8?B?aDFuV2tEZ25KQXhYaDNXS2YxUUE1R0QzL2JkVGpZS1d3UGIxbzEwbitEWCtC?=
 =?utf-8?B?bHRxamcycllmdFBlQjFoUk5CYlRYREpmLzh0aHo2T2lzL2YxRHB0T2pnV1Va?=
 =?utf-8?B?QWpGcFNEOUFIWk1IZ1VEVlI5cW5BNVNNclN6WDgxNDFPd2pTNzUvNGtteTdl?=
 =?utf-8?B?eUdNbUpIeEs3Vm5RZy9sVDd6cFI3bEFVai9jRHVLTkpJSkVXZ003dWc2RklE?=
 =?utf-8?B?eUhxN0cvdlNJcDNxU09rS0hVbi9tV0xWT2FjSWpVdmxrakhsdlg5UVFwblA4?=
 =?utf-8?B?K1NDczRZN1pYdFRGY2d0M3A2NTZYd2oxRFVaVTB1bDNybEtOZlNNZlAwUS91?=
 =?utf-8?B?akJWK285TEFMbWpYd3o3NWIyNUlIU09ENW9jYWtmb0NBVmhqZ1Nyd3FGUCtZ?=
 =?utf-8?B?VStla21iQTd3NXBtekt3TjZaaDRCcUIxdGJJb2p2dnJISGxrSFZCY1cvb3Vn?=
 =?utf-8?B?RVV6d04zc2hkTm4rdFBUMzhPejZiOHlWK0RaaVprKzJXb1pnWXVlZFRzWkxS?=
 =?utf-8?B?QWxBZUlVTzJ2L3JiVWpQTmJraXZNSXVtdk4raG5BWjk2V0pHMDZVR0xJdUZF?=
 =?utf-8?B?ZnhnYzd2Y3dEK3hUQzNVaGxrdk4xQVByQ0V3TVNZc2NSTFB1NXppdDhrS2cr?=
 =?utf-8?B?RHJWWnF0ZEYzcTFEdUNtQ0FBV3k3cHdQc3J6SjJVZEY1ODFsdHJ5a1VtV25U?=
 =?utf-8?B?ekJHaGNLc3pYZXlKQlM5WDQxUklFVG5VQWFXOTk1WWdpa21KR3pvWHkxcnZr?=
 =?utf-8?B?UHd6QUN5Z3FzOE00Rkt3Y2xaQnRQaE5hbXZ5QkpvQTh6UHFsZFRaUFVoVkxv?=
 =?utf-8?B?dksvZlJzeXNWSlNQSGNhd0lqVVZ6RVVBUFpMNHk3UmJmTFVlRG5idGl0d2ZW?=
 =?utf-8?B?N20vOXBERklrcFg2b1FVZXQxUmNNcXI1Nnc4dmtnUVVtNXZ6VXozbjM0UFgv?=
 =?utf-8?B?bEdqYXphYUZkRWMvMm5FaFBmQTk2RCs5SGorVGwzR1gyb1lvOGI1U2dFcklp?=
 =?utf-8?B?NnlVRTdqa3VnTzE5ZDFFelpSNFpHUWJzTFZiNHlienJqeFMwY01jd1dkSEx3?=
 =?utf-8?B?bTZiOWpvT0VMMzdQbjlWeldMM1BkNElXQjBESjBrbmJlaHBoc0JYM3VuYU1q?=
 =?utf-8?B?UTllT0xUUkxrbGx3VjhUbWtWZVEvS25WK1E0em5kd0JrTEo2Y2hvd2g3WGo3?=
 =?utf-8?B?YVVSZDlyeEpPa0UrWGpKSVlDTktKNFBtQVEzanN0VG1MSVB5L0I3OFl5dzdU?=
 =?utf-8?B?M1B0WCthVlBuSHJNMmlTcEs5TVBSaGVHODM1YzJOdmVUdlFlbytlc2VrMXZl?=
 =?utf-8?B?dUs3QlUvQ2hQS2p2VkJBemtNOExUeE81NVhVSUtzaE5DNnNqUm50R29XaVBx?=
 =?utf-8?B?QnZBdG5oOFh1cURMQkhKTzVYRVhMQnZlbTZZckwrUVFIMXlpTkRUbEhHZXQ4?=
 =?utf-8?B?YktnTzRhTXpYUHo0M1JWYy9IN0RzUVZjdlNxNHI2ZjRscjBGSGxKUEh1TkJz?=
 =?utf-8?B?cUQ5RlZXSG9EdTE5SUp3MkVMdzJLd2F4RFlLTjJ3a1A1U1NoYkcxMy9Vc01s?=
 =?utf-8?B?UmxuSVppZGRTVEFvZ3lFaDdqRnI4SE5RcGQ1SHhYRExqTGFrT2ZsRVkzZ0JG?=
 =?utf-8?Q?tCZEmhxpVCC4q1N/mEHrY/Z/V4AUXnQbZQK1O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFDAF6226F2B2544B079144C023722E8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4e28ca-9a24-4a91-9ed9-08da118e2fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 14:12:40.9393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9zC/MZzwjm06I170NTVRdWg9FCuZoUWKSg9eQsgGcVnsHttwoRQvpUpe47gLvOzG9r5EEDLNR3rIt9JNUH4rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2138
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290087
X-Proofpoint-ORIG-GUID: _lE5WG7wuNolKRyWCaaeqyeXfIliJrny
X-Proofpoint-GUID: _lE5WG7wuNolKRyWCaaeqyeXfIliJrny
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDI5LCAyMDIyLCBhdCA4OjM1IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBNYXIgMjUsIDIwMjIgYXQgMDM6
MTk6NDFQTSAtMDQwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBBc3NpZ24gc2VwYXJh
dGUgYWRkcmVzcyBzcGFjZSBmb3IgZWFjaCBkZXZpY2UgaW4gdGhlIHJlbW90ZSBwcm9jZXNzZXMu
DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZh
QG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpv
aG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxq
YWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4gaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUu
aCB8IDE4ICsrKysrKysrDQo+PiBody9yZW1vdGUvaW9tbXUuYyAgICAgICAgIHwgOTUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgIHwgIDIgKw0KPj4gaHcvcmVtb3RlL21lc29uLmJ1aWxkICAgICB8ICAxICsNCj4+IDQg
ZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvcmVtb3Rl
L2lvbW11LmMNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcmVtb3RlL2lvbW11Lmgg
Yi9pbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4g
aW5kZXggMDAwMDAwMDAwMC4uOGY4NTA0MDBmMQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIv
aW5jbHVkZS9ody9yZW1vdGUvaW9tbXUuaA0KPj4gQEAgLTAsMCArMSwxOCBAQA0KPj4gKy8qKg0K
Pj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIE9yYWNsZSBhbmQvb3IgaXRzIGFmZmlsaWF0ZXMuDQo+
PiArICoNCj4+ICsgKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR1BMLCB2ZXJzaW9uIDIgb3IgbGF0ZXIuDQo+PiArICogU2VlIHRoZSBDT1BZSU5HIGZp
bGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3RvcnkuDQo+PiArICoNCj4+ICsgKi8NCj4+ICsNCj4+
ICsjaWZuZGVmIFJFTU9URV9JT01NVV9IDQo+PiArI2RlZmluZSBSRU1PVEVfSU9NTVVfSA0KPj4g
Kw0KPj4gKyNpbmNsdWRlICJody9wY2kvcGNpX2J1cy5oIg0KPj4gKw0KPj4gK3ZvaWQgcmVtb3Rl
X2NvbmZpZ3VyZV9pb21tdShQQ0lCdXMgKnBjaV9idXMpOw0KPj4gKw0KPj4gK3ZvaWQgcmVtb3Rl
X2lvbW11X2RlbF9kZXZpY2UoUENJRGV2aWNlICpwY2lfZGV2KTsNCj4+ICsNCj4+ICsjZW5kaWYN
Cj4+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvaW9tbXUuYyBiL2h3L3JlbW90ZS9pb21tdS5jDQo+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uMTNmMzI5YjQ1ZA0K
Pj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvaHcvcmVtb3RlL2lvbW11LmMNCj4+IEBAIC0wLDAg
KzEsOTUgQEANCj4+ICsvKioNCj4+ICsgKiBJT01NVSBmb3IgcmVtb3RlIGRldmljZQ0KPj4gKyAq
DQo+PiArICogQ29weXJpZ2h0IMKpIDIwMjIgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4N
Cj4+ICsgKg0KPj4gKyAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHUEwsIHZlcnNpb24gMiBvciBsYXRlci4NCj4+ICsgKiBTZWUgdGhlIENPUFlJTkcg
ZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4NCj4+ICsgKg0KPj4gKyAqLw0KPj4gKw0K
Pj4gKyNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+PiArI2luY2x1ZGUgInFlbXUtY29tbW9uLmgi
DQo+PiArDQo+PiArI2luY2x1ZGUgImh3L3JlbW90ZS9pb21tdS5oIg0KPj4gKyNpbmNsdWRlICJo
dy9wY2kvcGNpX2J1cy5oIg0KPj4gKyNpbmNsdWRlICJody9wY2kvcGNpLmgiDQo+PiArI2luY2x1
ZGUgImV4ZWMvbWVtb3J5LmgiDQo+PiArI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIN
Cj4+ICsjaW5jbHVkZSAidHJhY2UuaCINCj4+ICsNCj4+ICtzdHJ1Y3QgUmVtb3RlSW9tbXVFbGVt
IHsNCj4+ICsgICAgQWRkcmVzc1NwYWNlICBhczsNCj4+ICsgICAgTWVtb3J5UmVnaW9uICBtcjsN
Cj4+ICt9Ow0KPj4gKw0KPj4gK3N0cnVjdCBSZW1vdGVJb21tdVRhYmxlIHsNCj4+ICsgICAgUWVt
dU11dGV4IGxvY2s7DQo+PiArICAgIEdIYXNoVGFibGUgKmVsZW1fYnlfYmRmOw0KPj4gK30gcmVt
b3RlX2lvbW11X3RhYmxlOw0KPj4gKw0KPj4gKyNkZWZpbmUgSU5UMlZPSURQKGkpICh2b2lkICop
KHVpbnRwdHJfdCkoaSkNCj4+ICsNCj4+ICtzdGF0aWMgQWRkcmVzc1NwYWNlICpyZW1vdGVfaW9t
bXVfZmluZF9hZGRfYXMoUENJQnVzICpwY2lfYnVzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUsIGludCBkZXZmbikNCj4+ICt7
DQo+PiArICAgIHN0cnVjdCBSZW1vdGVJb21tdVRhYmxlICppb21tdV90YWJsZSA9IG9wYXF1ZTsN
Cj4+ICsgICAgc3RydWN0IFJlbW90ZUlvbW11RWxlbSAqZWxlbSA9IE5VTEw7DQo+PiArICAgIGlu
dCBwY2lfYmRmID0gUENJX0JVSUxEX0JERihwY2lfYnVzX251bShwY2lfYnVzKSwgZGV2Zm4pOw0K
Pj4gKw0KPj4gKyAgICBlbGVtID0gZ19oYXNoX3RhYmxlX2xvb2t1cChpb21tdV90YWJsZS0+ZWxl
bV9ieV9iZGYsIElOVDJWT0lEUChwY2lfYmRmKSk7DQo+IA0KPiBXaHkgaXMgYSBsb2NrIG5lZWRl
ZCBhcm91bmQgZ19oYXNoX3RhYmxlX2luc2VydCgpIGJlbG93IGJ1dCBubyBsb2NrIGlzDQo+IGhl
bGQgYXJvdW5kIGdfaGFzaF90YWJsZV9sb29rdXAoKT8NCj4gDQo+IEluc2VydGlvbiBpc24ndCBh
dG9taWMgYmVjYXVzZSBsb29rdXAgYW5kIGluc2VydCBhcmUgc2VwYXJhdGUgb3BlcmF0aW9ucw0K
PiBhbmQgdGhleSBhcmUgbm90IGRvbmUgdW5kZXIgYSBzaW5nbGUgbG9jay4NCg0KVGhhbmtzIGZv
ciB0aGUgY2F0Y2ghIFRoZSBsb2NrIHNob3VsZCBjb3ZlciBsb29rdXAgYWxzby4NCg0KPiANCj4+
ICsNCj4+ICsgICAgaWYgKCFlbGVtKSB7DQo+PiArICAgICAgICBnX2F1dG9mcmVlIGNoYXIgKm1y
X25hbWUgPSBnX3N0cmR1cF9wcmludGYoInZmdS1yYW0tJWQiLCBwY2lfYmRmKTsNCj4+ICsgICAg
ICAgIGdfYXV0b2ZyZWUgY2hhciAqYXNfbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigidmZ1LWFzLSVk
IiwgcGNpX2JkZik7DQo+PiArDQo+PiArICAgICAgICBlbGVtID0gZ19tYWxsb2MwKHNpemVvZihz
dHJ1Y3QgUmVtb3RlSW9tbXVFbGVtKSk7DQo+PiArDQo+PiArICAgICAgICBtZW1vcnlfcmVnaW9u
X2luaXQoJmVsZW0tPm1yLCBOVUxMLCBtcl9uYW1lLCBVSU5UNjRfTUFYKTsNCj4+ICsgICAgICAg
IGFkZHJlc3Nfc3BhY2VfaW5pdCgmZWxlbS0+YXMsICZlbGVtLT5tciwgYXNfbmFtZSk7DQo+PiAr
DQo+PiArICAgICAgICBxZW11X211dGV4X2xvY2soJmlvbW11X3RhYmxlLT5sb2NrKTsNCj4+ICsg
ICAgICAgIGdfaGFzaF90YWJsZV9pbnNlcnQoaW9tbXVfdGFibGUtPmVsZW1fYnlfYmRmLCBJTlQy
Vk9JRFAocGNpX2JkZiksIGVsZW0pOw0KPj4gKyAgICAgICAgcWVtdV9tdXRleF91bmxvY2soJmlv
bW11X3RhYmxlLT5sb2NrKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gJmVsZW0t
PmFzOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCByZW1vdGVfaW9tbXVfZGVsX2VsZW0o
Z3BvaW50ZXIgZGF0YSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBSZW1vdGVJb21tdUVsZW0gKmVs
ZW0gPSBkYXRhOw0KPj4gKw0KPj4gKyAgICBnX2Fzc2VydChlbGVtKTsNCj4+ICsNCj4+ICsgICAg
bWVtb3J5X3JlZ2lvbl91bnJlZigmZWxlbS0+bXIpOw0KPj4gKyAgICBhZGRyZXNzX3NwYWNlX2Rl
c3Ryb3koJmVsZW0tPmFzKTsNCj4+ICsNCj4+ICsgICAgZ19mcmVlKGVsZW0pOw0KPj4gK30NCj4+
ICsNCj4+ICt2b2lkIHJlbW90ZV9pb21tdV9kZWxfZGV2aWNlKFBDSURldmljZSAqcGNpX2RldikN
Cj4+ICt7DQo+PiArICAgIGludCBwY2lfYmRmOw0KPj4gKw0KPj4gKyAgICBpZiAoIXJlbW90ZV9p
b21tdV90YWJsZS5lbGVtX2J5X2JkZiB8fCAhcGNpX2Rldikgew0KPj4gKyAgICAgICAgcmV0dXJu
Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHBjaV9iZGYgPSBQQ0lfQlVJTERfQkRGKHBjaV9i
dXNfbnVtKHBjaV9nZXRfYnVzKHBjaV9kZXYpKSwgcGNpX2Rldi0+ZGV2Zm4pOw0KPj4gKw0KPj4g
KyAgICBxZW11X211dGV4X2xvY2soJnJlbW90ZV9pb21tdV90YWJsZS5sb2NrKTsNCj4+ICsgICAg
Z19oYXNoX3RhYmxlX3JlbW92ZShyZW1vdGVfaW9tbXVfdGFibGUuZWxlbV9ieV9iZGYsIElOVDJW
T0lEUChwY2lfYmRmKSk7DQo+PiArICAgIHFlbXVfbXV0ZXhfdW5sb2NrKCZyZW1vdGVfaW9tbXVf
dGFibGUubG9jayk7DQo+PiArfQ0KPj4gKw0KPj4gK3ZvaWQgcmVtb3RlX2NvbmZpZ3VyZV9pb21t
dShQQ0lCdXMgKnBjaV9idXMpDQo+PiArew0KPj4gKyAgICBpZiAoIXJlbW90ZV9pb21tdV90YWJs
ZS5lbGVtX2J5X2JkZikgew0KPj4gKyAgICAgICAgcmVtb3RlX2lvbW11X3RhYmxlLmVsZW1fYnlf
YmRmID0NCj4+ICsgICAgICAgICAgICBnX2hhc2hfdGFibGVfbmV3X2Z1bGwoTlVMTCwgTlVMTCwg
TlVMTCwgcmVtb3RlX2lvbW11X2RlbF9lbGVtKTsNCj4+ICsgICAgICAgIHFlbXVfbXV0ZXhfaW5p
dCgmcmVtb3RlX2lvbW11X3RhYmxlLmxvY2spOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHBj
aV9zZXR1cF9pb21tdShwY2lfYnVzLCByZW1vdGVfaW9tbXVfZmluZF9hZGRfYXMsICZyZW1vdGVf
aW9tbXVfdGFibGUpOw0KPiANCj4gV2h5IGlzIHJlbW90ZV9pb21tdV90YWJsZSBnbG9iYWw/IEl0
IGNvdWxkIGJlIHBlci1QQ0lCdXMgYW5kIGluZGV4ZWQgYnkNCj4ganVzdCBkZXZmbiBpbnN0ZWFk
IG9mIHRoZSBmdWxsIEJERi4NCg0KSXTigJlzIGdsb2JhbCBiZWNhdXNlIHJlbW90ZV9pb21tdV9k
ZWxfZGV2aWNlKCkgbmVlZHMgaXQgZm9yIGNsZWFudXAuDQoNCk9LLCB3aWxsIG1ha2UgaXQgYSBw
ZXIgYnVzIHByb3BlcnR5Lg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCg==

