Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FD2F84A4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:43:32 +0100 (CET)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0U4J-00012Z-FQ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0SdV-0007kK-Le
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:45 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0SdP-0006qq-Ao
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:45 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9163A40762;
 Fri, 15 Jan 2021 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730697; bh=S7P1mM4smKPsd20IN7ekYrzh/leEuBMW8yHr9LICgZE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OV9RWvx5/oLFOXzgWLvrjlfUTN+hwmsXNdUIAGFUruQ9oB/6IwHRSWb5Aiv2+PydI
 AfNbMqIYvVkSJQHGc8B7abS/xSgiAQ19lLUCSju8z/zxNh9JF7XB/fNk7HRKDFcI8s
 uzXx9gVxM7+WknVeX7ZJmB+J7ti/joniuKZ+YYg/zhh9lPkz8MYe3GXvJusTo+BmUg
 PPstDTilYdn3CylftcaWBCxM2N7aC8V1EribeJwL8aqA7SqIgtsytqLNcjV4PEJuuN
 7IBB5BiZFKOdCn/w8HZOXkmMvwghQAgJzxNschYDjm1/p1/jQfs2wHOoIr7hh5mD3R
 v6iPVynRpCt+w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 72891A0083;
 Fri, 15 Jan 2021 17:11:37 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EE5388154D;
 Fri, 15 Jan 2021 17:11:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="pHm+2vgq";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ekk53BuY7hEqaQQuJQWRxIxfx1VIjZ7pZclTYmfThdeRWp7I8cWpE3+hEVurisBl7CDIigmFVDSSuVb5Nv2Xf5LfpTYUt5tgB5VoLHx0jF4Hsbclq4OeNEWb157vBNAbT2LeY7oZZzs6D/2Xv/q9uh1S5QpbIsOoH1FTNf0nkiJkHvfpo8AphizKM1en4zXX/yAuSAjioHmOvWec5/SuTmhXwVro3mPZ53yyjzafepqmiapKCsGxgeEkS7FeDAvmU+rW0H2wFUgdmF/Ta7PD5bGvcEY8T3Uh/2WjzkuerditzjUz09Jv9wHrrlKN6pkGrbawX2HMTw/H7jpWKnwFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7P1mM4smKPsd20IN7ekYrzh/leEuBMW8yHr9LICgZE=;
 b=Wb5GCmLbKsTv6T32evA45bnxF56sn+7OLn4pm58WlHcCTp+3ilptCb1Z3SM6Nxl2h7owPvdfsmKlk2uDenvTRtdMqX9e50Blq1XAD3ctrTdeRchc4014UcgnaXmfa7ea+PcE+wMnKFhzPmi2WT73FOxtXXjg4Y70tXlordTIIx2MO9actP85w4DC50T+zY6aEOYShHPJBeH3pLaX6cA5nlUPTpLjKHADfd2JTyR+IkYn7Sh2ouIDkxBil9qqrStUsJyJGQvRvs4OsAJcODDWAbJ4JrILheb2CfiSdxdSih8d6bBdNqJAV1rVHzNX1zojbidfW25oOc0ixqFEtd9yLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7P1mM4smKPsd20IN7ekYrzh/leEuBMW8yHr9LICgZE=;
 b=pHm+2vgqhcNBv+uoFaN7HsraXkt6DMg4ydOr0wr1SLV0KL2g4oIfuCRuqOHrk0Z+jVJ+HFt3BQ+yiLLjNfT9fRSdCC7wQ2BITU2c1qPcW/Ax7QtdeOo1Ui/01F8APCvc1cOSQMNkpT6wIOryq0M6/kQZ//HzK7f/8G5Src/Li5E=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:35 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:35 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Topic: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Index: AQHW62F5Yc1XOx1vqESeY83yqPhwtA==
Date: Fri, 15 Jan 2021 17:11:34 +0000
Message-ID: <9a9183ca-fd2c-9d57-b283-cf06dbac23cb@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-6-cupertinomiranda@gmail.com>
 <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
