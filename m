Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D483DE37E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 02:23:54 +0200 (CEST)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAiDp-00059e-2K
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 20:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mAiBj-0004C3-St; Mon, 02 Aug 2021 20:21:43 -0400
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65]:51916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mAiBh-0006OU-6U; Mon, 02 Aug 2021 20:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627950101; x=1659486101;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GJug/S7X51ML1Vvil35v/j5XOIgnuNsOy08ZzFTmnZc=;
 b=XjkyGey1B+FgocSBQkNAXLrqFYJJPXUhxIjhXNGYip4fgXwI05LgDddW
 hINkfGJosJmFg2F2X4NeYwnPE+1vy1YicQ9S1SVlqiKcQuO8AMtR0F2No
 gZbnlG1VTtNZm/N/mG3OY73JY6UKdFMEfvI/muuITE3Cs4pdaxcRhoIM/
 g1YPJteYbY8x+8wqNJI2i9yMNb+kPImGQ9D/S4npYVN1EOQqbVTW0LD08
 AN3UL0GXp+YzAiKSbwXmTkhLBx08QH7jeb0JwUZHFniEC2QCsHiz29KH4
 YymEUa0d8pbl0VyHLdqcfNZYGSpqNMShWclovh+yTQqdbDm/ECslCLbWY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="35948865"
X-IronPort-AV: E=Sophos;i="5.84,290,1620658800"; d="scan'208";a="35948865"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 09:21:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCWAc8TMjHRlL8RTecCgJYynnHEW23vmfom+3TRG2i+SJnX2KHdN9HQCfxf8kPwwBlTa5lUSahvNkZlR+HVUn4zNH78JhAvwrNzNqhaZX/SIFCAPdI4ZlNU+qw7fRUGpLAFo1dDanNpCticNwfuXKSLTOXVe/LMNCxF1U6R1b2HriNBNuOLWkkkU6/xp5qSQJE2w3KWhawLoESFeqtk2mqqeTvN8cdgv91B90smZ3jPp5TKHogaLGzp5TkLGn6VOEfU+zXX/mBZGQLmitO5S5jgisC80NJHhg3nATB9UqGgO6e1KCvXutWwhnz1Ts44YyqzNJKzZyKgaFAMHEo7Emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJug/S7X51ML1Vvil35v/j5XOIgnuNsOy08ZzFTmnZc=;
 b=JJZGWdGfG/z99lkkGD8j7IbbbOZvMmu1U/a2bXReBUB5TNc4nIkF+xMSXSyCJSKkva8ZV0BmzM5npqnx4dHoILY1GKp5I4DJWHDRTTXGej1UmYbzBumhwTjcs3suw2593PI6FhqkRpZO+d3bAfhh6WFFbJVsl9h/yxcnIExyVnezsIi1axb9Bp2UiQbYaXnFp65JGduEvnQyLPfuOg3BYQA/zwAxGiTVvUzSyFYTyxdYKHFz++Lfn97l9/EDDZJKstU0ZEf5VJe8VV1+H6L2hU/13mwr2z0q5l+R1l18/v1MMbppvnL9WZ6B4ke4h44E7f5QU1cFxCLPN/ap8ppLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJug/S7X51ML1Vvil35v/j5XOIgnuNsOy08ZzFTmnZc=;
 b=pMu/t3eRa1FjRN2uuO7P7WDMdQbv0JK/s51+EUH16iF4BlAt7IMUKILLZqn9lWRkn22PMo2/qMF1HglYWUvwQ0veDyXdQRzicxUVxT936y6F0ab506SBxT44RVh90UtwWeICKPQZbx11sGsPDtDhKlKJbF3kPka/sn8IEbFKzFE=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB5899.jpnprd01.prod.outlook.com (2603:1096:404:8059::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Tue, 3 Aug
 2021 00:21:31 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 00:21:31 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 3/3] target-arm: Add A64FX processor support to virt
 machine
Thread-Topic: [PATCH v2 3/3] target-arm: Add A64FX processor support to virt
 machine
Thread-Index: AQHXhPAwUrMdV08kP0ScbvzbOPFOY6tbU4QAgAWZzTA=
Date: Tue, 3 Aug 2021 00:21:31 +0000
Message-ID: <TYCPR01MB61600FAAA3FBCAF52E47630FE9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-4-ishii.shuuichir@fujitsu.com>
 <CAFEAcA-F3V2ByQ=AJjNWU8H1FHiHZBUYAN4UAfEFMjmo8PK7eA@mail.gmail.com>
