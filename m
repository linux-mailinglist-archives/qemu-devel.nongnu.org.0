Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E96319F96
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:16:59 +0100 (CET)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYJd-0003GC-Qk
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAYGw-0002Ui-Lk
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:14:10 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAYGu-0005W5-BM
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:14:10 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CDE4Ki172350;
 Fri, 12 Feb 2021 13:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=f6CJZkCX9NWY7m9DCnHBjFIT7wxO34wQffc88Z9ugkU=;
 b=moDoy3WNe6RTFzZCBX59/Utes+yBfxzduOvtBhddbn+PnVNQwE85BoUzGMJVUxyUOWyY
 vIFqLfjth+M2BfUo8P2ffSgtmVeJuH9Krd+QoVS94w8gVNkgtmOKYjaLfbYR6xqoVOAy
 /bMVQsf8dvDJeOCIaGR8DKfsYxXOce5UwGxp06nuCpEiG+md7R7ALKBflKviLBgAL5Je
 GbM+NKaMFrn3LgNEcocmUVQAb18KQB7yKMlQaaraO8hLrUO7la5t4Eys8x9UIHjQwr07
 /iZRb+RoyZ4SgTv2yxDv+zsLgjkG8MDSRWjzbRogWQddVm5GygqcFr3i/Nba7yPjPP3e AQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36hgmau92g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 13:13:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CDApm1070106;
 Fri, 12 Feb 2021 13:13:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3020.oracle.com with ESMTP id 36j4vvq736-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 13:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1+CrepklzTo7M4f7HVSh3+wzZPugewDyfrFBTCNfORx9pn1B2w+lsFUs9SjyLD2sROliNn/F8lfp3pu7f+HRHMhHAouzUV2KuSzTueIznb1tjAq0wwS52flOesKtH9ZhaiwxF5boICYTPqQLs8lMDNcgilVdZ/qB94DUhOVMqN+oxAsApocN4U85836AVp6cYLV8uLtV2Tq+nwe79wB9hEbIWV9mHsF6OoGdGK/Uv1H75OC9KO3NLQKo/4bctq373W0Z4JmivX5ITHxYiqlYt8T7oX9nrfT1tj67BGc6b4XbyTWpTidYb8glWxY7QTHgqkDBqFQZuaFup1oP/OLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6CJZkCX9NWY7m9DCnHBjFIT7wxO34wQffc88Z9ugkU=;
 b=Ew8gfX2CdOdGKPvxIyz4eLfyuPKnFynn71WW1EVjek810Cw27L/ZO7UCtUVVhwcU/NYl9HSq0kAqhYyKSVYseNRPZXuvjImoYyegtQQr18JR0eHwimkjD8iTlUb0uuTUG/cn3qttQS4R2NFLCxe4BxXGSIP0UpExma3VehEquG9GOmB+RdXSEd+MBXTUQhaeQe4y0hPZgGLGHFAExTpo4FHUzTjWZSTsqsHlv3j+r/aG2rfWbZ8IgmfP+CWApE+TvALIOw0dSAS5u4gIM4t4Hilf08xbbMmIXClZ01vi/S3YQ76C9GaRqB69ZL2Y7mCOO3vJoSnfRuxCTe8w8Kjjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6CJZkCX9NWY7m9DCnHBjFIT7wxO34wQffc88Z9ugkU=;
 b=GXUg6blPMzYirkbICm/CRqpSnEvFebuOqblvteMBf5IL1io48mUgr9qpUKTj2VL0jenFXlBr+zc05iS3WN9ezGk1z5Yuhh0NYWPL+dGv5fF0SVyk99E16WBky+cfYsAfIo0N2IzzWGscdgUxWritbUrWbUtvRuR92Gjqs2CBxww=
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4559.namprd10.prod.outlook.com (2603:10b6:a03:2d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 13:13:53 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3846.030; Fri, 12 Feb 2021
 13:13:53 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
Thread-Topic: [PATCH] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
Thread-Index: AQHXATB5GYyp6Sd0T0iwGhSktAzGHqpUXsYAgAAGvYCAABhigIAAAYoA
Date: Fri, 12 Feb 2021 13:13:53 +0000
Message-ID: <82D28BF0-0CBF-4CE1-9989-CF7E48AA1E20@oracle.com>
References: <cover.1613128220.git.jag.raman@oracle.com>
 <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
 <20210212111658.GF1340027@redhat.com>
 <0418D7C5-AF8F-446A-910D-3196124300AE@oracle.com>
 <47fdd0f2-1de3-18f7-70fe-0f6882873baf@redhat.com>
In-Reply-To: <47fdd0f2-1de3-18f7-70fe-0f6882873baf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:8d4a:9edb:c692:c34e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e0305db-df1d-498e-7094-08d8cf580bad
x-ms-traffictypediagnostic: SJ0PR10MB4559:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR10MB45596B48C69A67FA7333F309908B9@SJ0PR10MB4559.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Y/USBGjmjk0IepMmJgHS4v3US1ApEyb1O/mvWKrUlKqU7wO8JMqagO86Di7ijWKgSLmfli8AnvAGVchSKdvfdQ7lE9p9LPm/QEaT/OU1l+0ZX35u82kr/tI4Y1HkyMmXAuQf3il8pYJeBjXYCnF8rbI0mSy71FNAgcJYLITQLVdWtYiwOttgJJUljfhVJoAEE76DlYAMj8M6WXxhss+VlZ8cW1FF43S2P1dcfWBg0i6po1XsFcPRG8cvqE6cukpmx6qHIPYlfxW+qfkzLCL2MmrgpfbJX1Rp1skwqaNkOttdN2ftcssPwO6/9Ex/45XBz6OjxcEFMnTjvQNHBkY+8f2/hwO3+TdCDYdoAkQbYAqhygEe3Lollb7xGXjj48EMTJwkz4GJsz8aTmbQP8x73NISBWdyralPfmRZZXc/j5OfBs/oUy4egE+blWPeAhV6XVKu6z0a7f4W1opm/p0zmSXwmL+1mjD+3Kgy6VRVvNzE3A97RJ+oV3YJPApvOjtc027AsWoEWTaH7tQQhsFO6r3NsYEVcHU6/o72u5NRgNiezay19f+H7DThI+mATfOowFY/hrHRyTjL000qb3efQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39860400002)(396003)(376002)(66946007)(36756003)(76116006)(186003)(66556008)(66446008)(478600001)(54906003)(71200400001)(2616005)(44832011)(316002)(6506007)(83380400001)(53546011)(66476007)(64756008)(5660300002)(33656002)(6486002)(8936002)(8676002)(4326008)(2906002)(86362001)(6512007)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dXRkTENnaGw0dFFSNkp3QUF5QXZMUmhsZ2JZWURJenVIQlh4Y2RkcUZzTGFP?=
 =?utf-8?B?VjlkMjlUNUlsc2FUWUtvSjlxUnl2Y0hXek81b2xDYmtVWmVkYTJhb0s1bnB6?=
 =?utf-8?B?MFFkR3dBY3ByQzRBYzlJTk9MRHZMcFBtWXMrcmUwMElrR3ZsTzg2QXhjMHRI?=
 =?utf-8?B?SWdkOXQyS2U1S2JJTEtqcEZZQTUvallqbzBHQ2o0NjNVVmE5TVFqeG9LTVVV?=
 =?utf-8?B?LzNwV2I3NnpjV2NUb0I1R0dPbXp4MjRLQmdyMFdPRjVtSDRNVE11OWJvWEtG?=
 =?utf-8?B?c0orUUpPQUN1Z3FkZGVTajVBRUZiR2VnSnZuMU0xKy9Oa2w3a0Zma2srT3cx?=
 =?utf-8?B?eFJ5OWZyUVFaajYwK2hiVWlmaEIvb3pvVmVKWVJjN3VjYmRYT09NOUZYZ0NZ?=
 =?utf-8?B?azlZcFdScVJ2WDlkVVRMakdrUE1zZlpoeFU3cGNtM21PMzlaRC9vUVdoZGVz?=
 =?utf-8?B?YU8rVDBVcXN5Y2U5V2lWQ1dkeExYdHFaVUtrZGh2N2luRDhKRkVIUzliTjBM?=
 =?utf-8?B?RVRpL0EybGdyclRHMzI0a1N6ajhZNVNmdk1YcDcxUVNYeXIxa2FQcUZTOXBH?=
 =?utf-8?B?VlhjR1lMeS9saFR3N3MvQzhnVENSS0NIY010YldOMjgyL3lxZVBpeXJVNzNW?=
 =?utf-8?B?emRFLzUwV2FjVWt0Z3lZYTdoTmZPYzdoQjM5SlIyY2d6ejloUVJSY3R1TGdJ?=
 =?utf-8?B?cDBCWlNuNDNJeFh6dTZCU3VORE1tRE5xVE5CRHZMV3N6L0Z5aUpFa29Ob3dr?=
 =?utf-8?B?SnZaMTl0b1JJKzBkd1VGS3JTTHdCSkl1cDFtV3Z3MG9Oek1yZ3hwUnRhUFRX?=
 =?utf-8?B?NUtGenFiQ3lOSC84M3g2YnB4Q2x0UTduVURuSHU5Y0FpS3o1S0crUjlidTBL?=
 =?utf-8?B?TlJoTGlTZVkrbDZudXZ4TmxKNGMyNzlkZHIxTUFVdVlqR0x2T21UaTlWSUdS?=
 =?utf-8?B?RDNmUUZORTlJRE14ZW9WcVRMQVg3WjJidytRM0VtUmlOOUk1TkV6OGZseGYz?=
 =?utf-8?B?U05RQmVxZDlLS2tWcWE0M0p2aGFEdU92S3FMSVBZdWFPc3N2dGE4S29sZEh2?=
 =?utf-8?B?Uy90dlk3WnRiTzBRNndVSXFjbENUV1ZoQmtud3FtVHpyOUdWMmUrbjRvUkEx?=
 =?utf-8?B?NlN1LytYc2FzN2JCM2k0NmFmSjBubk4zeDhNaHNDVUFxcjFGUFg3Y1N2Z2pX?=
 =?utf-8?B?OHBTRlc1SEVDVVJhWUNiVjJhSnRkMzNWckhuZnE3c3FjTnNtb1lsdUN2eXpr?=
 =?utf-8?B?UWdWMFpQUEt4eW1wS05Lblh3VlVUZVdIQ3NZQmdsTTVQeGlwTWUzRy93Umhr?=
 =?utf-8?B?WVlwUUs3RkhBK21BdGNsaGhTY1l2MUNDQ3JxNVlETU9HaDZRbDN2WVFtUFZU?=
 =?utf-8?B?MXliUU94OW9GejZmdkdoNG94K254cERwdWpESmhRaS9wS2F6Q1BxNnZRc3hN?=
 =?utf-8?B?djZxbDhOM3VDRWVXRkVNVVR6WU11Mmd6ditrYTdhRnFhQkx5UHhvQno3OUVO?=
 =?utf-8?B?cVM4Vjk1OTU4aHJFTHNtNzJtZkNxVnhJK0U3cUpzY3E5cmlXbTFaMUQyS3JE?=
 =?utf-8?B?dk1TNWkveDN5aGtpUXpsL2NzN0lLQXZDcG05MVdKOFRKWTByZVY3VllDNEY0?=
 =?utf-8?B?R3d4eEd0L2lYMWFLRndlUmNUM2ZXdVlYcFZQbWhYdXUrZDQ3R0FycDk2cVdN?=
 =?utf-8?B?T0IzVEN0OTFYRXhRb2pITFFvYnNDQVMzWDlWZVRJMnhJRkhtakVtak1mL1Rv?=
 =?utf-8?B?akxzMU5ZWUIzRkQxNy8yeUxid09uanoxYUhqdUJxODRjNWtPOG50RWc5eGI1?=
 =?utf-8?B?VDg3bDVMWUI1VjBDdTlObVJ5WDNsSzltdE54cU1lVHBUY1ZGUEJoNEJvSHpz?=
 =?utf-8?B?aGV5NUlEOGpESDhiRlZWZ21YQjM1VHpIYnhzNk9abktwcHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <552C498E86CFD644875598AEE8167332@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0305db-df1d-498e-7094-08d8cf580bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 13:13:53.2083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BrJtRLxKMJFBySIqs8hKYjeGCTwx9eARM3tIT4Vtbh0BpnIorO/WdG0QzlGFhQvrM3L3Z8wTrUsq7rqHgIeqWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4559
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120102
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120103
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDEyLCAyMDIxLCBhdCA4OjA4IEFNLCBFcmljIEJsYWtlIDxlYmxha2VAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyLzEyLzIxIDU6NDEgQU0sIEphZyBSYW1hbiB3cm90
ZToNCj4+IA0KPj4gDQo+Pj4gT24gRmViIDEyLCAyMDIxLCBhdCA2OjE2IEFNLCBEYW5pZWwgUC4g
QmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBGcmks
IEZlYiAxMiwgMjAyMSBhdCAwNjoxNjowN0FNIC0wNTAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90
ZToNCj4+Pj4gVXNpbmcgZXJyb3JfcHJlcGVuZCgpIGluIHFpb19jaGFubmVsX3JlYWR2X2Z1bGxf
YWxsKCkgY2F1c2VzIGEgc2VnZmF1bHQNCj4+Pj4gYXMgZXJycCBpcyBub3Qgc2V0IHdoZW4gcmV0
IGlzIDAuIFRoaXMgcmVzdWx0cyBpbiB0aGUgZmFpbHVyZSBvZiBpb3Rlc3QNCj4+Pj4gODMuIFJl
cGxhY2luZyB3aXRoIGVycm9yX3NldGcoKSBmaXhlcyB0aGUgcHJvYmxlbS4NCj4+Pj4gDQo+Pj4+
IEFkZGl0aW9uYWxseSwgcmVtb3ZlcyBhIGZ1bGwgc3RvcCBhdCB0aGUgZW5kIG9mIGVycm9yIG1l
c3NhZ2UNCj4+Pj4gDQo+Pj4+IFJlcG9ydGVkLWJ5OiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQu
Y29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9y
YWNsZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBpby9jaGFubmVsLmMgfCAzICstLQ0KPj4+PiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPj4+IA0KPj4+
IFJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPg0K
Pj4gDQo+PiBUaGFuayB5b3UgZm9yIHJldmlld2luZywgRGFuaWVsISBJIHJlY2FsbCB0aGF0IHlv
dSB3YXJuZWQgYWJvdXQNCj4+IGVycm9yX3ByZXBlbmQoKSBkdXJpbmcgdGhlIHJldmlldywgc29t
ZWhvdyBzbGlwcGVkIHRocm91Z2guDQo+PiANCj4+IEhpIFBldGVyLA0KPj4gDQo+PiAgICBDb3Vs
ZCB3ZSBzZW5kIGEgUFVMTCByZXF1ZXN0IGZvciB0aGlzIHBhdGNoPw0KPiANCj4gSSdtIGJ1bmRs
aW5nIHVwIGEgcHVsbCByZXF1ZXN0IGZvciBteSBOQkQgdHJlZSwgYW5kIHdpbGwgaW5jbHVkZSB0
aGlzIG9uZS4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCwgRXJpYyEgOikNCg0KPiANCj4gLS0gDQo+
IEVyaWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcg0KPiBSZWQgSGF0LCBJbmMu
ICAgICAgICAgICArMS05MTktMzAxLTMyMjYNCj4gVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8
IGxpYnZpcnQub3JnDQoNCg==

