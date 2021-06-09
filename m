Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B473A0FDB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 11:59:51 +0200 (CEST)
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv01-0005Mt-Jk
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 05:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1lquz4-0004Y9-Je
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:58:50 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1lquyz-0002Zu-T6
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:58:49 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0C694064F;
 Wed,  9 Jun 2021 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623232722; bh=jZ8dxfEN/3PSH1xnXCCuYvrvcpk2/rXDsd6tY7/5BCk=;
 h=From:To:CC:Subject:Date:From;
 b=JaNaL+HBol1gufnzXk3q7eMnQBe7fBYpdKWzloQnlmfh0W/PN12vbPTqtWiVbhIBG
 NPXBkXt2zOho3vWbxsfkgwGUFF/+8WvUPI4tKSpzQwKKy4afIDXMrgu0w4QIpUuHf1
 rBugo2kTDvKnA125UB0CdGy6/qcAwkHpwdy5hdvxJ1lLyqd5HPAnsjQwP7DqZj5hIy
 Qq3LFDvvO23Dxbd5hMhIkuPBmR/ivFbNzYQMFAa3uALTp/D4qbsbzpliyI/KDUKNJA
 ON82CKYFHpyI+MvUTTToHVncSQrfBOc9hwHInZgnEOhh4deVnddA/sWuXgVYLPAC3Y
 ZlzsJcre0Pl5A==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0AE20A0080;
 Wed,  9 Jun 2021 09:58:39 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3663880062;
 Wed,  9 Jun 2021 09:58:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="cMosmg3n";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5FjPdoKJ4k9c6yo1bKrYFGCabt5hXVGA3guErrlLm0+KBY87ISI7e7/yov+PhM2Ebys5AFhxL90fbT/HY+6o1J8WfBpIqR1nkMPxml7UfixGam4V9+uwCGHVbhxXPdvaFwGOQZOqOeBOMbJKJ/0qMlbKqr09BeEoq7JTjViIH7KKLbhXOpsCmMFQ05ZEZ8lLhiPr2s5XDW1LLWCFfMfFuZGaEODy+unGns55kxP92YMnErjj6/K5Ro8dvL30mSTF8PAuusCEUYFzc8dBbmkDOrJe6bkk4Zw+B5xpIWZcICmH0IgAUmWYpXUN/A6BEjl3ph0XIwjPVYZP7zyQ1gYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ8dxfEN/3PSH1xnXCCuYvrvcpk2/rXDsd6tY7/5BCk=;
 b=CkPBI5Khov5YjUTub5KiD+aYkcwJWcag4kyiWN1fGwnkELMq6lPup88L2yUpD3LlKivHQrgPmUzI996R0P2DIYe/SKKvFeUsSTPjZF70T+gDMeMcGpEUTc9tXURlWpRoVkTSVyvSOXEWyvDL8WWEu2Lau2mc77mmM7FAvz4tZrvEuckI6rrb0i8UPhm1lBxBFvoqQq91L5dFdHtDOnq1Lo4tbC/amrIHZjz6Ft5M7+JcHxUP23DbSfL5MgRGVcmOiDQ0U1Id9wQ9Om7MRhLDYRgwt8otq2ph3+lLtqgwLZefPu4FCZnrXSOGDSoURPMmDJqnXwt4sbqNn5QS516ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ8dxfEN/3PSH1xnXCCuYvrvcpk2/rXDsd6tY7/5BCk=;
 b=cMosmg3noxbb+Utjm8C5YB2v0z5UT9jmy6Tir24aNK7EOobtKkpXssXAjAwNJH1JB2dj1KAL4/+4JTwKsRnUpETCTzNt+xZ1Lb0HKfnhov85aDAB4LpBR0k9PidbSYCFsVtjhquN2khU4lOqNi2UywwndbapihHNFlYL9ivd7oA=
