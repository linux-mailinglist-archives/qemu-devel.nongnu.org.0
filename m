Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924632F8831
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:10:05 +0100 (CET)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XIC-0000Vm-M8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0XFO-000832-Mp
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:07:11 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0XFG-0008Je-Kk
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:07:09 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EFE2B40387;
 Fri, 15 Jan 2021 22:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610748420; bh=n8xnjN12k3+fZ/hjqHXannvFoJF8eHgzIrQuRQDo6LI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=M0iYVuDHaMqmUYZH3chGKVqpC/ph15OE3cvAv/ttJd8MAE7ZfLfshLDDl5Adqs780
 mXf9yk3312LSgc6fWq9Q4wwbKfRgcP/b2owWE/aZnjX++Kj+GbWi3qeLUQkSbBGeQv
 wf/xwGc6UjDZ/lDw+8AeMPXzjpZ87WCOUX48wmdeKSNRiTmOU36/efsu7KqYww1QJ0
 M1+bXqKMkROlLVfBxwmMPHjlyxaSjXFNJO4wIKaaZQaHCEKsr4gAbQ5EZAiplRelxM
 mPkTKzCHJcVlM6bYDBLxVinr2feqf9sXdeyulxE3EL0WXud+fW5sMtuzbfjvtldEb8
 E0PgGL95Q0JLg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7009EA0083;
 Fri, 15 Jan 2021 22:06:59 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8B75681530;
 Fri, 15 Jan 2021 22:06:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="oOCMSL7k";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddFo3kdSdeLOpbLv4F7+tzd8PDRzhQm8ejsWpkdMCqYOS5iXgAhaX9NukaYSoWcnDyAcweqFo4rGD169TI1gs5rzS+kg6DE6H58eR5b1IN+oh+y/95ueL5bBFVR8gxIqMbBiNr5S/KH6YxemMvs9fxpcsKQYAazJNzWmBaaXT73s0Kqg0YnmmVBradwXNtWwXypdkHzAn8iFQR7rWwqVmKfsWhF8bsfFFuxCbm89ee4bUIWOIVAnYRT9B2DrV8DAayxyKNBQpCNctVhferyksVEjSNGFX63eomOzTP5hEzE7x3JDAfA/cIX9RRxsuPX5j+1CUqvvVyHZdulERdwK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8xnjN12k3+fZ/hjqHXannvFoJF8eHgzIrQuRQDo6LI=;
 b=RqukJsrf6X4VtK59ufVQRVA7zTySzHt4uhmxiIzI6grckdEocoYaFm69kuHF3uHTOQJv3BweRVVRrDkvtaSSHQmBcfCvogKMZHpXojWHPtPWfDKJ2QZurxT5mskkVumz9T9g9xMEJn+8P9nBc7DMFSRyoc7yim1OSiFc7maQaeg1hRTZfZBtV7dfVVIvDDgHdKHu7vzjTM3Xkj93lIVfyLAyAxAdi3XQrvD0URcamtZlQv0lHDQYDjTtJACd1MTVwkrEOvF4jC3TJXf8cH0SF6X+z1NirTQAOBX430iRKAgJZuEGJcr01BsSncT/7pAaRI38G1qGPEHsR5q1FxKkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8xnjN12k3+fZ/hjqHXannvFoJF8eHgzIrQuRQDo6LI=;
 b=oOCMSL7kKgnFc6QQAfK2eWtKYHFEwBubPVd/VULv5cxzL4SMeQJ0WvEDrXpct/+vvzZSDOosI7lWrYtMtUTC95GTKi6lUKT1xKIu4blDF/bDrMjvucwuGWFaCJ0ZHaEAOUureKVFeDHmIoN/NsZQf2uXaszsrPXSml9ifFEsOqA=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4032.namprd12.prod.outlook.com (2603:10b6:208:16d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 22:06:55 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 22:06:55 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHW62F0vmOtZqCO7Uy4HrbUomKevA==
Date: Fri, 15 Jan 2021 22:06:55 +0000
Message-ID: <a3cff6e3-3945-4feb-0840-47e658d7de29@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
 <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
 <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
 <83e57a69-5d2f-0c6d-4f65-44ef0669d71e@linaro.org>
In-Reply-To: <83e57a69-5d2f-0c6d-4f65-44ef0669d71e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80b89390-accf-404f-a561-08d8b9a1df18
x-ms-traffictypediagnostic: MN2PR12MB4032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4032602B1FFAC8AC22476329A8A70@MN2PR12MB4032.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0fr3SdSGaVlq1JVwJeWvT+R3R/XUtFPp/AOrWi/geqPVYtiGOVyWLJPFaovL5pbTUwI/THFEwQmQ89Ft0whMzCInFjnOwWd99RF6VGHDLKXEYufUSbSZEOdFNrfmL6KSLMIXPARSFHhI4Ao+I5N8gUm+gkh4G4Emy8oP2YRuopOQnAPSBCh/hgDDVgzytzT7RVqYz4a5e4+5HkxjN0sgM/A2T0PA+32Ilkhs8p66+NdVIzEQ1m4+XL5vsONBysmbvC7TOaeld4mrhuFnDcfVDzLfrD1MYLNq6IwS3ci9QJLrPM+mNqh2zQm0TbSsWvHLxZeYqbW1sXqONFQsftaabS50CpzkpMnwExR55mQycMunl9krswJy4n/gy5NQRsTbsxkkFz2xq9TmraDoxFbKCA9P92yDClW+asxQpQji87LJQzQXLu4Q22Rb7qBoSYB2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(366004)(346002)(376002)(2616005)(66476007)(107886003)(31686004)(66446008)(91956017)(53546011)(31696002)(5660300002)(478600001)(2906002)(66556008)(86362001)(110136005)(36756003)(71200400001)(54906003)(6486002)(6512007)(6506007)(316002)(8676002)(186003)(8936002)(66946007)(26005)(76116006)(64756008)(4326008)(4744005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?LzVSQS94SHptazNzTGtyK1ducS9WR1djOEpQdzNYbjFPTDkxMFBiUktMelhK?=
 =?utf-8?B?S2FDeW84N0NndGllWHZXTENnRVQya3AyVkZLSHEzOTl3b2pvRmEvcmlsZjZa?=
 =?utf-8?B?SzYrV2t5b2x3WllNampVc0t5aHBGU2lIZ2UrYXlzb2FXZDVTcVRYMGxxTUt6?=
 =?utf-8?B?QTI2NEdpNnlGWlB0OEsra1BCSGVCcVBNRmR3eE5HRnpQUWN0bGRmbzl0M29Y?=
 =?utf-8?B?cGd6NWd1OVd0OHFrdm8vVkRuNEFVZlN4a3k4ZkRqQnVFbnA3RHpmNTgvT1Q1?=
 =?utf-8?B?Wkt2ckpBNlI2TThXbHJKL2hZVkZOYlAxbUI4dnQ5czErK1dYaTNMQXRvWDRE?=
 =?utf-8?B?ODRNV1p6VVJVbWNidWRBRHhQcTdkZGdYM0RqRTVJb3FKaWZKb0k1Q2hVZTI4?=
 =?utf-8?B?L2hrZG9JcGk0eFhWbllvQmxpNDZxZGJKZzNxRVhwczJyUnVXdHFUblVHNGdX?=
 =?utf-8?B?TTR0ckQ3eTVnVndpcEljazZDWVJuQ2x2YUo3UUNjUlVycjh0RDlPNk12eGpW?=
 =?utf-8?B?cjErYmdTRWhvNGQxaHFjZFJ6RjVYc0hZZWcwaS9UQWlsakczUlNzMmtUdzRV?=
 =?utf-8?B?ZE5CeW9VNGV0WVgrSVhqVzFYSEtLR1BFM3phOG85QzNBbGdXV1djSGc0THlP?=
 =?utf-8?B?MjRlRTUzVkVIZnFnY2VaazlzTTE1UnNiSVJoTjc4aXRjL0tzUklRM0h2akZD?=
 =?utf-8?B?eVdIaW9tNlBndXdzaE5idExjOVgyYitaalZPTUNmUHMvZWdPYXhuVDRYbmtm?=
 =?utf-8?B?MzJua0JDSXh2aVFvd2dZdXVtd0ZoT2tyRnFEUGtORmFBNmFBM2hYVnZGekxJ?=
 =?utf-8?B?UURVK043SEJNYzc5cEFySFQ1d09qV0s5Y0pBS0JRenlpcG95T3puanFhTU8z?=
 =?utf-8?B?Ym4zTDY0aU13K0xBUjFxWkhaUW5TL3NIaXZyb21oSlI5MWZhZ0VXTTRYbmsw?=
 =?utf-8?B?ZUtJL01USzJsQkVjcFFpYUE0N0t6SXFxcDVLOHI2em1wTkpVWEYrazJ1MkVx?=
 =?utf-8?B?NjA4UHJVbGVKdjJaa2VJaVBmTm5yR1hMSGR1dHVzTzdGUmsralFjZEUzU3cx?=
 =?utf-8?B?SG9EeGcvazk4UEZ1QSt5NTdDUWZqclpzOXdtNkNWVWNwOEFUN01ITFZkMXNN?=
 =?utf-8?B?NTRBQkM0SzZJdHl0ZDZIMzFXeUJSNEhFSHlmMmpESm10bFh0clIzQzUreE96?=
 =?utf-8?B?NTdzZG9aZ1hTdVRBeUhBWGNJOGdqS1Fudk43K2trQWJlVDFlb2lhT2IyWExM?=
 =?utf-8?B?M3k3NUhPL3d1MXVTMGJ6TjJmOWI1d2UzazhnYU1uZkNPOS9QeXBZNmVRcUp0?=
 =?utf-8?Q?cCAsn/5bEMoFE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A52B2D6923E80479152D0EC274ABA4A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b89390-accf-404f-a561-08d8b9a1df18
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 22:06:55.5410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIIcIUFh/ufYLqUxqeB6Dtjd3FWOKJOq6IdSAVAfgNPw9JtlLxxxL9zKT8AEUgIWkK/9vwBcwWu1vDtVF+HbBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4032
Received-SPF: pass client-ip=149.117.73.133;
 envelope-from=Cupertino.Miranda@synopsys.com; helo=smtprelay-out1.synopsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T2ssIGVudGVyIGFuZCBsZWF2ZSB3aWxsIG9mZmljaWFsbHkgZ2V0IHRvIGJlIFRDRyBjb2RlLg0K
VG8gYmUgaG9uZXN0IGluaXRpYWxseSB3ZSB0aG91Z2h0IHRoYXQgaGVscGVyIGNvZGUgd291bGQg
YmUgcHJlZmVyYWJsZSANCnRvIFRDRyBvbmUuIEFwcGFyZW50bHkgd2Ugd2VyZSB3cm9uZy4gOi0p
DQoNClRoYW5rcyBmb3IgeW91ciBxdWljayBmZWVkYmFjay4NCg0KT24gMS8xNS8yMSA5OjUzIFBN
LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4gT24gMS8xNS8yMSAxMTo0OCBBTSwgQ3VwZXJ0
aW5vIE1pcmFuZGEgd3JvdGU6DQo+Pj4gSW4gdGhlIGNhc2Ugb2YgZW50ZXIgb3IgbGVhdmUsIHRo
aXMgaXMgb25lIGxvYWQvc3RvcmUgcGx1cyBvbmUgYWRkaXRpb24sDQo+Pj4gZm9sbG93ZWQgYnkg
YSBicmFuY2guICBBbGwgb2Ygd2hpY2ggaXMgZW5jb2RlZCBhcyBmaWVsZHMgaW4gdGhlIGluc3Ry
dWN0aW9uLg0KPj4+IEV4dHJlbWVseSBzaW1wbGUuDQo+Pg0KPj4gU28geW91ciByZWNvbW1lbmRh
dGlvbiBpcyBsZWF2ZSB0aGUgY29uZGl0aW9uYWwgZXhjZXB0aW9uIHRyaWdnZXJpbmcgb2YNCj4+
IGVudGVyIGFuZCBsZWF2ZSBpbiBhIGhlbHBlciBhbmQgbW92ZSB0aGUgbG9hZHMvc3RvcmVzIHRv
IHRjZyA/DQo+IA0KPiBXaGF0PyAgTm8uDQo+IA0KPiANCj4gcn4NCj4gDQo=

