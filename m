Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F9379C5E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 03:59:32 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgHgJ-0003f5-Ca
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 21:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lgHf4-0002xj-P3; Mon, 10 May 2021 21:58:15 -0400
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212]:12789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lgHez-0006SU-D1; Mon, 10 May 2021 21:58:13 -0400
IronPort-SDR: rnGhj09ZoHbpeFt//Sp43+IzaXOKHMVQCs0nD6dEEtgchrleCCIgcRiDyAqF7MTv4qqYLk3IQN
 1H86RfHkCDKNpnmnEOoSXySiFY7gWq7812wn+c9ige9UDPGpl8CwgVFeXR9n32bZ3RijuE5+4f
 bfln7nCDrWoEHpNMCUY+9lbs7oZkwkN0i8Th7+6DsL+0ENGiBZmJ8Gb48vxF+pCbsLO0QAl0QB
 blqv5khVhhGVIK1YoQDVKjk/QmPd2M6O2d283BG0Fmd6EunK1vJVNRetcebn3MbLkKtRuZCAHm
 ux0=
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="39174288"
X-IronPort-AV: E=Sophos;i="5.82,290,1613401200"; d="scan'208";a="39174288"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 10:58:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1s2ll6x821hhOSPDY069qV7bXZylWMbINeuXdyOngI37xtujZ/Z1JWKwp6cTY06xDY2y2UTnsrYmMnVDMpUDIbvhQMnIsF2DjQNjs5WrfnwTysb35NZmA6GXHIuCqKXZPsjiLcSvakNlBNwT5E/1MSD3dri3+JlpRXMm/yuCU98TgQ5pqSar6upir8AozReqOzgn464mo7m0AwgHJ6S97dSllRN7foxGMxMK2lLc9r4EYjVJDuVNy/qw7/kztPrJX/dmtkO7AgQF6ucSXtoKN9l7WhGnPK/hCKHkBO+LefjJF6y8CDU7mmaEtG77St6Qk/AQMBSdo3Wq2Ei484eMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4UemW2NlD32KDG4/eD8Adn6VX73X+JH2vLkpFvLDg0=;
 b=NZOkMBscm3KsicGYffRTgPNINjpZnWideAbRnhepLksOZQG1Zy/2Tlz2gqX7jGg/UIehRx7MLT9EBZSBaWflmXQSZIeZcMATsX+lnVDuHfQawO4Rnk2YrAQ4JlnW6HHeOda133FYK9jT2oMEP7aVmDyUL9SvjAk5qnIJuJQ1Ng2Hw0SROAj8PqFtxYXmxqNOoP3jN/awJIyky+s9+SjWc51iOAFSLjYSMhmnQm38ZRnUgzs2FhQd6Siy8U4Fvzd60fBBT3doa7unq19Rv6DZ2A4Z8EySF/X7v2Imkjf3t1LoDWrrlMnFI2VyPd3JdItEXw4RZ6wGlh54f+/F62zPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4UemW2NlD32KDG4/eD8Adn6VX73X+JH2vLkpFvLDg0=;
 b=doXRg7Fq/87GOch3FMGJXbfL6YYzSQSsmPaSz2Sy3+LUKwCmcT0QVS9lhCnTqyXYaS3jmTypPH2V0fxAvlTkM7LzD0O73JAYw6CDjbY8sAtdaSZ8XvuaGYLC/GPHGrlLWmLPWnnyKfrSndJtCh7fTapNm1IPI6HPzcJgupruORU=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB5643.jpnprd01.prod.outlook.com (2603:1096:404:8057::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 01:58:01 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239%5]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 01:58:01 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: Re: [PATCH] block: Improve backing file validation
Thread-Topic: [PATCH] block: Improve backing file validation
Thread-Index: AQHXRVVQk6KVFl5E6UmjXQWAgUlha6rcZe8AgAEhf4A=
Date: Tue, 11 May 2021 01:58:01 +0000
Message-ID: <05844308-4078-f092-ff1c-4b9f7705ab2a@cn.fujitsu.com>
References: <20210510043045.15238-1-lizhijian@cn.fujitsu.com>
 <YJjxqqqEMwpyNB8y@redhat.com>