In-Reply-To: <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8c8b9f3-9e8a-441f-3aa1-08d8b9789cd6
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417645B841485B64445D68D3A8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13GkcY0KDQAevKl/pXwyPgCizqzkSIEn14Hud+2xbOCy6b/2dxQCUMyV1OYkneMgpVB+5osC5vinASOj2DTNvpEQVa732/ouJeGaZ/yU3rv1vbMrLyZSY0dpBFF+hmLiaixnGqjEBjZ4d0JjFnbuuuXRcEEBfwDCDdQ4ENMJNQBP7zmo+LmM9DSkmqu7HEghFEfA/vv9NDz9ipEFE2Z6eL61nqoeSFtarPj8bD5NBOB1kdKThHGA5StW6yddTV5RIMlYIjOHbTEn+Jf64/kMu0QMZ+GmA72LVJOhm4K1ENNZUQre9OwWG746IMfXiwmhMeMGxj9NiU0AqECgHRB2qYdp5txtAK+t58CDOUMx9Ac6hdZjbiNEKq9sDGrqv6ox+i7KqchKOvjmrosSBYsCYxv3qdayo1l7i6VQowG65w3BZ8FWqPNMHzP7jQGxoInwQWI/+A1h3NF4LEajRPtNpcYbtAu4rH+ZuYAYLpQWVttJPsOs4dhi6Y2CeKpuz68nHI2nKYpqUghqChxe7JrbFbJ4/zdt4XnOCQSjTnc+oygqPaNRzqBCOcrjxLuC0Sd4lJybE1SlX8P6nKHEtP5b6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(53546011)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eEMxRzV6a0hzcGVuVmR5NGxsS1c2Zk8yMEpjdkVPV2FDREE2NnorZ0srdE9X?=
 =?utf-8?B?SDRRSmFaZG1Gc1pHWGJwRG1seWhmdWIzTENOZFhRaUFrejRCWkJuL21YSGU1?=
 =?utf-8?B?TFVDeXdnMVNPaCtFekc2ZmY2N2ZNcGlLY2Y5Rlc2Y2tyWG1PWnA4akpUcUJr?=
 =?utf-8?B?djJrQTIxMmMvS1hidzVqaVBCT0czRnJLN0wwV3F0c3pXaG0vTWtuVTlwZWRF?=
 =?utf-8?B?UjBPa1RSaml5dkNwcUlEWHh2YUNxMHh6bVN4VXJEK2VSOC9vMjd6aTRvUnZ1?=
 =?utf-8?B?YjJQek9vS0tmT3MzWXE4S20vamdOV1Z2VU5zL3BUOFFwT2toRTgyTUlpL3ZH?=
 =?utf-8?B?M2VNd2MrOE1ndGFKWGZUeDBucWs3ejY2TVFVRStrSHJaU3hrMHVtSG5zL2lJ?=
 =?utf-8?B?U0dUcVpvR2lITXNCYTUvSHgyYUxST3VJSFZGZmdrM2tRVFI0am9HZFBWQXhR?=
 =?utf-8?B?c3hkSElTY3pySGVRaGI2QmpBSzRmd0ZIZ2JtMGE0eUJnS2dvK0FqNGg1VWhl?=
 =?utf-8?B?L3dlNGdlZGp6blFkN0ZhZzVsR2g4cVp4UTkzbXlUK2FpKzNrbEFjbk5MRDZv?=
 =?utf-8?B?SlJLcFJpNGs5cjNYekYvVWpqWHRFK2tWek83dThqR0xzbG5GS2dwcFIway9T?=
 =?utf-8?B?b2VFVUc0bTVSWXFvSTVsUUZHLy90TTlyM3h4TTJ4LzFWaTZudGVwK2tObjJV?=
 =?utf-8?B?L2xpeTgvNEpvWDNoRXpwZ0FBcHl1TG5rOW5lMFAwUGtIWmx4V25hVzRKUTR0?=
 =?utf-8?B?R0NmMVQ0L05UMldnSnhUR3NKYnZxY0NuekQ5Mnpoc0QwRFFrMDBBU2ZKMDRC?=
 =?utf-8?B?Nzh0ZldzQWgvbCtZSE4rb1dLR3JzN2pFMEFxWmFkRFlQZ0Q1ejY2d2hLekxM?=
 =?utf-8?B?aEZxdG4yZ09BVXVEWUMxblB3bFN5R2JnK3l6dXhnVndzUUx2WUdRV3lwYlNY?=
 =?utf-8?B?RkZ0cHA3TUdrUStRWEpYUnZuQ01JZm5HK3IwYVVNbzJ6UkNvT1JMNUVzTnJh?=
 =?utf-8?B?YTBISmtESGFiR1FMWjE3bE00NDFvODZXT0cwUWF4eHQ4Zlg2OWs0QU1Sa1Rz?=
 =?utf-8?B?b0hyQ2VvZzY3N2dlc1VhQ0thM2xHa3ZjWG10Tjc2L1h6WnRrano1S1NicFlo?=
 =?utf-8?B?L1lTa0dXcTFReFM3MkdnUjZxdzY5YlJmSjJic3pyaEhHdGhXbFVSZ0NrN0Jz?=
 =?utf-8?B?MlI1aS82d204SnkrVDBlaWRDMTFKb21hUmhFSmZFbm9hSWpUcmRNL3pLdlpP?=
 =?utf-8?B?U21iWHR4MlpEVTFweVV0WjB3ZlpGNXNHemVXNU5DRzkwcjVZdTZPQUl6T2Zi?=
 =?utf-8?Q?SsXgWAugcDwPA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16147CE4BDEA534BA9B106F1C132B302@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c8b9f3-9e8a-441f-3aa1-08d8b9789cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:34.9822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nj39ERGUHHyjk9AOfiIkQij+2e7Yw+Q6M79jNXxef1y5NJx9Qz0GEV3AySWCbEq+mOgTo5XGw/GqAPidL6SvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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
