Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAAB319D82
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:43:36 +0100 (CET)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWrH-0007U6-Dh
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAWp2-00065w-5V
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:41:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAWoy-00070w-0H
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:41:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CBeA6N172357;
 Fri, 12 Feb 2021 11:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Cv47Wd+PZhW9XRHDDGkJ+a7o6lWZi5RgLXXKxPoquzk=;
 b=YRcTG8iSBDFwAqiMuPLTZdJDLvyqChVDqJEp5zhssf23q/HJiXTioXxx+wZLVFr0+sua
 E8csaZ/OYPXTNLXl6WQX4flRP05bqaAOM19o1LvdkhPtoruxE3HWAmvbf1my82HblG0N
 uGmxOkUR+iPM/hSKmzk335Akrg9hrO2/2apIryE9OH/1fTOlRyKZ6mMdkBidcNrEY3Ex
 0ckPCDjLvLh+1c6oXWQtvuZv3Fdv2Sx3ETj0wvXxS8HreWguEzWVh5o+oDR0NPVFoGXn
 waoWZF9s4C2zDWTmmIrEgEP3f3N3lbL0Q9dTkD342wBKtWDxcpznXPUe84Fo1zyr/HNj Aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36m4uq1e9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 11:41:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CBeqnm147787;
 Fri, 12 Feb 2021 11:41:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3020.oracle.com with ESMTP id 36j4vvm8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 11:41:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6C3LcS9RlLq44QL2hvYyqc0rRHAOofi8nfAnW56Gc3fJ1zOQ7KqlxAq1/7P93ALxgHh7uUcxn8BSZ4qA0ZE4BsqL25HJzx6EqbK5+IwHZ1b+suImdTNody4iAzFXiZj0UxY3UbmmeUWoSqXSc1UEzxDTb2ixc1PeMP5wHVKgah7zEf2SpnizSLfXXxJZBwIJQeE285XoysyJ8zbGbbUxJ//J174IsjnkOzjyAFg3hOCQLvrXqKUquLnYPl8JN+jr/PBu24uBheh1RmCNaQ1ItvK66dq10oZwlG37BCtp6L3+niVxC+lhn4x0xkWeUq278C0KJYiCx+jx3SQpMXZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv47Wd+PZhW9XRHDDGkJ+a7o6lWZi5RgLXXKxPoquzk=;
 b=ccv2VYrcSY8hK2mJMlkzYP3zCz5EoisYG7+WpBHm1B3fBg9B61IcgVB1BK2CrDxdrPfmpOmrgzpoC9SLf3mkqNKJvJ6BSRwdDuQUOQw6qrYqJqWPGUdFygKCVdXZqSg4cvZq333KYlqcVTYoXP31sV1GSWmhFDKBqA8UOresQeAQB7A4/bQoZi60Nlhr3G6B/Wjr89ttgpUKQEz72kPuMiFsB4mJ+AD5Yvu/O3Kh7oimZKQePfwTTasqkGGth53DKJzEmLl7RxKATlXhIjlE+yJPtv6sOC/7em/Hlh0IeDTStLwvgZyIiOZdWTLhDEH47HBVooCfUBOZR3cwGzB5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv47Wd+PZhW9XRHDDGkJ+a7o6lWZi5RgLXXKxPoquzk=;
 b=Xc84h0+VeTeRnyn+Qlv3OnF2P6RNYoWbgOxvc75HTKqvWSW0hOcW84tsL49KdrXGb4IVuwx6BZMuR0jFvj6LKr66cnRr7C8ftQhLbQMet2dFY3U4a2VqPur5sYLSdEE45Wu9cbgXi5d3eis1eicT9bkWLZZLs9+nzw2s1keOL3o=
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB2741.namprd10.prod.outlook.com (2603:10b6:a02:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.30; Fri, 12 Feb
 2021 11:41:06 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3846.030; Fri, 12 Feb 2021
 11:41:06 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
Thread-Topic: [PATCH] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
Thread-Index: AQHXATB5GYyp6Sd0T0iwGhSktAzGHqpUXsYAgAAGvYA=
Date: Fri, 12 Feb 2021 11:41:05 +0000
Message-ID: <0418D7C5-AF8F-446A-910D-3196124300AE@oracle.com>
References: <cover.1613128220.git.jag.raman@oracle.com>
 <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
 <20210212111658.GF1340027@redhat.com>
In-Reply-To: <20210212111658.GF1340027@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:6511:c64d:8d07:2938]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 063919b4-278d-4cea-7c96-08d8cf4b1559
x-ms-traffictypediagnostic: BYAPR10MB2741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR10MB274142E0BA714B78304CFD42908B9@BYAPR10MB2741.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X49swLNrbFGavQfLEFtPX0yisgU6t+r6pCX39YvIaOzUhm2anX01gr5/JcnmwEnGX/raBfG+0rWI/5SPkd5z0XF5hpFBdKghKddOsUhtg9POD1mbrfzvjputVH9TyFd+FucOZnZBQAO77S9QIIlB+Z0shOoTu7cPOubrJB/DC++LkmrJZ/fvja+njy7vmgGwduYgddZFMmTQogtPJ8Dz5QIekNQkkPGx+MWLymzjSeYEg08RI6EUKxJxwTHWmbHrkg94HEP9kbCK9+7nDtSM7Qf6tapZIupje0ffHjoIzLNfnacRyyfBNWgqPIMOUqQcnYX2qk7/bHZyrVTdR+XLzv3JG1vM0qVyts6A8fs3NaLT9SOpsqtJJ2z9h5wtCDTQyLN0QgMMI80Vq2vZ7hldJRrVGaQPYsW4fo2aibzwCyR+BlgiZI+UgVjUowNHdWwfURatYlKa0/q6cSLhqFG5ywQn2ioUSDT8uJaDsxPiKI0funkvsvIzN/mI3FnsXCeRWnzLeC8wTmDhZN6MX0nbYyv9rmXZS9LAq4IwWXk606NxCIDC7LV4ty1Pp0cLABMB9aGpodTMo3k31KyeXTTEhcIir0qFItjLYTzK+xGVyRAy4T8HbKN42GH3tpWjrzuRgX6EKg6RMOqIqVU6lwXN0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39860400002)(6512007)(186003)(36756003)(5660300002)(6506007)(33656002)(71200400001)(6486002)(2906002)(8936002)(8676002)(966005)(54906003)(110136005)(478600001)(53546011)(66476007)(64756008)(4326008)(316002)(66946007)(66446008)(76116006)(66556008)(86362001)(44832011)(2616005)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?L0FBUXpYL1JjYXkyN3ZJV3ZicUg3MGtrV2FQeGR5SnZLc08xUmZkVVJwS0pG?=
 =?utf-8?B?T1FrTjdLSmVobk5xekxwcW9vWWdrSTVnN3ZnUjV3c2xJQTJReHgwV2NMczVU?=
 =?utf-8?B?UW9lZjhhOS9MSGxrazc5RGkxamNPRzljdEdCdXEzRU44QkhIdDhrOURIbU9l?=
 =?utf-8?B?SkN1ejhLRHc3R3J5LzI5S3cwRGoyR0lJajduc2pUNG1MUlJjSTEzUFoyQ29M?=
 =?utf-8?B?em5kNVVKM1d6cUJkOHRlalczZEpvenZ6Vjg4dlMvK3REcWhsR0plWmVvc09W?=
 =?utf-8?B?ckFKK29IN0h4VlVXaG5ucDVuODYvVVo0YlhTdkpzdTFsM0ozbzRmZU1XV05h?=
 =?utf-8?B?L3FDR2RDMXVhV1lpZUZYMjFTSk5VL3RvcWN3NHF4b0VOa2hvM3pTUEVtZ0hk?=
 =?utf-8?B?bUg1OWpDTHJCSG1ISE9nc0ZBblZYakpjOTZoRjdZTk9Fd0FteXR3dTNmRVc2?=
 =?utf-8?B?OUUxS2YvejFxWHNVSkJiYStCRmlBOEl3bWx3MkdyVDJPa2tMZmNkNHpJeFVG?=
 =?utf-8?B?Ym1xWVJTMlgxRDVVb3BxWjVwMjFEZGJUYUJuTS96M3RtcWhMSUNhM1ZPai9W?=
 =?utf-8?B?TEJpZU1WSklXV2hlQ2tUN0hSOEtrY2MxbHNydlZwUVNGQ1RjdTc1dmh5SHR1?=
 =?utf-8?B?ZnYweHdOdHR5bExERklKbHpTUStCbUZ1UEpja0hTT0t3eUN1dzlrZGF3RTYz?=
 =?utf-8?B?OG0yQVo5UGY3RXhneDdTSFVaT1lHVkl6endaM25FQnpIcWdIRU1lcENiUENG?=
 =?utf-8?B?MmttUlVSQ21yamEvbTh4eDgvZ2ZFQVdIUGVoelZaSmlFek5sekkwQStjdEJN?=
 =?utf-8?B?Wm5Pd0NMQ2t3YmRtL09XZDFiWHRZNzRjVERyZmF4OU1mNXFMWEVTVXBrNTVQ?=
 =?utf-8?B?VXA4NjN1UW0xRnFaTEpOMWgrdkVVK09ZRk50NXM2THpWKzFBYzJUS2V3dzZp?=
 =?utf-8?B?S0lGd09NRFhWRmpLWjBpRE9vSFFkYVl2Q2greUVIQXZMNndZSFh4c2V3b3Br?=
 =?utf-8?B?Mmc3am4wQzEvZGVnVGltQUVhcnVNc1JnSWpwc3Nsb2swREVOVVNsSC9sMlNm?=
 =?utf-8?B?Mm5CUElzRVhsVHZ3Wk9iYldCbXFCSDd4dXgxTzZyZ0Q4OGJBdFJrQjVEM1VF?=
 =?utf-8?B?T29SdlNRWDhwVVdWdTJjdGNxYnZhelVNMkNPd05uMXBRU2xFUzZBRnRGQVUz?=
 =?utf-8?B?UnZCbk93RWpWc1JISytneXNvZFZ2dmtVVU1qT2hvWUFMTTFSeStuaWZvQ2Vm?=
 =?utf-8?B?ZHNoemZZNE9BcmhYS2QzQzkwUW1DVlV1b2tKenFmM2pSTUtVc3BFTVhOemUv?=
 =?utf-8?B?N1hSV1BNRVltNFhPTmc0aWpSbmdPZ2R0Qkhwb2hsdFFtOStEaGROUEdjeVlz?=
 =?utf-8?B?a09URUw3UlZZYm9xbzBpUThqdjVTM1BUaUJGekpwVWtBV0RWbFRZY1d4Rnpr?=
 =?utf-8?B?L1hYQUNHbzVKd2ZTNHA1RjZEY1pFTU93eDB5cTd6ZkxFczM3YWd5NEpzaTBW?=
 =?utf-8?B?WjZpNC9BVVlGRjJ1RXR0eXNWTGJtbUxGaXdBWGJRdVRENVM0SW5STThFeExH?=
 =?utf-8?B?WFNPbFhpMXdxNEF4Mm4yc1pUMUFraXFuYjFFOFNibmhkR1lBbnNNRkNmRm9G?=
 =?utf-8?B?clF5N1grZ2tQaGFkOE5oZUVtWUpwVDNHK3REclAyMkRrL2ZXN2tpcWI1ZEY1?=
 =?utf-8?B?ZDJIVGluVmwwTm1iUU50bG1VVXl3bkZCc1dDOG8xam0yUDVqRzNoQVczdTFj?=
 =?utf-8?B?dkZpTVYzWXVab1JYOC9PV3MzdUZROXF6REJzWWYwMTU5TEo4SkNpMG00Z2F3?=
 =?utf-8?B?a014TEFMS1hlaFRaSzJpcDZaRFBRa1h6V0tFN1dpbVBOb2RyMzcxTVJIempp?=
 =?utf-8?B?VzhndHYzazh4TjNtVENzY0RNNnhKUEM0cTd4bktIUHFjdVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4575572CAB2A174999BA7DD88C278C81@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063919b4-278d-4cea-7c96-08d8cf4b1559
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 11:41:05.9328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YH7ua4m2kzF7nTdvSWKLJqZ8ZAmPmbjGubX38/qM/PWlgAS9heELVUyMSBIgEoSlhEYHNgX8uCPrkxLCCWbn6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2741
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120092
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDEyLCAyMDIxLCBhdCA2OjE2IEFNLCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgRmViIDEyLCAyMDIxIGF0
IDA2OjE2OjA3QU0gLTA1MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gVXNpbmcgZXJy
b3JfcHJlcGVuZCgpIGluIHFpb19jaGFubmVsX3JlYWR2X2Z1bGxfYWxsKCkgY2F1c2VzIGEgc2Vn
ZmF1bHQNCj4+IGFzIGVycnAgaXMgbm90IHNldCB3aGVuIHJldCBpcyAwLiBUaGlzIHJlc3VsdHMg
aW4gdGhlIGZhaWx1cmUgb2YgaW90ZXN0DQo+PiA4My4gUmVwbGFjaW5nIHdpdGggZXJyb3Jfc2V0
ZygpIGZpeGVzIHRoZSBwcm9ibGVtLg0KPj4gDQo+PiBBZGRpdGlvbmFsbHksIHJlbW92ZXMgYSBm
dWxsIHN0b3AgYXQgdGhlIGVuZCBvZiBlcnJvciBtZXNzYWdlDQo+PiANCj4+IFJlcG9ydGVkLWJ5
OiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5u
YXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4gLS0tDQo+PiBpby9jaGFubmVs
LmMgfCAzICstLQ0KPj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaW8vY2hhbm5lbC5jIGIvaW8vY2hhbm5lbC5jDQo+
PiBpbmRleCA0NTU1MDIxLi5lOGIwMTlkIDEwMDY0NA0KPj4gLS0tIGEvaW8vY2hhbm5lbC5jDQo+
PiArKysgYi9pby9jaGFubmVsLmMNCj4+IEBAIC0yMDIsOCArMjAyLDcgQEAgaW50IHFpb19jaGFu
bmVsX3JlYWR2X2Z1bGxfYWxsKFFJT0NoYW5uZWwgKmlvYywNCj4+ICAgICBpbnQgcmV0ID0gcWlv
X2NoYW5uZWxfcmVhZHZfZnVsbF9hbGxfZW9mKGlvYywgaW92LCBuaW92LCBmZHMsIG5mZHMsIGVy
cnApOw0KPj4gDQo+PiAgICAgaWYgKHJldCA9PSAwKSB7DQo+PiAtICAgICAgICBlcnJvcl9wcmVw
ZW5kKGVycnAsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIGVuZC1vZi1m
aWxlIGJlZm9yZSBhbGwgZGF0YSB3ZXJlIHJlYWQuIik7DQo+PiArICAgICAgICBlcnJvcl9zZXRn
KGVycnAsICJVbmV4cGVjdGVkIGVuZC1vZi1maWxlIGJlZm9yZSBhbGwgZGF0YSB3ZXJlIHJlYWQi
KTsNCj4+ICAgICAgICAgcmV0dXJuIC0xOw0KPj4gICAgIH0NCj4+ICAgICBpZiAocmV0ID09IDEp
IHsNCj4gDQo+IFJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRo
YXQuY29tPg0KDQpUaGFuayB5b3UgZm9yIHJldmlld2luZywgRGFuaWVsISBJIHJlY2FsbCB0aGF0
IHlvdSB3YXJuZWQgYWJvdXQNCmVycm9yX3ByZXBlbmQoKSBkdXJpbmcgdGhlIHJldmlldywgc29t
ZWhvdyBzbGlwcGVkIHRocm91Z2guDQoNCkhpIFBldGVyLA0KDQogICAgQ291bGQgd2Ugc2VuZCBh
IFBVTEwgcmVxdWVzdCBmb3IgdGhpcyBwYXRjaD8NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+
IA0KPiANCj4gUmVnYXJkcywNCj4gRGFuaWVsDQo+IC0tIA0KPiB8OiBodHRwczovL2JlcnJhbmdl
LmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2Ug
OnwNCj4gfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBz
Oi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8DQo+IHw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8u
b3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fA0KDQo=

