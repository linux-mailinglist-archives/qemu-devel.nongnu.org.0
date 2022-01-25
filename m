Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2349BB17
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 19:18:20 +0100 (CET)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQOY-0006vC-T1
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 13:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCQJa-0004ki-Od
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:13:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCQJX-0006D6-VI
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:13:10 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PGn5Q8008991; 
 Tue, 25 Jan 2022 18:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Y+dYRYSuQAi3B2eo0U4rOxbWxfjeDeFSzGMH9oRSR8U=;
 b=QJfFlY2/zWIBMjzexJi82OG9jw/+qifBkSp0bPI6STyZ1xRhKGySjmTHQL3ukmKgBhMT
 VYNj3rjd4O57/MinpJPAY0u7TB1rD2PtHYoMnEnM4vaHeDC05x7GFQ+hCNWxF/L96FqE
 8KgySTZyV0XWyAgMVjnaLxprN8A6JdTRbyXSzKoXSwNlAHpddN7Vgd6yE9mTYMFZ2+HC
 aT/GQt9tJ2RZPwiIrRJmhyWjqnkrdt8b6pgEq+iFRy+qOX468J9YsImzh4ruuXIpB3cX
 q4qV1NsGQYaVbyVX2V9swignYNaJiH41tWMqprNg5JH2hN2p7ruQxEKYJY9MBpT7++ml 0A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxvfktf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 18:12:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PIBIDm116986;
 Tue, 25 Jan 2022 18:12:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3dr7ygc1sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 18:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErybZXeF74Dt00jd/9SU9lezZxWI4nwVxEC1FEnjVUx7EIQfn56bjZfJUXrkAxO7+IRINenIQuC32P14DWFK50od4AwPk4X/yhhUBPJmN5sVEOsqgvmEDaZ6nSQgE71LNNC+XNtUo6xRi+Sjh1F2fBrP8628DDJhDgfWO8NOSJs6n3daVuX885Vk7VZrCy5QmY5AMzfJEaKf+qx50slpTih8ZTgtx9YZ5TSh3yllgdGWY1gsR2eOec5/xdA3lqrlXLAXEJhNvBOSFL+WPdGHoLgoM2ULZECjmp4a+Hdg4v9TDfTmFVZLlCNWBaY9niFVQv2jRKwaNsPRFCQKN19kvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+dYRYSuQAi3B2eo0U4rOxbWxfjeDeFSzGMH9oRSR8U=;
 b=Olq+Af75zEElnjLFROmCl6dF8LmWAoW2M6pzWGl3jDnbRWsuArgF3qCeNKssyYxrRksbAfcTGJmgzy59s/cbJo4VtsGW/Qb6EMETDlTrRc9Td+Kcn93UzqqGATpOnMf1vyGZ2HA5UgnqIk2x0H6cCjqv7x9CNwI2AtOZeg/bRy1B04E1Ar7QhuNTd2Qpwcs3K38z03r3Pd/8chaieg+UknAdFLoduCnh00xoWTwJZhyVviUoYN9Dh/D42NTwE6COV2Ylg64/kJEV9rGw4P/myer3JeSyE4Lg1lf9OBUCpLddkaZRaUrSMjNuZQ7tgshSJfIX/CkFMKRMe9p/pp0IIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+dYRYSuQAi3B2eo0U4rOxbWxfjeDeFSzGMH9oRSR8U=;
 b=EUqPYneVlstMjkcU5i9V+LqpdFS2kxl9f2aVlC0+U9EhULTBsn+f7EtaYvTI1jDQTPy1mk8TsJ9HqhASrwU5hk628ewFdpATamXjyThtUKmkv1w26RRaZF71s72Uavz+805vzs88ORtfCYv/R+6MkSSj8Ukd7qdHq6Stu5FeyG0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3482.namprd10.prod.outlook.com (2603:10b6:5:17f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 18:12:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 18:12:48 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Thread-Topic: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Thread-Index: AQHYDX16qjLDwrhDQUu+4szIN9Lq46xzks+AgACAhYA=
Date: Tue, 25 Jan 2022 18:12:48 +0000
Message-ID: <A037BABE-9424-4EBF-A1E2-F712DC8A89CC@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
 <Ye/Rz1bHJN2m9vCo@stefanha-x1.localdomain>
In-Reply-To: <Ye/Rz1bHJN2m9vCo@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14b44c10-4506-4e24-1772-08d9e02e4b66
x-ms-traffictypediagnostic: DM6PR10MB3482:EE_
x-microsoft-antispam-prvs: <DM6PR10MB34825DCF746BC4B363F4DE73905F9@DM6PR10MB3482.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I/lGHiBpcCEbChpC5lrN/sEs5X8yYDBmzdXrLaiWmEhIbGmthrLkBwfklAET8UFLHXXM0zYN4Q1NYEL3nUDwo/exBCWJpss8plZkiZtVG4fwTLSnjeOH8SA9HdG2i8G74dyquBxYvF6pc5kK2dWAEjkdOn00QzBj1gSHG2AwlOd7rprmu73+bMrgtBn1rW33uBXR/tTCxdDd8aizJb5C1mjXqL3fRYZWUWCKSqyg9x0t1is7TZSsGWCz31++e3NuZASovHKJe3h8FVe+K0LGKqMw/DhaFQz6kUcR6uTnIqGZvgBFzJVX1Er2mefeZk6Dv7M8F3hAvzGgBh9YWbGTPFRoFrXKmkLa0k+fkp9wJK4jkMy79AL6a3NvnLWYuVXELyC+IT2DzG2r899msF2eCvGe77aCb53kWk2MzPzevmadbgdvGLTIfgBZtkXpLDfs1g9I/T02qm+oaa9+40H4mEjAENiiyztiTTc4HCm6ErROrEILrmq4KQGzXla9yiLQP+RGUS0vOBMXpVgqp+NniYB48YeGabbECo1sdFluVYasXD5P8p9QS9xtfc04s6o58C8ZxBvZ5D2Lc3KAWxZ2egD0S6SE92XyXukzTQG7pphSRXp884a5wZm29pFDfaPGkL04KlG+9kx47z0Vwh62K8VaN2R/Ae3q/NLybI3BXMfAclUQA1l3srVkZCfxnb7T437UVNXOUMO4tr7Kg3sLOUgvKe27OcrwjudxKOfoWQ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(6512007)(6506007)(7416002)(4326008)(44832011)(8676002)(5660300002)(53546011)(38070700005)(86362001)(2906002)(38100700002)(8936002)(107886003)(36756003)(83380400001)(54906003)(91956017)(508600001)(2616005)(66946007)(76116006)(6916009)(64756008)(66556008)(66476007)(66446008)(6486002)(186003)(316002)(71200400001)(33656002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXBTQjk1S0UxSHZiWC8rY0FCdEVuMVdQNzVpKzNFTEd2N3VBeXkvN3Rib3gr?=
 =?utf-8?B?MEp4aFpubE8rUU1MZ0xZWDloTDdBd3J5Uzh0cGhzcFZJejlmK1BPZFI4dFk5?=
 =?utf-8?B?UEdTeWJvdlV3UTdEenVqT3hnY2p3Tnp0RXBFOVpVb2ZFcEtvOG9ZTXBtYW9Z?=
 =?utf-8?B?dVJZOWRtem4rYlF3WkpMSGg0MXJxZHRwSnc3NEUzQXlIZEUvdkFVNStwb1dk?=
 =?utf-8?B?QjJJTWF1RFkrSldIbnJvcWorQWpZbkNzNERlZExPdmJjclRvRmF3Tm1xcEZ5?=
 =?utf-8?B?Tm43SDQxTjA5SGdtRU05UE93UE9kcjVMSmd5M0c1eXlkUHlETWZ0Sm95ekhP?=
 =?utf-8?B?cTl6TC9xVHFEK1g2ZFlGd3lOdERmczlURjU2RWxONWVKVWhQTVJ4SlY1ZHVS?=
 =?utf-8?B?c2hvKzZ4WC9JT2lTdHQyN01NZDA5SVBWUWFMU1pjL3ZPQUdCdGFCWFVZQnBR?=
 =?utf-8?B?ZWJiT0R3MkFlOE9TcXp6cEsvUnkxclBvRUpjTUpFbjNheWFMRUxlRW0vdisr?=
 =?utf-8?B?ZWtmbjRZSWRya3JpNVYxQ3lSQS95Y25lQkQ4RlFvK2hWMG5DdE4yOGZsL1R3?=
 =?utf-8?B?dFZwME5NRCtjWmY4MUJtZk5EbDU5QjB1OE5OVHNWMEliY05STlZVb3Qycm41?=
 =?utf-8?B?ZndMMTVMZDNJWUFDNnBRamp0RUx0bmRJRFVmUUVRUGFVNk5MSDZJNnF1K1Jt?=
 =?utf-8?B?eXNkQUxyQlNyYVJzNFRQMGFIdEtCd25LZ253MG1vdGpxcFByY2JVNUg0SEdl?=
 =?utf-8?B?Nys4dllCU2hmWWJOWlBBK2Q0ZnV0eUFiUDdueVhDdkNwRkhEbGZiQ1pOTnlJ?=
 =?utf-8?B?SmtRejQzM203UlJtWGJ2NmRzVUphQm5aeHNiNjByNE9ZUHUwTnZWWjZWZGxt?=
 =?utf-8?B?TmpLbXdtZ1A4YVpmd0dNSTBoaHpWbjl2ZWE2K1A5Z0w2c0NYcE9NL3crUkVz?=
 =?utf-8?B?UjhobDFZRitXaEYwUEhuMjJzVjRGelNleHBjOG9PWisvY3E2TDEydlFRNFpz?=
 =?utf-8?B?R3c1L0hRZVQ0UjBXeFViTVNVM2pwOVlYbE1LRFVOVm40bmdOdVV3cVVVeVpQ?=
 =?utf-8?B?UFVzamtpQUpPVmltVGFwQUlHRnVtUk1QMFhQN0xVM1pQYkw3WU5GVSt1Znk1?=
 =?utf-8?B?Zks1NHc2TTF3VmZhYTNUUjB0VHVhMG5hQzJkeUhjYzFYTTlKQjVTWDBiSVFj?=
 =?utf-8?B?TmtSNXl2T0Q4UkRieHJMT3ZONmxpK3k5eFF5WEwrY0tzOS9VZlJhVzBYSUlP?=
 =?utf-8?B?WENnMmNzc3hlK2d5a3RucFA2WGE3dFhrenNOYVVLOTNJYzUxMFJPMHFaUThE?=
 =?utf-8?B?WVBtMjNGVmhsVjJBcFVqWnlKajFIMndFb2Vsa3VuNW95aUp4U3REUHE5NW0v?=
 =?utf-8?B?bm5yLzY0MFZqamF4WGc0dDZPR04rTDU4MHVJL2JnN0FkNEZRNncvdk1YZE1v?=
 =?utf-8?B?bFE2Rk9kVkxLMlpPcStxLzJNYXAxMDhMQlROQWtmKzBGRVpiVFVSR1NxL0M5?=
 =?utf-8?B?Mlo2Y1pWWUVTRU0rVVUzUFpqaTE0SkxsNEdYTzdXQnpXMWdKNUJBSDhMRldL?=
 =?utf-8?B?cmxOMmMybDV6cFpNTWpqMVdRVzZkQkFWdW9VK0oyd08xY1hEZkNyZjJWVCtS?=
 =?utf-8?B?RHdSZUNlR095SkdBNkpYVXQrNHVyQmFhVWl6dzVndXZtQTg2ZkQ4SXRveHQ3?=
 =?utf-8?B?RlZMd1lpTzY4a2NhVm5KaGJpZERNN0x6Y0JQOFJsRFA3VkxnUEtRZTRNcWdm?=
 =?utf-8?B?OG9Nc044dVJVVEdwZGZLZkJSTGoxN3ZxaWRaR3dZVzI5NWQ1UzhENk5vQUUy?=
 =?utf-8?B?UmJ5SW9vRXlQYlBmVEN3UmtHODY5Zm16RmZyaWluV3Yra3RSNXpGbHdTQ0F1?=
 =?utf-8?B?blVmbzFYOFdFbDFhNmJPUGpIWXBsd0RLMDdLdUZBNXpRVTlqdVBRSDEraXlS?=
 =?utf-8?B?b3ZZREFudlVRZUxCdGlTNXJXQ1EzZEE2UVRhWHRseGV0bHpJa2pLZkhHc1h4?=
 =?utf-8?B?R0kwTk93ZDVxdGpUSTdKdEN0OFRTZkNweW5palRyaXM2UW1abVloOE8zZ2RF?=
 =?utf-8?B?Vm5ZR0VlYXF5NUQyRDRBdFY4eEQ2SSs1S3IzKzZ5anRFWmtNTU56QWlVWmVP?=
 =?utf-8?B?bmtST0F3TGlMak9MY04vbzh1NTdqWWo1M0NVWGsxZExWTU5YaWUyK0loYytm?=
 =?utf-8?B?aVZ4c2MxUnc5dHdkZjNNYjNpL28vd0JkY2RRYkZRVUo5ZzArTGpZWWlMZVhr?=
 =?utf-8?B?aUdDa2RYV0Jnamw2SlVmWjZTa1NnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2534789807253B458E81D19B6D8CC981@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b44c10-4506-4e24-1772-08d9e02e4b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 18:12:48.6797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OjclpStjCcQe9NZYQetqndKpqLJHpJFNI2c3Pa3llBjY/cyAHOhy25JwMNAlh0ASerzfxO6c2xWFj+3W7G9Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3482
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250112
X-Proofpoint-GUID: URsWHSKfdSdtl8FxFWAPjxEeZA5nXAwC
X-Proofpoint-ORIG-GUID: URsWHSKfdSdtl8FxFWAPjxEeZA5nXAwC
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

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCA1OjMyIEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6
NDE6NTVQTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBBbGxvdyBob3RwbHVn
Z2luZyBvZiBQQ0koZSkgZGV2aWNlcyB0byByZW1vdGUgbWFjaGluZQ0KPj4gDQo+PiBTaWduZWQt
b2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4g
U2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5j
b20+DQo+PiAtLS0NCj4+IGh3L3JlbW90ZS9tYWNoaW5lLmMgfCAyOSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gDQo+
IFdoeSBpcyB0aGlzIGNvZGUgbmVjZXNzYXJ5PyBJIGV4cGVjdGVkIHRoZSBkZWZhdWx0IGhvdHBs
dWcgYmVoYXZpb3IgdG8NCg0KSSBqdXN0IGRpc2NvdmVyZWQgdGhhdCBUWVBFX1JFTU9URV9NQUNI
SU5FIHdhc24ndCBzZXR0aW5nIHVwIGEgaG90cGx1Zw0KaGFuZGxlciBmb3IgdGhlIHJvb3QgUENJ
IGJ1cy4NCg0KTG9va3MgbGlrZSwgc29tZSBvZiB0aGUgbWFjaGluZXMgZG9u4oCZdCBzdXBwb3J0
IGhvdHBsdWdnaW5nIFBDSSBkZXZpY2VzLiBJIHNlZQ0KdGhhdCB0aGUg4oCYcGPigJkgbWFjaGlu
ZSBkb2VzIHN1cHBvcnQgaG90cGx1Zywgd2hlcmVhcyDigJhxMzXigJkgZG9lcyBub3QuDQoNCldl
IGRpZG7igJl0IGNoZWNrIGhvdHBsdWcgaW4gbXVsdGlwcm9jZXNzLXFlbXUgcHJldmlvdXNseSBi
ZWNhdXNlIGl0IHdhcyBsaW1pdGVkDQp0byBvbmUgZGV2aWNlIHBlciBwcm9jZXNzLCBhbmQgdGhl
IHVzZSBjYXNlcyBhdHRhY2hlZCB0aGUgZGV2aWNlcyB2aWENCmNvbW1hbmQgbGluZS4NCg0KPiBw
cmV0dHkgbXVjaCBoYW5kbGUgdGhpcyBjYXNlIC0gaG90cGx1Z2dpbmcgZGV2aWNlIHR5cGVzIHRo
YXQgdGhlIGJ1cw0KPiBkb2Vzbid0IHN1cHBvcnQgc2hvdWxkIGZhaWwgYW5kIHVucGx1ZyBzaG91
bGQgYWxyZWFkeSB1bnBhcmVudC91bnJlYWxpemUNCj4gdGhlIGRldmljZS4NCg0KT0ssIHRoYXQg
bWFrZXMgc2Vuc2UuIFdlIGRvbuKAmXQgbmVlZCB0byB0ZXN0IHRoZSBkZXZpY2UgdHlwZSBkdXJp
bmcNCnBsdWcgYW5kIHVucGx1Zy4NCg0KVGhlcmVmb3JlLCBJIGRvbuKAmXQgdGhpbmsgd2UgbmVl
ZCBhIGNhbGxiYWNrIGZvciB0aGUgcGx1ZyBvcGVyYXRpb24uIFdlDQpjb3VsZCBzZXQgSG90cGx1
Z0hhbmRsZXJDbGFzcy0+dW5wbHVnIGNhbGxiYWNrIHRvIHRoZSBkZWZhdWx0DQpxZGV2X3NpbXBs
ZV9kZXZpY2VfdW5wbHVnX2NiKCkgY2FsbGJhY2suDQoNCuKAlA0KSmFnDQoNCj4gDQo+PiANCj4+
IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvbWFjaGluZS5jIGIvaHcvcmVtb3RlL21hY2hpbmUuYw0K
Pj4gaW5kZXggOTUyMTA1ZWFiNS4uMjIwZmYwMWFhOSAxMDA2NDQNCj4+IC0tLSBhL2h3L3JlbW90
ZS9tYWNoaW5lLmMNCj4+ICsrKyBiL2h3L3JlbW90ZS9tYWNoaW5lLmMNCj4+IEBAIC01NCwxNCAr
NTQsMzkgQEAgc3RhdGljIHZvaWQgcmVtb3RlX21hY2hpbmVfaW5pdChNYWNoaW5lU3RhdGUgKm1h
Y2hpbmUpDQo+PiANCj4+ICAgICBwY2lfYnVzX2lycXMocGNpX2hvc3QtPmJ1cywgcmVtb3RlX2lv
aHViX3NldF9pcnEsIHJlbW90ZV9pb2h1Yl9tYXBfaXJxLA0KPj4gICAgICAgICAgICAgICAgICAm
cy0+aW9odWIsIFJFTU9URV9JT0hVQl9OQl9QSVJRUyk7DQo+PiArDQo+PiArICAgIHFidXNfc2V0
X2hvdHBsdWdfaGFuZGxlcihCVVMocGNpX2hvc3QtPmJ1cyksIE9CSkVDVChzKSk7DQo+PiArfQ0K
Pj4gKw0KPj4gK3N0YXRpYyB2b2lkIHJlbW90ZV9tYWNoaW5lX3ByZV9wbHVnX2NiKEhvdHBsdWdI
YW5kbGVyICpob3RwbHVnX2RldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+PiArew0KPj4gKyAgICBp
ZiAoIW9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZUEVfUENJX0RFVklDRSkpIHsN
Cj4+ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgIk9ubHkgYWxsb3dpbmcgUENJIGhvdHBsdWci
KTsNCj4+ICsgICAgfQ0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCByZW1vdGVfbWFjaGlu
ZV91bnBsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnAp
DQo+PiArew0KPj4gKyAgICBpZiAoIW9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZ
UEVfUENJX0RFVklDRSkpIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgIk9ubHkgYWxs
b3dpbmcgUENJIGhvdC11bnBsdWciKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0K
Pj4gKw0KPj4gKyAgICBxZGV2X3VucmVhbGl6ZShkZXYpOw0KPj4gfQ0KPj4gDQo+PiBzdGF0aWMg
dm9pZCByZW1vdGVfbWFjaGluZV9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0
YSkNCj4+IHsNCj4+ICAgICBNYWNoaW5lQ2xhc3MgKm1jID0gTUFDSElORV9DTEFTUyhvYyk7DQo+
PiArICAgIEhvdHBsdWdIYW5kbGVyQ2xhc3MgKmhjID0gSE9UUExVR19IQU5ETEVSX0NMQVNTKG9j
KTsNCj4+IA0KPj4gICAgIG1jLT5pbml0ID0gcmVtb3RlX21hY2hpbmVfaW5pdDsNCj4+ICAgICBt
Yy0+ZGVzYyA9ICJFeHBlcmltZW50YWwgcmVtb3RlIG1hY2hpbmUiOw0KPj4gKw0KPj4gKyAgICBo
Yy0+cHJlX3BsdWcgPSByZW1vdGVfbWFjaGluZV9wcmVfcGx1Z19jYjsNCj4+ICsgICAgaGMtPnVu
cGx1ZyA9IHJlbW90ZV9tYWNoaW5lX3VucGx1Z19jYjsNCj4+IH0NCj4+IA0KPj4gc3RhdGljIGNv
bnN0IFR5cGVJbmZvIHJlbW90ZV9tYWNoaW5lID0gew0KPj4gQEAgLTY5LDYgKzk0LDEwIEBAIHN0
YXRpYyBjb25zdCBUeXBlSW5mbyByZW1vdGVfbWFjaGluZSA9IHsNCj4+ICAgICAucGFyZW50ID0g
VFlQRV9NQUNISU5FLA0KPj4gICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFJlbW90ZU1hY2hp
bmVTdGF0ZSksDQo+PiAgICAgLmNsYXNzX2luaXQgPSByZW1vdGVfbWFjaGluZV9jbGFzc19pbml0
LA0KPj4gKyAgICAuaW50ZXJmYWNlcyA9IChJbnRlcmZhY2VJbmZvW10pIHsNCj4+ICsgICAgICAg
IHsgVFlQRV9IT1RQTFVHX0hBTkRMRVIgfSwNCj4+ICsgICAgICAgIHsgfQ0KPj4gKyAgICB9DQo+
PiB9Ow0KPj4gDQo+PiBzdGF0aWMgdm9pZCByZW1vdGVfbWFjaGluZV9yZWdpc3Rlcl90eXBlcyh2
b2lkKQ0KPj4gLS0gDQo+PiAyLjIwLjENCj4+IA0KDQo=