Received: from DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24)
 by DM6PR12MB4698.namprd12.prod.outlook.com (2603:10b6:5:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 09:58:34 +0000
Received: from DM6PR12MB4877.namprd12.prod.outlook.com
 ([fe80::2409:edc4:60b9:72d6]) by DM6PR12MB4877.namprd12.prod.outlook.com
 ([fe80::2409:edc4:60b9:72d6%9]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 09:58:34 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>
Subject: QEmu ARC port - decoder implementation feedback
Thread-Topic: QEmu ARC port - decoder implementation feedback
Thread-Index: AQHXXRYCp0g4uHxJwUSWGu/ANfQZ7w==
Date: Wed, 9 Jun 2021 09:58:34 +0000
Message-ID: <a882003d-4949-06ac-d111-8f41cb2d54b9@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa67b5bf-f0e0-44ac-a7c9-08d92b2d253b
x-ms-traffictypediagnostic: DM6PR12MB4698:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4698148142D67A6E4F6FE672A8369@DM6PR12MB4698.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PCXOnw6YUmcwSLe/e0AzpNBQ/74ShWKmI41meiqRKT8FzvH3Zm3EAUT5DXzGT9U+2h17GsDgK07GpXH7cm7whZS4mjFLxzng8lg6TN3Mfg87Bb6Jng8yhDqPiyHjoGHs1JmioGVXA5qDK1eFdyh+Tui05k+JdARysoAQBUgute1kwhON2KR/B6oKwrDLnZc1hwUD8UjI6Y46WTm34kuX0NcNQpnIshvTsVEAuI2Faho4bPRgtJIo90N8SiZ2WOabh2FMSFCMYBHw2lnNAW+4nU6gA+0H3Qf0a56wTqHcMt6LCZcHIWXdke4+yzWBDTBQedp0MyXn7ul7trkYnJUaUiXc0O2TR8TiOUOF+NBPMgTZMkvCnnDXtcee7I9N/SzLexh9e+6pdZmF6g9y9YO+Vf4KFVZPtrRKhA5IOavdJ5kSl30frZu/TFcjLD7gZjvLOHCqPcYBR7V5Fq+H4tuEjOhgvxPNU37t/eeQ7wciGpFPnWdhI3yTnGli168QyFmybzxVI5bO36T6kmfbTmnpUVh36HBYUgYH5KSZBY6lYfGoanLT+MYC32OGaX2y/cdxB35j3CSuIwT90vPvmO0xKFtPWyB55bcDgzfYXRZ1o8SBCotpc12TBOeu6mv0QvuaviQFGSQy+0dXS9kitSTtPRJbOEMENWcF8wk0dFK6BaM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4877.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39850400004)(396003)(366004)(376002)(136003)(86362001)(91956017)(5660300002)(4326008)(31686004)(38100700002)(316002)(8676002)(8936002)(76116006)(6506007)(36756003)(83380400001)(31696002)(54906003)(110136005)(26005)(478600001)(2906002)(66476007)(66556008)(64756008)(6512007)(66446008)(122000001)(6486002)(71200400001)(66946007)(2616005)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHlwWklYVFNNNWRLTWoyWWxQa29YOGRnRDhwT3hWaHViT0ZTUUY4VERuNEhY?=
 =?utf-8?B?R0FjV0V0UzMwaTlLSytWMjhwY3FEclJKV1o0WFdGYWJqTm1YT3FPOTBlMmsv?=
 =?utf-8?B?eWt4NXBNRnBYV2FHMW1Ta3A4UlJaWFpwYmFQY1JPWW5aVUZkVi9VWFVwRnhC?=
 =?utf-8?B?ZWdCOWFKWmJXdDVVODVKVmhwUFM2b2NSWDV1WmJiMGV0MDZHWU5rSitxVUIv?=
 =?utf-8?B?cmNRTU5NYk1TUExuR09jbE01QVdGSGZsZmRJKzBvUXBoN3FSR3VPWWtFQWhW?=
 =?utf-8?B?cndnYmlxRG8wWDFmUTluZTdrKzJObEhORE5YSitVeFc3T3c3ODBhWDlaZTZp?=
 =?utf-8?B?MTBlZkY2enZPa3c0ZnY1TkpETmduendmWml0Ty9iQTVTOXN3aGg0NVFIa0tk?=
 =?utf-8?B?ZXIvZG1ia0hjM0pJS2FFbE9CTjlXUnRPTFY4STV6NHd0ck5oaGhnODR6S2xM?=
 =?utf-8?B?ZTJ2RUZhaU1HaFNmWlAwOHBlV0pUaXJ3eHI0alFNNXRBVGVpMEhEV1RSRjUz?=
 =?utf-8?B?Q0RGQXhobTdhM00vUmNrNlNIdmZUTGJCaWVmblpmVVgzakNjazNHQlJCUVNX?=
 =?utf-8?B?QVpFbjVLTklYbm8rZVF1RXlCQ3pQWkdXVXhCRjh2UnZYNWRmVTVGVGxLRUdk?=
 =?utf-8?B?Tm5RSFpvS0xqd1NOY3BhL0VwL29CRGVOMHA5SW9MRGEvR01YSms4OWZ5c1Vp?=
 =?utf-8?B?TjZob1AwT05GQXRzTi9IMVQ1dmxDWVpQbEV0RkJoZUhxRVdzRDEvOThHb3dv?=
 =?utf-8?B?V3FIbHJmNWQ5aW1TUkE0MkhHOGY0Wm9rM2RxdjJoQlEyTWd0Uy8zQThnTndN?=
 =?utf-8?B?bzZSYmlGdnhjZitLVHcrMVpWckM2NVBVUVdmYlVSeGJjeHRGRkhjeWI4WlJL?=
 =?utf-8?B?ZCtaYUR5VFl1VDBJMENuTUpiUzR3SW5nTGgvS3hMWEg5akY0K3BkMVR6MGJx?=
 =?utf-8?B?b0t1VWp1aHM0T29WaHFoako2Y1BTeTBGK1U2cmQya2F0ampqTWtqM3ZXY0Ux?=
 =?utf-8?B?dzJscUcwRGlNY1RKRXdBK3NpV2d4TVQxbkd5d2ZTYlhNb0JPR21sSzdIRWNi?=
 =?utf-8?B?Z2twYU1LMzZqNXNQNjY0K3VYc2toMVU5cWxjaVNocmdVVDZCeVBBamdMaC9I?=
 =?utf-8?B?djlPMnQ4RTlIN0NZWWdDWGZOcmVKQ01ITW1vQVdkY3BaSklkMDJZelJJTHhL?=
 =?utf-8?B?SER3SnU3UFRDYkh3eCtodk1yaGJxSkw3aDBjUGU5Z2VPckdZZEVvTWNkUk5H?=
 =?utf-8?B?L3RmbHpoUC9rcG1WR1JHNDk0bTFEQmxFUFpnVyt0SmhrOWUwOFB5RUNIZE5j?=
 =?utf-8?B?SGlham5BalBBUjNBZzVHSDV3U0l3SEpJSzM5UUg3dlVaa0NtL2FmTHUybVU0?=
 =?utf-8?B?eUpLWCs1ODN2ZlNOSXJYWXR2aCtINkFZeWFpcnowTnh1UjBWSjlIb0llbmxH?=
 =?utf-8?B?cHVqcVZhYUxJb2tPalZiVTNXaE1kZU9XYXBaOGxvWDZjT0dvNmdjU3JQc2tW?=
 =?utf-8?B?TTRpUTgrbUk4dXg5WURGVTlSUk9PaGFjWDR2UlJLOVhtQkdUQzJsRnloK2hi?=
 =?utf-8?B?RkJZdmVqdFBQcnhScUZxbHlGd010akx5YmhnS3VIRTh4Rlh1MzlyS0JERzBI?=
 =?utf-8?B?bzg3WDY0THcyNjA3ZzRkOGREb29LWnBaMmVaRW9XalZnNDFmelpubG5UblFy?=
 =?utf-8?B?QW9qSzhCYWJzRzlTNHFLaTlvQzJHeTFwWDZVM0diSXorQzVvMmI3SlFWaXZO?=
 =?utf-8?Q?AA2xgVZKJi6GNfQjqoB0hq7Q+hzJN4pkiPvVHQ+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <141D4F71E248654690EA27B5A5BAB933@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4877.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa67b5bf-f0e0-44ac-a7c9-08d92b2d253b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 09:58:34.6958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nG3sggdxIdwI6bZslpAEdqmyydHpoIf+7wSnMUEhu+Rw0KmZN6DKPJaowGwl7AYlg422u5L9+GX+KR9v4n2Ppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4698
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUmljaGFyZCwNCg0KTGFzdCBmZXcgd2Vla3MgSSBoYXZlIGJlZW4gd29ya2luZyBvbiBjbGVh
bmluZyB1cCBBUkMgcG9ydCBmb3IgZnVydGhlcg0KcmV2aWV3aW5nLg0KDQpJbiB0aGUgY29udGV4
dCBvZiB0aGUgZGVjb2RlciwgaWYgSSByZWNhbGwgd2VsbCwgeW91ciBvYnNlcnZhdGlvbiB3YXMN
CnRoYXQgYSBsaW5lYXIgc2VhcmNoIHdhcyBub3QgT2suDQpZb3VyIHN1Z2dlc3Rpb24gd2FzIG5v
dCB0byByZWludmVudCB0aGUgd2hlZWwgYW5kIGdlbmVyYXRlIGRlY29kZXRyZWUgdG8NCmNyZWF0
ZSB0aGUgZGVjb2Rlci4NCg0KV2Ugc3RhcnRlZCB0byBkbyB0aGF0IGFuZCBpbiB0aGUgcHJvY2Vz
cyB3ZSByZWFsaXplIHRoYXQgdGhlIGFwcHJvYWNoDQp3b3VsZCBicmluZyB1cyB5ZXQgYW5vdGhl
ciBlbmNvZGluZyBsYW5ndWFnZSBkZXNjcmlwdGlvbiB0byBtYWludGFpbi4NCkFsc28gdGhhdCBk
ZWNvZGV0cmVlIGFsb25lIHdvdWxkIG5vdCBhbGxvdyB1cyB0byBwcm9wZXJseSBkaXNhc3NlbWJs
eQ0KY29kZSwgc3RpbGwgcmVxdWlyaW5nIHRvIGtlZXAgdGhlIGluaXRpYWwgc3RydWN0dXJlLg0K
DQpUYWtpbmcgaW4gY29uc2lkZXJhdGlvbiB0aGF0IHdlIGRvIGFsbCB0aGUgb3RoZXIgdG9vbGNo
YWluIHRvb2xzIGZvciBBUkMNCmFuZCB0aGF0IHRoZSBkZWNvZGVyIHN0cnVjdHVyZSBpcyBhbHJl
YWR5IHVwc3RyZWFtZWQgaW4gYmludXRpbHMgd2UNCndvdWxkIGRlZmluaXRlbHkgcHJlZmVyIHRv
IGtlZXAgdGhhdCBzdHJ1Y3R1cmUgYW5kIG9wdGltaXplIHRoZQ0Kc3Vycm91bmRpbmdzIGZvciBw
cm9wZXIgZGVjb2Rpbmcgc3BlZWRzLg0KDQpTbyBmYXIsIHdlIGRpZCB0aGUgZm9sbG93aW5nOg0K
ICDCoC0gY29udmVydGVkIG9wY29kZXMuZGVmIHRvIG1hY3JvcyBpbnN0ZWFkIG9mIHRhYmxlIGVu
dHJpZXMuDQogIMKgLSBjcmVhdGVkIGEgc2NyaXB0IHRoYXQgcmVhZHMgdGhvc2UgZW50cmllcyBh
bmQgb3V0cHV0cyBtYWNyb3MgdGhhdA0KZGlyZWN0bHkgdHJhbnNsYXRlIHRvIGEgc3dpdGNoL2Nh
c2UgZGVjaXNpb24gdHJlZSAoZXhhbXBsZSBiZWxvdyksIGp1c3QNCmxpa2UgdGhlIG9uZXMgcHJv
ZHVjZWQgYnkgZGVjb2RldHJlZS4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCB0aGUgc3dpdGNoDQp3
aWxsIHJldHVybiB0aGUgZW51bSBlbnRyeSBmb3IgdGhlIHByb3BlciBkZWNvZGVyIHN0cnVjdHVy
ZSBpbnN0ZWFkIG9mDQpjYWxsaW5nIGEgdHJhbnNsYXRpb24gZnVuY3Rpb24uDQogIMKgLSB0aGUg
c2NyaXB0IGNhbiBlaXRoZXIgYmUgY29udHJpYnV0ZWQgaW4gQyBvciBweXRob24gbGFuZ3VhZ2Ug
YXMgaXQNCmlzIGJhc2VkIG9uIGEgc2ltcGxlIHJlY3Vyc2l2ZSBhbGdvcml0aG0uDQoNCkFzIHlv
dSBoYXZlIGJlZW4gdGhlIG9uZSBnaXZpbmcgYXR0ZW50aW9uIHRvIG91ciB0YXJnZXQsIEkgc2Vl
ayBmb3IgeW91cg0KZWFybHkgZmVlZGJhY2sgYW5kIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBzb2x1
dGlvbiBpcyBzdGlsbCBpbmxpbmUgd2l0aA0KeW91ciBleHBlY3RhdGlvbnMuDQoNCkxvb2tpbmcg
Zm9yd2FyZCBmb3IgeW91ciBmZWVkYmFjay4NCg0KUmVnYXJkcywNCkN1cGVydGlubw0KDQpQUzog
V291bGQgaXQgYmUgYXNraW5nIHRvbyBtdWNoIGlmIHdlIGNvdWxkIGhhdmUgYSBjYWxsLCBqdXN0
IHRvDQpnZXQgdG8gbWVldCBlYWNoIG90aGVyLiBVbmZvcnR1bmF0ZWx5LCBubyBvbmUgbm93IGlz
IGFibGUgdG8gZG8gaXQgYW55DQpvdGhlciB3YXkuIEkgbWlzcyB0aGUgdHJhdmVsaW5nIGFuZCBj
b25mZXJlbmNlcy4NCg0KRXhhbXBsZTEgKGZpcnN0IGZldyBsaW5lcyBvZiB0aGUgZmlsZSk6DQoN
CiAgwqBNQVRDSF9QQVRURVJOKDB4ZjgwMDAwMDApIC8qIDExMTExMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwICovDQogIMKgIE1BVENIX1ZBTFVFKDB4MCkgLyogMCAqLw0KICDCoMKgIE1BVENI
X1BBVFRFUk4oMHgxMDAwMCkgLyogMTAwMDAwMDAwMDAwMDAwMDAgKi8NCiAgwqDCoMKgIE1BVENI
X1ZBTFVFKDB4MCkgLyogMCAqLw0KUkVUVVJOX01BVENIKE9QQ09ERV9BUkN2MkhTX2JfMHgwMDAw
MDAwMF8weEY4MDEwMDAwX0JSQU5DSF9PUF9TSU1NMjFfQTE2XzUpDQovKiAwMDAwMHNzc3Nzc3Nz
c3MwU1NTU1NTU1NTU05RUVFRUSAqLw0KICDCoMKgwqAgRU5EX01BVENIX1ZBTFVFKDB4MCkgLyog
MCAqLw0KICDCoMKgwqAgTUFUQ0hfVkFMVUUoMHgxMDAwMCkgLyogMTAwMDAwMDAwMDAwMDAwMDAg
Ki8NClJFVFVSTl9NQVRDSChPUENPREVfQVJDdjJIU19iXzB4MDAwMTAwMDBfMHhGODAxMDAwMF9C
UkFOQ0hfT1BfU0lNTTI1X0ExNl81KQ0KLyogMDAwMDBzc3Nzc3Nzc3NzMVNTU1NTU1NTU1NOUnR0
dHQgKi8NCiAgwqDCoMKgIEVORF9NQVRDSF9WQUxVRSgweDEwMDAwKSAvKiAxMDAwMDAwMDAwMDAw
MDAwMCAqLw0KICDCoMKgIEVORF9NQVRDSF9QQVRURVJOKDB4MTAwMDApIC8qIDEwMDAwMDAwMDAw
MDAwMDAwICovDQogIMKgIEVORF9NQVRDSF9WQUxVRSgweDApIC8qIDAgKi8NCiAgwqAgTUFUQ0hf
VkFMVUUoMHg4MDAwMDAwKSAvKiAxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwICovDQogIMKg
wqAgTUFUQ0hfUEFUVEVSTigweDEwMDAwKSAvKiAxMDAwMDAwMDAwMDAwMDAwMCAqLw0KICDCoMKg
wqAgTUFUQ0hfVkFMVUUoMHgwKSAvKiAwICovDQogIMKgwqDCoMKgIE1BVENIX1BBVFRFUk4oMHgy
MDAwMCkgLyogMTAwMDAwMDAwMDAwMDAwMDAwICovDQogIMKgwqDCoMKgwqAgTUFUQ0hfVkFMVUUo
MHgwKSAvKiAwICovDQpSRVRVUk5fTUFUQ0goT1BDT0RFX0FSQ3YySFNfYmxfMHgwODAwMDAwMF8w
eEY4MDMwMDAwX0JSQU5DSF9PUF9TSU1NMjFfQTMyXzUpDQovKiAwMDAwMXNzc3Nzc3NzczAwU1NT
U1NTU1NTU05RUVFRUSAqLw0KICDCoMKgwqDCoMKgIEVORF9NQVRDSF9WQUxVRSgweDApIC8qIDAg
Ki8NCiAgwqDCoMKgwqDCoCBNQVRDSF9WQUxVRSgweDIwMDAwKSAvKiAxMDAwMDAwMDAwMDAwMDAw
MDAgKi8NClJFVFVSTl9NQVRDSChPUENPREVfQVJDdjJIU19ibF8weDA4MDIwMDAwXzB4RjgwMzAw
MDBfQlJBTkNIX09QX1NJTU0yNV9BMzJfNSkNCi8qIDAwMDAxc3Nzc3Nzc3NzMTBTU1NTU1NTU1NT
TlJ0dHR0ICovDQogIMKgwqDCoMKgwqAgRU5EX01BVENIX1ZBTFVFKDB4MjAwMDApIC8qIDEwMDAw
MDAwMDAwMDAwMDAwMCAqLw0KICDCoMKgwqDCoCBFTkRfTUFUQ0hfUEFUVEVSTigweDIwMDAwKSAv
KiAxMDAwMDAwMDAwMDAwMDAwMDAgKi8NCiAgwqDCoMKgIEVORF9NQVRDSF9WQUxVRSgweDApIC8q
IDAgKi8NCiAgwqDCoMKgIE1BVENIX1ZBTFVFKDB4MTAwMDApIC8qIDEwMDAwMDAwMDAwMDAwMDAw
ICovDQogIMKgwqDCoMKgIE1BVENIX1BBVFRFUk4oMHgxNykgLyogMTAxMTEgKi8NCiAgwqDCoMKg
wqDCoCBNQVRDSF9WQUxVRSgweDApIC8qIDAgKi8NCk1VTFRJX01BVENIKE9QQ09ERV9BUkN2MkhT
X2JyZXFfMHgwODAxMDAwMF8weEY4MDEwMDE3X0JSQ0NfT1BfUkJfUkNfU0lNTTlfQTE2XzgpDQov
KiAwMDAwMWJiYnNzc3Nzc3MxU0JCQkNDQ0NDQ04wWTAwMCAqLw0KTVVMVElfTUFUQ0goT1BDT0RF
X0FSQ3YySFNfYnJlcV8weDA4MDEwRjgwXzB4RjgwMTBGRjdfQlJDQ19PUF9SQl9MSU1NX1NJTU05
X0ExNl84KQ0KLyogMDAwMDFiYmJzc3Nzc3NzMVNCQkIxMTExMTAwMFkwMDAgKi8NCk1VTFRJX01B
VENIKE9QQ09ERV9BUkN2MkhTX2JyZXFfMHgwRTAxNzAwMF8weEZGMDE3MDM3X0JSQ0NfT1BfTElN
TV9SQ19TSU1NOV9BMTZfOCkNCi8qIDAwMDAxMTEwc3Nzc3NzczFTMTExQ0NDQ0NDMDBZMDAwICov
DQpNVUxUSV9NQVRDSChPUENPREVfQVJDdjJIU19icmVxXzB4MEUwMTdGODBfMHhGRjAxN0ZGN19C
UkNDX09QX0xJTU1fTElNTWR1cF9TSU1NOV9BMTZfOCkNCi8qIDAwMDAxMTEwc3Nzc3NzczFTMTEx
MTExMTEwMDBZMDAwICovDQogIMKgwqDCoMKgwqAgRU5EX01BVENIX1ZBTFVFKDB4MCkgLyogMCAq
Lw0KDQo=

