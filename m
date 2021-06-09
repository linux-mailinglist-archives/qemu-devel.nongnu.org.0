Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238973A194C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:23:34 +0200 (CEST)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr03J-0003e4-5I
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzg0-0008UY-QX
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:28 -0400
Received: from mail-sn1anam02on2135.outbound.protection.outlook.com
 ([40.107.96.135]:2819 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfz-0005dd-2c
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMLpCQm0+hiy6ufJUxI6WG41BEI3VfPkJ/sjADIEMvjFG1ROcNot9pR2gqO8MU8DvTEEPugm8vDQe4KqWEAZI7R5DX/ra6haVh3D0L6q/JNapfQvRIW/gfrrV1hz2kVhj2+93vTmo4t3A2WJ2wVvI/ThzGbrpFn/8rMAjenOPO9VBdIWAZS1/34XRPYxzvyC0HKc8mycxZ4SG55HrIlU4zs7uhPPsjboDeng94iUW1s9o8jNJ0m7OLC8qDmX1HeipxU/R1Fy/am2xpRtS+G0rGD/D2ElSU4fYHdKPezPowcvgKsn2C1KPIw1aDjE5fTtqb8XGRdOYu0aPUbp6aBoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39UG42YUBGHqSicR3XqzCvh7oknQ8+FGxnNRLQPxDTE=;
 b=QgL6j02dBeSyUN/Ial4XzNKi+P+OEG9Any8TwgroO1uJxr/CV67JurC/BBKe6CCarUpWRQN/4WW6jlcSarl1ZRu7epMssW+c1ABavziknTjg/4EcYfhLJn5hB3tr1mr2MlUhTI99di2wVrPLxn48i4RRqsqFyVIL0diNsjGeachmUH/Bu3kaZ8dBYnVkvoY0oASdOgiL9HYG+EhuA1XS7UCSAshDupaYacZVxtQOkXALZd0AOvLt9ugQe6jXenVH+ZeoKYgJKNzf0KEF/FC2Zo1arEM2Efqhy76lYG2+rWMcXg8MfkxXCiJsXhuR/jXAjytlp6aziBmVKtAy5LIgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39UG42YUBGHqSicR3XqzCvh7oknQ8+FGxnNRLQPxDTE=;
 b=XZKHkiGEIe6m+4ItwTzPc0dIM+JTPYfJd2bEooqZvGkd5ogvfAHSbEHs092HlyIYkXaBmXOBg9X/28BQ3OcSa7aQhOUIjhSZSuLThfLDGf2kWvfFDu1KuRCkJapcfWYno2lNfCUFlkb9m3qZA3d7/IWPVM3jhbo+HKgWs6xNfyH+46IGN5RnquZ1MWygG0YLpAjUhb5/1Lf2vq9RDEO3zB2J4gXmrgnVWUn7NDX1ApwxWqcktb7xFMDh2Qw1/kbEp8+Dtlip6erYiqcfjp0fu8AMFzEsnB7WrAaEg9Uz/vm6AptJaPfogr7N3rvB69v6yXUWZ7ZLDx8hfqf/uPombw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:59:24 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:24 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 24/28] util/osdep: Add qemu_mprotect_rw
