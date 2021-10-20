Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53C434BEF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:19:07 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBUn-0001tW-Nz
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdBSn-0000vJ-Tk; Wed, 20 Oct 2021 09:17:01 -0400
Received: from mail-pr2fra01on0607.outbound.protection.outlook.com
 ([2a01:111:f400:7e18::607]:2416
 helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdBSl-0002TH-J8; Wed, 20 Oct 2021 09:17:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2lFj2YYTISE+3Larf9vf0O8geWWXlPVfV458h/QPdwUWCjopSlhvxAFy7QLm4kzCgfehbDWkfONpCkH77SAooLW1wTDr93mQcsWqRq0crpCW8cmWg0FIYpcVkmIqB7RA3oBU+iDPXOXxu3e9+etVnXl8/h/iBsfhviP4mM1IfU/atVQ2H/gZ8iw+yE+gWs/yIBiwqecTTjC+51I41/JXwPQQTNb4n8OyVR0vG9tmuk7G/KqwaaAWcwjWihKg6Ox72jjgJuemyOzGddMy2YD5S1od9YNxIq+eKwzvx1FRjHYMjriXgaoYRaRSK88lJ/MT3hR2UJM5hjOMXmtiYJ9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPyGpELeJ0oFRakX4cuikhjx3r4lzjI13SJWcTVBnV4=;
 b=oLwoCS+dl8fkbexVlgRrxXHvYwHSoOTzkrfnurT+gL4X0IfygVuELpccRfJE/+oteE5N+o+ynU8b4mT0SDlEVawO1BmXfx96wMaJUXeiD1R/fIVjQuGuuSP8MtDcQGH9kdWdNkEhaxWGkhsnakSbhHVShLp7WnRpvC7EP4DTjPLktP5z+MSke/aDgqOXFvrSY5i08xX2CaLwTYmpZ7som5Y3njR1/oEoLSE08PLGPXBamuq+6pxSFiCutSMWrSF327TrkjsPZgAYrBa9p7bFUD3oEiVi4Mr6514q4Jr5+PJM76R8grv0X4A1SS8wvhzu78271xBWWKJL7rBJQI06zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 13:16:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 13:16:53 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Thread-Topic: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Thread-Index: AQHXtp9cOFYeve2sYEOlUk43ADUcZ6u93ESAgAAIBgCAABkMgIAADngAgAAQrgCAABTGgIAFZwAAgABB1YCAABougIAAIICAgABE3ACAAAKEAIAXcF8AgAAVTwCAABD7gIAACXKA
Date: Wed, 20 Oct 2021 13:16:53 +0000
Message-ID: <5263c819-b13c-f48a-d720-15b085537070@csgroup.eu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
In-Reply-To: <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd96c1ad-b980-4c57-e656-08d993cbe287
x-ms-traffictypediagnostic: MRXP264MB0007:
x-microsoft-antispam-prvs: <MRXP264MB0007B904A1CF8B55986E540DEDBE9@MRXP264MB0007.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uJwm/v024236YZjyij1978hUSAhw0OeRjWlB2GENhmI/GyqmtUCiPKFRk23WqRzflSIsSy/W43HuxEJpw2DJhLBg+tl99cFUzeFUbBrkffUt+JIHCogw6h8hPd1rcPsRbrrDMnQBcsVIMtkoqjgWn4th1BASm72jIeDlFaKtMA1EvFvdh+t0HjnfJDlPHvXDVNTwqgz40M4rsidrqsWHU5w6XkrCv0rEq/kdqCLKx/I/mknasweD7UcO6u8bzvk/eYN8rN+rPEm6PFGL9wVWN/M2rw+OfhuwlQY1RvoFsqyyYHG37ItrsnkB1208ROfiUEBmVbFlBf7wewKtCG1C8MPHns9jqYWzSo8fr9HvGSw/9KrjhiSJ7oo96B+bcxXWc02e1vU+aPfzrobEJhzQ6pVIOKYBLup7up+kvtyWLy8RdVcsVOpnmLlC9gWB07OdmNCd52F/7ugivcbaVLD29nheseqyDUvRvApNyDXxOYx0WSK7H+8/v3DnuXYCMGhGmr+LDzm1h4qFcDqRtEa3AlGDmKgE2q0tjSfX6uEtz2Xv850fFYrA/aBgJuPV/Fb70tekoHH1UVEaUG0FOyqg1vg+2wa9Evp8zpBTtT5QNE7KMRyuVWxUnKWesMF9UlEUEFIKsEPXoE8cGsQpO84hiQRjqfcBwHBJyy78Oeba4ePw5sEqV+yQSzQB1nWrelmf7MOnVkSkEjm/xoKigoX5EpSzT6mzUAMIDWq/T+xzLD9xOjcG+VQsGXIeSDb2Kjtc1VC68PrjeRoSUAj/UHtj19OFZjijqy7bvfTZ655T/Jg3OMsEcgIoJRcQ2A3lFfVv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(8936002)(186003)(54906003)(71200400001)(8676002)(110136005)(6506007)(66556008)(26005)(6486002)(38100700002)(6512007)(4326008)(122000001)(53546011)(31686004)(316002)(966005)(2906002)(66574015)(86362001)(31696002)(2616005)(66946007)(76116006)(83380400001)(66446008)(508600001)(64756008)(91956017)(7416002)(66476007)(38070700005)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3ZNaXNQTnBhc0tVVStJQ1lOaHRHWU96N0FCbUFkZGFCM1Rla1ZkajBvaHp0?=
 =?utf-8?B?QnlSTFZjNmtYU2ticHBid1A5TzN6ME1sci9ubjdoRE9zWGtkS1AwV3JGOEZB?=
 =?utf-8?B?cytSN21Hbm9VS3lJbDNMTjhUTXl1MkxNbmc4ejZnK2E3MFZnNG5oZ1NGKzVh?=
 =?utf-8?B?L3Ezclp5OUR2NlhFZG1tQXVDamY3aWd1TEM3Mjc4RUFhVy8rMEJJVGh2QW84?=
 =?utf-8?B?YmV4WTlXdXpLZXhiMXZBUERLSGR6K09VRnI5MTI1Y0YzY2NpNDIrRkRZaTNM?=
 =?utf-8?B?bnNoL0wxb2xENlF4b3JOd2ZjMzBVcE85TCtYR0s4d1greTk5a29YVXRrZXZ5?=
 =?utf-8?B?eG84SHVrN1NzbEJISVNXR0pKSE5DYXpMOVY3cHZnQ3VvNHdxNXB5bTBBWGJy?=
 =?utf-8?B?SC9nU0hrOGJIU04vbzh0WGRDcEZjWG9za0pVUkJVeHVjeEt5MFIxQ2wwb1c0?=
 =?utf-8?B?cCswaGdySzk0TFpqdE1iUTAzNVpocnJraVRrMmFJNFV5bEl2ZGpQVjFmZHVp?=
 =?utf-8?B?RlQxdmtUTkplck9yTm1EMUJnVXh0WW1RMDkrUTlwWXhrUTNxVzBkZUtLM1FO?=
 =?utf-8?B?RzZNNUlqcTRrU1MzeE1iTE5KYS9RdVRHV2ZHQ1I5ajV5R2VINGlsS3p3YmI1?=
 =?utf-8?B?NGszcHcxbDlOZ2NqWVdvM1ZMeTNGd0s3dGswbHZUL1cycUdWYUhRNlgySk15?=
 =?utf-8?B?a2V3eG10ZmgvQkF3Q3ErVUdiTTZSc2t4ZklOelgyTTNJUVZraEZkOFFFcVo1?=
 =?utf-8?B?K0pWT0toOGZEcjRsQUVXTTJrQ29VK2I3SzJMOURFNk9yNURMeUNLbFJOU2to?=
 =?utf-8?B?bDZvYVA5RUtjbEdGbUNoOWRndENRTEdhYVYxb0xCZHFWalJwZTZvSGZoMW1N?=
 =?utf-8?B?aWMxNGN2dmgyd2NIR0VrUjRSRUtieEpvWWR4MzFvT0lLQ2VTeVhqb3BnZm9q?=
 =?utf-8?B?N1dBVm0xd0NvaTRZWGNneXdldHNEQ2lLUGhKdWUxRXcrR0d3RlFoYTBiUTRh?=
 =?utf-8?B?aGlaYnoxdjY3MUlOa1BMNE0vOElIbWtNMUNPOVk0SHRLVlE0K21HdlEwSnZi?=
 =?utf-8?B?NGVwb3ZyWUF2Q3RvdnN2alpqSkl3eDdjaS8wNzY0dHhPUlB2Z25WQWZURk9D?=
 =?utf-8?B?dkcrS1FwUXVLcXBRbTdrcE1BdlljUGdwRlMyY01QZDJweVhGK09FRFZxc3lW?=
 =?utf-8?B?dWRJNjJ0aWFzYTZPOGdwSUxPbkVuZ0ljL0twS0N4YzB2Mm9hU2E2cS84dFhr?=
 =?utf-8?B?a2xlblFZbGNDM3V6RVQ2WjNyYlNQWWwzVml3UGhJZkovSkZWNVIxakpiN1N6?=
 =?utf-8?B?dWFrMGhGd1RCU2N2ZkRGdzFVeGcwZ3RpempzcjdnaVYwbVNJRmcyalk5ZXNk?=
 =?utf-8?B?bzNlRFNNVVBxMWtXaWZZZTk5WkRLUWQ2ODZRRTlJb2pqWkdteDVHVUYzMnFU?=
 =?utf-8?B?U1Y1VlBORkozUEhoZVE2UEJSMWI4bFZiVVhYUlordmtKaU5KUmFadmhFM1Rp?=
 =?utf-8?B?RGs5RC92U2Exb0dnTmx6RUhLWHVjZG9xcUNnWXRRK0Z2emk2dVBYVC9qeGtH?=
 =?utf-8?B?eWxRZ21EMC84TWY0RnBPOU9lamhzNDlyK1ZRd0F3VDFqTDB5TzRQdlNOYnNL?=
 =?utf-8?B?emo2dUN3NHlpM1d2MTNyQlByamZhNVpXUmowTnZrODVkWmU5YU4yZXZYc1hp?=
 =?utf-8?B?RytHMjJ5Qm5LOTNhZmdFVzY5L3J2MTJtN2hqU01lcVg3bnNDTm9ydEV5T29n?=
 =?utf-8?B?L3JUbVJlKzFoYlpvbGozaTZpZmZHUnMzRW0wREJaZFdhZ0x0K1RNRmZOeU0y?=
 =?utf-8?B?YWNmT3FVRmpVZXF6VXY1Q1BhendwTmJ3cSswNXZZTjlRaHo5TndsbGRGa0d2?=
 =?utf-8?B?bzloeVpPMUJTbEpmODFDQ2k0c3Bta3VPMjNUUnR5M09CRzJScC9xSUgvVS82?=
 =?utf-8?B?VTdSUC81WktRK25nOU9RdFBGZXgrbloyTWZHdEY1dmFGbWJsNStKeEJGS2hM?=
 =?utf-8?B?UTlKRStEZkRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14CF4B107F3B9E4380D1C29A7AFB99B6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd96c1ad-b980-4c57-e656-08d993cbe287
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 13:16:53.6941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: christophe.leroy@csgroup.eu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0007
Received-SPF: pass client-ip=2a01:111:f400:7e18::607;
 envelope-from=christophe.leroy@csgroup.eu;
 helo=FRA01-PR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 "gdb@sourceware.org" <gdb@sourceware.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCkxlIDIwLzEwLzIwMjEgw6AgMTQ6NDMsIEPDqWRyaWMgTGUgR29hdGVyIGEgw6ljcml0wqA6
DQo+IE9uIDEwLzIwLzIxIDEzOjQyLCBCQUxBVE9OIFpvbHRhbiB3cm90ZToNCj4+IE9uIFdlZCwg
MjAgT2N0IDIwMjEsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4+IE9uIDEwLzUv
MjEgMTQ6MjksIFRob21hcyBIdXRoIHdyb3RlOg0KPj4+PiBPbiAwNS8xMC8yMDIxIDE0LjIwLCBC
QUxBVE9OIFpvbHRhbiB3cm90ZToNCj4+Pj4+IE9uIFR1ZSwgNSBPY3QgMjAyMSwgQ8OpZHJpYyBM
ZSBHb2F0ZXIgd3JvdGU6DQo+Pj4+Pj4gT24gMTAvNS8yMSAwODoxOCwgQWxleGV5IEthcmRhc2hl
dnNraXkgd3JvdGU6DQo+Pj4+Pj4+IE9uIDA1LzEwLzIwMjEgMTU6NDQsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+Pj4+Pj4+PiBMZSAwNS8xMC8yMDIxIMOgIDAyOjQ4LCBEYXZpZCBHaWJzb24g
YSDDqWNyaXTCoDoNCj4+Pj4+Pj4+PiBPbiBGcmksIE9jdCAwMSwgMjAyMSBhdCAwNDoxODo0OVBN
ICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gMDEvMTAvMjAyMSAxNS4w
NCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4+Pj4+Pj4+IExlIDAxLzEwLzIwMjEgw6Ag
MTQ6MDQsIFRob21hcyBIdXRoIGEgw6ljcml0wqA6DQo+Pj4+Pj4+Pj4+Pj4gT24gMDEvMTAvMjAy
MSAxMy4xMiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4gT24gRnJpLCAxIE9j
dCAyMDIxIGF0IDEwOjQzLCBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4+Pj4+Pj4+
Pj4+Pj4gd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4+PiBOZXZlcnRoZWxlc3MsIGFzIGxvbmcgYXMgbm9i
b2R5IGhhcyBhIGhpbnQgd2hlcmUgdG8gZmluZCB0aGF0DQo+Pj4+Pj4+Pj4+Pj4+PiBwcGM0MDVf
cm9tLmJpbiwgSSB0aGluayBib3RoIGJvYXJkcyBhcmUgcHJldHR5IHVzZWxlc3MgaW4NCj4+Pj4+
Pj4+Pj4+Pj4+IFFFTVUgKGFzIGZhciBhcyBJDQo+Pj4+Pj4+Pj4+Pj4+PiBjYW4gc2VlLCB0aGV5
IGRvIG5vdCB3b3JrIHdpdGhvdXQgdGhlIGJpb3MgYXQgYWxsLCBzbyBpdCdzDQo+Pj4+Pj4+Pj4+
Pj4+PiBhbHNvIG5vdCBwb3NzaWJsZQ0KPj4+Pj4+Pj4+Pj4+Pj4gdG8gdXNlIGEgTGludXggaW1h
Z2Ugd2l0aCB0aGUgIi1rZXJuZWwiIENMSSBvcHRpb24gZGlyZWN0bHkpLg0KPj4+Pj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+Pj4+PiBJdCBpcyBhdCBsZWFzdCBpbiB0aGVvcnkgcG9zc2libGUgdG8gcnVu
IGJhcmUtbWV0YWwgY29kZSBvbg0KPj4+Pj4+Pj4+Pj4+PiBlaXRoZXIgYm9hcmQsIGJ5IHBhc3Np
bmcgZWl0aGVyIGEgcGZsYXNoIG9yIGEgYmlvcyBhcmd1bWVudC4NCj4+Pj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+Pj4+IFRydWUuIEkgZGlkIHNvbWUgbW9yZSByZXNlYXJjaCwgYW5kIHNlZW1zIGxpa2Ug
dGhlcmUgd2FzIG9uY2UNCj4+Pj4+Pj4+Pj4+PiBzdXBwb3J0IGZvciB0aG9zZSBib2FyZHMgaW4g
dS1ib290LCBidXQgaXQgZ290IHJlbW92ZWQgdGhlcmUgYQ0KPj4+Pj4+Pj4+Pj4+IGNvdXBsZSBv
ZiB5ZWFycyBhZ28gYWxyZWFkeToNCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9xZW11LXByb2plY3QvdS1ib290Ly0vY29tbWl0Lzk4ZjcwNWM5Y2VmZGYNCj4+
Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qv
dS1ib290Ly0vY29tbWl0L2IxNDdmZjJmMzdkNWINCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvdS1ib290Ly0vY29tbWl0Lzc1MTQwMzdi
Y2RjMzcNCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiBCdXQgSSBhZ3JlZSB0aGF0IHRoZXJl
IHNlZW0gdG8gYmUgbm8gc2lnbnMgb2YgYW55Ym9keSBhY3R1YWxseQ0KPj4+Pj4+Pj4+Pj4+PiBz
dWNjZXNzZnVsbHkgdXNpbmcgdGhlc2UgYm9hcmRzIGZvciBhbnl0aGluZywgc28gd2Ugc2hvdWxk
DQo+Pj4+Pj4+Pj4+Pj4+IGRlcHJlY2F0ZS1hbmQtZGVsZXRlIHRoZW0uDQo+Pj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4+PiBZZXMsIGxldCdzIG1hcmsgdGhlbSBhcyBkZXByZWNhdGVkIG5vdyAuLi4g
aWYgc29tZW9uZSBzdGlsbCANCj4+Pj4+Pj4+Pj4+PiB1c2VzDQo+Pj4+Pj4+Pj4+Pj4gdGhlbSBh
bmQgc3BlYWtzIHVwLCB3ZSBjYW4gc3RpbGwgcmV2ZXJ0IHRoZSBkZXByZWNhdGlvbiBhZ2Fpbi4N
Cj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBJIHJlYWxseSB3b3VsZCBsaWtlIHRvIGJlIGFibGUg
dG8gdXNlIHRoZW0gdG8gdmFsaWRhdGUgTGludXggDQo+Pj4+Pj4+Pj4+PiBLZXJuZWwNCj4+Pj4+
Pj4+Pj4+IGNoYW5nZXMsIGhlbmNlIGxvb2tpbmcgZm9yIHRoYXQgbWlzc2luZyBCSU9TLg0KPj4+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IElmIHdlIHJlbW92ZSBwcGM0MDUgZnJvbSBRRU1VLCB3ZSB3
b24ndCBiZSBhYmxlIHRvIGRvIGFueQ0KPj4+Pj4+Pj4+Pj4gcmVncmVzc2lvbg0KPj4+Pj4+Pj4+
Pj4gdGVzdHMgb2YgTGludXggS2VybmVsIG9uIHRob3NlIHByb2Nlc3NvcnMuDQo+Pj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4+IElmIHlvdS9zb21lb25lIG1hbmFnZWQgdG8gY29tcGlsZSBhbiBvbGQgdmVy
c2lvbiBvZiB1LWJvb3QgZm9yDQo+Pj4+Pj4+Pj4+IG9uZSBvZiB0aGVzZQ0KPj4+Pj4+Pj4+PiB0
d28gYm9hcmRzLCBzbyB0aGF0IHdlIHdvdWxkIGZpbmFsbHkgaGF2ZSBzb21ldGhpbmcgZm9yDQo+
Pj4+Pj4+Pj4+IHJlZ3Jlc3Npb24gdGVzdGluZywNCj4+Pj4+Pj4+Pj4gd2UgY2FuIG9mIGNvdXJz
ZSBhbHNvIGtlZXAgdGhlIGJvYXJkcyBpbiBRRU1VLi4uDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBJ
IGNhbiBzZWUgdGhhdCBpdCB3b3VsZCBiZSB1c2Vmb3IgZm9yIHNvbWUgY2FzZXMsIGJ1dCB1bmxl
c3MgDQo+Pj4+Pj4+Pj4gc29tZW9uZQ0KPj4+Pj4+Pj4+IHZvbHVudGVlcnMgdG8gdHJhY2sgZG93
biB0aGUgbmVjZXNzYXJ5IGZpcm13YXJlIGFuZCBsb29rIGFmdGVyIA0KPj4+Pj4+Pj4+IGl0LCBJ
DQo+Pj4+Pj4+Pj4gdGhpbmsgd2UgZG8gbmVlZCB0byBkZXByZWNhdGUgaXQgLSBJIGNlcnRhaW5s
eSBkb24ndCBoYXZlIHRoZQ0KPj4+Pj4+Pj4+IGNhcGFjaXR5DQo+Pj4+Pj4+Pj4gdG8gbG9vayBp
bnRvIHRoaXMuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJIHdpbGwgbG9vayBhdCBp
dCwgcGxlYXNlIGFsbG93IG1lIGEgZmV3IHdlZWtzIHRob3VnaC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4g
V2VsbCwgYnVpbGRpbmcgaXQgd2FzIG5vdCBoYXJkIGJ1dCBub3cgSSdkIGxpa2UgdG8ga25vdyB3
aGF0IGJvYXJkDQo+Pj4+Pj4+IFFFTVUgYWN0dWFsbHkgZW11bGF0ZXMsIHRoZXJlIGFyZSB3YXkg
dG9vIG1hbnkgY29kZW5hbWVzIGFuZCBQVlJzLg0KPj4+Pj4+DQo+Pj4+Pj4geWVzLiBXZSBzaG91
bGQgdHJ5IHRvIHJlZHVjZSB0aGUgbGlzdCBiZWxvdy4gRGVwcmVjYXRpbmcgZW1iZWRkZWQNCj4+
Pj4+PiBtYWNoaW5lcw0KPj4+Pj4+IGlzIG9uZSB3YXkuDQo+Pj4+Pg0KPj4+Pj4gV2h5IHNob3Vs
ZCB3ZSByZWR1Y2UgdGhhdCBsaXN0PyBJdCdzIGdvb2QgdG8gaGF2ZSBkaWZmZXJlbnQgY3B1DQo+
Pj4+PiBvcHRpb25zIHdoZW4gb25lIHdhbnRzIHRvIHRlc3QgY29kZSBmb3IgZGlmZmVyZW50IFBQ
QyB2ZXJzaW9ucyAobWF5YmUNCj4+Pj4+IGFsc28gaW4gdXNlciBtb2RlKSBvciBqdXN0IHRvIGhh
dmUgYSBxdWljayBsaXN0IG9mIHRoZXNlIGF0IG9uZSBwbGFjZS4NCj4+Pj4NCj4+Pj4gSSB0aGlu
ayB0aGVyZSBhcmUgbWFueSBDUFVzIGluIHRoYXQgbGlzdCB3aGljaCBjYW5ub3QgYmUgdXNlZCB3
aXRoIGFueQ0KPj4+PiBib2FyZCwgc29tZSBvZiB0aGVtIG1pZ2h0IGJlIGFsc28gaW4gYSB2ZXJ5
IGluY29tcGxldGUgc3RhdGUuIFNvDQo+Pj4+IHByZXNlbnRpbmcgc3VjaCBhIGJpZyBsaXN0IHRv
IHRoZSB1c2VycyBpcyBjb25mdXNpbmcgYW5kIG1pZ2h0IGNyZWF0ZQ0KPj4+PiB3cm9uZyBleHBl
Y3RhdGlvbnMuIEl0IHdvdWxkIGJlIGdvb2QgdG8gcmVtb3ZlIGF0IGxlYXN0IHRoZSBDUFVzIHdo
aWNoDQo+Pj4+IGFyZSByZWFsbHkgY29tcGxldGVseSB1c2VsZXNzLg0KPj4+DQo+Pj4gTWF5YmUg
b25seSByZW1vdmUgc29tZSBmcm9tIHN5c3RlbSBlbXVsYXRpb24gYnV0IGtlZXAgYWxsIG9mIHRo
ZW0NCj4+PiBpbiB1c2VyIGVtdWxhdGlvbj8NCj4+DQo+PiBPciBrZWVwIHRoZW0gYWxsIGJ1dCBt
YXJrIHRob3NlIHRoYXQgYXJlIG5vdCB0ZXN0ZWQvbWF5IGJlIGluY29tcGxldGU/IA0KPj4gU28g
dGhlIHVzZWQgY2FuIHNlZSB3aGF0IGlzIGV4cGVjdGVkIHRvIHdvcmsgYW5kIHdoYXQgbWF5IG5l
ZWQgdG8gYmUgDQo+PiBmaXhlZC4gVGhhdCB3YXkgc29tZWJvZHkgbWF5IHRyeSBhbmQgZml4IGl0
IHdoZXJlYXMgaWYgaXQncyBub3QgdGhlcmUgDQo+PiB0aGV5IGFyZSB1bmxpa2VseSB0byB0cnkg
dG8gYWRkIGl0Lg0KPiANCj4gDQo+IFRoZSBiYW1ib28gbWFjaGluZSB3aXRoIDQ0MCBDUFVzIGlz
IGJvb3Rpbmcgd2l0aCB0aGUgbGF0ZXN0IGtlcm5lbA0KPiBhbmQgd2UgaGF2ZSBhbiBhY2NlcHRh
bmNlIHRlc3QgZm9yIGl0IG5vdywgdGhhbmtzIHRvIFRob21hcy4gVGhlcmUNCj4gaXMgbm90IG11
Y2ggZWZmb3J0IGluIGtlZXBpbmcgdGhlbSBpbiBhIHdvcmtpbmcgc3RhdGUgdW50aWwgc29tZW9u
ZQ0KPiB2b2x1bnRlZXJzLiBIb3BlZnVsbHksIENocmlzdG9waGUgaXMgbWFraW5nIHN1cmUgdGhh
dCB3ZSBhcmUgbm90DQo+IGJyZWFraW5nIGFueXRoaW5nIHdpdGggTGludXggc3VwcG9ydC4NCj4g
DQo+IFRoZSA0MDUgbWFjaGluZSBhcmUgc3RpbGwgY2xvc2UgdG8gZGVwcmVjYXRpb24gSSB0aGlu
ay4gV2UgYXJlIHN0aWxsDQo+IHN0cnVnZ2xpbmcgdG8gYm9vdCBvbmUgd2l0aCBtYWlubGluZSBM
aW51eCwgdXNpbmcgdWJvb3QgcHJvdmlkZWQgYnkNCj4gVGhvbWFzIHdoaWNoIHNraXBzIFNEUkFN
IGluaXQuIEl0IGlzIG5vdCBjbGVhciB0byBtZSBpZiB1LWJvb3QgaXMNCj4gc3RyaWN0bHkgbmVj
ZXNzYXJ5LiBJdCBkZXBlbmRzIGlmIExpbnV4IHJlbGllcyBvbiBpdCB0byBkbyBzb21lDQo+IHBy
ZS1pbml0aWFsaXphdGlvbiBvZiBIVy4gSSBndWVzcyBvbmNlIHdlIGZpbmQgYSBnb29kIERUUyBm
b3IgaXQsIG9yDQo+IG5vdCwgd2UgY2FuIHRha2UgYSBkZWNpc2lvbi4NCj4gDQoNCkkgbm93IGhh
dmUgYSBoYWNrZWQgY29uZmlndXJhdGlvbiBib290aW5nIGxpbnV4IHdpdGggdGhlIGhvdGZvb3Qg
RFRTIGFuZCANCnRoZSBrZXJuZWwgaXMgYm9vdGluZyB1cCB0byBzdGFydGluZyAvaW5pdA0KDQpU
aGVuIGl0IGlzIGZhdWx0aW5nIGZvcmV2ZXIgdGFraW5nIGEgRFNJIGZvciB3cml0ZSBwcm90ZWN0
aW9uLiBUaGUgDQpwcm9ibGVtIGlzIG5vdyBsaWtlbHkgaW4gTGludXggYW5kIEknbSBpbnZlc3Rp
Z2F0aW5nIGl0LCBidXQgSSdtIGhhdmluZyANCnByb2JsZW0gd2l0aCBHREIgKDcuOC4xKSwgSSdt
IGhpdHRpbmcgdGhlIGJ1ZyANCmh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19i
dWcuY2dpP2lkPTE3NzAwDQoNCkFuZCBHREIgMTEuMSBjb3JlZHVtcHMgd2hpbGUgcmVhZGluZyB2
bWxpbnV4J3Mgc3ltYm9scw0KDQpIb3BlZnVsbHkgSSdsbCBmaW5kIGEgR0RCIHZlcnNpb24gYmV0
d2VlbiA3LjggYW5kIDExIHRoYXQgd29ya3Mu

