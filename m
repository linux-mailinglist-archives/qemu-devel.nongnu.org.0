Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA882F849D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:41:07 +0100 (CET)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0U1y-0007K3-I7
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0SdQ-0007ji-7A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:40 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:56288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0SdO-0006qi-4J
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:39 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDA7DC0ADB;
 Fri, 15 Jan 2021 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730696; bh=j9B9XIXVF4vkjSmYxb5DJ+JBUNW6MyxSqjX/tNtMKo0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jVynRyDn4DrNd8NbvqrjRWo5n/55rtFFX7NfWTVzI9OKC+aKySOzkn1aOI5al6wH3
 40PfBq5nEtYsnThYqPSByBRh9uuKlByy3/Ztja9dmWIIKAqpdTQq+V90aZz91D3UYp
 iUtP+eCxazkyTQrhjbF5+l08dPe33YkiDJlSKyDtg+XwjheVILezC5J00katVhiGDV
 TYP2XJT/Wy1T2yg7SLuQM3ZhTFlGMxVrMbALIcGrVUkK7Bh/MZmI/KGVq9APnYjtoo
 7s/B4P+VywZOBv8f4lixipu83OYOWeEsrJVXNDKWdruPyRFo48euuZ3z04iuCf2AnH
 iUNEam/4ZjQwQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 72A43A006A;
 Fri, 15 Jan 2021 17:11:31 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D2FD8154D;
 Fri, 15 Jan 2021 17:11:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vxcS+x53";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThnrkhjZPUu6k5nHoCWtEqN3+dh8LtwJ0jIp89T8MKuIFarIHh3ZmuVqrvvVSxAl8L5GZUwZ6os4EPztiAs0j9MXFtEui7kXMbpTro9tSIlnZvwRPfCSO7jceQm+sx7fTijoYe1agQI11MLpaBwCmqKCEzG852wXTU/k5DHqdAR7Uo9UVDbN+LF7s4kcQ4/Ird2iIBaVeDLon89QOzdqqeu70kssPtuFPNvfZOFzyOlbNpF/B+dnanChagD2+UPcPjnIG8gcZLpsWffSql5Gl8dbzuU6pq84tgk7HieSlpjzCWtjiz2vybk1kf3fyX35+4FtCiZDBaZu4bwA9N9aPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9B9XIXVF4vkjSmYxb5DJ+JBUNW6MyxSqjX/tNtMKo0=;
 b=TiRUorHNqKUKemkcGOujVccnthkxMJeWVGkJrdKFWMWmXCr2ECMJInDrHnIoB6ESEva4nHmTGR/XudYSN7F/CdLDCL+BjPcGFL8gV/F/jx6tO+015R6TKrTerwnUnlFjWX66GpaIbkfUjhOfyJkFze+E5D0Dd3geiST8j7ujGsF6uh4SPxerXlrhCgcybB8qgx//djH97jqtpfIoIyuhtV8v10DXRQHybRoLZ5xe56SouytpvnUAO8EveUXajqNSo3l9hCdMkwxevze9wD7DzvUt/ODUwk09b/5g6Pi5UWOEpN+62342BC493YqAUBSp+g6f2AUFrgoMRqEX4/XZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9B9XIXVF4vkjSmYxb5DJ+JBUNW6MyxSqjX/tNtMKo0=;
 b=vxcS+x53GKfq5gbw3mlxvSIZkJSM9yiz6N90kkhtggQcoQqWR0CMZR8vETXgMUu4/u5afaUc3cqQuT5e6QV3zHQNyUleY63AQJyxDn134goVn8ZSGxiiQN18Y7xEgWZ2OKIr2AYKDHTtEfjJhaAvHqS8kAMu/gHT+f6HrUr47wc=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:27 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:27 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHW62F0vmOtZqCO7Uy4HrbUomKevA==
