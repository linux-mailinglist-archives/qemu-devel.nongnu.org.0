Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B43255A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:37:32 +0100 (CET)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLVy-0005mO-Tj
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lFLU6-00055H-2p; Thu, 25 Feb 2021 13:35:34 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:11032)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lFLTx-0006rY-AX; Thu, 25 Feb 2021 13:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614278125; x=1645814125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9prErSF8sO9YyVcBaBZipGsPD8PZ6JW1Yc+yJjY50qg=;
 b=hW/Hy8KLPfIPZLGPcYR/0wa9a5REae6ZbGiGmEDFulqYX6gTL5ZO4hkJ
 DHOzlQ6sUbeK5ajAYZIafF+4HNkc1RJMZVHIjnHUI2BPyHTCNrTEC2kb1
 1geCGoh5TtzXPbziIrjnYWzoyXqN4hhbhIm3TOd+btd7JO0JJNTfg2KX+ 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Feb 2021 10:35:18 -0800
X-QCInternal: smtphost
Received: from nasanexm03d.na.qualcomm.com ([10.85.0.91])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Feb 2021 10:35:17 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 10:35:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 25 Feb 2021 10:35:17 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6755.namprd02.prod.outlook.com (2603:10b6:a03:205::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 18:35:16 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3868.031; Thu, 25 Feb 2021
 18:35:16 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/hexagon/gen_tcg_funcs: Fix a typo
Thread-Topic: [PATCH] target/hexagon/gen_tcg_funcs: Fix a typo
Thread-Index: AQHXC6IuRKivL2O1PkmH6nH9WQUd5qppMmmg
Date: Thu, 25 Feb 2021 18:35:16 +0000
Message-ID: <BYAPR02MB4886794D977C7E64EB2CAEBBDE9E9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210225181507.3624509-1-f4bug@amsat.org>
In-Reply-To: <20210225181507.3624509-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2d44bc2-ec4b-470e-0db8-08d8d9bc1893
x-ms-traffictypediagnostic: BY5PR02MB6755:
x-microsoft-antispam-prvs: <BY5PR02MB67550753370D1E96200B8C3CDE9E9@BY5PR02MB6755.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:51;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: shJG2HgAMmasdNKzEFqIlPfkVtwkfl34jxkJNPfAQ9sY9LiTCmVlG9/KeZSmnYOC5fahBPe2ifOxeagIQuYLJ9G3Aeaq8Tkerh/4Gl5VpElZ+Kqp/jTtj23vsz8JhMD84XM5bQfyubihV2/0stkxc6VYoo4p8dQXh4WlvmIIUpJL9Ut7XmEBZo5/4h9BiUatthuGh+1nr5bnf2Bb2g6Opr7i1bfGyOv3YFzhixZFJq5LVTVMJvqMFFcvJ4GCzgKKTC9HkiRReo31cdCIGp4hVR4Ujam+G8KPMD6laYFuyNeH7TlblmRuV8RgmG1Cx8TlXF45XFeiNkoJQf2Fc0ofgYX7wCa4EvrRkjWIUOUNGBNiC80NUh59XA2C5x6w0AVqY0rfMMk137RJmSHUQZjEdnfmCpa0qPRBVhCKi6wZ169tN/Yqsj3NlUzmQCjyfmUxvlpQwyumTH+7InHxY3Ud+dLaw1a2/urON3ZMbUvPa2uBuameFJQk2bZa7d0xj3/DcUzwpNGLLUuQt+AWJsr/lg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(2906002)(66946007)(6506007)(110136005)(316002)(8676002)(33656002)(55016002)(83380400001)(7696005)(76116006)(66476007)(66556008)(4326008)(5660300002)(64756008)(66446008)(53546011)(8936002)(186003)(52536014)(71200400001)(26005)(86362001)(9686003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cEhNOEVRbklkbHBXZ0pRcldSTzVlVC9rTjNvZ080V3UvRm9hcDc0VUJhOFNY?=
 =?utf-8?B?RG43QXhlUFMxNVhDSWJzVXBEbktaMHFBdWExdysrQkZKODM2cUg4dWxLZUh1?=
 =?utf-8?B?MWh6eHZPcytsUGZOMEoxb1dFdTFuTlN3Vy85eUcwZUsxUlZ2bDdGZGtpNUF3?=
 =?utf-8?B?TENQRUtSUUZJOVdONTIxZXF1bjRpWTNraGlueWs3NHl5SDl5UmhoaDJzQi9M?=
 =?utf-8?B?eHZlK0xrSWowNURpaXVlTnlnejRRM3JvNGFXNlRtTHJCdjFvNFlNWExJV0ll?=
 =?utf-8?B?OUFadGFuUzg1SGtaZ3QwRittck81UjdndlVDbVJUY1ZSOUZLTWRrK0pjdHZR?=
 =?utf-8?B?dTZLc09mVmM4UWZWdkZHNVJJL05KRVYrTXNDTGRYbzVLUnVpMVpHMFE3VFlo?=
 =?utf-8?B?ZFNGMUVqNkNzYW1wOEk1NkVwayt1NjBmcjBJS3UrNmRrQzFMMmxGY0RTcHFy?=
 =?utf-8?B?NWpVbjA3VHNQclZnejZNVllpTStjWjg1UjZNVWZOQkxLOHJTT1F0dVRzeE1m?=
 =?utf-8?B?SmV5QjdQNnhnZjJKd0hVcXE3Nm5LMmo5bHRPVnFzSGtkWCs4eGljMzJhUVAw?=
 =?utf-8?B?UVNwdU9xeEh0VGVsa1lSZzlIdUgzYVpwT2hBQ1NFbDAyZXlOQ1UzbDhIcHNO?=
 =?utf-8?B?WUJsRTNsdVlsTTdLaXo3NFcvb3FubW9adTM0RkZBeWlSV0VGczY0WTJSeXhK?=
 =?utf-8?B?a1FiMklYR29GbWRidkRCeXRDS1lhRGtCZFJmeVhlZTQ2YmQ0OGxoTjZXeVZ3?=
 =?utf-8?B?cDdKOGoweWQvTTZZS1IxVGNyQTVPdWhmVEVlMC9Ham12M3ltVnVOSiticnNT?=
 =?utf-8?B?bDNhR3VVNSs2TGNTVUlUOTBRRWUrVlEzZm00OUQ4a1Mveks1SUJFMmlwWHpV?=
 =?utf-8?B?aXBpeUZPaHNFRVQ0MW9jSjFuL0FldlJhVnNOcElnZU9uVm9DcTJTL1RrQTVV?=
 =?utf-8?B?akJucHBtcnU1QnFmbDN5amNLcTV2NmJEN0R5TkxsYitCdXE0UFFNaTlYNWd1?=
 =?utf-8?B?Ryt5MHRHZW9JM3dTVnhqQ2RxZDcxV0wxdWFFZE5vZU14NFRmVGEwZCs5MktM?=
 =?utf-8?B?TEltVHlJMU1SaHEwTm1ZR1BldnNXMXJuVzRIbVRNWWVvSjFEL2wxU0dFUUZy?=
 =?utf-8?B?clpJcy8xSzJvUXZXcEdGMmdHNk52MFl6a284YUp4bHE5bVpsQUV1SllwQ21S?=
 =?utf-8?B?UDczZytaSjZESlZlQjdiR0JFdkt4RkphZDlCM2pPUGh2a1Q3TW9VYThXbGgr?=
 =?utf-8?B?V2pLczl3RzJHWHMxVkVYV3RPSWV2WlpndGp4TVVqQ3Q4REZKNHprOSsyZlc0?=
 =?utf-8?B?c2NlZHVOci9GSE8zMXNxcFZXVlBRbG9xSWRBamNVcUNRWUtna2NCNHE5RnZj?=
 =?utf-8?B?Y09JK0VVTUVuSjFMK2tXMUFLVnRJNks3NmtWeHgvYXA1TEJVMzF2TVNhL3A3?=
 =?utf-8?B?cEg4Zm1FOXVqcEVkZmhkaW1JWHZWWG05UC8rWGdxSnRYZXpYOElLTU04STlX?=
 =?utf-8?B?Rlg4Nk9KUXRvVHdGcnV1SUhBZVJXSHB6emt4RHRsVTYzR05rZnMxamZWZlJL?=
 =?utf-8?B?eWtNeDdQVXJ1eFc3N0g3OHlOdXhGTHY0dk9vbHBkZGJPQVRYeGZmeEZWT2l4?=
 =?utf-8?B?U25xa3MwRC9FbFJ6S3BhcGsxM2tpcy9nSmdzb3BmZUYzbEhMZFF0dDNyZU9O?=
 =?utf-8?B?L1NNMFZWa1hFaS9Ya3FOMk9XWGtweWlNdUF2bVo1cy90c0J2OHdWQmRzclo2?=
 =?utf-8?Q?OjioilYRm6jvWNoqvj+eGni4lrQrQ4wj8f67Ztv?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H89t5wvW76bvRZaeLzvjjsMvMtyXzEtVaJ7iCNsP2Ek6su3Brmu++Q/FHBrcsMVOub7VxLEHKqCT7U47C7Oq6rHPTjgzj+dl43KZ62BWpuVvssbbZr8or9p4DHGqDY4myv0iLHzp1y30kY/XzN1p5SeLIY3ZMIq3I7sG/c/Xzre3J892AHV/jVlFXchmHPotRnGkME71ihBtMs033+DXxXSgF3/PtmzD/bhBSLod29ey8xXc17T5F6BJdhFmIHL7JuLxZXMTFep/TT9qhBtoGo2EV87WX70nM0tXDxEuTDcloLOB4P4/EKcot4Mcpc/vVL05Dz0FGjKhmrm0gazE8g==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQp5r2hLKg+pJfm0iPGw4m1rQ6Xz8Iz0/cy1nN0i3E=;
 b=l02kHmc4Q9QR6h6ZVxvejAlqXeQyo27D9+zy7A3crBGwsqVXBi3BYf6KXy5YjNuRGLEIEJOMxSai7/2aRhIT3XKAK8+rN8VIzvt/YR4roeXKp6NpsOrfiHVBTn58x6HEpKXerQkUl34KHaEeLRZ9/J2VjkVAKE5jlKj7PIIcRVr0DEHnXTcDa/zedTX3Wr0bdknmDgmaStxYf3GU7RH/6xUDLOJy6wrlTyjPLV7qZ/DXbqVC5N05RT/G8pdlVMN4tfOBMnKKVELN8ALslUHpUlr0xI3aePxubfX8v9iKcoPZtROvOnML161XJdL/7AnXcUP/igF59LNqbQC2Hdprzg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: a2d44bc2-ec4b-470e-0db8-08d8d9bc1893
x-ms-exchange-crosstenant-originalarrivaltime: 25 Feb 2021 18:35:16.0865 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: k7adVK4v79aMV+FDnKTpD7eNWpyP37GmSjWcYMYv4udmdXYshSM7zVzCVQc9DqZ2TVGTsuQ9ScdObs3pbpaBYw==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6755
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDI1
LCAyMDIxIDEyOjE1IFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHFlbXUt
dHJpdmlhbEBub25nbnUub3JnOyBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ow0KPiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTdWJqZWN0
OiBbUEFUQ0hdIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3M6IEZpeCBhIHR5cG8NCj4NCj4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4N
Cj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5IHwgMTQgKysrKysrKy0t
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5DQo+IGIv
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQ0KPiBpbmRleCBmZTRkOGU1NzMwMy4uZGI5
ZjY2M2E3NzggMTAwNzU1DQo+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkN
Cj4gKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQ0KPiBAQCAtMzUsNyArMzUs
NyBAQCBkZWYgZ2VuX2RlY2xfZWFfdGNnKGYsIHRhZyk6DQo+ICBkZWYgZ2VuX2ZyZWVfZWFfdGNn
KGYpOg0KPiAgICAgIGYud3JpdGUoIiAgICB0Y2dfdGVtcF9mcmVlKEVBKTtcbiIpDQo+DQo+IC1k
ZWYgZ2VucHRyX2RlY2xfcGFpcl93cml0ZWJsZShmLCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCByZWdu
byk6DQo+ICtkZWYgZ2VucHRyX2RlY2xfcGFpcl93cml0YWJsZShmLCB0YWcsIHJlZ3R5cGUsIHJl
Z2lkLCByZWdubyk6DQo+ICAgICAgcmVnTj0iJXMlc04iICUgKHJlZ3R5cGUscmVnaWQpDQo+ICAg
ICAgZi53cml0ZSgiICAgIFRDR3ZfaTY0ICVzJXNWID0gdGNnX3RlbXBfbG9jYWxfbmV3X2k2NCgp
O1xuIiAlIFwNCj4gICAgICAgICAgKHJlZ3R5cGUsIHJlZ2lkKSkNCj4gQEAgLTU0LDcgKzU0LDcg
QEAgZGVmIGdlbnB0cl9kZWNsX3BhaXJfd3JpdGVibGUoZiwgdGFnLCByZWd0eXBlLCByZWdpZCwN
Cj4gcmVnbm8pOg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocmVnTiwgcmVnTikp
DQo+ICAgICAgICAgIGYud3JpdGUoIiAgICB9XG4iKQ0KPg0KPiAtZGVmIGdlbnB0cl9kZWNsX3dy
aXRlYmxlKGYsIHRhZywgcmVndHlwZSwgcmVnaWQsIHJlZ25vKToNCj4gK2RlZiBnZW5wdHJfZGVj
bF93cml0YWJsZShmLCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCByZWdubyk6DQo+ICAgICAgcmVnTj0i
JXMlc04iICUgKHJlZ3R5cGUscmVnaWQpDQo+ICAgICAgZi53cml0ZSgiICAgIFRDR3YgJXMlc1Yg
PSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTtcbiIgJSBcDQo+ICAgICAgICAgIChyZWd0eXBlLCByZWdp
ZCkpDQo+IEBAIC03OCwxMiArNzgsMTIgQEAgZGVmIGdlbnB0cl9kZWNsKGYsIHRhZywgcmVndHlw
ZSwgcmVnaWQsIHJlZ25vKToNCj4gICAgICAgICAgICAgIGYud3JpdGUoIiAgICBjb25zdCBpbnQg
JXMgPSBpbnNuLT5yZWdub1slZF07XG4iICUgXA0KPiAgICAgICAgICAgICAgICAgIChyZWdOLCBy
ZWdubykpDQo+ICAgICAgICAgIGVsaWYgKHJlZ2lkIGluIHsiZGQiLCAiZWUiLCAieHgiLCAieXki
fSk6DQo+IC0gICAgICAgICAgICBnZW5wdHJfZGVjbF9wYWlyX3dyaXRlYmxlKGYsIHRhZywgcmVn
dHlwZSwgcmVnaWQsIHJlZ25vKQ0KPiArICAgICAgICAgICAgZ2VucHRyX2RlY2xfcGFpcl93cml0
YWJsZShmLCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCByZWdubykNCj4gICAgICAgICAgZWxpZiAocmVn
aWQgaW4geyJzIiwgInQiLCAidSIsICJ2In0pOg0KPiAgICAgICAgICAgICAgZi53cml0ZSgiICAg
IFRDR3YgJXMlc1YgPSBoZXhfZ3ByW2luc24tPnJlZ25vWyVkXV07XG4iICUgXA0KPiAgICAgICAg
ICAgICAgICAgIChyZWd0eXBlLCByZWdpZCwgcmVnbm8pKQ0KPiAgICAgICAgICBlbGlmIChyZWdp
ZCBpbiB7ImQiLCAiZSIsICJ4IiwgInkifSk6DQo+IC0gICAgICAgICAgICBnZW5wdHJfZGVjbF93
cml0ZWJsZShmLCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCByZWdubykNCj4gKyAgICAgICAgICAgIGdl
bnB0cl9kZWNsX3dyaXRhYmxlKGYsIHRhZywgcmVndHlwZSwgcmVnaWQsIHJlZ25vKQ0KPiAgICAg
ICAgICBlbHNlOg0KPiAgICAgICAgICAgICAgcHJpbnQoIkJhZCByZWdpc3RlciBwYXJzZTogIiwg
cmVndHlwZSwgcmVnaWQpDQo+ICAgICAgZWxpZiAocmVndHlwZSA9PSAiUCIpOg0KPiBAQCAtOTEs
NyArOTEsNyBAQCBkZWYgZ2VucHRyX2RlY2woZiwgdGFnLCByZWd0eXBlLCByZWdpZCwgcmVnbm8p
Og0KPiAgICAgICAgICAgICAgZi53cml0ZSgiICAgIFRDR3YgJXMlc1YgPSBoZXhfcHJlZFtpbnNu
LT5yZWdub1slZF1dO1xuIiAlIFwNCj4gICAgICAgICAgICAgICAgICAocmVndHlwZSwgcmVnaWQs
IHJlZ25vKSkNCj4gICAgICAgICAgZWxpZiAocmVnaWQgaW4geyJkIiwgImUiLCAieCJ9KToNCj4g
LSAgICAgICAgICAgIGdlbnB0cl9kZWNsX3dyaXRlYmxlKGYsIHRhZywgcmVndHlwZSwgcmVnaWQs
IHJlZ25vKQ0KPiArICAgICAgICAgICAgZ2VucHRyX2RlY2xfd3JpdGFibGUoZiwgdGFnLCByZWd0
eXBlLCByZWdpZCwgcmVnbm8pDQo+ICAgICAgICAgIGVsc2U6DQo+ICAgICAgICAgICAgICBwcmlu
dCgiQmFkIHJlZ2lzdGVyIHBhcnNlOiAiLCByZWd0eXBlLCByZWdpZCkNCj4gICAgICBlbGlmIChy
ZWd0eXBlID09ICJDIik6DQo+IEBAIC0xMDEsMTQgKzEwMSwxNCBAQCBkZWYgZ2VucHRyX2RlY2wo
ZiwgdGFnLCByZWd0eXBlLCByZWdpZCwgcmVnbm8pOg0KPiAgICAgICAgICAgICAgZi53cml0ZSgi
ICAgIGNvbnN0IGludCAlcyA9IGluc24tPnJlZ25vWyVkXSArIEhFWF9SRUdfU0EwO1xuIiAlIFwN
Cj4gICAgICAgICAgICAgICAgICAocmVnTiwgcmVnbm8pKQ0KPiAgICAgICAgICBlbGlmIChyZWdp
ZCA9PSAiZGQiKToNCj4gLSAgICAgICAgICAgIGdlbnB0cl9kZWNsX3BhaXJfd3JpdGVibGUoZiwg
dGFnLCByZWd0eXBlLCByZWdpZCwgcmVnbm8pDQo+ICsgICAgICAgICAgICBnZW5wdHJfZGVjbF9w
YWlyX3dyaXRhYmxlKGYsIHRhZywgcmVndHlwZSwgcmVnaWQsIHJlZ25vKQ0KPiAgICAgICAgICBl
bGlmIChyZWdpZCA9PSAicyIpOg0KPiAgICAgICAgICAgICAgZi53cml0ZSgiICAgIFRDR3YgJXMl
c1YgPSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTtcbiIgJSBcDQo+ICAgICAgICAgICAgICAgICAgKHJl
Z3R5cGUsIHJlZ2lkKSkNCj4gICAgICAgICAgICAgIGYud3JpdGUoIiAgICBjb25zdCBpbnQgJXMl
c04gPSBpbnNuLT5yZWdub1slZF0gKyBIRVhfUkVHX1NBMDtcbiIgJSBcDQo+ICAgICAgICAgICAg
ICAgICAgKHJlZ3R5cGUsIHJlZ2lkLCByZWdubykpDQo+ICAgICAgICAgIGVsaWYgKHJlZ2lkID09
ICJkIik6DQo+IC0gICAgICAgICAgICBnZW5wdHJfZGVjbF93cml0ZWJsZShmLCB0YWcsIHJlZ3R5
cGUsIHJlZ2lkLCByZWdubykNCj4gKyAgICAgICAgICAgIGdlbnB0cl9kZWNsX3dyaXRhYmxlKGYs
IHRhZywgcmVndHlwZSwgcmVnaWQsIHJlZ25vKQ0KPiAgICAgICAgICBlbHNlOg0KPiAgICAgICAg
ICAgICAgcHJpbnQoIkJhZCByZWdpc3RlciBwYXJzZTogIiwgcmVndHlwZSwgcmVnaWQpDQo+ICAg
ICAgZWxpZiAocmVndHlwZSA9PSAiTSIpOg0KPiAtLQ0KPiAyLjI2LjINCg0KUmV2aWV3ZWQtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCg0K

