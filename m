Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527CF40F9EB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:05:15 +0200 (CEST)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREUM-0003WL-5B
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mREQ6-0001iG-NN; Fri, 17 Sep 2021 10:00:59 -0400
Received: from mail-eopbgr820101.outbound.protection.outlook.com
 ([40.107.82.101]:39355 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mREQ2-0003xf-4y; Fri, 17 Sep 2021 10:00:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5z6q60gfaMEqXqynEtui0xgbDhlMhAQfXGzsshBQ5TCptvgpzx+MCQjHRFRMoJ7Lu7zI9dNgYCxbyhmwEDXyf5YuPXgTKXE5erk5Y00UbaUNuAU/y+1dlKafnC/CqWPA/tx1K05feoRJtR7p1SOEt3/u5Ai6IvmAYIZnxBW/cVJLO67X50ZUTm9Rc9IIbJTIZyo3QwHsCt+HFO8Mp4pO3JNrpD20oFfgzAp45Pbet0jLInATqceVV1EJWURpJg5FVJmGMExfYdpfVUpct0PuvKc2/CdLhmINpFpUH9EXZ1D7KfxiAmTHNr2g6i0RWMj/EO00Lews2TxrCOPBy8yJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2Zv7t5Y3XWuT8UMeMmYNjw/6Ah/PyPSRx6ty3jsMwG8=;
 b=EaAlTojhpPHc/MBshx/ptByZq5LICiHGpB7n9l8iRTgLgJo2fgHpJCFXcgruRb5wewEZny5sG4piGcUCqgwZie9fGKNtsp5LuqxGBEi4g4YOHermvjeh9pfogcXTdWgJQTDKO0JNeoqylXy7+Z1GCEMDb1+l3y+Kpv0hAF6GM8aR7QKV8qwIgOyd6ON0/7XLP83KHYwL/te075ClUp0ECvsRsLs3szgq6C5NZNpMnC8/mN9BSzSuIXD3POO15vjLp1BTTfq6r+4/lMXCPwyAO85iCWH2s5gyXGGd6igy8xwmC5qDV8o4bdvTEgUQ6NB4OLP6zTzzGiBKD+Pij8PTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zv7t5Y3XWuT8UMeMmYNjw/6Ah/PyPSRx6ty3jsMwG8=;
 b=fqGhnzO2GNeHIW0pqxbWr0EDQUFHBmUKtH1I9whLgsCbKDl9Kq1E+T5G0tUOb/jM+7iWsIwU2j8I9BFKNDGZtrFGnAJvn2ov0FDJwDxGflZpQvSIWKKa2hYUuYx4kcqP9Oh7NPF7OQYQ5NhkChiv/ZgQfrUYXxsJY8C4RQYk0dw62xQJ21hZbGR1pDHUeBcaXMKTKbwep1qRK3IEDz8uTGznN2B302crlJPBKgfr+sUtYvgVBgLIz2ctIEtNUP4yjFXbpozR8ThY8Cb6FXYWyLOnEkc5pB3k4qselEcnXVNodgteY9bmTGRtko72WhgtxuQbUJ5FkFNGEOrICLjKOw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5682.lamprd80.prod.outlook.com (2603:10d6:102:8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 14:00:41 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4500.019; Fri, 17 Sep 2021
 14:00:41 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: RE: [PATCH v3] target/ppc: Fix 64-bit decrementer
Thread-Topic: [PATCH v3] target/ppc: Fix 64-bit decrementer
Thread-Index: AQHXqwhZI/R4DXJmgka1h1TWuiGAa6um98jwgAFFpgCAAAMCwA==
Date: Fri, 17 Sep 2021 14:00:41 +0000
Message-ID: <CP2PR80MB3668712B5A367E87089D724BDADD9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210916143710.236489-1-clg@kaod.org>
 <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <a0661690-bdb4-f002-3862-306458b36d3d@kaod.org>
In-Reply-To: <a0661690-bdb4-f002-3862-306458b36d3d@kaod.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c76e7eab-bd6e-4f5e-52b8-08d979e3890e
x-ms-traffictypediagnostic: CP2PR80MB5682:
x-microsoft-antispam-prvs: <CP2PR80MB56823FDE2AB9CD8B1FB46A77DADD9@CP2PR80MB5682.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cqYdaONZKzkbkw4QxMMBQBymx8iY9cjao2GFAfpVNgU6BwP+aPdU5RLKKMbgjfdHKew5yoSgORo1OLjmTJliatc22UMrcV7t7YFylkJRQwWU6Y14qIgwTXmM8z0nVG/gDeVlffsDqhKHcVI/SDehK5IXkTsr1XfboEd/5n3WeE3Fy5fcqJKWnJmArEcKV18Kef/2439huHRGtPbgm7nnbaT+gw7JSUBc1uBUJQ0MOHcExSTDsm37w9AMGIUvWv96Kuo6WMBLTTK3lTVACsKZ3TGR7h8SapDlB/9rYVBpL950HLlzNYPpnxI79VBNLwScLlkbef0ibj1Ex27l+wWTgMckAO2uzjCCkk77Xcu15RP+hTeSq9CxEJ/fZMs1toiemUcS75FIOQqio6B0y+6sKVevJvlDF7ap5gTNTBifeinn+tUIgoHPdiUAR9hK2zzUScw0eNJ62q09ozy2aP+JRmFUl+CIFLIg1kk05ALJ4APy20W2dH+rhd485itSoKQx+RjIGGTVn3aW4b7ObmwjP9w6/8jyUb83dDDLpw99rDSAAKUOCtE36nJN2zQWVqu0dG6fsaMPh3x/jMBoVgFbPIDTQV7ro6wT8wPF+uVwsFCWnu/jT1swKW81EyYclMUs9tbyqV4Hx5vl/kJTLY89DyjP1KrWW6PibcDabu4yf83qREJ/qWosXvcHhaityQEp4w2ChkT38RB9MhZ5zMGU3uYdFOajJsmC30pfrc8QpyZ6yDBUfMjOIAYrtUj4Y/cZRvjWHdNQ4Q5Q6n7SMYVw9sNnDSk+S0waejOHwNrN9Qs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39850400004)(346002)(396003)(33656002)(54906003)(38070700005)(110136005)(316002)(38100700002)(122000001)(86362001)(52536014)(64756008)(55016002)(2906002)(8936002)(66476007)(66556008)(478600001)(26005)(9686003)(4326008)(66446008)(6506007)(7696005)(76116006)(71200400001)(66946007)(8676002)(5660300002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay9iRG5RQ1BOdklPMjI3Yk5IZElTbmhpdm1ZS2dSOVpFWVZFZzU3RnJiWWVi?=
 =?utf-8?B?WlZteHc3Znh0eDcvdXQ2d1pmUExUWVl6UlJ4TmxENExDb0s3UnEvWCs0am16?=
 =?utf-8?B?cWRmODhRZG5CSXNZM3JJaUZvUDE3djBGb3N1TTAvTlN3eFphM1N6dmE1azdV?=
 =?utf-8?B?ZElEMXlXR1pjMUY2NXYva3ozWGdhUFpHOGo3cHRQeVkrZzY5OUJqVW9GZ1J1?=
 =?utf-8?B?YzBPRFVJSlcxejhtb3hMa2R5ZGs4ZHUvNFlmMmFuT3dHOUtDUGRqR2dTaVdN?=
 =?utf-8?B?Ym9Vc3NGYmdQS3k0QjRCM3VqRkJXS0hKSlVtNHRpZWd4RmRsNnhqdFBSbDZx?=
 =?utf-8?B?YjQrNDJJOUpYemVnSVk1WXdQL1dZNGJ1ZXMxTWtpdENKSUNpSEFpQWRwL2xk?=
 =?utf-8?B?TWRDcTBpVnliOTVxREw4R0c3cXpzU3R4aFc3YUFISVpTdytLNXhmM2s1M0hF?=
 =?utf-8?B?YU1YV3MrMjIySktTZTRYMm9HMWswSStJNFQ2S2tITU0zMmhIQmMwaTczOGdH?=
 =?utf-8?B?aDh1b3dPWkV2N2dBbUlxVjRBNkwvQVBTbldUVVk4ZHhvRjZocHFrRUJlRkFG?=
 =?utf-8?B?VEcwcWl0RWtSWDBzQW90MGtUaEdjMjJPWmNhWUthNlgwb2tPbU8weVF0NlBO?=
 =?utf-8?B?NmRSZGZtV3lTQ0xWMUhMbnRzbXQ3cVdvQVVTU2lZY2s5NnB5bk5RU2hLSVVX?=
 =?utf-8?B?eERQeWdlenlVUkhaWTNKOSt2MXRvVWZpQ3JKdGdaREl2QVE3Wk1DZTFjMURX?=
 =?utf-8?B?Si9iMERvck1wR1VyNW1FSTIzbVpsbTdOMllzRURjZ3pldEJ1a21YWS9vR05r?=
 =?utf-8?B?YXFrYVFEWUVzcFBoUHFVVVBpcW1yOHlWK0JmV09UODFyVUdGMHpvdFRzTGxD?=
 =?utf-8?B?eEZZVzJueEg0K2hRbTRyQ0l0QTI5RGV3anROS3VMSlVzUjFOWmFsdzhUQVc0?=
 =?utf-8?B?VDNRVUFWRmdpQjd4eHExM1psYmM4K043Vzl1RWZZYmhoeGVSbGg3OTV2bTRS?=
 =?utf-8?B?dFkwbTNTbGRVWGpvdDhaeFVKWTQ1NmtUNlRhTWo2aDdtQ2huS2UzUmtBVjZJ?=
 =?utf-8?B?dzY5OEM0dDFDSEU2SmxXT3M5ZXN0NVQzWWxLUXRvVHNVVS8rWW9KVCtuM3Q4?=
 =?utf-8?B?SXhubnJOVmNhelhxL0t5OHRJWUlFTnNlaE9yVUVKeVNGWmUzK1RZcTAxU3h4?=
 =?utf-8?B?Z1cwUWo3eklKMHJrSEZIQS8wWktlb0FsVjdXemQ0T3ZGMGUxQ1hPeFBhdUUz?=
 =?utf-8?B?MU1FNzVhaVJmWmI3cUNTV0JoWVkxTEFoanlpY2VMbWxhSXpBZ1B2dmErUEI1?=
 =?utf-8?B?ZENDKzFkV3I1WnJTUktoU0thRG5DdVk5aUp3QlY0TDEyVktaYXl1SEp5RWNx?=
 =?utf-8?B?OWorclA2Uk56dkhmdmphcUdaa3BTcVdLUE5pZm14TndHN1M0TjFpTHBRZ3Iw?=
 =?utf-8?B?V293eWp2QWlERnlZVlZ4ZFg4REt3UXNBMWNWZjlHQVNUMm5UejRpQVVVclpr?=
 =?utf-8?B?MkZPajhwek9oSEIwM0FqK3Z6cFUxYjNkbnR3Q2FTU3Q4bmZmaGNsMVhUQlQz?=
 =?utf-8?B?S3lTeDcydWZTKy9DTEkrcVBiUjRBWTh0TzJMWmp3MUszTzAyaTVSNHF4dHRH?=
 =?utf-8?B?WFpNVXJDVWJwNEtEOXpvSVNkUFpsalFpM2h2cWxOOUdLczgvaEk2Y21pNUxY?=
 =?utf-8?B?M0NTZUJ4TzM5QjlWUy9aaHZOZ010RlJUSEpKekRQSTRJd1dXRTlVUFpEWENm?=
 =?utf-8?Q?IkEMpmvMS7OEQJy7/UeWkEm3QfUqIbcJDFtyjaw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76e7eab-bd6e-4f5e-52b8-08d979e3890e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 14:00:41.2530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CqFfZje0iDqayM4stWbS0NJWBpA6RPGn0SsLZ2JLzc47KVF/4wxP0aS7/pd8r6Cx4qtXltkadsPHahxLSvqrkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5682
Received-SPF: pass client-ip=40.107.82.101;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gPj4gKyAgICB0YXJnZXRf
bG9uZyBzaWduZWRfdmFsdWU7DQo+ID4+ICsgICAgdGFyZ2V0X2xvbmcgc2lnbmVkX2RlY3I7DQo+
ID4NCj4gPiBTaW5jZSB0aGVzZSB2YWx1ZXMgd2lsbCBiZSB0aGUgcmVzdWx0cyBvZiBzZXh0cmFj
dDY0LCBpdCdzIHByb2JhYmx5IGJldHRlciB0bw0KPiBkZWZpbmUgdGhlbSBhcyBpbnQ2NF90Lg0K
PiANCj4gYnV0IHRoZW4gaXQgYnJlYWtzIHRoZSBjb2RlIGRvaW5nIHRoZSBsb2dnaW5nIG9uIFBQ
QzMyIHRhcmdldHMgOi8NCg0KWW91IG1lYW4gaGVyZT8NCj4gPj4gICAgICAgTE9HX1RCKCIlczog
IiBUQVJHRVRfRk1UX2x4ICIgPT4gIiBUQVJHRVRfRk1UX2x4ICJcbiIsIF9fZnVuY19fLA0KPiA+
PiAtICAgICAgICAgICAgICAgIGRlY3IsIHZhbHVlKTsNCj4gPj4gKyAgICAgICAgICAgICAgICBk
ZWNyLCBzaWduZWRfdmFsdWUpOw0KPiA+DQo+ID4gV2hpbGUgdGhpcyByZXByb2R1Y2VzIHRoZSBi
ZWhhdmlvciB3ZSBwcmV2aW91c2x5IGhhZCwgSSB0aGluayBpdCB3b3VsZCBiZSBtb3JlDQo+IGNv
bnNpc3RlbnQgaWYgd2UgbG9nZ2VkIHdoYXQgd2UgaGFkIGJlZm9yZSB0aGUgc2lnbi1leHRlbnNp
b24gKCd2YWx1ZScgaW5zdGVhZA0KPiBvZiAnc2lnbmVkX3ZhbHVlJykuIEFuZCAnZGVjcicgaXMg
b2theSwgd2hpY2ggaXMgYWxzbyBub3Qgc2lnbi1leHRlbmRlZC4NCg0KSXQgd29uJ3QgYnJlYWsg
aWYgeW91IGxvZyAndmFsdWUnIGluc3RlYWQgb2YgJ3NpZ25lZF92YWx1ZScsIHJpZ2h0Pw0KDQo+
ID4gVGhlIGRpZmYgPCAwIGNhc2U6DQo+ID4gICAgICAgICAgZGVjciA9IC1tdWxkaXY2NCgtZGlm
ZiwgdGJfZW52LT5kZWNyX2ZyZXEsDQo+ID4gTkFOT1NFQ09ORFNfUEVSX1NFQ09ORCk7IHNob3Vs
ZCBwcm9iYWJseSBqdXN0IGJlOg0KPiA+ICAgICAgICAgIGRlY3IgPSAtMTsNCj4gPiB0byBjb21w
bHkgd2l0aCB0aGUgbWluaW11bSBwb3NzaWJsZSB2YWx1ZXMgc3BlY2lmaWVkIGJ5IHRoZSBJU0Eu
DQo+ID4gQnV0LCBhZ2FpbiwgdGhpcyBkb2Vzbid0IGltcGFjdCB5b3VyIHBhdGNoIGRpcmVjdGx5
Lg0KPiANCj4gV2UgY2FuIHRyeSB0byBhZGRyZXNzIHRoYXQgaW4gYSBmb2xsb3d1cCBwYXRjaC4N
Cg0KQWdyZWVkLg0KDQpUaGFua3MhDQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVz
cXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVs
ZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

