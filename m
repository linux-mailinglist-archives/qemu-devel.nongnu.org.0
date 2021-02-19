Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C331FDA3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:13:07 +0100 (CET)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9L0-0007l4-00
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lD98J-00065p-Sa
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:59:59 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:13780)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lD98G-0001om-GM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1613753996; x=1645289996;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ylpKn0wzknyN2AX/0utvsPmBHbpl3LVmzgkVRL3PHMQ=;
 b=WeP68i03z+0pH9fnR3VpjOWfJ81ggnd8DxiiiWrki99SAVw5KBrUHC4g
 L5XvkYYzXn68vQK8ow3D+L7FqAeHczIkT9L8YN9hyOikQ/j8RoHR+zBkL
 EFRADQPR7bkVmMJv/X5AHCPKoQfD7qyvw8Sxnnh8bS0WDyyGvaqGDceu8 Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Feb 2021 08:59:54 -0800
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 19 Feb 2021 08:59:54 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 08:59:54 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 19 Feb 2021 08:59:54 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4454.namprd02.prod.outlook.com (2603:10b6:a03:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 16:59:52 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 16:59:52 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: RE: [PATCH] exec: Poison Hexagon target-specific definitions
Thread-Topic: [PATCH] exec: Poison Hexagon target-specific definitions
Thread-Index: AQHXBsdHr7ApD4dtFECPD6c7n6oVDapfsj+A
Date: Fri, 19 Feb 2021 16:59:52 +0000
Message-ID: <BYAPR02MB48868E97F2CE38801D3D618CDE849@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210219135754.1968100-1-f4bug@amsat.org>
In-Reply-To: <20210219135754.1968100-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 775f4531-dad6-4337-f693-08d8d4f7c6b2
x-ms-traffictypediagnostic: BYAPR02MB4454:
x-microsoft-antispam-prvs: <BYAPR02MB4454D63D0B144AE0FC341A84DE849@BYAPR02MB4454.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g+KWy9nsgCh/FWcuSGLU1sLYgzmqVqh3YI77V20EGwhuDswdiZA3xWLsV9byTeksnd2VcLsMvJ2WWdfpOgk4gEifgPVzBwpxHTGXmGSojwZ/KqgZ/6p5HGMgxqwwhFpquOtD6/jf739TlypMcae4TVyHUobeNJeFziqtjcjga7Q9t3Otghm3qnJHlpcO3PQKctzbJ20DL4Vn/iHC4Mq4I/jA8KZvHtftqCAiefrOt85nqeyTzCX7sBLpKQhKUY5FGiQfmTiuxk7fGm5u2WR/MX/97GaE7/qoaOUS22IXTOthUdbnWEcOp30cOdDtB9B0+WDopIVNQ8GKsDU6xDSsxbenmYfbCYogEDBPcUHwJ4Gi5cQ1X7vdNKRaaTbk9R5VYi/KY57Jzzl0eE+VGlvx+6NJ3w4cydXsGJSTZZNa2ZCcoG1DhNPwadJI6/NVVSOtc5P1ayW29BA03xMr+n7D5kYnqSh7e9b0VTWKIK63SEQekN8WZHMnv0bYCZfnE0y72IKkVx088zrt4zCHMIqeRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(66476007)(66946007)(2906002)(9686003)(8676002)(66556008)(64756008)(52536014)(76116006)(478600001)(5660300002)(83380400001)(7696005)(71200400001)(86362001)(8936002)(66446008)(55016002)(6506007)(53546011)(110136005)(186003)(26005)(316002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cHltcHFUQUF2Z3BuQzdxY2VkOVVCVmN6RlBKbTNnanhRcEc4VGl6OGJZUGVN?=
 =?utf-8?B?VWFPb29oYkowRnhKeHc5VE9PU05ZdlIvVXVWZnYxT3ZPQzRlaXJjNVM5ZnJl?=
 =?utf-8?B?VitOYy9hTVpGR05rcDFCK0Z4emVpODdMdGYxWWMyUnJ3c3lxVGFwRzBucmtD?=
 =?utf-8?B?N1IxTlR1UjZRRC91VUtQd2lsd1NIaFptSW1EUHBNbG9kSkNydDNtb2V4c21n?=
 =?utf-8?B?YjYvTEtRL2xyVlFVellNclRHSVhLMzA5a3dBa0VFd2pSNlBsbFhsZ0U0anFm?=
 =?utf-8?B?VENFZHB5T25ycUowQ1RRbTNQeXpCOWQ1SlhBc0R2WU9MOHhhQmlBWGY5dGQw?=
 =?utf-8?B?Lys1ZFA1NytPM0VsQU5zM2JSaURSZDFXdFN6Wll6cnhNc3RQd1FBQ053c2RS?=
 =?utf-8?B?eitBak55SVpYamYxbVpmOXNIcmo5dGZGcThGRW92ZGtCd1VHanJCMnlUNmpN?=
 =?utf-8?B?ejhSNUVvWDZ4TExjSm1USVBRMWFuVitWNVQrL2Vkc0txeUJnOTlnMkQxS09k?=
 =?utf-8?B?a3hlU3NVR280Z1RLYW9RT25YKzRkYTJhUXFQRm5LQjlRancyeS82c3JSb3lt?=
 =?utf-8?B?MTdjQ2ovdHlST2dNSmRhSWk0TWZadXZZSkFkbVYveEdOd3d3ZzRmZmY4cEQ1?=
 =?utf-8?B?bUgyN2lFQzhHSFN3YndzRXRBb0pYR09OT0lIOGM5YmNzdU9ScVMxWmo0MGxj?=
 =?utf-8?B?dlMxTDJOb0s3RGpadTN2dGtwcXRKYXlEaUZ2bWZzT3ZQU09yZE9FOHBRT0du?=
 =?utf-8?B?bEdaa29HZ1hIdmRVTzRWVjJocWsrQys3SWg5dkc5bjhld2VFTWJHOTdENUgy?=
 =?utf-8?B?R1JVMXF5cmhlMElkMGdBOGU3YzZIVUlVb1Q0akhpTXYzNVgvZ0Rsa2ZuZE5Z?=
 =?utf-8?B?ZUJZbnZGTjRxMlBqY25UVVB2UHBTT0QwRmhKNlMvTTZZK1N0UmFCRmZBMktX?=
 =?utf-8?B?TklDSlNia3Z2eFIwQ3VRM29EbzZqdTJtMDZWY2pRQ0syVkNSa1hxWXBqVVl2?=
 =?utf-8?B?RXo0b3hmVjhOVlFkVHJkYjNLbWh0K3JtRmhKVnVsUUJEZXU3azVNZjJ1UHJ5?=
 =?utf-8?B?bllWWFFZVjB5dEZrUGZRTTk0N2p4NkJBdGY2MjZhVWdNUnNJbnpGNUllcTFL?=
 =?utf-8?B?WWxqM2xXRGw5NFhWTVBUMm5FZU83N0F0WjJMTFhrSytidWJ3MmEzeEcyOVh5?=
 =?utf-8?B?SGtKU1JvcmEvazlXUVdsa2tVY2tCQzg5L0RJL3JxSzBjYkZtTU53OWQ3Q0w5?=
 =?utf-8?B?dnJMaWZTL0Z6TkJ6UWN0THFPNVhVODd3Wm9vaXMwYWNzbEl4UE5EbUdXenk5?=
 =?utf-8?B?d0EwYy9IeWVtakVSRzcwbXM3TnhNaEVNWEF1UGp2SkRnWFRKMldGeUd3WWhx?=
 =?utf-8?B?TTYxdjYvQVllWld4d1IrYVJvWUhNS1o4elZqd2psODQwd2JaMlc2YmwzRkh1?=
 =?utf-8?B?Q091U2kvQVlEUkJidGM0Rk9LQnRrejBkMTRRVGh4MEMxUm12KzVKdC9vNkY2?=
 =?utf-8?B?V21pSzJMYW5CbWxKTlAwMFRhblR4bE5iSUNuK1ZXRk1KNVBUaHNIeEJCUEJX?=
 =?utf-8?B?aE1uNXFmR2hqQ1grQXZWS0VPUThkYjM3ZUpsbkZNLzI5NVFPcldMK2NJTzl1?=
 =?utf-8?B?a29mYjRxOTk3OVkzTUVRa3U1dy94ZGtzS1JReVJ0L0J2d3dBc3hQQXpqY2po?=
 =?utf-8?B?LzNvWmE2T2FQd2F3L3pSd1FiazFGL0FlbGQ1cEE1OTV2YjhtdzJFSlZFSHNm?=
 =?utf-8?Q?Jdy8+Bpj55Dnk7L7PSgE6WBMxxyGCPjoIym89qi?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eONPG3TTr6ANpjJyRWNTNVfthp1Dp59MppiXFnmdmeLsbuCn7BgIur3HFXbVhb8jtbIQ3evC5emfLIbcvtiJF4f8sOMX/eB8VHzogyvJ1hXO5gG6PhJZAGQS3ITkQElyJc+Ta/v+R4J6NiOujtace5eoSK3RcxrpD7jr46NUCGVojpi11/X4/1FyD6C5V+Kd5rOspPLSN59XPHGGVjfjql8j9//DIt91+mqHgphgJLTbHOMZvZyrDGMXCYR9jstzLqKSQFQ7N2gWacaVzpTQ5e6ID6YQSk+ixuzY0I4iQYpt39BCHuk+HH2jPbcG4nuPQy8sS+DCZ8NudtuYjLeBaQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PonyczFSmXJW0xBnS83Bi1YUUMWR26cSHS3/naYPoVQ=;
 b=Q60ffJshICEgBIgsXPDTCJKG/G13Sn7lA1MI6rcmHk+43mRgrfHWOZnYMTQl68rlcVGXxH1Ljn105+QiPqoj3djz0rm9lhHBaU4kmiVDjT/8eH1SUVM0WhFZKs1BiAPivmzGIXr7JqULIsZaclP8g1Vea6+tneDy5Xs0Z1eb3vdDNT7+cRKR+7/upyCY6uUDTo6sJMU21FEC23HG7YmJyzJhizamnphkpKx3l0XbTEhkK8VJivOQ5kgrCsDwQy1z37RT932ShK60pgn3tidwXPH4xH+jFTp5Kwxy765CAO4CNoGwuLM9u/FPK5jpqQq+zhyxwguXkKIbMjLl1+zJJw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PonyczFSmXJW0xBnS83Bi1YUUMWR26cSHS3/naYPoVQ=;
 b=fGvH5LGvgHGF3cd29i/vvNoTdg3o2pwmVKon4LszpFXk+BLIJ1r7mtawsRq+J+MVi74HaV/zkNKwIjq8nOKsAwBE2OMJ6jmXdey0uqhB4tcGizGXiWXXW5Kd3CmgI2ZqTFufilnWZuGtSbNLfHZZyW5DXVdrzDDbLD+mH7yiJQ0=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 775f4531-dad6-4337-f693-08d8d4f7c6b2
x-ms-exchange-crosstenant-originalarrivaltime: 19 Feb 2021 16:59:52.7543 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 8nHHD9X7HlOXSZyGLiCkFH18aUyQCkcd8ipZYqr5vNnhz3R7f8m3p1E5zLKM4aLgg99jO4hKSvIRewOK5ZPf3w==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4454
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxOSwg
MjAyMSA3OjU4IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IFJpY2hhcmQgSGVuZGVy
c29uDQo+IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBDYzogVGF5bG9yIFNpbXBz
b24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gPGY0
YnVnQGFtc2F0Lm9yZz4NCj4gU3ViamVjdDogW1BBVENIXSBleGVjOiBQb2lzb24gSGV4YWdvbiB0
YXJnZXQtc3BlY2lmaWMgZGVmaW5pdGlvbnMNCj4NCj4gQ29tbWl0IDNlN2E4NGVlY2NjICgiSGV4
YWdvbiBidWlsZCBpbmZyYXN0cnVjdHVyZSIpIGFkZGVkIEhleGFnb24NCj4gZGVmaW5pdGlvbnMg
dGhhdCBzaG91bGQgYmUgcG9pc29uZWQgb24gdGFyZ2V0IGluZGVwZW5kZW50IGRldmljZQ0KPiBj
b2RlLCBidXQgZm9yZ290IHRvIHVwZGF0ZSAiZXhlYy9wb2lzb24uaCIuIERvIGl0IG5vdy4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9y
Zz4NCj4gLS0tDQo+ICBpbmNsdWRlL2V4ZWMvcG9pc29uLmggfCAyICsrDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMvcG9p
c29uLmggYi9pbmNsdWRlL2V4ZWMvcG9pc29uLmgNCj4gaW5kZXggZDdhZTFmMjNlNzEuLjZiYjg2
ZjZjMmYwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMvcG9pc29uLmgNCj4gKysrIGIvaW5j
bHVkZS9leGVjL3BvaXNvbi5oDQo+IEBAIC0xMCw2ICsxMCw3IEBADQo+ICAjcHJhZ21hIEdDQyBw
b2lzb24gVEFSR0VUX0FMUEhBDQo+ICAjcHJhZ21hIEdDQyBwb2lzb24gVEFSR0VUX0FSTQ0KPiAg
I3ByYWdtYSBHQ0MgcG9pc29uIFRBUkdFVF9DUklTDQo+ICsjcHJhZ21hIEdDQyBwb2lzb24gVEFS
R0VUX0hFWEFHT04NCj4gICNwcmFnbWEgR0NDIHBvaXNvbiBUQVJHRVRfSFBQQQ0KPiAgI3ByYWdt
YSBHQ0MgcG9pc29uIFRBUkdFVF9MTTMyDQo+ICAjcHJhZ21hIEdDQyBwb2lzb24gVEFSR0VUX002
OEsNCj4gQEAgLTczLDYgKzc0LDcgQEANCj4gICNwcmFnbWEgR0NDIHBvaXNvbiBDT05GSUdfQ1JJ
U19ESVMNCj4gICNwcmFnbWEgR0NDIHBvaXNvbiBDT05GSUdfSFBQQV9ESVMNCj4gICNwcmFnbWEg
R0NDIHBvaXNvbiBDT05GSUdfSTM4Nl9ESVMNCj4gKyNwcmFnbWEgR0NDIHBvaXNvbiBDT05GSUdf
SEVYQUdPTl9ESVMNCj4gICNwcmFnbWEgR0NDIHBvaXNvbiBDT05GSUdfTE0zMl9ESVMNCj4gICNw
cmFnbWEgR0NDIHBvaXNvbiBDT05GSUdfTTY4S19ESVMNCj4gICNwcmFnbWEgR0NDIHBvaXNvbiBD
T05GSUdfTUlDUk9CTEFaRV9ESVMNCj4gLS0NCj4gMi4yNi4yDQoNClJldmlld2VkLWJ5OiBUYXls
b3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQoNCg0K

