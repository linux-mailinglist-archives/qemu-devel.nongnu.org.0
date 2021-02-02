Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84A30B783
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 06:57:44 +0100 (CET)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6oh5-0006kj-Kt
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 00:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1l6ofl-0006KN-R4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:56:21 -0500
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1l6ofj-00041x-F7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:56:21 -0500
IronPort-SDR: CK2JlBG4Bu9vZLakRQxF1uK2eKGKeNEaPuSYgItMrmooMhYSn4Xl4J6VMCXIT/oNmoXs6NsB6o
 xnTi18HNqJLmTlAqiO9SM6qdrsfCpw7i8dZ6e4zdfIMRgYYiNH4gJG9IqKWvmZF7w1561GBkW/
 yHcjg4AaZIiNxxCmpDbI252XfvKhVb/OL/zb1wCz8NUH2h7qZG9A+5+MynAA9OUNwv8IetYWY0
 NIN7P+0mk7yntKlx7kwBZrBZwTmb2h/OnVzSEhXrPgWzEqpcQogjgrj0kdqqfXOW9p0NOod/x+
 ORY=
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="33612584"
X-IronPort-AV: E=Sophos;i="5.79,394,1602514800"; d="scan'208";a="33612584"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 14:56:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZVeFI6axaKp7aO4ztL/sEoFXPvCapk91294XCa76lp06nttxKrB4iBLagjILA/4ID8p2YIkqsUzjubwJ+bzZTwiB3zznWGgE/8ZaT6DbU670JpGkcMHM04WRT9JHf7TuokHlMYgL7o6HJxvDgyGKMH1ch17acdoeyu2117vQBtA4tsMtWL7TY6+KnH+gWTH5p5s5Cs81LuJ4tmj9zZDOBByxEFl04BozIEjLNHM6nTF/W2aNa6CoLdHt4+cusNZxE1WGXdKToSDmvHtfqD4CDu8ZCirIsHUqvZe6FrADHCy+7Xhh7+LYIcZeXUUoxMO/kfmxR5A94cHnDC97zRBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZkfdAWoRp59+h+z0g+37ESzYV4+kpo9bFyiTZ5hk0c=;
 b=E8SQ7k+qgpAJEs+weRVOTUHv350JyMsoqnoXj3BdR+aMmwEWx4iQvi2siTCUHDYf0TOP6Cid6QKKI5/SvjkHO8b/6mAONVIUp9CPoaQRpBFtUZKO0w39+mdGx9WMo4mEB5zqOrMTmADxDkMRW4TLjATyPTzvjOrwmuAWVp+vEa10GWXTnVI2gLGNQc4XGmEVouL306bBg+HoZbBgL/vN/QmeNkJIC4zK60KjKoEDkY2u9xAvpxYQVbYGGRDcGap7BrnL4bDEdJe07EinPy69qmm4cguJWS5RCLNp+uKN/ssYIGzWUKMr5CJlCsY/Flwr/hnLrrJe3/22kbc/bZiZnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZkfdAWoRp59+h+z0g+37ESzYV4+kpo9bFyiTZ5hk0c=;
 b=B2YrwMyu5/z5ElA6DA0s4onpnFBOpXguRb4pJPsl9mvaaYv/ajeXqYQHyRlcKtKlvRqxxGoL7sQHspNdYF3CHcudeSsa5x+KonTVZWCu6T//wylxSeAgtxovw89cKOoj95ZaUjM7PsiJTZ7F/iMPMiNpVo/RbynV8sszzPNh71w=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OS0PR01MB5490.jpnprd01.prod.outlook.com (2603:1096:604:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 05:56:11 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3805.026; Tue, 2 Feb 2021
 05:56:11 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Wainer dos Santos Moschetta' <wainersm@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/1] virtiofsd: Allow to build it without the tools