X-Mailman-Approved-At: Fri, 15 Jan 2021 13:34:23 -0500
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

PiBPbiAxMS8xMS8yMCAxMDoxNyBBTSwgY3VwZXJ0aW5vbWlyYW5kYUBnbWFpbC5jb20gd3JvdGU6
DQo+PiArLyoNCj4+ICsgKiBUaGUgbWFjcm8gdG8gYWRkIGJvaWxlciBwbGF0ZSBjb2RlIGZvciBj
b25kaXRpb25hbCBleGVjdXRpb24uDQo+PiArICogSXQgd2lsbCBhZGQgdGNnX2dlbiBjb2RlcyBv
bmx5IGlmIHRoZXJlIGlzIGEgY29uZGl0aW9uIHRvDQo+PiArICogYmUgY2hlY2tlZCAoY3R4LT5p
bnNuLmNjICE9IDApLiBUaGlzIG1hY3JvIGFzc3VtZXMgdGhhdCB0aGVyZQ0KPj4gKyAqIGlzIGEg
ImN0eCIgdmFyaWFibGUgb2YgdHlwZSAiRGlzYXNDdHh0ICoiIGluIGNvbnRleHQuIFJlbWVtYmVy
DQo+PiArICogdG8gcGFpciBpdCB3aXRoIENDX0VQSUxPR1VFIG1hY3JvLg0KPj4gKyAqLw0KPj4g
KyNkZWZpbmUgQ0NfUFJPTE9HVUUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwN
Cj4+ICsgIFRDR3YgY2MgPSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTsgICAgICAgICAgICAgICAgICAg
ICBcDQo+PiArICBUQ0dMYWJlbCAqZG9uZSA9IGdlbl9uZXdfbGFiZWwoKTsgICAgICAgICAgICAg
ICAgICAgXA0KPj4gKyAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+ICsgICAgaWYgKGN0eC0+aW5zbi5jYykgeyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+PiArICAgICAgICBhcmNfZ2VuX3ZlcmlmeUNDRmxhZyhjdHgsIGNj
KTsgICAgICAgICAgICAgICAgXA0KPj4gKyAgICAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19D
T05EX05FLCBjYywgMSwgZG9uZSk7IFwNCj4+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICB9IHdoaWxlICgwKQ0KPj4gKw0KPj4g
Ky8qDQo+PiArICogVGhlIGZpbmlzaGluZyBjb3VudGVyIHBhcnQgb2YgQ0NfUFJPTFVHRS4gVGhp
cyBpcyBzdXBwb3NlZA0KPj4gKyAqIHRvIGJlIHB1dCBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlv
biB1c2luZyBpdC4NCj4+ICsgKi8NCj4+ICsjZGVmaW5lIENDX0VQSUxPR1VFICAgICAgICAgIFwN
Cj4+ICsgICAgaWYgKGN0eC0+aW5zbi5jYykgeyAgICAgIFwNCj4+ICsgICAgICAgIGdlbl9zZXRf
bGFiZWwoZG9uZSk7IFwNCj4+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsg
ICAgdGNnX3RlbXBfZnJlZShjYykNCj4gDQo+IFdoeSB3b3VsZCB0aGlzIG5lZWQgdG8gYmUgYm9p
bGVyLXBsYXRlPyAgV2h5IHdvdWxkIHRoaXMgbm90IHNpbXBseSBleGlzdCBpbg0KPiBleGFjdGx5
IG9uZSBsb2NhdGlvbj8NCj4gDQo+IFlvdSBkb24ndCBuZWVkIGEgdGNnX3RlbXBfbG9jYWxfbmV3
LCBiZWNhdXNlIHRoZSBjYyB2YWx1ZSBpcyBub3QgdXNlZCBwYXN0IHRoZQ0KPiBicmFuY2guICBZ
b3Ugc2hvdWxkIGZyZWUgdGhlIHRlbXAgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGJyYW5jaC4NCj4g
DQoNCkkgd29uZGVyIGlmIHdoYXQgeW91IHRob3VnaHQgd2FzIHRvIG1vdmUgdGhvc2UgbWFjcm9z
IHRvIGZ1bmN0aW9ucyBhbmQgDQpjYWxsIGl0IHdoZW4gQ0NfUFJPTE9HVUUgYW5kIENDX0VQSUxP
R1VFIGFyZSB1c2VkLg0KSSB0aGluayB0aGUgbWFjcm9zIHdlcmUgY2hvb3NlbiBkdWUgdG8gdGhl
IHNoYXJpbmcgb2YgdGhlICdjYycgYW5kIA0KJ2RvbmUnIHZhcmlhYmxlcyBpbiBib3RoIENDX1BS
T0xPR1VFIEFORCBDQ19FUElMT0dVRS4NCg0KPj4gK3ZvaWQgZ2VuX2dvdG9fdGIoRGlzYXNDb250
ZXh0ICpjdHgsIGludCBuLCBUQ0d2IGRlc3QpDQo+PiArew0KPj4gKyAgICB0Y2dfZ2VuX21vdl90
bChjcHVfcGMsIGRlc3QpOw0KPj4gKyAgICB0Y2dfZ2VuX2FuZGlfdGwoY3B1X3BjbCwgZGVzdCwg
MHhmZmZmZmZmYyk7DQo+PiArICAgIGlmIChjdHgtPmJhc2Uuc2luZ2xlc3RlcF9lbmFibGVkKSB7
DQo+PiArICAgICAgICBnZW5faGVscGVyX2RlYnVnKGNwdV9lbnYpOw0KPj4gKyAgICB9DQo+PiAr
ICAgIHRjZ19nZW5fZXhpdF90YihOVUxMLCAwKTsNCj4gDQo+IE1pc3NpbmcgZWxzZS4gIFRoaXMg
aXMgZGVhZCBjb2RlIGZvciBzaW5nbGUtc3RlcC4NCkdvZXMgYSBsaXR0bGUgYWJvdmUgbXkga25v
d2xlZGdlIG9mIFFFTVUgaW50ZXJuYWxzIHRvIGJlIGhvbmVzdC4NCkRvIHlvdSBoYXZlIGEgcmVj
b21tZW5kYXRpb24gd2hhdCB3ZSBzaG91bGQgYmUgZG9pbmcgaGVyZSA/DQoNCj4gDQo+PiArdm9p
ZCBhcmNfdHJhbnNsYXRlX2luaXQodm9pZCkNCj4+ICt7DQo+PiArICAgIGludCBpOw0KPj4gKyAg
ICBzdGF0aWMgaW50IGluaXRfbm90X2RvbmUgPSAxOw0KPj4gKw0KPj4gKyAgICBpZiAoaW5pdF9u
b3RfZG9uZSA9PSAwKSB7DQo+PiArICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4gDQo+IFVz
ZWxlc3MuICBUaGlzIHdpbGwgb25seSBiZSBjYWxsZWQgb25jZS4NCj4gDQo+PiArI2RlZmluZSBB
UkNfUkVHX09GRlMoeCkgb2Zmc2V0b2YoQ1BVQVJDU3RhdGUsIHgpDQo+PiArDQo+PiArI2RlZmlu
ZSBORVdfQVJDX1JFRyh4KSBcDQo+PiArICAgICAgICB0Y2dfZ2xvYmFsX21lbV9uZXdfaTMyKGNw
dV9lbnYsIG9mZnNldG9mKENQVUFSQ1N0YXRlLCB4KSwgI3gpDQo+PiArDQo+PiArICAgIGNwdV9T
MWYgPSBORVdfQVJDX1JFRyhtYWNtb2QuUzEpOw0KPj4gKyAgICBjcHVfUzJmID0gTkVXX0FSQ19S
RUcobWFjbW9kLlMyKTsNCj4+ICsgICAgY3B1X0NTZiA9IE5FV19BUkNfUkVHKG1hY21vZC5DUyk7
DQo+PiArDQo+PiArICAgIGNwdV9aZiAgPSBORVdfQVJDX1JFRyhzdGF0LlpmKTsNCj4+ICsgICAg
Y3B1X0xmICA9IE5FV19BUkNfUkVHKHN0YXQuTGYpOw0KPj4gKyAgICBjcHVfTmYgID0gTkVXX0FS
Q19SRUcoc3RhdC5OZik7DQo+PiArICAgIGNwdV9DZiAgPSBORVdfQVJDX1JFRyhzdGF0LkNmKTsN
Cj4+ICsgICAgY3B1X1ZmICA9IE5FV19BUkNfUkVHKHN0YXQuVmYpOw0KPj4gKyAgICBjcHVfVWYg
ID0gTkVXX0FSQ19SRUcoc3RhdC5VZik7DQo+PiArICAgIGNwdV9ERWYgPSBORVdfQVJDX1JFRyhz
dGF0LkRFZik7DQo+PiArICAgIGNwdV9FU2YgPSBORVdfQVJDX1JFRyhzdGF0LkVTZik7DQo+PiAr
ICAgIGNwdV9BRWYgPSBORVdfQVJDX1JFRyhzdGF0LkFFZik7DQo+PiArICAgIGNwdV9IZiAgPSBO
RVdfQVJDX1JFRyhzdGF0LkhmKTsNCj4+ICsgICAgY3B1X0lFZiA9IE5FV19BUkNfUkVHKHN0YXQu
SUVmKTsNCj4+ICsgICAgY3B1X0VmICA9IE5FV19BUkNfUkVHKHN0YXQuRWYpOw0KPj4gKw0KPj4g
KyAgICBjcHVfaXNfZGVsYXlfc2xvdF9pbnN0cnVjdGlvbiA9IE5FV19BUkNfUkVHKHN0YXQuaXNf
ZGVsYXlfc2xvdF9pbnN0cnVjdGlvbik7DQo+PiArDQo+PiArICAgIGNwdV9sMV9aZiA9IE5FV19B
UkNfUkVHKHN0YXRfbDEuWmYpOw0KPj4gKyAgICBjcHVfbDFfTGYgPSBORVdfQVJDX1JFRyhzdGF0
X2wxLkxmKTsNCj4+ICsgICAgY3B1X2wxX05mID0gTkVXX0FSQ19SRUcoc3RhdF9sMS5OZik7DQo+
PiArICAgIGNwdV9sMV9DZiA9IE5FV19BUkNfUkVHKHN0YXRfbDEuQ2YpOw0KPj4gKyAgICBjcHVf
bDFfVmYgPSBORVdfQVJDX1JFRyhzdGF0X2wxLlZmKTsNCj4+ICsgICAgY3B1X2wxX1VmID0gTkVX
X0FSQ19SRUcoc3RhdF9sMS5VZik7DQo+PiArICAgIGNwdV9sMV9ERWYgPSBORVdfQVJDX1JFRyhz
dGF0X2wxLkRFZik7DQo+PiArICAgIGNwdV9sMV9BRWYgPSBORVdfQVJDX1JFRyhzdGF0X2wxLkFF
Zik7DQo+PiArICAgIGNwdV9sMV9IZiA9IE5FV19BUkNfUkVHKHN0YXRfbDEuSGYpOw0KPj4gKw0K
Pj4gKyAgICBjcHVfZXJfWmYgPSBORVdfQVJDX1JFRyhzdGF0X2VyLlpmKTsNCj4+ICsgICAgY3B1
X2VyX0xmID0gTkVXX0FSQ19SRUcoc3RhdF9lci5MZik7DQo+PiArICAgIGNwdV9lcl9OZiA9IE5F
V19BUkNfUkVHKHN0YXRfZXIuTmYpOw0KPj4gKyAgICBjcHVfZXJfQ2YgPSBORVdfQVJDX1JFRyhz
dGF0X2VyLkNmKTsNCj4+ICsgICAgY3B1X2VyX1ZmID0gTkVXX0FSQ19SRUcoc3RhdF9lci5WZik7
DQo+PiArICAgIGNwdV9lcl9VZiA9IE5FV19BUkNfUkVHKHN0YXRfZXIuVWYpOw0KPj4gKyAgICBj
cHVfZXJfREVmID0gTkVXX0FSQ19SRUcoc3RhdF9lci5ERWYpOw0KPj4gKyAgICBjcHVfZXJfQUVm
ID0gTkVXX0FSQ19SRUcoc3RhdF9lci5BRWYpOw0KPj4gKyAgICBjcHVfZXJfSGYgPSBORVdfQVJD
X1JFRyhzdGF0X2VyLkhmKTsNCj4+ICsNCj4+ICsgICAgY3B1X2VyZXQgPSBORVdfQVJDX1JFRyhl
cmV0KTsNCj4+ICsgICAgY3B1X2VyYnRhID0gTkVXX0FSQ19SRUcoZXJidGEpOw0KPj4gKyAgICBj
cHVfZWNyID0gTkVXX0FSQ19SRUcoZWNyKTsNCj4+ICsgICAgY3B1X2VmYSA9IE5FV19BUkNfUkVH
KGVmYSk7DQo+PiArICAgIGNwdV9idGEgPSBORVdfQVJDX1JFRyhidGEpOw0KPj4gKyAgICBjcHVf
bHBzID0gTkVXX0FSQ19SRUcobHBzKTsNCj4+ICsgICAgY3B1X2xwZSA9IE5FV19BUkNfUkVHKGxw
ZSk7DQo+PiArICAgIGNwdV9wYyA9IE5FV19BUkNfUkVHKHBjKTsNCj4+ICsgICAgY3B1X25wYyA9
IE5FV19BUkNfUkVHKG5wYyk7DQo+PiArDQo+PiArICAgIGNwdV9idGFfbDEgPSBORVdfQVJDX1JF
RyhidGFfbDEpOw0KPj4gKyAgICBjcHVfYnRhX2wyID0gTkVXX0FSQ19SRUcoYnRhX2wyKTsNCj4+
ICsNCj4+ICsgICAgY3B1X2ludHZlYyA9IE5FV19BUkNfUkVHKGludHZlYyk7DQo+PiArDQo+PiAr
ICAgIGZvciAoaSA9IDA7IGkgPCA2NDsgaSsrKSB7DQo+PiArICAgICAgICBjaGFyIG5hbWVbMTZd
Ow0KPj4gKw0KPj4gKyAgICAgICAgc3ByaW50ZihuYW1lLCAiclslZF0iLCBpKTsNCj4+ICsNCj4+
ICsgICAgICAgIGNwdV9yW2ldID0gdGNnX2dsb2JhbF9tZW1fbmV3X2kzMihjcHVfZW52LA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSQ19SRUdfT0ZGUyhy
W2ldKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJk
dXAobmFtZSkpOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGNwdV9ncCAgICAgPSBjcHVfclsy
Nl07DQo+PiArICAgIGNwdV9mcCAgICAgPSBjcHVfclsyN107DQo+PiArICAgIGNwdV9zcCAgICAg
PSBjcHVfclsyOF07DQo+PiArICAgIGNwdV9pbGluazEgPSBjcHVfclsyOV07DQo+PiArICAgIGNw
dV9pbGluazIgPSBjcHVfclszMF07DQo+PiArICAgIGNwdV9ibGluayAgPSBjcHVfclszMV07DQo+
PiArICAgIGNwdV9hY2NsbyAgPSBjcHVfcls1OF07DQo+PiArICAgIGNwdV9hY2NoaSAgPSBjcHVf
cls1OV07DQo+PiArICAgIGNwdV9scGMgICAgPSBjcHVfcls2MF07DQo+PiArICAgIGNwdV9saW1t
ICAgPSBjcHVfcls2Ml07DQo+PiArICAgIGNwdV9wY2wgICAgPSBjcHVfcls2M107DQo+IA0KPiBZ
b3Ugc2hvdWxkbid0IG5lZWQgdHdvIHBvaW50ZXJzIHRvIHRoZXNlLiAgRWl0aGVyIHVzZSBjcHVf
cltQQ0xdIChwcmVmZXJyZWQpIG9yDQo+ICNkZWZpbmUgY3B1X3BjbCBjcHVfcls2M10uDQpJIHdp
bGwgY2hhbmdlIGl0IHRvIG1hY3JvcyBpbnN0ZWFkLCBpZiB5b3UgZG9uJ3QgbWluZC4NCj4gWW91
IGNvdWxkIHB1dCBhbGwgb2YgdGhlc2UgaW50byBhIGNvbnN0IHN0YXRpYyB0YWJsZS4NCldoYXQg
ZG8geW91IG1lYW4sIGNhbiB3ZSBtYWtlIHRoZSBlZmZlY3Qgb2YgdGNnX2dsb2JhbF9tZW1fbmV3
X2kzMiBhcyANCmNvbnN0YW50ID8NCg0KPj4gK3N0YXRpYyB2b2lkIGluaXRfY29uc3RhbnRzKHZv
aWQpDQo+PiArew0KPj4gKyNkZWZpbmUgU0VNQU5USUNfRlVOQ1RJT04oLi4uKQ0KPj4gKyNkZWZp
bmUgTUFQUElORyguLi4pDQo+PiArI2RlZmluZSBDT05TVEFOVChOQU1FLCBNTkVNT05JQywgT1Bf
TlVNLCBWQUxVRSkgXA0KPj4gKyAgYWRkX2NvbnN0YW50X29wZXJhbmQoTUFQXyMjTU5FTU9OSUMj
I18jI05BTUUsIE9QX05VTSwgVkFMVUUpOw0KPj4gKyNpbmNsdWRlICJ0YXJnZXQvYXJjL3NlbWZ1
bmNfbWFwcGluZy5kZWYiDQo+PiArI2luY2x1ZGUgInRhcmdldC9hcmMvZXh0cmFfbWFwcGluZy5k
ZWYiDQo+PiArI3VuZGVmIE1BUFBJTkcNCj4+ICsjdW5kZWYgQ09OU1RBTlQNCj4+ICsjdW5kZWYg
U0VNQU5USUNfRlVOQ1RJT04NCj4+ICt9DQo+IA0KPiBFdy4gIFlldCBhbm90aGVyIHRoaW5nIHRo
YXQgY2FuIGJlIGRvbmUgYXQgYnVpbGQgdGltZS4NCkFzIGZhciBhcyBJIHJlbWVtYmVyIGl0LCB0
aGVyZSB3YXMgbm8gd2F5IEkgY291bGQgZ2VuZXJhdGUgdGhpcyB0YWJsZSANCnVzaW5nIHRoZSBD
IHByZS1wcm9jZXNzb3IuIERvIHlvdSBzdWdnZXN0IHRvIG1ha2UgdGhpcyB0YWJsZSB1c2luZyBh
biANCmV4dGVybmFsIHRvb2wgPw0KDQoNCj4gDQo+PiArICAgICAgICAgICAgaW50MzJfdCBsaW1t
ID0gb3BlcmFuZC52YWx1ZTsNCj4+ICsgICAgICAgICAgICBpZiAob3BlcmFuZC50eXBlICYgQVJD
X09QRVJBTkRfTElNTSkgew0KPj4gKyAgICAgICAgICAgICAgICBsaW1tID0gY3R4LT5pbnNuLmxp
bW07DQo+PiArICAgICAgICAgICAgICAgIHRjZ19nZW5fbW92aV90bChjcHVfbGltbSwgbGltbSk7
DQo+PiArICAgICAgICAgICAgICAgIHJldCA9IGNwdV9yWzYyXTsNCj4+ICsgICAgICAgICAgICB9
IGVsc2Ugew0KPj4gKyAgICAgICAgICAgICAgICByZXQgPSB0Y2dfY29uc3RfbG9jYWxfaTMyKGxp
bW0pOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKw0K
Pj4gKyAgcmV0dXJuIHJldDsNCj4gDQo+IFdoeSBhcmUgeW91IHVzaW5nIGxvY2FscyBmb3IgZXZl
cnl0aGluZz8gIElzIGl0IGJlY2F1c2UgeW91IGhhdmUgbm8gcHJvcGVyDQo+IGNvbnRyb2wgb3Zl
ciB5b3VyIHVzZSBvZiBicmFuY2hpbmc/DQoNCkluaXRpYWxseSB3ZSB0aG91Z2ggbG9jYWxzIHRo
ZSBnb29kIHdheSB0byBkZWZpbmUgdGVtcG9yYXJpZXMuIDotKA0KV2hhdCBzaG91bGQgYmUgdGhl
IGJlc3QgPyBXZSB3aWxsIG5lZWQgdG8gY2hhbmdlIGEgbG90IG9mIGNvZGUgZm9yIHRoaXMuDQoN
Cj4gDQo+PiArICAgIHFlbXVfbG9nX21hc2soQ1BVX0xPR19UQl9JTl9BU00sDQo+PiArICAgICAg
ICAgICAgICAgICAgIkNQVSBpbiBzbGVlcCBtb2RlLCB3YWl0aW5nIGZvciBhbiBJUlEuXG4iKTsN
Cj4gDQo+IEluY29ycmVjdCBsZXZlbCBhdCB3aGljaCB0byBsb2cgdGhpcy4NCj4gDQo+IFlvdSB3
YW50ZWQgdGhlIGxvZ2dpbmcgYXQgcnVudGltZSwgbm90IHRyYW5zbGF0ZS4gV2hpY2ggc3VnZ2Vz
dHMgeW91J2QgYmUNCj4gYmV0dGVyIG9mZiBtb3ZpbmcgdGhpcyBlbnRpcmUgZnVuY3Rpb24gdG8g
YSBoZWxwZXIuDQo+IA0KPj4gKy8qIFJldHVybiBmcm9tIGV4Y2VwdGlvbi4gKi8NCj4+ICtzdGF0
aWMgdm9pZCBnZW5fcnRpZShEaXNhc0NvbnRleHQgKmN0eCkNCj4+ICt7DQo+PiArICAgIHRjZ19n
ZW5fbW92aV90bChjcHVfcGMsIGN0eC0+Y3BjKTsNCj4+ICsgICAgZ2VuX2hlbHBlcl9ydGllKGNw
dV9lbnYpOw0KPj4gKyAgICB0Y2dfZ2VuX21vdl90bChjcHVfcGMsIGNwdV9wY2wpOw0KPj4gKyAg
ICBnZW5fZ290b190YihjdHgsIDEsIGNwdV9wYyk7DQo+PiArfQ0KPiANCj4gWW91IG11c3QgcmV0
dXJuIHRvIHRoZSBtYWluIGxvb3AgaGVyZSwgbm90IGdvdG9fdGIuICBZb3UgbXVzdCByZXR1cm4g
dG8gdGhlDQo+IG1haW4gbG9vcCBldmVyeSB0aW1lIHlvdXIgaW50ZXJydXB0IG1hc2sgY2hhbmdl
cywgc28gdGhhdCBwZW5kaW5nIGludGVycnVwdHMNCj4gbWF5IGJlIGFjY2VwdGVkLg0KPiANCiJn
ZW5fZ290b190YiIgY2FsbHMgaW4gdGhlIGVuZCAidGNnX2dlbl9leGl0X3RiKE5VTEwsIDApIiwg
aXMgaXQgbm90IHRoZSANCnNhbWUgPw0KV2UgbmVlZCB0byBpbnZlc3RpZ2F0ZSB0aGlzIGltcGxl
bWVudGF0aW9uIGZ1cnRoZXIuIEEgcXVpY2sgY2hhbmdlIHRvIA0KZ2VuX3J0aWUgYnJva2UgbGlu
dXggYm9vdGluZy4NCkNhbiB5b3UgcmVjb21lbmQgc29tZSB0YXJnZXQgdGhhdCBpbXBsZW1lbnRz
IHRoZSBsb29wIGV4aXQgb24gcnRpZSBhcyANCnlvdSBzdWdnZXN0ID8NCg0K