In-Reply-To: <CAFEAcA-F3V2ByQ=AJjNWU8H1FHiHZBUYAN4UAfEFMjmo8PK7eA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OWQ5M2NlMDMtM2I5ZC00YjlkLWI2ZDItMTkxYjUzYTE0?=
 =?utf-8?B?YTFkO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wOC0wM1QwMDowNzo1MFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7684f728-1410-43e3-d881-08d95614a4f0
x-ms-traffictypediagnostic: TYAPR01MB5899:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB5899C0D24FC2DFBCDEA4A039E9F09@TYAPR01MB5899.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qeokYYkEA4PtXuzuKrxdrOasm1fiNSNaZ1qoCgX+VADgauzzkI9xOtQSgxuspBSOtK+n5c5r6ZXLG8ny6Tp3JQ9SyStJC10DbeUPHJVabB0LBEXC3/DDTsHyPi3u3gtUKnww1mAbmAP6q66wARpSpu72YGF7MaVuWYEM2q8jEC1K/2bi/wcSo52/w4DZ/GhOXG2+DJodf8CrKIavVhnM2CT6y1QoMr8k+VaAKMe1V9rWTtk5Ma45n9q865/AKy3GmWPQXLdhsfh2HWXcWowTDGyhd6KYyxgw14cWi9dXeXhorH4+ZcOhSQLuV9IgQaHBE4ejDuJQcFxsxVXo0GJBozl7IWcUwjE49XLQrEKo8uTom86M/95edm1+MUf2Y76u3Mkr2NEVSJcz84hrAQ/hSBWeqeoQ9N2Dz3acV1b0MYM9RLWPtQuH9+xRv+HyQx+um+j7B6483oRVSnJEb3yBWh+4N0lj6pqf5wwd5SNdIVhG9J5j2mH3iE82a5mHR5/LLjgwXXscu6oLHVKV4PWDlEp4qHabC+hrgbIJxKoLoRXoosH6InT6V7fs2gaxKzszlgbYGZ4+GqCfIFf+FCazhw5PZSnhLootXiSXWO9659Qi9YAxgH2V5sX9GNbqiRB8FisYQhVloGCfEVOSszBLY6i5CLw/xRyI0eiw8D4XWPQ6c+DrQLlVWFoKHNdoDzAILRLvA/gAdiATAA0yjM9LgJCE8fz3N5uxHr974MjvFxcsAT+2WvtaKNIW2+fZ3/cdm7q6aZkG8D8i8xXADLGzpw2dN1LfX2jK2J6k6K/UJB0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(55016002)(316002)(186003)(54906003)(8676002)(52536014)(478600001)(2906002)(66476007)(64756008)(66556008)(966005)(66446008)(8936002)(9686003)(33656002)(76116006)(107886003)(66946007)(4326008)(6916009)(85182001)(83380400001)(7696005)(26005)(122000001)(38100700002)(38070700005)(5660300002)(71200400001)(86362001)(6506007)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHhRT2RacGl2R3o1SHhSbXdYZEM5NFc0eUJNYnBuRWEyZHpiRi9JVFEyVThh?=
 =?utf-8?B?MlVxYW5LWlhHY0YrRXAxMzZBTHZzbTc0bWRueDdiRWYraWs0UStaN1d2Y1hY?=
 =?utf-8?B?bWFUaHpUUHlrRm4yUFNHb0MwdDRoSnhaTXBsTVRjdzRtQ3VHNXVWMFdsRlN1?=
 =?utf-8?B?VU54VUk5SjVWTmQxL2x3YTBhTCtJVzFLdGVIdXpBWUpPU3dsTGJTQ3lobHRC?=
 =?utf-8?B?aGZ4cit1S3Z4TlZyRW95Z3d1ZUk2ZTVBNndtNXlFc2JwZ01Na1h0UzY1dWZU?=
 =?utf-8?B?TmplOC9UL2tmNWNwUlpjOVVCWTdnaUprN1ZLV2laTW5rcnlQM3B0NUEzdzNF?=
 =?utf-8?B?VjhMU0JYQWtDL0RXVERER0ZFcTJMdk9nNHMyaWgyd1AwZG9DS3ZsRytDcHA4?=
 =?utf-8?B?Q2d3WklaUWM0THZmajRjcW1yZXYrSWZCOG1SUjlvbEp6Y0J5NzQra1dWQm0w?=
 =?utf-8?B?S3pMcnNpQXRJRGpZUmxPd1krTkhSdnVsbWJ3M2NNQVdWeE10NjBxYlZqZnEy?=
 =?utf-8?B?REhxbVN1MG9NdG42SEF0TnlZYXlTaGJxaWVhWVpjcmV5NUdjL0hUWWlGS2JH?=
 =?utf-8?B?THFsQkhMRXlqZjg3aEIwUEx4eFY1bnZaSGM1bjZxNmNJdkowTHdEc1pERUV6?=
 =?utf-8?B?TGZweWFaQWVrV2hySS9POVJ4RE9uNGdxSFJyT05UUHRjNVJYbWpRZmc3MzJW?=
 =?utf-8?B?NCtqRTBIK1lhSTBNTHM5S3gxQUM2ZDB5VkxQL0F1c0VkckZ3Nnd1ZHl0ejlB?=
 =?utf-8?B?YUtLOTBaOHMxUlFCcWVoVExPZHFsZXR3dEw2VlYvV3FCVlV5Z1hsRTVqMStp?=
 =?utf-8?B?RndTWU4rZXo4ejlweGVjbFI4VnJzclhna1FXVHlQWk1xVTI2ZXNaaXppRjVt?=
 =?utf-8?B?SXJkdUZ4MW1TVTQ2Z2lUREpNV2ZicDhaN2ZybkhLZFNSS3BsOVErVE9SdDNv?=
 =?utf-8?B?aTYrNFhWTGhpVjJjT1BCTlI3TlFuUXVvQmh2Vjl1SW9UVmpsdU9Ld1BhWGJu?=
 =?utf-8?B?d2dhNGJUbld4b29kaVRLa3d2QUlNVUxraUFTZmFwQnpyc0RnV0pnQnlMMytL?=
 =?utf-8?B?RHMxcUx2UGNZS0pNUVE3dXhsbnZocGFaZGVFR2t6UXRXTHh2cTBmRms1Sm91?=
 =?utf-8?B?dXY5OFRlK0FwTEE3b3hXUk0rNDd5cGVNYm9VWGxuLzNYOC96ck5FR1QvM3Yx?=
 =?utf-8?B?dk0vbFBmdVR5dmNBS2VUTzhaYVpETlNTL0xQYkJ1NU9pajhabFROMWxGSU5R?=
 =?utf-8?B?Y1EzZDBFM05GNzRhTzJQU2dadkFEaTY3MG56WTdZMHkxTzM5ZVY4eUJQR1RM?=
 =?utf-8?B?U25OZlpaK1lTR0taejZ5ZTFlcWRobGZqUjBtdDgyU2E2MVRTU0x5UnpiZzh3?=
 =?utf-8?B?SmtvalcybXdnTVFaNVF0bWt3WktVQXRyaVY4VVphcXNZMUFSRURMUVV3ZCta?=
 =?utf-8?B?RE1Hdk4yRll2L25iZ3RjVlFpelFRUytkR3JQNGxiYVRoblVqay9XVjhCTmR4?=
 =?utf-8?B?WWFia1k0QkhUeCtOVkpvcEhrNUNZeGNxTjZydFA1c2RZQkhRRzFPeThwSmRP?=
 =?utf-8?B?MXhkc0hxTHFxdXMreGQ2ZkVJVEtzTUgvZEpNYzBqRXhRUklUb1YvNTc1QzZW?=
 =?utf-8?B?SlZ6RnllWDJNTFNLTFhaV3p2OHRIanJvQUp2ZDhZUlBma0czL1YvcWtMNnJD?=
 =?utf-8?B?clhpSmdaRkorSC85eURNWXFLaUczRGh2eVhONmh5bnd4OW9xcUlDL3IreE5s?=
 =?utf-8?Q?pIvWDGSPlP4YB/2mnp6cWioi4ZfaRKBiiLxJj8r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7684f728-1410-43e3-d881-08d95614a4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 00:21:31.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbm8vKjifnfylV8W1P4zj4xG4hTFdMHc5x4hPzGRVDzk+R2pscDcYTQdh5zAbahP/KBuBQqK+HsMGlRrx3d3VAoS1+LPMu4kosg9ybBjP0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5899
