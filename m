Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815B437C43
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:51:41 +0200 (CEST)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyhg-0007Fv-HU
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdySz-0007Qn-4X
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:29 -0400
Received: from mail-eopbgr820119.outbound.protection.outlook.com
 ([40.107.82.119]:10644 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdySw-0007pV-QD
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdhX+vgUG/4pnTObcaEXwbsIK7AQsftQ0BVZhQrbhSbezP3O1vAkb/4/AspwlR9B8pBOCOelDhRWtBiEteBk3joB5itHBcJ7QLw062DEiczi473O5eeamgafV+O8vAIrgHBjoH1Wfd7MwuMqM3phBl1cw2lnzxtxeS4UPY6lP825kIEdeePbGjNYfp7wGQsenRmUNHlFKTtKX4+jc8GwspFh5MovOokgWIzbr+ErCGxoMFjB7sJ50J9mjfE4xkQqCUIKmX7mbc8cpCPUVeoiU2POUpfdAeRbeP2e/IkhkX7U0+9yj5s96yafR2diPqF47fzXCbqq3rOm38D3lh264Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5afmpQp/TJYNZ4JjcTcwlSwVetICC3P/MdNdPCO3Nk=;
 b=MqFyd7riNy4/ChIqo0Ii6Zkb5Ier/Y+j+mnSogiZzv7b5vyi8qQIXvnpXEM2lV1pDp5nzZ4heT1Qs5IY+PLnJl1s7foodnG3udWZSmtcB5GSO7UUKRpb2gpHv/DkiF8hl4/XOBVmm6koJUgLmVIHgX4qMyF13KBXkBHQUnMSO8/zzLOd1ZcJ90BISCWhgYNJdX4gjlpskFqqvrq5bySIcSzMLy+wls8DgdGm4XpY3ZudYyjjxFSgdpa5dkBKvs5Ce/hAO7n/XVXlpzIE+oHp+AWblEz6eV7RY3z2JB3/8vbiNBfKRERH4hnz7iJgRLzNxwUaeJIfz5+lm9BtBgGHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5afmpQp/TJYNZ4JjcTcwlSwVetICC3P/MdNdPCO3Nk=;
 b=AFnJqrOEm9Fmx6TAsIvghOpAYjErVgdFOu74hhqz3KCwsWOZOm0SxmD9aTCt9vvmaaIlt1MThyDFsCwFrwJVocYP+eTmdzskfuNruuEJODHMiIV7zGnagFQy24EJ3DZ0PZTgOtfJmGJPkdiVfd3eBMj9Km9A0cvEpVc71wOyYrsXqVcQCUBM0XjH/bQWg+Cc8eWrew+8HNxbFowJX9n8lE97t+MEml4mAtZedaUvzAqWAQIRwMA2SPk+9M++ogrxxeEs8/O2DB0YdgGyud3Of6Kc9AWFqiJ9vgnQpkrbLhHZrcUEVY3xIMDZawb73jb6Vr9BX94LdMc+XULazKvy+Q==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:36:24 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:36:24 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 27/48] tcg/optimize: Split out fold_bswap
