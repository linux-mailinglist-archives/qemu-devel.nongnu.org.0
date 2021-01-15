Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD042F848F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:38:02 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Tyz-0005LN-Ki
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0Sdc-0007mm-3t
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:52 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:56308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0Sda-0006tb-5C
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:11:51 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E715DC0AE0;
 Fri, 15 Jan 2021 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730708; bh=imeNIWzsx85gbZSkZ/vAg54TMabwqaEC5iSIk8i0/As=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=XUDss0mKmGqb9noOAjAv6Kb8IaWRhQPrELCQ9r/PqEi7CiZDBTLrdzjqjtXLWR1Iw
 uiLR99ZBh2ut/Z+oSHL4DnW2dk7Bkk91oqE6ACtyBVbTVIbHAp3T3MUAr8iHuWgWKY
 FZ0iAXpgyLW3hy+/RZqGb2jFpOzphlxekjtZ/NjswR0Fuc30l+9TWNhtZ4g4Wd8Edn
 tX484Py3gcrihmY2eF5k3AGde5cSAkIW+1yQvM7LkfsBo3bRP+Ng3bdR4474oY7cpm
 F85+Z2GRgudfVCMjHsjLOlnhwxXa47uC1Erxtv/yyrHZ2MBbQ+QY6G9DZHuBaBljIM
 B5GWC4W3+PBaQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CF5C1A0081;
 Fri, 15 Jan 2021 17:11:46 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 28168400E5;
 Fri, 15 Jan 2021 17:11:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="PtyO60YO";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvopRVNeuUU97dyFzeJxcfJOOoEyjxEFm/vJZbcO+2v07AQMCogNzOaExTR4wrJkYfoxCyRS4ISjxbRpq13NtbbIP4Ee93WY/6B+KE1RojDRv9H+t5/cox2MbCHI+0C8CbG0oQ4dsdmC40omnfE/98wDBJLVUuiDty1EKH2B4sNkxl8CyUXswowoDmZhSPoY3jUu5HZ7pGMVrAZZ9nZc7Q5p1aw3zC/UfSgQIRBCRmsGYyN1F7DirdOJLJqOlQBpPoBXeU7eiIT/pXYOaMUl26B3J5KGlROT7qv+Ls6h7A9RJYv9W5zRlvCzIz/Wb9r6kddGIYU2yuV6YEZrXCyEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imeNIWzsx85gbZSkZ/vAg54TMabwqaEC5iSIk8i0/As=;
 b=NBxkAIbfJxdIWUUTzYzAeHgqghBmMfUDz2nBczGJc0Ivfp3s3JC41i2/FZSSXZgYWwLiC+c0/UYqNvxq+bAgPkbWY8Tj5HgWDAjwuCWlMe+TvuYFtT/f1l7s+Mn/72CFo++0ECj1d5tpoinNEKN04EzUlxJXljqimFqrYmiPgquJQ441P2a93Anhhr5pbfYQg/uKZMYDajjRx7zvSg9oM9zZfJea+06jsZ11MPXPp+z+1baszXmBiR++ISR6SfAe3fIKUjBv8pipd3JkTIM76xVplkqFDanHnsyw6DkSwsJhWMm7VjaQgIP7f/0FQGYDg/4/uOkRPSTxbc9ocx8M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imeNIWzsx85gbZSkZ/vAg54TMabwqaEC5iSIk8i0/As=;
 b=PtyO60YOg6XpSHhQWEkuRFnKRHIQrtbo3DeGt7dd1kBvrPlJ9aFS+uCbd+gilSOsC/ewr+eQypOgYkkyfgnqrWdmgZzxoMwktKWNv5Ak63f54XzRjKPdMtBMrhXobWItjxnBv18ZXwbkYqDJm74qPz1SPrfk6FfG+ELj/Fi1hw0=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:42 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:42 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
