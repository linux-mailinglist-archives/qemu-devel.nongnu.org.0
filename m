Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F483887B6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:41:38 +0200 (CEST)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFth-0006UM-J0
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljFsV-0005ms-Th
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:40:23 -0400
Received: from esa15.fujitsucc.c3s2.iphmx.com ([68.232.156.107]:39168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljFsT-0006SV-GO
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:40:23 -0400
IronPort-SDR: Sx47pcB/8WRBIkNLqlkMd9saj+m1ZmLg9ZczoYk1xfFRZ+YNqlSHmpzdHnhSlpWGpxz8pvmlaq
 B5KMKN2+kTz8tSMJBD6qqEg9LW/GSb6vFMOc8HvevKTBe0yMhh9Q00FhYUsGCManFjdK+6+L+S
 f474FWbCQcieMdwjCGk3eWMaLLAFzbY9Y0n5TdKI0SQsxe637APCv6WcREp4YmESQ5PY866G4u
 cvFOe88DxAZnwnK0Zugfn2qi19uujDJ9mZnrBhDYCXhzcuBetWETVLYaHcuG9MLa7AgqMFJ2iy
 XQc=
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="31441507"
X-IronPort-AV: E=Sophos;i="5.82,312,1613401200"; d="scan'208";a="31441507"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 15:40:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glzuRld9Ks6PLs6ufNFoSwtrjAMnpoUS39F0KugGNgJsL8ZIjIe1SluQQycRaIYTYtuz8E1ltfqe4NcVkMq/BEZfq34voXI+1QQfCCZdqKy4DW9NiwKK5P3aHn1T4aK7oB0+p9stN/JnaUO4vqDRPDGFtfNVrSZLgZBTfON7TKqWggIwEGPnNxoADW0dk3AxzlwoNrCbCqXQw5sLQtQ/P1mBhe/oPCeNOtg1r/4gFAOkVhXznOQT5kIsqYRfpVVsr+h4YqLEO11qo36yKeQsk1aULljJ1r535RcQXZ8P5iWs7Cz+1i/irOk/hnZOenFbYaZsxaxRJ0s0hlrjxPkq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++YVtsSDWoLbqLhIoewVklhlYJEQIwYNKTfBc3WaRMQ=;
 b=OUfTjzHnZIFBaYSWfnLOnX9uBUruCqD9IgB6h1kpXqQkVHjCIcM0X//zJZFrcAd9SBTQqxmZxV9vTUndaqQgb9jrPykcZePAkyWks5Oh9dAs5td1TS4WbkQTZKYScq7vhpxGLdxQXuGpPmCF5HUkg9YpA11QyqWmHIC4lDKHlyl9ZtslWmPLvOciQ43BPX9qug1oiq3eUwORtYl7dQOdvp5tUTomTNFIQR/dEDRZkLix80vdml8Z3w/1y2fsQCPdojgOePqs11Bgts+DHElmGr5HXCEQnoVb0tEfyqVrQNvmnf067xzG2K73fOFKaNVjDN4mm5Q8RmcT64p5votfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++YVtsSDWoLbqLhIoewVklhlYJEQIwYNKTfBc3WaRMQ=;
 b=L5QjHNtTTmyrVaOQfhvA6fp4rp8JJeqU/t06TyqLFturNFzpYqVFOnxRAlJTK2VyMEc35d061j8CjS7g5AfYBi5DWHZoQ1OiuNx6DgAhPozn9EsOLkayq02P/I7VnMlPalBVx+uo4Ug5f1G2MBrxI/2ILtWdKtncZkF2NRtCRgA=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB4670.jpnprd01.prod.outlook.com (2603:1096:404:12e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 06:40:15 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239%5]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 06:40:15 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration/rdma: Fix cm_event used before being initialized
Thread-Topic: [PATCH] migration/rdma: Fix cm_event used before being
 initialized
Thread-Index: AQHXR+x5yAevhkmHyEOQ7R8cRAGxh6rhp2GAgACJ7oCABUWkAIAC7MYA
Date: Wed, 19 May 2021 06:40:14 +0000
Message-ID: <fbca6b8d-6a4e-97a6-1a12-8479e7590d87@fujitsu.com>
References: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
 <YJ1ew79TeJ4pPz1K@work-vm> <1496057b-6a44-71a3-ca16-97c4d9e9650a@fujitsu.com>
 <YKI+oJBc1ZT1AlC+@work-vm>
In-Reply-To: <YKI+oJBc1ZT1AlC+@work-vm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c9337a9-0bef-4bd1-153d-08d91a90f5bd
x-ms-traffictypediagnostic: TYAPR01MB4670:
x-microsoft-antispam-prvs: <TYAPR01MB4670A0B59D2FDFD92B41A4EBA52B9@TYAPR01MB4670.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sFR9DuF9ZzUTedTBF1m1wX13KQD/3wVy20Kum3kqK9rDnvlLr91STog/DAJquF/6PKv/LedOwNSuFFpHicqNnYiQo205GeWvRmOy+9zAd7E3wLlz3Fq+FFBLVDrurDJSXe6KCLF0z750NmhRuJ06DN7Au1hcNYMftlVUlPMKd1TZFgxdbBLBfjB88SJKV3Ab6wG8ZATu2gglmFqiThufIb1F5Yz3smDj7fZtEB4xPtGN4sWyEt+J8tZItDx3PbLvM9MGdZ3e7hbhRK7tN96w/S+LSR+IwtK+xDtGGbNKkFT5IIOWqS5u2XjXDO4j19D6j9pttV8LHe43NhGGCRUvSntw3Y2pkWvZcK3Fbv8FFgZ6gmOHoFi2Rq7igZtoeJC+XygWfIv6QR3BcVCw86iHMihv9b5/zfRApiI+LIfPYFtxmTZpwgeX52QSQXoWrewtzvRFzDQrbh4/I5W5k52yzQHUw1pINgqza/lTRruSVHn2w5hBocPBWCJAYKE012GX6kDVqLNnrzr2Xk+0/xBRe206nD9fg7R7u3kypMwd3EhcMjf5iZmHKFQV/7jmXdYlNP3fKAE8MoR/d6wt0ARy3eCUmj3l8X3JmZPCTtU4Ll7WFoioQTaE7zlahqCYtx/Fv0KdP8Pjjorv4LQoDCiP5CmrOrgYN0gVd57nohF/86c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(6916009)(26005)(8676002)(6486002)(85182001)(31696002)(66446008)(5660300002)(54906003)(66476007)(186003)(478600001)(316002)(64756008)(71200400001)(66556008)(76116006)(36756003)(2906002)(4326008)(38100700002)(86362001)(8936002)(122000001)(66946007)(6512007)(91956017)(6506007)(83380400001)(31686004)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SmJwOVZCMVFETkhNZlZRWDQvWEZERXovUm5JZDRETWFETVpTcEM1bUFKd0ln?=
 =?utf-8?B?V0ZISUVsNnV5M3BESEtCdWJRZkZ5WDJpd29rb3lvcmljYWFQM1VnS0tQbmZ5?=
 =?utf-8?B?MGQ0Q2pTQnNVWmVlL2Z1OHhnM3JRVHRQQ1RZcTVOd3NQUDJlbmM0ZytnYzZk?=
 =?utf-8?B?ZmRzZ1VVZTNWeitjcUZIeEhYR29yMk9meWV6RlgzYlFpQUJpZE1kcE5QUTEx?=
 =?utf-8?B?MHcySlRXUFNNbXRwNTNvRjBTSTlqejZkZkxFRFhMaFFNcE5mWVVxNEcrVWxm?=
 =?utf-8?B?VXFqeUpQcHNSYUxObEN1cytOK2s5dFFPcU80NGZYQ2hFazhOZW1GaWZSZUh2?=
 =?utf-8?B?SHR6WFBXZzFKdUFhdTBxOCs4V3lQcVVtYys3QWxuSGlpTWRlNzN4OENBK2FP?=
 =?utf-8?B?TVMzNVBJdFhxbW0yWVFWZVpIUmRVU0czN0NBNDBCTmlvTGxGOWswZmVmakRw?=
 =?utf-8?B?ZG5xdVovN3R5ZEZuaXM1UDhDbDNJK08xRU4rUktRWFJUMWhZYm9GdUpzWVJp?=
 =?utf-8?B?ejRCQ0pvMXhFTEZxeThQWU9DUDlIUUxReDF3WlRtTnl6a0EyMnZhQWJxSkpI?=
 =?utf-8?B?VUpsajJVazQ5WmVNNVRnN3pPZzBKUjhGenlwZitONUNjYWpoTHVWUDA5UHpT?=
 =?utf-8?B?ZWNuM3FYYUNQWW8yWFFSWUtoSHFQMUNKV0ZZVjVDb3lCUks4RmxnWVhRbTkz?=
 =?utf-8?B?cnl6Vld2ckg3RklCb3JKbHZicEdzVDZaSmRBR2dqWFNrbkthUkdjT3lQWlZm?=
 =?utf-8?B?WkIrQnk0R0ptZVQzMHI5MlR0SmRSd1BObFB1Z28vdW1CK2NjQzFzWnp0T1R3?=
 =?utf-8?B?QXBKZTJBTFdpSktUdElDYmJNUVBjZkJJYWJoY0lqbk1ld25Ka0VKZllxbHNV?=
 =?utf-8?B?dU5hS3ZVVk9JMFY0Nlk1NkI4b3dsOVhtbUhjWlM4WUw5L1NRcDRhSnMzV051?=
 =?utf-8?B?QjZyeGFNa092TDRQNXpyWTEvYXA4QjBxTnNKUXlaeVVlNlZKQ1VLTHV4TXRj?=
 =?utf-8?B?eTdrNjNqOGhiVWJsQ0MrcEY1aVFvNTN6TUIvTHNwQThEdXRJV3c2WU1oTi9l?=
 =?utf-8?B?TWZQTFVyNkkyUDIvUnVUSmdxUnM5RnIvTjlmeXV5a1RySEFVbVg3RlBZR1Jh?=
 =?utf-8?B?b1BzcHhrZWhGMkR3K3BLT1ltRXdwN3dCdEFocEp4NlNRMi84YXhybVBGaFE0?=
 =?utf-8?B?d2NNcURpOGlwaTJ0eGx6RDRmanBLQWRtQWxYUStZNm5aUFN6dHRudnh0dkQ1?=
 =?utf-8?B?THU4dzhrZHJkKzBvY2NpeXptOVE0VE50N3Jjc1R5d0FRcnE0WG9HbnFFN2ZG?=
 =?utf-8?B?SVRhdnNWVXRzZERoSDhmclFXNGhtdVU0R0I5eTlkQ21FM1V0ZnVIMzZENHp4?=
 =?utf-8?B?aitrc1NwUEFLMXUzZTlSaDJRM0lYejRxNldPdituRFRmNm4wZEVTRW5rVnRl?=
 =?utf-8?B?bmFvb1hiUHBGdkRPWEJvTnp3VlI1UUNpK2Z2eEFlYkxjbUNlbXVvYXducWlh?=
 =?utf-8?B?NXFleU14SG9wWXh6elEyTXgwODFGMmxEMG9rYkg0N2prTHU4TTJMRFhwR0lK?=
 =?utf-8?B?MG0vejFpb3RIL05PVldGekxNRkFnNDJMVGF3MnpQUEQvSm1mVFFBMHd1Vldl?=
 =?utf-8?B?bjlsbXI3RnZmYytISDdhVzBEYzBDZm1mbDBGZkxtMGx0MkNnL0RFRXUzc1hu?=
 =?utf-8?B?VVVGUjNZWEhEVkljMm1oNFI5eGFjT3dFSjJiMW43UmtWU0gzWXhlemtvR3Nj?=
 =?utf-8?B?eW0wbCtERE12WFJUQzhYNE5od2NEVjR4YmNZb3ExZytmeDJoSVNuSnpac0Rv?=
 =?utf-8?B?Z01hM0hqUFh0b0Iya2FXUT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <94950DBEB0286E47B84DCC56C132D322@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9337a9-0bef-4bd1-153d-08d91a90f5bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 06:40:14.9208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grOfalWFMGsgpZLi+mtpf95ZT7IB0PfzRaZZuGVxEWBvPrNt2WQKGGUJKnlgKi+TrWhLM61o6xbmi97sjMhztA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4670
Received-SPF: pass client-ip=68.232.156.107;
 envelope-from=lizhijian@fujitsu.com; helo=esa15.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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

DQoNCk9uIDE3LzA1LzIwMjEgMTguMDAsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgd3JvdGU6DQo+
ICogbGl6aGlqaWFuQGZ1aml0c3UuY29tIChsaXpoaWppYW5AZnVqaXRzdS5jb20pIHdyb3RlOg0K
Pj4NCj4+IE9uIDE0LzA1LzIwMjEgMDEuMTUsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgd3JvdGU6
DQo+Pj4gKiBMaSBaaGlqaWFuIChsaXpoaWppYW5AY24uZnVqaXRzdS5jb20pIHdyb3RlOg0KPj4+
PiBBIHNlZ21lbnRhdGlvbiBmYXVsdCB3YXMgdHJpZ2dlcmVkIHdoZW4gaSB0cnkgdG8gYWJvcnQg
YSBwb3N0Y29weSArIHJkbWENCj4+Pj4gbWlncmF0aW9uLg0KPj4+Pg0KPj4+PiBzaW5jZSByZG1h
X2Fja19jbV9ldmVudCByZWxlYXNlcyBhIHVuaW5pdGlhbGl6ZWQgY21fZXZlbnQgaW4gdGhpc2Ug
Y2FzZS4NCj4+Pj4NCj4+Pj4gbGlrZSBiZWxvdzoNCj4+Pj4gMjQ5NiAgICAgcmV0ID0gcmRtYV9n
ZXRfY21fZXZlbnQocmRtYS0+Y2hhbm5lbCwgJmNtX2V2ZW50KTsNCj4+Pj4gMjQ5NyAgICAgaWYg
KHJldCkgew0KPj4+PiAyNDk4ICAgICAgICAgcGVycm9yKCJyZG1hX2dldF9jbV9ldmVudCBhZnRl
ciByZG1hX2Nvbm5lY3QiKTsNCj4+Pj4gMjQ5OSAgICAgICAgIEVSUk9SKGVycnAsICJjb25uZWN0
aW5nIHRvIGRlc3RpbmF0aW9uISIpOw0KPj4+PiAyNTAwICAgICAgICAgcmRtYV9hY2tfY21fZXZl
bnQoY21fZXZlbnQpOyA8PDw8IGNhdXNlIHNlZ21lbnRhdGlvbiBmYXVsdA0KPj4+PiAyNTAxICAg
ICAgICAgZ290byBlcnJfcmRtYV9zb3VyY2VfY29ubmVjdDsNCj4+Pj4gMjUwMiAgICAgfQ0KPj4+
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5j
b20+DQo+Pj4gT0ssIHRoYXQncyBhbiBlYXN5IGZpeCB0aGVuOyBidXQgSSB3b25kZXIgaWYgd2Ug
c2hvdWxkIHBlcmhhcHMgcmVtb3ZlDQo+Pj4gdGhhdCByZG1hX2Fja19jbV9ldmVudCwgaWYgaXQn
cyB0aGUgZ2V0X2NtX2V2ZW50IHRoYXQncyBmYWlsZWQ/DQo+PiBJIGFsc28gd29uZGVyZWQsIGkg
Y2hlY2tlZCB0aGUgbWFuIHBhZ2UgZ2V0X2NtX2V2ZW50KDMpIHdoaWNoIGhhcyBub3QgZG9jdW1l
bnRlZA0KPj4NCj4+IGFuZCBjaGVja2VkIHNvbWUgcmRtYSBleGFtcGxlcywgc29tZSBvZiB0aGVt
IHRyeSB0byBhY2sgaXRbMV0swqAgYnV0IHNvbWUgbm90WzJdLg0KPiBJIHRoaW5rIHRoZXkncmUg
YWN0dWFsbHkgY29uc2lzdGVudDoNCllvdSBhcmUgcmlnaHQuDQpJIGFsc28gY2hlY2tlZCByZG1h
X2dldF9jbV9ldmVuKCkgY29kZSwgaW5kZWVkLCBldmVudCB3aWxsIGJlIGNoYW5nZWQgb25seSBp
ZiByZG1hX2dldF9jbV9ldmVuKCkgcmV0dXJucyAwLg0KU28gaSBhZ3JlZSB0byByZW1vdmUgcmRt
YV9hY2tfY21fZXZlbnQoZXZlbnQpIGluIGVycm9yIHBhdGguIGkgd2lsbCB1cGRhdGUgdGhlIHBh
dGNoIHNvb24uDQoNClRoYW5rcw0KWmhpamlhbg0KDQoNCg==

