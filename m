Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823F43D2E2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:33:53 +0200 (CEST)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpcM-00042f-Ne
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpXd-00020y-KK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:28:57 -0400
Received: from mail-eopbgr820091.outbound.protection.outlook.com
 ([40.107.82.91]:54272 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpXb-0006W2-Tb
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:28:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3z6my3bbPkW2eVnE9sWtsr1bFONtWAURcV0NON7el8Yn649PiUOwVIQ5d+dy5p/vhj18KBR2JXN5ammvZg57BoOk6I4KRlW93S13J1NHjZGxOSYcaBOr4pZ+HgfALRUZ0OaPLc5wqed0FQI7Inix0ETDJAWEkYFpe4ebKxl2n4szUn6Q0wa77Dxm/a4tSShuOuQvL0PiITX5iOfgqnLZjL0xtfSh9xe2SJDRKkR/HVjhDH6YJ6ZlXsEP/R68cNOccTu440LlE2VWNCaLtlR68oiryJ+Eivcab+HGbPqa7p4gs2zX41qhDRK9tDZEOK5sKm2hP+3JrDQLNJg8zaKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXGf2qxFw+HULBIE9E4Kpozv534mTxC/q00fJIOtP+4=;
 b=fZ/itbn/tOiPQb5ySqOF6oMooAGUPZHrDaYE237XXBCu7uJkUiYzzmrxrQz5Efj2H3Z44sijQL1NOWQYnCK6Ap3FWxRDJNxIF6n+2W4bTZhU6p/xbknV7NjXIUmFYtH0mNkK6xF6/vjUoUxwZdxlohWLhCfFfxeDnb1ky5DHc8ezueyU9LAARkbw0GiCTmUs2Oxc92KjSDSg/AZdPR4iKUQftaLMl9fd8SfVx8kur5Suonx+cjHDPhBJwUvXCBJliQFfd33ykyAfs71LcgAEyTwnaHuA8SXIeosZAydSxrLYMnLy/QIN/hC7M91FeZWq7AB/BzKaW4rBrX1vtovzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXGf2qxFw+HULBIE9E4Kpozv534mTxC/q00fJIOtP+4=;
 b=ffwWJB0ArODppVrnPSBBkZ0iSOsZ48NO4wVEjw+MobJ+t4y202jFV9fdM7xsSTrGXpth+ug886t7r2hJEyJUiR4z3d7dbPYeRufh4isjnjGeD+kphuFICVhlx5OJ0jgIuWncb7AC+XNRxIUMLPZOuSFk1I+hIthmf0R+mtkaerjoMxUCZCoEgrQTEf8ysZt4s1ioHg8PJnSucBEjUQutCEAaVJNItnD/JWtI/vzLz77Z805f3iRespUaJdCSCBsPSg8RTtKP4Xf7lgA3ita+1MWewzURRheMvFjhProZe9zl/CQ+wx/ZrQqaMpFIlr4AtlkBZocR5412YZCAeDVOsA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB4982.lamprd80.prod.outlook.com (2603:10d6:103:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:28:52 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:28:52 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 40/51] tcg/optimize: Expand fold_addsub2_i32 to 64-bit
 ops
Thread-Topic: [PATCH v4 40/51] tcg/optimize: Expand fold_addsub2_i32 to 64-bit
 ops
Thread-Index: AQHXyr8UB/4c6J38OEiF9a1v/Fu606vnTPAg
Date: Wed, 27 Oct 2021 20:28:51 +0000
Message-ID: <CPXPR80MB5224A112ECB210D95732E6F3DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-41-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-41-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f3411a3-35e1-4d0f-1855-08d9998863ee
x-ms-traffictypediagnostic: CPXPR80MB4982:
x-microsoft-antispam-prvs: <CPXPR80MB49821747074EF64A678F2669DA859@CPXPR80MB4982.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DV21KfgNxgqVQNX5jKibY0Nzl0P3kSPEVZtWdCwA2YRY33dnh930pTQs0Z0SqFP1yVTAv8OnwjV3iA2KP8mWyT91lk3ZCrtz619+S0cu4e0HAUBcrdBgZIp2i5tbVwmD5A9zCjbVVcjt/SVGcmMggolDAMXFWF9uoSFb2ln6vrBiimuaeiYMHZ9/zpIbKPQDJF1e6CspC4/GiBkSTBcQ1qr9UMF2/ole3COZxmsK2deErS3yJ4elopU7KfX4FoM5zr6MpLs6+wBlHKRrjvmaXb+2X4kAHXvif3da4ABycQi3YYCeDLCqotQV4BrA5bZYEH1R/wQj9aToaESdwcviVTZAyQVOwHbCBXYaMiyInXz/mQYC56UJeyoJ7Qh1AQOWfROM+K44Zz4Ps3QuXpvLDs5qEU2nMUylVm72lXb+6gAQ1SZ/BmeVGDqPCiOF/YsdePpVwHYXc+imogGKUGSk3Kgluxb0u0XwSlPOLy8buNkgGHm60MByUigNKwoVXa5lhi7Zt1nD2FfrVA4ZoTavMIv5Llzm22EyIWdGCFoTXAhOE6LTv0sleuIuPsm14BInZj/Ozre5nEKjsrUy8v3JLBvQPGXWRuHKngYn3SACYzX35CfEDGbMAsZxa9R7epygUqDkOTroFpXU6+PVE68vm/qyKueIBIHXauSdh15ecuiZ67n790gVyS6xyAWrrlvzI+9s0HmJx4m9mgus201T6FP/uVC8F8u2tq7d9DigHerYC/6U9CGApElaHguN3LVEhb8Ch0QZU5NGzHqbJhCxqSs5e2EFZcJ59Fv1xg6VsPY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66446008)(64756008)(86362001)(9686003)(66556008)(26005)(4744005)(66946007)(76116006)(83380400001)(5660300002)(6506007)(38070700005)(4326008)(7696005)(33656002)(54906003)(316002)(8936002)(186003)(110136005)(38100700002)(52536014)(8676002)(122000001)(71200400001)(2906002)(508600001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akVwWWpEaTlsR3djdytFS0p1ZzcxYkxncnUwTWJWZWhteWxTemkyUnFRb2ZG?=
 =?utf-8?B?NS8rWStOM2R1amlRRWpNQTB5aFArNzU3UldJNEhNSWs3NUFicit1K3JRZmVS?=
 =?utf-8?B?YjM4eDVSWlFIelYvNVlnMnpPMG82YWVPWWxkdW8wUW9Fc1k1bHp6ZVpzL1RZ?=
 =?utf-8?B?N1A5a3U2Yzd5a2RMYityVjN3T0Z2MnZtMW9ONzlqMFpxQU5kVlphZWl4Sys0?=
 =?utf-8?B?MFBLeEZsclUveWJ2Mm5jb2Y1Q1ZxK3hOSlBKamxHQ1BKNTR5QWVsZjh1d3Vq?=
 =?utf-8?B?Nlc3cjR5aGxlUHEzRkd2ckVudmhNNHlJdlZkU1FkQ2xpRFBkQTRUZ2VPYldn?=
 =?utf-8?B?WjJIK3VHWnltVHV1MWpvd0hXSHlXS1JBYnJQbklIOThYNjNycVpUU3FsYjc1?=
 =?utf-8?B?ZmlHVHU2alhmV25ybk9SVkpYcHl6ZCtrTGFRTGNmSjdWZm42aUlYeW1ycHUz?=
 =?utf-8?B?RjNtMkRJSjdLemhZdGEyM3p0YUNPQ1VoSEdXQk5GTzhnTWxFcGtTSnBYcHNj?=
 =?utf-8?B?V0pSd0FqazdsdHVjcUxZMmsxSEhienJuRkZUM0hlaEtJTjZxZWhLWEJLaDJa?=
 =?utf-8?B?bTFtc0tEVDY5L0ExMUpCVTNGS2NVYVFlTENYbmRQeFNSa2h0T2VJbmtQckcx?=
 =?utf-8?B?ck95MXVoelY0NTIvZklFUytyekRvSTBoNHc3QkIyNGJMTzlIWVNVL0pnZ3E4?=
 =?utf-8?B?MUl3Z2VaOExLMk1GQTllTlN2dkE5cmR2UGgwOFY4U0U2R2pwaEFNM28yWXlm?=
 =?utf-8?B?WmJzZzEzL0s1L0tqZHQzL2d5R1N5VnZqK3l2NkZDejlsS1FnWWJPWlVkUTA5?=
 =?utf-8?B?amplWHE3MEN0eEhoNTM4cGppNW0ybE1sVlRndFgvQkVjZmc5VW94czBEZU9H?=
 =?utf-8?B?eDYxcE82cHNPU1hjOUdkSXBweE5ZaC9oU3JScW1IWitGTFJ3ekdmUzZZSzFD?=
 =?utf-8?B?VDY1OXFJY3YraXBpUTVLRFJWak5SalduTmVWWHV2dU5UQlhtTWRzZU1YVXhh?=
 =?utf-8?B?NlJHK2hTVVB1V1lWTEJvTDBqVWhoL3kxUXo5TkJhUTB1aXU1cXd4K1ZsVGU5?=
 =?utf-8?B?bXlockxyazVtYlF0VmIzODA1c3ZYakFydSt4cXB6SVZKcjh6MU9VZzFWNUlv?=
 =?utf-8?B?R1dNVWdjUUM5c0Z5QzhjbUxoLzJaTjVuNFFxNnNwdXpNRmtDc0hrR25kZDcy?=
 =?utf-8?B?Q1RibU5nVjYwTG5Ec1REVGJGSUZkb3N2dXVSRXVFN0ltcUNjV1hhTjBBcXhV?=
 =?utf-8?B?cFB3ZU43NXY5NXVOQ0lRSVM2RG4zbjgrRmw0MUxObFRxbnl3WUlnY213bDZX?=
 =?utf-8?B?VElOQUJRYlFLRmZ6UmZaU1liWnBoODNBbzc5SXA2K0tWamtEamNwN2tpVVlG?=
 =?utf-8?B?TXJJSTcwRUU1Wk4rU1BFenZ3REkxWDUwaWRJM2d2TVJNR2xqV0NqRnF2VEM5?=
 =?utf-8?B?ZlNnblg1UGVSY2ZQWGNhb2VLb3BUK25HQXN6N2Nadi8wbGZXNFZITVpvdkM1?=
 =?utf-8?B?Ymxuejd1SDIyTEJyMUNOWHB2SEduZVNXYXRlbElIWVIwNU5wUFV4eFYrVUhk?=
 =?utf-8?B?SlNFUVIwVWQrSytoV3VwdkZPZE5Wa3lvZk11dVZOWk05ZWJHOHNRc2w1bVlo?=
 =?utf-8?B?MWJ6bFhGOVVqQUxUeTdXWVRHUVVVeFBCMDhDQ2pVZk8vOG5wNXZKaVp2WXVH?=
 =?utf-8?B?QjJiaGVDWTA2SEpaOW92WHl1UE9yQ3BQOEdua1F2VkhTSEFYaTBEa3R2NlRB?=
 =?utf-8?B?OEk4SzRpZmhqNkZ3ZHpNTVhDQ2svU3pGak5SZ29CYWVQZ3Y0UGZkY2o0ZmNB?=
 =?utf-8?B?Nk1mMkZPM1VGZ3poWFFhdzczSERKRERVWW0yNXVWUGxnTnAwbWxseCtpRWR1?=
 =?utf-8?B?RzVldWxpWjhvUHpSSE80L3JFeVR4c1JZMXg3V0o4U0VZM0o2U1IreUxOdlRl?=
 =?utf-8?B?aDRwYnZCUmFXR1A5LzRoeWwyMEFiVkZlRjBPcG1mN2hraUx1clpaQlhkWlAr?=
 =?utf-8?B?M2xSdmQwdS9oUFZrTHNDb0VycUxSTk5vZGh4RzBoODN5ZWFTNVNSZkcza2Mz?=
 =?utf-8?B?L0haNnZnWmJXQ0lZK3hha1BJQjhlMW96VktCZ0ltZEZKc3dtS20xZFM4QW9J?=
 =?utf-8?B?RlJ1MlNPOTJVSGJ6UkVHcXcwN1FLYm5LNk5DOXpxNHdRQlNQSFN0b3ZLM2N5?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3411a3-35e1-4d0f-1855-08d9998863ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:28:51.9096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vc8p83xjt1Yubj7p+3JHkcO1DjgaRP9cHY7M7IONjenqDjXNuJvxiHsu7cW+eEpvd/WuQEXJWlBtQtGeTfjBvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB4982
Received-SPF: pass client-ip=40.107.82.91;
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFJlbmFtZSB0byBmb2xkX2FkZHN1YjIuDQo+IFVzZSBJbnQxMjggdG8gaW1wbGVtZW50IHRoZSB3
aWRlciBvcGVyYXRpb24uDQo+IA0KPiBSZXZpZXdlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJl
bm5lZUBsaW5hcm8ub3JnPg0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PGY0YnVnQGFtc2F0Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgdGNnL29wdGltaXplLmMgfCA2
NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KDQpSZXZp
ZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpM
dWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAt
IERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+
DQo=

