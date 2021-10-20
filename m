Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA84A43560C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:44:40 +0200 (CEST)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKK7-0006ST-Sw
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3r-0002qc-Cz
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:51 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3p-0006qY-RX
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCMl+h6M25C/Ob4lWhHvkTrOkpQxhtLEKom82Wk4hJG3Tdd0yLaomOmamMqCpDcSvjmmi9V7VOH8J114PGiqQpprsUqa2+RzHRcTG1j3JGoDY1m6OxZG1AuAzZIJeoKa5ctsO1gg1WbQWTO2UVBzK0piRhjRwBEtoTLTnoiP70Pow29Zt3hJI8OuL+O3jSLMWa6nAUotr4JubP2jqR5eV6ybWFplppjq0eMeJLMsVu06a6srNI5ecyu+fl3S4H8m5FAmLEgs46fEszvxMi46v75VGLcEtu5C1D5IIGGePZMdOVhgkF5MhV47eGKjm4gzpgIYJMFgd7V5L/TO1ddQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmvhHXPAl7dLSUMWZDkrmMNUGuWGsl9aKdH4vAEzisQ=;
 b=AKtiKKVV9rA61lDNQufJVcv1hWdCcJiU7IVQiwQkc5Zdz6h+paEN8MhJPLhsh0zt9DKZUIOZ+AuM7wq6jGmmrvXQa+fKNhXCpvy7iO4ZgUVikUQUEHpy/w9K5rb1PzpBfpjWAAzRdutH1BojDn5WuBUgUR29qmhXpZO4TZgbW1+we4eKbcYOOn7AXwoybnGwWTYRUK9LPR3uRlTWCfTdX/sc5sdhwSvC8mDfRUP11hC7qkVUgmq7AH5+SX8aVxEYRmz+aDy+8G/6KsuP74Wj3xCKgxLdsO5hzwFoADpfcGRczVkF+uh6HhKiUoJl9NGUVEPWx3ZBFT5Quy0zeTr4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmvhHXPAl7dLSUMWZDkrmMNUGuWGsl9aKdH4vAEzisQ=;
 b=SBZA7+0UIaHd6jJ4/r8t9aWCyvGOitr+EC2ndykyFk7G2U6x3cxq/r4RTKAwzudsAtoZDAiKX0KXSLCR4v6Qi408rUvaw2Eufgw0ueu1DqTQtQvBri4pV60DJAMsfuQdsEEqSOJPlFWCHX/SWFKOsSoDWsBQ1oDO7grX71NeKkhYtklObOjWPbeA0f/9s+2qtVyeZmezoaEO1TQquKvZmP1gLlzc4CUOTx1ARGbjZIS2//JShjcBetxHPuAnP829kLEDlc1Hw4mq6Cm2ZHevX6FaYl50SoSxcwys8KidofEX2NDdSlVwZrCMqEpusO3mErzpnOWpt4oWdQR5zQrDUQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:25 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:25 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 13/48] tcg/optimize: Use a boolean to avoid a mass of
 continues
Thread-Topic: [PATCH v2 13/48] tcg/optimize: Use a boolean to avoid a mass of
 continues
