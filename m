Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C42F848A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:37:24 +0100 (CET)
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TyN-0004vN-9L
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0SdK-0007hh-P4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:34 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0SdF-0006n9-8Z
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:33 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E74C740762;
 Fri, 15 Jan 2021 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730684; bh=Pp+oQesgsscCqKon9plKNcXs8f1MAFsnahw6wKCVQDI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dMzUk8Lgbv5TOWt/KSicAFmCtKsDZKZDHQKIa+ZjByEwMskwo012sabrLxxpBikCA
 3yfyzH2HAJY/EvZM83UadZfMD8MRI8nhzD9sSt0S38f2R5noIBiNVMq3JEuVhiHTu6
 d4B3At3fnOVCGMPI+BHNUXG7sS4etSPEcZ8j9hT2QhkQUD8JM1Zb1KdkLYoRVy7Mq7
 bufQmfoisOlhvf72Y84Xi2GeA9UgBvoP/mlVcuE/QnsZejwaD3PV5L1NgX968o/4hF
 hxdlTcGFF+lPvhWowtjR1PlBQfLrTLoeU/lJpeauzjoC+CBYFZBMgcnlq1EHQywzJ+
 EXM1FmEjPspuQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0CFB2A0083;
 Fri, 15 Jan 2021 17:11:22 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8FE87802BC;
 Fri, 15 Jan 2021 17:11:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="cgfk+uwF";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbrP9G2c6tWtpLKxRTjSITjbIqlw9pfGJr+GuguiuovyT5y7tpcfsY0Wiy9Cjworv2XtuImcFj5/O3lSJgWp2OPWota3t+CV6mFOjUMMwPuagNX+wAjfagtEFbgWRCXY7+Zr04hp7y9BOOpkwpWIWDwnio5a67XAFRWmq71+fFRQWVY6UMErg4SQfsCJhWnusC7CvNV7PKbOEkgd0WnHHUHpFzlyGXr2a52QO8h8SJzH0rAaXHFmwDeF+no9C35Xi5rNd5EyB82lnErLQ8VO6XVPXTEq0kWOC+gesXJp4joJGh/tu6kVQbIT7oVBBbQwBSaRoPd6aCAG7j1bEHTyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pp+oQesgsscCqKon9plKNcXs8f1MAFsnahw6wKCVQDI=;
 b=k8vwMFMjcoQ2PtPymhljmOXQGnhNqMatlpDu0jb+cjIqCiNZukKhtGZoCV4Kid7mqfKmXG/5eCuZp18Cxf+VsTxSJom/pdpGYBpxqNhBdnEK8AyQFm4Og0jR/S/wasIKB2i/MRuXuSvy2OVbZy7b3k4qZjDO/CnBQHUx3IIg72NAFtjus1JSw+4GdTcYfi0LIPfAxpn4V5N/eVwBDL7I327pUCuvAj7TnvKM+WI1NsN0mNMWoTiKDz7L0XhcEbT1R1f3wPyjgVJrHPp9Df4RmCVIcIoavb+oJF9+yIc453jWFumpmpGsmLpQ1Q/0s+cE0xP1OePn9EKQlWmRWWazTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pp+oQesgsscCqKon9plKNcXs8f1MAFsnahw6wKCVQDI=;
 b=cgfk+uwFv9GdNSK1f16ye6RO0Zs6b0U6iMnv2JGcQo2ESpelqkiGiU4LWnhyL1zC/HAenbWiBfXy7lf/xr5pvaRuPjr28dMeKhRh0JBHSc/PhCgjZtY7ae1k0+RvNboCAxsLcG++IDcv++Aye8hJvkP2PeGLTMPOw+4dc+566eQ=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:16 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:16 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 03/15] arc: Opcode definitions table
Thread-Topic: [PATCH 03/15] arc: Opcode definitions table
Thread-Index: AQHW62Futm1hkevCxkC+Qhjmw9IAIg==
Date: Fri, 15 Jan 2021 17:11:16 +0000
Message-ID: <214ddc83-cf6e-20e7-0a86-92af851809e4@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-4-cupertinomiranda@gmail.com>
 <7336e0b3-13e8-a3d7-46fb-a4ea942c5c16@linaro.org>
