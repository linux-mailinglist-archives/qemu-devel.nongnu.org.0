Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043743D2FF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:38:00 +0200 (CEST)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpgN-0006yc-8h
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpbT-0004is-Ct
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:32:57 -0400
Received: from mail-eopbgr820134.outbound.protection.outlook.com
 ([40.107.82.134]:64280 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpbF-00071n-HE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:32:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg79QdCYBVFy/QRetDPPQamuy1UTLRAhqXSUP3cUwsW8SQAEDuAEJ4AEXnXij1QNGJv1lGnLweb1nDImrTsCh9/P/oNBrpu8SFb3bZFsM+Bncw8806B02a4thCSiGy8tRRweXq6c3IbC2Avisq+jYoJHK9KHsNJuoodyzCmOlygbRv5Br1gU2/p0f+Sa1N0PJ+iKOVfOZTAJG8DfHcIIOyUPl67DCTz/luz70r2xBCqptbYhTuO06uWfcD3pHpKzwdTKNGSH5rJeTNR2nXhBiJdk4R730g6mrzM3g+IM1jVfsPB/quD0TC5FMMXD0ewEao8KVvQVSRkO9XiIU8TMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA9qjb45qSX15XP7MJ6JMOy9QFHVpyeKJnBpl0tsn9g=;
 b=FoaIVSGRjjgc3UUqfF0xrtJ0zVl6rADJcvpUiryuF/I+jGJ1dWha9Csm9wPznBnsm4xl60WNJEL69qZIDeG5xJsrArEbScFhJTR3VsW7HDV43lCGi7z0Zz4Y2PPqy359lGrUvpSXBOj1w8XcRyx3E0Hlzx3sttjpIg5E8JBXiNvZ0XdvwJVblAjr//V3gaoyg/PBMSdGjjO++tfcpqlwGOv4BZeu0zynK67zD52+SNP6R1WKwbyEmk8NsgmRGFDkZtbQHveWVcQRCA8EKr1+TG/Fn5d1G75qbfpFYsigVVRehnCoaMnb7ay2RdY362hrmCDzlhheeYsGogly/+OosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fA9qjb45qSX15XP7MJ6JMOy9QFHVpyeKJnBpl0tsn9g=;
 b=qkL0iMPoS10LBY0XpgUv//mST1Fixx8jimpSmnLjh+QywrtXfkUNFoxTtExXAGfc1pHdBDUsuWrZH7Z52KrdFSnc62goYm0TuVxpCSUKWX+DyJ4/fGiX4qQNuJEIzwvPqKp2j5JYyDC94BwMMgSTq5FsYt7nIy3YlmmPIlN5hoDwHp04RrpzmSI6Saehy0LqrK7hEanWubcb0MZaKVYztcFFd6uQ00XZplkZZ5oO4nNSKNEVM4Rziv6OVlLsi8X+jDYfGz2ZCOvPpmNruytFRyWbAxiJluAsE/s7qjKl5jIY/STuEgPAbJmJEuWWjAknIsLXxXvrVegVgXGdbN3Mlw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB4982.lamprd80.prod.outlook.com (2603:10d6:103:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:32:39 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:32:39 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 42/51] tcg/optimize: Stop forcing z_mask to "garbage"
 for 32-bit values
Thread-Topic: [PATCH v4 42/51] tcg/optimize: Stop forcing z_mask to "garbage"
 for 32-bit values
Thread-Index: AQHXyr8VgktrA0ald0S0Bgt6zj583KvnTfzg
Date: Wed, 27 Oct 2021 20:32:38 +0000
Message-ID: <CPXPR80MB52244263FFACC8AFA80BA753DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-43-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-43-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb21d973-3837-4116-5ad3-08d99988eb34
x-ms-traffictypediagnostic: CPXPR80MB4982:
x-microsoft-antispam-prvs: <CPXPR80MB49826EE42BC0C48852D75126DA859@CPXPR80MB4982.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:316;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RusbqtR0ekRGMDhDJh94RsvaKx9G6adfd91Nk9ISY3sMqBMEzhzQ6e0wUPLD8uq8DFoP//6klC/jjJn8DKDzWTfWHwGGqodA0ehR/nxvoXj1EqmETUAsIWT2WLCV5D59+N3d16fl5kbF84DS2ICRM5JhLoDuTmcynpxHGJca3lH2onV3ynvlPXY7ftU8pMIZT/X9paV+Yjb2DrkfkWwOWnWdtZYX2HeJ5y3cpy4Z/xkiuwHqYfnAK9dCorUMxCjugQkW9HlIq9ewmdydrfxYN9gDRJcRJOyXZ49CSc2IJCeNo2i59ghXYSnJnz9n2qGy7OVx1uOqsf4Q3Ku6Yk1NBr9HR6OEa1xSSwh0Uvo2KO8R+3QIV+oW4YVxZ9f4uu063TCE27QFweVgosh6RW95oNzvOCjCQ3MuEZO41bWef9db16cN85Qr8qCzbzAug+UvuglcKKfBrRuWfwpFZLA0KipL4NeJOF/Jxx0Qj/3zWkcNRmdrhPJiKMbgJVcEVoq0GjQHwsYfZ3AGcZLBnhsuGDNpHQgPuBKRYoGNRThExys+S2Co6iZ8SXwlmxUGRIY2youSSOZdKBmBly8T50alxUXOUuuwNAEPKoqQNMf89gnnrKToxJZoQ+d0io7Fift3x/Z2ak5bjFs3v7QwP42Y5KyLGOGpnxY2mZMrxTNy42/R2Uno8J7DBLtAZr9hSY0B3n/q8ZMmcMaIn6fOZ/eJ4gwNQ4ne2fYs57/MtH6tDFG1Pzm+T1pAxxOI+wIMisCCcnHvdjJ/TB43QrmyFITn5nSvUA8qtdt6A35ZQdt/fck=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(8936002)(316002)(54906003)(71200400001)(2906002)(508600001)(55016002)(52536014)(110136005)(38100700002)(8676002)(122000001)(26005)(4744005)(83380400001)(66946007)(76116006)(66556008)(66446008)(66476007)(9686003)(64756008)(86362001)(38070700005)(5660300002)(6506007)(7696005)(33656002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1RGOWRrUC9HVWVuS3FnL3NkMUtUSS85NzJJcnk3eGNJd0RVYUhlMXZFRXJi?=
 =?utf-8?B?SHhLQjg2b2U0YWVvVUZ3YjVrMWNEYzNIcHNjNE5uaWZCeTdhZ3h3M216STU2?=
 =?utf-8?B?WEhQRDkreWp2WXZuWEJnOTN0d1paUFRhaDVjWGpac3ZuK0pYYVRmSW5HQ2RQ?=
 =?utf-8?B?cVZGa2JVQm12Tnl2UTFxOVFaNVo0NDB5WHlGU0lSZmw5V21UeDN3YTQ2VFl5?=
 =?utf-8?B?empLQ3dkL0I3bndXOUZ3WnFpWUw1dDhWK2d0Vkk0VnpxSXc4U3Mxd05DUkJF?=
 =?utf-8?B?aVZ4ZSswdzlpd3gybnpPZVFlSFZHSlFvanpiVVh6bTF2NlNjbWh1MWViRmNS?=
 =?utf-8?B?dVhIc3lSZFkyaTNNcDl5SjJXSDVjRGJWbGdaNTk5cmFNZTB6VTVEeUdBZ0R6?=
 =?utf-8?B?ak8xQ2loRkFsWWhPRFN6bXJVOTkxT2E0REt0MnV5eGhmOWp1YlVrUGhYaXFQ?=
 =?utf-8?B?MlQ4QXhCL05YOEZzNGFya1RhcXc0YXNvUjVRelJ4UUg2eTBBNkQwejZkUzc0?=
 =?utf-8?B?ZFpmQSsrVnA3cG0wZzIzTGhuYzBSdzlvU1RIOFJUY3ZVeGNRa1h6R0tqa0JQ?=
 =?utf-8?B?Z3NBY29qZktiS2ZlQmp5dFV2Y3V1UUFTS2hFZnVpdlNlMytneldCRm1TTUZ3?=
 =?utf-8?B?dVZqK1VhaXFjYnd4dDNueTRuaUNDVExhU25GNHJsZm81bkNpU0F6ZjFPODVk?=
 =?utf-8?B?dTZuTFdDbkxDZWpzeGxRTXhWRkZxa05CZmwxRFpvaFZRN3NkMENZU0ZBRWg2?=
 =?utf-8?B?QTBCaFJxZEJFU2hBQ1diVk1SbTNORGo5Szg1OXVpS05ZSXJkYktDNUM2eDk3?=
 =?utf-8?B?eFNEdWEyL2lJUDVUeXc4RmtuWmQ4cWJhOUcrTHBleTh1Y0RlRnFtQVdpTUFR?=
 =?utf-8?B?aXNoSDNLeTdxNEhtc08rQk56Rkw1VytIYXlPdXJnTk5Oc01BUFFsVHcvSGVa?=
 =?utf-8?B?SW5XWUxrRG9kLzV5dUtvcjMvZ2xHNVA1WjRZYkdqdTRnSGVwU3hDdU5LVk9T?=
 =?utf-8?B?azN0NG5qZk5DZy9PdXJJUTB1cWd0NXlwNzBQZVpZYXd6VTY1K0NLdXUwTmFC?=
 =?utf-8?B?SDN6L25TWG5maEFoQUFpQ0pHazFsY0IvZ2JBdFgvY3RvNVRoRnVUQU5CR1k3?=
 =?utf-8?B?YTJyQVp2LzNiVmw4WUlpemdxUDlVTjlOaGUwZC9TQWhRYmRQWVVKcW1YTDg2?=
 =?utf-8?B?QXI1YlBYS0g1dGxCZ0I0cDR5alY2MTFIc3FZNDFHS1k4Q0ViSEtwYmJZbExv?=
 =?utf-8?B?d1hROUs0S05wSTNuM1R2NFo5VFo0cVdOY2ZkM2VrN3NBVStxbEV4Y3ZUQzdZ?=
 =?utf-8?B?SWtPNHVJaXFnWHlOVTNHbmVCVnQ3b1JLQzhncnpldDcxRHpNRXJUc0dzRCtn?=
 =?utf-8?B?WXBpZWpZZkppYkFYbU9zY0FsSW55RTFhcGgyZkFZdnkzYVF4eklNRmFwd0pn?=
 =?utf-8?B?UjdlRmIvT2x3d2gzbkdtbm9KYWRGYldPKzJJU1c5WUpUMHUvTXA1UG5oQkJU?=
 =?utf-8?B?RjJJYnE2OFR4MDhqUXUxQ20raXpxcnVNM21ISEZDTXA0T3Y2Y3ZsV0xvTnRB?=
 =?utf-8?B?cEQ3RVhEUStqcEpXR2ZUL3J5aFl6M1owZHdMWm16Qkk4WVZTZFMyb2tRZVkr?=
 =?utf-8?B?azFEK1c3MWVGWFY1cFFNVzR2WHQ3TnpyS25HdjNraVM5clVzbjhCV0k3NTdV?=
 =?utf-8?B?bWhmSk9nUUpBYjY0UldCRXNuait6aVViTzlVaGlrMjVlQXFGWUNBTmpCZmpL?=
 =?utf-8?B?WHVHZm5mVVlVTW9ER0ZCcENGTzByMC90WU4wdGNqa3BPNFMrVjQ0N2tyRnM1?=
 =?utf-8?B?NGxUVWZnV3psUDlwd3dmd05yTHZlNTF3bXN6REE0QmlSUFE3ZzdKV3BMTjFp?=
 =?utf-8?B?MFJqZm00NFBVSDh4N0N5NjRjTDdVR2J2VVl0empSWEllblZDUHBVMEJ4S0RU?=
 =?utf-8?B?YTVBRkVOVWtmelhGQjNrUkxJcm9hS3JCdWdZQi9LZUgxdVNOVThVU3RxVzM0?=
 =?utf-8?B?a0l2UjdZNlhqN0xYSU9MZ2dxOTl1d3QxWmxIc0tIazVEbSt4Z09HUEd2U29Z?=
 =?utf-8?B?djRaQnFpV1lFbk9wSDVhOEQrSHBsR3VvSkYwbjJxem1YTGx4RW90T1NGeFp6?=
 =?utf-8?B?THkwbUJIMVlrUFBEWkN6Tkx3SGNES3AvQmlEcWlhY0Jsd3lnUTdtazF4M08y?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb21d973-3837-4116-5ad3-08d99988eb34
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:32:38.8615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6L+J8uppYUSWbBkZ0XoiBbllVi1p6MBWoGDsVPQMnGHYnxaJ7S7oAkxa72V374kbkr1S7ZnJelseXysiTlwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB4982
Received-SPF: pass client-ip=40.107.82.134;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
IFRoaXMgImdhcmJhZ2UiIHNldHRpbmcgcHJlLWRhdGVzIHRoZSBhZGRpdGlvbiBvZiB0aGUgdHlw
ZSBjaGFuZ2luZyBvcGNvZGVzDQo+IElOREVYX29wX2V4dF9pMzJfaTY0LCBJTkRFWF9vcF9leHR1
X2kzMl9pNjQsIGFuZA0KPiBJTkRFWF9vcF9leHRye2wsaH1faTY0X2kzMi4NCj4gDQo+IFNvIG5v
dyB3ZSBoYXZlIGEgZGVmaW5pdGl2ZSBwb2ludHMgYXQgd2hpY2ggdG8gYWRqdXN0IHpfbWFzayB0
byBlbGltaW5hdGUgc3VjaA0KPiBiaXRzIGZyb20gdGhlIDMyLWJpdCBvcGVyYW5kcy4NCj4gDQo+
IFJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IFNp
Z25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPg0KPiAtLS0NCj4gIHRjZy9vcHRpbWl6ZS5jIHwgMzUgKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3Jh
ZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERP
UkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcu
YnIvZGlzY2xhaW1lci5odG1sPg0K

