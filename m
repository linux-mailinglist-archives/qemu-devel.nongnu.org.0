Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC11326D68
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 15:33:47 +0100 (CET)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG0fC-0001rK-2L
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 09:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lG0e3-0001R5-SC
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 09:32:35 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lG0e1-0008FM-LJ
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 09:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614436353; x=1645972353;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=K3ZVVKXO1lCa+PFdcyVcNgC0Agnc6dXWQLbuiWTFRUo=;
 b=jn80usWl3FuUs+Uk9tNUzb2H6WlBOw38t7dEgKfCg688FfXXC4MecGO+
 F5xoJLrmv/AcxvQPTuYjtIypWdjTsx4pQ6Ptxy9G6ZjkLbP3PtBQrXmGz
 tZ3eO9BswsoTZqZu/+QTSfbJReUuUM7Zd9zNZyzvvssXvLf4Ibiikq1dK 4=;
Subject: RE: [PATCH v8 35/35] Add Dockerfile for hexagon
Thread-Topic: [PATCH v8 35/35] Add Dockerfile for hexagon
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Feb 2021 06:32:30 -0800
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 27 Feb 2021 06:32:30 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 06:32:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 27 Feb 2021 06:32:29 -0800
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN4PR0201MB3565.namprd02.prod.outlook.com (2603:10b6:803:4c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Sat, 27 Feb
 2021 14:32:07 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::f197:545d:3192:165e]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::f197:545d:3192:165e%6]) with mapi id 15.20.3890.024; Sat, 27 Feb 2021
 14:32:07 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "Taylor
 Simpson" <tsimpson@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Index: AQHW/d3P4L1sVRWRok6h4raRj1FHAapsKN+AgAAFUeA=
Date: Sat, 27 Feb 2021 14:32:07 +0000
Message-ID: <SN6PR02MB4205CEA9B3CC1915C2C27544B89C9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
 <66686d28-86ae-574f-b9af-66b154e85424@amsat.org>
