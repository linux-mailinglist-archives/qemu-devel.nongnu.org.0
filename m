Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7B437C67
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 20:02:37 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdysG-0007jr-2Y
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 14:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyVm-0001Jx-NJ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:39:24 -0400
Received: from mail-eopbgr740101.outbound.protection.outlook.com
 ([40.107.74.101]:58515 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyVk-0000HI-Kt
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:39:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvu+Hirdg+eFb9TBhcLRDPxDsSp1Oh1KAQxHUqOrwuYz5aWJxtyOwka1gxjz3FddLCHVl12W/EKcuz6tWHeHNNgMqw7WsjgjnZFKTkBZGI4VZxec10ZbpM+IG2xcCUbljRTEwT54oAO4WclKNEVvIagf/S+mj2b2GmnHu2FrYwj/QBROb1A8RviNScoovOagJMGUzoR4HaHCziQMYiaEPwumxCv9hogskeeSSQkQdv89dV+We1o1MOS1ayPT9yXUv9OQuD7Y9WLGSvMDwV0ClJRa4nmj3snwI0L5PBkuvANasdL11ZN0Y1XbQTdZt8g7IchQVnLIhKZ4sxxWeNyVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StYO4uPN0hdAoC3l9jjPtd/Tk2DYWDwaqf4RUD/J8VI=;
 b=M9MMJrFYFkZkjGEwpza+CkgB4IP6heEnMko5QNlb5WZVS42EGaTSCi9ZUoAPncmLYXpj24VEBImnncRBb0iJXflDWbCnZv+OkKr/PeUfqBe8vIvsGFNhbjKsC7sWJKZSZOvKjlRQFLXGsGL2HKxnChDnvdRUIWShhJLmW97Z3EeprPlMwI1AgI18oAyHu/NmMUjvvgZkwzYKAfbCTWAEnx6QH0wqsvGDqyeOq7TlJZrFJiImTTbsv44F7FlqrtiPTJRD48lm4jUapAiDtAHZ6md1oyCxS5lo2yOiKWhjJzLf+V4/j2E/wHsVocajqW9lbLi+W6g1r/l+eK1yAYaIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StYO4uPN0hdAoC3l9jjPtd/Tk2DYWDwaqf4RUD/J8VI=;
 b=Ke9SrblXmG067MgXW3cx91a6IiJ4Eu6MQM+vTYYu7m1EUBOF5GuHM1wVL8h7ND+tok3duGjeapzn6HfLZgFbNz/ibBhtILbUP2irpCo/AwzxpM/tLZ8edAbkqgeIRfCvdl+p8vmMuZijSIneBXTS8IWmaJ/HML1DHvZkloogTGx1MJkygSm7A1FpN8SJOTh9Afuj88DLslhkR9EgKHoOJP7YJDNyDxDp0rZZZ1cSeruuSBoJeB6+rpGiVXQFGMgqR6FbplmqzoefPloHK87x74GowT7Oh02YR070aRjIbx1H0WnoepKRN+PByIndP2NgC+oN95vFm+BN//LTi12hJw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB0145.lamprd80.prod.outlook.com (2603:10d6:102:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:39:17 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:39:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 29/48] tcg/optimize: Split out fold_mov
Thread-Topic: [PATCH v3 29/48] tcg/optimize: Split out fold_mov
Thread-Index: AQHXxr93PzSt/fBDdkKFvWnQHhpxVqvfSeew
Date: Fri, 22 Oct 2021 17:39:17 +0000
Message-ID: <CPXPR80MB52240E37472D2431B92AD859DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-30-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-30-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c000c470-410e-4963-658e-08d99582df3b
x-ms-traffictypediagnostic: CP2PR80MB0145:
x-microsoft-antispam-prvs: <CP2PR80MB01456379BDCB29422698501FDA809@CP2PR80MB0145.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BsW9glzUdDlScjSIg1KGuvqh/LVEbhExhSJnlrVOjlVosOzXMXbNjhy4oO/AyKs41/s+bKfImAOENyMxBWK23iJ0oA+vylOWyC8w2sdGWCKcV117nQ3KxkFs37T2jIEy69nkWHasCWtQTrwOZ1nMNddQkz7byIpLUj5nWC4skdezGAFChS8YuwTR0IOXZd5C4SLk0TfgbYPYL7dYWxkese1mIlaHrB5DHVImPn5suZUTRixD8g5QMtIVuYopNwrpOW39Gj+e1Ue07gap+6lIl8y6vS4u4OT433NSYjEfLhfV+S5iFS5v9jCY6GFawnMHR6gGAKHAtBlVdsAQQPGhtC86Z0gxWaPEEmw0TwALg9/jhInolOjsGwfOYKhkU9PX0yQl9i+RljYUzs/Dk+gn3zffqrckS4+kj55F18NROG0hR0q3H5qPll5C4I/WhfUvON4geTQgcjM3dU0cUfeYF4NUk2CoysaJ4YEZBN1uE6GWxzNP6uNPyHg4DPu+8xpozWOrPS3rjDX80AG+OWwu/wiF9/LG45xzQkUsm3tpi7e0mIvIUn1Li3qjW/9T0Egn5MApNpbVVF/1VBNMpKUmKPJKVTqM9cgOTSFfUA18BrUE4ocJ5aZ8ABzpotCoj+5W1D4QEMEhvVap5YKXSgqYyX/13XRbqfxrlT+Ztsa8B1Tx1ccaMeM1imGCFf02k6ikEsT6FX0hVMqOtCM9TNBoqbSC+iSn/e1zQlhx+vXtgcg7gaDrtZTAyMqJMH0msXyvRBVOriGBmhgcLj7A37Mn+SVO6wr1Is4Gi0a5nnSlGUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(4744005)(508600001)(64756008)(71200400001)(33656002)(4326008)(52536014)(26005)(66446008)(5660300002)(186003)(66946007)(76116006)(66556008)(8676002)(316002)(2906002)(38100700002)(110136005)(9686003)(122000001)(7696005)(55016002)(6506007)(83380400001)(38070700005)(54906003)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L29mZHJJUlVjeW9EK2lETnVoajNpcjlKc2IrdkVvam9KNHNUeGVLYzJTLzEz?=
 =?utf-8?B?aEZYYjluOFBrbGhpQVZBbDBmdnFveEQxZzhTc05MR1FWUUV2WGFvSHRrWi91?=
 =?utf-8?B?OXN5UE11c083LzhNR3ZqOW8zUnlVQUVyRnI5em5oT3FCUUR6KytVNnJjY09N?=
 =?utf-8?B?NFh1VGlySkJ3WTI0eW56WjlOK28yRnlxNGZ2bCtsc0o2M05XSy81azV4YlBm?=
 =?utf-8?B?a1c5TXRXeEE3VklPcTlyd2lzUGNLTnBVTm11VkppR0twdDVPdkkvRXlMVzJm?=
 =?utf-8?B?ZU9FRk5PU1dGVGZ1aFoxaXRBa2FWcldMc1RETGRnODVRcXJMcEFxaUZwOXp2?=
 =?utf-8?B?eEJXNkgzTHpBVWpuTGN4ZGZmQ3gyWE5sNGpiNjQ3Vlpmbm1DTzJ0RFdWakZP?=
 =?utf-8?B?TzRmY0UvSUV0OThJUFBLaFo2SHg5azlxYy92emdndW9wMEFlZE5LYTY3RG13?=
 =?utf-8?B?VzN2Tm9RYTVINTNBdW1Fa1JJcTRWRWNTT3pqcGRvUFJ5VnltenZabFNaNU9p?=
 =?utf-8?B?N0FkMlpGNS9IeVhSMkZtRk0xdkliaDQweisyVmRROStKMitJbVBtcHhIcXJU?=
 =?utf-8?B?L0Q5TC9uQ001Um1IUE5rRlI5aEx4QkxhVm1JdS9ZMGErK25UQ2dYTFFmYWw3?=
 =?utf-8?B?Q3lEZlZlL2NJUjAxVHRjS2Q4aVREUkRkVjlaTm1mWHJMVU4yc0JLRVh2L09I?=
 =?utf-8?B?UUdkZlhYc2VmMjI1djNRdGFpQ3lMMkxrT3doYklxUFRuaWxxa3FjdTJzcjdt?=
 =?utf-8?B?RStvYTVlZnZZL1hrOGpjZVYwNEl6NnAyOWY4VVRtcHNEUENMNng4TGRYMmJC?=
 =?utf-8?B?Rmg5QWV5dzlUZnlkV0ttV0FUOFFSQzNlaU5MTmNlcjNURVgxeGJKRXp0Rm5W?=
 =?utf-8?B?RmFNdi9BU3dobW5FV2VaTXZYUk1JZFRsWHduQWZQeUZibzd2bnpLSkk0MSth?=
 =?utf-8?B?ZUNqOEFrejgxMHFUMWo2Qnl2bExtQ2xFcHNXZUNkb2FEOFp2cEFXRVlRYmJP?=
 =?utf-8?B?MW04ZVBxSHJyaDJ4QWVaakN2YVZxOTErYjY2cHIrUXkrbC83SjNPZTdVWFpS?=
 =?utf-8?B?UGlrOUZ6TmI1WnF2UHAzenErU0lLSVNCeW0zQS85Q2ZGQ1pZUWJtVlJCdWh5?=
 =?utf-8?B?UWczWkRVbkFmV0hESUU2d0I0cHpaVGhNaEp3eTlvUmdFanZDaWdhTWpweDVC?=
 =?utf-8?B?c3VnQmRwT3EyUEhxeUowV0pXOW5pcXN3blZGWUdlTno5YnpUaWVyM1Q2UjJT?=
 =?utf-8?B?Znk2anFGazExdm5tRnkyWkJJaFNEbnhDeXhBdHgrcHM3VTFtR0Zja0VEOWNp?=
 =?utf-8?B?cDBCRXFuVzBwd2FIRVdaV3UyVStYTDhBK2Yzdm4vQ05HRCtuVkxkb1o2dGNF?=
 =?utf-8?B?L1FlWXg0OHd6YVI3Q2Y0YnovQU9jQ21iWDFUUHQ1bXhRZEJvalJBSTlaYmdz?=
 =?utf-8?B?SzRkK1RPRGhvTjZSMDBYVHhuaURWSG5uT3pOb3FiUU9pRkg4YVpCaCtCNmJI?=
 =?utf-8?B?bnI1eVd6ekR1b1dJSTBidkZvZzZHdnBrRWhBN0FkblBsQXhxMmRsaW5hWHNM?=
 =?utf-8?B?YzlpOXZndFpSbkx1MDF0QmdsaFhlMkpoUDRYdlFqWVZFRlJwWFZ6VnorcDR3?=
 =?utf-8?B?dXM5OFhWNDB1ajNRRG4yKzdGVDFHbHRCcHpyWmNQenJ5cEpKZ1FNYk5rejBJ?=
 =?utf-8?B?dk5sZ0hDem1XWThnWm1Od2FiYWVjTnR1OGp4QnBmc1VvYVFuKzJJNjNxZ2VI?=
 =?utf-8?B?ODNPcm1hekhqRWUyK3J5cHBuZ2lGbFhLN2hKZHk2dGRVT0VrSGNkSjEwbThP?=
 =?utf-8?B?cmZGL0VPRHAwMmdyeUhpampibGJMUkRwOGgzanRhZUdaUFlIeExqcFhMY0ht?=
 =?utf-8?B?NTdvQU9EMzBEZEZ1czJUMi9pb2xaOFVDMzRLcEVDYlJ5S2UyRFlOWXdzRCtY?=
 =?utf-8?Q?OZwZ4KCpRUc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c000c470-410e-4963-658e-08d99582df3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:39:17.2615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0145
Received-SPF: pass client-ip=40.107.74.101;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFRoaXMgaXMgdGhlIGZpbmFsIGVudHJ5IGluIHRoZSBtYWluIHN3aXRjaCB0aGF0IHdhcyBpbiBh
IGRpZmZlcmVudCBmb3JtLiAgQWZ0ZXIgdGhpcywNCj4gd2UgaGF2ZSB0aGUgb3B0aW9uIHRvIGNv
bnZlcnQgdGhlIHN3aXRjaCBpbnRvIGEgZnVuY3Rpb24gZGlzcGF0Y2ggdGFibGUuDQo+IA0KPiBS
ZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4NCj4g
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFy
by5vcmc+DQo+IC0tLQ0KPiAgdGNnL29wdGltaXplLmMgfCAyNyArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3Jn
LmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0K
QXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlz
Y2xhaW1lci5odG1sPg0K