In-Reply-To: <YJjxqqqEMwpyNB8y@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23bd2410-0d4b-49d7-ed90-08d91420351b
x-ms-traffictypediagnostic: TYAPR01MB5643:
x-microsoft-antispam-prvs: <TYAPR01MB56434792532EFC82723E7DB5A5539@TYAPR01MB5643.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yhRZ2sneF3dfbwO7WAf/4F4pRX3PFS+XL5XnLYxMjQXg0JdxFkdqFEQ1KPtatjA6pwpSuiTHdzpKQ88w/Ub3aXAOUCFRZCSU8yarBmC7F/uBgIIzg4YNvazvcPpkyYZV4hTQ/ZQ1JqyZWxXcELN+laEPx2Z0wLxGHNNq35URiI0XdVJDihr1W88Ms9+cHX5bCrDsjzwJdgwSnOgweFfbu0RJT80WR124kNpvlZbnpFhkoUO1B0zL3pYS+AyPc7quVlpmCqrrwPoGISx/oFCXFQSDSyOp1s+NDwXVJRcQ+r7sQfkOv3AFcD9fKtKHhyRx5CedYcmcC3YEaAhXgDFAsB1kghMkp+VHPMp1gaVqy9aFntA79GTK5HXeOopf1S802ehPX9JMhRa/OjOM2JlI01hNC3AGUI9XdmPgp2A3L/PyLAoaf7s1hwbaaqJpiWdzeHeXPQlPVpQ1KJZCXOmDoO0oQvYGYNCtDlYf5f5rHhYQgVTvsqUyIx8b6pghrRsFXodDoQTfB8D6NNE1RfEvVAfDiVOZGfUkNL8vmtYUr4pgrgTepJfkVtYzwRB7xWl86r/sd/vjUvQDSFMhMydbNAwVeYc0RzDVmZsPjom2hac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(66946007)(6512007)(6916009)(54906003)(66476007)(76116006)(91956017)(26005)(66556008)(4326008)(6486002)(83380400001)(8676002)(66446008)(8936002)(6506007)(316002)(31686004)(186003)(71200400001)(38100700002)(53546011)(122000001)(31696002)(86362001)(478600001)(5660300002)(2906002)(85182001)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y0Vmd0R3ZmMxMCtYam9Pb0wrYmV4R2RpaFpzSllWTHpodmJKbFNjSXY3bExr?=
 =?utf-8?B?eXJib1RPaEFIRG0rOUZlQ0oxQ1AvVDA3TVZOMHFEWUoyTlEvSm5qbmZ6S0x4?=
 =?utf-8?B?Mk1scU5Ud2ZtZmIyemNyNXZMdU5kM0hXQ1Fhek9XM2MwYVFaT1NiQ3NZT0Fm?=
 =?utf-8?B?UGhYdDh0Q2Q4bnJSZ0MzUU9VVjRHUm10cEREYWM2QlZTSFQ0R283NWRSdFM0?=
 =?utf-8?B?SnJXVGRBSGxrT1QxL2hzZitiRDV4Q0k0aE13ZFQ0ZVcwalRjVGV2SiszTlFl?=
 =?utf-8?B?ZEc0Sm5xZ1J2L2VCTU8rL2FRaUxCeVVINkpZVUVvOXlvN3NCaDZvWHR3UHYz?=
 =?utf-8?B?UlBnTzhuVDVuZlpXcElnaWdqaVFDYUpqV1E2UEVpK3EzVXZJMHlwUmVBWGdC?=
 =?utf-8?B?R05lODhqVDVWN25xM3dJSmdmMkJVanEyTG5haGNPUzFpbUsyTWF4NUlPNGcr?=
 =?utf-8?B?THhSRmovcGZCRDFlaWNKSGp3aTRKa1JKZW9Wb3FGTHBzYXRvSTZwTm53SkFX?=
 =?utf-8?B?UUNTeUE0U3BvQlBiS2d0VTZ4a3U3QnB4VkNBQ2RxY0pjMG5JRHM3TW5yVDVo?=
 =?utf-8?B?K091alFiZ2RoZ3NJSUcxQ3NIdnBIajdCbGFJQ0ZFN2NJUzUwR0FNcUlFWlRS?=
 =?utf-8?B?am5qSXBNWUZyZUZuUWd4L0t4K3hYR1JtUUJzZ3NNSVJMa1BFT3VBU0xLQ0Nu?=
 =?utf-8?B?Z2p3bVIvOWVoQTNUUmVkRkVvcUQ0NzhLQ1JDMzQxZVpiamdhVFZYL00xbDZO?=
 =?utf-8?B?NTIvL0l5VXYreUV5RWRuM1ZxTE4zdVpxSHI4U2dGbVlvbndlKzUzOVdaelZS?=
 =?utf-8?B?NHRWUUxuUUp0eHNBTnlHMlByV1UrZlZwS0pYUmJCczliaFoyTXUzOFR5azJ3?=
 =?utf-8?B?RzJrbFZEMnJ5SGw4cHVFTzB5NHQzc0JkckJZcVJqMTh4dnp4Uk1SM0w5ZlYx?=
 =?utf-8?B?TUR0cWJEQ2xXRmdVRGlIbFR0blczL0M5SktSbkRlZEpSQ2VuTGdtRHBna1U1?=
 =?utf-8?B?R0Q5Z1B6a1NGMEQ0ajMyZlZyeHEzSG13enpOdzFBL3IrMkREamxtT1JING1o?=
 =?utf-8?B?MW9BakFLbExBbXA4T2NTL203cG5mUnN6WWsyOTl2VU42MzN6U2IwV09iaENx?=
 =?utf-8?B?NE5TbWZmRmVHRWt0T1hrT2FJUkJOeEdJTGxWelQwNjlJeXJRMDdhUHA4UnVF?=
 =?utf-8?B?QURPMHFDekZFTWpVemQvRHBRVlA1TFFiME1RZmZCUjRUT0kwZlFxNXJnVGp3?=
 =?utf-8?B?REhyVVVBRG1MZC82eDQ1LzRIQzNOaTFtTTVsdHFqalBaZjNxNU5nTTB6Um5o?=
 =?utf-8?B?RTJ6d3UrTUNHYS9POHZUcm5SMnlBQTYzcWtaaE9YRENxNzJKWTNmL3RIRWRh?=
 =?utf-8?B?USthQjhsd01SVVFnTGdrakc1eWpuZjdmMjlXdHl5YXl6ZlB5dTFKSTZzK1Zx?=
 =?utf-8?B?bUo0MnFqNHdQSW5pZy80OTYycCtlR1M3eTNKUzNnZVIycnptaGhZTnVsR0tU?=
 =?utf-8?B?YU1oN05SYTVQdUYxSHdhd051T0ZyMVpJckhEVzlBMkxYYytkQ21NZzJYelFF?=
 =?utf-8?B?NHRaaDJyVjRtMUtiUzdFSGtacGNQV2dUbno2TGpNYWQ5ZkpRNGcrdll3V2sv?=
 =?utf-8?B?NkpVZXgrVExTbG1NNHB4TnNpdWdkWDFGUXhmdCt6T1dFVEI1UTRHTGFnRGFF?=
 =?utf-8?B?MWJITmhqWVVoUGduNDNOZzhzWW5hRGJEZ2l4YWsyUVptcCtiUmRoQmZtYWVw?=
 =?utf-8?Q?0SMe5eWMdVszUek43HOHWpib3W9hZWWu4zrk0aL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C2E6DD017A2C142A80DE60E5E59A00A@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bd2410-0d4b-49d7-ed90-08d91420351b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 01:58:01.0978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UV4WzC7xV+8RvF+t8JivYadKq+xpEWKJFQIGRv5jPqGWC7PFGu3rTHDsK06gP4o9+UKj9SjjQUnAdAe474w0/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5643
