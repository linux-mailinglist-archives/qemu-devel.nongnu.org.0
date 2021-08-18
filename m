Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C583EFF2C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:31:24 +0200 (CEST)
Received: from localhost ([::1]:52094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGGyp-0000F0-1j
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mGGwx-0007BL-22; Wed, 18 Aug 2021 04:29:27 -0400
Received: from esa13.fujitsucc.c3s2.iphmx.com ([68.232.156.96]:35627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mGGwu-00025n-19; Wed, 18 Aug 2021 04:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629275364; x=1660811364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xL4WzQoh7d1B5O3HYzu/nrtfOb4zRL0D+MwkTOg0gj0=;
 b=LJTPAXhWR5QZMSfV/MCB7CJnEaA3qmTtN+I9vJInoJmKgHhaXIS/U00q
 TmvKZJjWDL4TlZXsh2q3MgP4MwPUNVgRJSlzacYVQvKl4UKXilyrFj73C
 Kvugdx9DJP37BROtKHcm/aAhivebSRZB9ZhsjF2lXFhgEque7Chke5jmO
 MsOxfXIBbTgY3WWv1W7Z97Iz8VzMgAWgJoQV3Q56EyqYuoGNJuKuTSmJc
 ZJt9r+Mfs+tPb0kRrdSIRbZegft8dWJHrq02blpMe4zJtFIy8o78ZHxad
 kbIzf1gSVI2PYT4hpeVCoXqC6o8Qcwbapzc3CeLvrIPN/MxXOFofrZzFY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="36724246"
X-IronPort-AV: E=Sophos;i="5.84,330,1620658800"; d="scan'208";a="36724246"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 17:29:18 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OScHbLh0shLz16URlCh3xJ/zdoviaoyPeDFyy4NJqw8AgazOtVkC4/Fq7sgryseQnkmmmt5xz028KUhEehVc5AWRGUehm9HCesNC1h/pMHckrtDP8QUQblTYUu7rWqbG6ii6dRkT4eWzkVftZ+jf5iSxIrx4MA7MNJxByMI3fBuuy2v3ftUiSmvcurjS3J3KFkp0Akxg1UGaijhfw6N7VTvuHn7OWj3jDMpF3dcg52m0+STeR5gG4/ya3eYMIvbkK0q43kkK/JnUCJuGAlvDHjJ3TiCreGXW2PRrb1RpQm7xRc2f6ZYHDwbVVbFibnNrRZ0aVBA+OZcYgMuCdQSzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qujCFRbzAeftWTBVUG5r2+GtRhkTPyCFfWPmPyELLM=;
 b=C263cXa2FbnH2quRpAaehDjJP16lqbR8mXMYlKuwxbrUX/c8n9TWhnEIPpsgWKSf4msE2/y/EFNbYB8tvwe1C8K85jCuyf4WuXAX/aU8CeDYclyGi/ov197Fq8AjOu93pe6cuPoShxPBE14KW5hJVWScYB+X7QRSnAcdN3/gNQ77peJGZo0tG3niBoiY7SNN7tCK6d4I1JJOpFWGiu64PcCbcjCruVVII4V5CevAP8bCC/sRkaU9dZKtz91ZJS2jVFyykjDjq8ihTms2lCBGpsMlcKtVcvNrJMyadN4FXg2dJq5mMSZ0lk+IxDeHIMUn1epyrhgKvN3VqvRgpWktQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qujCFRbzAeftWTBVUG5r2+GtRhkTPyCFfWPmPyELLM=;
 b=F9H/Lajnvq0ii9CHD3KJP0lD7+f7E1azKbEILSl43c2H0w3W1MGNNz6Yd9XbuQad/Ac0T4BfMiBSqcxi4ZAdtbbXbPuMTtvmzeDPeTT6g5eEQ4s8/zubfbhbJwh/9DoD16yHOLxtOFinNXYtbbgTkz11yC8tdVz/1vqlGxsYKaU=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYCPR01MB6286.jpnprd01.prod.outlook.com (2603:1096:400:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 18 Aug
 2021 08:29:15 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c%7]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 08:29:15 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: RE: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Index: AQHXj0JXKFl553Ufz0WuhVfBX6IF0atvlwsAgAACXYCABzQ/oIAA0a+AgAA5wICAAAO8gIAABLoAgAAJrICAAJht0A==
Date: Wed, 18 Aug 2021 08:29:15 +0000
Message-ID: <TYCPR01MB6160151837F9C9C4167BB1B9E9FF9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
 <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
 <20210817162811.u3i5hcx7eg52akyq@gator.home>
In-Reply-To: <20210817162811.u3i5hcx7eg52akyq@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9YzczYmY4YzEtMDc2Zi00OTllLTkwN2MtNDhm?=
 =?iso-2022-jp?B?ZTQ4YjViMWIyO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDgtMThUMDE6MzM6NDRaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36e9bffd-581c-444e-a4de-08d9622243ec
x-ms-traffictypediagnostic: TYCPR01MB6286:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB62866F794BF3B64DEA8210B4E9FF9@TYCPR01MB6286.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gp7nI5oco/OSyx+mHaR3+N3hjGAeOCuYDw03W69dJ6e+ADxV20QX8SXBeNT0qTKXIuTZHbQA5FMnPbEdgYJnFZyb70oB5Idnob0tnVPOuqxvbRXyEBhAYIPok+6eY4JCrivFz7QhfGhCxzhSBKC1NasHswVrq+idqaAZCooIX3gUZNyb64IjYTTeQGhbmm9EWS6KKEG3xOoZVFKckQLSVG1L199ozq1g9gpBIgAr45TeodvbrMCyoJA/7U5v/J6mejkL/tcGly9p39hsHKtgeHYYu9P89QiXgg4d7XbxjwRdXt4zqT0LscJp0frhMAUteig+KZY+bqQkI+Nt/0dAt54jEeYbAxNihUzbuDOBpm2QD7YBsuWxdtQ56yIq37YM9lfotjAydwXqUOjiad138+QM4MH5RUdeHH15YB6+RyJ9Flf1pjBdzKdAJfClNYQHkFZIoHmGRwFnIDnZiRNYHVf0GG5jXtf8lNcpYmXgtWL3Xeqo30Ncir+EPM9+h9usvQqclF+lZhKMgPRrDHTbKj3SoITo/a9nQ4N3HR2mbtYJEjFbkh1E+86j1JyIE1xebDrdn4cjpIZxJ8kbxfyJEeEXkrLpC+0qJDmi1fJrrDXp9mENNslm08zlEZyxC+yDXm4iDMw5JxB+NjAGeshdftSVo8ypBqQF9RLMCqeGZ11rI3xAmsxd1oDYxVMvfNTKz2NbYL2RcnBV5w1j/PFo2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(9686003)(52536014)(26005)(76116006)(33656002)(64756008)(2906002)(66446008)(66556008)(66946007)(186003)(107886003)(66476007)(83380400001)(71200400001)(55016002)(478600001)(38100700002)(8676002)(53546011)(6506007)(122000001)(4326008)(110136005)(86362001)(316002)(85182001)(7696005)(5660300002)(8936002)(38070700005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?bElRNHVqbjFJMWoyZDlCdWdneDIvYzVwMVFQcUVvMld4MUtqS1FYdWE4?=
 =?iso-2022-jp?B?SnRJaFhJM0dPYllIRHhwVXcrV0JLZUhqS3ExMHNBUy9OK3dBeTdpM1lX?=
 =?iso-2022-jp?B?VC95M2tTcXpQMnB0cSszRzE2U1UzSkgrdlZQYlk4T2pQdW1pd05MYXkv?=
 =?iso-2022-jp?B?OFNERzNZb1ZPelRQZ0hMRFlNbmRwR21hUUhiSUlwb2tmZmFlQmZDVHZZ?=
 =?iso-2022-jp?B?Q2h3RmdiQ3VtdUhSRGJ4K3pGdE91Sm1JNTE0MSswbFdPYXE5MVV6RER4?=
 =?iso-2022-jp?B?Lyt5d0VjdUtjclV5OVdYaG9hK0V5ZUFnYWdMYUJvZnppSGllaE4ycUlC?=
 =?iso-2022-jp?B?ZGt2UW1SKzUzYUpYTFBMWkNhbEFWdWtnVVRXMzNwTDY4TXZxMnN4b3pU?=
 =?iso-2022-jp?B?cytiR1dUUGMra1p0UmZQVHRXRkZYdDdBOXdLTVFneWt6ejlmN0I0eWM0?=
 =?iso-2022-jp?B?TWpueG1BWmV0aVUrejViWjNYU1FBWFZPTmFFVUEyV3B1V1U3RjZjWkc4?=
 =?iso-2022-jp?B?NzFVVkNVRzZpUUp1bmgwV1FlMGZ6SStuc0htOThQRnBHeW1VQjB3VDRJ?=
 =?iso-2022-jp?B?U1h4M1gxQWNoNVVUcmx1cjlGUWZtMFg0dnVTeHNhUHBXQnFiUHMzQVRk?=
 =?iso-2022-jp?B?NWo3eS9uU0M2ZGpWb1lsbWlNQ1RKTi8yNUhDaGZTOTRmMmNsejloQVhV?=
 =?iso-2022-jp?B?WkhRSTBRZGJxWWI2N2NhS3h0UzZpRFRwUmFwUzhwaTlOd1VidHlZQ09q?=
 =?iso-2022-jp?B?ZXdBWjRRUUhZWjZiMXNXMzNIRUdncTRCSzFycXhNWUUrcHVUZUZST05z?=
 =?iso-2022-jp?B?WG9mZWNoeGxXUm1FZnZhbTRIcDczUVdUK2FYZWJjTHd5eXRra0FUWXJQ?=
 =?iso-2022-jp?B?bmhhaDVKK1FsbnkzOGtFa3dlMkIxbG1IbnVjaVBtT3RMZFFCdjFTK1hs?=
 =?iso-2022-jp?B?cm5rd0lUOUNVTnZnTERSM3RsKzhTdnJOUDhzZUdhNmhFd0RVQUN3NUx3?=
 =?iso-2022-jp?B?K25lT1VwOUN5NWRTb0dkZTh1b3hHbVJ6L0kxRFpVZFZaV1JtbDRWek42?=
 =?iso-2022-jp?B?czRQeXZNaG1LRzBNRk1Na0FVeGVuZFhIdFhZTHIxaXQwN042d0lvSVdV?=
 =?iso-2022-jp?B?TlZqN0hVT0dqU0F4VzVWSUcyQk1KMzJLSlduNWppRzhaamUzY29jbGtZ?=
 =?iso-2022-jp?B?d2d3RjZtbnBPOFdOdUZUT0lSOGt1cngyMUlZN0R0OUZWMU5CMFR2M1BI?=
 =?iso-2022-jp?B?SnVlWjBFbkwrR1RvMGMraWJIS05XMERBN0hVaFYwS2VFeXRkYjNKN1Rr?=
 =?iso-2022-jp?B?cHB0aGRFU0g1V2NTVjQxS0FuTFg3elEveUd1SlBjL2lxU3Rsa3NLU3Iy?=
 =?iso-2022-jp?B?V1lvWVNDRDZkdjgxQ01RYzFGZ0IzYWRCMVNxMWFjNEN0cklmbHRrQzNH?=
 =?iso-2022-jp?B?akJtenVHUGNJRUhIRWhLbFh0L3pRckRvOU9TTlBXeDkzU2hCTjlmdmk1?=
 =?iso-2022-jp?B?eDMrdGFXYU50YXpyVlU0MldPdnFLeVdiZWRQcXEzNlpZRkdYR2E4YVBC?=
 =?iso-2022-jp?B?TWtDQnRZSm84eEJ5ak9jYmJsVUd0by9tVWR2c3dOcVJHZUh3TzNvZVNW?=
 =?iso-2022-jp?B?c1hScWxrdW5pSjBDZWVMb2lMK1Z1Ym01SFk4bnBxYzdaaG1ndHAzTE9q?=
 =?iso-2022-jp?B?ZkVmN0VZQUd6MmRHR0NrcXFMOTR4MWpMdXVLS0tpRHVQd2kxU2hRYnJ4?=
 =?iso-2022-jp?B?QSt0cEMxR3pXOU5TSnZ2Y1YvRWFaMFIzbHZPT0VBQ20vUmtMNjlRajhn?=
 =?iso-2022-jp?B?ZUZYcWpIMjZaWGx1Vlh1bktEWkV4QkFWRnh5eVhseDJTTy9yNFhnanlJ?=
 =?iso-2022-jp?B?YW1OTHRobVF0WjZtUm0zWnJ3SUFaZFhQcHpYV0swY3dsaTFSck4waWR2?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e9bffd-581c-444e-a4de-08d9622243ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 08:29:15.6214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxfuK5+UolLi+Cwn1DWpkTMEf6zEUrP9ds0SannPZeN/AgVCcpxtb16uFWYCrEvPTDx3CO1LQpW/q5cpvUnwTBv+8HdrGmQZLxFi7aFWAEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6286
Received-SPF: pass client-ip=68.232.156.96;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa13.fujitsucc.c3s2.iphmx.com
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


We appreciate everyone's comments.
Before making the V5 patch, please let me check the patch contents.

> This looks reasonable to me, but you also need the 'sve' property that st=
ates sve in
> supported at all.
> > > So maybe we should just go ahead and add all sve* properties,=20

In response to the above comment,
We understood that the sve property will be added to the v4 patch.

i.e.=20
(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"a64fx"}
{"return": {"model": {"name": "a64fx", "props": {"sve128": false, "sve256":=
 true, "sve": true, "sve512": true, "aarch64": true, "pmu": true}}}}

> > > but
> > > then make sure the default vq map is correct.

Furthermore, We understood that I need to add the above process as well, is=
 that correct?

> That's a good idea. I'll send a patch with your suggested-by.

If that's correct,
In the current v4 patch, in the aarch64_a64fx_initfn function,=20
the a64fx_cpu_set_sve function is executed to set the SVE property,=20
and the arm_cpu_sve_finalize function is not called.=20

In which function is it appropriate to execute the modulo max_vq function=20
(or equivalent process)?

If We are not understanding you correctly,
We would appreciate your comments.

Best regards.

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Wednesday, August 18, 2021 1:28 AM
> To: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>;
> peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
>=20
> On Tue, Aug 17, 2021 at 05:53:34AM -1000, Richard Henderson wrote:
> > On 8/17/21 5:36 AM, Andrew Jones wrote:
> > > On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> > > > On 8/17/21 1:56 AM, Andrew Jones wrote:
> > > > > I guess it's fine. You could easily create a new
> > > > > cpu_arm_set_sve_vq() which would forbid changing the properties
> > > > > if you wanted to, but then we need to answer Peter's question in
> > > > > order to see if there's a precedent for that type of property.
> > > >
> > > > I don't see the point in read-only properties.  If the user wants
> > > > to set non-standard values on the command-line, let them.  What is
> > > > most important is getting the correct default from '-cpu a64fx'.
> > > >
> > >
> > > So maybe we should just go ahead and add all sve* properties, but
> > > then make sure the default vq map is correct.
> >
> > I think that's the right answer.
> >
> > Presently we have a kvm_supported variable that's initialized by
> > kvm_arm_sve_get_vls().  I think we want to rename that variable and
> > provide a version of that function for tcg. Probably we should have
> > done that before, with a trivial function for -cpu max to set all bits.
> >
> > Then eliminate most of the other kvm_enabled() checks in
> > arm_cpu_sve_finalize.  I think the only one we keep is the last, where
> > we verify that the final sve_vq_map matches kvm_enabled exactly, modulo
> max_vq.
> >
> > This should minimize the differences in behaviour between tcg and kvm.
>=20
> That's a good idea. I'll send a patch with your suggested-by.
>=20
> Thanks,
> drew


