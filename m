Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD163BA1C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 08:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozucp-0002ms-Gf; Tue, 29 Nov 2022 02:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=325583d4e=wilfred.mallawa@wdc.com>)
 id 1ozucm-0002mA-Ir
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:01:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=325583d4e=wilfred.mallawa@wdc.com>)
 id 1ozucj-0003hR-Ey
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669705305; x=1701241305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kSxxYb6/gywyA1nNYRi3/XReM3rURwFLcmIINMqDeBM=;
 b=nFyS9P7dRt8UUcFcipmsNR/4VSvSN61a5/CaOxFj3lcP5Zbovk49M3b5
 s4U5hb9XP1WCgEOHeCSiWvm4Ue5QM3t3q/QD4xmkPUcpgszS7eqW+KHke
 ct6lTIqIzXTTOmkyWRn3Vaznm7NXzTtk40ru/v4UAanA/6Egot6gJFQGr
 XKwiexX2e2n1EMXIYXL9Z/MC3LG0StTE9zREhh9a4nMhlvTICfMdtcqQt
 XRqgkjbJNrszv5UVC9H1C/WX4MYWoMn8Zn/sW4IW/Zt2S6RaV0GBNRcuB
 ucYGSZokmHnoHDMk0XqCVSvKflzmhHJxFW6m5u1MbpxBQ9ULHymh5tNRD g==;
X-IronPort-AV: E=Sophos;i="5.96,202,1665417600"; d="scan'208";a="222581781"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2022 15:01:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ/Vp//5qw/PLnxmaGBgZ/E1jX2NszgXj05xUyUrkP338YufgaJAN8K9HguV5V+E+GywDxicA8D4h0ckNacJPzX8RjY15FJ4CgpYmgvrpQny2A4nmVGebcCU+MzgJoVk64jUkrUo8BBX0giq8RtO9gXsLGWDt1wwZH/61EDzdHOT0hvS1wYvFCA5yQCKZ8Lpat3LYNrUOhJPSS1EY6BtxW/o/2/1OkHivHw7Z5qJ3T9/p/OcbvSOl9GsqqDHFacoXiaqN9UzRo9djCPv06sMyVdlYLjOdFdoQxo1jUgIgNPJe74ZsrdZTNvBfJKyqEHzzolJfG7/faNTGtGtHznKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSxxYb6/gywyA1nNYRi3/XReM3rURwFLcmIINMqDeBM=;
 b=b4z5YvzzDDeO/QaQehcaWxCWsoL9VeOt3YQ8faDq61bZ81qqIhI4xe4ODDvlNXyWeG/h8SjNmoH71rojj6JYt50OOvIZLy3mM4aUZe5lm7HWIIrlJmGHpHlVBkT81SK19/wK8FUFaoSJe5neXhgD4SMfLXtsPsx/KhIuhIHpR5gyzgEnXmDIlSPC8nO2lu4bCl0wqV7H1SkCEKKwjHnonoxuUEGd3nogct6HOk0pUiDXuIcw5zil40JZMrB8n/RtuT2qoCl2J40U6YlD0UvNnhXoGER00Q6o0OE8tXN/IqUx+zgp45WSd/BIxP+IrCYr62OlrHJ3vA++7s/5waiw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSxxYb6/gywyA1nNYRi3/XReM3rURwFLcmIINMqDeBM=;
 b=O45lIwDM//NFLMf/Pw8a78h0OXZbO3fUQ5v6iBHfd6mnNyn1YHylPezGumu1ZwYzC8O19eFWXQ9t8jCWC2wlHwesJkqdhEBkOCtAuXvuIbJryg2n6hvFk/v+gknmHjabts6lRNuXhn1s7ZDDEYIyMto2cnMcNMGLzZttQG1r9Ms=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by CO6PR04MB7506.namprd04.prod.outlook.com (2603:10b6:303:a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 07:01:40 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 07:01:40 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu_oss@crudebyte.com" <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "groug@kaod.org"
 <groug@kaod.org>, "thuth@redhat.com" <thuth@redhat.com>, "lvivier@redhat.com"
 <lvivier@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add 9p test client to section "virtio-9p"