Thread-Topic: [PATCH 06/15] arc: TCG instruction definitions
Thread-Index: AQHW62F+62W6I5BiBE28WvxaANyyWg==
Date: Fri, 15 Jan 2021 17:11:42 +0000
Message-ID: <13d2fe20-35dc-a47b-c7bb-8ce049119e3b@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
In-Reply-To: <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e659cc71-26f8-41f4-8b2c-08d8b978a177
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4176F1AF90D24D6449E28A8AA8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Jrx31jv04k62nWZkPaQfIY0e5ypjcQ+qHzuUyaj6aRg8A0JsaE93Gr4RHBXQO2k3TJs21WPN+FfMjRSrvgaD3q0JkPao2RWikq1kGydvtqTeMEq3dmxXKVS209V0XMThQaijSW7VbNv6uUcUWMHguh9GKf/3JNICumBvA6UMEn1GTHFvWCjV2Ly10qoW12xUuIB53i8GJQEbeolfcEj9hTTF3Fm3FjrocsLwru1z5ipGMGC22yNslub4KzbeT9pwm7DXUrup418bskOzBJVqspiZVYH1FKGZFzhuvMjViCDgqg1iT+0ZTofYKzUbgJwq0YRC4gWt45QkVLS7DpAHai2RX9IHG/xJiByv0q2zPxAal29OGnA8J7vWnDAh8KTJ5ZkYc0k3K2jhOuG4Q+Bsebt51MEK2pg+XJX9KZBoLWDov4cUx3GkPlqPspNeozohuuJBTUYWm3EdW1D9/oBUemhqGrlaLFxsIwPCUOvgGrmqgKzc2zdDO5sspQ2QHvC8+dOjJD1hnO4OmjaxPXxLAP56kFMetRNtfMVtaxuNm3687J6qzjJ/8/67qYtpJVAuWCGpVoF5wThRKS4UMGRvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UG5LVGg2bUZUdkRHakRrWDlVZjd4UHpwRDRRNEF5NVdxWi82ZFlvL1hkekVj?=
 =?utf-8?B?TjFPemNSNlVPajY3bFdiS1FiOVN2TmFVMTJjMHJHanorWUtwdE03ZXhxMitx?=
 =?utf-8?B?d2tmb0Fid3Y5OGxRUGZXbU16UnZvSEcyNStuUFMrcGh4TWlYangxVnRadFNn?=
 =?utf-8?B?ZC92VUJ0K0h2M2Q3U212Z2Y4azdOWG9YcHpUdlZGSXRnRGVSTS9WRzF3c2RQ?=
 =?utf-8?B?MmMrNTVtTmt0U1F5WUFyenFyc1RFUWl4djJXWkZDSGkyZGp2QVRVeCtKUUNQ?=
 =?utf-8?B?cXU4a0g4NHVOOXRUVjU3dndDa2U5RzBtV1lZUGswbHVFQzdvRkU4akE1TU4x?=
 =?utf-8?B?aU9DQnhycGVKb0pGZ3lYOXlMd2djMW1MN2dJWWRxUWsyMk12bC9RQWNJL0k0?=
 =?utf-8?B?Rmh1UTJMV2lRelYwUDRBRFo5MjgyK2ZVYUpuZlpMZ0VaZ25RdFkyOGhkWjhB?=
 =?utf-8?B?d2QzRjhRZ1kyRnBudE5FYlZzNHh3QXlPZWtSVDA3SUFkaytDSzdwQnVlWDJh?=
 =?utf-8?B?UWRSREhFYUVRdjBKNkVKWEVCL2IwZVJpR0RjM0NBaGN1a2VJb2IrZnMxL0JH?=
 =?utf-8?B?eDR6WjQwUG1ycWF0aVYxSVc3VHFaUUdrWTJuVXphNW9BZUlxMTVKWHYxMm01?=
 =?utf-8?B?V3NEQTRVckpOOG9XTXFNeVN5Zkw0TnpLRURKYmdXUE1UVkYzSm1MREpYNVdN?=
 =?utf-8?B?TmhKd081MFdMOU14SGZUZWc5UHAxRU5CL1hlSmw0MG1acGdkRHlMMUx2MkVy?=
 =?utf-8?B?VUtXVnVjS0hqV0ZheGVYNVdpbU9vVDFzWGFMMWtLNitZUCt0eXNsRUlGVTBh?=
 =?utf-8?B?TTdDaVdncE5razhOQ1VzalBXRFJTelNzYXBWZGFoN3FvVnlvTlRUTHh6Vkhw?=
 =?utf-8?B?b2g2Z2tZSFpGSThQaFhTTGlKSUJIRWpCZTdWSWR6NG1zanVDaTVlU1V5M2tX?=
 =?utf-8?B?bWJnSnRYMXU2NDZrV1RZZFpUS0l5bmFmUHVZdCtWd3hhVENNa0hIbHhLRFdt?=
 =?utf-8?B?RTZMWHFGM2xDUFg3M2pBcUhsVzYyV1lxRlBRNkJVNDJQR3RLQWMwNEszUjFq?=
 =?utf-8?B?UXg3emZUTE12R3VwM1BiL292NnZFRmJET3dLQzNScG1OdVNJM0c2NkRadFdI?=
 =?utf-8?B?Zk1MaVFtWEJhTGNCRWJweTVwNEN2ZmxSTktKdS81R016NUN2aU5JeHo2VlVK?=
 =?utf-8?B?WEVOQStSSDhvRkJpbnIxd1ora3VBcEVTNUp1WGtCZXRpL1ZNc0ZqV2hDdm5R?=
 =?utf-8?B?dDBIZFd4Y2MwTGpBNm8vZGx3UEVrRTZQNTBkYXJjWnVZRHM0ZjVmRjdLNEEy?=
 =?utf-8?Q?iNkcJtgrcvOd4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E098002DA498E94DA70CED151960590E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e659cc71-26f8-41f4-8b2c-08d8b978a177
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:42.7847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hvrSWpZ/QSbNxi2piw37pQhIpFVpDG7nBUOra+SEFh9Wb3quOJ8uVFZc+FqhiYIrFdAD3bg1+LSOpcPOmCfWQ==
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
X-Mailman-Approved-At: Fri, 15 Jan 2021 13:34:26 -0500
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

