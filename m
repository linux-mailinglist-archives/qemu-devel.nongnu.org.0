Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA150017E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 00:02:28 +0200 (CEST)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nel4E-0002Xg-Ud
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 18:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nel20-0000pZ-Mc
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 18:00:09 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nel1w-00047A-Kc
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 18:00:07 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DJswX4008887; 
 Wed, 13 Apr 2022 21:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jQdTt6g8nEqsI2ObA/Tz/ro+JKNtYOEEXvJ7ZuzEdDg=;
 b=VeFALOYp53Wo6Mt9gnufzqsKanRxMu1f8l43gF77j2Iu8kbmsOcvchNWdAGd2Az9Hb89
 Ly/OIy8qW2zgYAPMkEC1A5uHzgj2pAqwyxKixnoxe3esD306g3AtmjhAM76eW7fnjnir
 Wlfpn8QXY7GnTCHoGgbadhGJmplQR5eAdW7sO7MpaItRUVPqP8MpgrZcCavkYP7CeWjN
 P+DdTzkWo+7W4YjhR1YOXvjXpBoZZ5YVZRQD9aumDMdgZ9a/6MNWhMjNheb9nCvuRv0i
 j1espylCJbTT5XgFhVKq5olLzW1gjTQ/eiSiN60SC8XndJAXu7DvkgByPaa90ejKbp35 TA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0x2k9pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 21:59:51 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23DLuabn035246; Wed, 13 Apr 2022 21:59:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fcg9k6k27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 21:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZoA+XkWlmk2K+jmCKwx0ZTwbNkGh5xIySjrrhhqksrYUsKA55NO9Varbd8mxbudpiwzMhZtsoB75uoWJe4dY88uFeWaKmUv+Q7Iqx++swy89kA/34WnUnSrQVKTUKzCw14BkTvcumGYdat0rY0Sp1juwlDajWye06f2NpW7/rdjR+5qla+eBpP4+28zgEQVf1mInLMtylYqb8DIqnaTnXsUYNFDP9UNyBWk89P3xFkaP0+Wrj3aNV9/xiDhV7kISDsqoikGCv7AJ4kHSn7YrkrTf9ZGsRzrDLkos8unBeRr4cIum/euQVEz3BApnkFh3r1uwGMbRkUZJBEWOEJeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQdTt6g8nEqsI2ObA/Tz/ro+JKNtYOEEXvJ7ZuzEdDg=;
 b=Tm99K4vFfGZblV0p+rY003+NkO5BkQfYMdriAuNt4LTA1BeI5KqAYYBSrOrXCG3R94aQaOz7s/uURM/bQTvgXW5wNvol7VvF5Bo4bJFEkpYkHV0HPGStqGo0cm6uaQqLlYE1yMtt+8bEyrf/QtckoXWXrb6WJluA4J0HVqESgiITXXFpbuAN0s4yTnjJzIXG2zhRzFwEDL45Fka8AR09hR5pCuGlxVi4GmyLCJu9EyMEFzsZ7/BaiDCJt06WkgOzaDKeaEV0o6q9ZqgyMfkQkMnKJNdqi2y2T77yQqTSYyAbY9j8BDfKDWrbs/jhqwg6DNu0zpcW4PPcaXPgI9Ol6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQdTt6g8nEqsI2ObA/Tz/ro+JKNtYOEEXvJ7ZuzEdDg=;
 b=DkC9D1c1m8q8N050bJxfC/KwNP+YS/KzVKjz+S4dDzW8rjklyX3C2aV157J3WwK5XWYjkIvqM+cgN5yXMv2mtcHeXCI4gzeqU6M5Av70SnKDuFAreUa21DT5Q2v1DPolPdh3CU1+CMgmizAFK/ZlkK4Ikh23yhxN20kPahqw9Ik=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR1001MB2321.namprd10.prod.outlook.com (2603:10b6:405:35::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 21:59:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::acd4:7d0c:f4ac:1d0b]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::acd4:7d0c:f4ac:1d0b%3]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 21:59:48 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYQH1dtH36jxsvk0ChB2A9jkjfZazuA8QAgABC0oCAADwCAA==
Date: Wed, 13 Apr 2022 21:59:48 +0000
Message-ID: <CC279BEC-CA46-46AD-9C73-CDE6933F1C5B@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <20220413162550.4a02be89@redhat.com>
 <1DB8CC98-EAC6-4991-BFD4-ACFD504369CC@oracle.com>
