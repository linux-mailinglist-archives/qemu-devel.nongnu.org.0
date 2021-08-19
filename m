Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C750C3F12B2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 07:18:50 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGaS1-0001ks-CD
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 01:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mGaR7-0000q4-6z; Thu, 19 Aug 2021 01:17:53 -0400
Received: from esa12.fujitsucc.c3s2.iphmx.com ([216.71.156.125]:6151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mGaR4-0002nr-C8; Thu, 19 Aug 2021 01:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629350271; x=1660886271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FbsBuQdO4QnHNvIKyZBFdCNUoh464TiQyVgcinZistM=;
 b=P6xxMOi1gq4aQ6Lj7FCAZ8av2NlY+G7RqwDmG+6jL5q9Bc6E8sGaHS9M
 G9damYJikCV9HGFBBaK5f24zEJcm9vcI5CElpAdHN53d61IiY/9FcLyis
 RKA9lLcs92vW4NRfyNTlrM1IDnBjyVaZJBQIhx6Ft6FMk71JJu5W87pEu
 So6+qFd5rJfMqN06HfKFnCncjhbmZU9q+WG8wUZWWokDIPjX26wFZNztm
 0os5htwb1H4R2NV0kjxakpU8TOiYJErKcmFhtvmDhau7ENr06kfZWZDNm
 TjrXnYZ5Ld4BuI43ELaljCvcR+JbBmQAmic1rj8cijZO4Sgp7UAoBJlRM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="37026040"
X-IronPort-AV: E=Sophos;i="5.84,333,1620658800"; d="scan'208";a="37026040"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 14:17:47 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8IjcdDqRFpFoT/3XxDTadE1DspHMlmriDBhqRtkAplxLTj7YSxdrJNdlHNZalqpkM0sDN6F3R0b9bRVvJ/LP9w4beILWLEYYFOc42lrcD0GgMN0I5qkax5iSz8n26NpRcay0jKQ3pc/QywhFzVqSpmNgMill2hXwPTFByGwlzmMUe0EZiAtZBLFlwlBakRnJXyaR85R+asYa9n+e/n5GSNz9wRphM0Z7HTz/MRXCt8JXIMAfzFen5ICOQFYfh44FviF6D45N9BC81jWwr76RI6QGfVj5v9wIUU26r66uWAA52EV28qeXS8/1sUik0bL19f6A+UE7KQcqpiEvfZQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbsBuQdO4QnHNvIKyZBFdCNUoh464TiQyVgcinZistM=;
 b=gx+5MyIcfV5HEhEW2d4iKfUN/m9J5rW5cqECrPPtdbPIlcV0WyKPxN3T4xmsDTEnmw1PV2JfOmvVLlmLz74xO9BHoz/eGB+AG8l+jEQm+zs6nT9uCS1SN8KfahQT4udCpyhtILKvBDjWKCJMwXWP9KHPorQvooiX/yVuwmemJLPzM74v0f69gEPLLSnAWN+PIwWSga1wtB76/UyE3PQ9hEFUgk1TxUeMo9HbGILWyx+JRRcIQVcQmGvH0J0BoHixOqDgVb7dg/EHV6v2xHv+mmnjH4lCQE3NmsMY7bkUYsWdzKROBRGiQQ/5FfLl2hYZn9vseObeG033x0hpS3yl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbsBuQdO4QnHNvIKyZBFdCNUoh464TiQyVgcinZistM=;
 b=WYvmERf4pSnKEMxGOnbdRdYfGOrO7y3SSvhHZxc+2vGqhR8lQ7eZ8ALutcpXy7uPLLAkskFYVx0b/0KtkZa0oWH8LTRJGZckjPnfLFrJp7WWixIJ/FbJmBxaImH1Mk7Sdrs8pTR+yaoY52xTSKysJe7H51IOZTUIFEnc/O773Rw=
Received: from OS3PR01MB6151.jpnprd01.prod.outlook.com (2603:1096:604:d7::14)
 by OSBPR01MB1767.jpnprd01.prod.outlook.com (2603:1096:603:2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Thu, 19 Aug
 2021 05:17:43 +0000
Received: from OS3PR01MB6151.jpnprd01.prod.outlook.com
 ([fe80::496f:71bd:5d73:6c5d]) by OS3PR01MB6151.jpnprd01.prod.outlook.com
 ([fe80::496f:71bd:5d73:6c5d%3]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 05:17:43 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Index: AQHXj0JXKFl553Ufz0WuhVfBX6IF0atvlwsAgAACXYCABzQ/oIAA0a+AgAA5wICAAAO8gIAABLoAgAAJrICAAJht0IAAfBsAgAFQXfA=
Date: Thu, 19 Aug 2021 05:17:42 +0000
Message-ID: <OS3PR01MB615133E9E8A7A22C0F6A4CB8E9C09@OS3PR01MB6151.jpnprd01.prod.outlook.com>
References: <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
 <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
 <20210817162811.u3i5hcx7eg52akyq@gator.home>
 <TYCPR01MB6160151837F9C9C4167BB1B9E9FF9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210818085756.33lvgz2b6wnhwjn4@gator.home>
In-Reply-To: <20210818085756.33lvgz2b6wnhwjn4@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MTg1NTkyYzctMzBmMC00MDBjLWI1YTctOGRjM2ZmMzEy?=
 =?utf-8?B?NTcyO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wOC0xOVQwNTowMTo0OVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc2ab4de-67fb-488e-96aa-08d962d0ac20
x-ms-traffictypediagnostic: OSBPR01MB1767:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1767C6C40C74F4E368F6B269E9C09@OSBPR01MB1767.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ix+ChU5XgkFQO+dUuIYFF7YukTrit7gwQE7h0gYrzrxYgbiFwWtfxXAgHCjeMkmojGka1AuXYeJPhzsvFeE9VcdcCHVpwI+Oeup2e6S5hGRy04/w4A+aRcjRmYRSY/VVyQC+laXTfAfyEv+YjwSJukXKiAtRQzX3P8LdXXTZ9XLyIKZMGOrbDfFk+ZJcy89cCCXwNKynOLDV22Yydn+Yq1wVRhCNlThpd/oizmjNlR3Em8PgmUAWYdduefJNm+T0ynwtEe0RA80pvh+55W4UB4XbAewpReZkT3kYuYONRm2N2sfpNgoesr13pS3VLu64L66Beiq6ij4GH2JtjL1NwOyZ8x7wHKu+UGqTMVaz1tBs2u8FxaIZw05pqeWRZhVANBPDHVJj42uxl1Q9OxD1DUjqR/aexJ20sg+LhOxJa27H/rQDJPoBAjWdcBw8Pw6Y1jwJJJBLmsDw4FP66juD3RBJL2yOe5qb9rJ1oG2VIrvP/uLmFA1ZvTvT+VlBpv3AK0AS0bK1wbFrGl9oDenl+CX0TC8xUBzSd8SM8oxvvup1NjDS7WISATP4klcotBgreDSJTer682jWdfGooEWzkoMJozMYPWNyQoTesNSN9iXsyIC9UJSjlWywqn/YU83u4T/vOx+Vuqlcl8qMnnYVvWfmlWJFED1/6bshcGXc4fYs3IVeiBaGY8kejlcmWYI9g9+Qxl05B8MkTLUC0MrhWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6151.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(54906003)(38070700005)(186003)(55016002)(4326008)(9686003)(5660300002)(122000001)(26005)(6916009)(33656002)(71200400001)(107886003)(85182001)(38100700002)(2906002)(8936002)(66946007)(316002)(53546011)(6506007)(66446008)(66556008)(66476007)(7696005)(76116006)(64756008)(83380400001)(52536014)(8676002)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHpZNTlKc1UyRUJyZjlEZWRnWHBqZGkvaEQ2UWplU093eDN5OXVFMnZPVURC?=
 =?utf-8?B?YTZrdWVYMUZycEdYdjFaTlk0U21vYmtkYVRZbFBSK3pkbFlXRTV6YnovQTNw?=
 =?utf-8?B?aDBCaldqb1g5ZHFTYnpFN2F3NFcxUEZlcndPR1hXUEpiSlFaWElSb1ladDl6?=
 =?utf-8?B?TGc2QlFteWV3L2JhSWxVZkFkU01QVDhGeCtHa0dpa2hKd2dHZ0NVWDRJWGUw?=
 =?utf-8?B?VVoyZzFVV1daQXVTZjhOVnhpektESUgwbXpMRHlHbnJ1Yi9zODhkU1YyRno5?=
 =?utf-8?B?S0IzUlVZalh1TzUvNk4wQ2xYOXNNUnFScFRaMXJHQ3U1UGo3bTl1dHI5UUQ5?=
 =?utf-8?B?MS91V2tZdCtFUFo2QXhKOFZIRG1tamNCdGNrWHRvbTJPVGVuTGlOT2dWenhY?=
 =?utf-8?B?SnhCaDR3Tmg2WjJialpReUc4TlA0ZXgzb2Y2ZUdvbk0xdXU2WXJRSVV3NDE4?=
 =?utf-8?B?QUVlQ2NaUS9jUTNtanoxRUNUUnJkZnV1RHY2R05kVzVlU3NtRG9JZ0YvajBV?=
 =?utf-8?B?bU1lSzVML0ZEQzMwNHBFemx0RGVOUkVpLzJqU0owcHVyZGM3NmQ1dTZ6OGk5?=
 =?utf-8?B?SFdEc1ZjUmMvMXpERUhmWndtUFlFTm41dndDYWNHT2g5eDkrNVljalJGRE1u?=
 =?utf-8?B?N2hHRmZvQVlkdG9Md3ZpT1dPRTdLMGhDNHgvczYrazQwd3l0RTkyV1ZaNWFq?=
 =?utf-8?B?YldJMUVHOTYvdWNXcGRJRkt4cVhRazBVVVF3TGo0RC92TXBMUDh6OERXWTZj?=
 =?utf-8?B?YkxKWnRHOXpaOVVVQlFjL1BERGVZOU8rai9PeEZFMFdGcXFYVmdhUkRnbndJ?=
 =?utf-8?B?dmo2RTJ1SGdjSFBycDlsUU5ETmEvYmE5ZGlISFNpZ0lQZWs4MjVTcXQ1MWEx?=
 =?utf-8?B?N2lzN2ozczNjdEErU3pwd0FOYW5VbEI1Tys2RFZOcWNYaFN1SlhmWlNlSVAx?=
 =?utf-8?B?WTE1bkUzaFVBTUIyNjlyQjB4cFRaT0h6WVdwbUVzR3ZIT240dGV1RmtCbUtT?=
 =?utf-8?B?SGFMMlpoWnFBbnFNWUNPSTVNajJQVG9mTkxHVmtoeERwUXcrVDVMbWpIS0I5?=
 =?utf-8?B?bXJuWm44YmhoZkN3eWp5ZXUvUWlncTRrN21uakpma3U2aEYzZHRRbCtvZ3ll?=
 =?utf-8?B?TWJNMkJTWWpxVFBjQ24vTU1IRG5FRXlIMmZpU1UrVTF2QnlCVHp2TURNWUlz?=
 =?utf-8?B?V0lOSzFZTGF4ZjJuUEZCNzFBNjgwRzJySGcxMno3RVZtUzNrTFN1ZFRiaWQz?=
 =?utf-8?B?RGJPUnUrVnVIcmNPRU1UWTRvT0dqeDBISlJFcjlNbjBaaDRGV2k5OVp5U05P?=
 =?utf-8?B?UnF1L3o4bjlrVVl6NHVBTWZWTkdnS1doMVFLVG5ScW1OUGpwMkZBMHVRQ21s?=
 =?utf-8?B?TTJvWGpHWDFZeW1JWDhvc2loMmdmK1d1bytnV1pBTW1BdHppZnF5T2hPU3VI?=
 =?utf-8?B?QXdqSDlvandtWjE4OS9LNCtKMVZ1enUvU0dXcUlTM21GVFkya003SWRSTUxK?=
 =?utf-8?B?Zy94Ylh6aHZRWTA0YkwwdkhwV2xTRjczbTEwVUxjWFBUSmhzWEFXa3VEbVlU?=
 =?utf-8?B?NGRuYWpPeDR4ZFdOMExhVmtQMDNFNUpDM1FVWkIyNXZVUGhrRUZGS2Z2R2J2?=
 =?utf-8?B?Z3Rkb2o0QVdEckpWc0VxSFJxd2g1enRTMWFxZ0d4YzIwMTJwYVdMeGtmZ2Rh?=
 =?utf-8?B?MVpZbjY5SjdBNXVneXBVKzY2c2ZyUkJ1dDFJbVh5cXkvRjg2Uzg0TGMzTFY1?=
 =?utf-8?Q?hmLJvxjPXDAqzlQLeKKIXt0zwnzHFODZ2VCie9U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6151.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2ab4de-67fb-488e-96aa-08d962d0ac20
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 05:17:42.9465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9tB/cV46EuI7QykliXPXzx2KQED23N7OXWUSiWCXSQ21nfT+CfKX+xltZvG4xPPOkIDd/NCTDcHbLKAS5B7nnggc9SWs8bmj2RCfns2fKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1767
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBJIHRoaW5rIHRoaXMgd2lsbCBiZSBtb3JlIGNsZWFyIG9uY2UgSSBnZXQgdGhlIHBhdGNoIHBv
c3RlZCAod2hpY2ggSSBoYXZlbid0IHN0YXJ0ZWQNCj4gd3JpdGluZyB5ZXQpLiBJJ2xsIHRyeSB0
byBnZXQgaXQgcG9zdGVkIGJ5IHRvbW9ycm93IGV2ZW5pbmcgdGhvdWdoLCBzaW5jZSBJIGhhdmUN
Cj4gdmFjYXRpb24gb24gRnJpZGF5Lg0KDQpXaGlsZSBBbmRyZXcgaXMgd29ya2luZyBvbiB0aGUg
cGF0Y2ggaW4gYSBodXJyeSwgDQpJJ20gc29ycnksIEknbGwgYmUgb24gdmFjYXRpb24gZm9yIGEg
d2hpbGUgc3RhcnRpbmcgRnJpZGF5IHRvbywNCnNvIG15IHJlcGx5IHdpbGwgYmUgZGVsYXllZC4N
Cg0KQmVzdCByZWdhcmRzLg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQW5kcmV3IEpvbmVzIDxkcmpvbmVzQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
QXVndXN0IDE4LCAyMDIxIDU6NTggUE0NCj4gVG86IElzaGlpLCBTaHV1aWNoaXJvdS/nn7PkupUg
5ZGo5LiA6YOOIDxpc2hpaS5zaHV1aWNoaXJAZnVqaXRzdS5jb20+DQo+IENjOiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47DQo+IHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS8zXSB0YXJnZXQtYXJtOiBBZGQgc3VwcG9ydCBmb3Ig
RnVqaXRzdSBBNjRGWA0KPiANCj4gT24gV2VkLCBBdWcgMTgsIDIwMjEgYXQgMDg6Mjk6MTVBTSAr
MDAwMCwgaXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tIHdyb3RlOg0KPiA+DQo+ID4gV2UgYXBw
cmVjaWF0ZSBldmVyeW9uZSdzIGNvbW1lbnRzLg0KPiA+IEJlZm9yZSBtYWtpbmcgdGhlIFY1IHBh
dGNoLCBwbGVhc2UgbGV0IG1lIGNoZWNrIHRoZSBwYXRjaCBjb250ZW50cy4NCj4gPg0KPiA+ID4g
VGhpcyBsb29rcyByZWFzb25hYmxlIHRvIG1lLCBidXQgeW91IGFsc28gbmVlZCB0aGUgJ3N2ZScg
cHJvcGVydHkNCj4gPiA+IHRoYXQgc3RhdGVzIHN2ZSBpbiBzdXBwb3J0ZWQgYXQgYWxsLg0KPiA+
ID4gPiA+IFNvIG1heWJlIHdlIHNob3VsZCBqdXN0IGdvIGFoZWFkIGFuZCBhZGQgYWxsIHN2ZSog
cHJvcGVydGllcywNCj4gPg0KPiA+IEluIHJlc3BvbnNlIHRvIHRoZSBhYm92ZSBjb21tZW50LA0K
PiA+IFdlIHVuZGVyc3Rvb2QgdGhhdCB0aGUgc3ZlIHByb3BlcnR5IHdpbGwgYmUgYWRkZWQgdG8g
dGhlIHY0IHBhdGNoLg0KPiA+DQo+ID4gaS5lLg0KPiA+IChRRU1VKSBxdWVyeS1jcHUtbW9kZWwt
ZXhwYW5zaW9uIHR5cGU9ZnVsbCBtb2RlbD17Im5hbWUiOiJhNjRmeCJ9DQo+ID4geyJyZXR1cm4i
OiB7Im1vZGVsIjogeyJuYW1lIjogImE2NGZ4IiwgInByb3BzIjogeyJzdmUxMjgiOiBmYWxzZSwN
Cj4gPiAic3ZlMjU2IjogdHJ1ZSwgInN2ZSI6IHRydWUsICJzdmU1MTIiOiB0cnVlLCAiYWFyY2g2
NCI6IHRydWUsICJwbXUiOg0KPiA+IHRydWV9fX19DQo+ID4NCj4gPiA+ID4gPiBidXQNCj4gPiA+
ID4gPiB0aGVuIG1ha2Ugc3VyZSB0aGUgZGVmYXVsdCB2cSBtYXAgaXMgY29ycmVjdC4NCj4gPg0K
PiA+IEZ1cnRoZXJtb3JlLCBXZSB1bmRlcnN0b29kIHRoYXQgSSBuZWVkIHRvIGFkZCB0aGUgYWJv
dmUgcHJvY2VzcyBhcyB3ZWxsLCBpcw0KPiB0aGF0IGNvcnJlY3Q/DQo+ID4NCj4gPiA+IFRoYXQn
cyBhIGdvb2QgaWRlYS4gSSdsbCBzZW5kIGEgcGF0Y2ggd2l0aCB5b3VyIHN1Z2dlc3RlZC1ieS4N
Cj4gPg0KPiA+IElmIHRoYXQncyBjb3JyZWN0LA0KPiA+IEluIHRoZSBjdXJyZW50IHY0IHBhdGNo
LCBpbiB0aGUgYWFyY2g2NF9hNjRmeF9pbml0Zm4gZnVuY3Rpb24sIHRoZQ0KPiA+IGE2NGZ4X2Nw
dV9zZXRfc3ZlIGZ1bmN0aW9uIGlzIGV4ZWN1dGVkIHRvIHNldCB0aGUgU1ZFIHByb3BlcnR5LCBh
bmQNCj4gPiB0aGUgYXJtX2NwdV9zdmVfZmluYWxpemUgZnVuY3Rpb24gaXMgbm90IGNhbGxlZC4N
Cj4gPg0KPiA+IEluIHdoaWNoIGZ1bmN0aW9uIGlzIGl0IGFwcHJvcHJpYXRlIHRvIGV4ZWN1dGUg
dGhlIG1vZHVsbyBtYXhfdnENCj4gPiBmdW5jdGlvbiAob3IgZXF1aXZhbGVudCBwcm9jZXNzKT8N
Cj4gPg0KPiA+IElmIFdlIGFyZSBub3QgdW5kZXJzdGFuZGluZyB5b3UgY29ycmVjdGx5LCBXZSB3
b3VsZCBhcHByZWNpYXRlIHlvdXINCj4gPiBjb21tZW50cy4NCj4gDQo+IFJpY2hhcmQncyBzdWdn
ZXN0aW9uIGlzIHRvIGdlbmVyYWxpemUgdGhlICJzdXBwb3J0ZWQiIGJpdG1hcCBjb25jZXB0LCB3
aGljaCBpcw0KPiBjdXJyZW50bHkgb25seSB1c2VkIGZvciBLVk0sIGluIG9yZGVyIHRvIGFsc28g
dXNlIGl0IGZvciBUQ0cgY3B1IG1vZGVscy4gVGhlICdtYXgnDQo+IGNwdSB0eXBlIHdpbGwgaGF2
ZSB0aGUgdHJpdmlhbCBhbGwtc2V0IHN1cHBvcnRlZCBiaXRtYXAsIGJ1dCB0aGUgYTY0Znggd2ls
bCBoYXZlIGENCj4gc3BlY2lmaWMgb25lLiBJIHBsYW4gdG8gZG8gdGhpcyAic3VwcG9ydGVkIiBi
aXRtYXAgZ2VuZXJhbGl6YXRpb24gYW5kIGFwcGx5IGl0IHRvIHRoZQ0KPiBUQ0cgbWF4IGNwdSB0
eXBlLiBZb3UnbGwgbmVlZCB0byByZWJhc2UgdGhpcyBzZXJpZXMgb24gdGhvc2UgcGF0Y2hlcyBh
bmQgcHJvdmlkZQ0KPiB0aGUgYTY0Znggc3VwcG9ydGVkIGJpdG1hcC4NCj4gDQo+IEkgdGhpbmsg
dGhpcyB3aWxsIGJlIG1vcmUgY2xlYXIgb25jZSBJIGdldCB0aGUgcGF0Y2ggcG9zdGVkICh3aGlj
aCBJIGhhdmVuJ3Qgc3RhcnRlZA0KPiB3cml0aW5nIHlldCkuIEknbGwgdHJ5IHRvIGdldCBpdCBw
b3N0ZWQgYnkgdG9tb3Jyb3cgZXZlbmluZyB0aG91Z2gsIHNpbmNlIEkgaGF2ZQ0KPiB2YWNhdGlv
biBvbiBGcmlkYXkuDQo+IA0KPiBUaGFua3MsDQo+IGRyZXcNCj4gDQo+IA0KPiA+DQo+ID4gQmVz
dCByZWdhcmRzLg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogQW5kcmV3IEpvbmVzIDxkcmpvbmVzQHJlZGhhdC5jb20+DQo+ID4gPiBTZW50OiBXZWRu
ZXNkYXksIEF1Z3VzdCAxOCwgMjAyMSAxOjI4IEFNDQo+ID4gPiBUbzogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4gPiBDYzogSXNoaWksIFNodXVp
Y2hpcm91L+efs+S6lSDlkajkuIDpg44gPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbT47DQo+
ID4gPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzNdIHRhcmdl
dC1hcm06IEFkZCBzdXBwb3J0IGZvciBGdWppdHN1DQo+ID4gPiBBNjRGWA0KPiA+ID4NCj4gPiA+
IE9uIFR1ZSwgQXVnIDE3LCAyMDIxIGF0IDA1OjUzOjM0QU0gLTEwMDAsIFJpY2hhcmQgSGVuZGVy
c29uIHdyb3RlOg0KPiA+ID4gPiBPbiA4LzE3LzIxIDU6MzYgQU0sIEFuZHJldyBKb25lcyB3cm90
ZToNCj4gPiA+ID4gPiBPbiBUdWUsIEF1ZyAxNywgMjAyMSBhdCAwNToyMzoxN0FNIC0xMDAwLCBS
aWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIDgvMTcvMjEgMTo1NiBBTSwg
QW5kcmV3IEpvbmVzIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBJIGd1ZXNzIGl0J3MgZmluZS4gWW91
IGNvdWxkIGVhc2lseSBjcmVhdGUgYSBuZXcNCj4gPiA+ID4gPiA+ID4gY3B1X2FybV9zZXRfc3Zl
X3ZxKCkgd2hpY2ggd291bGQgZm9yYmlkIGNoYW5naW5nIHRoZQ0KPiA+ID4gPiA+ID4gPiBwcm9w
ZXJ0aWVzIGlmIHlvdSB3YW50ZWQgdG8sIGJ1dCB0aGVuIHdlIG5lZWQgdG8gYW5zd2VyDQo+ID4g
PiA+ID4gPiA+IFBldGVyJ3MgcXVlc3Rpb24gaW4gb3JkZXIgdG8gc2VlIGlmIHRoZXJlJ3MgYSBw
cmVjZWRlbnQgZm9yIHRoYXQgdHlwZSBvZg0KPiBwcm9wZXJ0eS4NCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiBJIGRvbid0IHNlZSB0aGUgcG9pbnQgaW4gcmVhZC1vbmx5IHByb3BlcnRpZXMuICBJ
ZiB0aGUgdXNlcg0KPiA+ID4gPiA+ID4gd2FudHMgdG8gc2V0IG5vbi1zdGFuZGFyZCB2YWx1ZXMg
b24gdGhlIGNvbW1hbmQtbGluZSwgbGV0DQo+ID4gPiA+ID4gPiB0aGVtLiAgV2hhdCBpcyBtb3N0
IGltcG9ydGFudCBpcyBnZXR0aW5nIHRoZSBjb3JyZWN0IGRlZmF1bHQgZnJvbSAnLWNwdQ0KPiBh
NjRmeCcuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gbWF5YmUgd2Ugc2hv
dWxkIGp1c3QgZ28gYWhlYWQgYW5kIGFkZCBhbGwgc3ZlKiBwcm9wZXJ0aWVzLA0KPiA+ID4gPiA+
IGJ1dCB0aGVuIG1ha2Ugc3VyZSB0aGUgZGVmYXVsdCB2cSBtYXAgaXMgY29ycmVjdC4NCj4gPiA+
ID4NCj4gPiA+ID4gSSB0aGluayB0aGF0J3MgdGhlIHJpZ2h0IGFuc3dlci4NCj4gPiA+ID4NCj4g
PiA+ID4gUHJlc2VudGx5IHdlIGhhdmUgYSBrdm1fc3VwcG9ydGVkIHZhcmlhYmxlIHRoYXQncyBp
bml0aWFsaXplZCBieQ0KPiA+ID4gPiBrdm1fYXJtX3N2ZV9nZXRfdmxzKCkuICBJIHRoaW5rIHdl
IHdhbnQgdG8gcmVuYW1lIHRoYXQgdmFyaWFibGUNCj4gPiA+ID4gYW5kIHByb3ZpZGUgYSB2ZXJz
aW9uIG9mIHRoYXQgZnVuY3Rpb24gZm9yIHRjZy4gUHJvYmFibHkgd2Ugc2hvdWxkDQo+ID4gPiA+
IGhhdmUgZG9uZSB0aGF0IGJlZm9yZSwgd2l0aCBhIHRyaXZpYWwgZnVuY3Rpb24gZm9yIC1jcHUg
bWF4IHRvIHNldCBhbGwgYml0cy4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlbiBlbGltaW5hdGUgbW9z
dCBvZiB0aGUgb3RoZXIga3ZtX2VuYWJsZWQoKSBjaGVja3MgaW4NCj4gPiA+ID4gYXJtX2NwdV9z
dmVfZmluYWxpemUuICBJIHRoaW5rIHRoZSBvbmx5IG9uZSB3ZSBrZWVwIGlzIHRoZSBsYXN0LA0K
PiA+ID4gPiB3aGVyZSB3ZSB2ZXJpZnkgdGhhdCB0aGUgZmluYWwgc3ZlX3ZxX21hcCBtYXRjaGVz
IGt2bV9lbmFibGVkDQo+ID4gPiA+IGV4YWN0bHksIG1vZHVsbw0KPiA+ID4gbWF4X3ZxLg0KPiA+
ID4gPg0KPiA+ID4gPiBUaGlzIHNob3VsZCBtaW5pbWl6ZSB0aGUgZGlmZmVyZW5jZXMgaW4gYmVo
YXZpb3VyIGJldHdlZW4gdGNnIGFuZCBrdm0uDQo+ID4gPg0KPiA+ID4gVGhhdCdzIGEgZ29vZCBp
ZGVhLiBJJ2xsIHNlbmQgYSBwYXRjaCB3aXRoIHlvdXIgc3VnZ2VzdGVkLWJ5Lg0KPiA+ID4NCj4g
PiA+IFRoYW5rcywNCj4gPiA+IGRyZXcNCj4gPg0KDQo=

