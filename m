Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC040D781
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:34:39 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoiz-0000K5-TB
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4893bdb087=xuzhou.cheng@windriver.com>)
 id 1mQoWQ-0000o2-7J; Thu, 16 Sep 2021 06:21:43 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:11394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4893bdb087=xuzhou.cheng@windriver.com>)
 id 1mQoWN-0006vk-BK; Thu, 16 Sep 2021 06:21:37 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G976Fi026396; 
 Thu, 16 Sep 2021 10:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=eIyF5ZiVogCumNQnY7g4YkNOhjGm+YaikPmrkGuR63s=;
 b=KyNC9lJq6kSqVyjMl4Ui7AamPSO0xNlTmfiseL55HT4cjPxRz47/NRU/4CRiVHpH7qU0
 vrvzAuzpJY2f2X71dh60RMisZUyfWSB1E/UHnenDWKOKkK7ftdviHQXSQkE3K2f3jWOp
 1nGsFcpBz2AWgKnfhihwLJUJQNNCGLzxlnhr6ZWGYdPftodEF7BjPBn60YRrH4k1iQL4
 gYslAhrUdvaq6px8EPkvpJ7/x46QsAxzctxSRU2xDidL7YgNuU0PVG/Hppu4Yp2ft57v
 MPtnm6nlPpPcRBNZJ0YuB+hdN0LN9ypqCKmqoiGoDIRfjDDoHmEQaU7bI2i1n70Lv8MC FA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-0064b401.pphosted.com with ESMTP id 3b3wq5r7xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 10:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg+4WH/SP1IukQ2qv1OBd3AQv/ia4NcGiumY9d/uzd+lnz7qmNVJHnQBMhOKGz2i6yfECXlzaWU0joW6A0C2uX8ZhYEeyJuIskvnbripwap5Md6EjDy616ogY5cvTyZ/jdvrOHQXRP/g5XBbl0Dhl2cI33w8jd+NeP8d9++pRJvygoixIK8Zg4Hz890BZfKKfo7+XtFLd/ONA3CoQDwS/kB5pkjc9SylQlCI1/u0rfmL5pkhmyzwQrul7U8+0DZ2BQYDe3xc9aPZC/4a8P8BfZWD0rvkUJFpXFfIgWSIOuwZE6wXHdK1HCFC8bDOnpSjkD1zhb76g/X5SsoMQsKuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eIyF5ZiVogCumNQnY7g4YkNOhjGm+YaikPmrkGuR63s=;
 b=gQ9/D5Z6pQoV7E9vqV30nYeBUpUfCeQ8yvQF15VwAIV/Hobb/t2I7g5LEVIhp2NuE/Vyv/RHoTDbbWahMjvixRzNZ3NRMooeE/mdwI5Hi0FqwWg7zjQF1ocnABkdq3OrzVXu8R9jbX/1+RGrtHFBx5WfZF0ZK9dCX+dQk8qJgMNiRL4Ec5RwRx5vACeroMtfbMqesEORKTucAtlLk7KdZ5XT/Eaoi3k0U355MwIp8+VBhF1zFiIsHswwiahgEOG0nhbx28vo6FjnaNciTTUt34P4HEkPDHmcbMV24nPrab+MIfa9ozDqCYSJ4r6Yg1X8ss5WG366YuO1TmYkVoHbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 by PH0PR11MB4854.namprd11.prod.outlook.com (2603:10b6:510:35::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 10:21:16 +0000
Received: from PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40]) by PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 10:21:16 +0000
From: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>
To: Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Thread-Topic: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Thread-Index: AQHXpHskAiQidG75/Um5ihjizNW0VKuZvOaQgACeDgCADCMesA==
Date: Thu, 16 Sep 2021 10:21:16 +0000
Message-ID: <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
 <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