Thread-Topic: [PATCH v3 24/28] util/osdep: Add qemu_mprotect_rw
Thread-Index: AQHXP6q6sNCwcc0YaUyj4ioUNuWeyqsL/jmw
Date: Wed, 9 Jun 2021 14:59:24 +0000
Message-ID: <CP2PR80MB3668CFDF1EEAC9F33EB588C0DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-25-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-25-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e532d257-3272-40fc-9086-08d92b572beb
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017685327895E896F120CD9DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KTXkOT3xW1qCYg3wioZmV8USOIAl6l41463hZ6n30FbaXAp48d02qNf3yYk8n9BEorZzkYWFRcNe9n0+NHKx9JrJerP5Ae+02sU0dZ8QMPqYgvptHT7lEO9xCQwRtNMwCCNlTcf6A+jVQWkHqyVyxZdKZHmaPGRqlNGDmKTBQRZIQYAI/JOiB3P2CoIJFLsXK04x67Xg5AhuVZB5hWU0E/fka7PjoMdFJGrjecCa2n+TI1lDdj1jefJhIyo32UqmtssO2DCrEeClMB+AxYox4rhkgSQ2mCQDWRUFX/RJIyr8pvxTYEHmaAiugCWYJXfs+6tGsmmQqcxj6gphQeDfS4DAMMeGfn5BLEPPdzv6/WegYqK8DeoO8q+fUTJOFDX2auNfhzDFm4MdxqmH50bOm1q+XDDYOVHLwWOqPD0ti3QwIfYxr8YmAdQYgUfxN4Smp9F5bAJmYqHiznAhT0TWGkoPv8Gc7DsC/V4YFuCTRQzTuzaf9Dm+HqYlNAvfJGuDSyWAQTk2EP4wkgOZH8h34XkF13FGdftskCqAHuotAMEF18Su7OdOWF6xqrjDh8oXISZrvodwuAaScEGACwT9SbzgnS6oj27wbX4SbfiIMJBJpc83t05bpS7AwYubw7AB14tA/7eDUU16Ix7EEywZZA4KT69qd49/ED3aFIVjb/rb9JE0drMM7GXj73cf1P+ElADfXucSMOaxrG3K7IPdcARlBuHmxH+LZ3BkMuQl77o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(4326008)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dDFOcUtxZXV4b1MyOFgyYXBPRDRtM29JSnhXNUdObWFSMGRKQWxvUndYWDZQ?=
 =?utf-8?B?dnJPUktxTUhmT01vS0t4MytvM2NBUWU2d2crVTBVam9HL0N5cy9mazYyOFVX?=
 =?utf-8?B?R0ZTRFZwbURWT24wYkdnTUVqcXlXUnhCbWFXYmtrMHh4aDlxOFJ0c2x5NVcr?=
 =?utf-8?B?c2xmQWJZN1U2UFp6VnRuaEtDMkY5a2ZVcTdhdnpOOXZFRHNhQWVkZlU2T3hJ?=
 =?utf-8?B?RzF3dHZSd1RGaHplc0IyRjlDV2xmQk56Zm41bTR1NGE3QWR1MGFCMFgvMXpY?=
 =?utf-8?B?V1MrMDJGRmU0Tjg3RUd5VnFBLysxU2I0S082NzM3eU1QRzlFMm5PZnBoRDV1?=
 =?utf-8?B?MCtZSzlvUlFPOWRlTkJvTHZYV0NlUUhvNDJybEZlQm8rRnJ6aUlvNmNvR0M5?=
 =?utf-8?B?UWdzMHRidG5Gb2JlejUwTlFqOFdFTzhvSy91K3Yvd2ZPMW9zOU5kbm5SMGZi?=
 =?utf-8?B?Q3V5RDByYzhzVnE1N1U4OWFaZXUxRUZVZWxGeVRtMFMzaTB2TVJVYjl2YXo3?=
 =?utf-8?B?K1NqazJVamRkdUx1Uy9SanczWTRaa2c2eXJFcDUrcmo0SVFRNGJVMkljYlNO?=
 =?utf-8?B?Y1YzZGw1T3dQUUdvbkxpamJuZ0gxc2ZpRFk3ZlFCQm9LQlltTDRDUklreDBk?=
 =?utf-8?B?ZWcySFJwY2hqN2hPT0ZNQXp2Q1dkUW82ZkVvMXh6aHhlZ2tKU09XdmJDZnhN?=
 =?utf-8?B?dnNMOGVFR1VGMHRZOVFvS3ViUGNPWkZpekpJbXVjQ05QVGl0VmNGak1MeElh?=
 =?utf-8?B?dEpMY1UwZE1BMmJZV3FDRll1SE53YmhjbHE3VlozVi9PSEE2NVluV2U4RWRq?=
 =?utf-8?B?YzhyZ2d2ZzBlZW4vYW12dWNUYUFRRnlkNWwyVUNJeSsrY3Y1OGhqNXJ0VE1S?=
 =?utf-8?B?emFoSVU0YmhzZXF5K0tPampZWGx0alNxSFJtaG9zbWpIY1M0Z2d3V2k1WVZZ?=
 =?utf-8?B?YTRjZnRmTDFWUFIzMmNmUlVNZzAxaEZ0RVFIWFRUUzJOWTIxMG9lS29lbUdw?=
 =?utf-8?B?NzdHTzRGMEJHUG4vMEU5SGhyRVF3dEVUalFqUkVZS0E3bUN2N1BsS3ZrSFZm?=
 =?utf-8?B?NmR5ZzlsaGdjTVVqWlQwNnpReUkwVGp2OVlheWhqc3V4OUdsc1hFU3NMQi9N?=
 =?utf-8?B?UUQvQjh0ODgvSDNtcG1GeXNDcnZUc1YrSTBzbnljd3BvQVRQWThWMGZjTUZ5?=
 =?utf-8?B?ai9vM0x3NEpDVFpuQVVreVdpNEsrTUpWNnROYVQzKys5cmp1UmJuTUJZTk1Y?=
 =?utf-8?B?VHpKUHBjMW96KzcrUHc3YTdTc0QxMU1XTzU2UEo0WVhaU3l4VGc3SmdyMnM2?=
 =?utf-8?B?c3FuRWRPZ3l4N0pXVExZNVJxK1RUZG5icDNUc2lnbVpCSTFvSlZPVWJjblpl?=
 =?utf-8?B?dTM0OTVDWTk3NnUrZzRiV3VieGpucDdPbmU2aUdWczc3ckpUQVlDbHFhdWNI?=
 =?utf-8?B?ZDduS1FUTUw0RVpzSFFTa3BvK3VrUHlzMXEzMTdROUpYQm9uVnhYNG15cHNn?=
 =?utf-8?B?N1RTaUtacGc1QXEwVVNBU0t3dm1LVTFCbXhlYzRZZXJxeFRXUENJM2wwSkdp?=
 =?utf-8?B?MTZSSjgzSldFalNKdmRMNHRlaWVYT2VDVUVMODl3QWFuNzQ2OWRrQ1NNNWpR?=
 =?utf-8?B?R0l5S3ppbk5MbHNIYlFDUFpRK3BJY0NMcmJORTd1RUoyU3lWRFBXT2x1dzBB?=
 =?utf-8?B?SUhlay9jSC9LbTJQK0U3MmR3L0xUZ0puLzZHTThwektQb2lmemV2L1I3azYr?=
 =?utf-8?Q?Wn6fLY5DcK6HdyUVhH4GRtsHdjclD1Pft1njHAP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e532d257-3272-40fc-9086-08d92b572beb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:24.7154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWxYoAIN5ZRcCNgbO1txxh3p4B/ouN2kr+UuTDRB/sNAIf45Jn76xzVl5is5JdaVjKSSxCNSo06v/kvJbKd3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IEZvciAtLWVuYWJsZS10Y2ctaW50ZXJwcmV0ZXIgb24gV2luZG93cywgd2Ugd2lsbCBuZWVkIHRo
aXMuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFt
c2F0Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgaW5jbHVkZS9xZW11L29zZGVwLmggfCAxICsN
Cj4gIHV0aWwvb3NkZXAuYyAgICAgICAgIHwgOSArKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQ0KDQpSZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJl
c0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVp
c2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9y
YWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