Thread-Topic: [PATCH v3 27/48] tcg/optimize: Split out fold_bswap
Thread-Index: AQHXxr90E2927YwagEOIPDFBW7/Yg6vfSRVA
Date: Fri, 22 Oct 2021 17:36:24 +0000
Message-ID: <CPXPR80MB52243AACCA048CC8E37597E6DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-28-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-28-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e79c669c-2508-47e7-6cd3-08d995827842
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB39249D6860DA052DB51B2AE1DA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2vqfRK6voVxx9DEIF/As3a3Q473YRqOpzVupAd43pXSfA3T936v52yRkcxQ0e+/3IaHuYovA7pWILLjrj2XaEKwnZTkn1HRygYuaSJxQZHQFOA12RCZRVobzJU6YgGKrN+7ZOKLcNFqBf/rvzqki11eURyEfDrM/4st7CzsFwaia+c8ET0HTq+Iz6f0VlywragJhsldrw5RGGqHChUpDTE7iIRpguC5qW5n8E8eRmpwH2XVuKKYt7mCSdaGy8WMUIwpBZGhHxuSFVpa+xRMMA2vWPUfIQkHtI75mrW3z04MXVjegIejYB8UqyTtwMduTKgsztGuYfKZBCSTSSlYtnY1wX63ZRcK2ZV1/4Rm58eEwI+22/iEh2kcJCpubErtPhRxJaxaI0xu0ph07sU/vW6tApyAYYOt6130fOWDn51OkpPksflYSwz5RCwYvbA1fqWs8HPIqqyZhS1ILWYDcZPoqfmCvd6x59D9GvfUMGPMBLvq5+2js0CKImTW0NwUwfb+E1l5XXKXu3HLSGLs7IV2UClEdFmj4BiIgu53I91uPGr3TYwAgHy7ejl7ybQazk+5KnizmATdQalTk5uI/zIRKJR1nn/e8rIKhUhSk8t2PiiPaSpo7WkCkbbv8RdDDyJGzyJ9O6iKNnL/KtPdnwyyoB1s1wyU74HPswiRjxryBn3XTvgAH2eCoCeLi3K9u9PwnbObuhDwdBOpMK0ER03ZK7E0/FbRaWpI2kwWMwEZ9VqKoTiGeYtxDX56ObM0T5W99FbEH54OFmV4ecoL5DSZ3RDnAbyJobKTSvulErpk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(54906003)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEtTWXYxb2xOaEk3SE9mYUdOMExNcXV4TXlwbFl6bHdLZzhCYkFyUWdmYW1V?=
 =?utf-8?B?YlJlalQyT1hjbXo1Ym5xQVl3MU5wTEQzcEJ0QXRHeTJ5MDFFTm5BY0orbVI5?=
 =?utf-8?B?S0dlNDZyMW54R0lLc2JzRmFSK2xHMG91WmlKcDRFR2hWc2VFNGR6cHVpNmZ5?=
 =?utf-8?B?SC9UUWZHS3o5TmtRNHAxQnhUMjBkZGk5VG9PMS9QbGh6Yit0Y1Z1OVphbFlh?=
 =?utf-8?B?OXd0N1NmeVJNL0xIYmhzTmd1ZVJlUldVcW9pS3RyU2dmbjZBUkgybkExaUZN?=
 =?utf-8?B?RFZnZmdpTTh5VHVEaGNzbE4zTTlhcVZSZFlDTGFvdm9RUENJbUhINU5iYXZx?=
 =?utf-8?B?YW9kb0tEZmx6bGtiem9uSmsxT29XSk5mdXd6dHh5Q1JlaXZWMUg5UDhrQUdD?=
 =?utf-8?B?aWhiY2tidS9Dd25XckhiKzAvT2t1Q0tIbG1Gd09ZVWVtMWtnbFRTM0Fnai9X?=
 =?utf-8?B?WVBxMjFxUEE5UzE1REpqS2ZDL0IyaHZjSE9UTjN6L0hjQU1DRjlwa1ZWczBm?=
 =?utf-8?B?andiOFB4Q0NxMFp5YTFrdU80VkkzcEdNY2ZsOWdTQmUyZ2NrNHZScEhzaVlk?=
 =?utf-8?B?N0xYQmFXVkpRd09RbFI2NGtaM01VYmh6ZEI0T0lKRk5iWVhtaEJpVDZyRTlt?=
 =?utf-8?B?V3N4SllvRCtZSi9TYlRsRkdYTCthZzhBQVUzZXErUTFGY0JwOUZ4bHg2TE96?=
 =?utf-8?B?amFaZ0Zyc1dINXF0TkgxUm56eUlJRTJOeTZSVmVxMEhUa0txSXNPY3FsTlRI?=
 =?utf-8?B?ZXNvWFFub3Bnazh1d2dDOVlBL3BQcmFWQ05CeVFPSlI3OXRUQTJyZmNvYWxG?=
 =?utf-8?B?eUxoZ1FIbzc0NENYWnlFd0hES2UrWFlkcjNIV3lxSWwybG9mQzU3UWM4T1Zz?=
 =?utf-8?B?aXAyMFRMT3QwY1JuNEZoVEczaU9hYUNoN1FpN1hQWGpya3RaRkcxZTZMZWha?=
 =?utf-8?B?ektFR3hPbUZSTm5oZDRLTXBXSmZMVTlYRlpOVTI1SnpxNFFHRTRqSXpmZXBI?=
 =?utf-8?B?ejcreHh5cWNwZjloMEZRTUcrNGJvRDgzQktxOFkyM1F0YXJVUGR6U3BPeHB2?=
 =?utf-8?B?eXhSTzZKRG42RDE3WWtMOEdlV0kxTnMybC9UWmkxU2swSWRkMXY3RWhaUGE5?=
 =?utf-8?B?OUhiRUhjSFl4cVVodHNmYUxRbXREWU5NZTJobzdPQnhEZ2RMdENLYVVwM1V6?=
 =?utf-8?B?YmRFZHcvRVk0MnZUdFRQMWk0MkUvKytwQW9zSHFFblZ0UkxVQURFZkU3L1Ar?=
 =?utf-8?B?WS9Md1hMNUwzK1lsL2VzczBDWVI5dVd4M1dKaERnWVY3N3RmYld5NlBzQklw?=
 =?utf-8?B?Qit3QWp4Ujg0NkRRZUNGWjNPSUNkQVY2bjg2VzNIVXd0alcrTGZvK1c4U1ho?=
 =?utf-8?B?RGV3aU5SM3ErdStNOGZDOTZkem5UM1NFYU5aRmVIdEFOMGd4dDRVK3NMNWM4?=
 =?utf-8?B?Q2VGOU82cldrWHNPYUVBSHpWMDdoZ01CaWFaY3ZUS0w4dVBrRWJxMGdlb3hz?=
 =?utf-8?B?Zkh5RC96dUJiaHhLT2d5aVkxanBXQU9EbnV6L0Q1SDhnWDBMaVRaUTVDc2Mz?=
 =?utf-8?B?NkpDaWl0TExHeFRXOUsvWGpPcnhjV2wzWll1aDFmemVzQWoxVlhvMG82UHFC?=
 =?utf-8?B?ZndUSlg0U2xQeHpFcjBqRHNTa2h1V3RKK2ZabTlMelF3aUcrR3cxQ2wreHlu?=
 =?utf-8?B?SkpqVG5MK2o1Vkk5RkVTRlduZzJielNjMUltdTQ3QzA2RHF1NHJGNnlpQWdt?=
 =?utf-8?B?NXBFY0dtK25XNkY2eDU3QWI3WWpJTXVNd29EZktyODFCZXpVZUhzWWZVR3ht?=
 =?utf-8?B?VGhEd0FVU3RydkQrUUZVbGZtZ0Ezb0FzbUd2UUtkdVpyb2xJbzlmaDU3RHdM?=
 =?utf-8?B?OEFEaHQrLzQvUXJYNGU0ZWNERUhzc2FqVUdZM3I1MllHaytobnpJZ0RBam15?=
 =?utf-8?Q?xPsGqFpyxTU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79c669c-2508-47e7-6cd3-08d995827842
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:36:24.5182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.119;
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
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUuYyB8IDI3ICsrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQ0KDQpSZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5v
cmcuYnI+DQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURP
DQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9k
aXNjbGFpbWVyLmh0bWw+DQo=

