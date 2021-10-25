Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8F439E59
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:18:52 +0200 (CEST)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf4Yc-00067N-Bj
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf4Tt-00055G-Oo
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:13:57 -0400
Received: from mail-eopbgr820109.outbound.protection.outlook.com
 ([40.107.82.109]:12000 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf4Tr-0002Y4-1U
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:13:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGh+HkOMTxMYvDRVpcq9jeDMsbcPD9+Xd7iFCw1zB7BgeExJYT7J3m7d/dKDFzrn1gJA7+16RyoUzBJjm0NvqY8x1I7n1LTj1AXHeiItafRGEkxxxuL0Kqhu2JuTg+oOB9GzFFBylOFtTDIC3vJgW224JshnEeuRP3QcUPG0rGPNCAO8OfGXr/tlL/NcI2ANIt2LQbEdSMChLfOp0hZ8owgQEG+dZE6WmLMH15iFkDUY5LJZEXSWUsaIi/FnwoC2uNYewu4vS3hUve07ngdIlUfxrrmShPPKjHl3r9tVd68tqtQnUPVu7/F6PCzBwHjEIqhseZ6nFBA6zB5UJNd58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCssrrAxireAQoEKgw2PVXJAa4fOtQ4LqHkUsMRXeVk=;
 b=HDvuGtXZozX1kkdeGyXE3R3idmTuVZ+N0HX6zVu3eeIH1gK8PV6WeB4dgWeGxYkjFeT/+6eS6jClUJycr/6lncdbdLjN1RxYBpSB1HVexYeYj0WdRvXY5CQ/duKE6iIhjMUP3nZt5OHIseMI21N3k9K8aAFqOlEe2SJanhiNzEVEIQEAnVxVjwrP6TGSKjJJ9SpRt2TfKuQ0H99flxWm32TNk3AJ9/NNrTGGIVcoCCuv/syIIv9nu6vNvxsLJ47mTnuDcKGqgjGvPnGhDM5tLoh1KBPHIe5nOlL2TxNoih+hpXbBLxuRIfN5UjgvEPgKyglUyAhfOmAkS+jwgKI7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCssrrAxireAQoEKgw2PVXJAa4fOtQ4LqHkUsMRXeVk=;
 b=FEJektoeNYE+jle3c3a/yro9rhf5r0369Ncq5SCknB2OfneFV3hBKdb9udEy52OC2uYftY3ijJpHJ+vj4bTqtWPy4easjTKou7a1iqpNSG8DZn+n2JBV4v6uFukuN62luP5dNdoPqZD1HbKbTt/QW+9mz//LBG6SDRXuDCz8If7UKfaFlS3KY4oJk3F2xK3bkOile46FB6WiU4MQYwc3FqvKhll2rUlLPYyh9OuEPBzIpHkFCvSD//o3jUKNu8iYFiq/wwVwmOZaGj66mde+qChA/zvUFkRtUVPQ/xGS7zOn3vDuq+Bnm4ZhV41hnyHOIDbVt2zHSWzJVJsDsD+BhQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3572.lamprd80.prod.outlook.com (2603:10d6:102:36::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 18:13:50 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 18:13:50 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
Thread-Topic: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
Thread-Index: AQHXxr95Evrp6hJNQE+Ak6rx508PcavjyK0ggAA2QYCAAAoY4A==
Date: Mon, 25 Oct 2021 18:13:50 +0000
Message-ID: <CPXPR80MB5224B6595B884D669BC14C59DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-35-richard.henderson@linaro.org>
 <CPXPR80MB52241B3E9288764685587103DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
 <c98f2859-d8bc-73fe-73c6-50417bda713f@linaro.org>
In-Reply-To: <c98f2859-d8bc-73fe-73c6-50417bda713f@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4381f6d-3250-42a6-c562-08d997e331ff
x-ms-traffictypediagnostic: CP2PR80MB3572:
x-microsoft-antispam-prvs: <CP2PR80MB35727AAD2ED36154FC53198CDA839@CP2PR80MB3572.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: at3h5KAsrcuLO5SPaNxGMXApaujtNQABtvjfUlMpcFbLaHZwOPMDPlO2hMnwUcJOWAGaH6/hxvY2Nb3eRx8uoz5Oa+cfMtPk8Rb9PkBstcLulnX46WcM+MT1D8pZLxmKEJwq3v9zFTISrKT7g1KsVAx9+MtjyWBczVf/L/CVHs/3xxrRLWK7oLTeX8QQ71ALicVTcdARsNRaJzbUL9fN2rFWGjslJh4C/pTjV0wHl/G9ld8RAjEutuEvgUjwKEx1uzqaKcpS2QA8IM7TdB0KaLFl7SArjX+vJKLN2//1b3IxwfrW2JehFFk6og4in+gNC+o8+mr1745G1KYbUq7+xu4sHlFnazLqgU9OVvEgSdJuPv1Fe8bbr7i+Dw12c/p4fCYaibK0TJYcGG4Cl97tOJdAzig3SxUN6a/YDzuQiYE9wcxjBS03GMgRAPqNsW8YANrl6sM2Ug9Kk8cfc7nCSHL69Z36/1jNYiezBZwh3mjUJw4bjq1nuqbBttNUC9LKKPXawa2+P5Nh8UlgJCijk98oT75Vs3TtD9xqeAcglvPy6OrSPJ8WaumFqr8n/vgGLx29mtNoKUBt0eGsGFHwkKbbsg3AQm6p1u2KhCQTwyzsCxqlmxTVGqGx0AvrOje0j3vSsJqSFtWI5BYAPYM9xsEdYCuU1ovZQU1cGIqut5GQ25fcOM8IO41PN0bGn06N9apE5l5YuNyJHcTI0A9a2N222ej+JkGAXxAcc11li/Y2KBQvxbvuZ+h44k8C3bxZtUa1BJgYX64hMCa/+rCpW/Su8eECYcWfOyo8kVYUFRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(9686003)(5660300002)(8676002)(2906002)(508600001)(71200400001)(66556008)(4744005)(4326008)(83380400001)(66476007)(66446008)(26005)(52536014)(64756008)(66946007)(38070700005)(55016002)(76116006)(33656002)(6506007)(316002)(7696005)(8936002)(186003)(122000001)(110136005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1FrcmFIdG0wWldEaUtaL1AvL0lJR0pqN3ViOEJXVE1NK0xEeE1MOUlHZzNH?=
 =?utf-8?B?ZDJ2aEppVDkvM3l4K1V2VEdVSGtMTTR3ejEwK1pnNkNpYUtZTWxCdXVqVG1l?=
 =?utf-8?B?ZWMzOXV3QW53NTk1N284VkxlUGFDZmZHLzdqVUtSSDVOVkNpczk5ZDVRMHF5?=
 =?utf-8?B?b2pYVXpBNFhNQWQvbDBwQ05MKzVCRXBDVDFualZEcCtHNGVGTUZlZnZrL2RQ?=
 =?utf-8?B?bmo5MWlmMHhRcUlqNHZWYUZ5OFRGUDcrQm14RGlSVGxMN1dqZXg3bFBoNkw5?=
 =?utf-8?B?RVdFZlNpb0ZkcUlFTUliQk9TcnZtcmhlRXVLb2w0b2pWVlhuOXNmVVI2SHVw?=
 =?utf-8?B?MEdnaWYyN3JZeExVbU5Xc216eUU3S29Jb2JMSmZyR3Q4V3hCck5QSXJvY2h3?=
 =?utf-8?B?Q29pZGpWYjUzMWpIRXVjN2FiMENRNXJqeE1jejdMZEVVU0IrRk01cmlWRUlQ?=
 =?utf-8?B?S3ZHV0o5ckdqWk5WdW5WOU50NjlJdlJ5N3NmcnlOSURyNnZaTHhyYTZFQThK?=
 =?utf-8?B?YVJkeU02cnlDanBObE5mS1JsSTVoNWp0aElzdmxPSjd5TVVXSnhlNGpVeUJV?=
 =?utf-8?B?bmxxbmxnUjY3eXJicWU5bUN0WlJPdUJjaHNUbDBENlNEVXBVTGFNZjAxRGNr?=
 =?utf-8?B?Y2lVTGs4NlRlZzYxVW9wR2lzQWprSWVEc2lQaTdWTXVGUFVObjVDWFBhZTRz?=
 =?utf-8?B?QXdTaG9sUER4aW9DdWtqWFVQcFY5cXYxclNaM0N6RHBobmpGSWpKSzVhRGxr?=
 =?utf-8?B?ZTFEcVM2em5PbC9Zb015WnZVK1lTNVpVN2xQdFNCSmdaMUpFT3Z6d00wRDFy?=
 =?utf-8?B?aGhSdzhKSEFTWjBqNGhYd0JXUDF0SHViQkdHR2lBZzc4ZEc5Sy9tK3IxM2Y3?=
 =?utf-8?B?VG42MytSZW9PWEFObWgyYmpMZ1NvVXN3TERlL0tiTWdKRHRUSXB5cmtRVHBo?=
 =?utf-8?B?U0JxblJKVHl1R3Z6RzJPYTJsM1ZhNGI4WnFjeFc4MUMrZmg2aHlwR0lmNTZN?=
 =?utf-8?B?blozV1F1RTVXaFNnMzUyL0liZnVSQWs0bGtWVDd5MTJOTmdzNGNnOCt1dm9a?=
 =?utf-8?B?dWc1THNGV3Z0ZUU1YndybUZGdmQzd3lUaTRCOWYxU3dVaEJNOUkraFZVSWNU?=
 =?utf-8?B?dXJXOWs4R3RWLzZuVkk5akhKWW8yZVNXdnE0WXRjZVFiWmIraHFhUTRQamF2?=
 =?utf-8?B?UnZVVjdEZzVCY3ZxWFF2Y1IxbThJLzhWSHQwSjRMRm1zOXd2THp0TWY1akM1?=
 =?utf-8?B?YVdQOTRNT242cGdUTGNlYVJOdDZPQnl5cGloV0F3aG81d3dvTjZFbjZCenVw?=
 =?utf-8?B?SlZDWGtVck1wejZ3RmZVanp5aXcxeUs2SjFEMGFzZXNHQmF0MzNhTW9xays4?=
 =?utf-8?B?ZFErdjNQSVF3eXA4Ri9oZ0xaRDZEUlJSQ00rRGIzelc5SjJicnVQdzFpSzMw?=
 =?utf-8?B?TXZFY1A3N01BWFB0YmtaNDBFVWlUSVpCclQrRzF4QlJ3em5CV0MzK3J1S1By?=
 =?utf-8?B?ZGJKRkdobi9hNEVySE43eEdlWUtnSWwxdHhIWkx0NnJjM3ZjZ2Q1RitZV2lk?=
 =?utf-8?B?c2cwQmRteG9uVkwzTDRqWHA1NG9MR3lxbFdiVTVUSVFMOXBuWHZScmFEMk9K?=
 =?utf-8?B?VWdzSTFKMFhRaW9IUk1KSzB0bGN0eFRVQVdNSmVURi9idklralM0Yjl5TWVK?=
 =?utf-8?B?UzF3MmE5ZGJCdUhGUFFjTCtlSHFjL01velVrOE90YkZlT29JNFpSNlk4d21s?=
 =?utf-8?B?bnR5S3RrSGgzMlVwM01sYzJjRk43Sy9sM2M4bHpvSWtGRjFpLzVBMEFDVi9R?=
 =?utf-8?B?VlR4ZHVLaVg4bU9maDd4OWZoS3I2aUVzN05kOFZRa3BCWHZMM3B4ZEdWbEdn?=
 =?utf-8?B?WGI4WjFUQ1pjQ3JLeXFRclUyMEN5TzBBUXdLcHBHVnBwL1NUQW43aFd2dUp3?=
 =?utf-8?B?L2xSbnJDdFYyVkNXaFh4WHNyTXl6V3lYVXlYRkQ5cnhlSTlnYnFXTWduYUJk?=
 =?utf-8?B?ZUt5QnJIaDRFeFM2Z0NjZWlkS0tHeWIrNDh2Y0lQa2hmekplRnYvY2hLWmd6?=
 =?utf-8?B?MkJXbFJwTzJtZWFPTWY4ZmsyRVZvRHNtT0JyTGRHZ3FJZjBSZmE2Yk93enR1?=
 =?utf-8?B?Z1RVc0hyRDljejkzSEpOcEhpUGxRQ0FsL2F3NmMxck0zdkZBZFpuOWpRVFdn?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4381f6d-3250-42a6-c562-08d997e331ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 18:13:50.1472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCsi6uLRM7n+ApTKqbd5yCPrkGK4F574PketpTaah1KboWmXizN+7y+iYHTi7G0YDrWnVeFfXcAjngaJe+wNbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3572
Received-SPF: pass client-ip=40.107.82.109;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQoN
Cj4gPj4gICBzdGF0aWMgYm9vbCBmb2xkX2VxdihPcHRDb250ZXh0ICpjdHgsIFRDR09wICpvcCkg
IHsNCj4gPj4gLSAgICByZXR1cm4gZm9sZF9jb25zdDIoY3R4LCBvcCk7DQo+ID4+ICsgICAgaWYg
KGZvbGRfY29uc3QyKGN0eCwgb3ApIHx8DQo+ID4+ICsgICAgICAgIGZvbGRfeGlfdG9fbm90KGN0
eCwgb3AsIDApKSB7DQo+ID4NCj4gPiBTaG91bGQgYmUgZm9sZF9peF90b19ub3QgKG5vdCBmb2xk
IHhpX3RvX25vdCkuDQo+IA0KPiBObywgYmVjYXVzZSBmb3IgZXF2IHdlIGV4cGVjdCB0aGUgc2Vj
b25kIG9wZXJhbmQgdG8gYmUgdGhlIGNvbnN0YW50IC0tIGVxdiBpcw0KPiBjb21tdXRhdGl2ZS4N
Cg0KQWgsIGdvdCBpdCEgVGhlIHByZXZpb3VzIGNvZGUgd2FzIHdyb25nLCBhbmQgSSBmYWlsZWQg
dG8gbm90aWNlIHRoYXQgZXF2IHdvdWxkJ3ZlIGhhZCBpdHMgYXJndW1lbnRzIHN3YXBwZWQgdG8g
aGF2ZSB0aGUgY29uc3RhbnQgYXMgc2Vjb25kLg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRv
IGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczov
L3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

