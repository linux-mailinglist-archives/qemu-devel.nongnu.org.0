Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303EF38017F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 03:32:22 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhMge-0002vo-Pf
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 21:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lhMeF-0001d6-UG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 21:29:52 -0400
Received: from esa12.fujitsucc.c3s2.iphmx.com ([216.71.156.125]:44037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lhMeC-0006c3-Tv
 for qemu-devel@nongnu.org; Thu, 13 May 2021 21:29:51 -0400
IronPort-SDR: akl/sGLxv1ATmZCvmRAxqSgYA6yoLUNF7dyLGDVOQi9RiwD0ZyCe9P3jGX+knSE8A3xQLRkir4
 a464xsoFO+oVML53llS7mmbodEff1C/Do9PAcvPKxWFKZf1OjP5UMhW8Os9dz5R9NjniXaSP3m
 8HJdT8Q0/VGhXTEsP3I1dPgbKDbMng0U8HYz/40pWMuBflOqUbtbkdCCcMbQdTaEZtc0z7DjPO
 q4dLhtGIGIZCbuihD2IEkZw6X7ueLbFgfSgj5mxgLb1wW49g7H8mxkqQV+f0aCnUqsQOkXS1hR
 L2E=
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="31329564"
X-IronPort-AV: E=Sophos;i="5.82,298,1613401200"; d="scan'208";a="31329564"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 10:29:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+Y3V71LDJCySzTdYRWjbhTBENP0slMaU5ttnu1qM836vAGF4kPRwDhSEtQEbsmdrwVnsNmNX3K+JHPXQh3N13I+4OAArxDbraqfb6AHS2d5R9CIjoCzDQZYpgV6S05paL0mbF7eAfW7meoWeU9i0Wvjf3ujtffhV8/lAvDj3Ul6s9wOVS36lSJ7FFq2NMLQm/lkSArnElG6/rYlbVzdxHefFhjR0dB6uO3gHJ5HUbPhw5F8PEi5HXe6P3/gO2jAQOXN5voFW7thEXrgke6jqQex3h5vFkShGirDCPXWFimA82cq9jDr0WaI19yPXCYLiSkFL5xzUuO0k0DSFc/Edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/FUev6sLgYnht1IPuSNPCQ8ROF8EXVc+8lzDde4ALw=;
 b=EeL1kZdWo6vx7RPgeNPX10q+BoThBJKmSKlzxI7qdR9R2qgDCR7wkJkQY9Jo3ML6iqe17Qq45FjdxOZwfMv+rgaAfAZLziRVIR9811+pRO9tzTXnult3cVV7FGw4Q9ireqYzruMg4pkloMn7I6mlLKoyNQ4RzH1hwM8Tfn9q4BBmLO8UpvUF+5Ro6jFiH+a6gC9yor/7azqIEEd8JGVsJYhJqSkPG+hNik1zdvjl7+8vhz1ENMCWBS096MKwR79Vu4I9DmN6iJgbuAUrC/QhoxsnLWXsHg3R36KhZO3CMcY8LSR0DOTaEFTwP7NLQnltwQZ4GC38WLlC4QwvqwXzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/FUev6sLgYnht1IPuSNPCQ8ROF8EXVc+8lzDde4ALw=;
 b=n90CWh7nGktt9F0MbGXkYQ3hemDkBcfTywsgUdwBrMoOsy7kfyOKK4HPm8wd/QMzwv97h+Axu2ufgk6eRvnTtY+YDjBQ6zRFUs5vy3VTs8SePdacj8fmSTFiaG9TEUJcY69wFaoB8EGsFJHtPrkqK1/pQEHvk8b2tmOqkRkioko=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB2687.jpnprd01.prod.outlook.com (2603:1096:404:82::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 01:29:43 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239%5]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 01:29:43 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>
Subject: Re: [PATCH] migration/rdma: Fix cm_event used before being initialized
Thread-Topic: [PATCH] migration/rdma: Fix cm_event used before being
 initialized
Thread-Index: AQHXR+x5yAevhkmHyEOQ7R8cRAGxh6rhp2GAgACJ7oA=
Date: Fri, 14 May 2021 01:29:43 +0000
Message-ID: <1496057b-6a44-71a3-ca16-97c4d9e9650a@fujitsu.com>
References: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
 <YJ1ew79TeJ4pPz1K@work-vm>
In-Reply-To: <YJ1ew79TeJ4pPz1K@work-vm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fba76db9-ef77-477e-dd62-08d91677c061
x-ms-traffictypediagnostic: TYAPR01MB2687:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB2687FDC9267F5DF9EEC17A59A5509@TYAPR01MB2687.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Q+YYzhXp8ZcUpRF/uodu+r4+z9G4aR7Sq+W8Lmvss2yoAc7kjX9xo0ujxTtE82KWIFTauweFekOWhBkN4KGwfyZom9J2+nktXtWYX/smjWSGDeO0OtlM3NI1kBGeEJt7P/TcqogwnpH4HTtADEjILBdEpIdSFQxl/Jw1dXINuVaubDJ2XTMzS4Vj4do3+WPMDEODtKTgQslkuQSqRf00CxKTXTIC6koUoYuejb03Zh72sMny6tM+2syZsniDIpLNHkjEzq1TbzQLXV4vnhRZM9Y7Fx+5XxvzSSJgcq3BxZVyjJsn6Pb1itIy39XoaDPRp0iv5GJL3cg/Me+eDS5AL28wsuAZQ+rhrmbcUQPHWlrofZ5hvNsdnUIFkOI6TxbTJ7N8NzqPA0OjZLKDm8Rd0n6Pxc59EKKMfDLjUWkCP8tTZRQakWi1dskaucTZbcylfp8WNV3GcBsBth9qVAkk8fQ8oDWfb+a63je8tfMv6wF0gvg3a9KGzBZISW99wKxnLVBjs858ItjevHedr0hVFRtt0v1wjuTjLIGzJU82pIFIuoBwds8mr1QBupmhueU9GUHc5+DCg2kbPzX1sjDwRT1/5wUeL9ezWBOn0aRVDtnd6KlfzDepm98IaXa2ot2rTxf3sHX5a2bqN8u0cdo9fptoJdg345T712S67nLcBXAHA8xfskJ5O66LeDLnGZygeeTDpHnVEH7bVIWt1PgNuGlSc7kReCrvca6+QGVCMI4rP1aN/EsMP09vUXQAmoefzigu+fak6duLe9gJ7763w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(966005)(110136005)(66946007)(86362001)(2906002)(54906003)(64756008)(66556008)(76116006)(66446008)(91956017)(66476007)(5660300002)(316002)(85182001)(8936002)(186003)(36756003)(4326008)(83380400001)(6486002)(71200400001)(6506007)(6512007)(31696002)(38100700002)(26005)(122000001)(478600001)(8676002)(2616005)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bksyTE8yVlJCK2lBditEWDhzVUpkSmIzRWVpbitjcXNrT2dwU0huQk44cWFq?=
 =?utf-8?B?eWd6dzduN09acjV2SnFtVjBtR0loUS9jdUR3bE0waTNPMi91bkJFTGhVTWtP?=
 =?utf-8?B?NlI1enlpYUU3T0tQTDJLTUluSUJ5NzBkTVdvbmpwR0g2VWUxTmVoM00xM29U?=
 =?utf-8?B?bjdTYmNvWDJmWUlIa2cxajVHWGdhSkl4U29tQ0kvYkUranV0ZTk3UE5acHBq?=
 =?utf-8?B?R2wyVkNYeEZvYS9MVFZnV0FEWThnYUtTVnhDS29kMGE2TWlPRStYSjdhWCs5?=
 =?utf-8?B?NG1MN2ZBdEhwaS91cGVnUXRSQUd0WGIyaGcxTk9zUDlkZUVvOGVka1hKc3Bw?=
 =?utf-8?B?a3FtNG5ERml0aHNUc2I0RndIV0hvQ0g5ME1pYUtEUHNDZzZMeTYycjRmRlMr?=
 =?utf-8?B?aGlNQkxCUDlCTk85L21CWGtjZE0xMkVLUC9kTjdVVzZEdmh2amdkb0FMQnJx?=
 =?utf-8?B?NDdnK01NcmhqMVNTcDdyUEZOeUJ2MGpCOHFLMFd2Z09QNUdlaUZzK28vdU5H?=
 =?utf-8?B?U0tVeEVJNHl3VTVpOXBSREFvS0VTeWp4TXZycnp6cllzZllLOU1vendtMlNM?=
 =?utf-8?B?R1ZodE5sUkl0cUhjcjR2MTltdzNlejdJdlVCaXh3ZUhVS2VRMGNKNXQwRkZ4?=
 =?utf-8?B?KytpV1Rxc0FUNFFBRUVrMkN1SUZUendMbTVuZnlmRmd4QU1DTjFjOHJ3RWY4?=
 =?utf-8?B?NS9VS0E5bDV3OHI4SDR1c3M1SjYva1pEUEpIVWtqUFdoK3RNeDJGaHRyTFdH?=
 =?utf-8?B?Q0FqeUNMZllhaGVtTUJUaHdCbGdPVjhFUHUweENJZXBPTWdPQWpmMTEzMmNu?=
 =?utf-8?B?M3hjZWVncU1GVVNHKzVPbTFFcEtWbWc2LzEwSVhCTnk3RTdZdWttUFBkVGRM?=
 =?utf-8?B?TU9JYVNySTJNTjR5WlFCZHlBcUs2cU1rM09aZGgxeS9NQU9sWGVXR2xTd01u?=
 =?utf-8?B?a0IyR3NJL2VNbFlaelpocVIvdlpnamFnemJGWEoxVG0vSGE2NVJPZEt1aW1t?=
 =?utf-8?B?RGV5YmE1UUIzZjY2a2hEUXI5S2xIRmZPWEVyaHBaZU5mWTVNczlhOWt6Zitt?=
 =?utf-8?B?YmpjQXRnUjNmbG9FcmM2emozQjY4T2YwRU45cjJjRW1ocnFHMHFCUVBBZ3Ey?=
 =?utf-8?B?dTlCRmQ0UUxCeHVoeXRHRFJGTXZ6SndnUFh0OHVmcUlMTWF6cjVkUTBQWHFp?=
 =?utf-8?B?V1c2OWgzdEZDUGNsVTY5bStBN2tkd2VBbnVvUWdjUm9IOWswR0RwRERKS29H?=
 =?utf-8?B?UGhpRTMvNS9RdnFNNHdBdmRFY0FkRk1YUkdKTFEzYU44NnE4MlZxYXptVllF?=
 =?utf-8?B?dXVSY1lOK3luQ3A0VytqMWtoR0c2b2tTd0w4VGlmdm9zQzBOWUhHaDFVQ2g5?=
 =?utf-8?B?Q3lDWDN2bUNWdWprcGUwREtvandlOGt3NHNISHQ3cDk5MHNHWUlwTE5UV3Rm?=
 =?utf-8?B?K0U5SisxZVArMGZSSUljUitQUEkyVXVrTE1YZ0I2b1ZKN3NzL1g1dW95TTFq?=
 =?utf-8?B?UkdxaklsNHFQUjVYL2pxSXM4K2pKeWJWSDdaUytLejN4dlNRb2pCQUo1ZmNa?=
 =?utf-8?B?UG5FblZ6YitxT0o1YitZa3cwTStFS3hLSFpubm9MSkk3eTlTOUVLNlZNR0FZ?=
 =?utf-8?B?Y0IvejJvY1haVFZJMm5Wc3Uyd3JzZHlNZk9HblpBdjd4Lzl2WThvNXZmSHND?=
 =?utf-8?B?WGF6ZTRFa243d2UxeEhJaFFmS3ArQzRydDZaZC9ZanBydkVWK0w3dmw1UEFv?=
 =?utf-8?Q?NCxv6e3yXqO16iySMvi+jO48OQ+6LI0jG4vjguz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0380539872897442825EF3F55542C999@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba76db9-ef77-477e-dd62-08d91677c061
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 01:29:43.3344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIseeIymPVSgx5X1RLuGPXMy0iUrKL+ouH87SBy7zA7pwcAQr+WUu+165EMKweoTDjwXVySZQMBTA0e9gnHFVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2687
Received-SPF: pass client-ip=216.71.156.125;
 envelope-from=lizhijian@fujitsu.com; helo=esa12.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDE0LzA1LzIwMjEgMDEuMTUsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgd3JvdGU6DQo+
ICogTGkgWmhpamlhbiAobGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tKSB3cm90ZToNCj4+IEEgc2Vn
bWVudGF0aW9uIGZhdWx0IHdhcyB0cmlnZ2VyZWQgd2hlbiBpIHRyeSB0byBhYm9ydCBhIHBvc3Rj
b3B5ICsgcmRtYQ0KPj4gbWlncmF0aW9uLg0KPj4NCj4+IHNpbmNlIHJkbWFfYWNrX2NtX2V2ZW50
IHJlbGVhc2VzIGEgdW5pbml0aWFsaXplZCBjbV9ldmVudCBpbiB0aGlzZSBjYXNlLg0KPj4NCj4+
IGxpa2UgYmVsb3c6DQo+PiAyNDk2ICAgICByZXQgPSByZG1hX2dldF9jbV9ldmVudChyZG1hLT5j
aGFubmVsLCAmY21fZXZlbnQpOw0KPj4gMjQ5NyAgICAgaWYgKHJldCkgew0KPj4gMjQ5OCAgICAg
ICAgIHBlcnJvcigicmRtYV9nZXRfY21fZXZlbnQgYWZ0ZXIgcmRtYV9jb25uZWN0Iik7DQo+PiAy
NDk5ICAgICAgICAgRVJST1IoZXJycCwgImNvbm5lY3RpbmcgdG8gZGVzdGluYXRpb24hIik7DQo+
PiAyNTAwICAgICAgICAgcmRtYV9hY2tfY21fZXZlbnQoY21fZXZlbnQpOyA8PDw8IGNhdXNlIHNl
Z21lbnRhdGlvbiBmYXVsdA0KPj4gMjUwMSAgICAgICAgIGdvdG8gZXJyX3JkbWFfc291cmNlX2Nv
bm5lY3Q7DQo+PiAyNTAyICAgICB9DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGkgWmhpamlhbiA8
bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiBPSywgdGhhdCdzIGFuIGVhc3kgZml4IHRoZW47
IGJ1dCBJIHdvbmRlciBpZiB3ZSBzaG91bGQgcGVyaGFwcyByZW1vdmUNCj4gdGhhdCByZG1hX2Fj
a19jbV9ldmVudCwgaWYgaXQncyB0aGUgZ2V0X2NtX2V2ZW50IHRoYXQncyBmYWlsZWQ/DQoNCkkg
YWxzbyB3b25kZXJlZCwgaSBjaGVja2VkIHRoZSBtYW4gcGFnZSBnZXRfY21fZXZlbnQoMykgd2hp
Y2ggaGFzIG5vdCBkb2N1bWVudGVkDQoNCmFuZCBjaGVja2VkIHNvbWUgcmRtYSBleGFtcGxlcywg
c29tZSBvZiB0aGVtIHRyeSB0byBhY2sgaXRbMV0swqAgYnV0IHNvbWUgbm90WzJdLg0KDQpbMV06
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yZG1hL3JkbWEtY29yZS9ibG9iL2UzODEzMzRjMjkx
NWE1MjkwNTY1Njk0OTQ3NzkwZDRhZWJhZjIyMjIvbGlicmRtYWNtL2V4YW1wbGVzL21ja2V5LmMj
TDQ1MQ0KWzJdOiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmRtYS9yZG1hLWNvcmUvYmxvYi9l
MzgxMzM0YzI5MTVhNTI5MDU2NTY5NDk0Nzc5MGQ0YWViYWYyMjIyL2xpYnJkbWFjbS9leGFtcGxl
cy9tY2tleS5jI0wzNDINCg0KVGhhbmtzDQoNCj4NCj4gU3RpbGwsDQo+DQo+DQo+IFJldmlld2Vk
LWJ5OiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPg0KPg0KPj4g
LS0tDQo+PiAgIG1pZ3JhdGlvbi9yZG1hLmMgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9taWdyYXRp
b24vcmRtYS5jIGIvbWlncmF0aW9uL3JkbWEuYw0KPj4gaW5kZXggMDBlYWMzNDIzMi4uMmRhZGI2
MmFlZCAxMDA2NDQNCj4+IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4+ICsrKyBiL21pZ3JhdGlv
bi9yZG1hLmMNCj4+IEBAIC0yNDY2LDcgKzI0NjYsNyBAQCBzdGF0aWMgaW50IHFlbXVfcmRtYV9j
b25uZWN0KFJETUFDb250ZXh0ICpyZG1hLCBFcnJvciAqKmVycnApDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5wcml2YXRlX2RhdGEgPSAmY2FwLA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAucHJpdmF0ZV9kYXRh
X2xlbiA9IHNpemVvZihjYXApLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfTsNCj4+IC0gICAgc3RydWN0IHJkbWFfY21fZXZlbnQgKmNtX2V2ZW50Ow0KPj4g
KyAgICBzdHJ1Y3QgcmRtYV9jbV9ldmVudCAqY21fZXZlbnQgPSBOVUxMOw0KPj4gICAgICAgaW50
IHJldDsNCj4+ICAgDQo+PiAgICAgICAvKg0KPj4gLS0gDQo+PiAyLjMwLjINCj4+DQo+Pg0KPj4N
Cg==

