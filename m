Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B643CC5D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:37:39 +0200 (CEST)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfk3e-0006KO-Pz
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfj7M-0005xq-5c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:37:24 -0400
Received: from mail-eopbgr740114.outbound.protection.outlook.com
 ([40.107.74.114]:59296 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfj7K-0001Gr-4o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:37:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTDsIDcJZS+sfighAWHXOFWGJcqCwyYF/LZuU0cehfb0qBwhRnqkm6Sk1m8V1Akb+itBn5u45zBTYK462HZLrrnu+P1b7zJH0aey4LL8qeiSn+65qU0GjBTLR7lJRdq90ok30BXcqbM3NH4IB+R+IrZNoDud7LXiEr8dc+SVIX/tNvHY9wAoXVxklnjCPNiW5dKDsDCmpdPIDFj0X8XyVWPLCi8D5LyyJb02i06vCnMLFC4L00W7Fb78c0s91XR0YkKPOdMl3OG0rJZXueCqnd2qQCIkY6SaDLTpM+J0c2/IKrGMyNUXic68qWztcB/Zr4cB/t0QfXkAmPPsk4UVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRV/X7WlR8zH9Ejxezw8phRrgGeatBFHXHkXYQP39Yo=;
 b=AE6Owh/GdewhypZQMEwWFeLvif2q5YqpU6jPYFkfAXUhikyeyrMmKMrHz7xHBpp3VGiRLEThSmv7FXIcuCD12i4Hu3oB9OyKuRoBIGWC1d6+eLYq4AhbtMJDmd+bUNDS8TjklHdn4edIhRio8RxLrLt0t5rEe6adeL1jj/1Tz3dG1nzrhJYX8pLqKEx+4Ih43gS6IacWhcMpWOKZlieM8EIx4ADRBa1IvkhVXkcoq6R/1SBxir0mQvGnqLrsmAgVETGKFsViAPIGm8y6vNZusOFL206SD9NVQTY1FHgU91q127kL06QRDKtEt030lB5YcTArZKYYVj4LC7iNhEBKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRV/X7WlR8zH9Ejxezw8phRrgGeatBFHXHkXYQP39Yo=;
 b=pG02RwQNuRQC7EnGz0mDNjqIAS/EKZBLZa2zPYsBJzAc8V4E6JMoe9G1eYU2TCC2sGnIIr0SgKo5K36thjy3J3U3rK/4Voqrif8PHtBfCjUGQnU/z9O7o+mJM+uLpT4zfV9LGIsrMJDbXdQf2Ztsm5YBme2Jxtn3rRDEcBeA8Pm4lBcs23qk+M6NqCiQWc/TsVAxIl2WaYLkicT8me62KLGZX8sfVzKKwbiEeg08i06VczMIvpH5El9dmqBK9qL1CtCAG2EuZlzYZs16gsFWoj0/3rNliMa/yh+TZ350Frfj8tghlKdAjQr9wUP+9N0J0UzSnxkkLf+549KfQq7iPg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3682.lamprd80.prod.outlook.com (2603:10d6:102:30::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Wed, 27 Oct
 2021 13:37:19 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 13:37:19 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 38/51] tcg/optimize: Split out fold_masks
Thread-Topic: [PATCH v4 38/51] tcg/optimize: Split out fold_masks
Thread-Index: AQHXyr6owZOYefLyz0iUbOQdFYpB9avm2ULA
Date: Wed, 27 Oct 2021 13:37:19 +0000
Message-ID: <CPXPR80MB52242F3B72B2C0FE3319BDDDDA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-39-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-39-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eae9c7b7-e62f-443b-dc8f-08d9994ee5fa
x-ms-traffictypediagnostic: CP2PR80MB3682:
x-microsoft-antispam-prvs: <CP2PR80MB3682423AE55BDAE558DEAD66DA859@CP2PR80MB3682.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nRR4NPnZV892fj9EYC2yC7AMIXkX5fKio5RYT6x1VxIwKZ6bjNvYaq5TSEcWJ5tHsO3KYX3QtvOFooMbIxQItEISj6JY2jZwlPkMsdTJsS6WcxkSblhmKEYD6bbpu88mhdTSaw18les2PV06osQmpjuNM1NoaCg8leYd5NwyuIqoT15xv/cJ6fGtUbirtxEbO83Z2rWH76XBdxYgLlVBX5JQiIK/uw4iky2UNHHkRi4XRiHFJUIHxYXn/DGnizxTBBUXLyYjvGHmbMXTrfMzKB9Fpxh0lZk4sRO7O/Rb2BmkghEtEt37vjkQLZnFU8rSbylAkDEZFkKCYMitip28J0LBaj/kK3f6gPmvQjjKJVcardtDYIb0AhRGQjt8235QwTR16+TNOe73r/9CTnRYow2i1al/kZ509f8vX9+J2qS7hwhZVBCHXHTQUTCOWnQACieNtQWYxyH0RshR24N4zgXOcBHajtZgduj6Uz86ggWA4lHaFUIkR+x0VAzgbSHEBiiPGDfKkkG73344TxUBonCUmL/DwDS1QZwt0AsFfnFXDJip1hiyohAhsg8cSybC506/ysbeiusG0MYbG1dy5jxzo9Pp20gB9RtXI9ii4R8XgoubFhKkfAjfOmfFxF6d7u1RiBD3a0/GDvQOWfItmHk6pMFitbitlNbB7UubcoVW4vL+SRZe7C911PEJj8D1tRURMCW+bgo7k4rbzcZoHnEGfRLfe0qnNfArYVY8WuFhzzIFcJ3pL1os0CdqMmVtC2Ud+/e/mD1JgalXlu0M4sgTqMd8v/12ypJyocmm1GA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(4744005)(316002)(4326008)(122000001)(86362001)(55016002)(9686003)(110136005)(38100700002)(33656002)(64756008)(508600001)(6506007)(7696005)(2906002)(66476007)(8676002)(66946007)(52536014)(71200400001)(76116006)(8936002)(5660300002)(54906003)(38070700005)(186003)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVVQaEVGak9KM1Uzd2MzcEpiY0dIUkpOM1h1VG9RNzgyYnEwQXBxQzMxSXBJ?=
 =?utf-8?B?K1dHR1d5dmowSno4SENOYWlGNnFhU3k0R3NkQitjS1FXb2hLUFN1Q3lrcm4w?=
 =?utf-8?B?MVF0a01ZTTZ4T2xUSE1yc3pxa0JxM0lFM3haaHlyWWY2Wm5KQ1k2N05kT0pF?=
 =?utf-8?B?cklESVBIZGRoSHhyUDlDaXA2cWhOekRFQXVxbTF1b0h6VmV1alpCZ1kzNkov?=
 =?utf-8?B?dlBzaDl4aklqQmdOUGV2eDg0NklMZ2d3RTRmd0ZiS2NTdlI2bk9MOXlKek83?=
 =?utf-8?B?UHdYSkhEazZ1ckxwOTNZL1owM1VKa3F3Um9xTFU5Y0ZkSTc4WVlFbjIzN1JX?=
 =?utf-8?B?dTJEQ2lQbTV6WVlzanBxeVl5eGJ3ZjBSWG5YOU9qUjJoVW1vVFBGWXNJc0tv?=
 =?utf-8?B?UXFQUW14ejRHd1lzTnJmR3ZMQVZTdndlSEpEdHFtV1A2QkNZdWxwb09Bdk80?=
 =?utf-8?B?UXc0MW9XbTdTV0N2UllHME5SV1ljQ0hISnBIdDJzRkZmZ2pXZHVYNFlUSEwy?=
 =?utf-8?B?QlJXNmYvQjcrdjJEaGV1VzhxY295MWZTUGpFWXhCbmVCZnZ2MUZGcDJ2ZTZq?=
 =?utf-8?B?MmtHTEpTZGhYdmJza21ianJZSk9rb0F3b2duTmhyQmpSSWJSdVQyUzZQVDU1?=
 =?utf-8?B?ZkdMWGw5Qkk2aDh0VnNjeGVRYU1wTFJUREdzVlNIeGZIQWY3bTBGQzFMTHJF?=
 =?utf-8?B?YlllRm5zck5DVWhkVTc4L29ONit2L2h1U1FEV3RCdzA2S25qaDZrMFJZMU41?=
 =?utf-8?B?SGtlMkFHcDhmcExaNlhoV1lEOWFCazVISnJqZHE0eTBCQWJycHR5ekNvZGo0?=
 =?utf-8?B?d2VYaFZVV1FFWHBuY3JXR0JueWZMMlV5UjUydWxuRjBMUzZxdW1qZktUR3hC?=
 =?utf-8?B?M2NRRmFaQUh1d3VDclYwUVJPRFNVQXZZRE52VlppZmNLT3hOLzNHVzVSNXd3?=
 =?utf-8?B?Vk55R0c0Y3ptc0ExR0hQdVZ5Y0hHalpXVWlNMmF1RTlqbkh5TVdzV2w2bTE4?=
 =?utf-8?B?dk5wUFg1Ym12Qm83a2JqSlJGSno4S0MyZGtJWUJpVVViSVF4TTJTekRkT3p6?=
 =?utf-8?B?T3l0b3Bjck1VMWFDckcwbmIvbFcwdC9abzU3amt2UGI1M01tN0hwVTg3QTlD?=
 =?utf-8?B?MkVLaXM2eXk4RU9BNzVmQlZRTkVxOXFSMjBLWjNVT0ZGakpjcUV5QXJSWnZv?=
 =?utf-8?B?WmhUTEFZK3NPR3lyK0FPY1Z6d3dVa2hJV1ZRaXc4RU9ORHhDYUxhb3FRYmhT?=
 =?utf-8?B?ZlFSUnd3cU1SQ2F2d09jdjBDSTFGUEx1Tk5LSDRnSmkrQndHWTFVWDV1YlhU?=
 =?utf-8?B?dUEyM0dEdW81b2RwdTlITnpGaUhzL1FZU2hlbmc2bkFKN1RJU0RXeEVjU3Rx?=
 =?utf-8?B?VDk3cnlmNzFBSDRsSWhIOUVhYWFlS3RtZjhneFAwNmNLbFJLUTRnNE9TV0Zh?=
 =?utf-8?B?YWIwM3hLVHZHdEhKNDNiSTZVVXFubGlUUWlxbk5YNG9zNnZvTk1ia3FVbVFa?=
 =?utf-8?B?RjJ6TjkxaGZNbkgrMEsxdU11NnMxSldpbHJPbHQ0TE9vd3BGTk5VVUJkOG9H?=
 =?utf-8?B?T0l0KzNzd2JHbVExV0lXdmdqZWtCRnd5c0xUbXVLeWQydnJsS21UcDhYdUZu?=
 =?utf-8?B?OU04R2pYL2JVTElZVURacmhQWkpuUmEyL05icnBUdjFDYVo4ZlBDSFU0Mk9T?=
 =?utf-8?B?aHprVTJpTGhlRkRTYnB6dVA4eThxTnZHUk5DcDBYTW9hVnRGcWc2OXFoZTBI?=
 =?utf-8?B?THMvYTVhYzJlVnVWRkMvQnowWEluQlJjUUExZFpUV2srR2hvZzZqMTdpeTVK?=
 =?utf-8?B?UjZuWmtac3pyQ0RwK1JJVWdURTcvenB1UzhoMDN0cVlMdXRBNzJWSkJzdGcr?=
 =?utf-8?B?d25zcXlub3QxbkR2ZzFvZEZ5SnJEYlZ6WU5oWnB6MDhKSXdRc3hqMkdxdGZ5?=
 =?utf-8?B?WHJGZExDQWdNNlZ6cDZYNzduRytBZmNuWk1QcWJzejR5ZTJzSzhYeTBHVnow?=
 =?utf-8?B?QmhMR2F0QlRoTEwvU0NyMCtEaTdiMHNJRUVlL25LcjJqT1hubkY2WUVQY0Vo?=
 =?utf-8?B?RkhrVkZsM1FmSUlva1pLYUIvYkhkMmNucWJLdkIybjJhWmVnczZlMFpTWnFK?=
 =?utf-8?B?UHdWajdWbG9OaFhqRXNTaFVCQmMzaFFZeUhNLzUvK3Z0QnF0VS9JK21PVU5Q?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae9c7b7-e62f-443b-dc8f-08d9994ee5fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 13:37:19.3578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FagGU1SnSBRJvmg5Sv0ym0FW+K4UbGi0PqO9aCN6J34bg9DjckpTmDo2rEpG34n3OBXkOzQvuksR8wh6RapFyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3682
Received-SPF: pass client-ip=40.107.74.114;
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQoN
Cj4gQEAgLTEwODQsNyArMTIxNSwxNSBAQCBzdGF0aWMgYm9vbCBmb2xkX2V4dHJhY3QoT3B0Q29u
dGV4dCAqY3R4LCBUQ0dPcA0KPiAqb3ApDQo+ICAgICAgICAgIHQgPSBleHRyYWN0NjQodCwgb3At
PmFyZ3NbMl0sIG9wLT5hcmdzWzNdKTsNCj4gICAgICAgICAgcmV0dXJuIHRjZ19vcHRfZ2VuX21v
dmkoY3R4LCBvcCwgb3AtPmFyZ3NbMF0sIHQpOw0KPiAgICAgIH0NCj4gLSAgICByZXR1cm4gZmFs
c2U7DQo+ICsNCj4gKyAgICB6X21hc2tfb2xkID0gYXJnX2luZm8ob3AtPmFyZ3NbMV0pLT56X21h
c2s7DQo+ICsgICAgel9tYXNrID0gc2V4dHJhY3Q2NCh6X21hc2tfb2xkLCBvcC0+YXJnc1syXSwg
b3AtPmFyZ3NbM10pOw0KDQpTaG91bGQgdGhpcyBiZSBleHRyYWN0NjQgaW5zdGVhZCBvZiBzZXh0
cmFjdDY0Pw0KDQpPdGhlcndpc2UsDQpSZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJl
c0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVp
c2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9y
YWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

