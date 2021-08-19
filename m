Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18D3F19C7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:50:43 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhVK-00013R-30
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mGhSO-00006P-Kc; Thu, 19 Aug 2021 08:47:40 -0400
Received: from mail-eopbgr790135.outbound.protection.outlook.com
 ([40.107.79.135]:8522 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mGhSM-0002XT-EQ; Thu, 19 Aug 2021 08:47:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZ570RBu1iWDssNRFgu4TM0AQH2VtC3QKqUDeXBzJXylqaZ2db3WypONywvAS0jZ/tb4IwR/qTTZInRmSNotR4KpMWxC9KUx6R/HqF91I1LqPD1lHiLjHgqrIpknCqZwTOdrbRe1fOQjMnTHFXTi+EkWHr3jXWXS4Zfc5ehRoohC1p2ixKD5XMgbj+wT4s0foBrU/nNzOO4I+yR2B+BEDFwBULKI7H20vp3lIdExLPEA1n76or4Mh8Ihyxqrkir1kec8Xup1eZZJWzIJWntTWmsPCSNhtJ+EZe4N48RB2A6DxjsxqYSJmEqU6I2ALm7HVYF2DtMIfpMRQUPHJOFHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZFs3GEtd9hMmgQm/qhd47fRP0Q4Vxq5t3jOeEWT76E=;
 b=CkCArVeKV+ZRCjQm1Sf8+NQKnKE2QBVXxkHE94Z+V4gqlTG/gmqZEsTppmRg3CuuzcI3Z5VIM0C++/6oEjllpQj5GlK0Bai6PmTPh5jdLZutoHgXVvEFGOsySePjnLuctRMpRdsynj6CW7uHjwGyigy1mVzeypriNpIV7MQiSacNk1QnQRtHm2dYKcep77sfC6oczl8jzymDrg+7g6W0CTi2DgMlNisSPqlI0h0debNTEoWUnm/vU8LxFJw1aUQjmuuuLQKpiARGg+Gl8NsmAAAPjTF3ZXtbHiiUoQxfvkDvRHfqWJeHqlrWx7B6QvFXqZMPL8Z4dq2G/xKDhw8I+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZFs3GEtd9hMmgQm/qhd47fRP0Q4Vxq5t3jOeEWT76E=;
 b=tJKRyiAY7RV6lvnncpl6HGbPzX8kSvR8qUEBuj4aaE9CAX+tJj8X7uaSLNdbHhhHcVXLjMnsHbV8lEzCs2hHeOPXiWLuZ9LY/IcOWZkR/Ii2YuGvxBQ8vDbYYFBx/ftrbHn3ViwFqRxBra+xgFxE7s9DfTusjjbXDXwc47RhwR86cRhtrG+sfoHSd5wgC4/mXNsL2Cepd8meE++Ri/MAHD3kROeMgwCmAVQS45haLqRQZBQY1ABE6uwwgM0Z0aW5IWviZuVS7cCenv2zO74Qe8WfKjrumvErqnhGaY0E1ditw1TLPX9U53gwmFP8wvNOcTDHzzaJptZAaVv4bK6KSQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5416.lamprd80.prod.outlook.com (2603:10d6:103:4b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 12:47:33 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89%7]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 12:47:33 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Peter Maydell <peter.maydell@linaro.org>, Matheus Kowalczuk Ferst
 <matheus.ferst@eldorado.org.br>
Subject: RE: [PATCH for-6.2 v2 2/2] target/ppc: fix vector registers access in
 gdbstub for little-endian
Thread-Topic: [PATCH for-6.2 v2 2/2] target/ppc: fix vector registers access
 in gdbstub for little-endian
Thread-Index: AQHXlCHMnH/EpazbZUOsx/s09cH7yat6xygAgAAAyVA=
Date: Thu, 19 Aug 2021 12:47:32 +0000
Message-ID: <CP2PR80MB3668D9CF8E754D3C10982FD2DAC09@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
 <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
In-Reply-To: <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 189e6996-6e38-4d93-d690-08d9630f8381
x-ms-traffictypediagnostic: CPXPR80MB5416:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB541645F46A64315D0D8DCBE5DAC09@CPXPR80MB5416.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gqR4TVd8YIxKE8ry59/F7CuPAo0kctfL9cXs2R3r8qGjzIYZ/z4pg/5oP5KlkOBiSsRVGXxeWGY5zMugiS+ily+XmFqiQc9eOP48N8SLvKXzniMfWMcRYq5RuN3ZKAjtnwMTWndNgj2hMdXvPntUQtic64L5YvsoTUmXjVp5jlmZYfiMNwyWw61YoCJnC5bFOEa+1EWhkCzIUfmbe0augMEzMGGluoAzYwRyBNzBRRyisbHcT9cgwBFIIk5k7dK67v1LJkZKGKZ7daXPE/uPnFbgh+uC2oYPX8EEPdv5f3YCM3XPeOzQMVMn8etw22qXXl9BFTvEk+SwDztkcUaDXF9SyX6J69O6FWIiov41XU0WrIAPt2DQpUi66a2sHjFOeYALPD5Fg4cYw/6+s4jbuQ9RSDEA7HduCPjsJbPjPqkhXkcGhlwZbx81doDyZyk6ulhuDz+7H2dTLiJW+h5H9az5LIRzXwP2sTjruBeL+pPeFCSD9wt1nCvsNCiGSdIsUhmZzFg+W4QHKyfV0r8O/tI+FcqrWJPjRxqr108inmooWTMljvLNULZLH8WDNYf4fdkDPnuCbh1afdd9cdGCCJJyV97Gar2zgWmnA0GAqaea1EFwGf6EB5JJGZxyjzEjwH1MblZ4kenld8vY+rzRE350XZZzdFsow3Z+shFRYrj5X+RIOX5vzKopKp88f8QUtAf8FedRfziYfpsKZ1L4lVXfg34LvT7pAgmXBV8M44GC2Mp+aTZvqf2HcIULrTwMig87l8sK+cVz4mbzC/H7W8LMI+mpuOFu4N0bPhcgcts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(376002)(136003)(39850400004)(366004)(76116006)(478600001)(186003)(38100700002)(316002)(4326008)(33656002)(5660300002)(9686003)(55236004)(6506007)(26005)(55016002)(83380400001)(66476007)(66946007)(52536014)(2906002)(64756008)(66556008)(66446008)(558084003)(86362001)(7696005)(122000001)(54906003)(8936002)(110136005)(8676002)(6636002)(38070700005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z093Ylc0ZUVSSmE5S3kreVRpd3dKcTZ1anRpOXFiY2dYdExJbzczakpPMVBx?=
 =?utf-8?B?aUZ5dDZ3UVV0cThPdkh6Q2RZaGErOTJlU3lKd2dYdUJuTE5zMEhQeDI3Mndp?=
 =?utf-8?B?L2xzU3l0Mko1TkpTU1phc01SOTVsYmFIVkFtaklmYkhYNVdUMDh2WEU5RW5x?=
 =?utf-8?B?RDRyZ3p2eEl0bk54bFQwMGVsWmo3a2VOWkF5L0FyRVN2OENweXNXRnpSd3dJ?=
 =?utf-8?B?djk0RTdQcnpFdEdRakRaVkI4eWgwVnpvMFkwelJGaCs5MkcybXFRcmY1MGRL?=
 =?utf-8?B?cVZCdE5qTHlHYXRQZGErYUFaTzRIdkM4YTNxTk9yL2dsRk5QYllaTnE2cDJS?=
 =?utf-8?B?V1d1eVVza3VQUXNPT1lwOXJRR0xKVWhvVHRZTGVLbGltOElxME1CTjd5Z3dH?=
 =?utf-8?B?QmxBaWRpbVVEdUEwN1poZmhqTDlBYlhsM0xZYVN4dVNRVnd4b2ZKQ1V6c045?=
 =?utf-8?B?S0RsWkp6YUd1Q1U3WFFNVlFsWklJb2VST2htTVBpNjRDV2RMdE02aktmQ2Iz?=
 =?utf-8?B?dGJHdG1RTFdDQk9VcmNTUExERURSc1NabzBUeDVkNmVjZDhjZmM3M09Jb2JH?=
 =?utf-8?B?YUJnWEZadmFIdnBjWnE1dmFMRXR4NGVsa2lEbzgxckJhNEZnYVE0RC9yZ1Ry?=
 =?utf-8?B?eTBkUkE1YVc5QXF3WnZvNS9wNGV3UnVseVR6cUlCNWc2dUwzZVhRc0R2N0Ns?=
 =?utf-8?B?MGNCdkZ2cTRFUlE4SStGMlZmV0VHaHFCVjZEcmYvSWtQekNiSEFlT0tTT3Ur?=
 =?utf-8?B?SnRQOEs5MGdSMENTd0NWVmk4MEJRRDh3S1pYYTc4dEVqQnIwQ2RPUEgyVWdT?=
 =?utf-8?B?K0UwUEtlM1hXY1pZQnhBU0RHQVVOWG9JYXJpc25wQ3NNUC9ZLzJPR0N5aHlu?=
 =?utf-8?B?OHFWT1drTTJiaUx2TkxIejIzQkNzenlFcWJqZVVyTFZEL2luZWVBdUs3Mkh3?=
 =?utf-8?B?NXpkQXRoSisyQ0YyNnBUQnhzZ0FlYkVOTTNSQUpFMXd2eXlvc0I4RDBKQjly?=
 =?utf-8?B?UWhnMkFsK1RSdXFVdUpUQTRsallhVjRUZU5Fcm9Nb1liWjdVWUtOTXlXaUVF?=
 =?utf-8?B?eWt6Uzd4WmFZSGxIbnN2QmhscitZcldoSC81ZEw4T0ptbitsWE9RTi9FeEZJ?=
 =?utf-8?B?SDBCQ2l5UnZDcUFsVll1czJ4dUtwMWxJKzVNaWJoS1ZkbDg3bmFyelB0MXRU?=
 =?utf-8?B?T2pCOVQvU204clFIdWJIVEI3UDJEY0hDSlUxS0hvUGdmNURSOFhZSjJ5emhJ?=
 =?utf-8?B?ZW9KYUNRNkYxLzFLemJEWW95UlliSEx4M2JzRldLeUorVGJ1alE0TjFQVDJI?=
 =?utf-8?B?Qzd1cTJoZjl3SFIvNm93cGRYT0RmT3JNVDg3NlpubDhxcDd4VnozMWlJZ1ZF?=
 =?utf-8?B?TC8zbFhTeG8xZGdoL3lqNkkwUEpWMmQ0MTUvclljR25rd09SMUlsdTdMdlQw?=
 =?utf-8?B?eTkxWVlVSy93OEtRUmxzaXZRdWgzNmFZNFBEODlJa3MrN0dCTFRDNjJFMmJv?=
 =?utf-8?B?OGFueGdVQVJaTHBTd3ZkWnNiM2xDdHVxM1MwNndIWTZQZmh5cGJCM1d5bjNl?=
 =?utf-8?B?aWVpQituSm5LN1MwblF0TjJ0RlZ0NklER0Q2UzdxY3BET0J1UWdwTU5aa3pV?=
 =?utf-8?B?TTZFQWU1bmdqNkhteXZXRXYxUllXUFFUbUJBRDdZQjBmbXlHb1RramFHS3pX?=
 =?utf-8?B?TVR2YncrTXl3TGQ0MjhHSWxzbk9xRGZvc0MwYlVsZ0lUZExBZWlDeXB6Smxv?=
 =?utf-8?Q?0QHw+r9TNlrALiuSdSJngcsSHx5L0oyaJIfJXqW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189e6996-6e38-4d93-d690-08d9630f8381
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 12:47:32.8521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tP5w6Jy4mS/egIdh0hEn/53Wms7xiw6XkYMnKRrATB6ycAuFdLS8m9l0KcPPX3zPsOZpPva4uWLB9pJC0cmqJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5416
Received-SPF: pass client-ip=40.107.79.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBNYXliZSB3ZSBzaG91bGQgZml4IHRoaXMgYnkgbWFraW5nIHRoZSAnc3RydWN0IEludDEyOCcg
ZmllbGQgb3JkZXIgZGVwZW5kIG9uDQo+IEhPU1RfV09SRFNfQklHRU5ESUFOLi4uDQoNCisxIGZv
ciB0aGF0Lg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFE
Tw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIv
ZGlzY2xhaW1lci5odG1sPg0K