Received-SPF: pass client-ip=68.232.151.212;
 envelope-from=lizhijian@fujitsu.com; helo=esa3.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpPbiAyMDIxLzUvMTAgMTY6NDEsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+IE9uIE1v
biwgTWF5IDEwLCAyMDIxIGF0IDEyOjMwOjQ1UE0gKzA4MDAsIExpIFpoaWppYW4gd3JvdGU6DQo+
PiBJbWFnZSBiZWxvdyB1c2VyIGNhc2VzOg0KPj4gY2FzZSAxOg0KPj4gYGBgDQo+PiAkIHFlbXUt
aW1nIGNyZWF0ZSAtZiByYXcgc291cmNlLnJhdyAxRw0KPj4gJCBxZW11LWltZyBjcmVhdGUgLWYg
cWNvdzIgLUYgcmF3IC1iIHNvdXJjZS5yYXcgLi9zb3VyY2UucmF3DQo+PiBxZW11LWltZyBpbmZv
IHNvdXJjZS5yYXcNCj4+IGltYWdlOiBzb3VyY2UucmF3DQo+PiBmaWxlIGZvcm1hdDogcWNvdzIN
Cj4+IHZpcnR1YWwgc2l6ZTogMTkzSyAoMTk3MTIwIGJ5dGVzKQ0KPj4gZGlzayBzaXplOiAxOTZL
DQo+PiBjbHVzdGVyX3NpemU6IDY1NTM2DQo+PiBiYWNraW5nIGZpbGU6IHNvdXJjZS5yYXcgPDw8
PDw8DQo+PiBiYWNraW5nIGZpbGUgZm9ybWF0OiByYXcNCj4+IEZvcm1hdCBzcGVjaWZpYyBpbmZv
cm1hdGlvbjoNCj4+ICAgICAgY29tcGF0OiAxLjENCj4+ICAgICAgbGF6eSByZWZjb3VudHM6IGZh
bHNlDQo+PiAgICAgIHJlZmNvdW50IGJpdHM6IDE2DQo+PiAgICAgIGNvcnJ1cHQ6IGZhbHNlDQo+
PiBgYGANCj4+DQo+PiBjYXNlIDI6DQo+PiBgYGANCj4+ICQgcWVtdS1pbWcgY3JlYXRlIC1mIHJh
dyBzb3VyY2UucmF3IDFHDQo+PiAkIGxuIC1zZiBzb3VyY2UucmF3IGRlc3RpbmF0aW9uLnFjb3cy
DQo+PiAkIHFlbXUtaW1nIGNyZWF0ZSAtZiBxY293MiAtRiByYXcgLWIgc291cmNlLnJhdyAuL2Rl
c3RpbmF0aW9uLnFjb3cyDQo+PiBxZW11LWltZyBpbmZvIHNvdXJjZS5yYXcNCj4+IGltYWdlOiBz
b3VyY2UucmF3DQo+PiBmaWxlIGZvcm1hdDogcWNvdzIgPDw8PDw8DQo+PiB2aXJ0dWFsIHNpemU6
IDIuMEcgKDIxNDc0ODM2NDggYnl0ZXMpDQo+PiBkaXNrIHNpemU6IDE5NksNCj4+IGNsdXN0ZXJf
c2l6ZTogNjU1MzYNCj4+IGJhY2tpbmcgZmlsZTogc291cmNlLnJhdw0KPj4gYmFja2luZyBmaWxl
IGZvcm1hdDogcmF3DQo+PiBGb3JtYXQgc3BlY2lmaWMgaW5mb3JtYXRpb246DQo+PiAgICAgIGNv
bXBhdDogMS4xDQo+PiAgICAgIGxhenkgcmVmY291bnRzOiBmYWxzZQ0KPj4gICAgICByZWZjb3Vu
dCBiaXRzOiAxNg0KPj4gICAgICBjb3JydXB0OiBmYWxzZQ0KPj4gYGBgDQo+PiBHZW5lcmFsbHks
IHdlIGRvbid0IGV4cGVjdCB0byBjb3JydXB0ZSB0aGUgc291cmNlLnJhdyBhbnl3YXksIHdoaWxl
DQo+PiBhY3R1YWxseSBpdCBkb2VzLg0KPj4NCj4+IEhlcmUgd2UgdmFsaWRhdGUgdGhlIHJlYWxw
YXRoIG9mIGZpbGUgaW5zdGVhZCB0aGUgaW5wdXQgc3RyaW5nLg0KPiBUaGF0IHN0aWxsIHdvbid0
IGhhbmRsZSB0aGUgY2FzZSB3aGVyZSB5b3UgdXNlIGhhcmQgbGlua3MNCj4NCj4gICAgJCBsbiBz
b3VyY2UucmF3IGRlc3RpbmF0aW9uLnFjb3cyDQo+DQo+IFRvIHByb3Blcmx5IHZhbGlkYXRlIHRo
ZSBzY2VuYXJpb3MgSSB0aGluayBpdCBpcyBuZWNjZXNzYXJ5DQo+IHRvIGlnbm9yZSB0aGUgZmls
ZW5hbWUgc2VudGlyZWx5Lg0KPg0KPiBJbnN0ZWFkIGF0dGVtcHQgdG8gb3BlbiBib3RoIGZpbGVz
LCBhbmQgaWYgc3VjY2Vzc2Z1bCwgZnN0YXQoKQ0KPiB0aGVtIGJvdGgsIGFuZCB0aGVuIGNvbXBh
cmUgdGhlIHN0X2RldiArIHN0X2lubyAgZmllbGRzLg0KDQoNClNvdW5kcyBncmVhdCwgaSB3aWxs
IHVwZGF0ZSBpdC4NCg0KVGhhbmtzDQoNClpoaWppYW4NCg==

