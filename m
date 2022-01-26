Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BD49CDC4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:17:56 +0100 (CET)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCk3X-0006tY-Js
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:17:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCjzd-00042u-4J
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:13:53 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCjzK-0008G5-RY
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:13:37 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QETC3o019615; 
 Wed, 26 Jan 2022 15:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XgRsxxNqoOmcGLjKs6ncEZmYQYv7Pb/5C29gkm46xgo=;
 b=m3e3VSweAyOO7raJOgX1x0cqOT+bKXVfKnRRaRfdryED77pRHGEMO5SlzznFwFRN7H8I
 SBttwhfU1bKrZdbHsstNqJeqerOXXdhscDWlc2KKcPaLs006xlwhGlSBTrS/uyHBdHVZ
 VG/rRis08PMIihFPiqNquTKuTAUU2L8wH7wAgcwSkdZIIfjc9qBVYLzN1vGst+j/w0Cc
 rHfgckMlEw+TAJzDRr60XXihU944g2qbm+elaD+qSXC/a8h/p5dS60SV+/Ozv7cMOpld
 ZnZgARmy47UF7OPHGPhrEj/AUwW0jMMQCR6rfWpjJMswN9eMRBLBTIU2JvAcOx9JKvtw Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7axf6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:13:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QFAU2u115097;
 Wed, 26 Jan 2022 15:13:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3020.oracle.com with ESMTP id 3drbcra1ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyUCngtPwBfIEBPtPgGTarakch0SOSSOfeG91OssmTSTbs0gVZHBnkr1YH1RlgcVl0Vt8JEcolyFRip9hChluSJ2GOE535mRKp1UySoKt7LBWCLBq+W77qCqHw1LnfiYgU7/NAMmlGpu5F1etmrfOH1fd5cKp23kwpDcYTKrluKudZ1HzvCLJkoGH5onNJHICJ3ltAcHGvIn/NLgR0+dYkbG9xJ1CskDyGK6HsyJWEVRtiHdKUTSgPwD7Lpkye0Xw+KMBFU08SWQJlWwfWWdAh+fZv30s7P3QiG0Cyid3AycvqqwCjUK6w56+Q146W8vXuFmFE8BN8ar0hTAQ+TYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgRsxxNqoOmcGLjKs6ncEZmYQYv7Pb/5C29gkm46xgo=;
 b=bQqy/8HH7FpM+6W4RnduQ8yXkOUApiIj9SklLzGDKnvCGospe/4OX9/nxZzz/4rNtQFssT19a0Pdd16V1hWc+4PYViNywE/2SLM7oP8zKjdG7l1xw0Ydl82fX6NJudUE+wfh8PGSHox4OLmO2dSTMlNmbnW9YTWnT4XT4l4PSLC2DokFLJdpOQyUNGdn3b8Gcam/GN0WAexNPF6aTR+DHNK5iwZK73ymlcbQq5Z1eD7d6xg7P17orH8osH/J5E1x5SKWTON4K00oOUSgK5aVdNeM3ss3YsTwrJcSzptTVI6ZI97Z4ZSG9VClVy4UfwDSdFeCNF6JsZbBSsRM6jg8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgRsxxNqoOmcGLjKs6ncEZmYQYv7Pb/5C29gkm46xgo=;
 b=fUnakXvo87HqR9g/TqO2W2sBkGSgOvUeV+K3nzDWo3Gg4NDIMkItqw5Y3wrXuDJYICrSWeVIo8QeMORly8jNTt+gDjmU7WbdP6NO2Rn7XsJC4xYl1STadfQ6g4qVrlcG+3BJdOE59veCl4CLI8DKq/IJXYU3Yv0Am3se/SPjqmg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR1001MB2189.namprd10.prod.outlook.com (2603:10b6:301:36::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Wed, 26 Jan
 2022 15:13:25 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 15:13:25 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 05/18] qdev: unplug blocker for devices