Thread-Topic: [PATCH 1/1] virtiofsd: Allow to build it without the tools
Thread-Index: AQHW+N9bsku7d17WrEGv89D+jY4M46pEXMdw
Date: Tue, 2 Feb 2021 05:55:02 +0000
Deferred-Delivery: Tue, 2 Feb 2021 05:56:01 +0000
Message-ID: <OSBPR01MB45828271AC8D2F8F5FAA52D7E5B59@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210201211456.1133364-1-wainersm@redhat.com>
 <20210201211456.1133364-2-wainersm@redhat.com>
In-Reply-To: <20210201211456.1133364-2-wainersm@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: 818ab6ef50f743c89a186a9e8c27c251
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52353681-bd0c-49fe-eaf3-08d8c73f3e30
x-ms-traffictypediagnostic: OS0PR01MB5490:
x-microsoft-antispam-prvs: <OS0PR01MB5490F2840C7D569B096C1235E5B59@OS0PR01MB5490.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bt2pYiPNqWS3/lY5CFGaiIu51zLoT2L4kTO7iWC2U3Bendzn2YIl8Wq/qUHrLADk448PJw39wSAVbmOTri8DW6QKXaT3cAF9YhqDk03y1YOk+4RK3VDc289UpA0EP45QqmrqZEsVQ4Eex6oyFbTO2XOJq673DgXm7X6bicf8I/bS9eUskDRv39tpqjLJ0uvjzcl+FKqq6koMJz+gqK6jdBFcdTEzcy9p89jwMW0hxfkMj7Y1Jxq+E1lZ4nQlz06YSy1/B+zcrzArdP95esfcvBCOXuR5m/heTES99GnuCt1TwjW9VuF9pMiCsFQ3OgP4Ld2bFnf9dwMBELmONX4Ku6kthUb5Ay2BVUcpnsTD/aC3UdJjXzJCPjuiEIQ9WV9eBBgIcxE/YTpGw+ChALIqVqz5wYukeTDbdVULtuawElws0OM1h5shCwHYArem/1TBdBsQtXQVIPBmwTGfmoztEJA0X2k+TViraL9ac2ihZuM6xDPELmhS72+V2YwlYnEWbn0cyuIwA+D9+Gk0p2jtKEqUzXEH6MCpm0g2POByyV/hKfMFLsvtRw+1Y7ZexpzJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(52536014)(26005)(6506007)(83380400001)(478600001)(66556008)(5660300002)(64756008)(66476007)(7696005)(66446008)(186003)(4744005)(8676002)(85182001)(4326008)(8936002)(71200400001)(316002)(6666004)(66946007)(54906003)(2906002)(110136005)(55016002)(33656002)(76116006)(86362001)(9686003)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?OHFZcmpXWGIxZ0IzS0lkT1g0aDZXTUY1b2Z5cnVYaVBIMjVVeSt4c091?=
 =?iso-2022-jp?B?RGNkNS9mRUpNOGdsWnh6eGFxOWRCbWI2cERPU2F0c2gzUkpsc0x1eThZ?=
 =?iso-2022-jp?B?eWtZUUY4TGxVNEtGZVVHQ3ZRLzd0aGw0MU5xYmxYeFZJVit0Uk0vajI1?=
 =?iso-2022-jp?B?K09zWG1UdkNwcFpSZDM5T0tPRkpIMEhMOUZydTNUaGpiZGh5MmhoNERS?=
 =?iso-2022-jp?B?cmkxa1NYVjk1WDdqdGI4SjFXRkJIdE00ZUh0cEtPS0dGc284TzhMT2Vj?=
 =?iso-2022-jp?B?SGxqT0VpcU1UTEEzZ3drVWNUNjlHUmxiSnV6L0NIWFVwbVBDSnJxNys2?=
 =?iso-2022-jp?B?REJ3WTBVRm1McUFDUHJlZ2hQdGRPeXNRNGF1YkFiMWRYM29MLzdKZUtJ?=
 =?iso-2022-jp?B?ZXRZcWs5TW9LYkc0UFZCWVJxeGx2SmJNK0taY0NhRmFialZoVXViMEhx?=
 =?iso-2022-jp?B?cW02dVlJNW1jYW5MYndGTXJza3RlcjhJU2REVGlGNEZ3U3FIZ0FaV3RX?=
 =?iso-2022-jp?B?ME90YnJOT2E3NEV5Z2h0ekJ4KzBJQ1IzMEJvYzRpelVhdmhNcUVJajVK?=
 =?iso-2022-jp?B?a0NiUGMwcXpwSUpSVTBaS1hNWEwxczVWSkFzZ1AxNUxtQ0lkTFpVbGQy?=
 =?iso-2022-jp?B?TkJZbmFUblJwU3ZiVlJCeUZoZU9oVWVNZXhDUXlLeE1LNWx6a3FtelIv?=
 =?iso-2022-jp?B?V0kxRVh0OVN3ZWEzV0J0WmRYRWJiQkVwRTIwcnR1UWduSXhJdEZmNVNo?=
 =?iso-2022-jp?B?bFloMHFpbHZNUXFER0N2QXMzUUY4TXNDSlVvVkxGTHYvMmhGNkRPTVBz?=
 =?iso-2022-jp?B?bnU1aXQrNW5kMEp6WmY1ckZHZjYrUURhSDBPR2l2RlRRVS9XY0dxbEhM?=
 =?iso-2022-jp?B?UEs5cUN5KytYcWhpcVU2Ykw5NHJuaUp5cXMzUzVZVFIyeU9RaXViRHhY?=
 =?iso-2022-jp?B?RndSK0pHZW1SL1ZhVDM1Tm9Ic1V0eUhkdTJSS2lIamFXcmR4L0FZeTBR?=
 =?iso-2022-jp?B?MDFCeTQxWmxzd3dZUWJkYk9IcStROEUzeHpvWjh6bkdGNEprSndBYW9I?=
 =?iso-2022-jp?B?bUF6ZkZ4UncweEdPdC9KdHZWM3BOT2RuSEI0ZUVLcTBxck8xQXlWZXpq?=
 =?iso-2022-jp?B?OTNEcDVQc0JnVENsVHBKWGdUTFVLN2o1QUdnVXBvNWxmTkNjQ1pWcElX?=
 =?iso-2022-jp?B?M1VpbFBqTjduU1lkamJ3bFV5U1h1SzZ5dnMxNmxibnFBWks5N0JSelIy?=
 =?iso-2022-jp?B?RnpNQlZlR21GajExdEwvUVdEOEpaeUJjSHp4aERORHZXT2FHd0MrUXUx?=
 =?iso-2022-jp?B?blZhc3h4TE1RYmZBaE80OUdmZGY1RGZPRm0yS1ZpWTNPalhVTFVYdmt1?=
 =?iso-2022-jp?B?UEN4cldSVGtxNy9ZYTN4Y1N6QlNyVmhJOXpMUTcxVWo5SUw0QVBBQUJB?=
 =?iso-2022-jp?B?RGE0V2F0Ymc2SCt6dmFlcDZEWnZtWUpBRHBTKzhCUDNYSWJKZGVNOUVa?=
 =?iso-2022-jp?B?bll0OXVpZXBmUVlYcjBUaUdrekVwMFlUeldYUnlYMUd6N0I1cmQ=?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52353681-bd0c-49fe-eaf3-08d8c73f3e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 05:56:11.2755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7o2k0ZJt4JGT9TDxAi2zrW7M7vR/dt++4uMUIeL+b04pQvoe0vqcMAtiiKRImZYE7LxRl+Ps4DQLvuSKOagbbRokY4sI8hehqL2MoKyD2zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5490
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=misono.tomohiro@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Subject: [PATCH 1/1] virtiofsd: Allow to build it without the tools
>=20
> This changed the Meson build script to allow virtiofsd be built even
> though the tools build is disabled, thus honoring the --enable-virtiofsd
> option.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

I misunderstood that virtiofsd builds somehow depends on tools build at tha=
t time.
Thanks for fixing. I did quick build test.

Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