In-Reply-To: <7336e0b3-13e8-a3d7-46fb-a4ea942c5c16@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa5afbd8-3d04-4f8e-2e6a-08d8b97891a1
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB41762AD25ADF5FA122E0A84AA8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IyJ3jTHwqP+ilmufeSpA7oBaspe1sCz0lMlMAxUjr74S5sB2ElAhyVm0xUXyIhdzQxeD6uixyFisM60CfpI2M79M5NawySUpo6iQQqwogz5NpryuHMaBzR+S2K/cSieYDapmz66H2+LTJYhpikVLnLsTE69G7W2cPkYSTsoY9CleFRMYyTiVeFB+bp5CWkLBwZQbQMqYmFfoAMzCk/M0GaynkStB/ZhCGxNTeUyGMGBxU3p0S2rFzJFgjyxkvKqzbMWnLUxYru4qn4Itmsj2MWGw7xaybKT/vL4zRxqclvCpRGx1OPnLzrmjvBf5IprezlpL3f6sY+1lAqz+r/bhgXaJ1U1eJBEmdtTx2fQejpAFxIKOe0u1zt6KNq3zMRfT7pqjZZHtBRXsb6pLnvkrGFbg6SuKJ1xST+I4aPsTdMEHLRdY4VjvkgdA14bVCcQ3a0o99N9tKVAv6zWEcZ2vDDJtXDHsQdZcXjFR4JkiMZ06ws9ZA7+yn6TKVdGBnY5ojgfkc7U9nJxJdpKfi4kAM0nLmJfmPV8sCBQzrN+945y1oWSRG3SaUFI4SF5rDXBq/OOS8m1gvARr9nyMw1yj3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(53546011)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aTBXMlJDZWo2K0srWm5VYW5XNFVaOHA5bXFURTBEeXBWaWF4SGR1cjBEQXV3?=
 =?utf-8?B?Uy9HOHh3SDhvMWJRaUtCYytxcG53V0FoN3g5TUhoMUNXS0tPMjZGcEg0d2Q1?=
 =?utf-8?B?aXpqd2wrOTlFeXJqMlRzMFVodWsxN0NWZ0lOYUtJWVRETVJIZlBRMGd6NHYv?=
 =?utf-8?B?YXVhVU40K203Tk5xclE0ZWxnVWpTMENOVnNKYXdrY1N5OUl0RDFlREh4WDZq?=
 =?utf-8?B?b0Z2Q0pCRlVEN01VUUhKTUJQcTZxRyt0WTZsaVRiUk1BTVJyRHVRN28zRHgv?=
 =?utf-8?B?MjF6Y1BjdVhQNFhuV2VVQlk2K0hoZEI0S1ZQWUVRMHZ3NmppTTJCcHp1Vmlk?=
 =?utf-8?B?LzVhMWs5WlI1U3ZlUU0vRjc5VzJJVUhrWFE4M2dwZmtOYU41R3NSaGRRT29R?=
 =?utf-8?B?SjgzVzh4S00wS0hDMkJNQWxYUWc3YmFvNHMvS2tvNEdzT25pMnB5UytBWXcw?=
 =?utf-8?B?UWdSVm9NS01DV09EenZZK1B5clBpdFdCeXVVSkRzOENZNlhIYTB5QkZEVlVp?=
 =?utf-8?B?ZlI0S1FXVWlscFBwUjZIS2RsdjVoUHMyVHR5em5rRTNjZG1ZbnJ1em9EZ0dT?=
 =?utf-8?B?aW4wVGx2bVpFM25jUTFZN2RIZ25UeVZWUXl4M0x1ZjN4R2R3QXpTYlllcmln?=
 =?utf-8?B?T09OYlFUc3hENU5aK1JSKzc3SGl3WllWdFFUY0UzZUsxc2QvNEhNR1JpWnd0?=
 =?utf-8?B?Z2pQMlpNQWs3OUd4MkRMQmcxRkplVzIwZ01qMWZhRmtaRkhYczFSNnZHZXpx?=
 =?utf-8?B?WXhCM3ZyVWU1ZG9JVDZqcUhGSDVXSngwSndjRmNaM0g5Y3lGODQzZTlCL1pL?=
 =?utf-8?B?dGlrMnhKSmttakxkL2hQd2poNnFvb1RaY3JHcXJYL3hWT3J0T2taMmJpZnpu?=
 =?utf-8?B?Z0NRK21BdlNvVVhQbUs3RGc5S3hTOC9WblBmcTR6b1VYbzRWbEg5Wm90UnRp?=
 =?utf-8?B?ek92ZDVETE9xWWd2UlBOMkp4RzBzYjE3K1Iwa1JJR3JVeXJ1REpqZy8rOVUy?=
 =?utf-8?B?STZzYVoyWGR0dG9DYjBTWlNCYk1TRmF6THJkaWxTaVp3RGRxbjVIdU1aTzE3?=
 =?utf-8?B?anBGVHNJSFZlQUFSNlJCV1RaZCs2MFVDMzRjSjdoL1dLcGQ5QVFya0N2WnBF?=
 =?utf-8?B?STBLUVk1ZElINGN1WkdSR3dmUmdyUDZGTlNPMWZFUTJTUXhQdXY2eHJLWWhy?=
 =?utf-8?B?UnhpaXhyRWhTM1podFpQYU14cVgwOFdpNVBsVnZNNEdDUUVZcnBMYlo0enVn?=
 =?utf-8?B?NHhRZDBuM3RxMXFpVkJyZlJ5MUxhZ2FoVzIvandrOXZpRlYwNE1mZUUxNWti?=
 =?utf-8?Q?d5zpvd/3rI8Rc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77292E847F96854895C72368613B19BE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5afbd8-3d04-4f8e-2e6a-08d8b97891a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:16.1736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6AaP4i8lcqdCOe5p7oxg3AgxDnOMZDG97BZ/T61HuqSx22+jykwHtt2e+l9DBeyJF1pm9CUbhi2ThHlULy7Mg==
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
X-Mailman-Approved-At: Fri, 15 Jan 2021 13:34:21 -0500
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