In-Reply-To: <66686d28-86ae-574f-b9af-66b154e85424@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [104.54.226.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dcb7d05-6509-4fb7-65e8-08d8db2c75e0
x-ms-traffictypediagnostic: SN4PR0201MB3565:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN4PR0201MB3565468AED4656025C8DD894B89C9@SN4PR0201MB3565.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDnG5gJmi+h46MEkT0JQp1Ge59x1g2jNZLM09ef/cp5Koj70UyBwb7nMiEw5rRgCRLkfbPEdz07fYQUmN5GVdUjtvuGHcmcLaf76nRL+DlYlbA1J+my5b2sNX059SY8FQ6ssgtw3g//82rh7wg404GDf7p/RUfPHWrIbzQscPn9rDj64gvlI1esbwzRpe2yOYxc2ENoYCezuwpPzgjc4yzFhSB6FTlj3ctvDi/2QfPQ0anjy+UlQWXJxH2NkY1Lhe5e3EmT+KZwGI2id8Rg/UjjDPqB74wX1uYyJOH2g4u+wr1cO02uAS5KBSmC/4pWWyRMROOOujm/Mht6uJJ6Ohcvzm6shZbu53zZBmX/8sXI7MUDLEbBe49o3zKsKPqou4MSXCeLVpD0/DnVmMJm6pPfwq9Qi+/aS3N1wX1iwgh74EqGOHEkbngw+e2x43bwUEHc6qvkR61q24q1lNniIGjXBib9hx6BO1ZYh7vxxN9CRom+i6SYvZmgpzKNyI85sIMDB3pfG7yybTz30Faz73A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(2906002)(9686003)(66946007)(83380400001)(86362001)(76116006)(478600001)(66476007)(5660300002)(71200400001)(4326008)(52536014)(66556008)(55016002)(64756008)(66446008)(53546011)(6506007)(26005)(8676002)(33656002)(54906003)(110136005)(7696005)(186003)(8936002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WisyTWNGVkFlT1VobHVlOUZMSW5sVE9mdTFlZkIzWUxUMnhRU1dWdUlRaDhV?=
 =?utf-8?B?QW9VQXlPNHM4akViMUt4UmVXZVRKa1lqMjZHKzE3QjUwMmFURTFGQ2xSY2Jo?=
 =?utf-8?B?akdiSG03QVkwSGNFMUZybTlsdXpaN2hmampVK2plY2hrblFmY2FYZVJEd0U4?=
 =?utf-8?B?K0hYVUNiSjUvRFBHNHZoVkV0SmNsMHowTFlpcTZBQjBFUWdoSmkrZGdPOUFo?=
 =?utf-8?B?cWR1VkpxZEsrc3BOeVlQd2plbGFXZWszUUU4MGxhd3VIclBMSjcxV1FJQVhU?=
 =?utf-8?B?ZjQxMFFwcFZxTGpUMWVUNjdydiszUFNoY3hBbHF0a3Z0NHZyUjI3MjRmOUdL?=
 =?utf-8?B?NjRBU1RRRVYxTUdEcDdCRmJJWGFoZGFwd2FNZEJmY1RidURqVUNWdElVNk8v?=
 =?utf-8?B?VWloaitRbU43dVlOVTFkV01tT1lrYTYxMFFSK3BmNVZZcm9yTi92VEFzQWs1?=
 =?utf-8?B?SEczKzkyTk5QVkd6NzVmem85bi9ZWC9rVDcxblJNLzRuSlEyV2dCTEExcW9V?=
 =?utf-8?B?RWpLRi85V2Fkb1REdDY1MnJuMmZMejZkTzhkY3cyL3RJK0pMUUpsa0lSeUtK?=
 =?utf-8?B?NzBNM1UwbnQ5WnNtTk5odGtDb2Z5UGpRR2cwdjBoVHZsUVUzU28xQk54TWVj?=
 =?utf-8?B?dDhMWHBEN2JpdGVhWUl3a2VSMkJRN3pOSEtkeWhKVE5GL0x4VTAxNGQ2SEJY?=
 =?utf-8?B?NmE3bDk4Wk5LRFI2WHVQV0FMVTVPaHkxMTMyNHZHNElJYWdVZ1VVTFdSaXEv?=
 =?utf-8?B?Snc4VklpNG1rcHRBV3VBTzBRcmQzSEtUYVpZUG4zc0lBV1VKVGRJd2E0a1ly?=
 =?utf-8?B?RXFPSjBveXNJYjdFVkovaks0d3gxNm1ZNUtqMlhlMUsyZCt4bGJxZGtCZFZs?=
 =?utf-8?B?c0JQUWFVNUtJNkVsRUlIem4xYzlRRFpZWlgwRGZqcnh6bUUwL21iSmZUalV1?=
 =?utf-8?B?d3NiWk1FMXNDMWFEdzArY29ib0dhVEN2RllBLzhkWDA0ZDVkSHhaT05wL3p2?=
 =?utf-8?B?K1grZWxyWDhTNHA1b3dBVkFBL3RKMVdDcHpENnM3OTVqc29mNHcxdXV6elBq?=
 =?utf-8?B?ZlI0Uk8wTlU1WXFKM3owVm50ZmpCNXpaQnNrcm51aTZTTGhDdXN6VTNwNTJE?=
 =?utf-8?B?YWJkYnhqUWNKK3l1OHB3S0t3cWlGQnFYb3ZuM0twa3V6R1ptaVhmSVJVQ2li?=
 =?utf-8?B?VzVneVVKVzBRN0xFRjNLR3R6Z0tLcGcwc0prdW1qWWJYYi9CeVBIL2ZnTVdO?=
 =?utf-8?B?Q0Q3YTZsVFdEV1VreVROd1d3N3NMd2pIa3pVWXUwdUNtcmRFNm5NUURoejRX?=
 =?utf-8?B?elFqZUIwRXloZS9DTVc5b1FxV1ptdXE1c094ZjM5aWoyOGJROC9RT3R4MTd1?=
 =?utf-8?B?ejVpekFmZGpXSktvN1JwYTdGVjFhamF5YlliY1Q4MFgxbm8ySnE3dktYZlZW?=
 =?utf-8?B?UUlHV2NNSzN2R0VTenNVS040czRqZktYbVhleEdOVGcwS0dWYldzRUhHcjJx?=
 =?utf-8?B?NitkWHlhbU1MR0F2T0Y5YzhNWSs3TTBHMXJkWC9iMGx4WHZScldQWlNEREhj?=
 =?utf-8?B?aThnbHVZRmxsaFZ3aVk0YzR5VUMrSmN2QW91U0lRWUZBazBFOGEzZTdPWml2?=
 =?utf-8?B?WHJNTnR3cHRncFk0blBmcDdyTkRmekc3eHJ6NlBRWkxnOVNXQk10ekdNWHhI?=
 =?utf-8?B?aVB3MkVralJncERvYStrK2NVVzRoZFdkZXZ5K0JRaUJFRnZKSDNQZFV5dTRt?=
 =?utf-8?Q?DFChcls6M3tTj4CLSfzanA7U4kqnB2Puy9Fpolc?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U25KDNPOuUlym5EIgaXNGpSUyNWuxH07/FBD97uYEMTZmTWSiACC53qYX27RBPWTITL15zoHCaOU1qC7AFcS+w3iTgxVxjhIehp9JObm/7yLkbBIFtHfcvra1U7uiWfJgPb54krbtvWuCN4CZadEm+KjdPvizsyFLYdp4ZkLVnArU8dRS0R13YWzOD9xFb/uS1/1ShXRg0q+4NLxcOncAjew/pCrAGffVwDc16qkTNsMg7j47QFAS3vnHehD/ePLquDlrX4w6SLdVaAGcF2ZLstxUvpDf5U+0vEC91ccUt+1/4pKH5yUqyShG05nvTsWsNha06KVS5pevqipsXvokA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXhs40vOcrmzFRzdXronTeGDGqd5ssLbv163sbuhZCw=;
 b=IJ6yCQYlWMpDUBhFcdD/nPHz4uhaJ0H1jPCrp0LuyVg3ccKIaxr/zrHA2fwBv+LnI4aW+aoDfOQ3kZQxONeBtuekcc/MNYtCprV0ugwKH1zPMUUSMrwgnv+bAlhwwRL8F4Jd8DSQzKF1pGnLbFcDtIlSr4bMnd+lGvouj6TGtWS+hkEt+GMJUBE8AMDXUU7lPxl4W6GFB6vciqJQNGpNFW5v5WK+oLMgRnI10aZaM1XDnvk8nV52CiWxGHCtclHqdEs6xDJfDU8/NTP/zVD+XK+q29H/Q2Dsy1ZN/4zhMtL3K17Dt0FMVq/isfspl/i2RQHJOHu2hhgNZTnRIEP8eA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN6PR02MB4205.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 0dcb7d05-6509-4fb7-65e8-08d8db2c75e0
x-ms-exchange-crosstenant-originalarrivaltime: 27 Feb 2021 14:32:07.4210 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: tUc//0LulZH53VmJVIn8Q8uxbk12CqC9UKJrRS64JU1ewe7jutZoZ1v2zu5/aOFdy54ZLfcqReGrrUjsAgr7dg==
x-ms-exchange-transport-crosstenantheadersstamped: SN4PR0201MB3565
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=bcain@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>, Fam Zheng <fam@euphon.net>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbGlwcGUubWF0aGlldS5kYXVkZUBnbWFpbC5jb20+IE9uDQo+IEJlaGFsZiBPZiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0KPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMjcsIDIw
MjEgODoxMCBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsg
cWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
OyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOw0KPiBsYXVyZW50QHZpdmllci5ldTsgYWxlQHJldi5u
ZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+OyBGYW0gWmhlbmcNCj4gPGZhbUBldXBo
b24ubmV0Pg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY4IDM1LzM1XSBBZGQgRG9ja2Vy
ZmlsZSBmb3IgaGV4YWdvbg0KPg0KPiBPbiAyLzgvMjEgNjo0NiBBTSwgVGF5bG9yIFNpbXBzb24g
d3JvdGU6DQo+ID4gRnJvbTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+
DQo+ID4gVGVzdGVkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+
ID4gLS0tDQo+ID4gIC4uLi9kZWJpYW4taGV4YWdvbi1jcm9zcy1idWlsZC1sb2NhbC5kb2NrZXIg
ICAgICAgIHwgIDE4ICsrKw0KPiA+ICAuLi4vZGViaWFuLWhleGFnb24tY3Jvc3MuYnVpbGQtdG9v
bGNoYWluLnNoICAgICAgICB8IDE0MQ0KPiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgLi4u
L2RvY2tlci9kb2NrZXJmaWxlcy9kZWJpYW4taGV4YWdvbi1jcm9zcy5kb2NrZXIgfCAgIDEgKw0K
PiA+ICB0ZXN0cy90Y2cvY29uZmlndXJlLnNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNCArDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhh
Z29uLWNyb3NzLWJ1aWxkLWxvY2FsLmRvY2tlcg0KPiA+ICBjcmVhdGUgbW9kZSAxMDA3NTUNCj4g
PiB0ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLWhleGFnb24tY3Jvc3MuYnVpbGQtdG9v
bGNoYWluLnNoDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IHRlc3RzL2RvY2tlci9kb2Nr
ZXJmaWxlcy9kZWJpYW4taGV4YWdvbi1jcm9zcy5kb2NrZXINCj4gLi4uDQo+DQo+ID4gK2J1aWxk
X2xsdm1fY2xhbmcoKSB7DQo+ID4gKyAgZmV0Y2ggIiRCQVNFL2xsdm0tcHJvamVjdCIgIiRMTFZN
X1VSTCINCj4gPiArICBjZHAgIiRCQVNFL2J1aWxkLWxsdm0iDQo+ID4gKw0KPiA+ICsgIGNtYWtl
IC1HIE5pbmphIFwNCj4gPiArICAgIC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIFwNCj4gPiAr
ICAgIC1EQ01BS0VfSU5TVEFMTF9QUkVGSVg9JHtUT09MQ0hBSU5fSU5TVEFMTH0gXA0KPiA+ICsg
ICAgLURMTFZNX0VOQUJMRV9MTEQ9T04gXA0KPiA+ICsgICAgLURMTFZNX1RBUkdFVFNfVE9fQlVJ
TEQ9Ilg4NjtIZXhhZ29uIiBcDQo+DQo+IElzIHRoZSBYODYgdGFyZ2V0IHJlYWxseSByZXF1aXJl
ZD8NCg0KTm8sIGl0IGlzbid0LiAgV2hlbiBJIHdhcyBkZXZlbG9waW5nIHRoaXMgcmVjaXBlIGl0
IHdhcyB1c2VmdWwgdG8gaGF2ZSBhcyBhbm90aGVyIGJhY2tlbmQgdG8gY29tcGFyZSBhZ2FpbnN0
LiAgQWxzbyBtYW55IG9mIHRoZSB0ZXN0cyBvZiB0YXJnZXQtaW5kZXBlbmRlbnQgZnVuY3Rpb25h
bGl0eSByZXF1aXJlIHRoZSB4ODYgYmFja2VuZCwgc28gaXQgd2FzIHVzZWZ1bCBkdXJpbmcgZXhw
ZXJpbWVudGF0aW9uIHRvIGNoZWNrIGZvciByZWdyZXNzaW9ucy4NCg0KPiA+ICsgICAgLURMTFZN
X0VOQUJMRV9QUk9KRUNUUz0iY2xhbmc7bGxkIiBcDQo+ID4gKyAgICAiJEJBU0UvbGx2bS1wcm9q
ZWN0L2xsdm0iDQo+ID4gKyAgbmluamEgYWxsIGluc3RhbGwNCj4gPiArICBjZCAke1RPT0xDSEFJ
Tl9CSU59DQo+ID4gKyAgbG4gLXNmIGNsYW5nIGhleGFnb24tdW5rbm93bi1saW51eC1tdXNsLWNs
YW5nICBsbiAtc2YgY2xhbmcrKw0KPiA+ICsgaGV4YWdvbi11bmtub3duLWxpbnV4LW11c2wtY2xh
bmcrKw0KPiA+ICsgIGxuIC1zZiBsbHZtLWFyIGhleGFnb24tdW5rbm93bi1saW51eC1tdXNsLWFy
ICBsbiAtc2YgbGx2bS1vYmpkdW1wDQo+ID4gKyBoZXhhZ29uLXVua25vd24tbGludXgtbXVzbC1v
YmpkdW1wDQo+ID4gKyAgbG4gLXNmIGxsdm0tb2JqY29weSBoZXhhZ29uLXVua25vd24tbGludXgt
bXVzbC1vYmpjb3B5DQo+ID4gKyAgbG4gLXNmIGxsdm0tcmVhZGVsZiBoZXhhZ29uLXVua25vd24t
bGludXgtbXVzbC1yZWFkZWxmDQo+ID4gKyAgbG4gLXNmIGxsdm0tcmFubGliIGhleGFnb24tdW5r
bm93bi1saW51eC1tdXNsLXJhbmxpYg0KPiA+ICsNCj4gPiArICAjIHdvcmthcm91bmQgZm9yIG5v
dzoNCj4gPiArICBjYXQgPDxFT0YgPiBoZXhhZ29uLXVua25vd24tbGludXgtbXVzbC5jZmcNCj4g
PiArLUcwIC0tc3lzcm9vdD0ke0hFWF9TWVNST09UfQ0KPiA+ICtFT0YNCj4gPiArfQ0K

