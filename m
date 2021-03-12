Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5E3389DF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:19:41 +0100 (CET)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKetQ-0005c8-2j
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKemG-0005pL-TH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:12:19 -0500
Received: from esa14.fujitsucc.c3s2.iphmx.com ([68.232.156.101]:57648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKem7-00006q-1t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:12:16 -0500
IronPort-SDR: 4UInQ1ra8RIBNQPSqqvmb4meQvv9q9G1enKXtlC1O1dyvcOSIzsos/Fv8aqDS+FgVIsAWV/pkA
 bbCV1jgTqldtUM7z4O2G81HYsaxI9daOovhExE0ygGMe5H8HhFaDsz1n5cJPjGKa2zBehjD64i
 r7ObgkUkpHhRBONzAV68WXEUkLKeEy7cv9uWGP2KG9E9Wd1uWaF8RlWKHCjvxicUgeCnXCn8j6
 qClSvYIOn+fjQLLEko471OudgakpkrXk+SglaH/kGgdYOemt9QCZAQVncw18I2a7uLQel8VORK
 8ew=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="27657731"
X-IronPort-AV: E=Sophos;i="5.81,243,1610377200"; d="scan'208,217";a="27657731"
Received: from mail-sg2apc01lp2052.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 19:12:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbwo7hkzB8V38ypao+o1KK7w/nOomP3pLVgjRWH7z0GM2G6Ww+eZyB5IE2/9/gIWJdVGARz6f9pKy/HWRmWePWSKXJLddcgTX52wNunMcYsR+GeY+GBXAz51ZumE1mHn9WRj8r8KAS8WHcai6Tkb1ZgjDYrMPkSyi092680PwOpV0eh9fX+i8kTPfPtrgimfGMU34QiVQS9yHCMzZHTdV7ts/s0yZAefXIWQ5RzraxFJaP0atHm7CmrY2G6VKnUY0LFW4aFmvx7GFKUMvxCp2bQT9izG9uUkah8D6a7hhalvXS+S9A0+TXuCTujPmPKwFDHt/WQ7vcx1DS/C3XLCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZXuofW+TYgcaJevRXZ/ChZYiJpf6cd2UABQg6g/Q5w=;
 b=ElyABRk9UCqp2elGdFYvG1/mUIo8+6MIW+MVXRoJLej0BgZ9ODSk2nH8ZPQWO4QcI8exvrigsyhpLiGpJWEJxOZ22nMuapvQpobnv7ND6r6vZkiWu0DqGOBrBQ8RTuT682fmoJ1k/7sX+MTV+18mdwGBZASam+6p5CCu+CKd2xLxZcTkw9HhNY6xYwN8RbWiuSU69HXA1ZwUpp9HVXyl0TwclUQCm5hmiwzVnfYxe5HntC23z40sdnfNOXw6cRXzuLqS9cCCJkqyqCEYB9TonxLuyef9QgJr+7wBe9sklpZlKopAmc6ZQvnMDV1Vrz98Q6A58AWBbY4AACziOZ7FPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZXuofW+TYgcaJevRXZ/ChZYiJpf6cd2UABQg6g/Q5w=;
 b=fQG41E4jSiM7AmUpBv1XH3i80y7+7wiPpNs4Ly8eKEojp+JoJfpaqcfI8wsACsJ2PWFcxkJ51i0c4vsnnYZpgrpqSXAUceeTTxy6KFroN/Re2lFVz1FFWNF3Dj99MAkPt8UdrihH0L1tWWIgYfICuPzR5F9JTRJ0N6STK5JlFSs=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TY2PR01MB1979.jpnprd01.prod.outlook.com (2603:1096:404:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Fri, 12 Mar
 2021 10:11:53 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 10:11:53 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 04/10] Remove migrate_set_block_enabled in checkpoint
Thread-Topic: [PATCH v2 04/10] Remove migrate_set_block_enabled in checkpoint
Thread-Index: AQHXFwAySOMMiBDJ9UC/0aFGjz4bnaqAC8iA
Date: Fri, 12 Mar 2021 10:11:52 +0000
Message-ID: <TY2PR01MB2571CB64575654B03AA24DC3A56F9@TY2PR01MB2571.jpnprd01.prod.outlook.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-5-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-5-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bff3ff7-06d3-4876-1012-08d8e53f4247
x-ms-traffictypediagnostic: TY2PR01MB1979:
x-microsoft-antispam-prvs: <TY2PR01MB197974FEBD15D2AC6059395BA56F9@TY2PR01MB1979.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:287;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E95InDj19ANSDfSKmC6WNdmBr0KVXgkrLS1sXzz8SevUtfHjcVQB40yyFhXZjFlqsxGtfek9WPZnQ37JAfkfM+8Twc2Qu1izP3NrveWr0dMHC4r4oqT2iKC8szNTarXUrlcVRFoDkt4MzSP4MKQqyETcc0LcXrbFPgbu/IZanY3sEmA7CBmGk9yL/7PRLtbuZ0abS1Ge6xmoNWWGfFXW/lP0SOj2mrCWw0UIkuJhCdOQUE9W8yhS4qkGjpA0+tFyfYYPcF0z2sEZXKYQPOJGbUOMsH9MR8pr6bRiMBC88m+dSsnGFlDVVJerVy/1FkeeAjJz1h7SM9StGRH24DNWsdIg2/fvSoYWLFlfFacQUNSL2TDoD6AOox9pC4ss3kYUnTH9MGtwTOinIidUJOwiykhrEyLlWIGyxnKMr74wKB0+Fl8JmfVWdS2x2U2UF8StbC4nZCGC+QdO08HzKx0DyXbL61F/VWU+5GI/x29joZ+cbfnkHQJ+NwJFcdVkI+NZkbWtxGgWt/xGvjrbHw5j5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(4326008)(6506007)(53546011)(83380400001)(85182001)(110136005)(8936002)(9686003)(2906002)(478600001)(186003)(26005)(71200400001)(64756008)(66556008)(55016002)(66476007)(66446008)(8676002)(316002)(76116006)(66946007)(52536014)(86362001)(7696005)(5660300002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?ek1JWGVTcUVjM3E0c1RkdGluZUNEMWtuQWZLUEhnZUVUTlhZWlJuNFllLytp?=
 =?gb2312?B?TjBLVWdiSXFsc3NjdFBtNXRHbGNzVFU3Y05TdGJvVlFUaU1rWmlHL1NrZ1kv?=
 =?gb2312?B?aHAyUFR5NHVMLzJualFyUjd2VHhCQUFuUDJyZDkwY0dzSTBIZWk1SjRRVkU2?=
 =?gb2312?B?V2VBYUJuZ2xUL3BPajJvRGFDTVNYdlZhcFBqKzdKdVVrRTY0VjlQU3J5Wm9W?=
 =?gb2312?B?cms2Sk8wdXhWeURVbG50eW9pZWludkk1K2F3K0lHNkkrRnFySk84ZkhTQmU5?=
 =?gb2312?B?TFlneThMVGFLSUdsRU1zaWtZdHU5UjNnc1dUck04NXFQRDhOZE9pVVJ3MW4x?=
 =?gb2312?B?RnF0aUREOW44VzgxckF5b0E3MzU0Y2lVRzJJODBVL2hDamtvK0NWS0g2dWoz?=
 =?gb2312?B?WEJ4WDlGOC84V0cvZGcxMlpiRjVXWi9wdUJHSFNLVDRJcDFYT3RYS3MvRXU2?=
 =?gb2312?B?SDU1VkhHN2lUUGZReVZaUzdRZGxmZXoyUjRBdkdrcXVvK0N1R1MrRVA1YVhY?=
 =?gb2312?B?K05KZVRWRFA1WVpadVdGYi9Za0xpbkc1S2owR2pXOVhwa280aWJ1MnNEcUdK?=
 =?gb2312?B?a3lEWktGZTVJc044TGxqZk1vbWh3blUyNEIraEZoZWJwZG1lMWVZaTRwQXc4?=
 =?gb2312?B?TXN2c0VCRnB3anZHQ2doczE1Rm10ckMxYWNRTjJSVjNEMWJRTDRBTVZQSXg5?=
 =?gb2312?B?ZzJLTUlCSWpOQlZPN2MvSGhXRTdldHIrelg5ZmZ2aVhpdEVxWlBOUFdnQlRK?=
 =?gb2312?B?THJUbVFNaFhnMFc0YWIzcE1qV2lOYmxhb1U1QjlHUjRFa0ZJR2doZCtkZ2Jx?=
 =?gb2312?B?V25neDBEdFg2ZWt4K1E4T3dZcmVNSk0zcXE2RUJ4TzRpcm9oaHhVYmgwc3dH?=
 =?gb2312?B?UDFoV1JOSTFTUjl2Y1d5ekRnL2ZQdVN6RjNCRXVGYTlyM2tkZWdKak5iZ0x0?=
 =?gb2312?B?emVHUUFqSHdWdDI4K2xDbXZCMHJKd1l5TVBiYXB4Y2E4Y1lpdjRib01MWDA3?=
 =?gb2312?B?OFdmdEtJMGVIRkszYkJwMkpFZnorUEFyY0JGN3MyTGtQaExRd000a0t5SHhm?=
 =?gb2312?B?by9UeHJrSVNSNWlTMkJuVmNud2pkeUNEL2M3cS9jaTFpTWhPSFZCQkQ2UzI3?=
 =?gb2312?B?aDFsVHpRN0N6S2xoY1NnL0xnMWhESVlXL04rQ1MwUVFkbVdQeVNDK2RJbDVI?=
 =?gb2312?B?WmZqTWtLTEJ4QU5mRENiRmZ5RGppei81cmFZZWFkbTFJaklZeDJuL3VYY0JH?=
 =?gb2312?B?cUkwd0RZMklVaFVpSk1zSElDVEhpYkl5MmY3T1o5cmlNblhNUTRFdFBGSDVM?=
 =?gb2312?B?ak5LVE1jLzRaRXRXdHk4Q05jbjgxVTA0VktkaUdyWlJvZjFmY1VGSHBsbHEw?=
 =?gb2312?B?VXFHOXZtYUVpOGJCT2kwbEczaHpHZThrdUN4ZFNHQWNzV2ZsYWpGWm5FQWJI?=
 =?gb2312?B?UTZ2NDhueG9nNGpaSEZFMnhVM1MvUytUNm5NRERkNk8rbllNQ2ZjcjltVDZ1?=
 =?gb2312?B?Qk9HL29XaXpGbFpPVGhJK2VIMjJINThNSHhxRURXVm1QRUlTTjdkUmtmVTZp?=
 =?gb2312?B?RTdUdkRzK1QvUklIQmlQU3lDbHNwVUJNdzdxaTMzWDdWdzZXY05NTWEveTVQ?=
 =?gb2312?B?L05HMnp5U1NwbjAvbzJlNHAwaWhRcmFBMm1yQXdyalQ0dCsrMXUvUUxuUkNr?=
 =?gb2312?B?disyY2NuaVZ5WjYrbG9sNXg0dnB3OXVrMjRvNjJ2WGNyRHA2Yk0rRXFrWi8w?=
 =?gb2312?Q?lmhBBL3CxOu7sHGckCYJKcD70/RP/Nz01lHBPPC?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TY2PR01MB2571CB64575654B03AA24DC3A56F9TY2PR01MB2571jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bff3ff7-06d3-4876-1012-08d8e53f4247
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 10:11:52.9389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhZzapDGfadhSQeJgUkqDcV7eocEB5YpN5DQEv2J5R6rg2+18NlIQac78jkBYVtOpBuaXZchw1GBPamw+XCtAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1979
Received-SPF: pass client-ip=68.232.156.101;
 envelope-from=lizhijian@fujitsu.com; helo=esa14.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_TY2PR01MB2571CB64575654B03AA24DC3A56F9TY2PR01MB2571jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQpPbiAzLzEyLzIxIDE6MDIgUE0sIGxlaXJhbyB3cm90ZToNCg0KRnJvbTogIlJhbywgTGVpIiA8
bGVpLnJhb0BpbnRlbC5jb20+PG1haWx0bzpsZWkucmFvQGludGVsLmNvbT4NCg0KDQoNCldlIGNh
biBkZXRlY3QgZGlzayBtaWdyYXRpb24gaW4gbWlncmF0ZV9wcmVwYXJlLCBpZiBkaXNrIG1pZ3Jh
dGlvbg0KDQppcyBlbmFibGVkIGluIENPTE8gbW9kZSwgd2UgY2FuIGRpcmVjdGx5IHJlcG9ydCBh
biBlcnJvci5hbmQgdGhlcmUNCg0KaXMgbm8gbmVlZCB0byBkaXNhYmxlIGJsb2NrIG1pZ3JhdGlv
biBhdCBldmVyeSBjaGVja3BvaW50Lg0KDQoNCg0KU2lnbmVkLW9mZi1ieTogTGVpIFJhbyA8bGVp
LnJhb0BpbnRlbC5jb20+PG1haWx0bzpsZWkucmFvQGludGVsLmNvbT4NCg0KU2lnbmVkLW9mZi1i
eTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+PG1haWx0bzpjaGVuLnpoYW5nQGlu
dGVsLmNvbT4NClJldmlld2VkLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AZnVqaXRzdS5jb20+
PG1haWx0bzpsaXpoaWppYW5AZnVqaXRzdS5jb20+DQoNCg0KDQoNCg0KLS0tDQoNCiBtaWdyYXRp
b24vY29sby5jICAgICAgfCA2IC0tLS0tLQ0KDQogbWlncmF0aW9uL21pZ3JhdGlvbi5jIHwgNCAr
KysrDQoNCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkN
Cg0KREFfDQoNCmRpZmYgLS1naXQgYS9taWdyYXRpb24vY29sby5jIGIvbWlncmF0aW9uL2NvbG8u
Yw0KDQppbmRleCBkZTI3NjYyLi4xYWFmMzE2IDEwMDY0NA0KDQotLS0gYS9taWdyYXRpb24vY29s
by5jDQoNCisrKyBiL21pZ3JhdGlvbi9jb2xvLmMNCg0KQEAgLTQzNSwxMiArNDM1LDYgQEAgc3Rh
dGljIGludCBjb2xvX2RvX2NoZWNrcG9pbnRfdHJhbnNhY3Rpb24oTWlncmF0aW9uU3RhdGUgKnMs
DQoNCiAgICAgaWYgKGZhaWxvdmVyX2dldF9zdGF0ZSgpICE9IEZBSUxPVkVSX1NUQVRVU19OT05F
KSB7DQoNCiAgICAgICAgIGdvdG8gb3V0Ow0KDQogICAgIH0NCg0KLQ0KDQotICAgIC8qIERpc2Fi
bGUgYmxvY2sgbWlncmF0aW9uICovDQoNCi0gICAgbWlncmF0ZV9zZXRfYmxvY2tfZW5hYmxlZChm
YWxzZSwgJmxvY2FsX2Vycik7DQoNCi0gICAgaWYgKGxvY2FsX2Vycikgew0KDQotICAgICAgICBn
b3RvIG91dDsNCg0KLSAgICB9DQoNCiAgICAgcWVtdV9tdXRleF9sb2NrX2lvdGhyZWFkKCk7DQoN
Cg0KDQogI2lmZGVmIENPTkZJR19SRVBMSUNBVElPTg0KDQpkaWZmIC0tZ2l0IGEvbWlncmF0aW9u
L21pZ3JhdGlvbi5jIGIvbWlncmF0aW9uL21pZ3JhdGlvbi5jDQoNCmluZGV4IGE1ZGRmNDMuLjc4
NWEzMzEgMTAwNjQ0DQoNCi0tLSBhL21pZ3JhdGlvbi9taWdyYXRpb24uYw0KDQorKysgYi9taWdy
YXRpb24vbWlncmF0aW9uLmMNCg0KQEAgLTIyMjEsNiArMjIyMSwxMCBAQCBzdGF0aWMgYm9vbCBt
aWdyYXRlX3ByZXBhcmUoTWlncmF0aW9uU3RhdGUgKnMsIGJvb2wgYmxrLCBib29sIGJsa19pbmMs
DQoNCiAgICAgfQ0KDQoNCg0KICAgICBpZiAoYmxrIHx8IGJsa19pbmMpIHsNCg0KKyAgICAgICAg
aWYgKG1pZ3JhdGVfY29sb19lbmFibGVkKCkpIHsNCg0KKyAgICAgICAgICAgIGVycm9yX3NldGco
ZXJycCwgIk5vIGRpc2sgbWlncmF0aW9uIGlzIHJlcXVpcmVkIGluIENPTE8gbW9kZSIpOw0KDQor
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KDQorICAgICAgICB9DQoNCiAgICAgICAgIGlmICht
aWdyYXRlX3VzZV9ibG9jaygpIHx8IG1pZ3JhdGVfdXNlX2Jsb2NrX2luY3JlbWVudGFsKCkpIHsN
Cg0KICAgICAgICAgICAgIGVycm9yX3NldGcoZXJycCwgIkNvbW1hbmQgb3B0aW9ucyBhcmUgaW5j
b21wYXRpYmxlIHdpdGggIg0KDQogICAgICAgICAgICAgICAgICAgICAgICAiY3VycmVudCBtaWdy
YXRpb24gY2FwYWJpbGl0aWVzIik7DQoNCg==

--_000_TY2PR01MB2571CB64575654B03AA24DC3A56F9TY2PR01MB2571jpnp_
Content-Type: text/html; charset="gb2312"
Content-ID: <52D22E1C7D7D9A428D9FC3DC6931CC36@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML =D4=A4=C9=E8=B8=F1=CA=BD =D7=D6=B7=FB";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
span.HTML
	{mso-style-name:"HTML =D4=A4=C9=E8=B8=F1=CA=BD =D7=D6=B7=FB";
	mso-style-priority:99;
	mso-style-link:"HTML =D4=A4=C9=E8=B8=F1=CA=BD";
	font-family:"Courier New";}
span.EmailStyle20
	{mso-style-type:personal-compose;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
<o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 3/12/21 1:02 PM, leirao wrot=
e:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><span lang=3D"EN-US">From: &quot;Rao, Lei&quot; <a href=3D"mailto:lei.=
rao@intel.com">&lt;lei.rao@intel.com&gt;</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">We can detect disk migration in migrate_prepare, =
if disk migration<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">is enabled in COLO mode, we can directly report a=
n error.and there<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">is no need to disable block migration at every ch=
eckpoint.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">Signed-off-by: Lei Rao <a href=3D"mailto:lei.rao@=
intel.com">&lt;lei.rao@intel.com&gt;</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">Signed-off-by: Zhang Chen <a href=3D"mailto:chen.=
zhang@intel.com">&lt;chen.zhang@intel.com&gt;</a><o:p></o:p></span></pre>
</blockquote>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Reviewed-by: Li Zhijian <a href=
=3D"mailto:lizhijian@fujitsu.com">
&lt;lizhijian@fujitsu.com&gt;</a><br>
<br>
<br>
<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">---<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> migration/colo.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 6 ------<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> migration/migration.c | 4 ++++<o:p></o:p></span>=
</pre>
<pre><span lang=3D"EN-US"> 2 files changed, 4 insertions(+), 6 deletions(-)=
<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">DA_<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">diff --git a/migration/colo.c b/migration/colo.c<=
o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">index de27662..1aaf316 100644<o:p></o:p></span></=
pre>
<pre><span lang=3D"EN-US">--- a/migration/colo.c<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+++ b/migration/colo.c<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">@@ -435,12 +435,6 @@ static int colo_do_checkpoin=
t_transaction(MigrationState *s,<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; if (failover_get_state()=
 !=3D FAILOVER_STATUS_NONE) {<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
goto out;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></pre=
>
<pre><span lang=3D"EN-US">-<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; /* Disable block migration */=
<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; migrate_set_block_enabled(fal=
se, &amp;local_err);<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; if (local_err) {<o:p></o:p></=
span></pre>
<pre><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto =
out;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qemu_mutex_lock_iothread=
();<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;#ifdef CONFIG_REPLICATION<o:p></o:p></span>=
</pre>
<pre><span lang=3D"EN-US">diff --git a/migration/migration.c b/migration/mi=
gration.c<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">index a5ddf43..785a331 100644<o:p></o:p></span></=
pre>
<pre><span lang=3D"EN-US">--- a/migration/migration.c<o:p></o:p></span></pr=
e>
<pre><span lang=3D"EN-US">+++ b/migration/migration.c<o:p></o:p></span></pr=
e>
<pre><span lang=3D"EN-US">@@ -2221,6 +2221,10 @@ static bool migrate_prepar=
e(MigrationState *s, bool blk, bool blk_inc,<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></pre=
>
<pre><span lang=3D"EN-US"> <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (blk || blk_inc)=
 {<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;if (m=
igrate_colo_enabled()) {<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;No disk migration is required in =
COLO mode&quot;);<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; return false;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p=
></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (migrate_use_block() || migrate_use_block_incremental()) {<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Command options are incompat=
ible with &quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;current migration capabilities&quot;);<o:p></o:p></spa=
n></pre>
</blockquote>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY2PR01MB2571CB64575654B03AA24DC3A56F9TY2PR01MB2571jpnp_--

