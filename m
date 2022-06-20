Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52E55227A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:49:43 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Kas-00028S-C5
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o3KY6-0001Qw-6Y
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:46:50 -0400
Received: from mail-bn1nam07on2096.outbound.protection.outlook.com
 ([40.107.212.96]:40445 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o3KY3-00009R-LA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:46:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ei6uE/iJePVkGPlpx75UMmKJLmj9ISBhdPEgH62l740Kp0r4xgCNV1GSCmOCvYDsRieibKSzSbzrQWhTZLVxDvOrY5f2e3c04rwnfIBtOS2XxbuzbxRQEUAC363x81WJdHHOxtcQtfnvZiusg4IHUmpRrCSLkNLg9DJzEEddrNPnONwc8R9tnI3fGMdf/WmwVnu+2fOaa1g4drvVdrMZ0H/85sChS7pVvgx8F8KCjKfcfWqVUnqaK1WBRxEg8P7QNudh97V3rE4DgLeG31hRDToFbO/UNIWe21ggpxFgnvWlgF/oSKS8Nb8IhKBtI56wcTas/8pRaMTT70K2gZlzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylJ8tMFWa39UbrHI3QYqbQzm/II4+7SnJQ5BgKcnIKw=;
 b=g2IYoi1d7a296rvCUp7O703PEzHpqyHtAe6e3U9SLL2kDjcpopC3jsR42diJ4B3DaoeCQvXImhPr5G0AdF4q0BC2Pwa/9f3n7E5Oxlv1JHK7Rl4Rt6GKV7WXdm0O9SlgIUxn+R6HJsDUBCl5VzPH6QFT4ar0NGt8lxmbBu3pmspUDougrWgc+Buu3rUjZPseEj5GDddL3/R6UB3UVnMGJ2kVN1XfXl7kktVXh3gVT18wF8r8Nrd0yjyK/AcWfdvCSJbui9jd/jOPjTfJ8pYDUp45c1uidYDKRCwHaup4ybo5jmIBXWWDmBnuVc2Q7AaSzlXN/ZKMzkWySUoUxxKY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylJ8tMFWa39UbrHI3QYqbQzm/II4+7SnJQ5BgKcnIKw=;
 b=Pz61gRTq+ycwNlABXU4/J2CdgK104VOit6DdHDQnXqZ7bU8N7gs3sL8wBlorDdI8bploUghKfY0sRjALKvX6b5EY7EjoOIwJV1sfrj3Vz5C3Nh0hwrPUJa/OWhTCo3hQutAK8ePPewpeeV/8FQ8/ACg5bFnfOt8DlKCbO2246wDOlyy2ZH+b0tCbcWuUVQLZcXxRCmFDiAu3FA21mJM2LyUyMrjMKIUmgYqmDM2UNgy+cQbn5yr0vBgvH3SHxdmTC4gDdMWWaUrvp+sbWbVXdj59bO491SWq31sLhPefAa8Q3eOLWByHQqCu9XRVVJKNbVUxyGwGoO0Cu8X5Q4zupw==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by FR1PR80MB5387.lamprd80.prod.outlook.com (2603:10d6:203:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 16:41:41 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::e50a:4522:5dff:2f1a]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::e50a:4522:5dff:2f1a%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 16:41:41 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Thread-Topic: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Thread-Index: AQHYdegdsR2e7ivWeUqr7kvGWi7Gl61Qck6AgAMHTQCABSPPAA==
Date: Mon, 20 Jun 2022 16:41:41 +0000
Message-ID: <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
 <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
In-Reply-To: <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b232768-7067-4809-2f16-08da52dbc0b5
x-ms-traffictypediagnostic: FR1PR80MB5387:EE_
x-microsoft-antispam-prvs: <FR1PR80MB5387F6328429C830F6340C21A1B09@FR1PR80MB5387.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XLJyCvFH/rQ+7b8hrmJHUcTixmuJN1H8bNWFfhgkCeLYBvLeRI1jvIK7X0BzP/a5BDxcTPHwhAI1JGOcR/Px6lXFdirWE3yMkWqib3msCtXyjPuR4yB46aZvrBvDOdzhZR3RBDM1MGGARypNJsYUGYqW7RV3fgEBYDNkr6LcjC4xiNuHD/wySvMlTruAtt3MWhAt8+Ci5ynkUOBCE29YtS99fpXxIFXAKHrmepb+/M9TDjgCwE3XkjSVvb06bb6J0z3kXOhlun7/EEW+hyjUNOqF7cqhZ9jy2UtcARq1rIUMc0XvTEoRWL8PrOu6uq9oxI0SYtcsybCCNNF+ZYblnhJbccYnjpzi4RuNk/cVF6A3nmXlgA4wVnBnrPRfz2dhgQBVWZBnEmHYj/ZGKV+QGYkty1co0FqFdnPA8o6BYRHTSMgbes1k1D7pdCGOnqJHLLNfLpWojZkJftxe+k9uNTG/j8vEWqR2vMtCZ7rjYvhRsOgCqLZdCGqqStYWJEwBGKJRJHsw4b51ecGaujZ8pd+dof0v4khiAaJt3Ya9azxF56Cmm6hGlnaVAHkM/qm5as9pcoRjZtKGH6v9NsH93Wi4fAtVAorRr0X3aEbC9jA9w54KBtv5E0cItd50MEX5lHnFIWyiZyW29Th+Y2+jCm28Lb+i8pnHT6jQL1WnHJQTObqK0lo7n9pyCarbEbXvkvk8dwQ68EtWkdgbDwnHRGyxsg/I72ECp5blypy8ZMp3WJaXtDZ9/vRSq9+ISrjsGXV6XLhFZ+SAiyz0GUcedU3JfnC0jDkwkGta4/46te2mn6b2kSDFX+rjxgviaT0/XsyPeU/qmkxoQpL25l4LmStN4o8SmZnJmLNJ5jsAxwB2WB9YccAZY8b8H4kXw/zG/biBbhc+lMYAEER5PJR81Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(376002)(346002)(39850400004)(86362001)(6506007)(26005)(8936002)(5660300002)(31696002)(53546011)(6512007)(966005)(6486002)(6916009)(478600001)(54906003)(316002)(2906002)(38100700002)(71200400001)(66946007)(66556008)(66446008)(4326008)(31686004)(66476007)(186003)(122000001)(8676002)(38070700005)(76116006)(64756008)(41300700001)(107886003)(36756003)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUs4RVJoTlVaMmozWVM2WEl2c0pKWHJoSUU0SnRaL1Bta2xSWkM0UWpYVC9i?=
 =?utf-8?B?Q2VoRjQ4aXR2ZFBMZXQ4Y1piVU04dm1kS2NxSldRMzhnUGxiV3B0U1lxbStG?=
 =?utf-8?B?R3EzcDY1TTZYeVViSzU2ZHpWNCtSM2h4MkZnNHdqUVduV2pkTktkZnB2Q1E2?=
 =?utf-8?B?eXVUNjlLWitRTFgrWVQ1cUg1YlhuYjZBVlk1Rmh3YzRmSHJLaEh3N2R3OVhp?=
 =?utf-8?B?RmEwZ3NacWFzNUVuQXlQQmZnT1hmdFlWZVR6NXZiU2RadGkydGo0cmN6KzFk?=
 =?utf-8?B?RHlIMTVrck5WbXJqZXRnSTBDVXhjOXF3MUFKT3RSaWRBcFlGV2c2d1JCUS81?=
 =?utf-8?B?aW9uV2xTNC9OTFp3Q2xKNUpXbW9iL2p1aFRqbzVFekk3RG5KbnZRcnRwdm5S?=
 =?utf-8?B?MGptbVVkdFJYdCtTTFYzbVIwcldpU2tXU3pSNm42dDdmY0NGdlZlLzJuUUJO?=
 =?utf-8?B?SmtSWnBRcHU1eVdoRjB6TWtrb3NNWlByVHp0ZkFabEFzdWtiS0laakpoWDlE?=
 =?utf-8?B?cUx0bW5jbXppaVBiSmtHQlZWeVErc0FuU3dhbmsvQ2ltYUhvL2FWV1VHTFJX?=
 =?utf-8?B?c3pWajVkRUZIbnBkNkxyVUFENVRCZzgxalRRdmFKV0lHVUcxZkVobnhuamRN?=
 =?utf-8?B?OHJXeS9UcUFMcUFKRWZOWTJtU1FXaWFhU2pKRnBaeEZqNEFiaHNJMnRTRWdt?=
 =?utf-8?B?bVUrVEVzSVpkMndXR2o5cUNYcSt3MVcvWklkek03U1FWNGdXL3VDTEhINkZp?=
 =?utf-8?B?TVdHZnpOV1hocEcxU1RiR1BLOFIvR2FaVFBLZHBrNDNPQi93NmFzMllVbUNj?=
 =?utf-8?B?OExKRXkyNmlUQ2o0bmF2TmdweEEreERHSmRVeTB6djJ2SVpZckZYZEo2NzYy?=
 =?utf-8?B?QjF2K2J2RG42bUt2N0owUUpwZ25PbEh3b0d5bllQRmVTK0NyNXl4cGRwMjU0?=
 =?utf-8?B?aExHSHRyQUcwUlF0dFpmWXppTzl1bjY2SmxyT3RlTDhTS25JL3lVRnpQR0Vt?=
 =?utf-8?B?OGkzZGRxa2NVMzhadVlQMXdMU2hUZFRPc0dNSjMxbzBvTFdzbGl4RmpjcnZa?=
 =?utf-8?B?d1pLaVFsTE1ycGt4WkFSOTl5dmtMWnRPT0cwZUZIUzFJbXIxb3YzWGVWdnN2?=
 =?utf-8?B?Z095MDcxakJWeFJySStJU0Y0RmV2a1FHZ3hOT0s1ZE5xbDZheGo5VlhNdEJP?=
 =?utf-8?B?MVJtdG8za2pvdVpBaTRWNnhKbzlsOTB6b1puZTZBc0tSd3NpY3NBL1Fvbkdj?=
 =?utf-8?B?a0FFYU5BZ0xzYms0T0hEM2YrcHFEZDg2eTcwV3FDTFBIQnNrRG5LWkhIREk1?=
 =?utf-8?B?RUlISndDSnYyVmNZTmJlSjlzUlJIbFRPK29CNml4enVrci96aTRGTThoWDBY?=
 =?utf-8?B?WGlUbURiSzlQdFp6SUd6dlRvMGJtK3BIZVdGN211WFYxY2hsU2hzby9uZ0lO?=
 =?utf-8?B?eWRpWDdobGwzUDg5TzVFcXo0b0d4SG12ajQ4UjFiSDE1U2RPWnJQRG8vL1ZS?=
 =?utf-8?B?S1pJOGdFYXRSK0hMS3V4T0oxeHBzNjJOLzZuUUVzWVVmZDQ4UFJ2cUlKeGN5?=
 =?utf-8?B?N090WmplcER4UWpYcGlLTGxIWm9BR3ppaVU3N200ZHdLcURuc2R3RlZFK056?=
 =?utf-8?B?djFWMlZPbGtaMFJWQ25KRHc4OUUyRXA4U29iL1hMdCs5dE11NS9jdG8vb3Vx?=
 =?utf-8?B?SXAvelVrc1JDbjgxSXdOUmlGS0ZudFVTQzNpYmdrdnlCSG0ra3krTCtrSjls?=
 =?utf-8?B?VkdIS0Y1OW85bnQ2YXU5b3F1UnNkbWVVS01xVXUyNVZQV0tNclpZdHA1S2JJ?=
 =?utf-8?B?aXZGK0QrME5pNjkzc1l3U0VuY0Y0eXdXTERiUzRjeXBRbXBPaHhyUWpLemNM?=
 =?utf-8?B?RnJFVFBoTEdXTTJPOWYwQ0RYc24zKzNTRUlacTluOHpTa0dkM0dXUXl2TGc3?=
 =?utf-8?B?TzdhV1pKVjRtOVFsTFZmRVRaOWFVSmhuYWJtMVc1UkdiaTQxOU9GRE9ZZFRE?=
 =?utf-8?B?dGVYWGhpNEJKeHcxTFFHcC92SnpGeGluZ2IvRVJUMHdqSDhsRkVuWGFZRUZB?=
 =?utf-8?B?MjZiUEhxeVZab1IrSXBUY3B0ZkFtWjVWek5HYzd2MmpaNDhxM05kenJkTVNI?=
 =?utf-8?B?TzhsSTdxYXZ5clUvdkRCc1JKd2RTeFV2NXRYNVBiWnNpRnBBaU04UGh1Vnhj?=
 =?utf-8?B?ZXd4VFc4elBNV3l1dWpUZGRORGFkaW0xM0c3T0dzVFYrc0R3blAwaVhLSU1x?=
 =?utf-8?B?VjRkaGQ4ejZsVXVYNm9BSkdVRmR2NHVQMjNxR2FXMFVaMUdvVkYwMFBOMDdV?=
 =?utf-8?B?Y1RQMkIyeEFDYVpST1lQWnBiZkozVm9DVEtoR3FucDJyYTZGVWVHdEFtcEwz?=
 =?utf-8?Q?/4Jvvd14DozpFP8R26Bq4UY4UnXOi76QEABkM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C72B7748C2F1748AB6FDD48800E0370@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b232768-7067-4809-2f16-08da52dbc0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 16:41:41.0449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2RsitA7/j7AnoNABaX8jTdyDC2q5n9GApKmSu8DCxEMMiFd01YMASe7d4+gkVJiD2qNBIG+GPvuGaAoJzoUxBiv5trPH7zkZggIqJi7Jvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PR80MB5387
Received-SPF: pass client-ip=40.107.212.96;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTcvMDYvMjAyMiAwNzoxMiwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gSGkgTWF0aGV1cywN
Cj4gDQo+IGNvdWxkIHlvdSBwbGVhc2UgdGVzdCB0aGUgdGVzdHMtdGNnLW5leHQgYnJhbmNoIGF0
DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ib256aW5pL3FlbXU/DQoNCkF0IGJlNjA5MGJjYWMxMCwg
aXQgd29ya3MgaWYgbm8gQkUgdG9vbGNoYWluIGlzIHByZXNlbnQuIE90aGVyd2lzZSwgdGhlIA0K
c2NyaXB0IHByb2JlcyBwb3dlcnBjNjQtbGludXgtZ251LWdjYyBpbnN0ZWFkIG9mIHRoZSBuYXRp
dmUgdG9vbHMgZm9yIA0KcHBjNjRsZS1saW51eC11c2VyLCBhbmQgdGhlbiBkb19jb21waWxlciBm
YWlscyBiZWNhdXNlIHRoZSANCiR0YXJnZXRfY2ZsYWdzIGNvbnRhaW5zIC1tbGl0dGxlLWVuZGlh
bi4NCg0KPiANCj4gT24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMzoyMyBBTSBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyb3RlOg0KPj4NCj4+DQo+PiBNYXRoZXVzIEtvd2Fs
Y3p1ayBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+IHdyaXRlczoNCj4+DQo+
Pj4gT24gMDEvMDYvMjAyMiAxNTowNSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4+PiBGcm9tOiBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPj4+Pg0KPj4+PiBJbiBwcmVwYXJh
dGlvbiBmb3IgaGFuZGxpbmcgbW9yZSBiaW5hcmllcyB0aGFuIGp1c3QgY2MsIGhhbmRsZQ0KPj4+
PiB0aGUgY2FzZSBvZiAicHJvYmVfdGFyZ2V0X2NvbXBpbGVyICRjcHUiIGRpcmVjdGx5IGluIHRo
ZSBmdW5jdGlvbiwNCj4+Pj4gc2V0dGluZyB0aGUgdGFyZ2V0XyogdmFyaWFibGVzIGJhc2VkIG9u
IHRoZSBvbmVzIHRoYXQgYXJlIHVzZWQgdG8NCj4+Pj4gYnVpbGQgUUVNVS4gIFRoZSBjbGFuZyBj
aGVjayBhbHNvIG5lZWRzIHRvIGJlIG1vdmVkIGFmdGVyIHRoaXMNCj4+Pj4gZmFsbGJhY2suDQo+
Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+DQo+Pj4+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZz4NCj4+Pj4gTWVzc2FnZS1JZDogPDIwMjIwNTE3MDkyNjE2LjEyNzIyMzgt
MTAtcGJvbnppbmlAcmVkaGF0LmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6ll
IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPj4+PiBNZXNzYWdlLUlkOiA8MjAyMjA1MjcxNTM2
MDMuODg3OTI5LTIxLWFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+Pj4NCj4+PiBIaSwNCj4+Pg0K
Pj4+IEFmdGVyIHRoaXMgcGF0Y2gsIGEgY2xlYW4gYnVpbGQgaW4gcHBjNjRsZSBob3N0cyB3aWxs
IG5vdCBidWlsZA0KPj4+IHBwYzY0eyxsZX0tbGludXgtdXNlciB0ZXN0cyB3aXRoICJtYWtlIGNo
ZWNrLXRjZyINCj4+Pg0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmln
dXJlDQo+Pj4+IGluZGV4IGZiZjZkMzlmOTYuLjIxN2M4YjNjYWMgMTAwNzU1DQo+Pj4+IC0tLSBh
L2NvbmZpZ3VyZQ0KPj4+PiArKysgYi9jb25maWd1cmUNCj4+Pj4gQEAgLTk1NCwxMCArOTU0LDYg
QEAgY2FzZSAkZ2l0X3N1Ym1vZHVsZXNfYWN0aW9uIGluDQo+Pj4+ICAgICAgICA7Ow0KPj4+PiAg
ICBlc2FjDQo+Pj4+DQo+Pj4+IC1pZiBldmFsIHRlc3QgLXogIlwke2Nyb3NzX2NjXyRjcHV9Ijsg
dGhlbg0KPj4+PiAtICAgIGV2YWwgImNyb3NzX2NjXyR7Y3B1fT1cJGNjIg0KPj4+PiAtZmkNCj4+
Pj4gLQ0KPj4+PiAgICBkZWZhdWx0X3RhcmdldF9saXN0PSIiDQo+Pj4+ICAgIG1ha193aWxkcz0i
Ig0KPj4+Pg0KPj4+PiBAQCAtMjAwOCwxMyArMjAwNCw2IEBAIHByb2JlX3RhcmdldF9jb21waWxl
cigpIHsNCj4+Pj4gICAgICBpZiBldmFsIHRlc3QgLW4gIlwiXCR7Y3Jvc3NfY2NfJDF9XCIiOyB0
aGVuDQo+Pj4+ICAgICAgICBpZiBldmFsIGhhcyAiXCJcJHtjcm9zc19jY18kMX1cIiI7IHRoZW4N
Cj4+Pj4gICAgICAgICAgZXZhbCAidGFyZ2V0X2NjPVwiXCR7Y3Jvc3NfY2NfJDF9XCIiDQo+Pj4+
IC0gICAgICBjYXNlICQxIGluDQo+Pj4+IC0gICAgICAgIGkzODZ8eDg2XzY0KQ0KPj4+PiAtICAg
ICAgICAgIGlmICR0YXJnZXRfY2MgLS12ZXJzaW9uIHwgZ3JlcCAtcWkgImNsYW5nIjsgdGhlbg0K
Pj4+PiAtICAgICAgICAgICAgdW5zZXQgdGFyZ2V0X2NjDQo+Pj4+IC0gICAgICAgICAgZmkNCj4+
Pj4gLSAgICAgICAgICA7Ow0KPj4+PiAtICAgICAgZXNhYw0KPj4+PiAgICAgICAgZmkNCj4+Pj4g
ICAgICBmaQ0KPj4+PiAgICAgIGlmIGV2YWwgdGVzdCAtbiAiXCJcJHtjcm9zc19hc18kMX1cIiI7
IHRoZW4NCj4+Pj4gQEAgLTIwMjcsNiArMjAxNiwyMCBAQCBwcm9iZV90YXJnZXRfY29tcGlsZXIo
KSB7DQo+Pj4+ICAgICAgICAgIGV2YWwgInRhcmdldF9sZD1cIlwke2Nyb3NzX2xkXyQxfVwiIg0K
Pj4+PiAgICAgICAgZmkNCj4+Pj4gICAgICBmaQ0KPj4+PiArICBpZiB0ZXN0ICIkMSIgPSAkY3B1
OyB0aGVuID4gKyAgICA6ICR7dGFyZ2V0X2NjOj0kY2N9DQo+Pj4+ICsgICAgOiAke3RhcmdldF9h
czo9JGFzfQ0KPj4+PiArICAgIDogJHt0YXJnZXRfbGQ6PSRsZH0NCj4+Pj4gKyAgZmkNCj4+Pg0K
Pj4+ICRjcHUgaXMgbm9ybWFsaXplZFsxXSB0byBwcGM2NCBvbiBsaXR0bGUtZW5kaWFuIGhvc3Rz
LCBzbw0KPj4+IHBwYzY0bGUtbGludXgtdXNlciB3aWxsIG5vdCBoYXZlICR0YXJnZXRfe2NjLGFz
LGxkfSBzZXQsIGFuZA0KPj4+IHBwYzY0LWxpbnV4LXVzZXIgd2lsbCBoYXZlIHRoZW0gc2V0IHRv
IGEgdG9vbGNoYWluIHRoYXQgbWF5IG5vdCBzdXBwb3J0DQo+Pj4gLW1iaWctZW5kaWFuLiBJIHN1
cHBvc2Ugd2UgaGF2ZSBhIHNpbWlsYXIgcHJvYmxlbSB3aXRoIE1JUFMgdGFyZ2V0cyBvbg0KPj4+
IE1JUFMgaG9zdHMuDQo+Pg0KPj4gRm9yIG5vdyB5b3UgY2FuIGFsd2F5cyBleHBsaWNpdGx5IHRl
bGwgY29uZmlndXJlIGFib3V0IHRoZSBob3N0IGNvbXBpbGVyDQo+PiB3aXRoOg0KPj4NCj4+ICAg
LS1jcm9zcy1jYy1wcGM2NGxlPWdjYw0KPj4NCj4+IGJ1dCB3ZSBzaG91bGQgZml4IHRoZSBicm9r
ZW4gZGV0ZWN0aW9uLg0KDQpXaXRoIHRoaXMgd29ya2Fyb3VuZCB3ZSBjYW4gcnVuIHRoZSB0ZXN0
cyBvbiBtYXN0ZXIuIEhvd2V2ZXIsIGl0IHdvcmtzIA0KYmVjYXVzZSBsaW51eC11c2VyIHRlc3Rz
IG9ubHkgdXNlIENDLiBJIHdvbmRlciBpZiB0aGUgLS1jcm9zcy1jYy0qIA0Kb3B0aW9ucyB3aWxs
IHJlbWFpbiB1c2VmdWwgaW4gdGhlIGZ1dHVyZTsgaXQgc2VlbXMgdGhhdCBvbmx5IA0KLS1jcm9z
cy1wcmVmaXgtKiBzaG91bGQgYmUgdXNlZCBub3cgdGhhdCBtb3JlIHRvb2xzIGFyZSBleHBvcnRl
ZCBpbiB0aGUgDQpjb25maWctPHRhcmdldD4ubWFrDQoNCj4+IEl0IHNlZW1zIHRoZSB2YXIgY3B1
IGhhcyBhbg0KPj4gb3ZlcmxvYWRlZCBtZWFuaW5nIHNvIEkgd29uZGVyIGlmIHdlIGp1c3QgbmVl
ZCBhbiBleHBsaWNpdCBob3N0X2NwdQ0KPj4gc2V0dGluZyB3aGVuIHdlIG5vcm1hbGl6ZSBjcHU/
DQo+Pg0KDQpBRkFJQ1QsICRjcHUgaXMgYWx3YXlzIGhvc3QtcmVsYXRlZCwgYnV0IGFmdGVyIHRo
ZSBub3JtYWxpemF0aW9uIGl0IA0Kc2VlbXMgbW9yZSBsaWtlIHRoZSBhcmNoaXRlY3R1cmUgdGhh
biB0aGUgQ1BVIG5hbWUuLi4gTWF5YmUgd2Ugc2hvdWxkIA0KY2FsbCB0aGVtICRob3N0X2NwdSBh
bmQgJGhvc3RfYXJjaD8NCg0KPj4+DQo+Pj4gWzFdDQo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL3Fl
bXUtcHJvamVjdC9xZW11Ly0vYmxvYi8yYWQ2MGY2ZjhjMTJjYTBhY2Q4ODM0ZmRkNzBlMDg4MzYx
Yjg3OTFmL2NvbmZpZ3VyZSNMNjExDQo+Pg0KPj4NCj4+IC0tDQo+PiBBbGV4IEJlbm7DqWUNCj4+
DQoNClRoYW5rcywNCk1hdGhldXMgSy4gRmVyc3QNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxE
T1JBRE8gPGh0dHA6Ly93d3cuZWxkb3JhZG8ub3JnLmJyLz4NCkFuYWxpc3RhIGRlIFNvZnR3YXJl
DQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9k
aXNjbGFpbWVyLmh0bWw+DQo=