Date: Fri, 15 Jan 2021 17:11:27 +0000
Message-ID: <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
In-Reply-To: <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f535b25-6e29-4197-b74d-08d8b9789831
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417603BC07DF8C9A0F087DA8A8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oh1dMHUEdKGBeXKOcC2aySUAMhxm4nxOjMY+qFARfoOyd2DGqu1gSNzb2HwdhgCFH6TNxb6eJ2vOR3es7nF+/M+uxjDu5bsQe48zMHjmpN/Fg1oditTVYFzOgS1hNzjgtWo4DeLJgwltZhs2LuhiVEswv40K7eZw0BYyAVYpNQtwLByRbrFp6lBzuH9WJU9P0GsAyLbtRleEjB2LzMdWI325d8mXjuFnJsf2eGGBU91yW4dvZmnj8EK8fSxFmiDkpDk/LJxgaxW0rLWvYRKXnXtlDDk+1ihy8aEHVhx15Q4qBaYkiEsbXsqfZhaKwwMQ1CY2C84/5s/HvWC0EIEUCyJhKBoij4kU5teDdlFJ2QnSRxUjSKx7tVyqJ5NAxxQv6pPs/5ySx+9eGgucFru4CavBTljC3UxGjBkpjjZ50RHoE8pvtSHNcxqiVowDa+v+TuZSsOA6Ur09/WnwrBJw4sceHpRrItPDsus4i1/o/eTI+pW3PzEK4tyu8K9xHEPfaLbZfrDT0hHVGzg4DAGIWEFVUuX3s1dsjTC/0rskd1KODM7IF8mx8mSJFU170TY0ECcIWYLRiBmjvjGwCv66Cw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QWthV3pEYnlSMm1SVWlWb2d1NnMrUDl3dzQzN1VUOWlwZ1RmVThoa01KbTdn?=
 =?utf-8?B?MVdiWTJndFFaZ2tROW5Hd1pKcm1HY25pOXJTMTNOSDJIWXQ2b05YbzJvUXlu?=
 =?utf-8?B?VGJsVDhJREYzWCtCcmhTU1NUQmxBS2JCd2IwVWZoVHFsU3BIZk1FV0FNNlFr?=
 =?utf-8?B?QndJN3l2L2YrS1JTeFQrZC8zZGVieWhod1M5MllpWXpaaVZwT25obldmeHo5?=
 =?utf-8?B?WlNsamlaNnVNdWNoK0w3eWlzRlZiODF3enkyb1dPN1lQZVFwelhJSTJPMWNU?=
 =?utf-8?B?ekZJWk5NZWVRbjhDcUMwN0JHYWx4UlZJOVZLMHNadkRFdGNRS2ZpdkhwVG9L?=
 =?utf-8?B?aVlqY0VOR2JRSVB2TXowUHIwZVZWOEswb1prcjFrM3RZcjlReE1CUU1rSXBk?=
 =?utf-8?B?TG9ZQzdoeVlkZk9zc3FzQTZYcXRlbGkzY3VRakoxQTI0UUYzall1ODJsZUdN?=
 =?utf-8?B?eUJOb2ozcFNOTUFWd3laMG5GQzNMQnYyZjUyUmNBSzNVQmovVVJuTGlIUS9M?=
 =?utf-8?B?cTFxalhxNXhZRkR4bmxUcnRQYVV3Rms3SVV0bFl4ZjZ1aWxWSWlNN2lFWlVj?=
 =?utf-8?B?M1NLNE45SnJET1UwQk04Rm9jVWhaOStrYmNPcDMxN1NkamtkWENKY25EWitJ?=
 =?utf-8?B?ZzRsMS9oQml2Y2hmMVdjeFBicXVkMVlJanRzYTgwZmlHM01ya0tzSkFGQ3Zy?=
 =?utf-8?B?ak84ZFhUbmtwSzlSOEZHTGlNN04xc21teldqb0ZYajNma1JmcGlJUTZjUVp1?=
 =?utf-8?B?TTdKQStwYXdKK29uc0RiR1hPOXdLaWYvMXpUM1Vuam5EbUlyenVxTDZIN2JB?=
 =?utf-8?B?TFBqNm1PcXVFNWYrNmhMWU92QmVCOS9tOUk3RXJkbStsTHJqaTgwV1d2RjNT?=
 =?utf-8?B?WWV0WkljalFPVnk5YjNPMGJFanA5WGp1SkxPUE44eVR1SjdUL1Ria2FkUnYv?=
 =?utf-8?B?c0IrdnhQSncxR1dFbXVsanAvT1R5M2pCczNXc2JCTUJHenc3ZnREVE15T1FS?=
 =?utf-8?B?V3lzcU9BM25Pc1ByWFdkVlhiaHdjbnlybFhnbnBDRDdZSlJRdk5UUmdBcWph?=
 =?utf-8?B?bTBxWTd4OWt0aEl5OU1VbU82eTdzbmNLaWdpMmIrZXlFb0FJaU5WUE4rNFNP?=
 =?utf-8?B?T0Y0ekJOcndENlB4djRNT2ZGUzIrSHpHRlBRR0RmL3UrSjBBS2FLbzNTWW13?=
 =?utf-8?B?MG5MZ1kybE8rc0FmY2M3Y0lZZjJXTjBmSnFsdDIyelF4KzY4UEpBUGRXZFlD?=
 =?utf-8?B?VGgvcmhkeit6M21VZndKYTlSYjVTSE1yUkpUc3ExMFc4cURaZ2tuV25GenZ2?=
 =?utf-8?Q?foGXiTkjniDYI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9069DDC3E418F41A828893B2FD582D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f535b25-6e29-4197-b74d-08d8b9789831
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:27.1627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73LtRw5Xvj5fvTJCJvlw6lfdzplZ76JrgCiRfWWDALi5r9qVBQsPTYksi0d6Z7TZO+nYBCzPx/LAzkmUU+P8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
Received-SPF: pass client-ip=149.117.87.133;
 envelope-from=Cupertino.Miranda@synopsys.com; helo=smtprelay-out1.synopsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Jan 2021 13:34:22 -0500
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