SGkgUmljaGFyZCwNCg0KU29ycnkgdG8gdGFrZSBzbyBsb25nIHRvIGdldCB0aHJvdWdoIHRoZSBj
aGFuZ2VzIGFmdGVyIHlvdXIgcmV2aWV3Lg0KSSBhbSBzdGlsbCBnb2luZyB0aHJvdWdoIHRoZSBp
bXByb3ZpbmcgcHJvY2VzcyBhbmQgd2FpdGluZyBmb3Igc29tZSANCmludGVybmFsIGNvbXBhbnkg
YXBwcm92YWwgdG8gcHVibGlzaCB0aGUgZ2VuZXJhdG9yIG9mIHRoZSBUQ0cgDQppbnN0cnVjdGlv
biBkZWZpbml0aW9ucywgYXMgd2UgaGF2ZSBkaXNjdXNzZWQuDQoNCk5ldmVydGhlbGVzcywgdGhl
cmUgYXJlIHNvbWUgcXVlc3Rpb25zLiBJIHdpbGwgYWRkcmVzcyB0aGVtIG5lYXIgdGhlIA0KcHJv
cGVyIHBsYWNlcyBhbmQgdGhyb3VnaCB0aGUgZGlmZmVyZW50IHBhdGNoZXMuDQoNCk9uY2UgYWdh
aW4sIHRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmV2aWV3cy4gOy0pDQoNCk9uIDEyLzEv
MjAgODoyMiBQTSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDExLzExLzIwIDEwOjE3
IEFNLCBjdXBlcnRpbm9taXJhbmRhQGdtYWlsLmNvbSB3cm90ZToNCj4+IEZyb206IENsYXVkaXUg
Wmlzc3VsZXNjdSA8Y2xhemlzc0BzeW5vcHN5cy5jb20+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Q2xhdWRpdSBaaXNzdWxlc2N1IDxjbGF6aXNzQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gICB0
YXJnZXQvYXJjL29wY29kZXMuZGVmIHwgMTk5NzYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOTk3NiBpbnNlcnRpb25zKCspDQo+
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvYXJjL29wY29kZXMuZGVmDQo+IA0KPiBPTUcu
ICAyMGsgbGluZXMuDQo+IA0KPiBJIGFzc3VtZSB0aGlzIGlzIGdudSBiaW51dGlscyBvcGNvZGVz
L2FyYy10YmwuaD8NCj4gDQo+IFlvdSBhcmUgdGhlIGNvbnRyaWJ1dG9yIHRoZXJlLCBzbyBhIHJl
LWxpY2Vuc2UgaXMgZmluZS4gIEl0IHdvdWxkIGJlIGdvb2QgdG8NCj4gZG9jdW1lbnQgdGhlIHVw
c3RyZWFtIGxvY2F0aW9uIGFuZCByZXZpc2lvbiwgYWdhaW5zdCBzb21lIGZ1dHVyZSByZS1zeW5j
Lg0KPiANCj4gVGhhdCBzYWlkLCB0aGlzIGZvcm1hdCBpcyBsZXNzIHRoYW4gaWRlYWw6DQo+IA0K
Pj4gKy8qIGFiczwuZj4gYixjIDAwMTAwYmJiMDAxMDExMTFGQkJCQ0NDQ0NDMDAxMDAxLiAgKi8N
Cj4+ICt7ICJhYnMiLCAweDIwMkYwMDA5LCAweEY4RkYwMDNGLCBBUkNfT1BDT0RFX0FSQzYwMCB8
IEFSQ19PUENPREVfQVJDNzAwIHwgQVJDX09QQ09ERV9BUkN2MkVNIHwgQVJDX09QQ09ERV9BUkN2
MkhTLCBBUklUSCwgTk9ORSwgeyBPUEVSQU5EX1JCLCBPUEVSQU5EX1JDIH0sIHsgQ19GIH19LA0K
PiANCj4gWW91J3ZlIGdvdCB0aGUgc2FtZSBpbmZvcm1hdGlvbiBpbiB0d28gcGxhY2VzDQo+ICgw
MDEwMGJiYjAwMTAxMTExRkJCQkNDQ0NDQzAwMTAwMSkgdnMgKDB4MjAyRjAwMDksIDB4RjhGRjAw
M0YsIE9QRVJBTkRfKikuDQo+IE1vcmVvdmVyLCAiYWJzIiBhcyBhIHN0cmluZyBpcyBub3QgZXNw
ZWNpYWxseSB1c2VmdWwsIGFuZCBtZWFucyB0aGF0IHlvdSBoYXZlDQo+IHRvIGRlYWwgd2l0aCBz
dHJpbmdzIGluIHRoZSB0cmFuc2xhdG9yIGluc3RlYWQgb2YgQyBzeW1ib2xzIG9yIGVudW1lcmF0
b3JzLg0KPiANCj4gSXQgd291bGQgYmUgcmVsYXRpdmVseSBlYXN5IHRvIGdlbmVyYXRlIGEgZGVj
b2RldHJlZSBmaWxlIGZyb20gdGhpcyBpbnB1dCwNCj4gd2hpY2ggd291bGQgc2ltcGxpZnkgdGhl
IHRyYW5zbGF0b3IuDQo+IA0KPiBBdCBhIGJhcmUgbWluaW11bSBzdHJpcCB0aGUgcXVvdGVzIGFu
ZCB3cmFwIGluIGEgbWFjcm8gc28gdGhhdCB5b3UgY2FuICgxKQ0KPiBkZWZpbmUgYW4gZW51bWVy
YXRvciBhbmQgKDIpIHB1dCB0aGUgZW50cmllcyBpbnRvIGFuIGFycmF5IGluZGV4ZWQgYnkgdGhl
DQo+IGVudW1lcmF0b3IuDQo+IA0KDQpBcyB5b3Uga25vdywgd2UgcmV1c2VkIHRoZSBjb2RlIGZy
b20gYmludXRpbHMgdG8gaW1wbGVtZW50IHRoZSBkZWNvZGVyLg0KSW4gdGhhdCBzZW5zZSwgd2Ug
a2luZGx5IHJlcXVlc3QgdG8gYWxsb3cgdXMgdG8gZG8gaXQgdGhyb3VnaCBiaW51dGlscyANCmRl
dmVsb3BtZW50IGZsb3cgbGF0ZXIgb24uIFdlIHdpbGwgY2hhbmdlIHRoZSB0YWJsZXMgaW4gYmlu
dXRpbHMNCmFuZCB0aG9zZSBjaGFuZ2VzIHdpbGwgYWxzbyBiZSBtaXJyb3JlZCB0byBRRU1VLg0K
SXMgdGhpcyBPayA/DQoNCg0K

