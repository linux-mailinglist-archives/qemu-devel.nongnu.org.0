Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963354530F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:34:50 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzM3V-0001Mu-5z
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1nzL9C-0000aO-7R
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:36:41 -0400
Received: from [210.61.82.184] (port=46572 helo=mailgw02.mediatek.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1nzL98-0004ar-G4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:36:37 -0400
X-UUID: 80b5302153804a32885ab8a2993ece74-20220610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:2e851970-ef08-42f6-aba3-9fa1b940d4c0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:965bd27e-c8dc-403a-96e8-6237210dceee,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 80b5302153804a32885ab8a2993ece74-20220610
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <vince.delvecchio@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2065137533; Fri, 10 Jun 2022 00:31:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 00:31:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 00:31:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4CTc6TQqkaV55h2D931WSnUHIJfBap5Lfp4wF/CO+L5pNGzhadYdwQNI75U8JsKwKxHOcO7wU3QqZ+MkeB+lnOaDgpMYaaOhxrsV0AaIXEYRcVXI2oYHMY7t66vLeBnI0PAA8nIAvpRgpJRAUktLvx5qGVeCRVLBj/SG+J1Tgyc12byTc2S7c0i2A4AfpcSh78qDkX3pUvmchG1IpTEky8gPX+3gYuHSv3cOCrR9XrWUo1jW9RCDxZeOnMqmwTDKH+7ZkwpYRqWdjLnSXxFqCRqqI0otV6USw6suqEmfJohjoEECWBa+ty5P5ZqOAZd+Yd6kAQzv+ylHgvHrEEvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdfugNC0045m+6TrWmtuAzXrUxVrRYN5S3NqnFA5zE0=;
 b=ihKWQPDwWDSVo5Hji+EPpxfGCBhTvpCgAnp2F4hCD39KGh2GV9epZogys0N8BDakbn0ANR9vDihbC+k5kr+EP2bMgSyFsEwfP9M0lEQhu6dkGnRMMSAamNHYRjzbFaplgf615vWOjejqfZrO+53dzaG5QurK7eqfvCqaV6Tu2sC5AGJeN2JrcN4+Mgame7DjIhIUCQio7B0zuaVjxR6QGD4UsaulXvAS/iO9ApuvTycMIa0gZHkj8EQ2nvjWYdaF+svk7Ee/bwykM4mderc0gvMFvy5nME0dE44rO9q5yxi0xynN/2n9PsA06GwFrvO3uh4xqDZDpivaDaNEdl5lOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdfugNC0045m+6TrWmtuAzXrUxVrRYN5S3NqnFA5zE0=;
 b=vrEv8oYNz7vQFhaYuvLU3M3M5PH/KxF1e3sAMfGWMUlc5JakyQP/0gJ6+wN3iGNKf3wMU+p4cu1PyZesUHiw9jhiW+YZZ6uNj7ZF2brnkSTBwoJtxzD9ARF4ccri/Rr3EMfe3r1GvBBpzRLm0iBfhnp6QRRdJiN1YnT8zcdA2yg=
Received: from TY0PR03MB6797.apcprd03.prod.outlook.com (2603:1096:400:217::10)
 by SL2PR03MB4553.apcprd03.prod.outlook.com (2603:1096:100:63::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.5; Thu, 9 Jun
 2022 16:31:15 +0000
Received: from TY0PR03MB6797.apcprd03.prod.outlook.com
 ([fe80::545b:f2a0:1ffe:b8aa]) by TY0PR03MB6797.apcprd03.prod.outlook.com
 ([fe80::545b:f2a0:1ffe:b8aa%3]) with mapi id 15.20.5353.005; Thu, 9 Jun 2022
 16:31:14 +0000
To: Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 "Stefan Pejic" <stefan.pejic@syrmia.com>, Dragan Mladjenovic
 <OT_Dragan.Mladjenovic@mediatek.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Stefan Weil <sw@weilnetz.de>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Matthew Fortune <matthew.fortune@mips.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, Stefan Pejic
 <OT_Stefan.Pejic@mediatek.com>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: RE: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
Thread-Topic: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
Thread-Index: AQHYfBI/QCye1FBZfUmQze3MaR2McK1HNwuw
Date: Thu, 9 Jun 2022 16:31:14 +0000
Message-ID: <TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com> <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
 <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
 <4d58f632-df78-b709-37b8-f7d86ae536f6@redhat.com>
In-Reply-To: <4d58f632-df78-b709-37b8-f7d86ae536f6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrNTAxMjdcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05Mjc4YTU2Zi1lODExLTExZWMtOGUwMC05NGU2ZjdmNmRlYjBcYW1lLXRlc3RcOTI3OGE1NzAtZTgxMS0xMWVjLThlMDAtOTRlNmY3ZjZkZWIwYm9keS50eHQiIHN6PSIzOTU2IiB0PSIxMzI5OTI2NTg3MjI2NjM2NTciIGg9Im5aUzVGMTdZbitJVkVRTDdOdkUzSDkzNVhRZz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3eb6d743-d157-434b-ff81-08da4a3578ee
x-ms-traffictypediagnostic: SL2PR03MB4553:EE_
x-microsoft-antispam-prvs: <SL2PR03MB455321D92E644D9C69E18189E2A79@SL2PR03MB4553.apcprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0n0ianAVxrPdZqFx4emzXgtSTriot5T0LI2N+lmrP7eM02WuTQW4N7ZbZX+J2gZnNfY7H7SqfFYnWkU02E98UnWrXvjtDHjLhAgaQSwIxKMa8j88OuR75NMwEgClD3PVWGBSFwa1RorM9XcF9CQHNk406z62U4gySMSypHPbdQbhkbHFRVKdRyqx/bT2UlraOc2/RnnT7zL/1XtjLvX/pPPDyFKheBKC3+w+6z148sLjpJ+9FQiM/DP7LgbP5+X7DOMFsy9FkSAmaZi2au8hAf1VTM+vHEEgPeGpaT+O3gAKMgKjcz4ULemJa6nFq/WQUq5hFLba8qIc/0jtmK95vm4ueNr22nqGil5RmhWoVaa/ltzuGmMMV1Oz8ZTN2c0d53JiwsLF4jpyWKUAQ/x8kHBcjfifdLCVuPw1hpHLhorqN/KmJq8Yk4CaCVQi7iqWoZ4kHIdLgg6envKS2XuG8tX4DhI38Dx9gsBoElRaVpMDNNQuVH4TggG6ggx12q5XvZm9TuTjn/pFtKxrKimeYl+4SzNd3ZJpVQj4CD5M84yqNPIT3u1WWsyrb7fyU04HVy2RPd/afBAsoSsAJrii91oIqlkVaQ+99w3ogl4RJOKaDuMyiaa+fBq0rwdNbU/1fq+lfDB0yv6HE1HN4UnV1Uy4LbbZ8eiFs9uOEiLO+uUGT4/fZJC+lRwyPuVH/zvOF6UDMqug9Xb66ohIHqsFBZHx9ZHyYo8XuMZgCof5/oYQxpysLR0goPrc486wG2Gw8V/frMKOs9CKYne/xZxvuG9NbnGGdCoUCS9UCEuZ1RTwNfbj53kg6cGOEuuYObp/I1Y4CdG6stQyxXqFH2eJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6797.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(66946007)(8936002)(7416002)(5660300002)(52536014)(33656002)(71200400001)(122000001)(64756008)(66446008)(66476007)(76116006)(8676002)(4326008)(6636002)(316002)(54906003)(38100700002)(110136005)(66556008)(9686003)(53546011)(26005)(7696005)(6506007)(966005)(86362001)(38070700005)(508600001)(186003)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjVhZlNvbHFjazk5V1VIbWpGUXdxMGsyWGV5TUFFK0FSdEExaElpdDRadFlJ?=
 =?utf-8?B?K05DYW96U2JGMHlEa0dNT1ArWnpXYnVuMWtZUFZ4M0ZpKzVrU3VSdFBYdWdZ?=
 =?utf-8?B?UXBTSGFXY2NQdXZlcHZjdUxidERvbnUxYzB1TTF1Ny9nQTVrcWtqNEVMbkt3?=
 =?utf-8?B?QmEwdnhGbzhSL3VZN29IdDkxNjlXY0JCRko5YnFEZHJiZGhyYW5DaDVHN0I5?=
 =?utf-8?B?VVhVN0taQ1hoUE1jclgwYndmMzFBYzdYOFN1c0Z2VUhtUmExR2hEZzdyRmRw?=
 =?utf-8?B?UEQ5b2VWNUtKbWdvKy9BU0ZvZ0FpQWJUSWwwYXdXTEYyOHlmbDBvdlR4Snhm?=
 =?utf-8?B?c05ZcTBnQ0VlOHBRRXhmUFNBK1I5OUEzbE40dVVpU3RmaHB3b1l5SHRxMk8w?=
 =?utf-8?B?RHVkdk9ndkIwckRYVndFazE2QlpTN3Q0SENrY1MwaFZYZURMclBJS1hiSjlU?=
 =?utf-8?B?dGFuWkdJSkFPSGZ3K3RoekFPdHRnVW5FSFRhOGFTRWdIeTErVEFjK0ExeGps?=
 =?utf-8?B?a0k4OWsxemhuQTV2dVdST1A2dDNEU01nMmVvakpsZXJxYkRDNDJjMXU3SmRO?=
 =?utf-8?B?RnpRTng0MnI5ZUJBaDQrMlZXczR6RDFrWjA2bXptL1d6TzA5d2NSVWdIK3Qw?=
 =?utf-8?B?YkQyazlvM24wQUczZXQ5dXh3TTNGdkVlUVY5bnNIOElWUVFzYzZYUU1aOG1N?=
 =?utf-8?B?RVpuL0Jka2Z5dTZKWmdNQnlEWmcyMlRrY2tGdTFZZVhrYUNocDZpa3RpcW44?=
 =?utf-8?B?bE1ad1ZRZ2hYSlZySHhQN01iTUpHUUU1QlRxL3ByVS9jUG85cVRhbVF2R0pD?=
 =?utf-8?B?WnNBYWlrejJKcmFwTHVPRnNLem9HNjlEZ0ZocnNIZ3ZSSWVIV1d0Wk5qeE9q?=
 =?utf-8?B?VE1RbHl5VHIweTZpQ3YvOUNQRXVmOXI1RnVtSG5QMVBWNUMzZUo0Rk9MMHI1?=
 =?utf-8?B?RkdRY0VDN0RHREszd3FhMXJ5N2ZjVXhHUGsyN3o2VU5sQWpBMlVVOFp5b0xk?=
 =?utf-8?B?bkZpVkNSbGwrTysvdXQ0M3lON1RSQXQwdzUzZWFxSVJFVWllVW96cnVxUElE?=
 =?utf-8?B?VWI4TmtHeWcwdjYza3ZDUlJ1N0VkcGU4Tm1wUncxR0x1UnJLdEtBOEFGSnh3?=
 =?utf-8?B?S2xNYXh4bEJ3aFh2TG1xbGFkUlNOTUcxd3poT3BxU0xVTXh0V09pL0xIdncy?=
 =?utf-8?B?bVp6M0lJVTFTNlEzL2xJNk5jT2Uza2RSUnNEMmlIcVVUb20xdXBsUEdEOXJN?=
 =?utf-8?B?RFdHSUFPRnVkaEZEVjZvZG5yNzI4dGJlTWlQVnN6VGRuMkhpSmdVYnpHRUNu?=
 =?utf-8?B?QXdqa1JqdXBmdVBjaFFkK1BwU3NLdDN5RkE1bkg5ZTVXYURPU3FqaDBOc0RJ?=
 =?utf-8?B?cGVmTWFKRHNsUUUxcXVRVlh5TnNXbEtZdXdCOExHNE1rU1dtQ2ZVSktIV1ZX?=
 =?utf-8?B?cmsvRUJncEMyQlBKTlEydDV2WTlnRGtkYm1XcFpxMHloT2pFemprTyt2dndl?=
 =?utf-8?B?aVhGNTBsVThaLzVWa1lHWUZpR2NBclJ0NGE5Ly9KWHRPaWJ1NE5wL2tacHVx?=
 =?utf-8?B?NzdTSTVPbDlrWU96TWwyczlIb1dlSXFjdDBZejM2akoxVG05Y3J4a0gzMmlh?=
 =?utf-8?B?ZVJiekpsNm9NN0NnZVNLWms1Y3VuS1JsdHE1TGNxek15WFo1L1R3dnh5SXZq?=
 =?utf-8?B?NWJzd1FIQ0FYSXBGd1ZWUUx2REN3TUdrMWZwR2NKTVBvN2NvOXlObUdGRmpT?=
 =?utf-8?B?Q3IwWXZSc1Q0OWZRSnNycTlTMjRDUi9qNjFGOE9IS3lqUThzT1FpNVpVNi9C?=
 =?utf-8?B?dnBWS2VMTE4yRW9qZk4ycFNlaCszMGZ6VkR5Nk12V1o1dW1UUGZuU2NEZHBl?=
 =?utf-8?B?bHFlVHEvTVYyZVJJRG5sU2s1bUJHQ3N3Y2h4dHJEWTdrdEhIcFlrd2ova3Z2?=
 =?utf-8?B?QTNkY2pKaVYzTytWbFJLSFNmWmtjUkxXeXNtOEZOUkxRZ1B1M3ZwcWRHclI5?=
 =?utf-8?B?cXJrQUFmK2cxM1VVVTBWRlNvRGNlY1l3RjY5VGR2N2xoQk1CbVgwekZEL2Rr?=
 =?utf-8?B?bTZpeGpPRDk4cVNwVzFpWlpySG9YeE03ZUI4eElUUDFnUTRnYTFwbVRhOUxT?=
 =?utf-8?B?b2hnU2tjYkJJOFl2c1pCQzlyc1BVcFQ3NGlkMzRyY0tzSFFlYVRPcEJWem5q?=
 =?utf-8?B?YUNUQVZ0R2xDNVBKTkRTUzlnZnk4RHlxSzdsL3lsdTR0dklyL1ZUZTRVQnBZ?=
 =?utf-8?B?cVh1dVZIWVpZbVVpbEpLOXJCVTJVNEtTdW1OTkJvYjNIWjFFN0dUenpIQmN0?=
 =?utf-8?B?Um1TRnhHdjE0ZHZHOHVEMHZTK0lxVHBCVDZoSVJYdkg1M2ppd3FQV1kzaFda?=
 =?utf-8?Q?hge+tSc/RzxYTtkw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6797.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb6d743-d157-434b-ff81-08da4a3578ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 16:31:14.7434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgDbN+YCNQ3K2597tlufx0FhTcfCJ/FttVfvFFphrIZiJ+MRC/FNh7GTEr0cOA2MP/tQ+Mze9K+5SsM/6Qy0fXHLXvIOTCv+x4pfUHtyBN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR03MB4553
X-MTK: N
X-Host-Lookup-Failed: Reverse DNS lookup failed for 210.61.82.184 (failed)
Received-SPF: pass client-ip=210.61.82.184;
 envelope-from=vince.delvecchio@mediatek.com; helo=mailgw02.mediatek.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
From:  Vince Del Vecchio via <qemu-devel@nongnu.org>

T24gVGh1LCBKdW4gOSwgMjAyMiBhdCAxMDozNEFNLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4gT24g
MDkvMDYvMjAyMiAxNi4xNSwgQ2xhdWRpbyBGb250YW5hIHdyb3RlOg0KPj4gT24gNi85LzIyIDEz
OjI3LCBDbGF1ZGlvIEZvbnRhbmEgd3JvdGU6DQo+Pj4gT24gNi85LzIyIDEwOjU3LCBEYW5pZWwg
UC4gQmVycmFuZ8OpIHdyb3RlOg0KPj4+PiBPbiBUaHUsIEp1biAwOSwgMjAyMiBhdCAxMDo0Nzoy
NEFNICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4+Pj4+IE9uIDA4LzA2LzIwMjIgMTcuNTEs
IFBhb2xvIEJvbnppbmkgd3JvdGU6DQo+Pj4+Pj4gT24gNi8zLzIyIDE5OjM1LCBUaG9tYXMgSHV0
aCB3cm90ZToNCj4+Pj4+Pj4gT24gMDMvMDYvMjAyMiAxOS4yNiwgQ2xhdWRpbyBGb250YW5hIHdy
b3RlOg0KPiBbLi4uXQ0KPj4+Pj4+Pj4gbWF5YmUgc29tZXRoaW5nIHdlIGNhbiBub3cgZHJvcCBp
ZiB0aGVyZSBhcmUgbm8gbW9yZSBDKysgdXNlcnM/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEkgdGhvdWdo
dCBhYm91dCB0aGF0LCB0b28sIGJ1dCB3ZSBzdGlsbCBoYXZlIGRpc2FzL25hbm9taXBzLmNwcCAN
Cj4+Pj4+Pj4gbGVmdCBhbmQgdGhlIFdpbmRvd3MtcmVsYXRlZCBmaWxlcyBpbiBxZ2EvdnNzLXdp
bjMyLyogLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhhdCBpcyBwdXJlIEMrKyBzbyBpdCBkb2VzIG5vdCBu
ZWVkIHRoZSBleHRyYSBjb21wbGljYXRpb24gb2YgDQo+Pj4+Pj4gImRldGVjdCB3aGV0aGVyIHRo
ZSBDIGFuZCBDKysgY29tcGlsZXIgYXJlIEFCSS1jb21wYXRpYmxlIiANCj4+Pj4+PiAodHlwaWNh
bGx5IGR1ZSB0byBkaWZmZXJlbnQgbGliYXNhbi9saWJ0c2FuIGltcGxlbWVudGF0aW9uIGJldHdl
ZW4gDQo+Pj4+Pj4gZ2NjIGFuZCBjbGFuZykuwqAgU28gaXQncyByZWFsbHkganVzdCBuYW5vTUlQ
UyB0aGF0J3MgbGVmdC4NCj4+Pj4+DQo+Pj4+PiBPaywgc28gdGhlIG5leHQgdGhlb3JldGljYWwg
cXVlc3Rpb24gaXM6IElmIHdlIGdldCByaWQgb2YgdGhlIA0KPj4+Pj4gbmFub21pcHMuY3BwIGZp
bGUgb3IgY29udmVydCBpdCB0byBwbGFpbiBDLCB3b3VsZCB3ZSB0aGVuIHNpbXBsaWZ5IA0KPj4+
Pj4gdGhlIGNvZGUgaW4gY29uZmlndXJlIGFnYWluIChhbmQgZm9yYmlkIEMrKyBmb3IgdGhlIG1h
aW4gUUVNVSANCj4+Pj4+IGNvZGUpLCBvciB3b3VsZCB3ZSByYXRoZXIga2VlcCB0aGUgY3VycmVu
dCBzZXR0aW5ncyBpbiBjYXNlIHdlIHdhbnQgDQo+Pj4+PiB0byByZS1pbnRyb2R1Y2UgbW9yZSBD
KysgY29kZSBhZ2FpbiBpbiB0aGUgZnV0dXJlPw0KPj4+Pj4NCj4+Pj4gSXQgZG9lc24ndCBmZWVs
IHZlcnkgY29tcGVsbGluZyB0byBoYXZlIGp1c3QgMSBzb3VyY2UgZmlsZSB0aGF0J3MNCj4+Pj4g
QysrIGluIFFFTVUuIEknbSBjdXJpb3VzIGhvdyB3ZSBlbmRlZCB1cCB3aXRoIHRoaXMgbmFub21p
cHMuY3BwDQo+Pj4+IGZpbGUgLSBwZXJoYXBzIGl0IG9yaWdpbmF0ZWQgZnJvbSBhbm90aGVyIHBy
b2plY3QgdGhhdCB3YXMgQysrIGJhc2VkIA0KPj4+PiA/DQo+Pj4+DQo+Pj4+IFRoZSBjb2RlIGl0
c2VsZiBkb2Vzbid0IGxvb2sgbGlrZSBpdCBlc3BlY2lhbGx5IG5lZWRzIHRvIGJlIHVzaW5nDQo+
Pj4+IEMrKy4gVGhlcmUncyBqdXN0IDEgY2xhc3MgdGhlcmUgYW5kIGV2ZXJ5IG1ldGhvZCBpcyBh
c3NvY2lhdGVkDQo+Pj4+IHdpdGggdGhhdCBjbGFzcywgYW5kIGV4dGVybmFsIGVudHJ5IHBvaW50
IGZyb20gdGhlIHJlc3Qgb2YgUUVNVSBpcyANCj4+Pj4ganVzdCBvbmUgYm9yaW5nIG1ldGhvZC4g
RmVlbHMgbGlrZSBpdCBjb3VsZCBlYXNpbHkgaGF2ZSBiZWVuIGRvbmUgaW4gDQo+Pj4+IEMuDQo+
Pj4+DQo+Pj4+IFBlcnNvbmFsbHkgSSdkIHByZWZlciBpdCB0byBiZSBjb252ZXJ0ZWQgdG8gQywg
YW5kIGlmIHdlIHdhbnQgdG8gYWRkIA0KPj4+PiBhbnkgQysrIGluIGZ1dHVyZSBpdCBzaG91bGQg
YmUganVzdGlmaWVkICYgZGViYXRlZCBvbiBpdHMgbWVyaXRzLCANCj4+Pj4gcmF0aGVyIHRoYW4g
YXMgYW4gYXJ0aWZhY3Qgb2YgYW55IGhpc3RvcmljYWwgYXJ0aWZhY3RzIHN1Y2ggYXMgdGhlIA0K
Pj4+PiBjb2RlIGluIGNvbmZpZ3VyZSBoYXBwZW5pbmcgdG8gc3RpbGwgZXhpc3QuDQo+Pj4NCj4+
PiBJJ2xsIHRha2UgYSBsb29rIGF0IGl0LCBtYXliZSBJIGNhbiB0dXJuIGl0IHRvIEMgZmFpcmx5
IHF1aWNrbHkuDQo+PiANCj4+IEl0IHNlZW1zIHRvIGJlIGdlbmVyYXRlZCBjb2RlLCBnZXR0aW5n
IHRoZSBvcmlnaW5hbCBhdXRob3JzIGludm9sdmVkIGluIHRoZSB0aHJlYWQuDQo+IA0KPiBOb3Qg
c3VyZSB3aGV0aGVyIHRoZSBvcmlnaW5hbCBtaXBzIGZvbGtzIGFyZSBzdGlsbCBhcm91bmQgLi4u
IGJ1dCB0aGUgZm9sa3MgZnJvbSBNZWRpYVRlayByZWNlbnRseSBleHByZXNzZWQgdGhlaXIgaW50
ZXJlc3QgaW4gbmFub01JUFM6DQo+IA0KPiAgDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Fl
bXUtZGV2ZWwvMjAyMjA1MDQxMTA0MDMuNjEzMTY4LTgtc3RlZmFuLnBlamljQHN5cm1pYS5jb20v
DQo+IA0KPiBNYXliZSB0aGV5IGNvdWxkIGhlbHAgd2l0aCB0aGUgbmFub01JUFMgZGlzYXNzZW1i
bGVyPw0KPiANCj4gSSBrbm93IGl0J3MgbGlrZWx5IGEgbG90IG9mIHdvcmssIGJ1dCB0aGUgYmVz
dCBzb2x1dGlvbiB3b3VsZCBtYXliZSBiZSB0byBhZGQgbmFub01JUFMgc3VwcG9ydCB0byBjYXBz
dG9uZSBpbnN0ZWFkLCB0aGVuIG90aGVyIHByb2plY3RzIGNvdWxkIGJlbmVmaXQgZnJvbSB0aGUg
c3VwcG9ydCBpbiB0aGlzIGxpYnJhcnksIHRvby4uLg0KPiANCj4gSWYgSSBnb29nbGVkIHRoYXQg
cmlnaHQsIHRoZXJlIGlzIGEgTExWTSBpbXBsZW1lbnRhdGlvbiBvZiBuYW5vTUlQUyBhdmFpbGFi
bGUgaGVyZToNCj4gDQo+ICANCj4gaHR0cHM6Ly9naXRodWIuY29tL21pbG9zMTM5Ny9uYW5vbWlw
cy1vdXRsaW5lci90cmVlL21hc3Rlci9sbHZtL2xpYi9UYXJnZXQvTWlwc19fOyEhQ1RSTktBOXdN
ZzBBUmJ3IXlwYUYtN3ZHa09CaDVHM3h5Ykd3SXVKZEdwVWZyTWF2UWxZRl80VDlpb2NndzV4OTk0
dEFCRl9CX1JzQ0pJZHFZNHZ3VnpBJCANCj4gDQo+IC4uLiBzbyBtYXliZSB0aGF0IGNvdWxkIGJl
IHVzZWQgYXMgaW5wdXQgZm9yIGNhcHN0b25lICh3aGljaCBpcyBiYXNlZCBvbiBsbHZtKT8NCj4g
DQo+ICBUaG9tYXMNCg0KWWVzLCB3ZSBhcmUgd29ya2luZyBvbiBhbiBMTFZNIHBvcnQgZm9yIG5h
bm9NSVBTLiAgSXQncyBmdW5jdGlvbmFsbHkgY29tcGxldGUgYW5kIHByZXR0eSB1c2FibGUsIGFs
dGhvdWdoIHdlJ3JlIHN0aWxsIHR1bmluZyBwZXJmb3JtYW5jZS4gIFRoZSBtb3JlIG9mZmljaWFs
IGxvY2F0aW9uIGlzIGh0dHBzOi8vZ2l0aHViLmNvbS9NZWRpYVRlay1MYWJzL2xsdm0tcHJvamVj
dC4NCg0KSG93ZXZlciwgZm9yIG5vdyB3ZSdyZSBzdGlsbCB1c2luZyB0aGUgYmludXRpbHMgYXNz
ZW1ibGVyOyB0aGVyZSdzIG5vIGVuY29kaW5nIGluZm9ybWF0aW9uIGluIHRoZSBjdXJyZW50IExM
Vk0gZGVzY3JpcHRpb24uICBXZSBoYXZlIHRlbnRhdGl2ZSBwbGFucyB0byB3b3JrIG9uIGVuY29k
aW5nIGFuZCBpbnRlZ3JhdGVkLWFzIGxhdGVyIHRoaXMgeWVhci4gIENvcnJlY3QgbWUgaWYgSSdt
IHdyb25nLCBidXQgSSB3b3VsZCBhc3N1bWUgdGhhdCwgYmVmb3JlIHRoYXQncyBhdmFpbGFibGUs
IGl0J3Mgbm90IGZlYXNpYmxlIHRvIHVzZSBjYXBzdG9uZT8NCg0KUmVnYXJkbGVzcywgSSB0aGlu
ayB3ZSBjYW4gbG9vayBhdCBjb252ZXJ0aW5nIHRoZSBleGlzdGluZyBkaXNhc3NlbWJsZXIgZnJv
bSBDKysgdG8gQy4gIFRoYXQgd291bGQgYWRkcmVzcyB0aGUgY3VycmVudCBjb25jZXJuLCByaWdo
dD8NCg0KLVZpbmNlDQo=

