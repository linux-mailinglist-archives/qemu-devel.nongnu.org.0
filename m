Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05B55529A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 19:40:18 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o44Kv-0002EU-B1
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 13:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o44GB-00074l-71
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 13:35:24 -0400
Received: from mail-dm6nam10on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::721]:6628
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o44G9-0001c6-37
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 13:35:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFQ+4d+lzDazjtE602NqY671Wr6hQYIPYernH5P5JxttaIfUGoUa0cRQEFiZNTG/nJuspAcUu7r9kmBc0wkKC+Uf4InSViz8lSHzYOeN5Z1/lnfvghDY8hm/tlBGT+qJHZHr/lNEA7mezqx6qW3VPI92okpEdDoBrscUSkHQlLIh3MVmV55Z9cSKiqtPXKLm4V4D9X3hFoGR7eWxIYK27l3LeqscrriUsZzPfZBNcytI8sraE9LZG7VN7yAI9R00aprGWG1ArefwlY/scQ4d80QOC4RDCLFmB4v49f12OzoVLqvIe/C+wCBaPuNCHR4sEFx9uc3G+oUN3otmGESgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKspiJp8oBuZwRhENOavil4f3yDiVR+YUZu2kBx26sk=;
 b=mlh3Rv/W+3vl4iNpN5RLKQY8kocnij4NEvD9+NVXCwL4241qc4p4Z2tjiLt/KAmfNOOK6rq8w1f3WKMZW1d76LupOfYYgyWwgBx7Tc2xt+hHRrvYtd8OhGaZaiPjan5rPGK31vzVIvkiQyoK8W0RlDNVTOBtZRCckZezqJVF1wgKYSvxSfbP7TirsZujDAbHCgNJ8mZwek8m5Vur1N13B6u+lzzGzLeYbdtZ1hodzg18iT2VlqJkh+H4xJs7EKEPiLFTFHZtzklt98Tho7RjCWdC8qucHpiLbkMYA5jWNU8Flcfv5uFENxqMGuz0RB6FEMyLY75bS3ZghrVAtM5IXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKspiJp8oBuZwRhENOavil4f3yDiVR+YUZu2kBx26sk=;
 b=0KAbx98/RY1w4lk6m8NyTuR2o7Uz14uGbKCPyVVszSdxUS7/GzkuAPJicePGlZIJQA4ri1eiW+8Vow199HFYyLfs1L2AJW6gLNq5sUaDoxu/pGzkcyVE6ol+qhKoAZpMnvrf5PVPz2s3nXx+EPxlUdukynK+FktcILMhXEiZK3zwnShAd/5VPuT7EQTD6qbBqSzUxuHeIMOkv4ZpYzRrksIi7/qcxuAtsBUd8+KYWYN3zfykJpq/XMqCZH7qB7toXZUX8VlhHOSCsvCL6X6tV3rzmPvMkLt5FPkkWnZgKzjkhPz87Cp2A/ATuj5B7tKLG2kW5kjUgJz27TfVs6LzKA==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by FR1PR80MB4969.lamprd80.prod.outlook.com (2603:10d6:203:a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 17:30:14 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::e50a:4522:5dff:2f1a]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::e50a:4522:5dff:2f1a%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 17:30:13 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] build: try both native and cross compilers for
 linux-user tests
Thread-Topic: [PATCH 2/2] build: try both native and cross compilers for
 linux-user tests
Thread-Index: AQHYhj6smxff6n1TKEqdbuwQ34OOc61bruEA
Date: Wed, 22 Jun 2022 17:30:13 +0000
Message-ID: <be54d319-6a1c-9b45-0541-1913685ea36a@eldorado.org.br>
References: <20220622134742.139306-1-pbonzini@redhat.com>
 <20220622134742.139306-3-pbonzini@redhat.com>
