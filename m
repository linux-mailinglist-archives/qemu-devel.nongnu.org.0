Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F77309082
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:17:49 +0100 (CET)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5d1Q-00037z-8y
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l5czj-0002dQ-Fp
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:16:04 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:1323)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l5czf-00009D-0A
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611962158; x=1643498158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c6/Y6wynmdKbJqg416NSkSvhnKeV7rV1sQ/8+8Yvi0U=;
 b=vCsyj4xkukMB91Z/jDMS30qM0PPlgAkdFpbwV8NGhWfcRLi29JU7E43u
 HccLdh41WYOAE26lKq4edLTz+mDd0VlajMpdduPmN10wCAoJI7u9RXD4a
 6eY1MHFnpE5fdO+vPJrb6CpcGGAcWhHQ/Ckj7CxJvQlUZ1bywuXegKcVk E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Jan 2021 15:15:51 -0800
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Jan 2021 15:15:50 -0800
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 15:15:50 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 29 Jan 2021 15:15:50 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5701.namprd02.prod.outlook.com (2603:10b6:a03:97::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 23:15:48 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 23:15:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: RE: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
Thread-Topic: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
Thread-Index: AQHW7tyA+U6HHthK+EKmM2bq3g+Mxaoz8UUAgABE/UCABFgpgIAGp7xQ
Date: Fri, 29 Jan 2021 23:15:48 +0000
Message-ID: <BYAPR02MB4886F04D58FB80D87179FC71DEB99@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-13-git-send-email-tsimpson@quicinc.com>
 <11960eff-406b-158c-7fae-61b2e0550268@amsat.org>
 <BYAPR02MB48867F2DC90D2A81897C387FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
 <55f89e45-c479-e02b-27c6-f2e6a7fb85ed@amsat.org>
In-Reply-To: <55f89e45-c479-e02b-27c6-f2e6a7fb85ed@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cb33b81-32cb-4593-3836-08d8c4abd075
x-ms-traffictypediagnostic: BYAPR02MB5701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5701DAE526D1E8332278179EDEB99@BYAPR02MB5701.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9NW34RKYJNWwYpOe/d5/GY3o/vpzWtzO0DAJQ5jroe17WF8jsV08jkj/h/EUbwmfOAGMi1R3CCtp1U04XzcRirJf3dRnRb25+80ADvuKmnMJDdY+rgVyZUBt7kC5BL2doEcPkaJwYXZ/Foh9Zbjnqj4XzxwHl1we5AbvMO7Ro5m8LDiTBrmZs9Uf0HW4yB3uQHYuLJBWHmuKGTVWwe0uFL17cuq/WH+JDNPMo4tdqWSDNkBgZ9CWIJcWvApwycghp/EbPEjgkf16yL9jyfAkrpZLYQonEeeuuGXr4Ju0fp/XGsxiQFd4Cf2dyCjQJPnp+toSM3vYkLoSqSxJdYmWMi0SmGsAuLsXq0g52jr9WABkVYGcCxvZEEzQSwSwAF2s8vlII3TC/BATgTD93O/m8ezpHq1q1mvgo73FczJ1UlZdqyArFglEyKgyZPG5Zkt3siBmZEsLptPRqDNxv9fGzDgRiblRdRHjYBRpjp67eVocMGuTdvMEKqSsqn+3+YFe7Jdttcd6J7+cZzqP0DMH9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(316002)(110136005)(5660300002)(8936002)(55016002)(83380400001)(66556008)(86362001)(9686003)(52536014)(33656002)(64756008)(107886003)(71200400001)(66476007)(4326008)(54906003)(8676002)(76116006)(66946007)(66446008)(7696005)(186003)(2906002)(6506007)(53546011)(26005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N1RHajdQVllMOVFpTllPRXV1Ukp0TWROSXVLR0JvY2JjZytWVG5XWUlJZnVi?=
 =?utf-8?B?b2FpT2NvSFNOWlhYcm9WTkZaTDNCOTZlQXhqcDZFVnFBQStBa2w2SkdKYmZI?=
 =?utf-8?B?d0ZkLzQwQjRCWG5LL09vNHFYbHBoYUhUT01tV2l0cXl5TlByNjF2Ukp2ZHcr?=
 =?utf-8?B?ZDZleHBZbkJnKys1c3ZUSkZVWFpIVDNVNktmYnBwRDJIcSs0Y1NYTWdtbXpQ?=
 =?utf-8?B?bjRkZko4UVE2c0xhTU4vOERacHFKa1IxUjU2MjhOWWpaRktzRDlKbEltT3g1?=
 =?utf-8?B?MlZNQlZqSXUxNEI2YzQyaFFhZUhrTkFHL2tPT29rNWRyYUE1cVY3TjBPYWkw?=
 =?utf-8?B?NzNSNnlZWXZxREhsMW1wM1ZwV2JodXdRWlZwOW1GN2MvOUJlUlRBWjVYV1Mz?=
 =?utf-8?B?SFBJckVvc2FoaUJqQldVKzFkNzJUbFZhQXVMZkVRcy9CZEduQXBVd2FWNzJB?=
 =?utf-8?B?OGFtdjVwZkx5aGdUUkJEeTd3WFdmd1l0WmFyS3JnVk1xMTJRbU1RTkFnYnVy?=
 =?utf-8?B?cG5ROGFTZWY4MFcya3lScTd0NTV4VHhlK29PYU5zUDRMNTA1L0krbzhpQXlT?=
 =?utf-8?B?MlJ3ZUxvYnV4TjBJQjBRQnFxTmJmQVRtMERUKzdDTFZRSU0yYThlc1k5OWlF?=
 =?utf-8?B?U1MwZ3E5cUcwaU15dEFSc1BreEpSclN5SG5xblA1SlpuN1hYaVdMTENiK3B1?=
 =?utf-8?B?dXNGSlBpUmczd3NPVnJ3QjFYSlBtV2VhQktENlVUdG96SnNCYlVHZGRTVTYz?=
 =?utf-8?B?di9aNHJsMkVDV3A1c29FM2VYRTJtT3Q1TVlOQkhSVHBZRVQvTEIrZzNJR2Rs?=
 =?utf-8?B?RE5ZeHlQdy80cFVLUnpUR3A4eThZK0pVeEg0NVVPdTFjWXE0VmZyb3U2bDZp?=
 =?utf-8?B?MUtYYkdBa0xQYVc0S3V0NU4xYS92WnVKcTE4aEM0K1c3WWQxMkt2UWE1eW1N?=
 =?utf-8?B?N1JYekFzSk5BYTFkZU1ZNm83MzJCZFljYTdXYVdnOUQ3YjYwNCt6aVNoTnFQ?=
 =?utf-8?B?bHRhODNNd2NmclB2cG96cWZNcWFZMmVNNXhzTEpzQkt3U3JocnVVbUJ0ODhZ?=
 =?utf-8?B?eGJwSkZ2VmNSTStkZ1d4dkZ6TnhZa3ErY3JtQjdob2dnQjFnTGNOQUx6OU1X?=
 =?utf-8?B?ei84dEQxSnc5SGdmTURlcXRkemZwbFhBcHJoZXI0VXpETzFsQ3k1T29UUDVP?=
 =?utf-8?B?MkJjRzBPNTBkcWlRNXJGZXNvcnB1TFlsRnlrK2VNTUtjNm1qUUtIK3dOS2pa?=
 =?utf-8?B?NU1Ub0duMnB5bTJxTlo2WVljQjczOVlxbkpSc3oxQ2J6aFhkVlVMS3RaYnZD?=
 =?utf-8?B?aGM3TThkVGpQZXZSU0lGdktIRFdLZTdaN2NUVnlGT3V0Q3cwM1pWUWRFNDFV?=
 =?utf-8?B?emswOXd5cU95a2tsZjF0N1ROa1dTcVBSVUFMU0p4Ykw0YjVsdlZLN0cvMU1k?=
 =?utf-8?Q?cd8Bj+Km?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeJHsQpJRP9Uoq++wYqBwBhKvWVtc233AHjw6VJMibcOZp/rKbci1U99v7rcmME/FdhhLmKeilQIziuDslcH4ENHU6x8u0tjttAknr4fKoHPw+bM+uJiH9IYp+baQapp3mQH6deMntp9yHpmThH67zoUwc44YWql1d9zYF2iHU5M153lkh/lmfPgGjdkZvVFAiw8zwacojUtSZqZfCV460PENscj8w1TBM2qKQ600bE1YPM7bTI+SSik22WdbMlm8jtY0gLQmJfDW/xAAhdMSbS90qKDSeusfZZYFmDUGRcvl2kLUwqlzE+RDMxZvqwxyNCtdqcPkCsCMLjHjLmI7Q==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHp+A8Sk0p3Va2QB+QeZHTqXqrWUh7BKZ4JEw9qva2s=;
 b=G4jb36842ggpAc2AtK5yghB1E3eAV1cBpUUCT4uy9wAbBj5d2yrJQBjBoL0qD48uSSll0Iy+dxYcCYxAU6iCTvZ1ORpzpRUWEtJJ2yjZXXjKs7NOhYkmBuRCL4zjkBCYhdZNbsE266tqORK10C7wNhtlsJwFB//ePqFu4Gc93ESAg0wfR8/QCbIeuGrjNNNbT3VoT2sCWcRk2JZoKDG+AKV3U9V56zCLMgQbHnIQXh6UD6W0C8su7rv0KmMRghkRirusXi2XT2v5quw9pN3CuArbrKCBdF+iHA7fmQ4byWIaa8YZEdtgmFouxQt7PbgUuX7nuqtPohpA1/Li2nuxpA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHp+A8Sk0p3Va2QB+QeZHTqXqrWUh7BKZ4JEw9qva2s=;
 b=ieofFWors8Swy3VQWiMFTs8QXlzJcAPbLgcqI5e1OdD+4/Kjvb0WzYwknM0I9qOezJiKgohJ9VH5Rwbj7HIXui1NyAKRt6RgqImBZq0e9Dnh2PM8pqrUp38bmIPxQv837ZJQXOTaOU4Zn1O95Qo5fFR2qKa79uE0ECynFJ7gu/A=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 5cb33b81-32cb-4593-3836-08d8c4abd075
x-ms-exchange-crosstenant-originalarrivaltime: 29 Jan 2021 23:15:48.7590 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: ERFsdwUhj/YuAWx/Ql8meFMFbrxd5PF7X2ve3jL/rHFQ1Lg63g06Z/fRxvYS9imlREq3ihccrzsYG7HxdpO1Wg==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5701
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI1LCAy
MDIxIDEwOjIxIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
OyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+DQo+IENjOiBhbGVAcmV2Lm5nOyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOyByaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnOw0KPiBsYXVyZW50QHZpdmllci5ldTsgQnJpYW4gQ2FpbiA8
YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMTIvMzVdIEhleGFn
b24gKHRhcmdldC9oZXhhZ29uKSBpbnN0cnVjdGlvbg0KPiBhdHRyaWJ1dGVzDQo+DQo+ID4+IE9u
IDEvMjAvMjEgNDoyOCBBTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4+PiAtLS0NCj4g
Pj4+ICB0YXJnZXQvaGV4YWdvbi9hdHRyaWJzLmggICAgIHwgMzAgKysrKysrKysrKysrKysNCj4g
Pj4+ICB0YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5oIHwgOTUNCj4gPj4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAyIGZpbGVzIGNoYW5nZWQs
IDEyNSBpbnNlcnRpb25zKCspDQo+ID4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhh
Z29uL2F0dHJpYnMuaA0KPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvaGV4YWdvbi9h
dHRyaWJzX2RlZi5oDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2F0
dHJpYnMuaCBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnMuaA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPj4+IGluZGV4IDAwMDAwMDAuLmU4OGU1ZWINCj4gPj4+IC0tLSAvZGV2L251bGwN
Cj4gPj4+ICsrKyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnMuaA0KPiA+Pj4gQEAgLTAsMCArMSwz
MCBAQA0KPiA+Pj4gKw0KPiA+Pj4gK2VudW0gew0KPiA+Pj4gKyNkZWZpbmUgREVGX0FUVFJJQihO
QU1FLCAuLi4pIEFfIyNOQU1FLA0KPiA+Pj4gKyNpbmNsdWRlICJhdHRyaWJzX2RlZi5oIg0KPiA+
Pg0KPiA+PiBQZXIgUUVNVSBjb252ZW50aW9ucywgdGhpcyBmaWxlIGhhcyB0byBiZSBuYW1lZCAi
YXR0cmlic19kZWYuaC5pbmMiLg0KPiA+DQo+ID4gRGlkbid0IGtub3cgdGhhdC4gIFdoaWNoIGZp
bGVzIHNob3VsZCBlbmQgaW4gLmluYz8NCj4NCj4gT2ggeW91IGFyZSByaWdodCwgaXQgaXMgbm90
IGRvY3VtZW50ZWQgaW4gQ09ESU5HX1NUWUxFLnJzdC4NCj4NCj4gWW91IGNhbiBzZWUgdGhlIHJh
dGlvbmFsZSBpbiBjb21taXRzOjEzOWMxODM3ZGI3IGFuZCAwOTc5ZWQwMTdmMDoNCj4NCj4gICBt
ZXNvbjogcmVuYW1lIGluY2x1ZGVkIEMgc291cmNlIGZpbGVzIHRvIC5jLmluYw0KPg0KPiAgIFdp
dGggTWFrZWZpbGVzIHRoYXQgaGF2ZSBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBkZXBlbmRlbmNp
ZXMsIHlvdQ0KPiAgIGdlbmVyYXRlZCBpbmNsdWRlcyBhcmUgc2V0IGFzIGRlcGVuZGVuY2llcyBv
ZiB0aGUgTWFrZWZpbGUsIHNvIHRoYXQgdGhleQ0KPiAgIGFyZSBidWlsdCBiZWZvcmUgZXZlcnl0
aGluZyBlbHNlIGFuZCB0aGV5IGFyZSBhdmFpbGFibGUgd2hlbiBmaXJzdA0KPiAgIGJ1aWxkaW5n
IHRoZSAuYyBmaWxlcy4NCj4NCj4gICBBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gdXNlIGEgZmluZS1n
cmFpbmVkIGRlcGVuZGVuY3ksIGUuZy4NCj4NCj4gICAgICAgICAgIHRhcmdldC9hcm0vdHJhbnNs
YXRlLm86IHRhcmdldC9hcm0vZGVjb2RlLW5lb24tc2hhcmVkLmluYy5jDQo+DQo+ICAgV2l0aCBN
ZXNvbiB5b3UgaGF2ZSBvbmx5IG9uZSBjaG9pY2UgYW5kIGl0IGlzIGEgdGhpcmQgb3B0aW9uLCBu
YW1lbHkNCj4gICAiYnVpbGQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgY29ycmVzcG9uZGluZyB0
YXJnZXQiOyB0aGUgd2F5IHlvdQ0KPiAgIGV4cHJlc3MgaXQgaXMgdG8gbGlzdCB0aGUgaW5jbHVk
ZXMgaW4gdGhlIHNvdXJjZXMgb2YgdGhhdCB0YXJnZXQuDQo+DQo+ICAgVGhlIHByb2JsZW0gaXMg
dGhhdCBNZXNvbiBkZWNpZGVzIGlmIHNvbWV0aGluZyBpcyBhIHNvdXJjZSB2cy4gYQ0KPiAgIGdl
bmVyYXRlZCBpbmNsdWRlIGJ5IGxvb2tpbmcgYXQgdGhlIGV4dGVuc2lvbjogJy5jJywgJy5jYycs
ICcubScsICcuQycNCj4gICBhcmUgc291cmNlcywgd2hpbGUgZXZlcnl0aGluZyBlbHNlIGlzIGNv
bnNpZGVyZWQgYW4gaW5jbHVkZS0tLWluY2x1ZGluZw0KPiAgICcuaW5jLmMnLg0KPg0KPiAgIFVz
ZSAnLmMuaW5jJyB0byBhdm9pZCB0aGlzLCBhcyBpdCBpcyBjb25zaXN0ZW50IHdpdGggb3VyIG90
aGVyIGNvbnZlbnRpb24NCj4gICBvZiB1c2luZyAnLnJzdC5pbmMnIGZvciBpbmNsdWRlZCByZVN0
cnVjdHVyZWRUZXh0IGZpbGVzLiAgVGhlIGVkaXRvcmNvbmZpZw0KPiAgIGZpbGUgaXMgYWRqdXN0
ZWQuDQoNCk9LLCBJIHVuZGVyc3RhbmQgd2h5IGl0J3MgYmV0dGVyIHRvIGhhdmUgZmlsZXMgZW5k
IC5bY2hdLmluYyB0aGFuIC5pbmMuW2NoXS4NCg0KSG93ZXZlciwgSSBuZWVkIHNvbWUgY29uZmly
bWF0aW9uIG9uIHdoaWNoIGZpbGVzIG5lZWQgLmluYyBpbnN0ZWFkIG9mIHNpbXBseSBlbmRpbmcg
aW4gLmguICBGcm9tIHdoYXQgSSBjYW4gdGVsbCB0aGVzZSBhcmUgdGhlIGd1aWRlbGluZXMNCi0g
SWYgYSBmaWxlIGlzIGludGVuZGVkIHRvIGJlIGluY2x1ZGVkIGluIHRoZSBtaWRkbGUgb2YgYW5v
dGhlciBmaWxlIChhcyBvcHBvc2VkIHRvIHRoZSB0b3ApLCBpdCBzaG91bGQgZW5kIGluIC5pbmMu
DQotIElmIGEgLmluYyBmaWxlIGlzIGludGVuZGVkIHRvIGJlIGluY2x1ZGVkIGluIGEgLmggZmls
ZSwgaXQgc2hvdWxkIGVuZCBpbiAuaC5pbmMuDQotIElmIGEgLmluYyBmaWxlIGlzIGludGVuZGVk
IHRvIGJlIGluY2x1ZGVkIGluIGEgLmMgZmlsZSwgaXQgc2hvdWxkIGVuZCBpbiAuYy5pbmMuDQot
IFRoZSBhYm92ZSBhcHBsaWVzIHRvIGJvdGggaHVtYW4td3JpdHRlbiBhbmQgZ2VuZXJhdGVkIGZp
bGVzLg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

