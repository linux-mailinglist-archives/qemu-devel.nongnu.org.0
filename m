Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4B43D31F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:47:20 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfppP-0008Dk-Hv
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfplO-0005Nu-Tx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:43:10 -0400
Received: from mail-bn1nam07on2118.outbound.protection.outlook.com
 ([40.107.212.118]:38167 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfplN-0000N0-5u
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:43:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwIdV7GqOTnLXve2JLWmpNkGCbKfvQBaarUc6eGmCrq2GLmsaJ32A82HYa//Sc7SZy/l4K2kTFotT5EesFW+izIwCK0/9lWY54cgiCVxuo7yaAAyJho13iw1Jr113UJRUNs5xeNfaUhrC1ZH1elXDmA4w6drEbqPg6BnkcFx3TXCYywmPABhSulzLWRSjmjiMzRAJzLokt+BgOTdA6TXr4QI3kb3JzpPhjouM8Zkw8rIxkfT2VyaUiONi49FCEEAg2FE5+q5/LxeIsLoWi2zqIlGWe2r6QUCbMp80FVvZtovj6wi9u6Igb9Wp4Kr2tS8+hWuqQq0zvlNJOOTQv4rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8VRmDQClGpafgsF4liv0J9mIpbm+dmTMsp3RYACG/Q=;
 b=dqWQ1PB88gU+CDqHJMFBhlD13D1UCCRNEgr4f+ZRb4oIhEMZo1WlzjkkTJ0uGFinvpoFfQLtHQKo8j/RKBjK9+GIvKH+O/shSoycF4b7RBqtuXyA3SweVp0eXaiCHYTB+cA43M1+TotdxcWGrz81FyzaNb4MNjSZPpTuN0dKuE4sdP9o0QvoUxkDw4eKNJPDTeL2uYOFItvOMEZeMPZnUQT7+ThU6PWlvOq+TxP6CWHuMXSle0phWHwAuLVRtcAmWnpwwAbScaocSffWqAdPhgpZdlNofVNh8uByWO8Yu0xjPikfhS3aTjyt0HRknm+9ePbT1bz0w40FRn8eY2w+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8VRmDQClGpafgsF4liv0J9mIpbm+dmTMsp3RYACG/Q=;
 b=0tIK05sZ+RClfbUaSggbT0AuLhTDwZHVe5i4evElLy2qFACZSmur3kJd2enYNWajrEf1Uy2eqdfbww3nbTH9GCgj9mMVj+f45w463xCnlxntosmTbELWl6muEp+tMTohJ6nTFBqDSa6B0JSmOcU+oJ2xAZdh+JCD7SsyL7jRakrhxHFAJZbClETPqSG7CKDqVJwDhoFAh1pc6h0I6APEHeA6GRIEt4Pc/I+WW/ULbBkG4kkDCcywew4+f6XgmkwAXZ6SmJrFz7AfxrrT3QJ7ujzB5iUUX0vBZHlM4hUY/xAG55IWfHYKnlprax9lM9oulrxLaCisu5Zs4udrMvFNFg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5538.lamprd80.prod.outlook.com (2603:10d6:102:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:43:06 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:43:06 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 48/51] tcg/optimize: Propagate sign info for logical
 operations
Thread-Topic: [PATCH v4 48/51] tcg/optimize: Propagate sign info for logical
 operations
Thread-Index: AQHXyr8ZguoHcVwnbEaIuuM++l6CdavnUO7w
Date: Wed, 27 Oct 2021 20:43:06 +0000
Message-ID: <CPXPR80MB522458E6249C5B4C21D54DDCDA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-49-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-49-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 180d0535-7bfc-45aa-bae1-08d9998a6136
x-ms-traffictypediagnostic: CP2PR80MB5538:
x-microsoft-antispam-prvs: <CP2PR80MB5538F2879E9CDFC1C557D64ADA859@CP2PR80MB5538.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2pn4Xh/oliuMdsW8zc9fN6NzDoyf8jCCJ5vGLjbmDuWsVWMzFxbNefphRU4kGe0WTUybr3oFpzPOqfjYPLO8sfU+hMDy5CbjwXmHmJamnBJ1Vb/U3KAhpxU0u7quxHvpuJ67bfVDWQ84pN0vxFU7RFzdMqHKgJEzxvGRr0rZ7cuwVgI2Z5X9liwMVtVzlQsF6kFfHktHbIpGepBTuYhNpwQtV/h6Kxnw1ukMUywhZCxtF9pVBxHunjP5bang5iKLWJRgGEtopCZzosr5vE9WDl+oxa+7/N2mrXfq//RtKbbXHVSkMNkKVCvzuGVAq2eMUtrGNE3jPN++EuWeHJJ3Wtr4Ve8IvtBSOrXGvD75nv9KhFpsgftGEJC3eJOmVvMcisb8H2GyfJSsmbQf0dCaKW3hD5caPBKpBtUqTp/TCcPyToGPdpyTTm6IQY1Nv/BU0GjpaxCpEYlQlGEh5SVhxtTnhChFSEF5vHy4cSGyWHO7zRDv4dnECNeDKtAVt7eTLz04KyEs/PAhR4+Q3SBuCCQmLnSMPdu4nBwKTzQ4n2Ww85VH5PARTepk/4WP5EIU8vuR9Ow3uPSvUdUKUoBF88Kn+i7ypOgQZXifC4sc+3hF7/3o2B5YhEx97f6yFxnHN6fw3LtNW6ejTV9GtV9+ou14P7/CdguUuOi2pIZK0rBoWlcuCc+2Yy5l0oQGdgR6aGpBQ1951askA8B7opd3vvietiXP1KeXODx016hnCDP20pqep4sZPtDCNbSc6Hq5Z94XlYdZZ3NxT2ye0hDxq0vZM85GSjCrTQGHH1L4PAU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(7696005)(6506007)(8676002)(54906003)(9686003)(5660300002)(8936002)(316002)(26005)(110136005)(4744005)(71200400001)(186003)(4326008)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(508600001)(38070700005)(38100700002)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym9PZ3VFbzhPeXRaUDA3b2hBaHQzcnk0MG1NRHlpVnYvTXJmZEZFZWVJOUlt?=
 =?utf-8?B?WUJPeEU3Rk9iM3NwcUdPR3czQmhiWm1kOWQzNXlUUzNXdDBRbXJYeXpOL3d4?=
 =?utf-8?B?L0twdzBYNXFUSmdBTXVzQ3BVeE5XaFNyMVRsOU10emo0UU5xekcyOUhJdy9t?=
 =?utf-8?B?TnVRL1paYU1oNlFQTXJoendNNjBlWnJGcWdUUm9PMmpxWWVPbi9pTmV1Vnd2?=
 =?utf-8?B?bGZLZ0RmTnhSWSsxUGNZS0h4Ykg0c0h4UGE1MERtMjRjWGs3QTBFTFc5a2tB?=
 =?utf-8?B?cWtadHZ6eWNqbXRoTWFzNEV0TUo5Q2trNTdrTlNncHdWc1BGVGdnV3VXVUdD?=
 =?utf-8?B?WXVCdWFXY2FFTVNHN0hPVC9vbE1uQTl6MDdoY1dObG43RGFYNkNkbU5Ud1VP?=
 =?utf-8?B?RXRvb2hwOGQyK3RaRHN2UFJqMkxlM1VJWnpUMGp5V3BzUU1Ud0o4SXdMa3l1?=
 =?utf-8?B?eTAxQ1NYS0NFUit1T08venlwc3IyaDlvdFY5SnN2VkR5NVVQVkgvR3djVHUx?=
 =?utf-8?B?RmFsYjdQVzQvNDk2NHhnS2x3cS82M0RROGwrL2lsN3MwcWxBb2JrVnkyYnhZ?=
 =?utf-8?B?ZFBqbXBQTGxmSWN3TnFVcmsyay8yRkc0dE5SWDRiOGtLam56a01sWkVGRVly?=
 =?utf-8?B?RWQ3REMvdi9CdHRYWEhTNTlxamJmYllZeWpoL2pjeWh4eTdpdVBKUjhOMzRN?=
 =?utf-8?B?SFJmTTJYSWJTREs4aGRMVkNmWW9iR2RxdUpYL0liclo2dUpnaTBBc1h3S2p1?=
 =?utf-8?B?S3lEQXg1Nkd2ZnFWVWVJNTVFNnR5ZTR3b01qQTBtM05XMnJNem1lSHJ0dU1i?=
 =?utf-8?B?bWZOWnp4Wmlaa2grZFJxUVFSMDduQmRHbmFyY21WaStyOWxrOFNBRTVydGND?=
 =?utf-8?B?SlUzaFlRK3ZRL3duSzBXUmtZRjhPWTI5VWFROEp3cUlDQ0dzeXRXM1lqNWts?=
 =?utf-8?B?eEZNWDdlaTR3K2RGaktaTUNTVzM4RG5scC9QSGlQUnVUUWRmMnAvaWhNZ1ZV?=
 =?utf-8?B?MlVYa0NwMjRrQTBDdzV1ZDF4YWEvWnF1amNUN0VqUXA1cnZFTUw4UTBSK3g3?=
 =?utf-8?B?dzBPMFBLYUk2clQ3SGY3QXVJSDR2b0hRNWtpS1JnVm1wYzd1RDFPdTFkaFZ3?=
 =?utf-8?B?LzlnWHF2Sk5JNHhjS0RoT28xa0lGd3daQmowbnJVNXppOG1MWkNnaHpsdzdv?=
 =?utf-8?B?QjA0QTJsZ3U2eHAvUkJTcUl3bXdTV24rcXhqMkdLdTlaenN4ZVpCVE8xVEdv?=
 =?utf-8?B?MlpjN2FmVERvMUQ1dEdlWlFYZU1sNHpKeVdINWxidkt0enNtcTJzY05GY0tT?=
 =?utf-8?B?U3NNNGQzWktxK2h3WEMzZEpPNUJ6TmpiVjgzRzZOT1kzWHBkTEJRS3M4U3Qy?=
 =?utf-8?B?Z2YxSzZVUmFYbXJWT3ZadDM2LzgycXM2cno5WXRmdTgyMTFKQjFRM0JhblFn?=
 =?utf-8?B?cW5GOFpXQXNwSmN4SE0vSUY1aTc5L1ZaTzJsbUZtMEMwenZPenRmUjJoeVhS?=
 =?utf-8?B?QWxOd0FscHh3dGtMclNNUGxxNWJibzFMaUR4RTIxSUcvOG9IYXNPd3gySE1F?=
 =?utf-8?B?Mm1SSkVybC9wTTBoSUFOU1ZvTG0vVUxhNk0zMmExWWUxRDdXbE9iUUZoTjFh?=
 =?utf-8?B?N0o3cmZaUXcwYWxyd01Ebk5MT0pCZmptM296MzNuVmdtWnI3TG10V29IZjJm?=
 =?utf-8?B?MTRoWFk1dFVJUkFwNWMwbG1CMFhraU82R3h4NWs5T3VlT0R1eFVZWklnaHVO?=
 =?utf-8?B?aW1sa2JQcVI0VFBpTnR4TmlUcDB1TTRJMmJjaUhQUE1SMExOMUs5NXQzSUYv?=
 =?utf-8?B?SHdoQk0rTjVOR2FEcXdQYmx3QUpOT0x4UlduMGZEbDlSNnh4ZmZENjdwRlpG?=
 =?utf-8?B?MzhnVlpaVkxId2c3Rk0xejlROEh6QXh2eHU2TERmNFdqYkVkZWNyTEhvalZI?=
 =?utf-8?B?TFUrTmczR3Z2aVZSSDFReGNkWHZRRndOeDE2S29hWVl3Q2wrQ1hVKzFHQ3A4?=
 =?utf-8?B?MmQ0M1ZSNEVCbTVsU05iVGRvV0FNclhjUExMV29wai8vU2M1QzVVQXJKOHNX?=
 =?utf-8?B?L1F1eG9HbTF1RkxVOHBxSTBtWmErWFg1elVlbjJwOU00RUZOQUVCTmZRMnJn?=
 =?utf-8?B?WHp6aDVEem9URmJBcHVPdklKTlJMVzB2YjFGczFZeExPTERaNlY4NUR2Zzdr?=
 =?utf-8?Q?RJLti445Ly72OoT6zcyVD4Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180d0535-7bfc-45aa-bae1-08d9998a6136
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:43:06.3360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yeo5mgYK3VZ/GAN4Nh5/7WmXC6Zillkxwowv8BHpCQZo90CtTHcY8Aafn29su5cxa7KMD6FgsIVQ1xHe2v54DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5538
Received-SPF: pass client-ip=40.107.212.118;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
IFNpZ24gcmVwZXRpdGlvbnMgYXJlIHBlcmZvcmNlIGFsbCBpZGVudGljYWwsIHdoZXRoZXIgdGhl
eSBhcmUgMSBvciAwLg0KPiBCaXR3aXNlIG9wZXJhdGlvbnMgcHJlc2VydmUgdGhlIHJlbGF0aXZl
IHF1YW50aXR5IG9mIHRoZSByZXBldGl0aW9ucy4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cv
b3B0aW1pemUuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KDQpSZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVp
cy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUg
UGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3
LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