In-Reply-To: <20220622134742.139306-3-pbonzini@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbbe8a22-2342-4fe8-09f7-08da5474ddb5
x-ms-traffictypediagnostic: FR1PR80MB4969:EE_
x-microsoft-antispam-prvs: <FR1PR80MB4969E2A2BA357365E213A635A1B29@FR1PR80MB4969.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ubxs+bUy9uiLe8nrH5xhcZ6v4hJHUB7b67C33s41piiPOH7VahkiYZ+3uJczrKlwTspX5ccp6nKcV+51LvuRP5UMH9lNAUOg4FPZ19cGYaIXIepbZgIddORAf7daBlwPuGhc7lfnzPJb2ucTqLVkVoAjRbnF/YXXcPk8XQrqAusW5DwnUbKA7VuTKDeVAm3Z373/yPdtJLzA9pfwX3cXAxj6x8aEVPcOk83BZL4cP71OH4XDvU2IOtW4L0Z8IYCMCNVD4bCwNTKeYzFp5i9tTtPGUzVjE7n+5SURYDOKf73tphIvEA5y7b8NvcLCupmxsqiXBifyVnkE/Vpuwz7JkOEyfnEMMwVX8DOkGQhlT+KgyOrowGIq1o+VHcnN1SW0crmLepdT5ARyfx1UWaxp6jAiGf0o3nW170GTtX3D1kHSTEB0R3Q2Pb/Ed+sdba3LNNIYGjwx/eYssRHY4bW8KKHTxuT+wTWIS2mWrZAUhAe7uDi3zvnDIxQW+XCuJY6J/u6xi8pg1yq1JxFqKsZLq+ezNhDre9Ab6uQ1e5355vPU72o79YSogajGvv63/XXdr6QBWjJneJetAWtdnP6uNG4uHyGHFhrm1FcQctdazfOY+5bKVT2oltVJD2YuiOC86hFJQlAYWzkYWrY8RCfbn6BRnowzQFWnlTBBDrDzynktx7wOddVIRaYxpNf53d8k/e2YkfREh4sDYYSel7DgsEwEKJRyfDNOjvln+2QLLIRZeQka1GjK4AVZpGtdzOMzk0UU70Ozfh7nPVMRGvdz3isGVANSnJBEUDfyfTyd1CoQW3gNv4E17su8fH7JXDDV55ge/b8+fK/BXonxfqxlmbksGyM7ZfmY2CclKg97VYDkItUhZsj+vOe0TZLAhjHF3tU/Tj2MrnXUzdEKmPiqyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(346002)(396003)(366004)(376002)(136003)(41300700001)(2616005)(316002)(76116006)(38100700002)(2906002)(110136005)(31686004)(83380400001)(186003)(38070700005)(8936002)(66476007)(8676002)(66556008)(4326008)(71200400001)(54906003)(66946007)(86362001)(26005)(6512007)(6506007)(5660300002)(66446008)(36756003)(478600001)(122000001)(6486002)(64756008)(31696002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU1SS01GMzc5RjFJWHlENXdneFo4QjVFckpsK0tLQXZidlFrRFUza2UyQUMz?=
 =?utf-8?B?MXdhUjZkSERJMHlQWWhNR2NhWmNFQ3NpUGhUemhCNmtpcDUwZGNWUlJ0V0dF?=
 =?utf-8?B?c0pweDNrS2NXYlpodWhkTUwwa3JISVZsbHk2T2ZxYTBiRTc2YVhwZ2kzdzFh?=
 =?utf-8?B?WmMyYVRkc3p0Y3FhamYzZDFVbGxBUlBVdWF6K0FOc0VnOEVlR0pDUHFzQWda?=
 =?utf-8?B?dUsvTWQ0aGJueGM1TXB5K2gwWnUyK25Yb1g1amdEamk1aXJiK3poRnMxM3pT?=
 =?utf-8?B?ZFg3dllWSXFjRWViemlEZHhsK3pvVFk5a1Q5aC83cGNTMzlJOVp2dDdnTnJV?=
 =?utf-8?B?N0svVDExOWlBNkFWN0tiemFieU1XQkFjNFJtYlJOR2g2VFI0bUkyK3ZEZDhC?=
 =?utf-8?B?YVZOVG10RTE4M2ZSZHBTKzlJYU5POHltV2pXTldPWFgrZ0VGeWpQcXNhemlE?=
 =?utf-8?B?WXRURnp5WjA4Rm9QbUF5a2JMeTBSWStkcTUzcW0xOEhzcEk3aU43amZwemgx?=
 =?utf-8?B?bnMzb2pucFpOdVBsV3kyd21VcGEvZU5xN3RiekQ1ZTBWTHlaTVRMSFpBVUdU?=
 =?utf-8?B?NG9BNURWcWZubUVLcjVnNjVmM01TVnZMOGdoRmRTaDRYV3R4MXRmdDBZdFdR?=
 =?utf-8?B?dHp6OEhnK1Z3aGZmMHVDcU9FWnVsUC9MU2JLbERLT2YwM3VSb2JlNEJCT0tL?=
 =?utf-8?B?cjBCWFpEVUd4S0NWUTR4Y3R6OFRMWlpBbXlBeVhWL1dIc2VHaVZJR3F4cTRs?=
 =?utf-8?B?akJ6cCsrQTNSL0N6b0FFSGVValg0UEQyckp1S2Y0eEpYYXNGYThDRW05Uldi?=
 =?utf-8?B?TFpXbmtRUTk4MW1ZQXkvVWI5RVJqTitrcWNXQjl1WGMvQzFlb3g2eTZEZkZB?=
 =?utf-8?B?b1NsK3EyWTBkc1E2M2lpSW1xNjE1NlNJZ3JWTjNyMk1mNU5kYzJCVndndjlN?=
 =?utf-8?B?STdMNWdxdk9ZcjVqbVhGMFl6a1lpcFgvd2hTTTAzdUFMdWIxeGhZZkMzcUph?=
 =?utf-8?B?cTFIalFXSHdyMzhvTEhkSEdIdTVwWG0zS1NabDQrR3RqYlhsekZCRDJhOFJj?=
 =?utf-8?B?RHliRG9rS0RIV0kzanNEMUlSU0V1aUpUYXNlbFdTQzMwTVgzcSt5SXJSZTdx?=
 =?utf-8?B?UUxWRldsZzh3eGZ3UUtOUWY1Z245QzFSc1JGZ2FHY29KUHZKZDN1TG1WWXR6?=
 =?utf-8?B?Z3p0ZTFpTWMzSFFOMWF2SWdPdW5YOGhON3hBUHRhbDh2OTJ6U1NiYk1JYWFz?=
 =?utf-8?B?d0lxWmwyYXdRTEFLNDFETUtlU1AvRkNFVHBxcCtVM1hHbGI4ZzY0Smx1cmtL?=
 =?utf-8?B?Wm8vaEMwMFpKV0FWQjFvcnVVMkRFNGhrRlhuVkM5TWJVT24zWUphbWhaS0U4?=
 =?utf-8?B?MWxUVnJ6aHE4OHY3Njc5NWhyRWt6MlRhZ2kwZEM5eVNGcFhBdnlPR21XR1Js?=
 =?utf-8?B?QlhuUDZuN29kMWlmM1RPLzZSZTd1cWtncHAyU1dRSTg3bkZvZGpxZTJzMGJB?=
 =?utf-8?B?eDh3RGlNa1J4Qmc5ZjlMVUM2SysvMTVONHMwZ2NOYU1kQlFxZlpIRCsrWTlo?=
 =?utf-8?B?ajhITXJkQ2pXdHJEemRYZzkveE0xazNpM2RHdzVOell3SWxkRXM0Y3JrK0FQ?=
 =?utf-8?B?Z1FvcWtlQUFOeWhTZ0gwU0ZFSnNuVmREZlUybmx5UDhSa1ZlS3VjOWpMOGU4?=
 =?utf-8?B?MHd4WXFUdWpDMjloN1BaVkR2ZWtHalM3RkNFOFdMNjc3WkxTbTF5cE1wSkZV?=
 =?utf-8?B?bkdURFJ4R0xVYTRwMVlIQ2JYT1J0clJLSVE1SlRBaGhvTzdmNUE3ZXcrVUF1?=
 =?utf-8?B?R1V0WG9HcW43d04yaVJId0ladG1nNm9SNXIxUWY3YzRHZTlXaTlWWjI3TDVS?=
 =?utf-8?B?b1JmWis0bDU4TmxVNXYwQjMycjJXNXBhcEJ5SkJRdHE1VDNweGRwOUM0dDBU?=
 =?utf-8?B?NzFyK3kva3BvVGlxdk1FTmt5UDZCTlhzaTY0cVVDZTVDVjgvRkpMZ2VmUFB1?=
 =?utf-8?B?TkZaSWVZWWxCdGRmSytGdjQycVdmUndqZmJmTWVucTUrNHZPTkNWTnprbjFM?=
 =?utf-8?B?dlRKMEhzZTZZc3ZuMm1vWjNIeUgyNE1nR1JTMXMvQ0lGYjJqRXNuNGRESFhH?=
 =?utf-8?B?ZW9GSVhEcFlyT2pjM2NXVW9XL2ZaTXlGYVJ3TEdRMXFGeU5hQUlLaU9LZ1o3?=
 =?utf-8?B?UWNaU3FpWWpTdDY1MWdtOVZzMnQyT0ZScVZ5bjI1OVZHVHEwQkltTUVDSEV0?=
 =?utf-8?B?a3hOS05xQ0VzZURUbld1bkFxcWx1Y1loVStPOVFGTGxvMDUxSDlsYUJvYm5x?=
 =?utf-8?B?ek9MQ1BxblVnY3NzdnVPYUplOGtPcXg3d3ZDK0FWa2VmaTJTbVZNakNsdnF5?=
 =?utf-8?Q?Sxrk9zZ/E6GtmRt+WxWqrwxAntQXhxyEcAtb0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <996B2A5DE618CB4C9E39A2CECD743214@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe8a22-2342-4fe8-09f7-08da5474ddb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 17:30:13.8602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DnMXlxGxC+Blb4/+nye8UlCLXmfRHbST2PEyccKDkvRMP9nzP/UNFXaEgT+AGKrtxvMP3X6zuKbNg/N/i3/LauLDgY0z8tpBaV4M3j2Yt34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PR80MB4969
Received-SPF: pass client-ip=2a01:111:f400:7e88::721;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

T24gMjIvMDYvMjAyMiAxMDo0NywgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gQ29uZmlndXJlIGlz
IHRyeWluZyB0byBmYWxsIGJhY2sgb24gY3Jvc3MgY29tcGlsZXJzIGZvciB0YXJnZXRzIHRoYXQN
Cj4gY2FuIGhhdmUgYmktYXJjaCBvciBiaS1lbmRpYW4gdG9vbGNoYWlucywgYnV0IHRoZXJlIGFy
ZSBtYW55IGNvcm5lcg0KPiBjYXNlcyB3aGVyZSBqdXN0IGNoZWNraW5nIHRoZSBuYW1lIGNhbiBn
byB3cm9uZy4gIEZvciBleGFtcGxlLCB0aGUgUkhFTA0KPiBwcGM2NGxlIGNvbXBpbGVyIGlzIGJp
LWFyY2ggYW5kIGJpLWVuZGlhbiwgYnV0IG11bHRpbGlicyBhcmUgZGlzYWJsZWQuDQo+IFRoZXJl
Zm9yZSBpdCBjYW5ub3QgYmUgdXNlZCB0byBidWlsZCAzMi1iaXQgaG9zdGVkIGJpbmFyaWVzIGxp
a2UgdGhlDQo+IGxpbnV4LXVzZXIgVENHIHRlc3RzLg0KPiANCj4gVHJ5aW5nIHRoZSBjcm9zcyBj
b21waWxlciBmaXJzdCBhbHNvIGRvZXMgbm90IHdvcmssIGFuZCBhbiBleGFtcGxlIGZvcg0KPiB0
aGlzIGlzIGFsc28gcHBjNjRsZS4gIFRoZSBwb3dlcnBjNjQtbGludXgtZ251LWdjYyBiaW5hcnkg
ZnJvbSB0aGUNCj4gY3Jvc3MtZ2NjIHBhY2thZ2UgaXMgdGhlb3JldGljYWxseSBtdWx0aWxpYi1m
cmllbmRseSwgYnV0IGl0IGNhbm5vdA0KPiBmaW5kIHRoZSBDUlQgZmlsZXMgb24gYSBwcGM2NGxl
IGhvc3QsIGJlY2F1c2UgdGhleSBhcmUgbm90IGluIHRoZSAuLi4vbGUNCj4gbXVsdGlsaWIgc3Vi
ZGlyZWN0b3J5Lg0KPiANCj4gVGhpcyBjYW4gYmUgZml4ZWQgYnkgdGVzdGluZyBib3RoIHRoZSBu
YXRpdmUgY29tcGlsZXIgYW5kIHRoZSBjcm9zcw0KPiBjb21waWxlciwgYW5kIHByb2NlZWRpbmcg
d2l0aCB0aGUgZmlyc3Qgb25lIHRoYXQgd29ya3MuICBUbyBkbyB0aGlzLA0KPiBtb3ZlIHRoZSBj
b21waWxlciB1c2FiaWxpdHkgY2hlY2sgZnJvbSB0aGUgdGVzdHMvdGNnIHNuaXBwZXQgdG8gaW5z
aWRlDQo+IHByb2JlX3RhcmdldF9jb21waWxlciBhbmQsIHdoaWxlIGF0IGl0LCByZXN0cmljdCBp
dCB0byBqdXN0IHRoZSB1c2VyLW1vZGUNCj4gZW11bGF0aW9uIHRlc3RzOyBpZiBhIGNvbXBpbGVy
IGlzIG5vdCBhYmxlIHRvIGJ1aWxkIG5vc3RkbGliIGZyZWVzdGFuZGluZw0KPiBiaW5hcmllcyB0
aGUgaW5zdGFsbGF0aW9uIGlzIGJyb2tlbi4NCj4gLS0tDQo+ICAgY29uZmlndXJlIHwgMTY2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pDQo+IA0K
DQpXaXRoIHRoaXMgcGF0Y2ggSSBjYW4gc3VjY2Vzc2Z1bGx5IGJ1aWxkIHBwYzY0bGUtbGludXgt
dXNlciB0ZXN0cyBvbiANCnBwYzY0bGUgaG9zdHMgKERlYmlhbiBhbmQgRmVkb3JhKSBhbmQgcHBj
eyw2NH0tbGludXgtdXNlciB0ZXN0cyBvbiBwcGM2NCANCmhvc3RzIChWb2lkIExpbnV4KS4NCg0K
VGVzdGVkLWJ5OiBNYXRoZXVzIEZlcnN0IDxtYXRoZXVzLmZlcnN0QGVsZG9yYWRvLm9yZy5icj4N
Cg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERP
UkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUN
CkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rp
c2NsYWltZXIuaHRtbD4=