In-Reply-To: <1DB8CC98-EAC6-4991-BFD4-ACFD504369CC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96addcdb-fab6-4acb-d6c3-08da1d98ed63
x-ms-traffictypediagnostic: BN6PR1001MB2321:EE_
x-microsoft-antispam-prvs: <BN6PR1001MB23214FE5128EC4C4CCDA7ED690EC9@BN6PR1001MB2321.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5IRy7LK6kH0tPMRlDWZ//ljf3GlIFOYyoCMCQhJboVgBm/YcsBd/oz4iGFDjpg4ltFawupK2MZI7O3J4hnbMCE2UgYxLVhPZTeFi7KW8F2AA0CgcqDi+qCQUQrD3dMFOqzAqFUfbzYXJoG0nn/IPLkpc1sbPzricnbnljaqWtncqDfXbnXsBOjuHGhfziPR/FiJpTtuK6mVE7+Z0E2BqI47TkHB+1SR0ogSIGPPn2gqlZeTxyV1nKWqo3w2juqJM0aUDTpWXBTt6BPqKkBXRYHo1lH+932Ezw7+N8KL1K8i4/7HI6NFqSpclFoXJNmKZ6x9yKC3Ut9cSfl+OeEsvExbJRoHGzccAFxKujI2K/pZET2ccdHotSkPzeKP/5k4lD6eh3euC8W02CtjpCP8hy+LmROTJi106O1vlk3S6QDe7jBQtQT2Rq9J3foo23SKoZEcQ1rz74NZrSbaL+FHejFeN8S6Q+3qBAy4WASnq0ZMeRMotXYVi1rrn8R0323tT0jjh56ocVDOb1KEiXMt3dWyg1cr7Z2rOJE6S9QrGX5wQ1a+XWtR05ARdTNwhn3RxRY6at9aadSAIwrlKRPeKEVEGSVGNtI4rTprIXh+bK2m9PFyuRu29ArtlFfxAOXkJ/xzYDqiP58UX6kNLP0docEA1oSBJecPf20dz6i2M3NrIZjwZaOY+o9hLQS/Tee3jV/yp6kbJRD7gaExSbzY/rt209K6/0W2FhfHxGplYLUw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(508600001)(6512007)(53546011)(4326008)(36756003)(54906003)(71200400001)(6916009)(8676002)(91956017)(64756008)(66476007)(66556008)(76116006)(66946007)(66446008)(7416002)(8936002)(6486002)(33656002)(6506007)(5660300002)(83380400001)(316002)(122000001)(2616005)(86362001)(38070700005)(38100700002)(44832011)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGhwdFpwN0NrRVdJY2VIek5ncVZHdEs5YzNNZEVENW9kNkxaZVM0bHRWVjdP?=
 =?utf-8?B?NXljdnBUSFUyL2NwenJ1alpVWThFcWdzRmo1YVdkVlVNQ083dTdRQW5ZbE16?=
 =?utf-8?B?S1NwV0JvUE9IVk83ak9adFB2N0hkY3NCeUlqbzg4NFMvMkF4ZzRRZGtZN3E2?=
 =?utf-8?B?THRCS1ptbHpSMTBCQ2Z6eDF0S3luTGtMd1dpZjhKQmJKK2hQY1lXZEZLNkFV?=
 =?utf-8?B?SWhycFFpZ0dGWVFSTnJxVmZrd3ZtSGIzR01yWk9MUkFRNE1BV0JmVDBiSU1G?=
 =?utf-8?B?MGNqKzJwUnRERjhHOGcxN0FHY3RvMjJvaDRjaGhXZUpZcmEvYlJOMlVPTUE5?=
 =?utf-8?B?Q2lWZ2ZLelk5YXdicEhpNnB4eDkvY1JyRWdGWHJ0eGJTektBRWZBbWNsWGxv?=
 =?utf-8?B?R21VTHJyU0E2dWR5cy9ERXNJZmd5VTUyK01jN0toa1dIR1FkVFA4TDdWUHhu?=
 =?utf-8?B?TDkrcVViZC9vNEptUytCTmczczN2SlpxSCtJSFh3Y1dsRGkwT0RqK0FwUExS?=
 =?utf-8?B?QmVqVXRWWFRydGNDSHRQZmRsc0tEL0JnL0lJUTJPdHEvWmFYeGpRUXpqbGFU?=
 =?utf-8?B?TlJHU0NtUllVcHVpeDhCMmJ0VEI1SDA1d2I4cUZyUXh1T01Vb3VoSDNPSW5z?=
 =?utf-8?B?U3JKTyt6Y1JUakxwd3czZVhnUGYvVlhZZTlweUhqZzQ2VWdrRjhwWmg2d2hk?=
 =?utf-8?B?UFNZVU91a0phZURlaE5lTmRRd29JUzlhNU1vcDlCTy9Zd2pKR1Evd2Z0RVRr?=
 =?utf-8?B?endRNi9YTXlhcDJkT2pRRFUxVmhIOWEwcTJiSGhIbzVJTXAxdVhna1VmcFVj?=
 =?utf-8?B?dWkycXh4Zk5GYThWR3oyRUZPeHhETWc4SHJTVjV4RWNrUVpGZ3g1TlpCVktw?=
 =?utf-8?B?UFd2dUIzSmQxRmRIWkxoZWdJMWVEVERodGxueVZNTFZJOVBCMVhhWXM2Zy9q?=
 =?utf-8?B?a3piNXJXdWU2UkpPMytEWHkxTWxZZXdHd0JqWTB1MnRpTFRqMHdEeE43VmlZ?=
 =?utf-8?B?d0xaVUcrMW9OMFFGblNpM2FlR0p1MlVSV3VnYVZNK1pybitFTGsxcjFoN1J3?=
 =?utf-8?B?UFNITC9lMXRDeXZ5THorSE1heHMyek95cmtaVGZKTFJWR29XUXJBOXBsRjFK?=
 =?utf-8?B?Q2Zsb1NGVkFKeVpXbndCZzEwWmovdkdySmJPb08wL0xDTGFYS1pSamhFRWg4?=
 =?utf-8?B?SzdBS05haW5nNHpMZWREZGEva1c0YjBzMkRTWU5GeW5IUG12MUhrekpiMUlU?=
 =?utf-8?B?Vk0ycjlJSkVVUHZ6eUM1WEJ1UEpzS0JUMEpzRlo0VjJjaGsvS3R5bERmZG1p?=
 =?utf-8?B?QVNYYXlvbXI2Tnh2UUNZcmRxbGFEWVZONm9PSG1LeXc0L0tBYXZ1Q0pSRmZK?=
 =?utf-8?B?UkpFa0JGT20xVGFqNm9BSzlRb3A1aGx5NytQQmNPbHppSktzanVxT2ptVlpw?=
 =?utf-8?B?d3JMc1BwWG50OFhadjFKS25yOVFlWGtpUlBScGJUVFMrOFZLMnh0TlB1YzZT?=
 =?utf-8?B?UnpxUmxiRGFTc0RMT2lTUmc3d0J1UHlvWVlONlhXODFqeDBFY251VGxNRFJ3?=
 =?utf-8?B?azY1UEx6WWVIQVVLbjl5V3NORlY0SlRoOW1vSGM1K3dpK0RqZG9GN2wvMVVn?=
 =?utf-8?B?OG1YKzlOYlQxU09LUDBLcnRsMmZ5QU1qcjQ5cjU2OTY5c0xBYitGazVGV2xl?=
 =?utf-8?B?OGkxQkJwalo2a0JJU1hNRnZCYnlnRGRLMWFmWHBobzhwYjhUbGovNTkybDcv?=
 =?utf-8?B?U2ZlbitncjhUcWdlRi8zNHhBajhLRy8wMzl0Nk13OGtWQUFJWFVjQnhhKytO?=
 =?utf-8?B?azNvTTBxSnBVYnhWbXM4YkxvUWw1YlpoRkNDUDhSNnU5VWoxZ2RLa1FPa0dL?=
 =?utf-8?B?YzA1TWo5aUFZcEF2cDRhN2hZc0pMU3NrTFd0TENZV2ZsUW1vNGxYcGVNQkto?=
 =?utf-8?B?dzlaZUZycGlLbm0zc2RNSnIxTDRZdWlJZnFNZzUydjhTZUF3Vm9tSEJhNGxT?=
 =?utf-8?B?N3hDWk52QktCWW56YlpCR0FMQmovMkw3bERsSFZBSXBYWit3bWVkRStRY3Rz?=
 =?utf-8?B?Qi9hV2NRd0VYbU9JVTk1QitqTTAyT042R3JsNGY2ZjlHTzVwQWl5Y3VwRWQ2?=
 =?utf-8?B?bEVkbWdnem9YMlRNYzJWUFNTQXhOUCt3OGN2SW91M2dPZ2QzdXhhTTh0aDlF?=
 =?utf-8?B?VXZXREF3cHh3eDJUdXJBdm5ib3NwRkpWcUg0bHhyTVV4UzUvc0NWbE5aYkE2?=
 =?utf-8?B?M3pkKzFLU1JQTEVtRlN2TmR5SGg5T09kRGJ2WDNqd042aS9RVkZXUzhFMVlB?=
 =?utf-8?B?YzkyNmtUM21zZGlPYnF5TGdNZXFQaG1ONUVwUS9WTFZrZ0RHaGc5SkIrdTFm?=
 =?utf-8?Q?+HCwPsStLKKw87Cy6icnN83qgRzh8Trwri096?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D48280125444F4F8D2977A9953E31BA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96addcdb-fab6-4acb-d6c3-08da1d98ed63
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 21:59:48.0699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+Lar+u77uwLiTF8V9WiiIXX1A58fMfojLQVBkoor70Lv3I1dvabgwjhrOlsSTKoJwZRIuGV+iFmZAGMLrrXOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2321
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-13_04:2022-04-13,
 2022-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130105
