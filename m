Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702643FAF23
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 02:05:34 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKUns-0007Cc-UO
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 20:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKUkt-0005Sy-FJ; Sun, 29 Aug 2021 20:02:27 -0400
Received: from esa12.fujitsucc.c3s2.iphmx.com ([216.71.156.125]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKUkr-0005pI-9N; Sun, 29 Aug 2021 20:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630281746; x=1661817746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/+0RMPp7bBKtiNqnE/3q6MpHGZOyxMxJZ9eOWmJoDtc=;
 b=aLCwl7pyxrLDiockdtuuXvtvBYWRm9NCt2KYUMF8Rwrv09Cm9dv+muH0
 PfOMzFPebsvs8cq8S9Ut4ZivccY7z9opCc76IiyoeheHdsur4EXuuUjVD
 gQJ8Pyp6Qsq9X6ms5o8kDvLPFKREud6dV6vOf1Tn8vge2CVK7h8hNSF07
 FvAGcWt+RF+rMTaDg8en41uGduqqx8IXe29qtwkyxXVywhp3WFP4yI02c
 pOCWTc7f4sDGM4MszWW1tRqcMvSY4w3t9IU/SNBMXYg7GjgmGtVvuYcBi
 iVCRQjxu1F/Dcpd1+aQWXs0aibScQ9eeuHi6jYsT0+c6vNEtc/oxBZJaB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="38002171"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="38002171"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 09:02:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGYNtSkWowO+fG1ZQy2LOp0CPnd4Mj7OuasVKBprXaI2LsyeB6yERCZ+5kCJrJVSGKwqEDC/SDXAoa7jylIDt+5az9SsozMCEeuwBfaDWOXRO7oFGyFmuKFomNde40WXkwIyCGCMPRK49XCPnKy0lr5OSm3wB5OaEdML/ulg+vdif6SO/kk59lg6kME+AGcyz8ElP2v0OINogcuf9OERVjRFoMRCtTKst+l+RNjBhZxZ1fop+jvV/hHBOEY3W0E37EH+xAvMNc97CU5DCoQ08pE55zZneTKrtiysxKMBPBYsn1NQjcncR6zJQxBwN/HJcjhwi88ewGzNciD0xjU40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+0RMPp7bBKtiNqnE/3q6MpHGZOyxMxJZ9eOWmJoDtc=;
 b=SvXob1PaDzCUwkIYQKFMM5JUUYEgE11ctbzPA2S1HKgvuP6PGoMvv4vj7ZSZGeCL62LvdP09fxl90h30vz+57lcg1KfJB6JYNJYVwKYp8VP3jvSMlkJ/0euHMzu6XA/Ta9hCCBvnYPiq7t27oIC3Itab/D7+ZGpiF3KESA3JXiLGjBlO20YKHPKjqhlHP8YslzfmSscif9x3Kq3pwTFmmbSIw4oCuEil5lbWjBqeHbVuG/BM0AWIo9tnww94oKAf1lyqq/6Oj1ox0jxoLPA2XH45+5Ci4kFG0EZDYkmkB8MMxu3v9ENPiXbaRa/3SuMUdW5kwntJChmL5CKIjmwqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+0RMPp7bBKtiNqnE/3q6MpHGZOyxMxJZ9eOWmJoDtc=;
 b=g29UKvwUcU/muYfRrwAARdmIdUhfiwpx+PTlxlVwh4+15NLX2U4+M+U7JIGYWjNPlyPQHE5MhcMnVvbm3G1uDJI8iLd9KYViYsS2eyT0rM/pzYoXZvbeo0MP/ksY4NVmeGfArrKkDZ/5LCcxiG5NJi0SLOAkD6Z9qnnafXGxN6k=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB3917.jpnprd01.prod.outlook.com (2603:1096:404:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 00:02:15 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::534:e385:3c19:21c0]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::534:e385:3c19:21c0%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 00:02:15 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Thread-Topic: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Thread-Index: AQHXmDjmqPfJnz0GaUS0irTpVVwR56uGeSHQgACZoYCABBYz0A==
Date: Mon, 30 Aug 2021 00:02:15 +0000
Message-ID: <TYCPR01MB6160712FFF86E07152F3FA7BE9CB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210823160647.34028-1-drjones@redhat.com>
 <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA8WFYAddXZ+BScb6+jJNnmKM+zV0kdHgySgZOV_+8BaQg@mail.gmail.com>
In-Reply-To: <CAFEAcA8WFYAddXZ+BScb6+jJNnmKM+zV0kdHgySgZOV_+8BaQg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9M2FjMDUyYTktZmRhYS00ZGRkLTkzZDgtNTljNWUxNDU1?=
 =?utf-8?B?MzE0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wOC0yOVQyMzoyMjoxNFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88603878-4e7f-4656-7380-08d96b496d02
x-ms-traffictypediagnostic: TYAPR01MB3917:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3917E38396747AEA5F84BE04E9CB9@TYAPR01MB3917.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Bgbudu8lsEpPffN2pnWuKUlVkxB44fveSBWYdgkbTOpX7bkGBxU5A5VuROZfKa/5B5zZ3fIuvaaElMrdhAyiwfVyF9MDc1RVjb/hXqAzcYwWSUNR2NC9X6g5BXW7XhQacBOFWnsHv3aHDDbfUp8nBmmitoutrMj33q5vehI1rXFkD1xotAx8fcVF3mMhgP7rkYhnZGQLDGjtTgA0YxwDjwD0DB4TzILjhN3BpPYIO9UimeMX9IeXtkeAlCnFVuvKYQj6OYxP9BTrakhroWhvS0FG6+RTtnZZLjlAIYiH5waGC8E74MztSlbk4izAv2OJC+D0nbGCmiVsF4FuVpVFFNoiTOIXvWsHEpMZSSxRkYln1Tsv6OjxVC7W8HBFVr97TrBT5wKcT5mjx6vX6BwyQ9oESrrrq33CweMzjzTFLkWdlxqiLsYa1JxgLA+Z7xwvjVrKKZ1DSKE5Gt1RU9F1UA2MlW6oSkc3bkUQkf+BRxSlDc9sS+WR5rGUwyuOIF3yM0T2OkxqDpg9DrQIM+2NgorIGTm3lmI/hfdW82mNgZ55DZFFOFvAuO1POWir1IxZsyo7muwGFjTMwAOlwPwu39ZgoCqKTJi1fbP+FDM+1CUUCSrDoNeWt9FR6p3tL10qGJIy9lC8GqO0WpLy0sm8U4g4g037tMVIQQOGdV86AXU729YgUuVojcH43H2buWFr47zqeYqfNwWIb83xdQjnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(8936002)(86362001)(38070700005)(316002)(107886003)(52536014)(8676002)(71200400001)(66556008)(4326008)(53546011)(55016002)(6506007)(76116006)(64756008)(66476007)(186003)(122000001)(5660300002)(54906003)(38100700002)(85182001)(6916009)(9686003)(2906002)(478600001)(83380400001)(7696005)(33656002)(66946007)(26005)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VZTVRzaEFNZmxKeW1wUE1RMHJiQTQ4Um03VGNJUjlwdlFsYnVkVnphbDBO?=
 =?utf-8?B?bGxWaXpERElWNVFBQnlFNjhCMjYzVUU1VmpsWTR3TGJ6RWU5YmtFR2JJemdY?=
 =?utf-8?B?KzUwaXJObzZGd1RtdVlRWktzd3J4ZUxFSUJSSG1DUjdHUisrdGp5ekZRczZj?=
 =?utf-8?B?NnltYURnMWlKenZMV285T2h2RXZ0T2s5SXdkQ2FkRW9uRERUdnFkZ3c1ZGcx?=
 =?utf-8?B?SjUrTUFreXNJM0dXNHBDTUlqVnBXczJaQlppK005M2hhdXF4WGV2YUVNdXZp?=
 =?utf-8?B?MmdrNWQwKzYyNlYxMVdnNEZVMkt1SlBqaWhUNEh3RENsRWh1SE5yMm54SDdM?=
 =?utf-8?B?V2h3VW5DS0dBUFlDYXAyNFNWUGlaMlpvUEE0MVYwbUJTMFJ6OXVTUVNYZjJt?=
 =?utf-8?B?V2tvTEkrcjdxbkoycUgrb2Y3V1A2c25rTnFHNjFLblRxTDZuaWpkWVZaai9t?=
 =?utf-8?B?cE9UQ0RZT21TTTNNbE1RMVk0dHNqdEpkMUlWUFptMS9zSStsendHNUZ4OVJq?=
 =?utf-8?B?YmpXZFp4THBsQVdocmNZMVRCLzBWMmM3M0tXZzJBUzlDdGVVYzFmaFdUeWVH?=
 =?utf-8?B?VFBBYmVKQS9mMlBqL0VyWXBrcDZPZG1teDNvWlIvWTFyTDhERjBxYmFXQWdV?=
 =?utf-8?B?eVVaMHBMcCtOUzYrcUVoekdXVm9GRWVGOC9ZUVZ6bXRrZmg4TXlCTDVNeDlM?=
 =?utf-8?B?dFZpZUhQV3M5RnpqdjBsYlBQV3BlUE1ZNzZwSWxyRUdZUDI1RVd4NnF4b1FG?=
 =?utf-8?B?U0VEOHZZV1NnWFVPMU9rZ2g5bm9RTm5nOEY4U1dWc1hjT0FweWtoZDZRVk9E?=
 =?utf-8?B?djg3NlYxVGdvMlJIeWprQTlnSzU3MkNBNXFGRGM4eHJJcFdaT1hSbHptYVdx?=
 =?utf-8?B?aUVFTHA5RUNpMlBTcHREQUQ4V1JQMXB6Z0tqZkpBR3l1RjNkbnEraUFoRWVZ?=
 =?utf-8?B?a0ZMYkI3YlNFbXd0aW8wdzNwU0hZTXFLTTlGbm84aU9qdVVUUDNrcDcxWCtE?=
 =?utf-8?B?emxPWEVsYVFFck9VcDBIZ0hGMzZ6N3VkdDg2L1B0V2NnRnQ2L0txalRFSmYw?=
 =?utf-8?B?T3pIVEJXWit6dEtOM2tBd0lKbmpRbDVpUWJ3ZTlrRW9JV1pXMnFrUUN3VXFV?=
 =?utf-8?B?aS9SaXk3QTlveU9IYjBDWkx1K1R4TUMxaks5ZjIyS1VGQVRvK3V2U1Qzczdk?=
 =?utf-8?B?UGdGbFp2MlFkemVmNG82SE84MDJHaDZ1TU5BV3ZXVDB2WXBIYTFWSXo3a3dy?=
 =?utf-8?B?a0dkYkFleDdIRVV4ZGl1d0pacEpuWHRjblIvYlBWUGdOYklwUFZFNy82Y04z?=
 =?utf-8?B?VStETW9mdmRnL09xM3Vpd0ZLejdFMlNPQ3VQS3hsQjQrN1NNOHZNMmZ5VlF3?=
 =?utf-8?B?WFQzUDFEUVU1ampoUSs3bnl6YzFPT1l2OFZMQ285MExxbFptWEUrZjlsMzJP?=
 =?utf-8?B?Y3I5WFFvRzFhakNoeGJ6NER0aGNieDMzL2g1c2hsWTVSK0pMdGtnVkJGTlE5?=
 =?utf-8?B?bUFUeDhkTTVlS3hHeFoydlBoZmdZdEZ5dTdpTW9teEJGaGNydEFCWWVTUUlu?=
 =?utf-8?B?aGM3eUNYcEMxU0ZOc0lqVzFDZHdobU5mYXRLQnJUSldxQVJKRDUwaUFmS1JS?=
 =?utf-8?B?cVNyTGlGanRYR093dWJkNkpuVVRkWm9aU3pNTHFIQlBEQ29XNWJ4THdObFNw?=
 =?utf-8?B?MVU0RnkrcjUrQy8zWEhNSWt4NDlYYXZxcHpRSmg1MzB0ZnRGZnBNR1RTdDhU?=
 =?utf-8?Q?8krjxxjokXPEI0PjPZ+ZkxHOSwtdrYfexDxbDPZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88603878-4e7f-4656-7380-08d96b496d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 00:02:15.4700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lr9qqPUaCPEJbQ6etWDhIFcP1puqAl0zvBN0fgRng8Bh88ZfxJKPSalIlF8Ku+lSlmfsGu/S4Q6J7enFbPhFJB+aeEMdSTTuGzEAmBzfKmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3917
Received-SPF: pass client-ip=216.71.156.125;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa12.fujitsucc.c3s2.iphmx.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGWUksIEFuZHJldydzIHBhdGNoZXMgYXJlIG5vdyB1cHN0cmVhbSBzbyB5b3UnbGwgYmUgYWJs
ZSB0byBiYXNlIHlvdXIgbmV4dA0KPiByZXZpc2lvbiBvZiB5b3VyIHBhdGNoZXMgZGlyZWN0bHkg
b24gdXBzdHJlYW0gbWFzdGVyIHdoZW4geW91J3JlIHJlYWR5IHRvIHNlbmQgaXQNCj4gb3V0Lg0K
DQpUaGFua3MgZm9yIHRoZSBjb21tZW50Lg0KVGhlIHJlYXNvbiBJIGFwcGxpZWQgaXQgbG9jYWxs
eSB3YXMgYmVjYXVzZSBJIHdhbnRlZCB0byBjaGVjayB0aGUgZml4ZXMNCmJlZm9yZSB0aGUgQW5k
cmV34oCZcyBwYXRjaGVzIHdhcyBtZXJnZWQgaW50byB1cHN0cmVhbS4NCg0KV2hlbiBpdCBpcyBt
ZXJnZWQgdXBzdHJlYW0sIEkgd2lsbCBwdWxsIGl0IGFuZCBjcmVhdGUgbXkgcGF0Y2hlcy4NCg0K
QmVzdCByZWdhcmRzLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBl
dGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBB
dWd1c3QgMjcsIDIwMjEgNTo1OCBQTQ0KPiBUbzogSXNoaWksIFNodXVpY2hpcm91L+efs+S6lSDl
kajkuIDpg44gPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbT4NCj4gQ2M6IEFuZHJldyBKb25l
cyA8ZHJqb25lc0ByZWRoYXQuY29tPjsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4g
cGhpbG1kQHJlZGhhdC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvNF0gdGFyZ2V0L2FybS9jcHU6IEludHJv
ZHVjZSBzdmVfdnFfc3VwcG9ydGVkIGJpdG1hcA0KPiANCj4gT24gRnJpLCAyNyBBdWcgMjAyMSBh
dCAwOTozMCwgaXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tDQo+IDxpc2hpaS5zaHV1aWNoaXJA
ZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBUaGFuayB5b3UsIEFuZHJldywgZm9y
IGNyZWF0aW5nIHRoZSBwYXRjaGVzLg0KPiA+IEFuZCB0aGFuayB5b3UgYWxsIGZvciB5b3VyIGNv
bW1lbnRzLg0KPiA+DQo+ID4gSSBoYXZlIGFwcGxpZWQgdGhlIHN1Z2dlc3RlZCB2MiBwYXRjaCBz
ZXJpZXMgYnkgYW5kcmV3IGxvY2FsbHksDQo+IA0KPiBGWUksIEFuZHJldydzIHBhdGNoZXMgYXJl
IG5vdyB1cHN0cmVhbSBzbyB5b3UnbGwgYmUgYWJsZSB0byBiYXNlIHlvdXIgbmV4dA0KPiByZXZp
c2lvbiBvZiB5b3VyIHBhdGNoZXMgZGlyZWN0bHkgb24gdXBzdHJlYW0gbWFzdGVyIHdoZW4geW91
J3JlIHJlYWR5IHRvIHNlbmQgaXQNCj4gb3V0Lg0KPiANCj4gLS0gUE1NDQo=

