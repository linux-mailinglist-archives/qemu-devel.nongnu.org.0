Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A119D315528
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:34:50 +0100 (CET)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WuX-0004Nl-81
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6673de3c3=Dmitry.Fomichev@wdc.com>)
 id 1l9Wrr-0003FB-34
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:32:04 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6673de3c3=Dmitry.Fomichev@wdc.com>)
 id 1l9Wrk-0007OI-B7
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612891916; x=1644427916;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U1OEEtYOqCZ35GxKQmJ/8KL6o1RjtpGdvEY3M3+/59A=;
 b=ERgSjGuUhDk8M70izRyhQSYqfJwLYK3DmiG0VHOY7uf927QiSk3Jrdfl
 EjpwkCFxg1WyQZd1N+IW8i4u/1kg22gIqfMV4o4x/cWw8w87SQxeg8Pka
 5B0U5CZr4tutDxMiI5faRuBY+I9p85UrqK8vrQ1QWZ/5+5s1BX342DLSt
 0HornDrR6jAAjWSZs5TZg3boUVy9wsQk1qyyrrv0ukGShsQBCyhQiF0fQ
 VitnLy82zapjrB8sQIQZbPsoEp6IVRimD9MHqc+RzFeNODK7zWwuttRvM
 NZ4JauMZ74UxoonCE3TMNBF1kZGBczYV/XOH03TCY38qBfefowzpeW8wz A==;
IronPort-SDR: SfFo3xnuycnRhVuLpfkVTkbI7cSU/vlqkABp5JzsJv8Kpb+o0HPch1XV0NY8SZcORRMMjZReeQ
 CapbJY4NefbrQBumsHQcdqXxFWm4lRLeWBC2x3QHf13vCkLSbhwIywyJNifX67NdgmJXUVFU5d
 PTe7V4WOLIXRhlO4tQAnS4jw5BP1yqDBJKKpJYJyqqx5YsI9MROotw0nJAy8Bpg6oMbj2ddXvc
 5bLAXrWdOJ93XZILDLUXxWbq1ykuOcqEPq5qUNtAqf+hPbsr2vxeTr+9g7Ns1FsH050BwQ1wZk
 hlU=
