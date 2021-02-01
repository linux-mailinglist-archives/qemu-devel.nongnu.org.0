Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3CA30A061
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 03:42:51 +0100 (CET)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6PAw-0008Bo-1M
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 21:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@huayun.com>)
 id 1l6P9G-0007eN-O0; Sun, 31 Jan 2021 21:41:06 -0500
Received: from mail-shaon0138.outbound.protection.partner.outlook.cn
 ([42.159.164.138]:33669
 helo=CN01-SHA-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@huayun.com>)
 id 1l6P9A-0005qh-BM; Sun, 31 Jan 2021 21:41:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiTy8H1cakSNB9Hhz2Mcn2f/0iW78LpB3M4B7CnnBCqo+5QRJcE+FuM3bGckkfQgiEBMfU/Cel9keMx5irTc5KCYRuACsvo40QmUng/ahBd3IxxS2p73jSreEnXqLLEIMNK9w0puimOiLG5h+Re/joexFHz8mvxJPHweN6aPoqWiSscIs3Rb9DwkGdRTESf5Cm5mSwjD1GsROhxRV++oN3K/8au74gEVycJoFO+QsaK24qgRTSP4W3Ly3tAysKJRKQkWR5x7bCAsJkm344AcjC/uXmRpLu41q4u37SAf1/09SFmM5hF761XcD7notgjUdq2HkaRXpXJlmjnv1TCIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cp/rcoxIoaRjD9YHsOPZoWCU3DJ6gIAJQisG2D0QjA=;
 b=X97C2BQ+npZIHJkgmfbhdAWCDRSKF1F5vuRoU0moCUHOdTZpTtKXT/L5HJlebPfgxsWgosUS50lnxd2rSNuDKuCW2EZxahShRzIv1EiVjP6ySYlAgcHtoNyxMJu19wISvyYAajfF9EtjvuYf0k8tTX/Bd9ZSBBe9ZU5vM5qLiigpF5Js4zJBCGx+By5CWEABbpHO4WQhJnvR5NDowx27acs4QG7JtaAiIULA1nmQGNfWoLM4QflV9tygOVEB4VBLrTu8rj2+9dauFX0aS/vKuWd0BgVd+YgmuOdJEf6WkaHZqvt+eKixekRTLU/5u9AmJ5VYEJ+cBUBc7QoZ5Hr/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=huayun.com; dmarc=pass action=none header.from=huayun.com;
 dkim=pass header.d=huayun.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hycloud.partner.onmschina.cn; s=selector1-hycloud-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cp/rcoxIoaRjD9YHsOPZoWCU3DJ6gIAJQisG2D0QjA=;
 b=L3bHRBle6+pl/TVACqr0jvsU/mwnvZL4fb+28Aff+oD5Si1Yx+XHZ9Cd8AKt6jWOuKgkNTm0oVQaeoSJ5PlZWAqgJykTWZWUrFfWlynyvgmAo8spaT8ITZOH+98MyDKiTc/ea5tBa690W/EiMdsmuV5MY4IREV0jRf+g/13c3PM=
