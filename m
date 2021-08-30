Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D963FB2DE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:05:45 +0200 (CEST)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdEd-0007Mw-R9
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKdD5-0006TK-IT; Mon, 30 Aug 2021 05:04:07 -0400
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212]:40428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKdD1-0005br-2c; Mon, 30 Aug 2021 05:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630314242; x=1661850242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0INh78yuOFe3MTKrbc+kct2cJL/lKsH3K0vpiexFSTc=;
 b=E6UNN+/qhfBhjjDP0NYPdMEe97ErFYGXgM7V4O1HzvczTQoLfOrSm3Jc
 DaZgiEqqKjAQxL8qxTY8wSL1e6uM1tDLjg0xY9UrOg7Fdd0xIetRHgicg
 sanjMqPMW77YsGANstmJPvjSj1ppMGYpIf2qQm3Rchs8SNRKqbOIhh3oo
 64LV0jKCgN4VDA51WCdUh2h+jmRq8tVbXMwf2Jk4YPFC5ADKqmaNhbZHn
 St8adrqp7lCioJnMutkH4No2Sbso/FdhcjU87TwpYxweehV0sKdI1x2Kk
 2s0lGroBTvJKRXL3S4GvYWqHIr8XAqHQIcZUpusb3dYzxbBRfTqlOj0po A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="46097104"
X-IronPort-AV: E=Sophos;i="5.84,363,1620658800"; d="scan'208";a="46097104"
Received: from mail-ty1jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 18:03:58 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+eewnv0+XZApfXJ7X2Ph4bc+zDYe2wJyQV6kr9aszkEe/1yglYEdbCcYF1KN0WtM5IzHWWIFpH/1e36Gd7Upajz/FCef2GgXg5WMe15xPN2KntsINNHSwRVBGDzFMBfxshrQqMLPcSnuPDvlQExZUam8FBhMk5aoI8qom+sHHxTx6O+ZwwOofcGuG6eKH3RI1jQzlOADL5MYFCAAeKSUXIiANKGvtNZ+GV1orIW9bLSCrjYshqJdgWEjX/xz/ZSlcWEnrrpP75r6PvcALTnJKrhOa+Shg/scVosEjV3nw0awAwSl5laatmmNe4EvrVzeOJpK9C8au6DRRFWAMs0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSY60gMfvNOsQFZJZ2iSa3r0r2pw+M8wAYLx3Xpm86I=;
 b=WoP2/ynSRVeGXq9kC3Bb1buUVasOxz0ef9Cjmd8t4Oxi1g/VH/AkewMC7WerUVH5Phh4czPFCQT492uA/3BbmlONWJRoSuwU8ZXz6+J8kHyvAjldNXTGhUAASyHdAj3smG81ai29qrJdGO2t5Mqjm6KrO/kNZ5q/E2Md+JeRrNtRBiLojBeFsi+/0OHbevkIghojGBYjWoWt/o6/ixLka+sDOyz+qscGnV8zU1PxytThBNseLWZXhZKg6oJlOV+7LbAuCqwesY1ta6zFC1I4iQYkFhuKX81qQY7e9AuEd4UJL/RBlUdU71G6JGur9focBK4pakkOQQg7+fVpJjASRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSY60gMfvNOsQFZJZ2iSa3r0r2pw+M8wAYLx3Xpm86I=;
 b=YM7ObWxiXfD4jkHeHaZOpJ4h1xzFA4lNZZKZf0qW5p3Kre7qWAPtJ4WCmCUKCOaoTfgmhRPgeQuYS6fJHgJJ9uuFz5uQf5yIegfg2A11uS3ZifGfFJabSwudcyvIe9KO6ZMXk83YjsGN07l3/BSrG/30bzNs/xsyLWZW108zDys=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYXPR01MB1823.jpnprd01.prod.outlook.com (2603:1096:403:11::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 09:03:55 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::534:e385:3c19:21c0]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::534:e385:3c19:21c0%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 09:03:53 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH v5 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v5 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Index: AQHXnXkBmkwHse6yhkmDlHA0dHzCp6uLuiiAgAAFUKA=
Date: Mon, 30 Aug 2021 09:03:53 +0000
Message-ID: <TYCPR01MB61603DF612001EC80621742AE9CB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-2-ishii.shuuichir@fujitsu.com>
 <20210830083931.4fft4c5cv4c4ysni@gator.home>
