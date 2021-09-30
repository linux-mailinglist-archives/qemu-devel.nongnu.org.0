Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B43F41E226
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 21:19:20 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW1aR-0005QQ-1G
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 15:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907f52c21=jtanen@fb.com>)
 id 1mW1Z5-00040G-QK
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 15:17:57 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:34900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907f52c21=jtanen@fb.com>)
 id 1mW1Z3-0000MK-6k
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 15:17:55 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UH2rUx024737; 
 Thu, 30 Sep 2021 12:17:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=sHqw3Zj8QVF2NQr5zghXwoXytbDtMNWvDfFyaoI9kyM=;
 b=PCNiu/jkEPJ9Kd+Is1j+BFhUH8QArh+jjpibSmlLdDhdcWqYxI9JxDrwacCBoo1AoX5w
 TlLFttr9CgjQFErvVWC8VnwMNJIS2Q14BmRQhJqY51V0kKRQg0sDGsXn7cmlLdwvdgl0
 U6fJ/VqnQSJAFeW3ZCo0i+RoNifZBTPHWEs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bdh9ks0vr-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Sep 2021 12:17:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 12:17:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQacZgzfafTzooQZ/uUhMebPftp4fVTVh3/wZnc43O1pS60onPNEtw0COqbj/m6U4/KiKGQlo7Hki9g1Rrr3QHH2LCkTk341Wk6dSTelvVhWeFiF9sFnmhePQEEDtQD0KvYqnbi+RLpu5Iusyef/yvYYTGJlJKwAFto1nh6Ry0nz+IOCJhEiKk77wRCRviMg7FZnxyzSnK9YffVKx8oFcjKY/df+r1DAMErB/Yz9OvvjnLc61iyyTDJcpNqJGr0S3IpXbjMpFMYF47c8NJ6CF+YdNLWGP8CuY8tv4cfEvgEaqGw22mUTaKahyXtmxn8By35/pL2+du87/u66XNnsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sHqw3Zj8QVF2NQr5zghXwoXytbDtMNWvDfFyaoI9kyM=;
 b=ZOJdwNxQCieSoE8X98XtZA4WAzkoAoHT+M7Argm0S78MXF1hSFksVtPKMIeiNmd2cylBX8Kz8cEcXKViUAKDfz36C9zwz9N7i2+wVpCKN8yRKR/pVNz9Qkfpl8M7sn0srbq0LYX+g+KbDm2u8Rj7nwoWeu/iMaIQqQA8Rx2ylcWxkoDdP9RZ1zXhKKTfXa2njrpB5Le6Lo3laMEeRCy21Jsfa/DEBk4WF+Lw1sKy+/iG0IR/4dvGWDWnuteg2+l4v7ho4gLaeo3WPtFCbRx2jnie/a4XMjqWBA+pJR0K/HztPEfiY/ikd1xlUFcf1JV3KV2y7tyll5gx1/qxLKM5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from SA1PR15MB4484.namprd15.prod.outlook.com (2603:10b6:806:197::5)
 by SA0PR15MB3870.namprd15.prod.outlook.com (2603:10b6:806:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 19:17:48 +0000
Received: from SA1PR15MB4484.namprd15.prod.outlook.com
 ([fe80::e92c:9d8e:a9b0:5b6e]) by SA1PR15MB4484.namprd15.prod.outlook.com
 ([fe80::e92c:9d8e:a9b0:5b6e%2]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 19:17:48 +0000
From: Joe Tanen <jtanen@fb.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "dirty@apple.com"
 <dirty@apple.com>
Subject: Re: [PATCH v1] Use CLOCK_MONOTONIC_RAW if available for get_clock().
Thread-Topic: [PATCH v1] Use CLOCK_MONOTONIC_RAW if available for get_clock().
Thread-Index: AQHXthKyRjSgKbhwdUGK66yq8X/F5au8vyoA///xWYA=
Date: Thu, 30 Sep 2021 19:17:48 +0000
Message-ID: <62DCCDEA-1ADE-49E7-81B6-EB4BDD0EE85A@fb.com>
References: <SA1PR15MB4484B78AA300C0D419BA70DFABAA9@SA1PR15MB4484.namprd15.prod.outlook.com>
 <CAFEAcA-=mAVSotX524ewvdxR2SQkZAhx=SwHq61Zqnf8H6LgHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-=mAVSotX524ewvdxR2SQkZAhx=SwHq61Zqnf8H6LgHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c84e02b-b2cf-45fc-f4ad-08d98446fd76
x-ms-traffictypediagnostic: SA0PR15MB3870:
x-microsoft-antispam-prvs: <SA0PR15MB3870A11E108D2115700DBF07ABAA9@SA0PR15MB3870.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pu+btCZBMHAOY+wLZjN5+WgqzSnj9Iu4H+iTcqVVoa49E+PLYP7BIx2Zgh7P92OIRVWBvZTIN1qMhSHCj2W49udSPI8ncLcPZrNdHLJpYfDWHQxPEB7GG9tEi3dufY8LvppS9i6D+odWr5IrPtm9mnJt0lZZMb+6EJJolGT+/ox3MAx3hYrRHztduiDfefp41GF7xUzsfqoHU9f8VV+EITljnq7peJz/MxIxvX9hHcNqT/Vtt7A6F16AQSnhSSbiacS8fZBOH9Q8i9fO04O42uaRfEi6gEY4ttU7imhXaztFE5E2hCgjIZFR6rrpB0c+835idJ8WdaCguvBJilT66w06ynyZx8r4I7SuMbUS4lfGUHaMiDNqa7yDWwIVkAJDU+KxyvAPLpDQB4+5+Rz7nI5Y4KOuDr83LxXZRPZpP4mGrRwxKtp7D2M4tGh2oZRXeZi++299qhg8lSu6tZ1L0Ch9lyPpMottSJHPyzwxpI69sHTYDlGWrFri/uqsOmTQC0TPPe0BT2mkzhkeQnukL1e3uHnqh2UyQZihu6m9ux/4FCZWNtqokpH5R1XukSF65OSpmBR/pI8GvvEPvKgS5PJc9kF9er3BM28QYL6FN8xpf2O7MI26PuAOaqnDbeDfMiQbvs4IAbwFQeET3PtGrsmnjsgzLhR9AhiALVSj2eRYoesRJJ1ZTQfUCy7bWxKYWk30HNRvlL77dO07AEvkwSSctIqulu9gl4Ed4pkqSl+uH89+8zjX1uX9awYlbFxoouO17iuyXEAi22Drc4ADSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB4484.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66946007)(76116006)(8936002)(6506007)(66446008)(6512007)(64756008)(66556008)(91956017)(83380400001)(2616005)(186003)(8676002)(4326008)(38070700005)(33656002)(5660300002)(66476007)(38100700002)(122000001)(36756003)(508600001)(6916009)(2906002)(71200400001)(54906003)(316002)(6486002)(131093003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3R0UkxSRlpMYWhYMmJKdzRSRUNLT3VUeFNyV09iYVRzVFg4NHlRaUZ2dDhx?=
 =?utf-8?B?WnBUWTRZaDNxTmVibXJsdHljRGt5ZGI4QWlMWmR6a2NNUWY2ZGpYOWRJS0Vx?=
 =?utf-8?B?TXdQT1QvejBnVDZFN2M0TmlLaExwQ0lkdCtuWmhxNEhuWHdkUlRlaDN2Q0Yw?=
 =?utf-8?B?MDlIVmhBUWJQT2ozSjN1QXRKbGJYV2lYQXBpUTd4cGQwQWNBdXAyWDV5VEUz?=
 =?utf-8?B?Vk9EZXJ0YVN4cE55NjZsV1lGUko5anRTYytBNzByU2J4RktlZDg1Sk9xenFl?=
 =?utf-8?B?aVUyT25Pb1JyQ0c3a3pLWTE3RkxKcFR5RncrRFdLZ29hMFd1c3A2K1hlMzBX?=
 =?utf-8?B?b3dBV0E2dXpzd0tTQ2NYQ0dLbmlGNm90cVBVa0NiUXZaNy81WlMxbEU5ZU1M?=
 =?utf-8?B?RUo0YTNXWE14L05ZeGY1TDM2c1d5Nys1Wmx0d0ZoUWFQVkFlTUVZeWloUDhE?=
 =?utf-8?B?Zy9qMDhJbUhxS2QzMnhTQU1LZ1cvemZEVWJoKy9RNlNkdmdkbmZWZXBoWWNs?=
 =?utf-8?B?MzhXNW9sRnVFcjV0OXoyRWlXZTdPajlTNENlVmFOL2hVVkczNkhGNDNXTEtn?=
 =?utf-8?B?WHozMm5FMnIxb1hTQVRFclJzNXNNTzBsNlN6Z0k4RXE4SFErbHp1R05NOW1B?=
 =?utf-8?B?b0E2VVdEWUR3SC9PdnBETVpNZUFEbmE4bzFxSDJZTDlkWm9aSHBQMWwyQlp2?=
 =?utf-8?B?Tm96S1dwdy9FZHNkTk5NOFJQc0JacExUVnhuTytnVkIwN0NwTDN0aGtEQkZS?=
 =?utf-8?B?WDZZTGNhNEh1SzBTTXo5WXo0Y2lsOTE4TW4wK0lPRU9qTzM1VWZ4WHpNcEk1?=
 =?utf-8?B?QzJwRlQ5VHNlZTQ5ZHNsWFdhSHBLU3hTcno2ckprK1E3K1dBbmVIWmhHbWpO?=
 =?utf-8?B?UEp0UDlJWlpLaFQ2bzVUcWVyNDREU3hzQmZrdThHcW1BRGlJMkFIQTVjVnhk?=
 =?utf-8?B?bFpadm1ZODRkYTJBZm9MYVZpb0hhOGhjaWZBd1JwajdBdWhRTnE3VUVCU1JF?=
 =?utf-8?B?OWlrK2lrQ05ka1g4a3pLdERYTDhxb2dnNWdxMXg4QXNuT0d2R3BVTnFYK3ZK?=
 =?utf-8?B?VHJaVmladkJDZDAyekpKTGpRRTl0QWVtZHR3UEJHK20wOHJXSzBBZEJQZlg5?=
 =?utf-8?B?QXplck9zL3lQVlBnOVM1dDBmL0hkRkZKUDN5TnJZcHZ1YUo2Vkh4YkZ6Y2Ri?=
 =?utf-8?B?THFxcm9wSmMyQ09YZnNrSnM3OG9Oc1F5cXNZVUR1dDk1Z1VCcllNZkV5WVpO?=
 =?utf-8?B?SjJpS2UySEdUcjFCZ2xpajNLZVU2SHBOV3B3YUJ3UGtDU0FDRWcvQVU2QVVL?=
 =?utf-8?B?T1IvU1NqQ000aSs1YXpkNVRCTTRGdXdmQ21TRUg5bEhteUtqN1A3M0hUb1Rj?=
 =?utf-8?B?MFRRTWFnTnphMW01a3BEendNL1gwOGk2RlR1cnlzY2gxNVRVTmJRY0Z2eFJp?=
 =?utf-8?B?TXZMUU93a1RLOW5tUjhjL2NmeUp4dFU3WE8zQ09OSGMrUXNSd2JUejE5UEdj?=
 =?utf-8?B?V3VZWDIyRWZXc2pNSkhHK0l2Z0dtRGZIclc4VE9melI2Z0dsRlFiK0RBQm1j?=
 =?utf-8?B?V0E2bnJNNEZTMHBzM0ZDUk1SMFFuemR6QnRwbXhCYWlmODRKdkZia2pmeGNw?=
 =?utf-8?B?RFN6U0VXSWlSWW1UUThnZFIwU3dzcHZwTlVaMUFwYlJVNnlZZlE2MFFBU1Q4?=
 =?utf-8?B?ODlydnZVYnV6TEZTK3NiR0xwVFpDMm9nTld2UytrUkhjQ0xnSERaSzdJSHd2?=
 =?utf-8?B?THBpQnpER1JuWml3bG9vQXdXbDZROWxMd1RianhBYkVudnJBb3RDVkpxYkUz?=
 =?utf-8?Q?z+KiWWGim2iVWxwNxgcwTPdr7hmhHzo5Ayrls=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <846B5857FD15FB40B8D9341901158187@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB4484.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c84e02b-b2cf-45fc-f4ad-08d98446fd76
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 19:17:48.2951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxwk01RJBw0LvlezuHKgAiipT037tbSvvpGdd2qPcMDt1OG5poUR+P85jR5bGMEu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3870
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: Ne_la5L_FFAfWU_ivpbm7U9Z29S6mGWN
X-Proofpoint-ORIG-GUID: Ne_la5L_FFAfWU_ivpbm7U9Z29S6mGWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_06,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300118
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=9907f52c21=jtanen@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

UGV0ZXIsDQoNClRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlLiBJJ3ZlIGluZm9ybWFsbHkg
c29jaWFsaXplZCB0aGUgaXNzdWUgYW5kIHdpbGwgdXBkYXRlIHRoaXMgdGhyZWFkIHdoZW4gSSBn
ZXQgbW9yZSBpbmZvcm1hdGlvbi4NCg0KVGhhdCBhc2lkZSwgSSdkIGZpbmQgdXNpbmcgQ0xPQ0tf
TU9OT1RPTklDX1JBVyB2YWx1YWJsZSBpZiwgZS5nLiwgSSB3YW50ZWQgdGVzdCBhbiBOVFAgZGFl
bW9uIGluc2lkZSBvZiBhIGd1ZXN0IGFuZCBkaWRuJ3Qgd2FudCB0aGUgaG9zdCBwcm92aWRpbmcg
YW4gYWxyZWFkeS1hZGp1c3RlZCB0aW1lYmFzZS4gV291bGQgdGhlIGJlaGF2aW9yIGZyb20gbXkg
cGF0Y2ggYmUgbW9yZSBhcHByb3ByaWF0ZSBhcyBhIGNvbW1hbmQtbGluZSBvcHRpb24/DQoNCnYv
cg0KSm9lDQoNCu+7v09uIDkvMzAvMjEsIDEyOjExIFBNLCAiUGV0ZXIgTWF5ZGVsbCIgPHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBUaHUsIDMwIFNlcHQgMjAyMSBh
dCAxNzowNCwgSm9lIFRhbmVuIDxqdGFuZW5AZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBD
TE9DS19NT05PVE9OSUNfUkFXIHByb3ZpZGVzIGFuIHVuYWRqdXN0ZWQgc3lzdGVtIGNsb2NrIG9u
IHNvbWUgcGxhdGZvcm1zLA0KICAgID4gd2hpY2ggaXMgY2xvc2VyIGluIHNwaXJpdCB0byBwcm92
aWRpbmcgYSBndWVzdCB3aXRoIGEgcmF3IGhhcmR3YXJlIGNsb2NrIHRoYW4NCiAgICA+IENMT0NL
X01PTk9UT05JQy4NCiAgICA+DQogICAgPiBVc2luZyBDTE9DS19NT05PVE9OSUNfUkFXIGFsc28g
d29ya3MgYXJvdW5kIGEgY3VycmVudCBpc3N1ZSBpbiBPU1ggd2hlcmUNCiAgICA+IENMT0NLX01P
Tk9UT05JQyBoYXMgYmVlbiBvYnNlcnZlZCB0byBnbyBiYWNrd2FyZHMuDQogICAgPg0KICAgID4g
U2luY2UgQ0xPQ0tfTU9OT1RPTklDX1JBVyBtaWdodCBub3QgYmUgYXZhaWxhYmxlIG9uIGFsbCBw
bGF0Zm9ybXMsIHJldmVydCB0bw0KICAgID4gdXNpbmcgQ0xPQ0tfTU9OT1RPTklDIGlmIGl0IGlz
IG5vdCBwcmVzZW50Lg0KICAgID4NCiAgICA+IFNpZ25lZC1vZmYtYnk6IEpvZSBUYW5lbiA8anRh
bmVuQGZiLmNvbT4NCg0KICAgIEknbSBub3Qgc3VyZSB3ZSB3YW50IHRvIGNoYW5nZSBiZWhhdmlv
dXIgZXZlcnl3aGVyZSB0byB3b3JrDQogICAgYXJvdW5kIGFuIE9TWCBidWcsIHRob3VnaC4uLg0K
DQogICAgSGFzIHRoaXMgYnVnIGJlZW4gcmVwb3J0ZWQgdG8gQXBwbGUgPyBJcyB0aGVyZSBzb21l
IGtpbmQgb2YgYnVnDQogICAgcmVwb3J0IElEIG9yIFVSTCB3ZSBjYW4gcXVvdGUgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlID8NCg0KICAgIC0tIFBNTQ0KDQo=

