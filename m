Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA393A320D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:28:32 +0200 (CEST)
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOTm-0000Fl-Qs
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lrORN-0007nE-Rd
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:26:02 -0400
Received: from mail-eopbgr800133.outbound.protection.outlook.com
 ([40.107.80.133]:3770 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lrORI-0004Gy-6F
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:26:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSDNATuKfZ8vqkoMF0uJrvJP1E1FmJoZxGKzYhG0X4Oca3EDXNSoDP0hIzLgsfDyb84VGLDfi6/Foi4IOIp1tuEm00eSkVk4cQvXhR085DQIU+Qt2jj+OYTrnCYKtktaf5MF0uzg2cTSIQRWl3nGMcqEgjbUxNk4JebSrYJ/9aGiAUjCYgGMSsefPY4GkpxjcJLIonqTrQ5euI3qvvprU4SBHFkU6UcU0z1Br9CveQ9VhmXMx0Hgsvy8NtT7lvVEZaLlzf46z8Nxwlks1XeH0exM0TWBHwVASDfgRzbUC0IDMQDNAklNZpLGqF4G20pzwtExov+e4Dn0AQAMY14lVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eC+El5K1nXb5gcCRGYroPQtxhtp4+blQRnd9zBXXOg=;
 b=XDnGYAZMthkFTnoePpfbf+ZbIPo1/zVheqTGr1YIdN34i1bFWa0a6bo6Rfaca9ru0uLqn0b6HDhlhf98N7bV3fIjtp+Qc58lbuqQUQPkefOJI4ZVQ/333qPTAuA+YTlyD3Thy4mwXe8AODYYL6V6s4b89GGj5Y9JEpiaT6WP769d6DqN6M1Ldy43cvtbZWdteC2YeSqRrUnYMsMNnDcitNZ4EknQwV5TiVlc0TuGQVCvSh4OntEAxxwp33l2eaaY8HE1wqwdgThd1tLci3YT3weDCLWAZzmM9FoHg1wKNsRKvx6fI/pPhYW4Lj01nDxgSXgtETUFzcTJhiJB73AWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eC+El5K1nXb5gcCRGYroPQtxhtp4+blQRnd9zBXXOg=;
 b=nTL3XGT/YIPtbwDZH+hCJ5u4wOjsoMDm1pSWVmWdJfYANgMVaGFmIOVgnnjm4RS6K7iAbDWrdOnyAVXBSYjcwPBGSH3DrFMl/bpy4HlqurwNV5bJMr5CiNnvz2gngb/C9+2Qm4wzoGN8GObRO/sq2lT8mjQknOpd2p/Geeios5bRAPfaB0hIcvq9ZMFZyuMnwOXtxa7zDUX2ulCWtMY4LBLoatS7dhJ6kyyQIt/+TLzJagZ2UnT4F9BIhxaqDqpI+HIl9LxtLkG8WX0bTTtIoTZEsZe1l020vHhFVUQXSS3iNRD6GwYHr9C1A+DQS0ukddbVzoLoY/bTISKFi3XS7A==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4050.lamprd80.prod.outlook.com (2603:10d6:102:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 17:25:17 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 17:25:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] accel/tcg: Use MiB in tcg_init_machine
Thread-Topic: [PATCH] accel/tcg: Use MiB in tcg_init_machine
Thread-Index: AQHXXhduCjsZvwWFNk+wUya0qXEeNqsNfj6Q
Date: Thu, 10 Jun 2021 17:25:16 +0000
Message-ID: <CP2PR80MB3668245E5A965B37C0A52552DA359@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210610164040.233820-1-richard.henderson@linaro.org>
In-Reply-To: <20210610164040.233820-1-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96fc962d-bbee-469a-eacb-08d92c34b71b
x-ms-traffictypediagnostic: CP2PR80MB4050:
x-microsoft-antispam-prvs: <CP2PR80MB4050EA7D7426484AFB44B936DA359@CP2PR80MB4050.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XMoxI0AYNyt9Tcx7GVj0o0MB2bH9+vNwKccLqMyvvJOdezqBIvhyQ7eznsVdGgeHn5ddNmYirvOYIZupj9Xn5pxpmafK4L/qRLqGvO1//S+Vu4+iaHcRsCpIkZuQ3BSzBDkKwFHRB/JUWifxdg+m0iVAWfEFjSfw7hfhHGly2RpNS3Le/KgXx8aRLbyDAVLs4NfpuxRpFA1VeXL5BMLTZULa5CyA2YcVkdtflsgUmMfiEzL9OBh5JuhvyYJAZ5hI96mBorHg+6/tOXCivVSYppUaoPE0VqtsYGSgak9XeTpd3GefEFjRmru9eARX4yjgSpvmC3H2/hb+Nqyb1OTMhiMEOITsBhYluLNUNGO/m4yC7w7hU8tF/Org7tieJKxxq4CxEJZUiboQOLLplnm+Np7L8hvU0tI0kjjBR0Pb4x6ZSWWUEPLhzooM90LBgI9tAvXdBj4zVo/AItRujDjnnQ/ZFuhfiHYxXFUu6UbDi38gHXpKl5XnimnGNTT0waDqfxbbV5N+mDwlf7KSs6MsX8K63IQ5LopAdOFtI9cr0doVWh8sG69v8dTQTY7Pk+gGd+5KqEJiIfE9AVoWXW2PokgJZF+utpLsIEVUWIdo3FZ1lba1EYRNYg4lz7Uzia0KWeKYQbBAHyUw+EOF570Kh3h1N3QE9cqAhVPbgzpisv+FY06bYaDt7rPu8OhqhPU28TbBjkzQ1Rt10fJY3wcJRgvPYljRXfUtXsFUBYEF81I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(366004)(39850400004)(8676002)(4326008)(8936002)(7696005)(478600001)(66946007)(66556008)(66476007)(64756008)(66446008)(110136005)(316002)(4744005)(122000001)(71200400001)(38100700002)(52536014)(76116006)(86362001)(5660300002)(33656002)(66574015)(9686003)(83380400001)(55016002)(6506007)(26005)(186003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VysrYytSalhoNnJVRVRYYU1OaTdMNERkV2sxZVd2SHVzSnVoUUVmTGFMNHVw?=
 =?utf-8?B?RUNtd3BhUkxWY0FUZnpXL2hHTVpmUjlzY3I4Tmk3dUFaaGs2QnlqK1dXUml6?=
 =?utf-8?B?czR1VHVJT05SUjdjZlp0MkhOYmVzVWlUbXdabHNJTW9qR2hML2xzYTZSL1VG?=
 =?utf-8?B?QWhkNCtkWE1PUjdidVBWUzJlV1ZJODdId0thODBiYklTZjgxZFhDQk82dUwy?=
 =?utf-8?B?T0pSak8vRVQwWlFDaElqRjR1V2JwMnJ4WThHcWNuSkN4SmxRQUFsQzFlVHJR?=
 =?utf-8?B?eTdBTEV0c2hUN3ljSWEwdXpueFRBNVZpcUZwNGk5YjJ2SWFBRGNJUTV3c29K?=
 =?utf-8?B?OFhLTzA1VWNid3FMeUEzZk94QkxvUnNQWUt4VGkyYlZBbm1lSUtkaXpTSUR3?=
 =?utf-8?B?aDlLR3RmN3J0Nmo4QThsOVI1bWR2UEd6OUtEd1lDcFhEZzgyeTNvTHlSYTJ5?=
 =?utf-8?B?MEY4Y1JuL090YUdnU3IrVVBnNWsxTFVLbGRxQ3NCakN6ejBuZUlRUzAwL29w?=
 =?utf-8?B?Z2RIOUJYVExoaFBzSGJVMktPZ1dUbDlQVlhNUDkvWWJadjA0c0VHUzUwc1ZQ?=
 =?utf-8?B?VExwcVRucXhCS2FRaUx3bC9RMUUwNEltb0JDSExhOHVZbFU2d2dFZ3pEVCtz?=
 =?utf-8?B?VGU3dGQzRWZjWlk1NzBEbzdwN1k4WGVEckJ6WWpDdy9TQi9OUHg4dW9xYU9N?=
 =?utf-8?B?QzJjZmw3REFWdU5rSU9ZR1FNdTZleEZlc3M1UFdwSVhWT0NDRmNiZnZXZFg0?=
 =?utf-8?B?eTR5NEtaL2t3SGRnZW9jTjVOT0w5di9Db0tyY255aFNIdVprVGpnSzdCRG55?=
 =?utf-8?B?aDZmWFE3WkgraFUxSS9lbTZwUi9sN0NGQjVNbkVPK3krR1cvRmJxTW9TeERk?=
 =?utf-8?B?YTE4ejRwd3N3RjE5UHhIV0ZLc1dVdmRaazdZSEZ1cG1TMlBlcDNCNzhqZm5E?=
 =?utf-8?B?Y0xEN1JVaElrWC9mRnY2cCtkMDN6VzRkK05PTzJRdWpFZURjUnJmNnBRZHlE?=
 =?utf-8?B?VktYUzRZTkF3d3B4WWN6bFF2Z2poQ3NuaWxXYnlZRlFwdVllSVVCd0ZQVkRq?=
 =?utf-8?B?VERlQmpzYW14cHdsK2hubnBTN3E0S3lZUGY4OElURXNSUy9tYkw3eGp4anNS?=
 =?utf-8?B?TlRIVER0d25wbUxDSzhiNWZWUmVUWW5Pd2VnZVRpVk41akwvMFVzMFdqbWFk?=
 =?utf-8?B?QlZHV1BnYzVjRXVyeE1JOE5hYnpWS09VbDdrYm1KeTVaZlN0ZzY5NURPc05W?=
 =?utf-8?B?UXllMXY0U3pZS0o4aTVUMGQ2ZWFtRjlHZFBXQ0RRNzZYTmpIbFZUV1RKUHpn?=
 =?utf-8?B?NkFyZ0hvTVgxZmt5REpKKzd5SWxHWCtnTmFwVWQzSXVXNVB1dDJGTy9MWXlp?=
 =?utf-8?B?UXFnOGVwUUNrY3N1NDUwaW15SElXU1dUZ21WVGtVU1VER3FVaHNycUIzVzJF?=
 =?utf-8?B?UW9USE9menF0M0NnNnViNy9SZzlxbEJYWXE1Y3czclAvcG5rSS95QWxIK1J6?=
 =?utf-8?B?WC9EV25TcHlmcDUwV0MvdW1sTk5TK0p0NExmV29tMjRjUU84TkpYQ01pTE9u?=
 =?utf-8?B?OUVLRkFEdjY2S21GUTg3ZDdCQ2hZZHRUdXhaT2V6UkF5Mm54N21jeE5YcFFS?=
 =?utf-8?B?T1RjSldLdGhHU01tcE16MUgzVHdkb3YvcjA3WDJLY3M3WmZwRjcwRWxEWk9D?=
 =?utf-8?B?VWtJM2pNSVFWQWFBVmNEQnpGZ1BUUGx2RzlMVFlYNzlYbzEydFdXVm5OT1Js?=
 =?utf-8?Q?11TbJv/Nk2S4LssArEkxpBApdGtfgTOaWZf5cU6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fc962d-bbee-469a-eacb-08d92c34b71b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 17:25:16.9998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4jEX8cB5cnFUJYFBqetslh77N6BCNFbQ1N6O6/E9bfZUPbFjInnpNhDyE8ypKogZQx2nIeqW461LqsdBbdBOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4050
Received-SPF: pass client-ip=40.107.80.133;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFN1Z2dlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBT
aWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZz4NCj4gLS0tDQo+IA0KPiBUaGlzIHNpdHMgaW4gdGhlIG1pZGRsZSBvZiBteSAiQ2xlYW4g
dXAgY29kZV9nZW5fYnVmZmVyIGFsbG9jYXRpb24iDQo+IHBhdGNoIHNldC4gIEFsZXggbWVudGlv
bmVkIGl0IGR1cmluZyByZXZpZXcsIGFuZCBJIGhhZCBhbHJlYWR5IG1hZGUgdGhlIGNoYW5nZS4N
Cj4gDQo+IFRoaXMgaXMgdGhlIG9ubHkgcGF0Y2ggaW4gdGhlIHNldCB0aGF0IGhhcyBub3QgYmVl
biBwb3N0ZWQgYW5kIHJldmlld2VkLiAgUmF0aGVyDQo+IHRoYW4gcmUtcG9zdGluZyB0aGUgZW50
aXJlIHNldCwgSSdtIGp1c3Qgc2VuZGluZyB0aGlzIG9uZSBhbmQgd2lsbCBxdWV1ZSB0aGUgd2hv
bGUNCj4gdGhpbmcgdG8gdGNnLW5leHQuDQo+IA0KPiANCj4gcn4NCj4gDQo+IC0tLQ0KPiAgYWNj
ZWwvdGNnL3RjZy1hbGwuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQoNClJldmlld2VkLWJ5OiBMdWlzIFBpcmVzIDxsdWlzLnBpcmVz
QGVsZG9yYWRvLm9yZy5icj4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlz
YXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3Jh
ZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