Thread-Topic: [PATCH] MAINTAINERS: Add 9p test client to section "virtio-9p"
Thread-Index: AQHZA02rdW4PAscZV0qtnduYBsX/Vq5VejwA
Date: Tue, 29 Nov 2022 07:01:40 +0000
Message-ID: <5bdef7265c48aa7ad5c3e971455e53cc22c0b3d4.camel@wdc.com>
References: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
In-Reply-To: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|CO6PR04MB7506:EE_
x-ms-office365-filtering-correlation-id: a905bdf5-33e1-4bae-9053-08dad1d790bd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GCFZafySNao39/IsRJiFGn4I9q5tve9ceWTSUyx3FISrGuCmhGsSc+QstDj500R++HRTMcYJ3gs5S/AhlRatD/ubybJUeU+0QbcmGy8j6dsBzbbe5aW6QLL/dq9oSUDpNpAVyZNCcnmLWegYJH8cGCal8YNUk3inVcNMmAF/AEedYd7z4ODaTiGkKY8xD++1BY7fdV7R5BIicbRPF7onVo0r+I2JUfEqvTzKch4VVd8D+BfYxufi2xp+yL4slDzuXKictQ8CtgGtavIBiRka3N4rrJFbqpJR1NeqNIgORkcbiTSuTsMtmbPXJ58CtAVmnvzBv3aROLO80IZvCFJUb88c+U1B6u2Lk10qBx0DSXsbo4hd8vUSpGuXi5iO7O2XfDWT8OMKCKu91jPu9j8vAADHOGi6prGz3sl6Gw71wCYTRnxvszz/AXPrTrk3/AkOlZvMXj6/RaNSoVHsPy6bSHe8oYLrjR6o9QTkW7wHM5JeemUhr8FI2QOruRsR6Sbl0+EcqTdMiWxKbPjKV/XriAV4VULnrLPPT1ql1Bqu7XasshCuFR4jbYisRMailZ/dCe0QdL11uXzq7W4bSZvh3Dw41Eys5f0/jpC+Pps9Gk1gHWEm73+5qZk3iAOrCebgDvUimoJG9obGVJQiShMBeAlgUgKvFnAbB+5ziSOT7FDV3t3eDVQHxnANtVwYv/Q0hUr999Hw8IJ93W1IYZaTUkG2ahWJYPqKqfgCeBi8Ltw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(110136005)(8936002)(71200400001)(5660300002)(91956017)(76116006)(66556008)(64756008)(66946007)(8676002)(36756003)(4326008)(66446008)(66476007)(54906003)(41300700001)(186003)(316002)(38100700002)(82960400001)(122000001)(38070700005)(478600001)(6486002)(2616005)(966005)(86362001)(26005)(6512007)(6506007)(2906002)(4001150100001)(44832011)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUhITFI2MlZudlo0Mzg0WHJUVCtoU3F6Q3JEczNZdTJvUVJxZEdCYmFGZXVm?=
 =?utf-8?B?eWR6N0hkY2svYWhqcEFiT0s2cmRRRzZoMWtlYU95cnBubzV2WFFVMVl3WFlC?=
 =?utf-8?B?aEpjOCt1NHBMSjhDVklDZjkxVWVacW9rZXEvNEdlWmFxR0RZRzdaWVdlQXFu?=
 =?utf-8?B?Y2FLQ1VsWWV5c0VGczdLYnBJVUQzRVg1Y01rWFd5TkkyV3VmUHpmQ3dPY1lP?=
 =?utf-8?B?WFBadUxqRDNNVlJtbUxFUDcwQVVad0Y1cjVHMzFqbHh0dWhxclQrd3JGZDR5?=
 =?utf-8?B?Sm5WYzIrT2RRZlZJa2xnKzFHeEczSEJKT3JEQnFoSlJRLytKd21CRi81RHdY?=
 =?utf-8?B?WXBwOGdxb3dsdFZCa3ZNTlp1aS96R0x0SlRQTi9rTWJsaE9XQi80Y01GSzJR?=
 =?utf-8?B?WnpPR2xWVmFGakMzbjFqME05cUZaUzJ5WTlDd1gvbjkzNkw0NVJudVRncWt0?=
 =?utf-8?B?eERUUERraWpiQjFNRkpNQXJZYUhma3M5NE5UODlDeWpDYmIzaWtLVDErMkx4?=
 =?utf-8?B?Y2VLK1BxUnhvL2RQWmdtUXJMMmFkZlB5MlU4blB3cXBZZHkyditIUGhHQmlv?=
 =?utf-8?B?VS9JOVFlUmRsWDB2cG80R1ZLTGxvRUJnL2JzbzZMZFBCVWxNcks5T0ZSZm1S?=
 =?utf-8?B?Y1YzQmFjNVV5RVh3L0NGbjlDWDNmK2hxK2dneHlKN2xvWU5xYTVqQW5sMVVr?=
 =?utf-8?B?Y290YlMyZEZmWm0rRlR6SFRnbS85Szk1cng1a1FKYlpJVWF1ZzNFWlUwYXN0?=
 =?utf-8?B?WDdmSXdkcXc5blJqaGFFaVpYN2xzZVBnanhuV2I0QU9vQ0k2UWVINGNKZFlF?=
 =?utf-8?B?c1plSEpLRFZ1WVhYeWV0M3FtSXI0QTY1a0pWcjBhK0JWZmwveFFlVUQ1K2xR?=
 =?utf-8?B?QWZYQ3ZFbUx2TkxZOXFNalJjalk4YyswWXpOVTN3QjZ4MXU5TmVSbzN4eHRt?=
 =?utf-8?B?eGFhV2h3YkFhbHZrRHZBM1NBWS9NQmd2eWp4N3R5YlI3L0lHYVVUblZId1Rw?=
 =?utf-8?B?QkxUd2kvSDJ1amVJWlJRZlY1MzQ0TlQvVWlXOE1UbnUrS0JJSHBZMVREUWg0?=
 =?utf-8?B?djFHYnJJbU0zSlJKWHl4T3QwOVpHMWZLY1VJa3Z1bzBCbnhnZm9nK2c3a0tD?=
 =?utf-8?B?MnZad3VCVDJDZTNSZXAxbEE4QmlyT0J1SGpGek1WRjh4UElzaEU5ckI5eVYx?=
 =?utf-8?B?TUVYb2IrY3pya0xuODhVb2ZuZjNKMzU2akxac0Z2R0dYd1dmTUxIeG5meVlk?=
 =?utf-8?B?T2Q5SEFJVWxzTEVJdDNJUllRZURBZ0crcEkzS05TLzdPcnoxcnZnNm1iS0xQ?=
 =?utf-8?B?MU5JbFBqR0JEdndJU09rM01CSW4yenk1Vm80R0Z3UlpLRjNZbDk0L3pPSTBG?=
 =?utf-8?B?Rm9tRUhYYUQ2S2IvUzdxYkdBa0I2cFB2MUVGVlRlVzd6TEFObmFxN05INWlJ?=
 =?utf-8?B?UmkyTkRCVnNUUzhqbm5Vcm5sWXZXR3dRdkxsUVZwUGFGaTh1eFQxSnVRUDlO?=
 =?utf-8?B?OUlJUVpGWHlDdGt6djdya2dsc3FyckF0MEZQdzdQKzJwcjNMN3RDMWcyVDU3?=
 =?utf-8?B?TnBTcGNMK3BhQkNnMStxR1RxYW8vdjEra09udDl6SnB0aGw1MVlucDhzUzA5?=
 =?utf-8?B?aWhDZytrcVhEaFRtOHlaWSt6ay9JZ1g4dlFhdTRlWG1qQ2sxZitsd0dVNWs4?=
 =?utf-8?B?UU9RSXJvSVhmN2daNlJiL1hqeVFnenMrVEk0WXgxdC85OVJDc1Jub2g2YU9Q?=
 =?utf-8?B?cFJTYjZaKytNaTBoTVg4UmlZR05MNXV6WUc0TEpwcFMwQXlzR2RhTW9lY1JE?=
 =?utf-8?B?R0hoWVFCNlpFSmMvZHdTaTNBTnJOZi9iR1IxaHBoZ1owb2Y1VHRLZGd1VTQ3?=
 =?utf-8?B?K3VEbG1aOTVqVTZteHJKSkFKcklxaVN3S2Nna3F0enRpd2NiYWRQR0NpRVIw?=
 =?utf-8?B?MUV1RU5KVXViQXQ3Q051OU00RTBZOXUzTHAwQzAvdnFsUFpnZW5Ta2pJOHVJ?=
 =?utf-8?B?TDFFQk5CQXpPYVNPcWsyd0lLTVB3Y2tJNkhUM1BpVG1KK3RYUVZ0Mkp6MW5h?=
 =?utf-8?B?bmdFVWd1MXphekcvektzMENsRWhrTkZFSlFSU1BYWFIvZnVoODhhbmlqRThV?=
 =?utf-8?B?U2lnOEN6Z1dBZHB6ZXlKWTMzaytITVRDOE1uMS82ZVprVXR2bFlVOUlrSEFm?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B91C02D19A0F5D4086F9CEA04E6F56E1@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EW9AvG7WvLvnKv+vi+2LP0is7LPPg1Sgi1L/WBj8bfkoywHeSfBCKQiVLDQFQB6T1TKoC9fh5jUqveD0jJNaCoJpbu2QCA3+h0HoqL5KCbe6euOVg7y750ZhNSU4xLGxEt51kHKMQb6svV1d35J2NZzOeE7nXKXxm0C8pbbJdySPitzLUsY90f528SCOFbwXvShEOOJpd2kcuVtQgDU5dZnyaZTQXrWQV2Xw9LNLPH5oNcVWVifiASVkD/VJJB3HL2tvhxyoPqmTlDOuxfHElZgMpg2rGk+duseloNO7gV8+1w8GxtkTNstCWvbIZNQT2r9R2LGFZFikZB+ernqg73NN1vIjZhpHohvalYPT4fQXyjbPW/YqjOUi0VyqXzutbb3yoDybUp6dy1O5PHpz4yVjpn8ebaE9gDIBr9tmAHHy2d9C/OgRyGu51JOgY86UFnbjtkNNj1f8WofHeuzRfVzNcVUdWctFeaKwO/D+GeQcu3P+HnVHtzKjd+js1bqVLzPCvz/ha8NYVGfiTY6d5tlsjuUxygeEZMqr2khfxz46o9ZaWE91CTPMepNKEN804FevUtfeNo+9T3oZEwfzG3NtZWjB2yyEBnFFakuD6bLTdrLBWPX/06hTwgMuRZPcxQw/4xUb6vxMMO7ShrDlzq67O9WwPo5Ui/FqdOVaNV1emzEfzn6iNJLw39BsjrHbw1yLsC0UKSE1h5gh7V4RxvvfpJBKWXluz1yU3GJx0NiCy6oDDoyBYdB5q4is3nzZzBYTCsNkuHQUAQ7qgu1jcH9rTdM/vnrkhuft/Bvj1FfhdGaRsOmAoluyDI/jd3qzOPW1BzYfUZy8SwTF30epyr2lRjXoLA5D3/8FhCBh04hO4rNIvMKabTl9f9YM3KkVkG5A43agY78i51V3lil69zT1yE4eY4+sAUPXpdMXoFc=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a905bdf5-33e1-4bae-9053-08dad1d790bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 07:01:40.2706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8BfL/rr4K4+0sf91uXjiGymHDnrTf0pShllwB9ZCeIgBJBHfxK6speQWPPAUMtOIY/dvhGAClgdYcAMC3+HMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7506
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=325583d4e=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gTW9uLCAyMDIyLTExLTI4IGF0IDE4OjEyICswMTAwLCBDaHJpc3RpYW4gU2Nob2VuZWJlY2sg
d3JvdGU6DQo+IFRoZSA5cCB0ZXN0IGNhc2VzIHVzZSBhIGRlZGljYXRlZCwgbGl0ZS13ZWlnaHQg
OXAgY2xpZW50DQo+IGltcGxlbWVudGF0aW9uDQo+ICh1c2luZyB2aXJ0aW8gdHJhbnNwb3J0KSB1
bmRlciB0ZXN0cy9xdGVzdC9saWJxb3MvIHRvIGNvbW11bmljYXRlDQo+IHdpdGgNCj4gUUVNVSdz
IDlwIHNlcnZlci4NCj4gDQo+IEl0J3MgYWxyZWFkeSB0aGVyZSBmb3IgYSBsb25nIHRpbWUuIExl
dCdzIG9mZmljaWFsbHkgYXNzaWduIGl0IHRvIDlwDQo+IG1haW50YWluZXJzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFNjaG9lbmViZWNrIDxxZW11X29zc0BjcnVkZWJ5dGUuY29t
Pg0KPiAtLS0NCj4gwqBNQUlOVEFJTkVSUyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiANClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFs
bGF3YUB3ZGMuY29tPg0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0K
PiBpbmRleCBjZjI0OTEwMjQ5Li40ZjE1NmE5OWYxIDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVS
Uw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtMjAzNiw2ICsyMDM2LDcgQEAgWDogaHcvOXBm
cy94ZW4tOXAqDQo+IMKgRjogZnNkZXYvDQo+IMKgRjogZG9jcy90b29scy92aXJ0ZnMtcHJveHkt
aGVscGVyLnJzdA0KPiDCoEY6IHRlc3RzL3F0ZXN0L3ZpcnRpby05cC10ZXN0LmMNCj4gK0Y6IHRl
c3RzL3F0ZXN0L2xpYnFvcy92aXJ0aW8tOXAqDQo+IMKgVDogZ2l0IGh0dHBzOi8vZ2l0bGFiLmNv
bS9na3Vyei9xZW11LmdpdMKgOXAtbmV4dA0KPiDCoFQ6IGdpdCBodHRwczovL2dpdGh1Yi5jb20v
Y3NjaG9lbmViZWNrL3FlbXUuZ2l0wqA5cC5uZXh0DQo+IMKgDQoNCg==