In-Reply-To: <20210830083931.4fft4c5cv4c4ysni@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9MmMyNjYyM2YtZTE1Yi00N2VjLWFkNDItZTY4?=
 =?iso-2022-jp?B?MWFmNzUxZmY3O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDgtMzBUMDg6NTg6MzJaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05fa4546-3663-45c6-9198-08d96b951785
x-ms-traffictypediagnostic: TYXPR01MB1823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1823EDD3B5029575B87275CCE9CB9@TYXPR01MB1823.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ez/BLykimu2pUBRpdThZENpgHv1DKXg4PQ9TX/Q4l9jsxihDzS0KIhKUtzwLcppxf95ABzrEuZAlLX2sUOnp3V1L90yhioSAxMwo7wLlmKWgpDuRDl3i7diRErdgpYstXQ79d2EZTsbzgJOV4gsTS9J9OVXaVTg9x02pFZ6VPgQJyhY4YtFALkGtFsGzqW6tFVtTvKf7FM4oQ/ionaXpFJentFqtrhzZSHPiUjUHkYjfaef4kr2Kqoudlq1KTe6ritynsL853obM959jTAIWo50cJoxnZoyf4XvCMFLVUyjfPGVlDDUAGn/dqiXZ8Yao8MB/Q84SIZ2eikIuE4j8Mn2OFoOwi22UeEu0zX3Eb/GUrImG4qo/DEJCfc9NhZOIvQjfrUnrWN9Rk7tU6R3tnEsKJGgz+WDLzSdOD4pgOa46gmvf35uyWlsNa9xjUjHCZY6NehPciqXcyfuvDuo/eX9sxDugsOXdvzGHH4oo9EaiYIIoGvTkyarR5RKXhvH8EYWA0RUHBpTts5+F3LdLLH4uyFqAgC5vs9y48DxmulOr0b7vevm1Ubqo22u9w8lqrUkA5nS2RB53Ck4Uk4dWd8vx7zq6fCgtWXyv5e1e4X87BgXHnpzL1gQic7TNC7Vcl5rAmBOJk+V7NzpYvTAyrvJTbB938CVXwB93gEmdC4z36ut4h3qs/br57RbcrbXauXb3T7kBi2tIvXeHiAQCng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(8676002)(83380400001)(316002)(6916009)(107886003)(54906003)(38070700005)(64756008)(478600001)(71200400001)(66446008)(85182001)(76116006)(66556008)(66476007)(66946007)(186003)(9686003)(5660300002)(26005)(4326008)(33656002)(38100700002)(2906002)(7696005)(53546011)(122000001)(6506007)(55016002)(52536014)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?RXpOVk5qOXRtRzNGdHpQU3huQUswdXdtOXdTZHhMaU92azhkdkZsWTg4?=
 =?iso-2022-jp?B?YnRISkVsZXE2LzhRczhiRmxHb3ZlQmxVL1pjU2Fja2tBR01nUmJUUTRn?=
 =?iso-2022-jp?B?Y256SVFFYkswaWJ1RVRMY2E5bm9rS3R0b1psOEZtREhXSDEzcEZXMFJu?=
 =?iso-2022-jp?B?Z01xSUlNRzU2anFzU3ZvNGxRS1NvR3BBYW9hOW9VQlNtc05mVHZFc0Fv?=
 =?iso-2022-jp?B?RU9pdnZCNzBSTmN6SElXMWFCNHc0bythMmpPNnNxa09GU21scTZMdVhp?=
 =?iso-2022-jp?B?bFNUUTZRTjV2RktSVU1wVGJRMFdPTERXbk53bXRhUDFxUWNJNHZQMzQw?=
 =?iso-2022-jp?B?aGp2bHdyN2NvSXdLQUhSbjFnTU80OXlCZC83dVJFbHI2RkRyemtzekpo?=
 =?iso-2022-jp?B?aGNWT09OaDlpYkpTb2RwaWxwMDZPWWlwcDFLVHZRaVBhS1BvZXVDUE5x?=
 =?iso-2022-jp?B?NjZIYzNTWnJDc0d0TVlrY2tqUGxRbWh4Vnd1Z0xpWXdMNjh1NUpEUWFs?=
 =?iso-2022-jp?B?cmJPWDcySHlML1NPL3lwUStIVnk0SnZoaTNURm9LeE5teUIwRkYyUjdC?=
 =?iso-2022-jp?B?VkRFRm50Tm51bTVKYWhUVCt2RG9uK0R1a1crOUVuV2ZBVUlvbWYxOFpL?=
 =?iso-2022-jp?B?S2xTZmxpOVozS3VsOHJmQ2c4MGVWM2E0YUc4SEdwS0h3Nk1NTFBUdzYw?=
 =?iso-2022-jp?B?UlBWZWZLUTdRMG1LVyttT3pHZUg4c1RtTzRvRnc1NE5keDlhMGlSUms0?=
 =?iso-2022-jp?B?OXNXWWRNN1JUektzWlc4S1F1cjJObzQxQytqWkFaUHNuOGV6SDlRL0VT?=
 =?iso-2022-jp?B?czZkcmppSnB6dkxqV1JVUmRZMDdJcitDdWZkYkxqTDI5Y005Q05aWEJG?=
 =?iso-2022-jp?B?SzkzSklaWHdsWmg3ekM1MkZZMmFRZ0tSSmlrSUVyQzhBZmlDNkRWZk9M?=
 =?iso-2022-jp?B?REJueXBlTC9YQmxnSTI1SnFZbTRxb2M0dkJydjQ0SlZZTDNCSkdkTFBF?=
 =?iso-2022-jp?B?OFlaRGtyTnBYdi9oZjFtKy9HZGNRbWxvbG9CaEhvclk3WnR5d2wrN1Zm?=
 =?iso-2022-jp?B?TDIrTWNHTDJkcUVtTitmbXY5c2puemxPQ2N1UFg4bUlybzJ4TTc4RkQ1?=
 =?iso-2022-jp?B?UGNzekdOajZxR0J2QWNJOFBpQlYvckthR2FtdTFCVXJOTmtLUkJQcjdv?=
 =?iso-2022-jp?B?dmdoZVp6ZUYvL1RUYUNXUVJPVXl5d283ZzJYR05XU2Urd3VrYVdNeXQy?=
 =?iso-2022-jp?B?Vm5TUTdRakJRcWwxa2dBRnEwNFloUTNPUGxuOHB1K0hJSVUxcVJZMTBM?=
 =?iso-2022-jp?B?VmZiWlF5QmhWRTFMNUdqT3NwR0JBOUwzTG1DK0NqTlpYTnpTYkxaOHJF?=
 =?iso-2022-jp?B?ZXl4MjY3cTk3MEgwRnZ3OEJkTkpsRDNzZUVublFlTTRTdU9YaWhzNVRT?=
 =?iso-2022-jp?B?UGUyd3oyemxLdVJWMjVhOTNBYU9iSEZNTVZQb0dyN0svU2pJQnlKNVZl?=
 =?iso-2022-jp?B?amwrTE9IS0taRHI4RW4yckljclBUcWFhbkUzcWVXejR1dFo0dHRrNlNq?=
 =?iso-2022-jp?B?aXhGY2w5cUZPMlpuK2dFeHhxd2pxdytGZTZRcGFoQUcydEhNMXBxdGNY?=
 =?iso-2022-jp?B?cVg2QnEvcW5yL2tSd0NqdmtUbW5JZHJEdTdMNHRqYmIvakJvb0lhSGow?=
 =?iso-2022-jp?B?UEgwTi9KeDlSVzJUSnUvellvSkg5N3FsZnNGNy9vaGlReklQTTIwMU5D?=
 =?iso-2022-jp?B?OHYvQ2EyRnpmbFZTWTVNamM1dnBzME9USnQvRzFaaWp4R01zenFmUnFM?=
 =?iso-2022-jp?B?MDl3N1EzUU5HS0xXQ2R3SisybFlRR0RXUStPajdIOUg1M0JlanBFWC9E?=
 =?iso-2022-jp?B?TGtPeFZVSzBXellZNXRTTVAvaG9HbUFOakM4R2VEYnhrK1BIa2NWUnpE?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fa4546-3663-45c6-9198-08d96b951785
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 09:03:53.7688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IkiglYCU4D1j4oNOC4XE19DNM8T25fzku5wMYHhWwVDcw04oS2XQ1a8qbrC+rQGJmX7czVtKjQTGjMMD+YwrcDgYEGxcoVU1Y4BHnLTVVuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1823
Received-SPF: pass client-ip=68.232.151.212;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa3.fujitsucc.c3s2.iphmx.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for your quick comments.