X-IronPort-AV: E=Sophos;i="5.81,165,1610380800"; d="scan'208";a="160732180"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 01:31:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR/BsTFaSG3XEsPYBe2rf8QqAdwvS7EbHA35hxG+9qrMrkKIqPkL0K1GNSdJnY+K81oKAnnEyTiwKf/XfHK9f0Yo47xMv3iuyutVX9ty4vd/pkAZaqK3DoU0jnAWt32y478wR0k40dvKF4jzh8Vp0RxnP8yJNz9G1fitdk+eD4IjUCMk0U0Edo4ApN+SN15Z8FW52DLPyN9lH7xj4+Rn0rQaWGmxhcELEMiH/CMf3BiZ2LXfi87sVWEsFqUu53ZGM5JoICVeYMcfw/+N5FQiUIMxHHfu2YAocYxP0UllocqBc53WqIzOObPtE5QxNkEXPHEaJVdkxn+q9rUF+Pd7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1OEEtYOqCZ35GxKQmJ/8KL6o1RjtpGdvEY3M3+/59A=;
 b=czRhOiJdhrVmzlPdjXjdBKeyIFjVyPPEy2nI/EeFCovYwcpjT/f+ECwbkteT1sWLuqjGhpRghxAjCQukyGbfqy17UI8BxTBaVSUNcCBJ4k5LMVvgBUUQIqSFsxxZnzHXiEamwxUmDA0qZ3rSw5q1ELJcAzJniPaXwTPJGjlF0+4JLC846NcsRTg7I41IGFQzHKhVC7zMpGTQV0K6CSqULAceE5SQDydm6ssZ4xYhiRWHDxD796D+iWRX18eK6ff0umi1Khy4ybxN7ezPEpXIpAx7clcxV5iMh4PC4fZAakZi7acmzgPZE5m22/7b9YgYWIlILJUxibhWHxux76C0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1OEEtYOqCZ35GxKQmJ/8KL6o1RjtpGdvEY3M3+/59A=;
 b=AkiEGbcVGGPAdJgmHpaaOs+tBxzcFGKupWDRYUWM0N5is/ulefXJ4A+yk1dwgRisEm/qOjc8N8a0zH6EJiisz/7ZmeCD8V1Q0g8hLUZ1BgQvQVF+UXZxxrlFC9XFmEtZ6nSWmAbEjdbnbPstKrslSkZNhsvYCRVN8dO+EhdEnhU=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB5552.namprd04.prod.outlook.com (2603:10b6:208:de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 17:31:50 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 17:31:50 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: RE: [PATCH] hw/block/nvme: fix Close Zone
Thread-Topic: [PATCH] hw/block/nvme: fix Close Zone
Thread-Index: AQHW/bH2LYBsXuclLkyfewLkyZUX3qpN9xSAgAAE64CAAG4DAIAABtoAgAAagYCAAYwJkA==
Date: Tue, 9 Feb 2021 17:31:50 +0000
Message-ID: <MN2PR04MB59518243C5C3B654C224B8BAE18E9@MN2PR04MB5951.namprd04.prod.outlook.com>
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
 <CGME20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418@eucas1p1.samsung.com>
 <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
 <YCECcyQx8oUVfNvM@apples.localdomain>
 <20210208155436.GD16360@redsun51.ssa.fujisawa.hgst.com>
 <880cbe61-9913-d26f-188f-a0b25c04219d@redhat.com>
 <YCF6t5X2udfNmJwp@apples.localdomain>
In-Reply-To: <YCF6t5X2udfNmJwp@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 870e4e08-ebb2-4d4d-ca5b-08d8cd209595
x-ms-traffictypediagnostic: MN2PR04MB5552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB55526EB77A2201B2ECAB6F65E18E9@MN2PR04MB5552.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yOEw8hAVyrUUh8hIb+SYImZ259q7JS99ZsbbF+CoW/ghzzxo7sm7S78owi2klS/JEQKeVXfXbIRpT+W9K1fXKfZR/XrXtwBSE3dH3uZGpJH0MhASCVoY49TpzV6jQeBB6tDJIXvXLlb1aAeLnIHh1n+G4WdXJ/uWOWX3khWQ75EdeO6p+kRoLI8Wje/onIxq9pC/96ujbGPnbyX5o/+utMCSDRX266CX7NkmaoU74S1j1pavbdeG9C7tS7ID9+/Pf5tn8uBGCv7DaMevIdQqogcPCLljdBCGGO0XwxoIBsmxHyDzqCcWhY5EyVmYAvve4KW9IwBI5OJvLKPSzd2XCdoi8dR8g6U8S5qsWdTfxl0Viv86NtUM7AcOKG/q9EjNeQIOW39EcQyHsCQKEXcrNCpFZzdPYNO8k5TuH1+1T8AMhRyMaWyFDHiAkOHhcd00dL23nvmX4Tfd5bJv4P8cuqEmv1EvZ2WoaCIEvnd6rIL/U3DzuoHNkuviG9pfX7yRS7haiNH+K0G7SaNZdgDwcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(7696005)(83380400001)(186003)(55016002)(52536014)(478600001)(26005)(4326008)(2906002)(53546011)(6506007)(9686003)(316002)(5660300002)(110136005)(64756008)(66446008)(54906003)(66556008)(66476007)(66946007)(8676002)(8936002)(71200400001)(86362001)(76116006)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bDhmYkJKZjBkdXI2azNRSjE3cGUwa3lhZnN1Vlk2SzYrQXNVZVpMbGx6bURC?=
 =?utf-8?B?MmJoSTRIUlN5U2VVVEVJMS9xVGl6blFDL1MwMzF4U3QxeUdTbEZvdWRKcUt5?=
 =?utf-8?B?QUVLS2xENFBPTXdVczBqZVdjY29RRW1pT2piS2hBT01kV3lQdlZObFdMOWJa?=
 =?utf-8?B?KzQrcVFLbGw0eFhadEpsc1l6R3pWU2c0R0hTY29yZHJZbklsUmtWK2xCMVNx?=
 =?utf-8?B?NkFwUGhDMHZxTzNaQWFtUkZmZjNNQmdROE1OTkFrUy9wcnJWVUxITmw5UXJh?=
 =?utf-8?B?eEh0UGtXMGVFTzFhbzlReTRYenlQc1MxK3RjUUdlQmdoOTc4cUw0d3RDZzMw?=
 =?utf-8?B?Q3I1aGVTV0tNcWljVnNDUlBZUmhRL0hpaWoweHRxRHdxbExiMmtaUUVXVEQv?=
 =?utf-8?B?YU4vbkZuNHdIbFZ2UHNqRTVaU1hxUzhZd250bHNPSVFqcER2MFBZSTZSeXNr?=
 =?utf-8?B?aEdmSFF3VU96VmxSUkJWMW5sZ3lGUTN5STdhaTQwZUhFUE5sYnlnTEhtVnFK?=
 =?utf-8?B?NkpMcUhEa2hGZDBnVU9QdkhsOFNqQ3hzQmxsT3FTUnUzZjkyclVnVVRWL1F0?=
 =?utf-8?B?dXc2UzZMbWlvclRabjZXcjIzMFN1N09RWWJUcmVvWWxoWS9DQzhhWnBNcS9C?=
 =?utf-8?B?YzJmU3Jac252UGU5RnAxRlA5LzhLblhCYTJqb2l1VVh3ejRoalE0Q1c5N1Zm?=
 =?utf-8?B?Q0ErNElDZkduRTh3SEM4ODhEQTFoK3BONFhLaGZ6Q1VZbHFsYldNQkpXNEpC?=
 =?utf-8?B?T3JSemxXOUE2My9qallRdjVnNmVxR0I5YXN3dm5hVWZHdWYwOUI5RTJYL2F5?=
 =?utf-8?B?UTI3UXIxWVRMTmZDYThOUktZaXk5anpRVjR4WEt4Tzd5VGhVbVYxdWJhU3Iy?=
 =?utf-8?B?eFpTVUFwN2JoRXBUY0dYOWU2ZHFqSFdsMitYdHA0SGMwVmR1NldVQVZpVGRL?=
 =?utf-8?B?aXdTdnR5UWtPMkFwcDMvSGt4RjVGaEZnYjNPczJwRTdjRjFPVnB3cXljTXdB?=
 =?utf-8?B?MG5hRXZucERNdzNaSWJVeHMxYVNNQ0s1clFlRHJFMHZMRUNsV3Ezb0Z3QWVL?=
 =?utf-8?B?RmdBRkpJM3U4a0U4aE9YVDBmTy9PQ3RVZWxtRTJUMHJTMkxRZWhEdTh6SWlY?=
 =?utf-8?B?TVZHVnVjTEx4bmxsWGhQdmhIbVJOTUtnYzBoRjc1U3dWdG5vRjFQYk95VVQ1?=
 =?utf-8?B?UlMyakhCRkV4WlVtb3ZzMlRGU0JIaHpxZ1ROWWhNL2o2ZW44ODBadExZWEVZ?=
 =?utf-8?B?eUJ0cFhFeXhoOHgrT0ljMklFbzdxTjRRM3FVa0RXNnZlNTdwemtiUkhjUjdD?=
 =?utf-8?B?d1pLSmY1ZVFrVW8xOFI1M3hsN2NkSkcwOE5WVXVpRHZtQWI3SjllNktnM1N1?=
 =?utf-8?B?NDNwMmpuN3lUWVZSOWJ1dStWanJVdlFiWURlbVpIdHdsZFpYYjVGNWxiUUZZ?=
 =?utf-8?B?U1h0ejlHeXIwUzdyak01d3RGV2haU2twZ1dDeVFlT1pIalIzRjU2RS9nV1VF?=
 =?utf-8?B?cmdDWW5JaHR3bnFWS3hoVWFBVUFZcXM4NEwvbDFTYlpuWGEwNVdRWHdwU2ta?=
 =?utf-8?B?aDFwN1ZqSEhzeUk0c0N5b1d1bUYxYVdTTVJxb2RSSTNTaWRBbVQwVlBSYVNp?=
 =?utf-8?B?b0p3NlRzUllwaXc1WkNqbG1DOS9HamFhZmMzVHNrMDZoZFRzTlI0YUlVUElr?=
 =?utf-8?B?N1I1TFhqUFhaYWZzRlMvL1FSb3JLc1pzcjNZMHJIaFVFSzQwczBYNEFCc1c5?=
 =?utf-8?Q?z3CN4r65vHOTJaEmg8E13VH8wKmuFQXzOxlu5Z9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870e4e08-ebb2-4d4d-ca5b-08d8cd209595
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 17:31:50.4015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WA+Jc3OINVxBvJ3B59EKgrwYTjYNKCiaBjyQobpFvOOlhOwHHZAaoQJTEacUCjv4FavUqciUwe030kcVlPOWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5552
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6673de3c3=Dmitry.Fomichev@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLbGF1cyBKZW5zZW4gPGsuamVu
c2VuQHNhbXN1bmcuY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDgsIDIwMjEgMTI6NTQg
UE0NCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4NCj4g
Q2M6IEtlaXRoIEJ1c2NoIDxrYnVzY2hAa2VybmVsLm9yZz47IERtaXRyeSBGb21pY2hldg0KPiA8
RG1pdHJ5LkZvbWljaGV2QHdkYy5jb20+OyBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPjsg
TWF4IFJlaXR6DQo+IDxtcmVpdHpAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
TmlrbGFzIENhc3NlbA0KPiA8TmlrbGFzLkNhc3NlbEB3ZGMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBody9ibG9jay9udm1lOiBmaXggQ2xvc2UgWm9uZQ0KPiANCj4gT24gRmViICA4IDE3
OjE5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gPiBIaSBLZWl0aCwNCj4gPg0K
PiA+IE9uIDIvOC8yMSA0OjU0IFBNLCBLZWl0aCBCdXNjaCB3cm90ZToNCj4gPiA+IE9uIE1vbiwg
RmViIDA4LCAyMDIxIGF0IDEwOjIwOjUxQU0gKzAxMDAsIEtsYXVzIEplbnNlbiB3cm90ZToNCj4g
PiA+PiBPbiBGZWIgIDggMTA6MDMsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiA+
ID4+PiBIaSBEbWl0cnksIEtsYXVzLg0KPiA+ID4+Pg0KPiA+ID4+PiBPbiAyLzgvMjEgMTozMiBB
TSwgRG1pdHJ5IEZvbWljaGV2IHdyb3RlOg0KPiA+ID4+Pj4gSW1wbGljaXRseSBhbmQgRXhwbGlj
aXRseSBPcGVuIHpvbmVzIGNhbiBiZSBjbG9zZWQgYnkgQ2xvc2UgWm9uZQ0KPiA+ID4+Pj4gbWFu
YWdlbWVudCBmdW5jdGlvbi4gVGhpcyBnb3QgYnJva2VuIGJ5IGEgcmVjZW50IGNvbW1pdCBhbmQg
bm93DQo+IHN1Y2gNCj4gPiA+Pj4+IGNvbW1hbmRzIGZhaWwgd2l0aCBJbnZhbGlkIFpvbmUgU3Rh
dGUgVHJhbnNpdGlvbiBzdGF0dXMuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gTW9kaWZ5IG52bV96cm1f
Y2xvc2UoKSBmdW5jdGlvbiB0byBtYWtlIENsb3NlIFpvbmUgd29yaw0KPiBjb3JyZWN0bHkuDQo+
ID4gPj4+Pg0KPiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnku
Zm9taWNoZXZAd2RjLmNvbT4NCj4gPiA+Pj4+IEZpeGVzOiAwNTNiNWEzMDJjMygiaHcvYmxvY2sv
bnZtZTogcmVmYWN0b3Igem9uZSByZXNvdXJjZQ0KPiBtYW5hZ2VtZW50IikNCj4gPiA+Pj4NCj4g
PiA+Pj4gJzA1M2I1YTMwMmMzJzogdW5rbm93biByZXZpc2lvbiBvciBwYXRoIG5vdCBpbiB0aGUg
d29ya2luZyB0cmVlLg0KPiA+ID4+Pg0KPiA+ID4+PiBJZiB5b3UgcG9pbnQgYXQgYW4gdW5tZXJn
ZWQgY29tbWl0LCB3aHkgbm90IGZpeCBpdCBkaXJlY3RseQ0KPiA+ID4+PiBiZWZvcmUgbWVyZ2lu
Zz8NCj4gPiA+Pj4NCj4gPiA+Pg0KPiA+ID4+IERtaXRyeSwgeW91IE9LIHdpdGggbWUgc3F1YXNo
aW5nIHRoaXMgZml4IGFuZCBhcHBlbmRpbmcNCj4gPiA+Pg0KPiA+ID4+ICAgICBbZG1pdHJ5OiBm
aXggYnJva2VuIENsb3NlIFpvbmVdDQo+ID4gPj4gICAgIFNpZ25lZC1vZmYtYnk6IERtaXRyeSBG
b21pY2hldiA8ZG1pdHJ5LmZvbWljaGV2QHdkYy5jb20+DQo+ID4gPj4NCj4gPiA+PiB0byB0aGUg
Y29tbWl0IG1lc3NhZ2U/DQo+ID4gPg0KDQpTdXJlLiBJIHNob3VsZCBwZXJoYXBzIGhhdmUgYWRk
ZWQgQmFzZWQtb24gdGFnIHRvIHRoZSBjb21taXQuDQoNCj4gPiA+IElNTywgd2Ugc2hvdWxkIGF2
b2lkIHRoZSBoYWJpdCBvZiByZWJhc2luZyBhbmQgZm9yY2UgcHVzaGVzIG9uIHN0YWdpbmcNCj4g
PiA+IHRyZWVzIG9uY2UgdGhleSdyZSBwdWJsaWMuDQo+ID4NCj4gPiBXZWxsIEkgaGFkIG5vdCBp
bmZvcm1hdGlvbiB0aGlzIHBhdGNoIHdhcyB0YXJnZXRpbmcgYW5vdGhlciB0cmVlLg0KPiA+DQo+
ID4gSWYgeW91IGRvbid0IHdhbnQgdG8gc2VuZCByZWd1bGFyIHB1bGwgcmVxdWVzdCwgaXQgd291
bGQgYmUgdXNlZnVsDQo+ID4gdG8gYXNrIHRoZSBOVk1lIGNvbnRyaWJ1dG9ycyB0byBwcm92aWRl
IGFuIGluZm9ybWF0aW9uIG9uIHdoaWNoDQo+ID4gdHJlZSB0aGVpciBwYXRjaCBpcyBiYXNlZC4N
Cj4gPg0KPiANCj4gSSdtIGp1c3QgYmVoaW5kIG9uIHNlbmRpbmcgYSB0aGF0IHB1bGwgcmVxdWVz
dC4gSSdsbCBkbyB0aGF0IDopDQo=

