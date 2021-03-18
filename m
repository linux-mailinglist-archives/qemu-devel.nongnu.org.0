Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BD33FDF1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:59:00 +0100 (CET)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMjoK-0005ep-1Q
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMjmq-0004hg-4V
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:57:28 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMjmo-0000UT-D7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616039846; x=1647575846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ETl9/FTwpPGyK35yXBEbz1RX9rcRK9VL/ZpzL1MseME=;
 b=b55MgfBiXo275ssykG+zFI4GZA2JgjMnKlzwK6GXB6ZKRCF4ioX3p8sV
 nbdOQ1uVwkTx3DeVgQvYUYwiBYUanogCqIerh81d63RVLv2rDK5cdY+oe
 f/FHb6XVi9ahRsLFoVwd00zd79luV1FcTHHhudsh0I2ENsbQS0Zb15d8L U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Mar 2021 20:57:24 -0700
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 17 Mar 2021 20:57:24 -0700
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 20:57:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 17 Mar 2021 20:57:23 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4454.namprd02.prod.outlook.com (2603:10b6:a03:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 03:57:23 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 03:57:23 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
Thread-Topic: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
Thread-Index: AQHW/d3RWNOD5HbBV0+y+7C+tID81qpYLD8AgDEW6/A=
Date: Thu, 18 Mar 2021 03:57:22 +0000
Message-ID: <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
 <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
In-Reply-To: <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 643baa3c-45de-4481-92dc-08d8e9c1efa3
x-ms-traffictypediagnostic: BYAPR02MB4454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB44549ACA9E601EC35E2DDFD7DE699@BYAPR02MB4454.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tgGyubvG0ZISIs20L1VPxxLIMgCbXWMbIFZy+R9U2L5nvPUxLeYMc8ZmzNdSERXdTChLI6AA5S6XI5NkNPPLSmQdpcgCHjQjp1zheyj4mtPTIbQ7SlyJKsdh6WOS5qEj37vu9eInhCGCRx3/MhEzh6177KVypq5KQCBFbxDnBzd7ZothfEaBPxcEBRFTOBqrES2BWtgUioCHiwV/vyEL0Zd6L+R1QvfLiO0DUVmflayhF3egw9Udvcz52+0Vtv23+fNUuo2rP8K77K/IXj3acUqjI71wfxOYu50XStzL31TvSi/t5syV5fTnDgQqsF8irZduK5AcYWl0TdzCyyYLw+m5oNZW+2+XMWRiHEaVrDCbTAbQc/CKIy6PqHfzjaWeoNUEp9iaZopCCPrkn4EECuUR85XFI1iyOAxFGiF7YDucFZ7b6UsyZZ85nQ48Sx1lAE5cVqOpEN3bgoOFwUTK8H3ev2rrzRTWyWAAZd6mgxti9+UIODCSmbJumLzs1K3wUUX7ZOcwWwcMpuculNaJeI8u6ipfPhJvH5paU7/Q6DjX9QWrn0N4fGi6Uj7il9xPkgxTrjkJmBAtv2dAnxQJyxLEeTTpV2pwjGy1zutz/es=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(4326008)(107886003)(33656002)(71200400001)(8676002)(26005)(8936002)(186003)(9686003)(5660300002)(66446008)(66556008)(66946007)(55016002)(52536014)(7696005)(2906002)(76116006)(6506007)(66476007)(478600001)(316002)(38100700001)(86362001)(54906003)(110136005)(83380400001)(53546011)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OTA5bStwLzI4WjY1SG1vWEtyb2xHK0JPcTRxNUVBYndXSlBxd0F0NUE5cjdm?=
 =?utf-8?B?ejh3citxVG1ldkFtdWFTZW5rV3ora1VrSXZTMHpnV0lnTjVvSmdlcHFLcFdP?=
 =?utf-8?B?MEJzeUcvQ1ZPRXJyUXJCWlh5aXorU1FZSDU5aUlNNXRNd09MRk01LzJRZDJU?=
 =?utf-8?B?UWNkMnpaVElTL3J1OXdub3ZlM1RiUERYRU12ckFCdXNuQXBrMkNSQ0hVd08y?=
 =?utf-8?B?bjVpd04yMEt0RDkwRnNpRGJtaEl1U052WW1heTZZRTV2ZXBxVjhqQUsrSGlZ?=
 =?utf-8?B?T0kvMm5aT2VCd2U5am9jMmx1YXhobmJnSkZ2blFQc0pIOE83VU9HdHlONkRJ?=
 =?utf-8?B?Q1hld2Yrc3J0QWJET2dHTnFxSDNJN2U3S3pVNzdvNUZxRHlFc2VOTkpIaGRP?=
 =?utf-8?B?RTc1eEdrTENvRW1ETTh5UGNRTmJTa3Zrek1LS1NNZUZNS2J1UmRxeXJQdXpC?=
 =?utf-8?B?QmJUUi96d3p4OE02ZWpqR0tWcGVEcW5JQm9iOTlmZ1hKTlcwMHo1RVl5Slox?=
 =?utf-8?B?SnFMUU50c1lwL0E4bjRSSDd4M2kzcnZzRVJvYzZvMGM4ZWVHTmVqYVJBZTB0?=
 =?utf-8?B?cG5Eb0pNQWQ1aE92YTdia2tFWGFtM0pNTnNXYWJIZE9wNUlXSWI4R1VrN2ZU?=
 =?utf-8?B?cmpWaVNQVHlaQVJQZkxROEJyT09tTVVkencrWnBzWm5VL1Nod2RRQkliWHBP?=
 =?utf-8?B?dXVKaHBUV21vZ3VUSDc3RXV3dEppakl5Y0RKQVpydXRtTmRqTFlnRVpxVmlB?=
 =?utf-8?B?YUNSK1lGcUdsNERrRVBNeWFXRE9pUnltUWtYbEVNekNJZy9TN3B3Y3BBejNj?=
 =?utf-8?B?S0hKZTRrM21vNEREeWRYNWV6dkJHWlRhMmxKMWhvNGJZVSt6U1Z1UFhCWjhL?=
 =?utf-8?B?YnFhNklLWkpwMHowcVk3OU9OZytGdWlhcW0yL0Z6S0toYXhML0hZK1pYalpY?=
 =?utf-8?B?Z3ZqYmVGVnR6dG5WMlFhQk8yZ2p0VytjVmMzOVhJa3dVckVxYTBwOHU1UXoz?=
 =?utf-8?B?L2tBalFuWGMzOC9WVGZYY2F0WHRxU1IzYmpNTUtYd2VZeWdyVFZTQW5zWVBD?=
 =?utf-8?B?QXN3QkhDMzE3SDVYTHhoRlpwMG5hVGVxVDFuK2RzREI5Y0w3N1Budy81Nmc1?=
 =?utf-8?B?VmVFQURQYmIvakRkTHBURWlvU1ZKdy9leXFkWGZSdVliQ1BLQi9vSm9IaUhP?=
 =?utf-8?B?RU9hTTV3bisvZ3RWeVN1K09xOFBvQU5aOEExMm5GRmJFaDh0aEpKZ0RxcTgz?=
 =?utf-8?B?ejVuRjBPakxBYkNLVHAvME13WXBxVVlCaEhNVVlOWHJYT2NGK1A5bjBtTjc4?=
 =?utf-8?B?SUVWVDZ0V3F0QUxHak5YT1VWcU9CNHBHZnJwU2ZSMUNHeG1QZVFXamJiMnFk?=
 =?utf-8?B?K0toNDFQVGRDWmk3bzdJTURoTkRBZEtLalpVQlNRZks0T3o4ZjBPa0N2aDBD?=
 =?utf-8?B?VHgyMitlN3ExcElwQk0xb2ptSU5JeU1UZmRyT0Y0Q3Qwc2RjUVprMkFwRGJC?=
 =?utf-8?B?amlWZjlNbmV2bzUrelFFMlFHRWVSY2paNUhFdUFiSEZHei90aGlaa0dnT0NB?=
 =?utf-8?B?bnBQWE5wQzUxVmk4QjhyV3lwZE5iVm8wSmZHdUs4QlROUCtMbFZsYXh5Rktj?=
 =?utf-8?B?ZytjVnVKY0pqWVZmdXYvenh1ZVhRdVBjZzlLNkVUMnpzMjdPQlErRzNmdlUw?=
 =?utf-8?B?MmNxMkM2WEo5aCtsQ2k3VW4wRmdiaDlZay9VdUhTVURFZlIwYUR1UlorREpK?=
 =?utf-8?Q?FqGidIS1ypWj5lMcgAwy42xM5LQ3ESh3wXHMH0M?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyZ3Gu44HvbUjd2bKMenfkyJ+vVDg4Kee7FFOTwKWPFVKWSurzZJVx5RRHDlHX88psYPNvEqYSjiUHdLdxEkwn0JvJzfhKd5NjT5tcyzHZYCPTFISlkdQrU1wWggeyHCyMmqDAwd6zV3zvylAoYMkLbTCciHiEzcUGlTtqFsAI94fJQBSTAkpjO3ylsrnFWLiqhMVFLHNUbnRoWNw6+9ju2JE3MJfAqmpuy11+FDgOvgral05+MclANYun1OSH0vXgyb8OqS38HUB9ZgCJB+oQQdeUvb1nNUQhKlq9GgdCLmwhWmmnB1IDq53Pm8WgptWov9+Bu/PBoqlDnaJbE4pw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZM01jrKxf0xJodtyfTpC+3jCDJNbwmmfRLC9L6tY14=;
 b=gTGROrHE52FTlxFJ1Nvev8UXfuiLbZMtwzq2jwquEJorYg4UKWCCL3NXMc8v5z1K2Jl6CW4YcLlG1jT9ZH/hhrn3kuWa5d6+sQiQyvOFfC4TUJs6vuc9wWbxFlgf9ssceCZnWAXWj22gGGrX2oBTAHP3Y5HecBbWgweadgCoYN8uZ/Vki782UW0qYXdCPflS0AqNTLP7o/YGWkf31dO9TxYXcrAcndzisxdziVZthU55rFRAVfNqQZFPuEoc5mDwIpNijojRa2HWY+4uwwyRkMGa/53rkIdWZwlOIxPFfKlTzRvYv45wl8wb8ay7UJwZdWhhSFbqvvVI0KRtLV1g5A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 643baa3c-45de-4481-92dc-08d8e9c1efa3
x-ms-exchange-crosstenant-originalarrivaltime: 18 Mar 2021 03:57:22.9480 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: l0GdS2kF4ffxrV0I93g+20rP9XrFCMLVixvWgnx4PQKKEDhNFRge6pX24K7mDwV59F9V0wcnPCOLwsC1Zy3Uxg==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4454
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
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
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgMjo1NyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDE2LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbi9jb252X2VtdS5bY2hdKQ0KPiB1dGlsaXR5
IGZ1bmN0aW9ucw0KPg0KPiBPbiAyLzcvMjEgOTo0NiBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6
DQo+ID4gK3VpbnQ2NF90IGNvbnZfc2ZfdG9fOHUoZmxvYXQzMiBpbiwgZmxvYXRfc3RhdHVzICpm
cF9zdGF0dXMpOw0KPiA+ICt1aW50MzJfdCBjb252X3NmX3RvXzR1KGZsb2F0MzIgaW4sIGZsb2F0
X3N0YXR1cyAqZnBfc3RhdHVzKTsNCj4gPiAraW50NjRfdCBjb252X3NmX3RvXzhzKGZsb2F0MzIg
aW4sIGZsb2F0X3N0YXR1cyAqZnBfc3RhdHVzKTsNCj4gPiAraW50MzJfdCBjb252X3NmX3RvXzRz
KGZsb2F0MzIgaW4sIGZsb2F0X3N0YXR1cyAqZnBfc3RhdHVzKTsNCj4gPiArDQo+ID4gK3VpbnQ2
NF90IGNvbnZfZGZfdG9fOHUoZmxvYXQ2NCBpbiwgZmxvYXRfc3RhdHVzICpmcF9zdGF0dXMpOw0K
PiA+ICt1aW50MzJfdCBjb252X2RmX3RvXzR1KGZsb2F0NjQgaW4sIGZsb2F0X3N0YXR1cyAqZnBf
c3RhdHVzKTsNCj4gPiAraW50NjRfdCBjb252X2RmX3RvXzhzKGZsb2F0NjQgaW4sIGZsb2F0X3N0
YXR1cyAqZnBfc3RhdHVzKTsNCj4gPiAraW50MzJfdCBjb252X2RmX3RvXzRzKGZsb2F0NjQgaW4s
IGZsb2F0X3N0YXR1cyAqZnBfc3RhdHVzKTsNCj4NCj4gWW91IG5lZWQgdG8gZWl0aGVyIHVzZSB0
aGUgbm9ybWFsIGZsb2F0IGNvbnZlcnNpb24gcm91dGluZXMsIG9yIGRvY3VtZW50DQo+IHdoYXQg
dGhlIGRpZmZlcmVuY2VzIGFyZS4NCg0KVGhlcmUgYXJlIHNvbWUgZGlmZmVyZW5jZXMgaW4gZmxv
YXRpbmcgcG9pbnQgZmxhZ3MgcmFpc2VkLCBzbyBJIGNvdWxkIHdyaXRlIHNvbWV0aGluZyBsaWtl
IHRoaXM6DQogICAgaWYgKGZsb2F0MzJfaXNfaW5maW5pdHkoUnNWKSkgew0KICAgICAgICBmbG9h
dF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0YXR1cyk7DQogICAgICAgIGlm
IChmbG9hdDMyX2lzX25lZyhSc1YpKSB7DQogICAgICAgICAgICBSZGRWID0gMFVMTDsNCiAgICAg
ICAgfSBlbHNlIHsNCiAgICAgICAgICAgIFJkZFYgPSB+MFVMTDsNCiAgICAgICAgfQ0KICAgIH0g
ZWxzZSBpZiAoZmxvYXQzMl9pc19hbnlfbmFuKFJzVikpIHsNCiAgICAgICAgZmxvYXRfcmFpc2Uo
ZmxvYXRfZmxhZ19pbnZhbGlkLCAmZW52LT5mcF9zdGF0dXMpOw0KICAgICAgICBSZGRWID0gfjBV
TEw7DQogICAgfSBlbHNlIGlmIChmbG9hdDMyX2lzX3plcm8oUnNWKSkgew0KICAgICAgICBSZGRW
ID0gMDsNCiAgICB9IGVsc2UgaWYgKGZsb2F0MzJfaXNfbmVnKFJzVikpIHsNCiAgICAgICAgZmxv
YXRfcmFpc2UoZmxvYXRfZmxhZ19pbnZhbGlkLCAmZW52LT5mcF9zdGF0dXMpOw0KICAgICAgICBS
ZGRWID0gMDsNCiAgICB9IGVsc2Ugew0KICAgICAgICBSZGRWID0gZmxvYXQzMl90b191aW50NjRf
cm91bmRfdG9femVybyhSc1YsICZlbnYtPmZwX3N0YXR1cyk7DQogICAgfQ0KDQpEb2VzIHRoYXQg
d29yaz8NCg0KDQpUaGFua3MsDQpUYXlsb3INCg==

