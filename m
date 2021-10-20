Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4E434F22
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:33:59 +0200 (CEST)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdDbJ-0006xZ-RH
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdDWI-0003Bd-Lm; Wed, 20 Oct 2021 11:28:46 -0400
Received: from mail-eopbgr90044.outbound.protection.outlook.com
 ([40.107.9.44]:33568 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdDWG-000883-CM; Wed, 20 Oct 2021 11:28:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAblf0lbyg09M/2X6UeDYphLgFwmohDY/IX5Xqgw1Oz28GUtJcbPLKlaIJKgZ4JRJ1nuWUn/gfvqAuxDaS8KkMk4OPWbBJ3SIzjgaQgLHzk3njJuKkAMlp9yuBCnLYhz+c46jLqrWaEJtdXBQEqG68PuC8BSaQGw2VU0z4bk601AZRtWBccMbBY6Cg8TGt6HnNfe/PmUV1rqr9iE3+Dgbg1ZhRffW8i1BNHpERqrgcj2NZU27ioHZKYQE3iLkMEO0Mm6q+5kfO64avlGo/WjveKQcMkQtDsY0jfsH6jvM50hIWFbIm7Sgt0Z890PBDNg9TPpYW+UvlVMqdOQ6ZwFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oLlw64gWugK7mxUkrSQJquVuGTvT4saRaEizN7azWw=;
 b=Tg5Ndi+ds3xcnwZ5QsLAtwHn7q4tItYow2rgc9/7pVb2565vDHqhMRRpQvvg/A1fAVbVOcZwoSry8dyrUa6dJ2fHYwzNldL8U1qJrB9pvnC5VteQfZM/zGmW4Tsc/d9hMCAXYZN2qkceP/qVuNGsGJyR4DX+IUJWLihGksCIq8wYYn6oFkDLPt95NVZhTVFh3CA3sRtJYBKfvlWkuo48ALFJtXFINGNTIRfCKJIE7rIM5K+SpN+RQVHORchf/GDQ3UZz5UJrYlPjf2IxXi9ksHs35cuaKElxQdPzOZU3eWPMab+cZvuKxPXdVBf0O694nHRqQvb/gj9sY0P8+4qZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0312.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 15:28:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 15:28:40 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, BALATON Zoltan
 <balaton@eik.bme.hu>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Thread-Topic: Deprecate the ppc405 boards in QEMU?
Thread-Index: AQHXucZF2mvlN0sthUetBB/8OV47qqvEUmkAgAAFE4CAAJvQAIAAn+CAgAfoOACAABN7AIAAREAAgAxRZYCAAAJLgIAAB8TCgAASBwCAABgs+4AAJtCugABt5+KAANSDEoAANuAAgAAUIwCAAA3BAA==
Date: Wed, 20 Oct 2021 15:28:40 +0000
Message-ID: <5923d237-c54d-ab62-1ca7-46e2a111ae88@csgroup.eu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
 <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
 <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
 <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
 <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
 <a9b483e2-9176-2349-2478-faa15592c28b@csgroup.eu>
 <38de2462-17ea-0264-5606-6e07b129920d@kaod.org>
 <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
 <d42a7e69-37e3-a888-4256-df70e7311746@kaod.org>
In-Reply-To: <d42a7e69-37e3-a888-4256-df70e7311746@kaod.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aca8696b-b32d-4dbc-d89b-08d993de4b2e
x-ms-traffictypediagnostic: MRXP264MB0312:
x-microsoft-antispam-prvs: <MRXP264MB03125287176C6EB100A07248EDBE9@MRXP264MB0312.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 260FyUNQk+VilPTAs5av+r3ZQyL+bd6dnypxgCmxGA9cXndm7XYtcHiEJpwfBUqRI+ST+l0One/hOJSkrBeWERM5yoaDBsBrw9lX5JVfc1VGAA3phD2lsbALCow/c5LUH968SnaLxZlbSpin+1nwed5/SaTRaljBdeazPZLI6JunSKpiAzqfD/TfxVb5RB51/gttLOwdScwVNdXEZoKhTqM8TKhJTxKA0D61i628DDHLnNWBajMAMLDxcymxR2o4ZVAP3AYUF2Jj2Ecjl2PLm7qSA4QFQ4SxKl10wiyh+aVv+jBfy1wATvciACgnTI+EHsBe+aBRE3JXkBS0/b4qTTo7BcyFdf7QPWLdu6nKYRahBBxU7XdgHpwVJ7Px2otucgrlPtHtGG24HZ9hczx3FQxZvlKaak46CPmAuj+tzJcxSdUghaLOqnbUe66VzhGIBYj/Z2W7d1+hkeaxdgUj7z3eb/jI3rn5NCu/8bogXoOOgVcbT9AFuYuJs2NnltwEh2vvuretgj7B0v366qXdebx9Jpi5qLOAK+vCa3YVKQLQOoOPixkcSGlVqC2KMYpPlB4zNkE3//iM0awlCEPcbu+EgdASyhPlmwxOx7dC8Ua8FpnDLKZUJ4evyUsyIRlH8R9E3dLQRpmKKGTa1YHs7XL/S0vwjI5xSk+oZYp9NLG6u9HEfDQcRgppT+1oOaj8v+fOkvstzvbJ+mbr0eqwSHI2ydzdHnuGY9veuskHNglNOzTfHvdzjgZrQGCxY0JHpCJK5kiDXISnvnKCbXxb31wujE7g4c9TGVLVuG/Zu1hIyq+wUvoOwjUGs/st2ju8XPF4ih7lfOWqxtbhGQhdGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(4744005)(31686004)(26005)(54906003)(6512007)(36756003)(6486002)(8936002)(6506007)(316002)(53546011)(66556008)(64756008)(66446008)(186003)(5660300002)(66476007)(83380400001)(2616005)(66946007)(7416002)(122000001)(8676002)(31696002)(4326008)(86362001)(71200400001)(508600001)(966005)(2906002)(38070700005)(91956017)(76116006)(110136005)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWJJdU1RVVBiTTdxZHE1YWRZTmhTUDdIOEhpbzQ3Z2VhVlhnVS8xU3Mxdm92?=
 =?utf-8?B?Mk13R29RUEx5bDk2ZXNPWFJ3ZlJSOVZCTTVMalUyZmtaSnRrOUk0V25FRjc2?=
 =?utf-8?B?MDd3RnhkZFdna0ZXWUdGVlpsRlZEVDduWCszMjdlR3pqWXQ5ektESmlkYWc5?=
 =?utf-8?B?bWlKWDJCeHgySWp1ZkNPTkRrbUJCeVpzaDArQjJHbjZ4bU4rbnVPK3M5UzdF?=
 =?utf-8?B?Vk95bnJocFhyN1k3SG5Jb29pUTlYSFVpQi82WmU4RWlqZWFjVzArSlFBZENx?=
 =?utf-8?B?Qmw5TTBTN0t0Y0paQXcyTGJhdGlhMmxZcVlrY1c5NkZCZDdid2VCTHVxWjh0?=
 =?utf-8?B?aEhSS255S25ybTdicHJwMVRhUWt3Y2d3enY3elVlSndzN21nWFN1VTRsSW1S?=
 =?utf-8?B?NjBoV20vSlFCUmFuTzkwdlplUWpKWkVkbzRtSUY2cnBIQUc0U250MkFYMlR5?=
 =?utf-8?B?SU9wOHp0eGFjRC9oL3creFNoS0VNNDdFOTRPNXlBZGw0QTB3d09yblhwTzhn?=
 =?utf-8?B?dDQ3c2h1VVlKZE0ySEk5QVFtbEdEVHUxSzRQVllndG9sdHo3dEppWVhORHFH?=
 =?utf-8?B?YlkwVFBiZzNZNVFnamtWYllnQThlSXNWQXE5Q2ZWOVhob1BWNExoeHZGcHA5?=
 =?utf-8?B?emVNSkUzaUZUbjhEWVBUM01KSjJuZ21SOWJYWFU2b0xqb2lWMkQraFZJcEp1?=
 =?utf-8?B?WiswcjZhN0lnWXFaOWd1Mm50VVQzazBsL3ZLSVYvOVBRUlM1VjgxZkFiRGJR?=
 =?utf-8?B?WGs3QWtoQWY2MXpJMkQvQXNUUDJTV0tVTDlVbzNLa2R1WmhMUjYrVjBZSWRx?=
 =?utf-8?B?TmN6VEZ5cUVmVHVEcDVDcTFHQXgvRnBmSnBRc1JTaXozaDFRWkt3R1dKYzJQ?=
 =?utf-8?B?a29VeVNodjlhelFKQktzdGpsVnJrczhCenR5U29UdkpPbXk3bmw0QTNtN1Zv?=
 =?utf-8?B?ekdESHVHZFRoSEx3VnUxWktISGxWNmZDTXJ1cjRvblBFRFpwREdEVTF5c1d3?=
 =?utf-8?B?d3dMWXAxdzhpZktQdFQwaW1WaFgrMkV2bm42N1lQb3lPZjBTTHQ4eCtaZXhX?=
 =?utf-8?B?cGVDa2xCVXBEZXpvRHQxam5hYzNJdlJqRW1NRjB3NUxCUU1oL0diR2E3YndV?=
 =?utf-8?B?Z2x5QnFmN3NXQzdtZTFlNCt3c1dSTk9keks5bHdvVVpNblZ4RHA5R29rRzVo?=
 =?utf-8?B?aDc0SjFHS1FSOHh0U21qaER2dlZGT1M1OWVHNHBteHpsMFk5bXJ1VGxtRTFh?=
 =?utf-8?B?YXN1YnQ4SjVMR0d4VkVUVmpzTGg1UU42Q213SHFlMWh1Njdzak5zaXlZK0t5?=
 =?utf-8?B?L2o5RmNGSGt5S3Fma3M4S3VjMktLTlNVeFJ1RlNIUmhWdmV3c3pxODZ2anU2?=
 =?utf-8?B?M0JOUFoyRHVLZVRjQ0h4aTZHeEtNRjc5TlZ3T3Qzd1pGUEljT0M2NWdLWXRW?=
 =?utf-8?B?UDFxVjFuMGxQbVJMRWhuYi9RM1NpRTYrSEZ3OGJabmFYNGc0MzJvSzdDNUpK?=
 =?utf-8?B?U2pWR25MR1RxN25adk9hZmh5NUlrd2NBWnV0ZjFla3RQcU9ONjc1blV5d0xS?=
 =?utf-8?B?VlhxMFRadTZnYklNU1VvamVVWmVxTHZaeTRmWXFvRlNZU3EzRzJ2MTZlc2Fa?=
 =?utf-8?B?eGtRWVdBVjZLY2VGZ1JWeEljQW1FVHhBNVhIVVlpZGRDQzF1MmxjQXp3Z3JS?=
 =?utf-8?B?SVJ5bnZTU2JxbVNUWXRjaUhFYSt2V2xpQVdnSkxBQ3VkVERqZ3BMY3hHQldh?=
 =?utf-8?B?S2VCMjN1bExzN2ZndjhFRUpBdi9MMFNyTUlTV0ptQmU0NGJtSTZLZFhIWjV5?=
 =?utf-8?B?dDZvL2FTVXozdkJsZG1EUT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <104EDBF05FB24C4CB43869C36B19915D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aca8696b-b32d-4dbc-d89b-08d993de4b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 15:28:40.1964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: christophe.leroy@csgroup.eu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0312
Received-SPF: pass client-ip=40.107.9.44;
 envelope-from=christophe.leroy@csgroup.eu;
 helo=FRA01-MR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCkxlIDIwLzEwLzIwMjEgw6AgMTY6MzksIEPDqWRyaWMgTGUgR29hdGVyIGEgw6ljcml0wqA6
DQo+IE9uIDEwLzIwLzIxIDE1OjI3LCBMRVJPWSBDaHJpc3RvcGhlIHdyb3RlOg0KPj4gSSBtYW5h
Z2VkIHRvIGdldCBhIGtlcm5lbCBib290aW5nIHdpdGggdGhlIGZvbGxvd2luZyBjaGFuZ2UgKGFu
ZCB3aXRoDQo+PiBDT05GSUdfRVRIRVJORVQgcmVtb3ZlZCkNCj4gDQo+IExvb2tzIGdvb2QuDQo+
IA0KPiBEbyB5b3UgaGF2ZSBhIGNvbXBhdGlibGUgYnVpbHJvb3QgaW1hZ2UgPw0KPiANCg0KSSdt
IHRyeWluZyB3aXRoIHRoZSBjcGlvIG9uZSBmcm9tIA0KaHR0cHM6Ly9naXRodWIuY29tL2dyb2Vj
ay9saW51eC1idWlsZC10ZXN0L3RyZWUvbWFzdGVyL3Jvb3Rmcy9wcGMNCg0KQ2hyaXN0b3BoZQ==

