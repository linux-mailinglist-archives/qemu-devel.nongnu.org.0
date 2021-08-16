Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D93ECC91
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 04:11:57 +0200 (CEST)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFS6W-00021V-Fm
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 22:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mFS5E-0001IY-LT
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:10:36 -0400
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212]:7276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mFS5A-0005PK-5R
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629079831; x=1660615831;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=1t32jsv8qGuahxUStNrE870FosRaYb3Qb83BrjDj/NQ=;
 b=lUQ8MfKg+3cwishEN6FhYgrnNLjyVEjtf9kVHdBfzEIh4c8jPIAuC9aW
 242jqXKmOsd/XOoMXaWrRFQEzMX1dkAcJ6wwu5+4jid47yhpKuomf5/09
 JgeJjlJKMx7gvYmZxrc+PRXKsY5c2TA3STjseyuCVxrx6tCADXtgeC7dl
 fN2R5smpGubTowvQzL40XCz/MBnNfDF4V5/wz5xoD6IpuxXEdo++YeoRi
 WhRKjrxbDiMkd+dPAPo+1cYWaaQ9KUk8qI5o+k1taUZg7TX8b0UN1JAkM
 A2tcqsHdIKgB5YblpT09Isk7RTWJ4Zx7twMCLuy6GXYAR8ldlTb2v87EU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="44817240"
X-IronPort-AV: E=Sophos;i="5.84,324,1620658800"; d="scan'208";a="44817240"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 11:10:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neNXx6fhSE/NpzTh8T03MSFueq+jyDLQFDGo1yK4mZC3KzX+3Ubiwe68IBM2iLIZMXprsQpKL5PgfRA/kKOzdr18E0lwwruDEui81eOa0F17acSB9QKLm09yG/it/N23UcNAQKLCdDcx+laL2V2tPhV5BwGuphof66TWL7jrmJ7Ed2ZFL2DdsRWU6CuitaQeMFabJ0Oj84cPFsfZGWQKJMvqgQIF0tsCuXip/6XlBGmaGxMCDcK5PFyNu4KWx+kgf/xkPYlDQ0DmOMPOnivunLJcL1Pk8Z0gwX32zB6AxsT5aI1ygLewsfbSI2rpcXsJSjUz8H/d07KzKE7tXYvvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t32jsv8qGuahxUStNrE870FosRaYb3Qb83BrjDj/NQ=;
 b=jtgGt/DvxY+2w5vl6gtMu4KcMaYSgBCkwK9cqX37nPDFpn4lTd9PYfzyHzC0KAgARvdn8SO+Q/jo2UkFrgBexirAk9wA6r6FJ3/YJTL88niXQfvSY+axgGQ7S15eXzL0QvPtKdSYx3wwUrN2RvwOYvT/gl4E+toJ/kW3As4UNTZLgtBD8Jc2PZzt55OXXMlSmvJvtGl3FXwWMnRQmM43+muuKX+usqiCOT/cEtK2VrWuhwploa7Wem45hfxvjYgsl0/mr/Hsjrs/l883l7CCQb+1gr0vIEyTiejt8uKLShjAlajt/dN67O8CPa2KRTZf5P5zqCEv2cFZGxTMeHOcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t32jsv8qGuahxUStNrE870FosRaYb3Qb83BrjDj/NQ=;
 b=gL1msvIF3rnWM9IG5cheodgxfFXHA4gD8lN+ctLuCYS0DB5VLAbFn5b/YyPo8gDEk7Tj4IclckD/BWU3DcS1nLLvfQHgBb2FQw1y6wcevIckTsqSiY00xyJ3hlkgAbmFKaOgH8o1l2qwzyyytWIFLjldJpnsho9fir4Ei5XMyIU=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7288.jpnprd01.prod.outlook.com (2603:1096:604:149::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 02:10:24 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 02:10:24 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/2] enable fsdax rdma migration
