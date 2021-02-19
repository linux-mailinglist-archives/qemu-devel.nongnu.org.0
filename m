Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78B31FD2A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:35:15 +0100 (CET)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8kM-0006V2-R5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lD8g2-0004JA-3L
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:30:46 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:5856)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lD8fx-0005ki-SF
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1613752241; x=1645288241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mqoeD4wZbCaLi2WHR7KwsQb9e7ShwrYIirD4c48vsX8=;
 b=GrF0Oqr9zrd9P0WfWv3S57pRBEpzX9y/IKluWqiS1tC98u5qE46EixbN
 MAIySWsMrjWZt6ALoJo+Kv2FgHEoG0Nw2KfTWkW22y4Utu/T5hDl4di/u
 FVx2fWAQcqfCWPZtOus5TMb/nPUs45oYLj5e3UDel/dMQ/6AXnfnLOBgv Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Feb 2021 08:30:39 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 19 Feb 2021 08:30:39 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 08:30:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 19 Feb 2021 08:30:38 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5927.namprd02.prod.outlook.com (2603:10b6:a03:121::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 16:30:37 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 16:30:37 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: RE: [PULL v2 00/35] hexagon initial commit
Thread-Topic: [PULL v2 00/35] hexagon initial commit
Thread-Index: AQHXBhRRW3T4i6ry9EO95kx5p09+sapfTm4AgABajuA=
Date: Fri, 19 Feb 2021 16:30:37 +0000
Message-ID: <BYAPR02MB48863A37EDD68A448C186C50DE849@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210218162944.1756160-1-richard.henderson@linaro.org>
 <CAFEAcA_G_d8VF1U=WdBvFmUQCR3YFzQu1WqUqHFQRKsF2q6yeg@mail.gmail.com>
In-Reply-To: <CAFEAcA_G_d8VF1U=WdBvFmUQCR3YFzQu1WqUqHFQRKsF2q6yeg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 391aec53-0dac-4c9c-834d-08d8d4f3b08b
x-ms-traffictypediagnostic: BYAPR02MB5927:
x-microsoft-antispam-prvs: <BYAPR02MB59275E3D6AD6BF43F3CA4112DE849@BYAPR02MB5927.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p/CCDVMKGoeYRvMzHi65JdFfApE5lQQnCUb5yZyY92tFG+lix6RVL3uGHY7TSygpkWrUV1gfSq1COWM2GPiJkgA1qGIgQU1iQbR7eoimQbEBK23gneiy163nXFGb2UIOhvQ8EikGqggKN0Qv1QOM94lscQPsYuiv276VIj8Hl30bUMT37e/TSTqxvjWTDlZwgPBQP18nEAm9+ljtK631UA1C3JObE6+6dV1jLC6d9aPhYRZY3ZjH09ZZK3CDGzrmDEIe8uUKFWv4j0cTezCEPj4abvsgbK1bosFJftmL6MjRQS2ps8zKGfRY7npBA/bjHWUOGOx1c1zuE9KM1mEIu38vi0P0pmkBB8IBO9aP1wXYPNFGk8yCLlmlTdBT9G7fUUbkVCDlHEzDDlMiVAL9NPsCCySSLt6955ioUNPMAa2djs9uKmftsVrIOyro1J99ZIS0IO6N21Gyiq560R5UVe6dCQZ40ijDY/5cCcwju470hpejiQL1kDgDpZQo0g1CBy7bO4bT54A6FZt4l0TQrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(8676002)(2906002)(5660300002)(9686003)(76116006)(86362001)(8936002)(7696005)(33656002)(83380400001)(52536014)(316002)(6506007)(26005)(64756008)(4326008)(66446008)(478600001)(110136005)(186003)(71200400001)(66946007)(66476007)(53546011)(55016002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dlc3MHhDakxYcGdjSFV0Q1pnU1N6YjQ0TjVQbWYySzVtRmxVOFdMd3ZQOGdI?=
 =?utf-8?B?U2cxQU1FUm1ZdDJ1OE4xb3NJTVZVOERJM3BiN1VmdW5qeXpQdkZYdVo2bVIz?=
 =?utf-8?B?MC90ZXNNbmFESFUxQ3pLREdONzFwY3gwVHRwOEwrdmQ1RVFYNkpiaXM1SjBM?=
 =?utf-8?B?SGQ0eWlMWlg5U0tRbzBRQm5OY2pjbDhNYURGU25TaUpBNzBvMWx0RHJFOGsv?=
 =?utf-8?B?UVRkMXBscTZ1c0ZIR3ZPUU9MaGp2aEUxNnZycFpVTHZTekJrVDZzSURPcms2?=
 =?utf-8?B?OFVVL3h4dDBHZURMTjFVQThWVVFTRU4rTm1EL0ZvYWpyUXdHZEJJaUh3bngz?=
 =?utf-8?B?cERVeEhGQWhhUDgzQjBvMVM0Q042bTZzekF0YmlaVHVTMVJFLzQxOGZ5SkNI?=
 =?utf-8?B?L3dHZWZWTUxraWh1Wk80THY5eHpnc1ZCZFZuUmkvUzBYc1BNL1MwblRmS1VV?=
 =?utf-8?B?TEJuM2xJQWR2TmRVeVU4U2ptVWNocGtuZFM2MWdqUVhEOTlSTWw3Yk9uWkRq?=
 =?utf-8?B?VzRtY1NoM0F5K0VkbDFpUE13N2t2NTRaT0hlejNaM0pmZ3drVWd5c3JMY3Jj?=
 =?utf-8?B?cll6cHRHcjR6TmRscXc3MXZ0elZDaElmUHNEczJrenJxNFgzckdBNk01VTB1?=
 =?utf-8?B?d1VQZVNkWG82NWJSTWw2c2Z3WEtRMkVqVWIvK3NmT256UzQ0b2JodUxFcUkw?=
 =?utf-8?B?MmhmMGZuMkZBR244QjV0bHZiekwwOXUycEFENmRrdW1mV0ZKcmxsSjd6U2Y3?=
 =?utf-8?B?QVpXL2RQWEduWDU5cG9oNEg5aldkNGFnL01LTVNQL2J6bUVIYkIrUFY2dFUr?=
 =?utf-8?B?ZTBET25oN2g5NVROT2ZqcUQycURWUDhLVlR1Vjc4cWptcVVLU3Q2M0tBQXp0?=
 =?utf-8?B?WnNQRGVVRXZMS3dndHB3Ujk5SEhMdVJYVEtFL01BWTJ5OW8xaXl6bEphcXFo?=
 =?utf-8?B?SmRTRFVnS1VNcW5vUS9UN1E2MmVzL3NXb2grVTl3eDc0MUJSVHVNMExpNlFs?=
 =?utf-8?B?YkFsWTJZbEw2WG11S3NsZXdyOTQ4VGc1WktMb3FUeHVwOEJJdStnbmQvMCs0?=
 =?utf-8?B?WWRZSnNSUGxTaWZ6NUQzMDlBVS94cmVCeVN6RHJzNzAxSXcraFVMV1NkY1Zz?=
 =?utf-8?B?RTdYcVNvYmxpUGZSRjhGTlJIa1M4UUJlOTJuNGJHZUV2UnRaQW5CNU1Hbi9U?=
 =?utf-8?B?UkhDMFU2Z2hSQ3FtSWpZNTM4THNuOWpoN3pUWHdlZGpvem1tZktIZFBNREdS?=
 =?utf-8?B?Q1grZEVuZ2JIMmdmRHRyU3hEWFZ5WTlaeTBaNGFEL2p1ZTE3dGU2T1hmMzI3?=
 =?utf-8?B?YktnaVgxbVdXT2wwajYzV1p5cUR0Q2VpcGxBZE9uUzNRMlpvaGJ4NERTQ0dl?=
 =?utf-8?B?NmJkem1kNm5CYUtITmErVUpNVnBLQWgveTZwek5lRmdybC9SN3RXNkNIcW9L?=
 =?utf-8?B?amMrV005dnNpbjJiRlpaY1pyMXlhMk5lMHFEZklXOVBDMEM3TFZabWpIM2k5?=
 =?utf-8?B?THE1QWtnSnJTNUxXYS9GSkFiVkdrSnVDMjZNNzF1REF5NXVOTFhUNFFtMFlG?=
 =?utf-8?B?ZGlMZXBvZHZ1OWNYcjUyNmNkSkFseVVyVkhybTF5TnFhUkc1NURCNWlLRURO?=
 =?utf-8?B?VGxJc2xyaFg5clplZXk5M0N2eG5PblMzNUJoSnFSRGZETUFxVkZMVzc4L2Uv?=
 =?utf-8?B?OG9LS3dseC9oTGtUSThKQk5xdUo5OUpwMW9xQW1KNzdMcnBXOTc4c01Ga1px?=
 =?utf-8?Q?HSgnFOQlpywo5iiqRgefpW6J3nBIVZOdeMUhzxu?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFV82I110PGq5NXsDz0fM0lenQ7c84cENSEeo7nvMvhk//3N+/nGLAt+0c6GVdCC31EbZxJvGZw2L0HkRDiHZL6lI2PVCKJFbluBLtSt+e5KeVMu5ulM1xquuQ6gfeHrQsUsyszYhLtf5dDRGGtJwbq4XL21FEiXBXvq54ojcKe1OZeiyVs0skZsxRm57IvwhAvM08a8lXawCKSsTEy+yVo8aMrlTRhdAjQjtTzkQt/9YpZGeGwpQztjuAO3AVaZcbP1FjXibpf0vuTC0mHhY+jVvKfxxr7mjZJVuRo/+00QjKlzgwV1vsr8wRM6+aZ/3eAczaZysXH51wSLZrl49Q==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MTZwcq75zSuMlB7MwKZQRwlut6Mh7t2X6aXy54FPkY=;
 b=gZqFDDBZ37lTDWuXjO//leVaAspyk+SKv7v9IWRR1wYZ3qfIpTBseZEqGMRhWWfkwaY7Pg+Y6qUXJaJaJIJzGbV6m/feW9iHWVyLmMWCMnON9tp/ZdCSrAOQT4xyXElriQykj+cbwBHgH/JBBuDe0dwIHnIxU2o5Dr5+ocY2O6FnAfrA1kDPd76+NwIXnDr2g3pQuXi0+HcxgfVzD1feECeX7FkzR3uMCN910jmJ4haad/EjWbGiaDzWyY/Xq4pfWJj44pyumNvdCCOIKs0q+GqgB8DYWDQhTkbjqG88f/XoFzEFCPGBpquXO2Yqu3YxeC5tSpIqy1RQkbyyeFti+g==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MTZwcq75zSuMlB7MwKZQRwlut6Mh7t2X6aXy54FPkY=;
 b=hgh4mL2dPFal7MYLT0sPYrfT5PJtXGG/DBu/7As7tM8wxF+Lj/fjeM/4eDy5jKAIDN1712I3kiM25haxUVB+c6Dstg/f/cWrisfCGJPrew8+B57NsSTrk+hdMp0USaiOmy5GQFiZ8QS57J+RlzcJ/NFhIYdTgPCR53hI8HwnfH8=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 391aec53-0dac-4c9c-834d-08d8d4f3b08b
x-ms-exchange-crosstenant-originalarrivaltime: 19 Feb 2021 16:30:37.6000 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: m70dLdz39vmx3BGtHsN8znoaleUC8uy2+XolJSWCkCZBCVrJL6ZaK5uUEfGaw2kJnD+ffYMufc7sahA3Glat0A==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5927
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSByZXF1ZXN0ZWQgYWNjZXNzIHRvIHNjYW4uY292ZXJpdHkuY29tLiAgT25jZSBpdCBpcyBncmFu
dGVkLCBJJ2xsIHRha2UgYSBsb29rLg0KDQpUaGFua3MsDQpUYXlsb3INCg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxOSwgMjAyMSA0OjUyIEFNDQo+
IFRvOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4g
Q2M6IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgVGF5bG9yIFNpbXBz
b24NCj4gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BVTEwgdjIgMDAv
MzVdIGhleGFnb24gaW5pdGlhbCBjb21taXQNCj4NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4NCj4gT24gVGh1LCAxOCBGZWIgMjAyMSBhdCAxNjoy
OSwgUmljaGFyZCBIZW5kZXJzb24NCj4gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+IHdy
b3RlOg0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiBJbml0aWFsIGNvbW1pdCBmb3IgdGhlIFF1YWxjb21tIEhl
eGFnb24gcHJvY2Vzc29yLg0KPiA+DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPg0KPiBIaTsgQ292ZXJpdHkgU2Nh
biByZXBvcnRzIGEgcGlsZSBvZiBuZXcgaXNzdWVzIGluIHRoZSBIZXhhZ29uDQo+IGNvZGU7IGNv
dWxkIG9uZSBvZiB5b3UgZ28gdGhyb3VnaCB0aGVtIGFuZCBjb25maXJtIHdoZXRoZXIgdGhleQ0K
PiBhcmUgZWl0aGVyIGZhbHNlIHBvc2l0aXZlcyBvciBlbHNlIHByb3ZpZGUgZml4ZXMgZm9yIHRo
ZW0sIHBsZWFzZT8NCj4NCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