X-Proofpoint-ORIG-GUID: 8T55kFeAXDT6omZH-fY0sbqzlr1VQqQV
X-Proofpoint-GUID: 8T55kFeAXDT6omZH-fY0sbqzlr1VQqQV
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDEzLCAyMDIyLCBhdCAyOjI0IFBNLCBKYWcgUmFtYW4gPGphZy5yYW1hbkBv
cmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIEFwciAxMywgMjAyMiwgYXQgMTA6
MjUgQU0sIElnb3IgTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4gDQo+
PiBPbiBGcmksIDI1IE1hciAyMDIyIDE1OjE5OjQxIC0wNDAwDQo+PiBKYWdhbm5hdGhhbiBSYW1h
biA8amFnLnJhbWFuQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4gDQo+Pj4gQXNzaWduIHNlcGFyYXRl
IGFkZHJlc3Mgc3BhY2UgZm9yIGVhY2ggZGV2aWNlIGluIHRoZSByZW1vdGUgcHJvY2Vzc2VzLg0K
Pj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZh
QG9yYWNsZS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5q
b2huc29uQG9yYWNsZS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4g
PGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+IC0tLQ0KPj4+IGluY2x1ZGUvaHcvcmVtb3RlL2lv
bW11LmggfCAxOCArKysrKysrKw0KPj4+IGh3L3JlbW90ZS9pb21tdS5jICAgICAgICAgfCA5NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgIHwgIDIgKw0KPj4+IGh3L3JlbW90ZS9tZXNvbi5idWlsZCAgICAgfCAgMSAr
DQo+Pj4gNCBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKQ0KPj4+IGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IGh3L3JlbW90ZS9pb21tdS5jDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcmVt
b3RlL2lvbW11LmggYi9pbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oDQo+Pj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwLi44Zjg1MDQwMGYxDQo+Pj4gLS0tIC9kZXYv
bnVsbA0KPj4+ICsrKyBiL2luY2x1ZGUvaHcvcmVtb3RlL2lvbW11LmgNCj4+PiBAQCAtMCwwICsx
LDE4IEBADQo+Pj4gKy8qKg0KPj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMiBPcmFjbGUgYW5kL29y
IGl0cyBhZmZpbGlhdGVzLg0KPj4+ICsgKg0KPj4+ICsgKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQg
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIgb3IgbGF0ZXIuDQo+Pj4g
KyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lg0KPj4+
ICsgKg0KPj4+ICsgKi8NCj4+PiArDQo+Pj4gKyNpZm5kZWYgUkVNT1RFX0lPTU1VX0gNCj4+PiAr
I2RlZmluZSBSRU1PVEVfSU9NTVVfSA0KPj4+ICsNCj4+PiArI2luY2x1ZGUgImh3L3BjaS9wY2lf
YnVzLmgiDQo+Pj4gKw0KPj4+ICt2b2lkIHJlbW90ZV9jb25maWd1cmVfaW9tbXUoUENJQnVzICpw
Y2lfYnVzKTsNCj4+PiArDQo+Pj4gK3ZvaWQgcmVtb3RlX2lvbW11X2RlbF9kZXZpY2UoUENJRGV2
aWNlICpwY2lfZGV2KTsNCj4+PiArDQo+Pj4gKyNlbmRpZg0KPj4+IGRpZmYgLS1naXQgYS9ody9y
ZW1vdGUvaW9tbXUuYyBiL2h3L3JlbW90ZS9pb21tdS5jDQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwLi4xM2YzMjliNDVkDQo+Pj4gLS0tIC9kZXYvbnVsbA0K
Pj4+ICsrKyBiL2h3L3JlbW90ZS9pb21tdS5jDQo+Pj4gQEAgLTAsMCArMSw5NSBAQA0KPj4+ICsv
KioNCj4+PiArICogSU9NTVUgZm9yIHJlbW90ZSBkZXZpY2UNCj4+PiArICoNCj4+PiArICogQ29w
eXJpZ2h0IMKpIDIwMjIgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4NCj4+PiArICoNCj4+
PiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQ
TCwgdmVyc2lvbiAyIG9yIGxhdGVyLg0KPj4+ICsgKiBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0
aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4NCj4+PiArICoNCj4+PiArICovDQo+Pj4gKw0KPj4+ICsj
aW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPj4+ICsjaW5jbHVkZSAicWVtdS1jb21tb24uaCINCj4+
PiArDQo+Pj4gKyNpbmNsdWRlICJody9yZW1vdGUvaW9tbXUuaCINCj4+PiArI2luY2x1ZGUgImh3
L3BjaS9wY2lfYnVzLmgiDQo+Pj4gKyNpbmNsdWRlICJody9wY2kvcGNpLmgiDQo+Pj4gKyNpbmNs
dWRlICJleGVjL21lbW9yeS5oIg0KPj4+ICsjaW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5o
Ig0KPj4+ICsjaW5jbHVkZSAidHJhY2UuaCINCj4+PiArDQo+Pj4gK3N0cnVjdCBSZW1vdGVJb21t
dUVsZW0gew0KPj4+ICsgICAgQWRkcmVzc1NwYWNlICBhczsNCj4+PiArICAgIE1lbW9yeVJlZ2lv
biAgbXI7DQo+Pj4gK307DQo+Pj4gKw0KPj4+ICtzdHJ1Y3QgUmVtb3RlSW9tbXVUYWJsZSB7DQo+
Pj4gKyAgICBRZW11TXV0ZXggbG9jazsNCj4+PiArICAgIEdIYXNoVGFibGUgKmVsZW1fYnlfYmRm
Ow0KPj4+ICt9IHJlbW90ZV9pb21tdV90YWJsZTsNCj4+PiArDQo+Pj4gKyNkZWZpbmUgSU5UMlZP
SURQKGkpICh2b2lkICopKHVpbnRwdHJfdCkoaSkNCj4+PiArDQo+Pj4gK3N0YXRpYyBBZGRyZXNz
U3BhY2UgKnJlbW90ZV9pb21tdV9maW5kX2FkZF9hcyhQQ0lCdXMgKnBjaV9idXMsDQo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUs
IGludCBkZXZmbikNCj4+PiArew0KPj4+ICsgICAgc3RydWN0IFJlbW90ZUlvbW11VGFibGUgKmlv
bW11X3RhYmxlID0gb3BhcXVlOw0KPj4+ICsgICAgc3RydWN0IFJlbW90ZUlvbW11RWxlbSAqZWxl
bSA9IE5VTEw7DQo+Pj4gKyAgICBpbnQgcGNpX2JkZiA9IFBDSV9CVUlMRF9CREYocGNpX2J1c19u
dW0ocGNpX2J1cyksIGRldmZuKTsNCj4+PiArDQo+Pj4gKyAgICBlbGVtID0gZ19oYXNoX3RhYmxl
X2xvb2t1cChpb21tdV90YWJsZS0+ZWxlbV9ieV9iZGYsIElOVDJWT0lEUChwY2lfYmRmKSk7DQo+
Pj4gKw0KPj4+ICsgICAgaWYgKCFlbGVtKSB7DQo+Pj4gKyAgICAgICAgZ19hdXRvZnJlZSBjaGFy
ICptcl9uYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJ2ZnUtcmFtLSVkIiwgcGNpX2JkZik7DQo+Pj4g
KyAgICAgICAgZ19hdXRvZnJlZSBjaGFyICphc19uYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJ2ZnUt
YXMtJWQiLCBwY2lfYmRmKTsNCj4+PiArDQo+Pj4gKyAgICAgICAgZWxlbSA9IGdfbWFsbG9jMChz
aXplb2Yoc3RydWN0IFJlbW90ZUlvbW11RWxlbSkpOw0KPj4+ICsNCj4+PiArICAgICAgICBtZW1v
cnlfcmVnaW9uX2luaXQoJmVsZW0tPm1yLCBOVUxMLCBtcl9uYW1lLCBVSU5UNjRfTUFYKTsNCj4+
IGdvZXMgaGVyZToNCj4+ICBtZW1vcnlfcmVnaW9uX2RvX2luaXQoKQ0KPj4gICAgICAgaWYgKCFv
d25lcikgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KPj4gICAgICAgICAgIG93bmVyID0gY29udGFpbmVyX2dldChxZGV2X2dldF9t
YWNoaW5lKCksICIvdW5hdHRhY2hlZCIpOyAgICAgICAgICAgIA0KPj4gICAgICAgfSAgDQo+PiAN
Cj4+IHRoZW4NCj4+IA0KPj4+ICsgICAgICAgIGFkZHJlc3Nfc3BhY2VfaW5pdCgmZWxlbS0+YXMs
ICZlbGVtLT5tciwgYXNfbmFtZSk7DQo+Pj4gKw0KPj4+ICsgICAgICAgIHFlbXVfbXV0ZXhfbG9j
aygmaW9tbXVfdGFibGUtPmxvY2spOw0KPj4+ICsgICAgICAgIGdfaGFzaF90YWJsZV9pbnNlcnQo
aW9tbXVfdGFibGUtPmVsZW1fYnlfYmRmLCBJTlQyVk9JRFAocGNpX2JkZiksIGVsZW0pOw0KPj4+
ICsgICAgICAgIHFlbXVfbXV0ZXhfdW5sb2NrKCZpb21tdV90YWJsZS0+bG9jayk7DQo+Pj4gKyAg
ICB9DQo+Pj4gKw0KPj4+ICsgICAgcmV0dXJuICZlbGVtLT5hczsNCj4+PiArfQ0KPj4+ICsNCj4+
PiArc3RhdGljIHZvaWQgcmVtb3RlX2lvbW11X2RlbF9lbGVtKGdwb2ludGVyIGRhdGEpDQo+Pj4g
K3sNCj4+PiArICAgIHN0cnVjdCBSZW1vdGVJb21tdUVsZW0gKmVsZW0gPSBkYXRhOw0KPj4+ICsN
Cj4+PiArICAgIGdfYXNzZXJ0KGVsZW0pOw0KPj4+ICsNCj4+PiArICAgIG1lbW9yeV9yZWdpb25f
dW5yZWYoJmVsZW0tPm1yKTsNCj4+IA0KPj4gaGVyZSB3ZSBjYWxsDQo+PiAgICAgb2JqZWN0X3Vu
cmVmKG1yLT5vd25lcik7IA0KPj4gbGVhdmluZyBkYW5nbGluZyBwb2ludGVyIGluIG93bmVyICco
cWRldl9nZXRfbWFjaGluZSgpLCAiL3VuYXR0YWNoZWQiKScNCj4+IGl0IGRvZXNuJ3QgbG9vayBj
b3JyZWN0DQo+PiANCj4+IEkgdGhvdWdodCB0aGF0IG1lbW9yeV9yZWdpb25fdW5yZWYoKSBzaG91
bGQgYmUgYWx3YXlzIHBhaXJlZCB3aXRoIG1lbW9yeV9yZWdpb25fcmVmKCkNCj4+IA0KPj4gYW5k
IGxvb2tpbmcgYXQgbWVtb3J5X3JlZ2lvbl9pbml0KC4uLm93bmVyLi4uKSBoaXN0b3J5IGl0IGxv
b2tzIGxpa2UNCj4+IG93bmVyLWxlc3MgKE5VTEwpIHJlZ2lvbnMgYXJlIG5vdCBtZWFudCB0byBi
ZSBkZWxldGVkIGV2ZXIuDQo+IA0KPiBIaSBJZ29yLA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcG9p
bnRlcnMgYWJvdXQgcmVmIGNvdW50ZXJzIGZvciBNZW1vcnlSZWdpb25zLg0KPiANCj4gSXQgbWFr
ZXMgc2Vuc2UgLSBNZW1vcnlSZWdpb25zIGFyZSBub3QgUUVNVSBPYmplY3RzLiBTbyB0aGVpcg0K
PiBvd25lcuKAmXMgcmVmIGNvdW50ZXJzIGFyZSB1c2VkIGluc3RlYWQuIFNvIHRoZSBleHBlY3Rh
dGlvbiBpcyB0aGF0DQo+IHdoZW4gdGhlIG93bmVyIGlzIGRlc3Ryb3llZCwgdGhlIE1lbW9yeVJl
Z2lvbnMgaW5pdGlhbGl6ZWQgYnkgdGhlbQ0KPiBhbHNvIGdldCBkZXN0cm95ZWQgc2ltdWx0YW5l
b3VzbHkuDQoNCldlbGwsIE1lbW9yeVJlZ2lvbnMgYXJlIGluZGVlZCBRRU1VIG9iamVjdHMgLQ0K
Im1lbW9yeV9yZWdpb25faW5pdCgpIC0+IG9iamVjdF9pbml0aWFsaXplKCkiIGluaXRpYWxpemVz
IHRoZSBvYmplY3QuDQpTbyB3ZSBzaG91bGQgYmUgYWJsZSB0byB1bnJlZiB0aGUgTWVtb3J5UmVn
aW9uIG9iamVjdCBkaXJlY3RseS4NCg0KV2UgY291bGQgbWFrZSB0aGUgUENJRGV2aWNlIGFzIHRo
ZSBvd25lciBvZiBpdHMgSU9NTVUgcmVnaW9uIC0NCndoZW4gdGhlIGRldmljZSBpcyBmaW5hbGl6
ZWQsIGl0cyByZWdpb24gd291bGQgYmUgZmluYWxpemVkIGFzIHdlbGwuDQoNCkdpdmVuIHRoZSBh
Ym92ZSwgSSBkb27igJl0IHRoaW5rIHdlIHdvdWxkIG5lZWQgYSBzZXBhcmF0ZSBkZWxldGUNCmZ1
bmN0aW9uIChzdWNoIGFzIHJlbW90ZV9pb21tdV9kZWxfZGV2aWNlKCkpLiBXaGVuIHRoZSBkZXZp
Y2UgaXMNCnVucGx1Z2dlZCwgaXRzIE1lbW9yeVJlZ2lvbiB3b3VsZCBiZSBmaW5hbGl6ZWQgYXV0
b21hdGljYWxseS4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0KPiBJbiB0aGlzIGNhc2Us
IFJlbW90ZUlvbW11RWxlbS0+bXIgZG9lcyBub3QgaGF2ZSBhbiBvd25lci4gVGhlcmVmb3JlLA0K
PiB3ZSBkb27igJl0IGhhdmUgdG8gbWFuYWdlIGl0cyByZWYgY291bnRlci4gV2hlbiBSZW1vdGVJ
b21tdUVsZW0gaXMNCj4gZGVzdHJveWVkLCB0aGUgTWVtb3J5UmVnaW9uIHNob3VsZCBiZSBjbGVh
bmVkIHVwIGF1dG9tYXRpY2FsbHkuDQo+IA0KPiAtLQ0KPiBKYWcNCj4gDQo+PiANCj4+PiArICAg
IGFkZHJlc3Nfc3BhY2VfZGVzdHJveSgmZWxlbS0+YXMpOw0KPj4+ICsNCj4+PiArICAgIGdfZnJl
ZShlbGVtKTsNCj4+PiArfQ0KPj4+ICsNCj4+PiArdm9pZCByZW1vdGVfaW9tbXVfZGVsX2Rldmlj
ZShQQ0lEZXZpY2UgKnBjaV9kZXYpDQo+Pj4gK3sNCj4+PiArICAgIGludCBwY2lfYmRmOw0KPj4+
ICsNCj4+PiArICAgIGlmICghcmVtb3RlX2lvbW11X3RhYmxlLmVsZW1fYnlfYmRmIHx8ICFwY2lf
ZGV2KSB7DQo+Pj4gKyAgICAgICAgcmV0dXJuOw0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAg
IHBjaV9iZGYgPSBQQ0lfQlVJTERfQkRGKHBjaV9idXNfbnVtKHBjaV9nZXRfYnVzKHBjaV9kZXYp
KSwgcGNpX2Rldi0+ZGV2Zm4pOw0KPj4+ICsNCj4+PiArICAgIHFlbXVfbXV0ZXhfbG9jaygmcmVt
b3RlX2lvbW11X3RhYmxlLmxvY2spOw0KPj4+ICsgICAgZ19oYXNoX3RhYmxlX3JlbW92ZShyZW1v
dGVfaW9tbXVfdGFibGUuZWxlbV9ieV9iZGYsIElOVDJWT0lEUChwY2lfYmRmKSk7DQo+Pj4gKyAg
ICBxZW11X211dGV4X3VubG9jaygmcmVtb3RlX2lvbW11X3RhYmxlLmxvY2spOw0KPj4+ICt9DQo+
Pj4gKw0KPj4+ICt2b2lkIHJlbW90ZV9jb25maWd1cmVfaW9tbXUoUENJQnVzICpwY2lfYnVzKQ0K
Pj4+ICt7DQo+Pj4gKyAgICBpZiAoIXJlbW90ZV9pb21tdV90YWJsZS5lbGVtX2J5X2JkZikgew0K
Pj4+ICsgICAgICAgIHJlbW90ZV9pb21tdV90YWJsZS5lbGVtX2J5X2JkZiA9DQo+Pj4gKyAgICAg
ICAgICAgIGdfaGFzaF90YWJsZV9uZXdfZnVsbChOVUxMLCBOVUxMLCBOVUxMLCByZW1vdGVfaW9t
bXVfZGVsX2VsZW0pOw0KPj4+ICsgICAgICAgIHFlbXVfbXV0ZXhfaW5pdCgmcmVtb3RlX2lvbW11
X3RhYmxlLmxvY2spOw0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIHBjaV9zZXR1cF9pb21t
dShwY2lfYnVzLCByZW1vdGVfaW9tbXVfZmluZF9hZGRfYXMsICZyZW1vdGVfaW9tbXVfdGFibGUp
Ow0KPj4+ICt9DQo+Pj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4+
PiBpbmRleCBlN2IwMjk3YTYzLi4yMTY5NGE5Njk4IDEwMDY0NA0KPj4+IC0tLSBhL01BSU5UQUlO
RVJTDQo+Pj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+PiBAQCAtMzU5OSw2ICszNTk5LDggQEAgRjog
aHcvcmVtb3RlL2lvaHViLmMNCj4+PiBGOiBpbmNsdWRlL2h3L3JlbW90ZS9pb2h1Yi5oDQo+Pj4g
Rjogc3VicHJvamVjdHMvbGlidmZpby11c2VyDQo+Pj4gRjogaHcvcmVtb3RlL3ZmaW8tdXNlci1v
YmouYw0KPj4+ICtGOiBody9yZW1vdGUvaW9tbXUuYw0KPj4+ICtGOiBpbmNsdWRlL2h3L3JlbW90
ZS9pb21tdS5oDQo+Pj4gDQo+Pj4gRUJQRjoNCj4+PiBNOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPg0KPj4+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvbWVzb24uYnVpbGQgYi9ody9y
ZW1vdGUvbWVzb24uYnVpbGQNCj4+PiBpbmRleCA1MzRhYzVkZjc5Li5iY2VmODNjOGNjIDEwMDY0
NA0KPj4+IC0tLSBhL2h3L3JlbW90ZS9tZXNvbi5idWlsZA0KPj4+ICsrKyBiL2h3L3JlbW90ZS9t
ZXNvbi5idWlsZA0KPj4+IEBAIC02LDYgKzYsNyBAQCByZW1vdGVfc3MuYWRkKHdoZW46ICdDT05G
SUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21lc3NhZ2UuYycpKQ0KPj4+IHJlbW90
ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiBmaWxlcygncmVt
b3RlLW9iai5jJykpDQo+Pj4gcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VT
UycsIGlmX3RydWU6IGZpbGVzKCdwcm94eS5jJykpDQo+Pj4gcmVtb3RlX3NzLmFkZCh3aGVuOiAn
Q09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVzKCdpb2h1Yi5jJykpDQo+Pj4gK3Jl
bW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiBmaWxlcygn
aW9tbXUuYycpKQ0KPj4+IHJlbW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19WRklPX1VTRVJfU0VS
VkVSJywgaWZfdHJ1ZTogZmlsZXMoJ3ZmaW8tdXNlci1vYmouYycpKQ0KPj4+IA0KPj4+IHJlbW90
ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19WRklPX1VTRVJfU0VSVkVSJywgaWZfdHJ1ZTogdmZpb3Vz
ZXIpDQoNCg==