Thread-Topic: [PATCH v5 05/18] qdev: unplug blocker for devices
Thread-Index: AQHYDX14Pl84DrvNRkGSqpb/pIT4EaxzkTmAgABHpQCAATt5AIAAXzQA
Date: Wed, 26 Jan 2022 15:13:25 +0000
Message-ID: <2BAB763D-C4A5-408A-A5BF-B69B95D940A6@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <5ad3f47f9ed507211fa8db5b8c36b9d32413bbbb.1642626515.git.jag.raman@oracle.com>
 <Ye/Qe86YifZB/AiD@stefanha-x1.localdomain>
 <4B7C4ECE-8A8B-486B-A66A-983FDD2D6223@oracle.com>
 <YfEVOKTeMgaD/Nh1@stefanha-x1.localdomain>
In-Reply-To: <YfEVOKTeMgaD/Nh1@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53920c54-36ef-4531-4d6d-08d9e0de6638
x-ms-traffictypediagnostic: MWHPR1001MB2189:EE_
x-microsoft-antispam-prvs: <MWHPR1001MB2189107E4EB3AA7AD031CA8390209@MWHPR1001MB2189.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6EhYjlIBlAlbBb9hgrGJu6vdbEtr6X2mT05NmshNU6YwjMapCPIv0GSYeHeIpgZGIEpLD2JLIQwNGoDZ4R0OQVRUfEfxHOp4aGBoeJcx1E3MYORHWEb5Dykjkh2YnuavAEjnL7RqQddJRwkg4sp3DeJ4wpDskKJSpG0rkQhyd3MrhIDaXw5pEGOy7fUc2XEVHZw/XeCncHYHto0at3VRU3YRSpb0gNdCM2es0/C92k9KRzxMBUeWobtyi8rTPJabBLKUNd6l975DUqGB4nRRKe1Y6iEEXjnDnGEsj98Fh5XEJODWlXClfP24xdkSAJLOAf89AuiW80veN3ASRpYwnjSlcDaYkEd2nxi0woGxRRGOySaua7a3bvLrwdxMThdrwT0vTgC7w03EBfXO0CKkO7i9nEri1kVyBnRPVuHVVj8yjhcjosG0PK38xlQb+D2U+1dygMZb+qvxb++FCbFeD3KxnraqowyD7MicTK1NgMosSm/NcSsthin+JccPHajaUOtXxI/NRxBOKtUJqUYkUyS6ftRePPyU8e4uMYv0vfq0EGCMKQyZLdWos7SS1KabJA2v0L+WKhZagt1Dg2jPYEjnGMh6v0wz411hEdxZhfpNzxistGICrR7cx7NMae77rSTVu2eQcuyVe0P1sGPWfHvfLNZPxHdd3x4leEKUNLGRS0f/NpyBIUQxAmnzh2mmRUXiS9xt408R6+m6bIc1kgoz9UmT2qxPEW3FMjS41MXjNn5+6KjwEF8YsfspD3bu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(36756003)(83380400001)(6506007)(2906002)(44832011)(38070700005)(2616005)(71200400001)(86362001)(4326008)(53546011)(8676002)(5660300002)(316002)(6512007)(508600001)(76116006)(66556008)(64756008)(91956017)(6486002)(66946007)(66446008)(6916009)(186003)(66476007)(107886003)(7416002)(122000001)(38100700002)(8936002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGZ5NW0wb1I1VXdEWk9rYi9oYjNMVkc2cE1uR0h1RFBiTTlsaHEvc3Uya0lz?=
 =?utf-8?B?dGdHQU9WMThSaGJrTUVYTUszbTlzSko2cDdQdHIyVGFTTXFnanBCRGZOQ0tH?=
 =?utf-8?B?RGQzbXYzV2FsWXZsWE84eFZBZmlDWmdvK0IvQ201d1l4eTRaN25PY3FzRUk5?=
 =?utf-8?B?dmkxU1VmT2JWdFozajJUbXB5OHFNQnFPa2VwRVRCRkRBVEFla1NwM3E0Y3ho?=
 =?utf-8?B?cFROazVsT2xJZlBLY3Vvb25uVWlyVWUrdzAwNCt3cll3ZnpDcUJlbkloZkdH?=
 =?utf-8?B?dEJ1MmNubm9Lczd4NzlHWFN2Rk5zK2hXR1lyZm9GZFUzdE5HNHhVRWNQWnZN?=
 =?utf-8?B?Y1ZHOGN1M2FPaTBjMDVQd0FKY0o1OGlCN2VYVFR2c2NtWGUzMU9naktzRUQ1?=
 =?utf-8?B?KzMra3dZeWwvSDhSWGp2UndRMGFNV2tmSmYwMlYrK2xFZ2pBUmhDaEcxSjAz?=
 =?utf-8?B?YXdHOXM1R3pYQkJYNlNBZk9iR1phUFY2RG5tV0YxRE9EVGRQL0MwLzZXQVFm?=
 =?utf-8?B?OUNnS0hzQVFFK21Wa0UvdGpadVRXeEFYK1NZZzVDcVFaMThYQUlrZGRQV1Ey?=
 =?utf-8?B?S2oyZ3FUUURlemYvemwxN0pxK0NXZ0l6b3dqWFpHbVZGTXQzK0ovSUxZcUFY?=
 =?utf-8?B?TFhYWUtSYVRIdGhmSkVOeE50YmM2YTF6WC85bklIcXlkSnhlb21qaEUydTdD?=
 =?utf-8?B?Yi9ZNHBuNllYMTl2RnNjdFd1bXpCODBRZFZSUkFQQmxDNS9nZWJJTWxJWUdx?=
 =?utf-8?B?ak5rMlZqNm15ODdqNys4T0FvdElnbVUxbTRRNmFUS2NCU0doWENQMlBzWnM5?=
 =?utf-8?B?aWZOYnRmdnMyMzNiZ0NGeFNOY21RUW1zbkVGL0RjVDBQVWZnK3RBMnAxdk41?=
 =?utf-8?B?Vm1tTGI0eDFubGgyUitMd0ZnMXVnT25YaVBqL21uQTBuQ3Naai9RcFNtN3la?=
 =?utf-8?B?dXNCSmhZSDNLcWlXWjh2RGRzNktWa01DZ0ttMUV5d2loYmlueVNRZzNmTUl6?=
 =?utf-8?B?ZkdhWXNvTFBtQ1lMMEUwTFFrbjNwZHZLbnBKaUk2M0tyZjFqUlNPSXdXQ1lK?=
 =?utf-8?B?MVRxYzFRQnV3RnVxM2NQanMxV1J2OFlEWGM2UUREaHdUcURHZ2FDOFNvbmxJ?=
 =?utf-8?B?akR6cDY3aWIvTWxQclZOZ1hyajZyYVdoaGpHV3JpNFZiTEhJeTF1VW5CYkdw?=
 =?utf-8?B?eDhhTXJyZ2ZySnJ4OVhwQm5RYUpxaGE0eWorNDl6Y0F0WHVXeUg0d0xNMXor?=
 =?utf-8?B?U09iN2ZXZzVvOGllVm8wYmdUdGloSkMyQVdQVzdaZVA5Q3A1bjg2VDdoczhZ?=
 =?utf-8?B?ZFRuVHVlZFk1L2NZSXFYQzBIZkE2ejArSUxmdG52YjdRODNSTnlpY0twNTZB?=
 =?utf-8?B?V1FydUhieVk4Y0JDNStNQmNQKy8xZyt0TVp5QkRBTnRQZ0RUNEVVSGlEWEkz?=
 =?utf-8?B?RVpLR01hb1FCWHFrbTlRdDMybFNFampMT3cvemJ6cnVGL3RVbmJORlBxOEFF?=
 =?utf-8?B?TTI3bmlkemdoY204YkoxQVR2VTBJN0lvQ3FFVGMxdDA2TXZtSW1XdmlUcnNK?=
 =?utf-8?B?Q3hUNzJKSFM2RHB5MjZyQjZXSVQvRmR0SUg5cVA0OUNHQ2FzSEZJT1lJdlZ6?=
 =?utf-8?B?cUo3TkJHaURGVCs4QTJhaEtGb3p5NXBrWGg5WFBDV0lGWTNqSWZTcXZLZGNt?=
 =?utf-8?B?QWtwTndyaG9mQ2UxZDJSMFI2clovR3cyZ3NnYWJJWnlpSkIzNWlHVjhCdHlz?=
 =?utf-8?B?OW8xK3k2ZUk2N3NqM3JXTWpaSjNUbVpkaE91aFh3dWVFd3p3NGdDejA0VG1Q?=
 =?utf-8?B?aVAwaURucEk3MytjalZTVGh0aWNQZ0pOUk1kcWIzek85QVZiRnMwQjFqMVU1?=
 =?utf-8?B?azJXY3dsUE1SZ0dTc0RScVZ3SEgwVkxJeXNienBtbEJvc2NITlpqNzNJYURS?=
 =?utf-8?B?Znh4eW0vV0hGMHJIT3RnL1JLQjllT0ptT0pMQWR5ZkpJaEE2ZGtydW9EOW44?=
 =?utf-8?B?T0xtOFExeTdtZXp4WCtOa09QeVhlK09IbGhUcmFwTzRKRUdBdGRjUUllRHFm?=
 =?utf-8?B?RWQvVzEwSUZDMWh2UUVsZUtWYWlyQTRha3hEY1FITDZNWHNOaDk5NUZnUHZh?=
 =?utf-8?B?enlScC9vT1NLLzBQd3c3bTA1TDNEc3dyYWs2dlIySG96YXRYZ2Z4blZwL0Vt?=
 =?utf-8?B?aHV1cUVaQlFHMU5Ya3gyd2V5bnluOXFrM1JHMXp0WERNdEt4d1NxS3JjYTZm?=
 =?utf-8?B?eG01QjdBbjZldFFjTkFyODdQaTNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDF86D1CDBE05B42952B7022ADE7905F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53920c54-36ef-4531-4d6d-08d9e0de6638
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 15:13:25.0869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AHN4kk57VfgHw1OcUm6n4U72w4HUfdKMmZ4jIzYWcKxFuBK7PWmszml/mbRJmyGsZ9VACIKt2zfQdajkqDI/iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2189
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260094
X-Proofpoint-GUID: hCx1AcemIVFP-nUu2BpTv19atfKbTcx4
X-Proofpoint-ORIG-GUID: hCx1AcemIVFP-nUu2BpTv19atfKbTcx4
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI2LCAyMDIyLCBhdCA0OjMyIEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBKYW4gMjUsIDIwMjIgYXQgMDI6
NDM6MzNQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBKYW4gMjUs
IDIwMjIsIGF0IDU6MjcgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6NDE6NTRQTSAtMDUw
MCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVm
aW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+Pj4+IC0t
LQ0KPj4+PiBpbmNsdWRlL2h3L3FkZXYtY29yZS5oIHwgIDUgKysrKysNCj4+Pj4gc29mdG1tdS9x
ZGV2LW1vbml0b3IuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
Pj4+IDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KPj4+PiANCj4+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcvcWRldi1jb3JlLmggYi9pbmNsdWRlL2h3L3FkZXYtY29yZS5oDQo+
Pj4+IGluZGV4IGVlZDI5ODMwNzIuLjY3ZGY1ZTAwODEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1
ZGUvaHcvcWRldi1jb3JlLmgNCj4+Pj4gKysrIGIvaW5jbHVkZS9ody9xZGV2LWNvcmUuaA0KPj4+
PiBAQCAtMTkzLDYgKzE5Myw3IEBAIHN0cnVjdCBEZXZpY2VTdGF0ZSB7DQo+Pj4+ICAgIGludCBp
bnN0YW5jZV9pZF9hbGlhczsNCj4+Pj4gICAgaW50IGFsaWFzX3JlcXVpcmVkX2Zvcl92ZXJzaW9u
Ow0KPj4+PiAgICBSZXNldHRhYmxlU3RhdGUgcmVzZXQ7DQo+Pj4+ICsgICAgR1NMaXN0ICp1bnBs
dWdfYmxvY2tlcnM7DQo+Pj4+IH07DQo+Pj4+IA0KPj4+PiBzdHJ1Y3QgRGV2aWNlTGlzdGVuZXIg
ew0KPj4+PiBAQCAtNDMzLDYgKzQzNCwxMCBAQCB0eXBlZGVmIGJvb2wgKFFEZXZQdXRCdXNGdW5j
KShCdXNTdGF0ZSAqYnVzLCBFcnJvciAqKmVycnApOw0KPj4+PiBib29sIHFkZXZfc2V0X2J1c19j
YnMoUURldkdldEJ1c0Z1bmMgKmdldF9idXMsIFFEZXZQdXRCdXNGdW5jICpwdXRfYnVzLA0KPj4+
PiAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnApOw0KPj4+PiANCj4+Pj4gK2ludCBx
ZGV2X2FkZF91bnBsdWdfYmxvY2tlcihEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqcmVhc29uLCBF
cnJvciAqKmVycnApOw0KPj4+PiArdm9pZCBxZGV2X2RlbF91bnBsdWdfYmxvY2tlcihEZXZpY2VT
dGF0ZSAqZGV2LCBFcnJvciAqcmVhc29uKTsNCj4+Pj4gK2Jvb2wgcWRldl91bnBsdWdfYmxvY2tl
ZChEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApOw0KPj4+PiArDQo+Pj4+IC8qKg0KPj4+
PiAqIEdwaW9Qb2xhcml0eTogUG9sYXJpdHkgb2YgYSBHUElPIGxpbmUNCj4+Pj4gKg0KPj4+PiBk
aWZmIC0tZ2l0IGEvc29mdG1tdS9xZGV2LW1vbml0b3IuYyBiL3NvZnRtbXUvcWRldi1tb25pdG9y
LmMNCj4+Pj4gaW5kZXggNzMwNjA3NDAxOS4uMWExNjlmODlhMiAxMDA2NDQNCj4+Pj4gLS0tIGEv
c29mdG1tdS9xZGV2LW1vbml0b3IuYw0KPj4+PiArKysgYi9zb2Z0bW11L3FkZXYtbW9uaXRvci5j
DQo+Pj4+IEBAIC05NzgsMTAgKzk3OCw0NSBAQCB2b2lkIHFtcF9kZXZpY2VfZGVsKGNvbnN0IGNo
YXIgKmlkLCBFcnJvciAqKmVycnApDQo+Pj4+ICAgICAgICAgICAgcmV0dXJuOw0KPj4+PiAgICAg
ICAgfQ0KPj4+PiANCj4+Pj4gKyAgICAgICAgaWYgKHFkZXZfdW5wbHVnX2Jsb2NrZWQoZGV2LCBl
cnJwKSkgew0KPj4+PiArICAgICAgICAgICAgcmV0dXJuOw0KPj4+PiArICAgICAgICB9DQo+Pj4+
ICsNCj4+Pj4gICAgICAgIHFkZXZfdW5wbHVnKGRldiwgZXJycCk7DQo+Pj4+ICAgIH0NCj4+Pj4g
fQ0KPj4+PiANCj4+Pj4gK2ludCBxZGV2X2FkZF91bnBsdWdfYmxvY2tlcihEZXZpY2VTdGF0ZSAq
ZGV2LCBFcnJvciAqcmVhc29uLCBFcnJvciAqKmVycnApDQo+Pj4+ICt7DQo+Pj4+ICsgICAgRVJS
UF9HVUFSRCgpOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCFtaWdyYXRpb25faXNfaWRsZSgpKSB7
DQo+Pj4+ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgIm1pZ3JhdGlvbiBpcyBpbiBwcm9ncmVz
cyIpOw0KPj4+PiArICAgICAgICByZXR1cm4gLUVCVVNZOw0KPj4+PiArICAgIH0NCj4+PiANCj4+
PiBXaHkgY2FuIHRoaXMgZnVuY3Rpb24gbm90IGJlIGNhbGxlZCBkdXJpbmcgbWlncmF0aW9uPw0K
Pj4gDQo+PiBTaW5jZSDigJh1bnBsdWdfYmxvY2tlcnMnIGlzIGEgbWVtYmVyIG9mIHRoZSBkZXZp
Y2UsIEkgdGhvdWdodCBpdCB3b3VsZG7igJl0IGJlIGNvcnJlY3QgdG8NCj4+IGFsbG93IGNoYW5n
ZXMgdG8gdGhlIGRldmljZSdzIHN0YXRlIGR1cmluZyBtaWdyYXRpb24uDQo+PiANCj4+IEkgZGlk
IHdlaWdoIHRoZSBmb2xsb3dpbmcgcmVhc29ucyBhZ2FpbnN0IGFkZGluZyB0aGlzIGNoZWNrOg0K
Pj4gIC0gdW5wbHVnX2Jsb2NrZXJzIGlzIG5vdCBtaWdyYXRlZCB0byB0aGUgZGVzdGluYXRpb24g
YW55d2F5LCBzbyBpdCBkb2VzbuKAmXQgbWF0dGVyIGlmDQo+PiAgICBpdCBjaGFuZ2VzIGFmdGVy
IG1pZ3JhdGlvbiBzdGFydHMNCj4gDQo+IFllcy4NCj4gDQo+PiAgLSB3aGljaGV2ZXIgY29kZS9v
YmplY3QgdGhhdCBuZWVkcyB0byBhZGQgdGhlIGJsb2NrZXIgY291bGQgYWRkIGl0IGF0IHRoZSBk
ZXN0aW5hdGlvbg0KPj4gICAgaWYgbmVlZGVkDQo+IA0KPiBZZXMuDQo+IA0KPj4gSG93ZXZlciwg
dW5saWtlIHFtcF9kZXZpY2VfYWRkKCksIHFtcF9vYmplY3RfYWRkKCkgZG9lc27igJl0IHJlamVj
dCBkdXJpbmcNCj4+IG1pZ3JhdGlvbi4gQXMgc3VjaCwgYW4gb2JqZWN0IGNvdWxkIGFkZCBhIGJs
b2NrZXIgZm9yIHRoZSBkZXZpY2Ugd2hlbiBtaWdyYXRpb24gaXMNCj4+IGluIHByb2dyZXNzLg0K
Pj4gDQo+PiBXb3VsZCB5b3UgcHJlZmVyIHRvIHRocm93IGEgd2FybmluZywgb3IgZnVsbHkgcmVt
b3ZlIHRoaXMgdGVzdD8NCj4gDQo+IEFkZGluZyBhbiB1bnBsdWcgYmxvY2tlciBkdXJpbmcgbWln
cmF0aW9uIHNlZW1zIHNhZmUgdG8gbWUuIEkgd291bGQNCj4gcmVtb3ZlIHRoaXMgdGVzdC4NCg0K
T0ssIHdpbGwgZG8uDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gU3RlZmFuDQoNCg==