In-Reply-To: <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none; roeck-us.net; dmarc=none action=none header.from=windriver.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11b67461-65d8-40ce-cd00-08d978fbb7d6
x-ms-traffictypediagnostic: PH0PR11MB4854:
x-microsoft-antispam-prvs: <PH0PR11MB4854BBC197BE1B0C5695B84D97DC9@PH0PR11MB4854.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KwE7H/wk6/jqozzHF0FiFAvRwCfIEitNiBb7S73o0/zPrELgCpn08mHYZDglO9HqkFH9yEb4dtZIYjRJrlfcnqyaDewIai6c/TPKa3qb2MNIo58O1rDunDm1i1VHhFuSYPlLeeEx2S+dMMRh/o5suEr/ShLD+wIJO/OPp0X3bxy1x7J2j7ccH9hUBeD9WqP4l+dYohUluXMN28RBGg9zv7TYEfdfGHpmd/NLHO54FpnPDpwbDLA6mVO60WsYWYwH5ay4H+QiwR+L9SZaXnhEQhpYF+zLa/SiLx7XSxnMst3zoeVJyAqXDZMXsiI+djfKOwFKbemsKcqA6R+Ip1qPeMQ3BRtpqLJv92RA6Hnbb4neeMs8XcHcYvw8UcOU/D+0nLcoL8AtR0EdBkiuXPj2uT57u08Ai0pdO7HBSQ1kYQAHQUUN/bUCxUSR9S2FAcLW0P/qWekWi4OfmSyN/I8Fwpi2aKpwwPTumVSSVzihlry5B+o48cafrHAFxNSdHlkdCin4xVPwN6onDjcPdGVTAe+XQNOooGSMINMx7KYYICQc5YU81wFuuqx8wSqn/knxRK3TtxdT5ghPz3t17DHMMMRnNUy5h0Z3zlxtPSQ1aSh+M1kVXFs9OoiqZDUIl4sIw0eXN+q0lK3NPXY/xsNR4AkckFpyc7RBg0TsKt8I4aF7oA/YxY+lE+LIx2VBXqVtCWmExejngfSDe05KAdWJww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(8936002)(71200400001)(52536014)(26005)(8676002)(478600001)(38070700005)(55016002)(9686003)(4326008)(2906002)(76116006)(33656002)(66476007)(64756008)(66946007)(7696005)(186003)(6506007)(5660300002)(83380400001)(38100700002)(54906003)(66556008)(66446008)(110136005)(316002)(122000001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU1sOFY2TGJubUtlNitERnoxMGU0M20zcUpYa25FbTdkVWF5Um1hQUNHc1JL?=
 =?utf-8?B?TlFEbGVXcmVlT1prbVRqOFZBbHV2OGZQUy8wbm9XMUo1TmIySm82bGNQUS9j?=
 =?utf-8?B?MjkvcXQxSE5CT2c3TE5ueHBGRVdiRVE1ZzBza0dtVStONGxHVkVTSGl1dk9I?=
 =?utf-8?B?QnlSYnhhSDB5UnRtQW82blI1ckp0Y2dYdzcxQXZaMFROWHRrNjdnSFpJZzVV?=
 =?utf-8?B?Tzc5ZEZ4OTh5VVNyS2x2Z0tsZUZEaEFyWFAzNVI2d1hVa09xMzF0ZnFnYjFn?=
 =?utf-8?B?bGlwZXFHUkVqbng5OHJrK1JJYTFaRmU0RlptNG9kWGQ5WDBNaHY5WXc1UlNy?=
 =?utf-8?B?N0hkMFJRdkthMTRXS25YTnUwaHVpbVdyL1JtMXZDQURDbFM4TzJVcCtvbXdz?=
 =?utf-8?B?bGtuQVJaNkZudkNkVkk3cjEwbG1MMm9hMlZVdFNicEVaOGcrUEszWlh3TWdW?=
 =?utf-8?B?QzZHQXltK2FqQTYzbytKaURLQlZmUm15cjVhVmtRT0hkcnBIVVlFbjlpbnda?=
 =?utf-8?B?R3p1QmpPY3FnWVZpOWxacTJ6M2lQNFptMFJmU0xXOTU2cUVKalFXT0VnY051?=
 =?utf-8?B?Z0swc25YQ0tMZDI5MXNpUm5MWHNNSGRzTStTTUtWam0zdUk4QlRQR1BuY3FR?=
 =?utf-8?B?cktwa1ZlcVM4RjY4dGtJN3dxOENlb1Z3Q2hGcXhzSTJWbGZYZ2ZoYnQvUGEv?=
 =?utf-8?B?aVA0OXU2MUwvUUVFSkhJbzg1OW9KN0NmV2E0aXZlcXB6WjF2NlNXb25xUzBm?=
 =?utf-8?B?V2tHUkZvTm5vSEt0ajFlL0pRRWJSY2RrcFFFYnA0QlJCNUVZSEdIMEM3UkdU?=
 =?utf-8?B?U1BTcVE0OG9vSTR3OXI2cHZvWmdxa1dCNFlhRDAyZm1LaDJXWjlFOW80R2sx?=
 =?utf-8?B?Ni9yUktMTkhsajlOSVF4ZkI3QTZldEFnQjhjZjVSWTZ1VE9tOVpuWmNIaFVW?=
 =?utf-8?B?eHVZNW1UUS9mTnVKNjBldzdGSGMzSzVQeVJqbW9wQnhYOUdFTGVZTGhtWUlR?=
 =?utf-8?B?UlorK0lQazhXZzhzWmpYR0VaR0w4MmVRaFN6WGxrV0ljc1BUSEY3L3Ywb1ZY?=
 =?utf-8?B?cUtHLzBFVlV2ZC9GRUM1YWtzSUU2eWcyK2ZCWGswZFBUcXJPbmpDMkNBdkxp?=
 =?utf-8?B?VU10NUVFRW1EL1NXYjRvdjREMVh2OWk5T3NjbWZEWUNEdlZIZGl0L0prT0hR?=
 =?utf-8?B?aGpBSXBENnRtU3hwVUNUaDB6TlVpNEhRQXViR08wRkVTbHMrOFZaaHhSamo0?=
 =?utf-8?B?dGhqOEhRWWV4Z2NLaStZTjNkNE01NWpaNVBBdU9kV1lBb2NDU0ZwZGM0anlG?=
 =?utf-8?B?Q1hNd3pKanNXQk8vODFDeWZ3akIwRjY3N1ZHS00rNktsc25JeDFGVXJVL0lS?=
 =?utf-8?B?bjNDVVQ1cEZPZkpwTG10MVJMaVJ0U2VBRWtrdHZDdWl0bWpoaVFiNmpaMmFz?=
 =?utf-8?B?S0dEUUxieXNUUE5XeWdHN0tSQmpTY3pCcm0yOXBCZS9qOVVQajQwbThxNEs3?=
 =?utf-8?B?S21pd3NwVmF1TkJUYXBGYTdqdy83TkJrMUwyaDFZbVdzSVZxcEpRcFYyeUx3?=
 =?utf-8?B?RjFjeXFIbVdESkNiZkxPNWVYUmxPSGR6V0R5WngwcktwZDZ1YVNLeVM5dmNF?=
 =?utf-8?B?MkZVamlteGJ0Z1hyTXVxdzhrSXM0aVZRdWJCRDcwZmF3eFp3Q1JVRHBJdWdI?=
 =?utf-8?B?WkpSakRLWlIzSVcyQ1drdEw5S2QrWW5HVnc0eENRaW5mSm5NK01GeW02QmVl?=
 =?utf-8?Q?aja/29dfVozkCPyF7k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b67461-65d8-40ce-cd00-08d978fbb7d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 10:21:16.2394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdGpohUm50x6zgs5Ei5+wv5KgNFNGQgrI7FiMUv1jWUxFo1cBdZVEvuh6jpb6yNCCVJbjhM6UA4iCJBIc8WgboTU3I3bj9vFoMwjijBinuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4854
X-Proofpoint-GUID: zqDnC83ObrZO40DHQzOuH5HX_XjFt_Nf
X-Proofpoint-ORIG-GUID: zqDnC83ObrZO40DHQzOuH5HX_XjFt_Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_03,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=513 malwarescore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160065
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=4893bdb087=xuzhou.cheng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBkaWZmIC0tZ2l0IGEvaHcvc3NpL2lteF9zcGkuYyBiL2h3L3NzaS9pbXhfc3BpLmMNCj4gaW5k
ZXggMTg5NDIzYmIzYS4uN2EwOTMxNTZiZCAxMDA2NDQNCj4gLS0tIGEvaHcvc3NpL2lteF9zcGku
Yw0KPiArKysgYi9ody9zc2kvaW14X3NwaS5jDQo+IEBAIC0xNjcsNiArMTY3LDggQEAgIHN0YXRp
YyB2b2lkIGlteF9zcGlfZmx1c2hfdHhmaWZvKElNWFNQSVN0YXRlICpzKQ0KPiAgICAgIERQUklO
VEYoIkJlZ2luOiBUWCBGaWZvIFNpemUgPSAlZCwgUlggRmlmbyBTaXplID0gJWRcbiIsDQo+ICAg
ICAgICAgICAgICBmaWZvMzJfbnVtX3VzZWQoJnMtPnR4X2ZpZm8pLCBmaWZvMzJfbnVtX3VzZWQo
JnMtPnJ4X2ZpZm8pKTsNCj4gIA0KPiArICAgIHFlbXVfc2V0X2lycShzLT5jc19saW5lc1tpbXhf
c3BpX3NlbGVjdGVkX2NoYW5uZWwocyldLCAwKTsNCj4gKw0KPiAgICAgIHdoaWxlICghZmlmbzMy
X2lzX2VtcHR5KCZzLT50eF9maWZvKSkgew0KPiAgICAgICAgICBpbnQgdHhfYnVyc3QgPSAwOw0K
PiAgDQo+IEBAIC0zODUsMTMgKzM4Nyw2IEBAICBzdGF0aWMgdm9pZCBpbXhfc3BpX3dyaXRlKHZv
aWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNldCwgdWludDY0X3QgdmFsdWUsDQo+ICAgICAgY2FzZSBF
Q1NQSV9DT05SRUc6DQo+ICAgICAgICAgIHMtPnJlZ3NbRUNTUElfQ09OUkVHXSA9IHZhbHVlOw0K
PiAgDQo+IC0gICAgICAgIGJ1cnN0ID0gRVhUUkFDVChzLT5yZWdzW0VDU1BJX0NPTlJFR10sIEVD
U1BJX0NPTlJFR19CVVJTVF9MRU5HVEgpICsgMTsNCj4gLSAgICAgICAgaWYgKGJ1cnN0ICUgOCkg
ew0KPiAtICAgICAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfVU5JTVAsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICJbJXNdJXM6IGJ1cnN0IGxlbmd0aCAlZCBub3Qgc3VwcG9ydGVkOiBy
b3VuZGluZyB1cCB0byBuZXh0IG11bHRpcGxlIG9mIDhcbiIsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgIFRZUEVfSU1YX1NQSSwgX19mdW5jX18sIGJ1cnN0KTsNCj4gLSAgICAgICAgfQ0K
PiAtDQo+ICAgICAgICAgIGlmICghaW14X3NwaV9pc19lbmFibGVkKHMpKSB7DQo+ICAgICAgICAg
ICAgICAvKiBkZXZpY2UgaXMgZGlzYWJsZWQsIHNvIHRoaXMgaXMgYSBzb2Z0IHJlc2V0ICovDQo+
ICAgICAgICAgICAgICBpbXhfc3BpX3NvZnRfcmVzZXQocyk7DQo+IEBAIC00MDQsOSArMzk5LDEx
IEBAICBzdGF0aWMgdm9pZCBpbXhfc3BpX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNl
dCwgdWludDY0X3QgdmFsdWUsDQo+ICANCj4gICAgICAgICAgICAgIC8qIFdlIGFyZSBpbiBtYXN0
ZXIgbW9kZSAqLw0KPiAgDQo+IC0gICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgRUNTUElfTlVN
X0NTOyBpKyspIHsNCj4gLSAgICAgICAgICAgICAgICBxZW11X3NldF9pcnEocy0+Y3NfbGluZXNb
aV0sDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkgPT0gaW14X3NwaV9zZWxlY3Rl
ZF9jaGFubmVsKHMpID8gMCA6IDEpOw0KPiArICAgICAgICAgICAgYnVyc3QgPSBFWFRSQUNUKHMt
PnJlZ3NbRUNTUElfQ09OUkVHXSwgRUNTUElfQ09OUkVHX0JVUlNUX0xFTkdUSCk7DQo+ICsgICAg
ICAgICAgICBpZiAoYnVyc3QgPT0gMCkgew0KPiArICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBFQ1NQSV9OVU1fQ1M7IGkrKykgew0KPiArICAgICAgICAgICAgICAgICAgICBxZW11X3Nl
dF9pcnEocy0+Y3NfbGluZXNbaV0sIDEpOw0KPiArICAgICAgICAgICAgICAgIH0NCj4gICAgICAg
ICAgICAgIH0NCg0KSSBnb3Qgc29tZSBmcmVlIHRpbWUgaW4gdGhlIHBhc3QgZGF5cyB0byBpbnZl
c3RpZ2F0ZSB0aGlzIGlzc3VlLiBHdWVudGVyIGlzIHJpZ2h0LCB0aGUgTGludXggaW14LXNwaSBk
cml2ZXIgZG9lcyBub3Qgd29yayBvbiBRRU1VLg0KDQpUaGUgcmVhc29uIGlzIHRoYXQgdGhlIHN0
YXRlIG9mIG0yNXA4MCBtYWNoaW5lIGxvb3BzIGluIFNUQVRFX1JFQURJTkdfREFUQSBzdGF0ZSBh
ZnRlciByZWNlaXZpbmcgUkRTUiBjb21tYW5kLCB0aGUgbmV3IGNvbW1hbmQgaXMgaWdub3JlZC4g
QmVmb3JlIHNlbmRpbmcgYSBuZXcgY29tbWFuZCwgdGhlIENTIGxpbmUgc2hvdWxkIGJlIHB1bGxl
ZCB0byBoaWdoLCB0aGlzIG1ha2UgdGhlIHN0YXRlIG9mIG0yNXA4MCBiYWNrIHRvIElETEUuDQoN
CkkgaGF2ZSBzYW1lIHBvaW50IHdpdGggR3VlbnRlciwgaXQncyB0aGF0IHNldCBDUyB0byAxIHdo
ZW4gYnVyc3QgaXMgemVyby4gQnV0IGkgZG9uJ3QgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5IHRvIHNl
dCBDUyB0byAwIGluIGlteF9zcGlfZmx1c2hfdHhmaWZvKCkuIEkgd2lsbCBzZW5kIGEgbmV3IHBh
dGNoIHRvIGZpeCB0aGlzIGlzc3VlLg0KDQpCVFcsIHRoZSBMaW51eCBkcml2ZXIgdXNlcyBETUEg
bW9kZSB3aGVuIHRyYW5zZmVyIGxlbmd0aCBpcyBncmVhdGVyIHRoYW4gdGhlIEZJRk8gc2l6ZSwg
QnV0IFFFTVUgaW14LXNwaSBtb2RlbCBkb2Vzbid0IHN1cHBvcnQgRE1BIG5vdy4NCg==