Pj4gK3ZvaWQgUUVNVV9OT1JFVFVSTiBoZWxwZXJfaGFsdChDUFVBUkNTdGF0ZSAqZW52LCB1aW50
MzJfdCBucGMpDQo+PiArew0KPj4gKyAgICBDUFVTdGF0ZSAqY3MgPSBlbnZfY3B1KGVudik7DQo+
PiArICAgIGlmIChlbnYtPnN0YXQuVWYpIHsNCj4+ICsgICAgICAgIGNzLT5leGNlcHRpb25faW5k
ZXggPSBFWENQX1BSSVZJTEVHRVY7DQo+PiArICAgICAgICBlbnYtPmNhdXNlY29kZSA9IDA7DQo+
PiArICAgICAgICBlbnYtPnBhcmFtID0gMDsNCj4+ICsgICAgICAgICAvKiBSZXN0b3JlIFBDIHN1
Y2ggdGhhdCB3ZSBwb2ludCBhdCB0aGUgZmF1bHR5IGluc3RydWN0aW9uLiAgKi8NCj4+ICsgICAg
ICAgIGVudi0+ZXJldCA9IGVudi0+cGM7DQo+IA0KPiBBbnkgcmVhc29uIG5vdCB0byBoYW5kbGUg
VWYgYXQgdHJhbnNsYXRlIHRpbWU/ICBPciBhdCBsZWFzdCBjcmVhdGUgYSBzaW5nbGUNCj4gaGVs
cGVyIGZ1bmN0aW9uIGZvciB0aGF0IGhlcmUuICBCdXQgaXQgc2VlbXMgbGlrZSB0cmFuc2xhdGUg
d2lsbCBoYXZlIHRvIGRvIGENCj4gbG90IG9mIHByaXYgY2hlY2tpbmcgYW55d2F5IGFuZCB3aWxs
IGFscmVhZHkgaGF2ZSB0aGF0IGhhbmR5Lg0KDQpTaW5jZSB3ZSBuZWVkZWQgYSBoZWxwZXIgYW55
d2F5IHRvIGRlYWwgd2l0aCBjYXVzZWNvZGUgYW5kIHBhcmFtLCB3ZSANCnRob3VnaHQgaXQgd291
bGQgYmUgcmVhc29uYWJsZSB0byBkbyBhbGwgaW4gdGhlIGhlbHBlci4NCldlIGRpZCBub3QgbWFk
ZSBhIFRDRyBhY2Nlc3MgZm9yIGNhdXNlY29kZSBhbmQgcGFyYW0gZW52aXJvbWVudCB2YWx1ZXMu
DQoNCj4gDQo+PiArdm9pZCBoZWxwZXJfZW50ZXIoQ1BVQVJDU3RhdGUgKmVudiwgdWludDMyX3Qg
dTYpDQo+PiArew0KPj4gKyAgICAvKiBub3RoaW5nIHRvIGRvPyB0aGVuIGJ5ZS1ieWUhICovDQo+
PiArICAgIGlmICghdTYpIHsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0K
Pj4gKyAgICB1aW50OF90IHJlZ3MgICAgICAgPSB1NiAmIDB4MGY7IC8qIHVbMzowXSBkZXRlcm1p
bmVzIHJlZ2lzdGVycyB0byBzYXZlICovDQo+PiArICAgIGJvb2wgICAgc2F2ZV9mcCAgICA9IHU2
ICYgMHgxMDsgLyogdVs0XSBpbmRpY2F0ZXMgaWYgZnAgbXVzdCBiZSBzYXZlZCAgKi8NCj4+ICsg
ICAgYm9vbCAgICBzYXZlX2JsaW5rID0gdTYgJiAweDIwOyAvKiB1WzVdIGluZGljYXRlcyBzYXZp
bmcgb2YgYmxpbmsgICAgICAqLw0KPj4gKyAgICB1aW50OF90IHN0YWNrX3NpemUgPSA0ICogKHJl
Z3MgKyBzYXZlX2ZwICsgc2F2ZV9ibGluayk7DQo+PiArDQo+PiArICAgIC8qIG51bWJlciBvZiBy
ZWdzIHRvIGJlIHNhdmVkIG11c3QgYmUgc2FuZSAqLw0KPj4gKyAgICBjaGVja19lbnRlcl9sZWF2
ZV9ucl9yZWdzKGVudiwgcmVncywgR0VUUEMoKSk7DQo+IA0KPiBCb3RoIG9mIHRoZXNlIGNoZWNr
cyBjb3VsZCBiZSB0cmFuc2xhdGUgdGltZS4NCj4gDQo+PiArICAgIC8qIHRoaXMgY2Fubm90IGJl
IGV4ZWN1dGVkIGluIGEgZGVsYXkvZXhlY3V0aW9uIHNsb3QgKi8NCj4+ICsgICAgY2hlY2tfZGVs
YXlfb3JfZXhlY3V0aW9uX3Nsb3QoZW52LCBHRVRQQygpKTsNCj4gDQo+IEFzIGNvdWxkIHRoaXMu
DQo+IA0KPj4gKyAgICAvKiBzdGFjayBtdXN0IGJlIGEgbXVsdGlwbGUgb2YgNCAoMzIgYml0IGFs
aWduZWQpICovDQo+PiArICAgIGNoZWNrX2FkZHJfaXNfd29yZF9hbGlnbmVkKGVudiwgQ1BVX1NQ
KGVudikgLSBzdGFja19zaXplLCBHRVRQQygpKTsNCj4+ICsNCj4+ICsgICAgdWludDMyX3QgdG1w
X3NwID0gQ1BVX1NQKGVudik7DQo+PiArDQo+PiArICAgIGlmIChzYXZlX2ZwKSB7DQo+PiArICAg
ICAgICB0bXBfc3AgLT0gNDsNCj4+ICsgICAgICAgIGNwdV9zdGxfZGF0YShlbnYsIHRtcF9zcCwg
Q1BVX0ZQKGVudikpOw0KPj4gKyAgICB9DQo+IA0KPiBBbmQgd2hhdCBpZiB0aGVzZSBzdG9yZXMg
cmFpc2UgYW4gZXhjZXB0aW9uPyAgSSBkb3VidCB5b3UncmUgZ29pbmcgdG8gZ2V0IGFuDQo+IGV4
Y2VwdGlvbiBhdCB0aGUgY29ycmVjdCBwYy4NCj4gDQo+PiArdm9pZCBoZWxwZXJfbGVhdmUoQ1BV
QVJDU3RhdGUgKmVudiwgdWludDMyX3QgdTcpDQo+IA0KPiBTaW1pbGFybHkuICBJIHRoaW5rIHRo
YXQgYm90aCBvZiB0aGVzZSBjb3VsZCBiZSBpbXBsZW1lbnRlZCBlbnRpcmVseSBpbg0KPiB0cmFu
c2xhdGUsIHdoaWNoIGlzIHdoYXQNCj4gDQo+PiArICAgIGJvb2wgcmVzdG9yZV9mcCAgICA9IHU3
ICYgMHgxMDsgLyogdVs0XSBpbmRpY2F0ZXMgaWYgZnAgbXVzdCBiZSBzYXZlZCAgKi8NCj4+ICsg
ICAgYm9vbCByZXN0b3JlX2JsaW5rID0gdTcgJiAweDIwOyAvKiB1WzVdIGluZGljYXRlcyBzYXZp
bmcgb2YgYmxpbmsgICAgICAqLw0KPj4gKyAgICBib29sIGp1bXBfdG9fYmxpbmsgPSB1NyAmIDB4
NDA7IC8qIHVbNl0gc2hvdWxkIHdlIGp1bXAgdG8gYmxpbms/ICAgICAgICovDQo+IA0KPiB0aGVz
ZSBiaXRzIHN0cm9uZ2x5IGltcGx5Lg0KPiANCg0KRm9yIGxhY2sgb2Yga25vd2luZyBiZXR0ZXIs
IGl0IGlzIHVuY2xlYXIgdG8gbWUgd2hlcmUgdG8gZHJhdyB0aGUgbGluZSANCndoZW4gY2hvb3Np
bmcgYmV0d2VlbiBhIHRyYW5zbGF0ZSB0aW1lICh0Y2cpIG9yIGhlbHBlciBpbXBsZW1lbnRhdGlv
bi4NCllvdXIgc3VnZ2VzdGlvbnMgZm9yIGNhcnJ5L292ZXJmbG93IGNvbXB1dGF0aW9uIGFyZSBz
aGFycCBhbmQgd2Ugc2hvdWxkIA0KaGF2ZSBuZXZlciB1c2VkIGFuIGhlbHBlciwgaG93ZXZlciBJ
IHdvbmRlciB3aGF0IHdvdWxkIGJlIHRoZSBiZW5lZml0IG9mIA0KaW1wbGVtZW50aW5nIGVudGVy
IGFuZCBsZWF2ZSB0aHJvdWdoIFRDRy4NCg0KV2UgaGF2ZSBkZWFsdCB3aXRoIHRob3NlIGV4Y2Vw
dGlvbiBpc3N1ZXMgYnkganVzdCBjaGFuZ2luZyBTUCBpbiB0aGUgZW5kIA0Kb2YgdGhlIGluc3Ry
dWN0aW9uIGltcGxlbWVudGF0aW9uLCB3aGVuIG5vIGV4Y2VwdGlvbnMgY2FuIGhhcHBlbi4NCg0K
QXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB3aGVuIGFuIGV4Y2VwdGlvbiBoYXBwZW5zIGluIHRoZSBt
aWRkbGUgb2YgdGhlIA0KaGVscGVyIG9yIGV2ZW4gb24gYSBUQ0cgaW1wbGVtZW50YXRpb24sIGl0
IGp1bXBzIG91dCBvZiB0aGF0IFRCIA0KZXhlY3V0aW9uIHRvIGRlYWwgd2l0aCB0aGUgZXhjZXB0
aW9uLiBPbiBydGllIGluc3RlYWQgb2YgaXQgcmV0dXJuaW5nIHRvIA0KdGhlIHNhbWUgdGNnX2xk
IG9yIHRjZ19zdCB3aGVyZSBpdCBhY3R1YWxseSB0cmlnZ2VyZWQgdGhlIGV4Y2VwdGlvbiBpdCAN
CndpbGwgcmUtZGVjb2RlIHRoZSBzYW1lIGluc3RydWN0aW9uIHdoaWNoIHRyaWdnZXJlZCB0aGUg
ZXhjZXB0aW9uLCBhbmQgDQpyZS1hdHRlbXB0cyB0byBleGVjdXRlIGl0Lg0KSXMgdGhhdCB0aGUg
Y2FzZSBpbiBjdXJyZW50IFRDRyBpbXBsZW1lbnRhdGlvbiwgb3IgZGlkIGl0IGltcHJvdmVkIGFu
ZCANCml0IGlzIG5vdyBhYmxlIHRvIHJldHVybiB0byBwcmV2aW91cyBleGVjdXRpb24gZmxvdyAo
aS5lIHRyYW5zbGF0aW9uIA0KYmxvY2spID8NCg==