Thread-Index: AQHXu7ao38c1vJeGKkadWsw9TxPB6Kvchx4g
Date: Wed, 20 Oct 2021 22:27:25 +0000
Message-ID: <CPXPR80MB52248CA59663DFE9190A06ABDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-14-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-14-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a0c4326-9e74-4cc8-2b31-08d99418cb07
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB448295CBB9CB4103D56A04B2DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BVooFz36SDEi3EsoX+It7dyjsU6DRuVwVUHkbdI1mnHxMZ2dMyenFmmSaLc97wPyY8dQV0Z9uRSrSO66QErg+wquHe3NKoG0nhR0KxLOt3g7r745w7askdFJyfOangvEufHBX6UPfHYJxyWq5fUAuDq3ExlyBQNuCM5xm9FrYN3tnMFM2qyUMr4q8MHnhIlDf1oaMc3rsRgmhf0RQOl9unjJPcFFMU6F6VpUf1Xm2xqzzV/bQIKojSzLcniGZnSe3qHeSTXx3ldAMbNl8nrLMwhOzoTo8ZDVQFje9HSlBeoZ2tFwPmXJk+L1y0FeP/vzK/5AJur/Vm++J1OofjEIjZJ98uvmEf00Vi2pMm3GW2lopEynJmPHo2M9T/2G2uO+VBiRcTZ2ZqJiRD+qxIufroTMBEsZKtb8dqg3iNwmu9Tcasvnp2RxWXeiQGxOHf601dRZw02OdTTa6BfmE4vKbX5PA+5GuRM8K0O3+CiXt1tmFgBnzNN15tMEUCkSm9JyGFNJkL5F47qYT6Stp/vHb+HmVTwvGDVconWD2LfF8AojUdalZ+nLryWRCHj/nA9qnEeoe+rvrJunOf0OTvq579P3BWROptRqHXpv+QV1JM1h7yvI21Vzpnd2KsjzBltKY7pC5kUhZmGWKrli9ISYvd/0IxX8onD1G9SdOZ0Gblg6D/qGOcuF6cmfEyJhkRefZei6OkdzLAkbfkm5FazLTp6QayphMPZ+0GXQkcIttQGRvwNPmIzfpmIQguUKaWPeIXB5wbxsw+o7R0k8h4SN+moVFmCizY91hw/8SioNz00=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(558084003)(66946007)(186003)(4326008)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VndCWHIvVG5MNk96V0RYd3dOcjZxR1VRVGpudkNCVXV3aTJ3dEN1ejVCazV4?=
 =?utf-8?B?ckk4UnpuTGZTR3Zvc1dSTkJDRFJpTTNHc1dxT2FvY2hIOTZKS3JQOG5vOCtO?=
 =?utf-8?B?emUreDFTdlh4N1A0dThMZm5TaHhwTDdxNmZWRytBNWswMEhyaStjRjBjZDA3?=
 =?utf-8?B?dHZsYW0xTWQzRGU2eDlBWXZvbkcvYmNSSHFQeVRrbjdYanZ3UzYvQWNYc1cv?=
 =?utf-8?B?bXlpWURMV1JZalI0MUE3dGVxYmFaTGVkK1BuRmNYblhtbSttdGlSNGVjbEJR?=
 =?utf-8?B?V1ZHb1pTZGxLclZ2Z2JsTkhVZTRFem8rVkpYbUpGNm02d0tBeTE3WlNQcXhN?=
 =?utf-8?B?UC9tc0pvdU9lTUJ3ZXI2UlJTZjV6WFkwUEszWk5pZ3JXdTk1SDBTa21Dbkt6?=
 =?utf-8?B?NUVjcTBzR3R1bklJOERWb3BRUTc0QzdCOEhjOXljU2s5QnNLalJNenYreDVz?=
 =?utf-8?B?dUF1MjBmN1l5M0xtdVdPd1Z4NE9jQW8vNFZWZk9iZSs4TFZhOHBIekFDTmhI?=
 =?utf-8?B?ei92Yk9ZaEFLM0RwbWJMQUdqZnd6RzE5bHI0T3VJaE1tMkVFbk9FWmJPdjJj?=
 =?utf-8?B?SndCM0NpejVmOWlpaWFLekxEN3Q5QkJuQmlGUHhZVlYxM2xnY3hGL3Zud0dP?=
 =?utf-8?B?c1pjMi9LMWNnNmlma1FDVlQyODA2NDIxMWoxQWhudWxDanBLTFkwT3dGNjJX?=
 =?utf-8?B?Y2gwZytvdnBkU2ZvR3o2SEsxNitnZWEraFlOalFxUWRudU9FNFlLeVBHYy9F?=
 =?utf-8?B?VkFtamkzSWpTUmE4Y0g1MCt6R3pWazA4bUpSbzFYY0RXUThaTTVrZmdHaDFa?=
 =?utf-8?B?UllSOG8vRlljYUNLTVdBT3lnVmNURlkyT2ZmMG10TmxxeEkrWW93K2tzY25W?=
 =?utf-8?B?eUE5bmI3OU4wMG5WMmhBdmh6eWV2R21wTCszR2doZlBhRjU0ajR5WEM0RWJr?=
 =?utf-8?B?VFd0ZHpNUFB6TnpiZXROTk9UNVRUUysvS0RHYjZiVFRsVmwyL3VuMkpoQnNt?=
 =?utf-8?B?L05DakgxNFNYc2NPeDR1YjFBV2oxR0tySGRGRHkzQXNkclZDbm9uT1gwaVZI?=
 =?utf-8?B?N3A3NlowQzk4NS9NVStEL0RadGdYRisrRzducTRGNngwY0dlcStDb0lKb09G?=
 =?utf-8?B?Q3hvSWhnai9rWjdjUnhRYzVUQmZ5MHZGZE9rcE9PdVBBaEloZCtYc3JNa2ps?=
 =?utf-8?B?S1Y4cVlhOGVtRUNzYU1xSXF4eWVvdUpxT1gvdVFpNS9yZWRTNGdUK01LTzFE?=
 =?utf-8?B?YTdZU0I4VDRFWlA5N3k3R2hFS0tKdW9yVEJmc0lybGY5WmpKVUg4Q1NncXpT?=
 =?utf-8?B?bGtzVE50RHpESHc4aDVrMHZJSG1PaUYvclAvVzZySFdublF1OUtRM0oveXhk?=
 =?utf-8?B?SDhXNmhPVEFFOWwyZEh0WmNXNWkrTEJxd2pOODR0emNlMWRRWTgxZXVwV1Fh?=
 =?utf-8?B?N2R3UVprNFQvcG92WmZrZnB3eHB1dGFjUGg5MVdxSmVxUVFTdERBRHZJNHF6?=
 =?utf-8?B?ZS9kMU5PNkJjVlQ4RytWcTNTSHhkek1SN1NxbmNFTDF2QUMwQnZHQVROMkt0?=
 =?utf-8?B?R3MxU2VNeXhDUlEveTYwUHd2WnFuVDczOWZIL2M4anNmOXVrUEhGUVpXQm1j?=
 =?utf-8?B?UHVWajhNTFlLN2psTVgycUFKQi9RUVJ4alZNSW9KRFB2LzF6Ykc3aVJTWkxk?=
 =?utf-8?B?c1VSbERwaDFyT2VEMEE4YkJXMythNVZNK25yL04wVWFDRkZ1SVV5Q2Q3WW9X?=
 =?utf-8?Q?B/QV7t74605sTygpkLur26L9yuy8nttey69+MDU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0c4326-9e74-4cc8-2b31-08d99418cb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:25.4207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUuYyB8IDkgKysrKysrLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdlZC1i
eTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpMdWlzIFBp
cmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2Ns
YWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