Thread-Topic: [PATCH 0/2] enable fsdax rdma migration
Thread-Index: AQHXhhQzAqqCrz8zJEuOO3l8Wm4klat1eveA
Date: Mon, 16 Aug 2021 02:10:24 +0000
Message-ID: <a05a6c79-3990-1303-2a9a-e6895920a322@fujitsu.com>
References: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6226fc6b-c214-4544-daae-08d9605b0240
x-ms-traffictypediagnostic: OS3PR01MB7288:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB728815B24C9F903E5A5FE2BAA5FD9@OS3PR01MB7288.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5PT14EFXfXhBUNLbqJ/hmyHaWEM4Qd28etbLMsCUCxe00WuDL9AdoAmiURrUqgFl95wBVBr6I2jj/gUv5dqa9pUqbqo5G0hD6QWpcvniPtZCF1Sv+M2zGR8+sREvAbNx4hUDRTIymJ4zixHPQwCzvb+EZGxap3mYDzShx+ZBXdEzEwflngF1DXex4DpTGCef+11PDfafdqsUxUE+bfE0AogRpPg3uPULlGqsJhT7ZNWzYJKoGF7FQQXEEG+GNUuroctxaw1Z1pH0olchCG8f0WQsg/OvdCU1y2aXvlanDmQZyjviIGm4fDBNhXiLXL0Cz96qOoEPsgLr3fCXW4MPWzPTgl51V7WME2Bmzo2UDcZfLlC/rCrpcAfQlRaBPlCaEPxLVARamD16TKeobeOKp+Uq/5PCcxmDV3htLGnC3OREpv4JMrQhGIFvOY7Zkd6nTyiVI47b51GN9Vz0i+5VUbZ+GQ1ZkIfZ6crAKXX98W4UmJqA3dThs/8awY4TmP/+7KEcEOcnG2W4d338oB7SwFSDOoecScvEAVR972ivPrGtyLvFNoWzh/eS97DojCHBOytjxrZQR2bNjOj7yLSvUKMs9D8lVubpJvfOoTeuqFwX2a7ElOpgaTHqQNx04UQIRRCfIoGirf8TPWKNhb3tJSHFnspwuxPGQ67JNoHZtw9Qz8i3L+yPuHmRXu04eX5SlFHbBUl3ngWyWsmV6xIRqQ3Xrno9UjL46Wz9hR449sw6Wahw7ICDqrTz9LpZRsTcqF3FOPGwCgbr4a5I4r7Z9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(5660300002)(316002)(110136005)(2906002)(71200400001)(6486002)(31686004)(4744005)(122000001)(38100700002)(2616005)(8936002)(85182001)(66476007)(66556008)(76116006)(86362001)(66946007)(31696002)(64756008)(36756003)(91956017)(6512007)(38070700005)(186003)(26005)(66446008)(53546011)(6506007)(478600001)(83380400001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUlTZHljaHp5Y2hpODV1RU1RZFJXaE9UOVVRQU95VTgxSnRlYy82dDI4R2Q1?=
 =?utf-8?B?YlhzNjlncUxqZTErclNUOWpJbytYMjJoeWF5eHlhTXZiamZZYXpRNmFoMkJl?=
 =?utf-8?B?diswZ3R4c3BYa2lTcmtwRDVTSGJ0YWZKVXpyUjYweFVWcGpOMHljcnE1WWVU?=
 =?utf-8?B?K2dCNWhHeG5wNFVqT1ZuOTIvaXhESnJENU5paEZNMkdYNkJxbnM2alVic1NN?=
 =?utf-8?B?R2tLQW9BUjNwNEVLNllOS0JmNXd1akhSQmxSbHVlVVI4VnlwVTBpZFBadEMv?=
 =?utf-8?B?UHlYWE8wcmVzZGNDTVhSQjQ4QUpnbGhRU0RrOEx4R1A5c0hRUkZGQ3hESWo0?=
 =?utf-8?B?VG1JMDZ6R1BBeXc4UDUzd0lVYThoZDNCTDNZQWRKMUFmSGZoSi9jS3dUYlll?=
 =?utf-8?B?azVGR29IektHN3E2SU82ZVZ4S2kyaVlJcndXNk1wQVdwc01wQ08vWlRkTVd3?=
 =?utf-8?B?Unk5d1YzTHJranNYR1o3cWIxWVh2VnhWQ3MwQWNqNmRFUXdpcXBvVXllWmxm?=
 =?utf-8?B?a1ZhVy8zMi8xN05kVkVCbjBHQnByU2JhdmhHSnJYeG9TMENPVllGRHlWRUtF?=
 =?utf-8?B?YWhFcFVsTlVzbHgvTWY4Vlh0Zm9ONytnWmVwdFcvejI4R3lyQkZkUFhEV0Y0?=
 =?utf-8?B?MGlFbFhuU3R2ZUZEVm5HVWFQSXdYL3VNM3NyMUxlU3gvZEU0cTdxN3VLcGpa?=
 =?utf-8?B?WHZ4ZzhFVWNFMDlnVUIvTitIZ290Nklub2MzOEJta0hCYWZuY0pVVXh0ckFu?=
 =?utf-8?B?ZmxreWZocTcreTU3dXdLRWl4UkNLQytheFFaR3czTGh2QmU1QmRCbmZEY0pL?=
 =?utf-8?B?N0JkbVNBZUVSbjNYd2tNZkVnZUpEcmM3eGdtTzJZNnRMSnIzMHVnQWk4TkRq?=
 =?utf-8?B?NHhRUS9WYkNMNW1FRGQ5WTViMkFTV0lEOWlpa0lrWVZPQVZmMGxIMC9OTWt1?=
 =?utf-8?B?VDl6Zi9ISk1JbjdrcGRhOEZnMGJPajBhakdFZGhVZVprUnd0ZFJ6ZE5PNGph?=
 =?utf-8?B?Vm1ERUJVRXlqek5iMFZKSkk3N1Bvc3R5U1dEemFYTGNvQi92bjl3N1E5VHl5?=
 =?utf-8?B?QTdoV1kwa0VDcXdwUzF0NVpMVzBYUVBJbSt2Rm9STnZ3bEFGbFQrdWpMdytU?=
 =?utf-8?B?N2F4ejJwS1NXTEdSL2thUDlnQ1orRW9hUUlQYmtiNFhTRURIZnNXS0VUWVd6?=
 =?utf-8?B?R1VOTmpCV0NiZk1iU1JnUkNhVFZYdC95K1dCbTA0T2xIeXpkL0dEYWR0OEFT?=
 =?utf-8?B?eXBXNXBFUGRheUdRdXpCWUx4N3h3RDYza0NhQkR6UnBnZnRjNERxMjl1cVI1?=
 =?utf-8?B?VXRxNndYZEN1M1dNRHEreTdJcUl0MjU3d29KYmxkQVIvRUtJVHZGWVBXbHYy?=
 =?utf-8?B?aXNZR0diM0JrdGQ5ZERBVlFtVkUrRmZJVFVzblppUUdUN3RFL1lOeHF5bW5U?=
 =?utf-8?B?Qnl6K2dscktZZ09JV3l3emFDQ1g4MDNLUkJiMDlXQjBFdDcrR3F4MTJFVjBR?=
 =?utf-8?B?eVRxSy9BSGJSaFNINXJUV3UyZlFCcG9FVGNnNkJHSmJ6bE9sdFkzYU9xOURQ?=
 =?utf-8?B?b0NoVXFyWGQza28xT1k4QnJXcTcvdjl2T0J0enBNaE5rY1ptbjVvK1JpV0oy?=
 =?utf-8?B?K29Rd0o0TFJFRVF5N3VJKzVPeERSamdSakxPMzZ3SkdOUXNjdXcxc1hCR2tz?=
 =?utf-8?B?bE5UTXRHTkM5K1VZWE82NTFQZGJVWFVseW94N2xObzZ0d1BlRDlqQzNPMXFl?=
 =?utf-8?Q?QGedRY/XZXE7jL1/9Ez6IMpCAzRG5h55Bb0PP3P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA3601BB311D5C47A6130C65C5D02D97@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6226fc6b-c214-4544-daae-08d9605b0240
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 02:10:24.4824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gAYRfdjwJKm4gHZfZEJP+BsOix1rOAEWS7033IHOd72oiZa22OwTNGzdWFFOGtpsRItx+o3AOsl4HEswptB5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7288
Received-SPF: pass client-ip=68.232.151.212;
 envelope-from=lizhijian@fujitsu.com; helo=esa3.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

DQpwaW5nLi4uDQoNCkhleSBEYXZlLCBjb3VsZCB5b3UgaGVscCB0byB0YWtlIGEgbG9vayA6KQ0K
DQpUaGFua3MNClpoaWppYW4NCg0KDQpPbiAzMS8wNy8yMDIxIDIyOjAzLCBMaSBaaGlqaWFuIHdy
b3RlOg0KPiBQcmV2aW91cyBxZW11IGZhY2UgMiBwcm9ibGVtcyB3aGVuIG1pZ3JhdGluZyBhIGZz
ZGF4IG1lbW9yeSBiYWNrZW5kIHdpdGgNCj4gUkRNQSBwcm90b2NvbC4NCj4gKDEpIGlidl9yZWdf
bXIgZmFpbGVkIHdpdGggT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQNCj4gKDIpIHJlcXVlc3Rlcihz
b3VyY2UpIHNpZGUgY291bGQgcmVjZWl2ZSBSTlIgTkFLLg0KPg0KPiBGb3IgdGhlICgxKSwgd2Ug
Y2FuIHRyeSB0byByZWdpc3RlciBtZW1vcnkgcmVnaW9uIHdpdGggT0RQIGZlYXR1cmUgd2hpY2gN
Cj4gaGFzIGFscmVhZHkgYmVlbiBpbXBsZW1lbnRlZCBpbiBzb21lIG1vZGVybiBIQ0EgaGFyZHdh
cmUvZHJpdmVycy4NCj4gRm9yIHRoZSAoMiksIElCIHByb3ZpZGVzIGFkdmlzZSBBUEkgdG8gcHJl
ZmV0Y2ggcGFnZXMgaW4gc3BlY2lmaWMgbWVtb3J5DQo+IHJlZ2lvbi4gSXQgY2FuIGhlbHAgZHJp
dmVyIHJlZHVjZSB0aGUgcGFnZSBmYXVsdCBvbiByZXNwb25kZXIoZGVzdGluYXRpb24pDQo+IHNp
ZGUgZHVyaW5nIFJETUFfV1JJVEUuDQo+DQo+IExpIFpoaWppYW4gKDIpOg0KPiAgICBtaWdyYXRp
b24vcmRtYTogVHJ5IHRvIHJlZ2lzdGVyIE9uLURlbWFuZCBQYWdpbmcgbWVtb3J5IHJlZ2lvbg0K
PiAgICBtaWdyYXRpb24vcmRtYTogYWR2aXNlIHByZWZldGNoIHdyaXRlIGZvciBPRFAgcmVnaW9u
DQo+DQo+ICAgbWlncmF0aW9uL3JkbWEuYyAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLQ0KPiAgIG1pZ3JhdGlvbi90cmFjZS1ldmVudHMgfCAgMiAr
Kw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkN
Cj4NCg==