Received: from BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn (10.43.36.76) by
 BJXPR01MB0598.CHNPR01.prod.partner.outlook.cn (10.43.32.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Mon, 1 Feb 2021 02:40:45 +0000
Received: from BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn ([10.43.36.76])
 by BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn ([10.43.36.76]) with mapi id
 15.20.3805.026; Mon, 1 Feb 2021 02:40:45 +0000
From: =?gb2312?B?s/C089Px?= <qiudayu@huayun.com>
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
Thread-Topic: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
Thread-Index: AQHW9RU6HzbrvThE906I7emhJunSaKo8fsbggAYdnKA=
Date: Mon, 1 Feb 2021 02:40:45 +0000
Message-ID: <BJXPR01MB07765566D7F88051EFF64222CFB69@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
References: <20210126032545.13349-1-08005325@163.com>
 <20210128013053.23266-1-08005325@163.com>
 <BJXPR01MB077611B90E717085D41CA0B5CFBA0@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <BJXPR01MB077611B90E717085D41CA0B5CFBA0@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=huayun.com;
x-originating-ip: [218.90.171.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a556e23-321e-431b-dd26-08d8c65ac6c8
x-ms-traffictypediagnostic: BJXPR01MB0598:
x-microsoft-antispam-prvs: <BJXPR01MB059838FD6C3089E5F21BD52ECFB69@BJXPR01MB0598.CHNPR01.prod.partner.outlook.cn>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RHsCBkO6GY7KLQLk1Dtop7N15ZKLyaQLPgLgywNvRFjOrmqW6O+J/i9eVnIo8Sj+4TwowQbTqCbpCTgeiZTMYrju5FHD6dFsKrfxCsP1ZVLyJNMMiq8iEYACV9E4HQyyq0Yrf7Cpzr7Nb9aQVWzgnTGcURHSpZoPau7CG7KZuH/7pCXWRiCEs+zuWWHAoz+Qqv6mooLI16uLV/55YQi1sg5/guqc7F8j44PO/jI9b0VxTODDzkntOIbUWsGbZJOlPioCRhh7VsjnCPiRmuQDOc5zgV4AZuGt2xiR6f/9PaTFKxhpXChkTBw8gjW9sicTIR/lfTB768ib7UnrM/NkvKOiM+Alps9IgLTiuc/QVL0cCKTNnnzTZtSn5/0VjC8IgfXAbftFElFFrFdylrpgQjRLXktD91CKrCY3WIjoBiNUmfOVCYAC9M7Jvj/tBKOibSRDE9NSFEHKWnPSRo3MuOCO71P3+Y57b23vNFI4Sgm4yW3RiMv2fxAhRWuB15ow30dx/IjQ06wMGh7QzV19AA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(346002)(366004)(376002)(329002)(328002)(5660300002)(2906002)(53546011)(59450400001)(186003)(26005)(8936002)(7696005)(8676002)(55016002)(83380400001)(9686003)(508600001)(110136005)(54906003)(66476007)(66556008)(71200400001)(66946007)(76116006)(64756008)(66446008)(85182001)(63696004)(33656002)(4326008)(95416001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?aUhteGxGV2xMVkFvSUtXQzJIcENMaTF3V080RTNtZ2szbE04cXZ5amczU0p4?=
 =?gb2312?B?VmU4aFBzbWVLTXljQk5aS0M2cGtWTmw5TWYycXV4VWVRRjdGWHkxRE4xRWQ4?=
 =?gb2312?B?TUNWbmlZREZaVFNEcnE2ejhOdVBCaWVtb1phWjRtN2ZVVkV0ZXljNDRwZEQw?=
 =?gb2312?B?N0lBQW1lb1lwWGZ6eHVJTlpoa25OejBmekJvNktRdFJFMlVmV3ZuMlY3bDBr?=
 =?gb2312?B?TkxmRUpIMVFBQ2cvUElaWk1jc0t5Tm5DSEFRWnVwdU40MlM5blFldkE0NGps?=
 =?gb2312?B?S29yUzhyUjNWOFRwMGdEenVWS3ZLRkd4eU90ZklqcVl4VXpsZnJESHVLb2ZS?=
 =?gb2312?B?eHp5RmFJWS9UNWdWLzEyckJZVlF5WTBrektYYS90VlBIZTkwTVAvZ2hVL0ZD?=
 =?gb2312?B?Rk9rZ3YyYjRjMFFxODZVK3VJY2szUXJybjZrQjNxVVpGYUVmMysyWG12SCsr?=
 =?gb2312?B?eEc1UlphZUJnN0NMM29kUWthbVRqeURQUWluMXBzZFA5bm9DaUhTMU1lcXQv?=
 =?gb2312?B?cWZSa28vYjQxZGVkYkxkck4xN3pYLzJtNDkxcmdVbW1tZUE1VWU1dk9oL1Fr?=
 =?gb2312?B?MnhsSVpuYkdkS2I3MGsvTjdWbXFyLy9Da0x6NDJHelRqQkI1SkZURUVUaWc5?=
 =?gb2312?B?N093T2RtaW1IWHNoVjl3a1djMWFXZGVZb080dGtSNUlsT1ZxNWpKclZwTGZH?=
 =?gb2312?B?TVkwd05EMHBtSlRPaFpqdTJBQXEwNlV6dmtiRlNIeG0xNW84MWt4aTJaZ1gz?=
 =?gb2312?B?NzRhMUFvTHZZSEJ3a2dQT2UzWFh4UFcvOFdCRGt6Q1ZaeEIyZFE5ZWlIQ0Q1?=
 =?gb2312?B?YnpRZkhGcEdPVVZnYkt6NlEvdS9TVWgrMU9ROVpYRVZ4QjFTWnEwbjBPa2My?=
 =?gb2312?B?WG9FRVZKdVFhU3BxclNWenlHN1JNUmF3MXZXbEE5cEl0aG1VT0NnQ3ZZYkpx?=
 =?gb2312?B?YVZ2TW9vT0h2V1gwbHV4UEZWL01iUGtQUnJwVWxSdm5qR0Y1R1ptYm1zOHF4?=
 =?gb2312?B?V3hwWXV0bjRkQk1pdEpzbDd6SlZVTEF6bjRuTmM1djFtUHJ2RDQvS1hMdTFG?=
 =?gb2312?B?ZnB2UVhDMDVXREFxOXpRdEtUanlrR25nUjBDeExzTWlKYzRBdFhvK0FNdlRG?=
 =?gb2312?B?VmtNd2RleHNwdHZJQWRzUHpzcjQxQXpMci9MbkVkU1lJbW0xNVMwdEVZNm44?=
 =?gb2312?B?dWFmQUdJa1FvaDFYaFpDZXpPNXgyS0tlbUlZMGRwbkNFR0x3aWNZejI5ekZE?=
 =?gb2312?B?WXFXWlZqd0NzaVMvWFhvZzF0SUs0THdhaTZxRFRmRlhHSmlVZXljZGJOODd2?=
 =?gb2312?Q?8ZOvsSDNPu+hg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: huayun.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a556e23-321e-431b-dd26-08d8c65ac6c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 02:40:45.6044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a674a363-98d5-4f2d-95da-d54302c8edaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9BcUuCmImawrrK4v0g0OKC3T5w4Cd7JUOLb6xnvibFpHIr8Ve5YZWXfZL/zi86M0xo46NPuljY6OdGgpipMbXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0598
Received-SPF: pass client-ip=42.159.164.138; envelope-from=qiudayu@huayun.com;
 helo=CN01-SHA-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MIME_CHARSET_FARAWAY=2.45,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "08005325@163.com" <08005325@163.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QW55IGNvbW1lbnRzPw0KDQpJdCdzIHJlYWxseSBhIGJ1ZyBhbmQgY2FuIGNhdXNlIHRoZSBxZW11
IHRvIHNlZ21lbnRmYXVsdC4NCg0KVGhhbmtzLA0KTWljaGFlbA0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogs/C089PxIA0KU2VudDogMjAyMcTqMdTCMjjI1SAxMzoxNg0KVG86
IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQpDYzoga3dvbGZA
cmVkaGF0LmNvbTsgbXJlaXR6QHJlZGhhdC5jb207IGpzbm93QHJlZGhhdC5jb207IDA4MDA1MzI1
QDE2My5jb20NClN1YmplY3Q6IFJFOiBbUEFUQ0ggdjRdIGJsb2Nram9iOiBGaXggY3Jhc2ggd2l0
aCBJT3RocmVhZCB3aGVuIGJsb2NrIGNvbW1pdCBhZnRlciBzbmFwc2hvdA0KDQpBbnkgY29tbWVu
dHM/DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiAwODAwNTMyNUAxNjMuY29t
IDwwODAwNTMyNUAxNjMuY29tPiANClNlbnQ6IDIwMjHE6jHUwjI4yNUgOTozMQ0KVG86IGt3b2xm
QHJlZGhhdC5jb207IG1yZWl0ekByZWRoYXQuY29tOyBqc25vd0ByZWRoYXQuY29tDQpDYzogcWVt
dS1ibG9ja0Bub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7ILPwtPPT8SA8cWl1ZGF5
dUBodWF5dW4uY29tPg0KU3ViamVjdDogW1BBVENIIHY0XSBibG9ja2pvYjogRml4IGNyYXNoIHdp
dGggSU90aHJlYWQgd2hlbiBibG9jayBjb21taXQgYWZ0ZXIgc25hcHNob3QNCg0KRnJvbTogTWlj
aGFlbCBRaXUgPHFpdWRheXVAaHVheXVuLmNvbT4NCg0KdjQ6IHJlYmFzZSB0byBsYXRlc3QgY29k
ZQ0KDQp2MzogcmVmb3JtYXQgdGhlIGNvbW1pdCBsb2csIHJlbW92ZSBkdXBsaWNhdGUgY29udGVu
dA0KDQp2MjogbW9kaWZ5IHRoZSBjb3JlZHVtcCBiYWNrdHJhY2Ugd2l0aGluIGNvbW1pdCBsb2cg
d2l0aCB0aGUgbmV3ZXN0DQogICAgcWVtdSB3aXRoIG1hc3RlciBicmFuY2gNCg0KQ3VycmVudGx5
LCBpZiBndWVzdCBoYXMgd29ya2xvYWRzLCBJTyB0aHJlYWQgd2lsbCBhY3F1aXJlIGFpb19jb250
ZXh0IGxvY2sgYmVmb3JlIGRvIGlvX3N1Ym1pdCwgaXQgbGVhZHMgdG8gc2VnbWVudGZhdWx0IHdo
ZW4gZG8gYmxvY2sgY29tbWl0IGFmdGVyIHNuYXBzaG90LiBKdXN0IGxpa2UgYmVsb3c6DQoNClBy
b2dyYW0gcmVjZWl2ZWQgc2lnbmFsIFNJR1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4NCltTd2l0
Y2hpbmcgdG8gVGhyZWFkIDB4N2Y3YzdkOTFmNzAwIChMV1AgOTk5MDcpXSAweDAwMDA1NTc2ZDBm
NjVhYWIgaW4gYmRydl9taXJyb3JfdG9wX3B3cml0ZXYgYXQgLi4vYmxvY2svbWlycm9yLmM6MTQz
Nw0KMTQzNyAgICAuLi9ibG9jay9taXJyb3IuYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeS4N
CihnZGIpIHAgcy0+am9iDQokMTcgPSAoTWlycm9yQmxvY2tKb2IgKikgMHgwDQooZ2RiKSBwIHMt
PnN0b3ANCiQxOCA9IGZhbHNlDQoNCihnZGIpIGJ0DQoNClN3aXRjaCB0byBxZW11IG1haW4gdGhy
ZWFkOg0KL2xpYi8uLi9saWI2NC9saWJwdGhyZWFkLnNvLjANCi9saWIvLi4vbGliNjQvbGlicHRo
cmVhZC5zby4wDQouLi91dGlsL3FlbXUtdGhyZWFkLXBvc2l4LmM6NzkNCnFhcGkvcWFwaS1jb21t
YW5kcy1ibG9jay1jb3JlLmM6MzQ2DQouLi9xYXBpL3FtcC1kaXNwYXRjaC5jOjExMA0KL2xpYi8u
Li9saWI2NC9saWJnbGliLTIuMC5zby4wDQoNCkluIElPIHRocmVhZCB3aGVuIGRvIGJkcnZfbWly
cm9yX3RvcF9wd3JpdGV2LCB0aGUgam9iIGlzIE5VTEwsIGFuZCBzdG9wIGZpZWxkIGlzIGZhbHNl
LCB0aGlzIG1lYW5zIHRoZSBNaXJyb3JCRFNPcGFxdWUgInMiIG9iamVjdCBoYXMgbm90IGJlZW4g
aW5pdGlhbGl6ZWQgeWV0LCBhbmQgdGhpcyBvYmplY3QgaXMgaW5pdGlhbGl6ZWQgYnkgYmxvY2tf
am9iX2NyZWF0ZSgpLCBidXQgdGhlIGluaXRpYWxpemUgcHJvY2VzcyBpcyBzdHVjayBpbiBhY3F1
aXJpbmcgdGhlIGxvY2suDQoNClRoZSByb290Y2F1c2UgaXMgdGhhdCBxZW11IGRvIHJlbGVhc2Uv
YWNxdWlyZSB3aGVuIGhvbGQgdGhlIGxvY2ssIGF0IHRoZSBzYW1lIHRpbWUsIElPIHRocmVhZCBn
ZXQgdGhlIGxvY2sgYWZ0ZXIgcmVsZWFzZSBzdGFnZSwgYW5kIHRoZSBjcmFzaCBvY2N1cmVkLg0K
DQpBY3R1YWxseSwgaW4gdGhpcyBzaXR1YXRpb24sIGpvYi0+am9iLmFpb19jb250ZXh0IHdpbGwg
bm90IGVxdWFsIHRvIHFlbXVfZ2V0X2Fpb19jb250ZXh0KCksIGFuZCB3aWxsIGJlIHRoZSBzYW1l
IGFzIGJzLT5haW9fY29udGV4dCwgdGh1cywgbm8gbmVlZCB0byByZWxlYXNlIHRoZSBsb2NrLCBi
ZWNhc3VlIGJkcnZfcm9vdF9hdHRhY2hfY2hpbGQoKSB3aWxsIG5vdCBjaGFuZ2UgdGhlIGNvbnRl
eHQuDQoNClRoaXMgcGF0Y2ggZml4IHRoaXMgaXNzdWUuDQoNClNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgUWl1IDxxaXVkYXl1QGh1YXl1bi5jb20+DQotLS0NCiBibG9ja2pvYi5jIHwgNiArKysrLS0N
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvYmxvY2tqb2IuYyBiL2Jsb2Nram9iLmMNCmluZGV4IDk4YWM4YWY5ODIuLjUxYTA5
ZjNiNjAgMTAwNjQ0DQotLS0gYS9ibG9ja2pvYi5jDQorKysgYi9ibG9ja2pvYi5jDQpAQCAtMjE0
LDEzICsyMTQsMTUgQEAgaW50IGJsb2NrX2pvYl9hZGRfYmRydihCbG9ja0pvYiAqam9iLCBjb25z
dCBjaGFyICpuYW1lLCBCbG9ja0RyaXZlclN0YXRlICpicywNCiAgICAgQmRydkNoaWxkICpjOw0K
IA0KICAgICBiZHJ2X3JlZihicyk7DQotICAgIGlmIChqb2ItPmpvYi5haW9fY29udGV4dCAhPSBx
ZW11X2dldF9haW9fY29udGV4dCgpKSB7DQorICAgIGlmIChiZHJ2X2dldF9haW9fY29udGV4dChi
cykgIT0gam9iLT5qb2IuYWlvX2NvbnRleHQgJiYNCisgICAgICAgIGpvYi0+am9iLmFpb19jb250
ZXh0ICE9IHFlbXVfZ2V0X2Fpb19jb250ZXh0KCkpIHsNCiAgICAgICAgIGFpb19jb250ZXh0X3Jl
bGVhc2Uoam9iLT5qb2IuYWlvX2NvbnRleHQpOw0KICAgICB9DQogICAgIGMgPSBiZHJ2X3Jvb3Rf
YXR0YWNoX2NoaWxkKGJzLCBuYW1lLCAmY2hpbGRfam9iLCAwLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBqb2ItPmpvYi5haW9fY29udGV4dCwgcGVybSwgc2hhcmVkX3Blcm0sIGpv
YiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJycCk7DQotICAgIGlmIChqb2It
PmpvYi5haW9fY29udGV4dCAhPSBxZW11X2dldF9haW9fY29udGV4dCgpKSB7DQorICAgIGlmIChi
ZHJ2X2dldF9haW9fY29udGV4dChicykgIT0gam9iLT5qb2IuYWlvX2NvbnRleHQgJiYNCisgICAg
ICAgIGpvYi0+am9iLmFpb19jb250ZXh0ICE9IHFlbXVfZ2V0X2Fpb19jb250ZXh0KCkpIHsNCiAg
ICAgICAgIGFpb19jb250ZXh0X2FjcXVpcmUoam9iLT5qb2IuYWlvX2NvbnRleHQpOw0KICAgICB9
DQogICAgIGlmIChjID09IE5VTEwpIHsNCi0tDQoyLjIyLjANCg0KDQo=