Pj4gKw0KPj4gKyAgICBhc3NlcnQoY3R4LT5pbnNuLmxpbW1fcCA9PSAwICYmICFpbl9kZWxheV9z
bG90KTsNCj4+ICsNCj4+ICsgICAgaWYgKGN0eC0+aW5zbi5saW1tX3AgPT0gMCAmJiAhaW5fZGVs
YXlfc2xvdCkgew0KPj4gKyAgICAgICAgaW5fZGVsYXlfc2xvdCA9IHRydWU7DQo+PiArICAgICAg
ICB1aW50MzJfdCBjcGMgPSBjdHgtPmNwYzsNCj4+ICsgICAgICAgIHVpbnQzMl90IHBjbCA9IGN0
eC0+cGNsOw0KPj4gKyAgICAgICAgaW5zbl90IGluc24gPSBjdHgtPmluc247DQo+PiArDQo+PiAr
ICAgICAgICBjdHgtPmNwYyA9IGN0eC0+bnBjOw0KPj4gKyAgICAgICAgY3R4LT5wY2wgPSBjdHgt
PmNwYyAmIDB4ZmZmZmZmZmM7DQo+PiArDQo+PiArICAgICAgICArK2N0eC0+ZHM7DQo+PiArDQo+
PiArICAgICAgICBUQ0dMYWJlbCAqZG9fbm90X3NldF9idGFfYW5kX2RlID0gZ2VuX25ld19sYWJl
bCgpOw0KPj4gKyAgICAgICAgdGNnX2dlbl9icmNvbmRpX2kzMihUQ0dfQ09ORF9ORSwgdGFrZV9i
cmFuY2gsIDEsIGRvX25vdF9zZXRfYnRhX2FuZF9kZSk7DQo+PiArICAgICAgICAvKg0KPj4gKyAg
ICAgICAgICogSW4gY2FzZSBhbiBleGNlcHRpb24gc2hvdWxkIGJlIHJhaXNlZCBkdXJpbmcgdGhl
IGV4ZWN1dGlvbg0KPj4gKyAgICAgICAgICogb2YgZGVsYXkgc2xvdCwgYnRhIHZhbHVlIGlzIHVz
ZWQgdG8gc2V0IGVyYnRhLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICB0Y2dfZ2VuX21v
dl90bChjcHVfYnRhLCBidGEpOw0KPj4gKyAgICAgICAgLyogV2UgYXJlIGluIGEgZGVsYXkgc2xv
dCAqLw0KPj4gKyAgICAgICAgdGNnX2dlbl9tb3ZfdGwoY3B1X0RFZiwgdGFrZV9icmFuY2gpOw0K
Pj4gKyAgICAgICAgZ2VuX3NldF9sYWJlbChkb19ub3Rfc2V0X2J0YV9hbmRfZGUpOw0KPj4gKw0K
Pj4gKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGNwdV9pc19kZWxheV9zbG90X2luc3RydWN0aW9u
LCAxKTsNCj4+ICsNCj4+ICsgICAgICAgIC8qIFNldCB0aGUgcGMgdG8gdGhlIG5leHQgcGMgKi8N
Cj4+ICsgICAgICAgIHRjZ19nZW5fbW92aV90bChjcHVfcGMsIGN0eC0+bnBjKTsNCj4+ICsgICAg
ICAgIC8qIE5lY2Vzc2FyeSBmb3IgdGhlIGxpa2VseSBjYWxsIHRvIHJlc3RvcmVfc3RhdGVfdG9f
b3BjKCkgKi8NCj4+ICsgICAgICAgIHRjZ19nZW5faW5zbl9zdGFydChjdHgtPm5wYyk7DQo+IA0K
PiBXb3csIHRoaXMgbG9va3Mgd3JvbmcuDQo+IA0KPiBJdCBkb2Vzbid0IHdvcmsgd2l0aCBpY291
bnQgb3Igc2luZ2xlLXN0ZXBwaW5nLiAgWW91IG5lZWQgdG8gYmUgYWJsZSB0byBiZWdpbiBhDQo+
IFRCIGF0IGFueSBpbnN0cnVjdGlvbiwgaW5jbHVkaW5nIGEgZGVsYXkgc2xvdC4NCj4gDQo+IFlv
dSBzaG91bGQgaGF2ZSBhIGxvb2sgYXQgc29tZSBvZiB0aGUgb3RoZXIgdGFyZ2V0cyB0aGF0IGhh
bmRsZSB0aGlzLCBlLmcuDQo+IG9wZW5yaXNjIG9yIHNwYXJjLiAgU2luY2UgeW91J3ZlIGdvdCBO
UEMgYWxyZWFkeSwgZm9yIGxvb3BpbmcsIHNwYXJjIGlzDQo+IHByb2JhYmx5IHRoZSBiZXR0ZXIg
bWF0Y2guDQo+IA0KPiBUaGVyZSBzaG91bGQgYmUgbm8gcmVhc29uIHdoeSB5b3UnZCBuZWVkIHRv
IGVtaXQgaW5zbl9zdGFydCBvdXRzaWRlIG9mDQo+IGFyY190cl9pbnNuX3N0YXJ0Lg0KPiANCg0K
V2UgYXJlIGFsc28gYWJsZSB0byBzdGFydCBUQiBhdCBhbnkgaW5zdHJ1Y3Rpb24sIHRoYXQgaXMg
bm90IHdoYXQgaXMgDQpiZWluZyB2YWxpZGF0ZWQgaGVyZS4gSXQgaXMganVzdCB2ZXJpZnlpbmcg
aWYgYSBkZWxheXNsb3QgaW5zdHJ1Y3Rpb24gDQpkb2VzIG5vdCBoYXZlIHRoZSBkZWxheXNsb3Qg
ZmxhZyBzZXQsIGFuZCB0aGF0IHRoZSBkZWxheXNsb3QgaW5zdHJ1Y3Rpb24gDQpkb2VzIG5vdCBo
YXZlIGEgbGltbS4NCg0KVGhlIHdheSB3ZSBlbmNvZGUgZGVsYXlzbG90IGluc3RydWN0aW9ucyBp
cyBhIGxpdHRsZSBwZWN1bGlhci4gV2hlbiBzb21lIA0KaW5zdHJ1Y3Rpb24gZGVmaW5lcyBhIGRl
bGF5c2xvdCwgaXQgY2FsbHMgdGhpcyBmdW5jdGlvbiBhbmQgdGhlIA0KaW5zdHJ1Y3Rpb24gaXMg
ZGVjb2RlZCBpbmxpbmUuDQpBcyBmYXIgYXMgSSByZW1lbWJlciB0aGUgY2hhbmdlIG9mIGluc3Ry
dWN0aW9uIGNvbnRleHQsIHdpdGggDQp0Y2dfZ2VuX2luc25zX3N0YXJ0LCBhbGxvd2VkIHVzIHRv
IHByb3Blcmx5IG1ha2UgZ2RiIGp1bXAgZnJvbSBicmFuY2ggDQppbnN0cnVjdGlvbiB0byBkZWxh
eSBzbG90IGluc3RydWN0aW9uIGFuZCB0aGVuIGJhY2suDQoNClRoZSBhc3NlciB3YXMgdXNlZCB0
byBndWFyYW50ZWUgdGhhdCB0aG9zZSBjb25kaXRpb25zIHdoZXJlIG5ldmVyIGJyb2tlbiANCmlu
dGVybmFsbHkuIFRoZSBjb25kaXRpb24gYmVjb21lcyBpcnJlbGV2YW50Lg0KDQoNCj4+ICsgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+PiArICogU3RhdGljYWxseSBp
bmZlcnJlZCByZXR1cm4gZnVuY3Rpb24gKg0KPj4gKyAqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioNCj4+ICsgKi8NCj4+ICsNCj4+ICtUQ0d2IGFyY19nZW5fbmV4dF9yZWco
Y29uc3QgRGlzYXNDdHh0ICpjdHgsIFRDR3YgcmVnKQ0KPj4gK3sNCj4+ICsgICAgaW50IGk7DQo+
PiArICAgIGZvciAoaSA9IDA7IGkgPCA2NDsgaSArPSAyKSB7DQo+PiArICAgICAgICBpZiAocmVn
ID09IGNwdV9yW2ldKSB7DQo+PiArICAgICAgICAgICAgcmV0dXJuIGNwdV9yW2kgKyAxXTsNCj4+
ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKyAgICAvKiBDaGVjayBpZiBSRUcgaXMgYW4gb2Rk
IHJlZ2lzdGVyLiAqLw0KPj4gKyAgICBmb3IgKGkgPSAxOyBpIDwgNjQ7IGkgKz0gMikgew0KPj4g
KyAgICAgICAgLyogSWYgc28sIHRoYXQgaXMgdW5zYW5jdGlvbmVkLiAqLw0KPj4gKyAgICAgICAg
aWYgKHJlZyA9PSBjcHVfcltpXSkgew0KPj4gKyAgICAgICAgICAgIGFyY19nZW5fZXhjcChjdHgs
IEVYQ1BfSU5TVF9FUlJPUiwgMCwgMCk7DQo+PiArICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+
PiArICAgICAgICB9DQo+PiArICAgIH0NCj4gDQo+IFdvdywgcmVhbGx5PyAgQ2FuJ3QgeW91IGdy
YWIgdGhpcyBkaXJlY3RseSBmcm9tIHRoZSBvcGVyYW5kIGRlY29kaW5nPyAgV2hlcmUNCj4gc3Vy
ZWx5IHdlIGhhdmUgYWxyZWFkeSBlbnN1cmVkIHRoYXQgdGhlIHJlbGV2YW50IHJlZ25vcyBhcmUg
bm90IG9kZC4NCg0KSW5kZWVkLCB3ZSBjYW4gZ3JhYiBpdCBmcm9tIG9wZXJhbmQgZGVjb2Rpbmcu
IFBsZWFzZSBhbGxvdyB1cyB0byBkbyB0aGlzIA0KY2hhbmdlIG9uY2Ugd2UgcmV3b3JrIGJpbnV0
aWxzIGNvZGUuDQo=