> Question: For testing, did you dump all the ID registers on this
> model and compare them with a dump of ID registers from real
> hardware? If so, that would be good info to put in the commit
> message or at least the cover letter.

Yes, it has been tested and confirmed.
We will re-post the v6 patches later, adding the information you mentioned.

Best regards.

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Monday, August 30, 2021 5:40 PM
> To: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>
> Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH v5 1/3] target-arm: Add support for Fujitsu A64FX
>=20
> On Mon, Aug 30, 2021 at 05:28:18PM +0900, Shuuichirou Ishii wrote:
> > Add a definition for the Fujitsu A64FX processor.
> >
> > The A64FX processor does not implement the AArch32 Execution state, so
> > there are no associated AArch32 Identification registers.
> >
> > For SVE, the A64FX processor supports only 128,256 and 512bit vector le=
ngths.
> >
> > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > ---
> >  target/arm/cpu64.c | 48
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > 2f0cbddab5..15245a60a8 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -841,10 +841,58 @@ static void aarch64_max_initfn(Object *obj)
> >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> >
> > +static void aarch64_a64fx_initfn(Object *obj) {
> > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible =3D "arm,a64fx";
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +    cpu->midr =3D 0x461f0010;
> > +    cpu->revidr =3D 0x00000000;
> > +    cpu->ctr =3D 0x86668006;
> > +    cpu->reset_sctlr =3D 0x30000180;
> > +    cpu->isar.id_aa64pfr0 =3D   0x0000000101111111; /* No RAS Extensio=
ns
> */
> > +    cpu->isar.id_aa64pfr1 =3D 0x0000000000000000;
> > +    cpu->isar.id_aa64dfr0 =3D 0x0000000010305408;
> > +    cpu->isar.id_aa64dfr1 =3D 0x0000000000000000;
> > +    cpu->id_aa64afr0 =3D 0x0000000000000000;
> > +    cpu->id_aa64afr1 =3D 0x0000000000000000;
> > +    cpu->isar.id_aa64mmfr0 =3D 0x0000000000001122;
> > +    cpu->isar.id_aa64mmfr1 =3D 0x0000000011212100;
> > +    cpu->isar.id_aa64mmfr2 =3D 0x0000000000001011;
> > +    cpu->isar.id_aa64isar0 =3D 0x0000000010211120;
> > +    cpu->isar.id_aa64isar1 =3D 0x0000000000010001;
> > +    cpu->isar.id_aa64zfr0 =3D 0x0000000000000000;
> > +    cpu->clidr =3D 0x0000000080000023;
> > +    cpu->ccsidr[0] =3D 0x7007e01c; /* 64KB L1 dcache */
> > +    cpu->ccsidr[1] =3D 0x2007e01c; /* 64KB L1 icache */
> > +    cpu->ccsidr[2] =3D 0x70ffe07c; /* 8MB L2 cache */
> > +    cpu->dcz_blocksize =3D 6; /* 256 bytes */
> > +    cpu->gic_num_lrs =3D 4;
> > +    cpu->gic_vpribits =3D 5;
> > +    cpu->gic_vprebits =3D 5;
> > +
> > +    /* Suppport of A64FX's vector length are 128,256 and 512bit only *=
/
> > +    aarch64_add_sve_properties(obj);
> > +    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
> > +    set_bit(0, cpu->sve_vq_supported); /* 128bit */
> > +    set_bit(1, cpu->sve_vq_supported); /* 256bit */
> > +    set_bit(3, cpu->sve_vq_supported); /* 512bit */
> > +
> > +    /* TODO:  Add A64FX specific HPC extension registers */ }
> > +
> >  static const ARMCPUInfo aarch64_cpus[] =3D {
> >      { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_initfn }=
,
> >      { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn }=
,
> >      { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_initfn }=
,
> > +    { .name =3D "a64fx",              .initfn =3D aarch64_a64fx_initfn=
 },
> >      { .name =3D "max",                .initfn =3D aarch64_max_initfn }=
,
> >  };
> >
> > --
> > 2.27.0
> >
>=20
> For the SVE stuff,
>=20
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>=20
> Question: For testing, did you dump all the ID registers on this
> model and compare them with a dump of ID registers from real
> hardware? If so, that would be good info to put in the commit
> message or at least the cover letter.
>=20
> Thanks,
> drew