Received-SPF: pass client-ip=216.71.158.65;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa20.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IENvbW1pdCBtZXNzYWdlcyBzaG91bGQgZGVzY3JpYmUgd2hhdCB0aGUgcGF0Y2ggaXMgZG9p
bmcgYW5kIHdoeSwgc28gdGhlIHJlYWRlcg0KPiBjYW4gdW5kZXJzdGFuZCBpdCB3aXRob3V0IGhh
dmluZyB0byBjcm9zcy1yZWZlcmVuY2Ugb2xkIG1haWxpbmcgbGlzdCB0aHJlYWRzLg0KDQpUaGFu
ayB5b3UgZm9yIHlvdXIgY29tbWVudC4NCkkgdW5kZXJzdG9vZCB5b3VyIHBvaW50Lg0KDQpCZXN0
IHJlZ2FyZHMuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDMw
LCAyMDIxIDc6MzYgUE0NCj4gVG86IElzaGlpLCBTaHV1aWNoaXJvdSA8aXNoaWkuc2h1dWljaGly
QGZ1aml0c3UuY29tPg0KPiBDYzogcWVtdS1hcm0gPHFlbXUtYXJtQG5vbmdudS5vcmc+OyBRRU1V
IERldmVsb3BlcnMNCj4gPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAzLzNdIHRhcmdldC1hcm06IEFkZCBBNjRGWCBwcm9jZXNzb3Igc3VwcG9ydCB0byB2
aXJ0DQo+IG1hY2hpbmUNCj4gDQo+IE9uIEZyaSwgMzAgSnVsIDIwMjEgYXQgMDQ6MDgsIFNodXVp
Y2hpcm91IElzaGlpIDxpc2hpaS5zaHV1aWNoaXJAZnVqaXRzdS5jb20+DQo+IHdyb3RlOg0KPiA+
DQo+ID4gRml4IGZvciBwYXRjaCBjb25zaXN0ZW5jeS4NCj4gPiBodHRwczovL2xpc3RzLmdudS5v
cmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNy9tc2cwNjk5My5odG1sDQo+IA0KPiBD
b21taXQgbWVzc2FnZXMgc2hvdWxkIGRlc2NyaWJlIHdoYXQgdGhlIHBhdGNoIGlzIGRvaW5nIGFu
ZCB3aHksIHNvIHRoZSByZWFkZXINCj4gY2FuIHVuZGVyc3RhbmQgaXQgd2l0aG91dCBoYXZpbmcg
dG8gY3Jvc3MtcmVmZXJlbmNlIG9sZCBtYWlsaW5nIGxpc3QgdGhyZWFkcy4NCj4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogU2h1dWljaGlyb3UgSXNoaWkgPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNv
bT4NCj4gPiAtLS0NCj4gPiAgZG9jcy9zeXN0ZW0vYXJtL3ZpcnQucnN0IHwgMSArDQo+ID4gIGh3
L2FybS92aXJ0LmMgICAgICAgICAgICB8IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RvY3Mvc3lzdGVtL2FybS92aXJ0LnJz
dCBiL2RvY3Mvc3lzdGVtL2FybS92aXJ0LnJzdCBpbmRleA0KPiA+IDI3NjUyYWRmYWUuLjUzMjll
OTUyY2YgMTAwNjQ0DQo+ID4gLS0tIGEvZG9jcy9zeXN0ZW0vYXJtL3ZpcnQucnN0DQo+ID4gKysr
IGIvZG9jcy9zeXN0ZW0vYXJtL3ZpcnQucnN0DQo+ID4gQEAgLTU1LDYgKzU1LDcgQEAgU3VwcG9y
dGVkIGd1ZXN0IENQVSB0eXBlczoNCj4gPiAgLSBgYGNvcnRleC1hNTNgYCAoNjQtYml0KQ0KPiA+
ICAtIGBgY29ydGV4LWE1N2BgICg2NC1iaXQpDQo+ID4gIC0gYGBjb3J0ZXgtYTcyYGAgKDY0LWJp
dCkNCj4gPiArLSBgYGE2NGZ4YGAgKDY0LWJpdCkNCj4gPiAgLSBgYGhvc3RgYCAod2l0aCBLVk0g
b25seSkNCj4gPiAgLSBgYG1heGBgIChzYW1lIGFzIGBgaG9zdGBgIGZvciBLVk07IGJlc3QgcG9z
c2libGUgZW11bGF0aW9uIHdpdGgNCj4gPiBUQ0cpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaHcv
YXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMgaW5kZXgNCj4gPiA4MWVkYTQ2YjBiLi4xMDI4NmQz
ZmQ2IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9ody9hcm0vdmly
dC5jDQo+ID4gQEAgLTIwMCw2ICsyMDAsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqdmFsaWRfY3B1
c1tdID0gew0KPiA+ICAgICAgQVJNX0NQVV9UWVBFX05BTUUoImNvcnRleC1hNTMiKSwNCj4gPiAg
ICAgIEFSTV9DUFVfVFlQRV9OQU1FKCJjb3J0ZXgtYTU3IiksDQo+ID4gICAgICBBUk1fQ1BVX1RZ
UEVfTkFNRSgiY29ydGV4LWE3MiIpLA0KPiA+ICsgICAgQVJNX0NQVV9UWVBFX05BTUUoImE2NGZ4
IiksDQo+ID4gICAgICBBUk1fQ1BVX1RZUEVfTkFNRSgiaG9zdCIpLA0KPiA+ICAgICAgQVJNX0NQ
VV9UWVBFX05BTUUoIm1heCIpLA0KPiA+ICB9Ow0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

