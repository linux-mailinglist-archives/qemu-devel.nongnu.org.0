Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A79437FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:07:05 +0200 (CEST)
Received: from localhost ([::1]:51300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me1kl-0006cf-NQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me1i4-0005GI-OQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:04:16 -0400
Received: from mail-sn1anam02on2129.outbound.protection.outlook.com
 ([40.107.96.129]:6425 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me1i1-0000pO-Mo
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:04:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtPKqcyNfKOrQbaDchx3TJ5g3SpiNFAJzGTUCgSpVMhXfoa+jyBvQu9LjwR7tNxEe9lQUkh6mUT1ZDJ35CxAcBIakkgcjNWe6M2d3vCfTMzkR3F/TT9PlYEMMeAe7Eib9x2uSLfjwvpDbrbmYeCSIbsrkdTdaHLU7cleriP17tFGmA6wIuftP81OCHFgoEK1tXudR5r5KTvcEmDMVplZ2JwJJidom4OBroFhX9+S7VlrV8xATB6RnpG2h/KjzleWB2GlijtyvY9Z8XOalrAMSMQA2/b1dNkruEVvanup6KOK8lo4bPAWQNrA1Q444CAvwRfX/EdO2OYDpI0XHi0orA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neOLxP6GoZw/T488SianxJK9Fi1IuPk8Btk0497EJ3M=;
 b=PsOAmLUgz1AwpTsfWStvEmiOAMiCuVkHLLyU48iJhJ5Hs684lkYnjdRQvlfUGyQAFYIpoP/pY6WA04RN7tx+tFTEbFGIOaxnRtD8ChDykW8XVe5yjcs+T4zhgY68qCAt/aZRONZ0gyGiUDaZ4k506ikEg41HyNn11u5tAI/imdGs1atNCYk3Ek0iE0xXbvqfwiitZc//fpZS19UJca6Qp7Z/Kk6HDVyhE9Ba4Wf+fiXB7gpluMtUGn/5cRa8ms5729qyhQmwqLw1dTWkvyCaCBdj7m+ZbpmpjONWXiM+ee4XkXECODJM8TstKB1lEQhR9kEMGS5QQu79xWwKrG6TRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neOLxP6GoZw/T488SianxJK9Fi1IuPk8Btk0497EJ3M=;
 b=uQrYLXwOJppojx4ZeKJ5x6xqan7UtmlIhlkIvDTLh+CD7EVPVYksyTDMhLIOARNrTKZp6WAcmD5AQAAlw1v8TiHcU++IkXhzh10oiwu22grg14ES1JNEZMSlyGeHXz0GAF368D4jPm/1eRLWPwpyybWjZU9uVh2aXyDUI7NsMIuYosoSfeIl19kFp4YtkZv0dfusCZd4XRT0rLTpQyv4HqXGsOIwsyrihBjjXO6dXmQrQoxn6bJ37l2i7x2gY1672sd+LhRx/e4wlrdA0wLCz9QoAsxIaRKAhfZH4W8do+GViQo+HV4qYE0oxji3QWarcxNSzRy/lv2Lv3YwpIin7Q==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB5173.lamprd80.prod.outlook.com (2603:10d6:103:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 21:04:09 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 21:04:09 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 30/48] tcg/optimize: Split out fold_xx_to_i
Thread-Topic: [PATCH v3 30/48] tcg/optimize: Split out fold_xx_to_i
Thread-Index: AQHXxr96q+O8WEsd30aIP7WCPiBzjKvfgyAw
Date: Fri, 22 Oct 2021 21:04:09 +0000
Message-ID: <CPXPR80MB5224E3AF6F9184F2386D8080DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-31-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-31-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f9e743d-8fc5-46f0-108c-08d9959f7dda
x-ms-traffictypediagnostic: CPXPR80MB5173:
x-microsoft-antispam-prvs: <CPXPR80MB5173DA7D49D02FFB092F330CDA809@CPXPR80MB5173.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tmhEk6FhVay5DZMGrcSawjo37s5OBcpKYmkcMqdu0WAY43O4FvigyARJUYzm9SC42dA7AgpFYqcjFHzJaijWuXPVttL8zpzXybhZPENTZHdYb4vFsvQ7vb2LeZa3vWVZfwRzrwvtVvk1QMg5iDFQiuhU7MUhjs8waI88PGSAvED+rWgTlFzc8UcIZQF0hefa/HIxlXgxGzZPUOHYv8brP4QApCLSq6V+lyt6W7PdRlOc7+uA63CExZHmbmNvBP5zxknksTLO3YJiZIY3oLqTfcO31i3UvfDwGfGnUDS5CcpQdTdvLprEipYMTrIFt9Rl89dQYHVlfvHLP79hsxiNB8JugYIWS5UfitAsTYGAD8pXglRlpyruqqbkRgbztC+ObuWmFzO+eCFKmMYYq9pLpWO2yIG5kd5Y/4Aca0OoEbA7IBkD2cg7ZUz7XVBdlrNrh/quWmnXVCfJzbep1dyLLgwdv8lBLd0Vf+uiQK7tzAi2eFD8h/aMmYMNPCyNn81lLOifismaNhbFIXo0rjA0cThBCEwn0S6dkNrh4WDC1Qz2pCqXsmIV8ht916YlD8aFnKox0R8UZQhtm3zJDJRC0aaCRrprr+43XUvyzuGJzklyDZbFo7HHCx8e40QbT28yTJWLmEhdwHPVWdFYbZkV2k4R1q8LSHiGQWBsphzb2r01mTCfZuQunS6UeJaVIl3uizBARp0R4nWp/n7DG9wpzGAtMtQwo96lJQ80jBr7PhvSyiOemqby5OwuGpjRuFFdJgRrShev1iLEOPbs3lcnYbnn0sg9MFUiFlSwEQufEQk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66446008)(66476007)(76116006)(64756008)(6506007)(2906002)(66946007)(8936002)(4326008)(52536014)(55016002)(8676002)(26005)(316002)(5660300002)(54906003)(71200400001)(110136005)(7696005)(9686003)(508600001)(186003)(83380400001)(38100700002)(86362001)(4744005)(33656002)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1d2Rk45RFRhSjExbFBzbGdEcVR5OEI5U1NKc1ZVUTczVURWUTF0bHhwL1Y1?=
 =?utf-8?B?SXgwWkZUdkRvRXNrT05PRVN5Yitqenkwc1h4Z3l0L2NWZWkxNnVwc3plamRF?=
 =?utf-8?B?a1lPK0N4aXp1MTk3ZUNFWE0xN254aVNhUXlYSU5CbzJWRTh1VmI0STAwWGdP?=
 =?utf-8?B?V2tYQ3luTnV6MktvYTAvc1gyTGVLNG5FekVPV1g2UllWVHNtMnNibWVmWjZP?=
 =?utf-8?B?M0gyRlVubW8xN0d6RVZSSnZTNnh2TW9VcUw3bGs4QjdhczVyY2Y3cGtSck5K?=
 =?utf-8?B?UHI5R3FiY0t6ckY3T0hwZGt6cGdPL0NXeWN6czdieWpsd2dFQ2VjdVUrKzRQ?=
 =?utf-8?B?M1hqMlRyS1RLRmR5bXNuZm01MjFmZWJUNTd0OVFYWllxV2lja1FKT0p1UGVa?=
 =?utf-8?B?YzE0ZTdnNFA0bURoSTVLNU5Fd2lPUFhES0VKYlVVMHFsc2xrc01BUDMzay9Q?=
 =?utf-8?B?UWgvUDcxK2l0ZS9CRE4zN3ROc2VPNTJJVWlqSU9GOVFMOTQ3M0wwbm9hTGRk?=
 =?utf-8?B?TmFvejI0MloxekRDc0V1TmNjeENZbmZrL2JxVGQ1YkZxOE9ObnV5QmR0dGlE?=
 =?utf-8?B?WmZ6UVIzMExVMStILy9ER29jR21PaUJHak1VYXhqbGtsMFhIMnhPbUo1ZzBJ?=
 =?utf-8?B?N0ZVd05wcnM4WUp4eVI3Y1dsRzVXa1FSS2Nha2ZtcnhoWUQydVB0NmRLRzFw?=
 =?utf-8?B?TUJ2eDk3bXFmWEdEZ1lqRlJ0TWpHa2s4aWJKL2toTjZMQmk4akFFQVU3ZmxU?=
 =?utf-8?B?WXYvTFd5bXAzcHEyeEVEdksvWE1ocGluaHU4eUhHTGdVaU9LV1FOLzl1ZUdU?=
 =?utf-8?B?djNaSGtJY0F5MGNiWDVUd0hRSFoxb1M4MUoxUEpTbGtmRlZsVmVQQjVpQTQ2?=
 =?utf-8?B?dlRvN0o3ZXhNUHgyN0FaNlRiNEx6SGJNZG90Q3VqMWlueHhQektnVkwyaVlF?=
 =?utf-8?B?bXd4QjNjTGJQY0hkcFlhRHZNU0s1L0ZMWTZNdmFUY2xQck0yaGVKTU13VzdF?=
 =?utf-8?B?MEJwcU1VYXJKZ00rUTB0elk0WC9Eanl3V0lPZDBETmhpQlV6TFVlSm9VL0Zj?=
 =?utf-8?B?S2J2eUEwUzJtcURFeE90cnFrSkJGTlU5VHFseFpiMHRqMWdtSEM1c2pjZkN5?=
 =?utf-8?B?VUhxalI5eGg0TDFqOEk1QnZzWm5GWXY4OXJqZTFndnRGRERKUHJIVEVUSlNN?=
 =?utf-8?B?ZURMa0lDZExFNWpTQm91YlI0N3ZaVDg3V1JxcDl3TDltMjQxWTY2YXAyTTZj?=
 =?utf-8?B?a1MrOHEyU1BwQXdDSnRxQmRqMXRIek9Md0cvY05FS21Zb211cURqeHBuaCtC?=
 =?utf-8?B?RlZhYis2azlVVVpXank2RE5XMGFkdHI3NVQyeG8xNEZ2aTZuNnZJR3ZoUWlY?=
 =?utf-8?B?NSsvVllncGc0NlBsM2pkc2RSQVNSTk5RZmNqRC83QzJIRmhMbnVpNFRtb2lk?=
 =?utf-8?B?OVhaWXJoQWtTanV6Tnk5RnNZamIrOHNSK01MTmZDL3JlZ24xNTZWRXZnWG00?=
 =?utf-8?B?eWtzRm0vSHd0eVNDQUtsWCt1Z3BjbDBKaVBUMkZhRFQxNnRsV0N4WklIMEpZ?=
 =?utf-8?B?cXVTcko3TERIRkd2ck9HbUx5UTBsNFhzTi84YmtTQ0JvZVZCTmVtSlNwMUww?=
 =?utf-8?B?M2ovck1CVDVuM0thbHRqc0dTa2VHTmNSaDJSaG5mb0RPK3AyWFl3ZWI3bG5T?=
 =?utf-8?B?RWhEbXRvc1NFNEszdG5qcTd1T1k1RW9WLzRBVnF5N0gvSWI2UEpHMG5CaW9o?=
 =?utf-8?B?TUNJQ0NvaEhkR1hpREFTZko5Z2h4RlRmMDZmNWlKWmVRZEZnRW96QzBPSjZQ?=
 =?utf-8?B?WWxvZjF3VWcvTDZVMVhiN3dJMHhZV0wwdVB4S2lDQi9LdkN2a3NRUk5aTFMw?=
 =?utf-8?B?R1hTdFZROHQxL3hOMmxnaUdiSlE0ZXRlaG5IM08vL3VVL0Q5dndZT2lOSFRp?=
 =?utf-8?Q?AnLPQIWcymc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9e743d-8fc5-46f0-108c-08d9959f7dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 21:04:09.2957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5173
Received-SPF: pass client-ip=40.107.96.129;
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFB1bGwgdGhlICJvcCByLCBhLCBhID0+IG1vdmkgciwgMCIgb3B0aW1pemF0aW9uIGludG8gYSBm
dW5jdGlvbiwgYW5kIHVzZSBpdCBpbiB0aGUNCj4gb3V0ZXIgb3Bjb2RlIGZvbGQgZnVuY3Rpb25z
Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNh
dC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIHRjZy9vcHRpbWl6ZS5jIHwgNDEgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMg
PGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRv
IGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczov
L3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

