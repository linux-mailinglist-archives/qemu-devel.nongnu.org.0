Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283D641FF9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 23:11:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1xB9-0005p4-Iq; Sun, 04 Dec 2022 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=330fc4baf=wilfred.mallawa@wdc.com>)
 id 1p1xB7-0005or-TY; Sun, 04 Dec 2022 17:09:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=330fc4baf=wilfred.mallawa@wdc.com>)
 id 1p1xB3-0000er-5i; Sun, 04 Dec 2022 17:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1670191777; x=1701727777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GBGOKA3Jj8fLINolixto6UEu9+k4u87+Oeg4r2KRcqg=;
 b=fnZZC3kG5qZJkkjl6Jilcnk92HmOKjSGsjxN0VhWLBGx2NTMRpLZ+2r4
 cHOXHToBCLzzYCQAH+sp/t8kONbKCVDeKt1zFRS1yZdeRXAa6MbL5RLMl
 H5WSrcx0WDHP3s/GD0+hZ8FVqu73lTBMC+nnBwc3A2n9vkZ9/M78stMAh
 j/d73iyHMRcpF2D3RIeNK+5H1LlHy3Svzh32iSuTLGAwnptAVMO5NK24V
 dslCdhBoIaNbvu2g/NQKLjIozaEg2qPgJ85U+4N7/LwHdVoGKf2HioHn6
 /ZydaGI7N1APUQgzsANqlB2Fmoxkv8gmgztll2fHImHevO8qjcT6grFos Q==;
X-IronPort-AV: E=Sophos;i="5.96,218,1665417600"; d="scan'208";a="322227199"
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2022 06:09:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzilEQo/64RSp2T4YHqAvvdfssVnvIhVu45nMNbPbVl+5BcWogcMo5fBK4+5dSVQZeMKsAjgrpEUe0hbNw/emoPj6yTvifEyyAUcH6y1SsDJYnoVBHwMKv2GkoeBfmXJlGRAEsezp9/7+Gx5V6vW7lCunlL33suY0JCLwfe8clHC6r03zUPVt8mIEXqkWoraHwlEELrY+o5z6BC2VHkaXPd0nFWcBa2d+WmyWbQ6S+8zru/X7Iv5iQ86lL3gMSPgT0sVKWkoC5UVTAWUBdqRRmpLj35014a2Hdc7V5q4Z/joCQUzPe2tEoG4kaPyaPNVWrMt+lkAmIUCPiZ0JfqWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBGOKA3Jj8fLINolixto6UEu9+k4u87+Oeg4r2KRcqg=;
 b=CE1jCHBLMxKSgKPrptrM5J4ZXh1yBDWtR2GrhM9yDIxBObUMy3j89oPZVWahAyZV+u4AE8buqHkjHzEIGpu5zRxEFjynfAeMKUmCbSmPEa/MLe03Wehb76A1TW7c4dyIJFIcfKNU1YEsznsKUXmON8q9xnt+PaEvp/oE7BH1EJ+xDIHob1sTv5jdSNfaQJXnEA/7QkW2l2NIDs1evJ0Mj02UMgJReFJN+INVKSnwUtE2yH6Jq9nCcHwiUOKdIEweh3YjTMrG7/vOPkWN2KutDnyIAeZxcxOg/my3zc8R3zLmrpVVmH2TwiP/vOl5vWxcmN/vAedOLS+Mw8imDrIRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBGOKA3Jj8fLINolixto6UEu9+k4u87+Oeg4r2KRcqg=;
 b=etZIVHFYeIb7tcbatD6IW8/2wKczkN0Eru6CoHtqyb8VxVlGqtFfNcMgMIKK/JXJ6+cQRl3kFB1FinLPFpKk3WdBUZ0NQNAqEv3gcszi5afqmxcvQnrAYqA7AVlmO70ge4CImEk395PLfe94jAZPPZonORxkGJT5jueZIhRNjP0=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by MWHPR04MB0911.namprd04.prod.outlook.com (2603:10b6:301:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Sun, 4 Dec
 2022 22:09:26 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5880.013; Sun, 4 Dec 2022
 22:09:26 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "mst@redhat.com" <mst@redhat.com>, "ani@anisinha.ca" <ani@anisinha.ca>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs/acpi/bits: document BITS_DEBUG environment variable
Thread-Topic: [PATCH] docs/acpi/bits: document BITS_DEBUG environment variable
Thread-Index: AQHZBxrC0+WRI2tqQ0CxblES4A1iMa5eS+SA
Date: Sun, 4 Dec 2022 22:09:26 +0000
Message-ID: <6e398f40b980f314b0316746e3e8d9c41c3894a7.camel@wdc.com>
References: <20221203132346.34479-1-ani@anisinha.ca>
In-Reply-To: <20221203132346.34479-1-ani@anisinha.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|MWHPR04MB0911:EE_
x-ms-office365-filtering-correlation-id: 59bbab75-9356-4b17-8e05-08dad6443505
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ajlV0XfTg9+LxbHKNLWPK8LtU81OXXWYUrmNZE3+B7YP/fYVqSNLcaCDoSVqbf907OmR+Fkh0j6qugQZOAndInAf3zpy9O3VRY9P/6PTr/rKCN1/o3Yxqinh/gic/FIBQOpXqX1c3KTVhItRWJ9rOv+p1jU+xKJ4F8hULFtLSqmYCgntjvUijWWOZu3wi1FuvNX7B4rI99YRpSMNqlbCs3Dg0tjGDVEG2LZr80mEs9GhMkIo+qmK3HbLAPCCYa4PejrdCf1fQb/bSG6ysG2NyqWT50EDjOqrIAtqK/rpuuUOQaqcaigwUS7VTZiZAKUicru4kVzP4FrTrCEYwtDlMAqCqXDMafwKJbUMnbre+ssHeyAmAMRKDwXDoYRXs2soB7SepjoLKupkTZwQ56xFbZDPT99FhtNo3wT2N6QkUkQOTQFxLhRlwXTdftqQh4Ttgmjkmqc/dbkh2IVRhzlejr5cO+zMnnvSiQmlW01lysNe2WxQS1VFtOHBiv8nuS9AcTdrnwLODGvAzwVkGd7GxFqDOVHKeaqqbapAAa/jePhtqW5F94+p8rwUn+lEOdzzNAZLSXIgObrinmIEVG2CUPVJ+Ubd+dlc97qC1r3lHzW/aXfGCBKp/Et/YAuX9O5x6YmAeu2tT58xasMy+WDSvIP8pK3tAqkgyut1QqjBV0xGyeZWAWpv/0wX46B8Uytofy9DRLo8oBD7urrF7gFIGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(38070700005)(2906002)(5660300002)(82960400001)(44832011)(83380400001)(122000001)(38100700002)(86362001)(2616005)(26005)(6512007)(186003)(6506007)(110136005)(54906003)(71200400001)(478600001)(6486002)(66476007)(64756008)(91956017)(316002)(66946007)(76116006)(66446008)(41300700001)(4326008)(8676002)(66556008)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnY4cmtaVU1QQVduUEtqSXZTTm00VjNaTFB4VFE3NFFsRHRJMk5OdXhrYUVE?=
 =?utf-8?B?cWVoWnM1M1pUNG5vOGFhK3BRMzQ5MWZjSHN3b2EwWitYa1JJbm05M2RDY3cx?=
 =?utf-8?B?R3Bvb3U3WG9VNW8zbVdzYjJiWmlISTFUWTdDZXZBRFFWcTBaZWkxbTZPcWg3?=
 =?utf-8?B?YXREK2NtVHFiU2NBTXFQZ1gwRGJHVU9ISTJvWXdTN2RaR0xMT1VkNTBlR1R1?=
 =?utf-8?B?bk9uOWFLeHgxdzlQYUk0OGJ3SXI5d1JobmhpYmlpa3Q5ZnpCRWdmOHl2cVRh?=
 =?utf-8?B?WnErSTNvcHlzWGJzOXdRQ29PMnBaKzRZazUxZUMraTZ2bktmY0RPUEpXdndW?=
 =?utf-8?B?YkoxdVNlNVpUVEVER3JqTXNPMXRyNWI4bHZ4WVljZ1FpZjFwOGlWTExacDV4?=
 =?utf-8?B?c0JrbitaaUdvbVZnWlloNTZybUxPNFQzRXdJcDBRdW1abjVhejU0VFZjRCto?=
 =?utf-8?B?NjRQQnYxaDN1czIvcEpwekpjOXpkUVRBZGlsMndqOHYzcDdzKzM2SmpXbjZK?=
 =?utf-8?B?NldGTWthWWlNWHNXejJVdmE0Z3dTYkZpOXA4VDd2cHZCZ2FLR0JqdHdBSWJQ?=
 =?utf-8?B?Rk5qMTZnaVY2R3RjNFhYOEJyR2lma00wZ2RsaVZwTTh1aEZ2bnIwenZHdVMr?=
 =?utf-8?B?Q2hpTkJoRnUvdTdQT2ltdDBkNnlxbS9SU0VFc0FpaS9IWHJ4Y1pvK2RDdjlO?=
 =?utf-8?B?eWtIb2dCamRCWnJNMFgrNy9zSDFTeGRQemF0a0ZuTFRRRGsxcTd3MTMvaWZP?=
 =?utf-8?B?M29PeVFmS2VrQnZlMEF5cUc1Y3RWOHN3SGpRZnl3UG1Vc3Q1bkV5K2dZQllD?=
 =?utf-8?B?TWJyaC9ncTQrSFp1SGswME1UalRBSmJhLzA4S1JyY2Q5WTdCTHRWY00rY0Mz?=
 =?utf-8?B?d21ZaGd1YXo1Rm5rcmg3ZjhQdGx5TjFzYzE3ZzVVYmhPZlRxV2duTkp0RHZj?=
 =?utf-8?B?amxMQ1FVc1l5Rkd5ZnJiLzRETERSUWJFYlFCR0pGakZzWUlTdmFSck9ORzB5?=
 =?utf-8?B?T0VVWkxnWCtjK3Q5U09Uc3ZkcnJEc0pOUGxuT0c2a2RCSXY2Z0QwNXJiNVNa?=
 =?utf-8?B?dmU1YXpHWHIxVGZFSnQxdWNwYzMwRmJjNWNQZHdPZXRXam9FRUxtV1VscFFl?=
 =?utf-8?B?MmFxeVBnOUZFTzl5SE1iL25VZVk3Ri9HS3Vmd2FSNG92RExBWU9FYVp0SlB2?=
 =?utf-8?B?WFRybm1ObEZBT212NFY2TW9RL1JlQTd1eVRtWnlwbmZxejluT0Q4ckRSYnU0?=
 =?utf-8?B?V0d3a1BWT2RGdDB3cVV0ZVEweU95T3Zua2RYR3ZENVd2dFUxZU1OZnBKNS9n?=
 =?utf-8?B?WlFWc29VaU1QQWlCSWc0N05IY3ozYy9Rd2F4R1p6c3RkZzdCRXJ2eG9YWEx5?=
 =?utf-8?B?MHU1NDRZR0tzZTZ6dk5TZnhNQWtMbUh3MmdNSDAwT0tlNy9kV1NpdmVrZHZr?=
 =?utf-8?B?TGdpOHZadURkNHVLd3R3MVVmNyszaVh4NU9UeHhHY0kzMnhjQXVkcGorVkp4?=
 =?utf-8?B?d0d2emk3THl5eFhzaUowVlFscWthY3VFVjVUVGE4Y0JmTGZWU1M3cVdjZ3d2?=
 =?utf-8?B?MDhjeHZyZ0ZHSCttVjVXUWxlTjliZFpHZDlTaHpQc3ZOeXVhTzJIZHhPeGJL?=
 =?utf-8?B?KzhZQTVLN2k5RW0xOHp5VzZOdkg1MGxQT2NYZlRpV1ZwczlaWmtOMC9zQjhv?=
 =?utf-8?B?ZGhtcFh6bVJsa1JUL1k0OURldGEwRG55TVo0MTJ2OWRiWXU1SThMVFFXRTZ4?=
 =?utf-8?B?RnlocFgzVVk2VStkbWp3VXZPdGlaRTBjSHBLRmpQSHRvMEIzNk9qdlp3Y1ZV?=
 =?utf-8?B?QjZWa3ZnSk5iOTVtWlNTY01OZGRwbTZwUXRtS3FWSUsyZE5KaGxFcnN0WGFm?=
 =?utf-8?B?eGxuYWVqa1Q4QjZJMjRFdFNPQy9FcFpwY1dtbUVGbUF1eE1EQ28zTWlsOG4z?=
 =?utf-8?B?V3B2N0xhL2lpWTdHTXl6KzlsVDlJaHFydjY2T0kzUHlvdkR2MDA3WXlZNzg2?=
 =?utf-8?B?TzkxMFZBdTU2YlNJdWJSTG92ZUpsQldMc1Zpc1l5K2g0WG1jd3VRLzlqS0pq?=
 =?utf-8?B?WDBQWE5ZRzMvakh3Yk9oT0N3Yjc2d2xDTXhTN3l0Z2VaRGFFMm1pY3Ivb2lz?=
 =?utf-8?B?SGRwM0svZFhkNW1YdlgrSnltc0xaVFRVR3hvbnQxSGV0dW1iYlBEQUNqSlZw?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <965BAD76DF07724084DCF900209FCCF7@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +gxG2GQ1h5xn2NRiRrTQitzUFABCL0YCX6QW9LbnItEUPA2K1GdNib+5p1erXro25ROh7AO/4I2zfn0wJjTk1Dbdv4yKIT4RbriOue+3RIZWqEkA3XOU6Av4SOnj0+5KWiXHSgx6gj9MhWzpVQdem3ytG7WbOU08afaNMyDShwg+/vsvDrG8/vTYKmLad/8t6xS9YYKCTtsBO9cmy0RLM9uhGO5zejXLOXJcXCq/OSOVMusAPtIm3JBJiRfK2iXpGDX20ok+hMfW+WhV4laNTBw5rFY7UaQKBrHdIgmG3ZINyxnFp/HKj6lddHFY3HTpof1imi5uIx7q/FKFVMdhFhCaUidlIioHHtmNMUA8bDP2vZ8w62Nh0veKh478emgKxx15Hld8mBVSjwzeNf0aF1ThyzGhVOBOl6Jw4jRz07O8FBknvSbKrEbMqNBsiY1DHLOuB+puVulBj+JADTYBIBBWrZEtwSL/mo30dv1She9Pnx21fmcx7fGkikFV8KD7nprMpBMOWSdfgHcT4MvukXaic6svgOrrfd14kOUEIJBPGe6RK8GvJBfnhFscZz4m7uq+iyP3/1fJXrsxh2+adtfHgTFJSeP6NKwe/jKGYIJqfMs2KrMF0qyQl4Ee5+ITQqHNz/DLSmWZaY29Pf4DHnqjC5p3aiyxNzZfhVKRShWWRCyrXx5QHenF7SZFoAIvvGyr7F/7V6LVwEEH+huKN0PA7MUhmtI6/t9WD2PB4LKPL9fCyJM9COIuP9Hv0eIoaZR1Ju1oC98mqilvvONtr1Nndudi2zeVTmop2LEgW1rWfxA6XG+9pAAKXwi/INLwggu6ilTUa9rEMqmw9y6RPXv2ojuKyuu2576SvLufjcs=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bbab75-9356-4b17-8e05-08dad6443505
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2022 22:09:26.1398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/5dIGrvDav6I7k7eyxu9ERY3Xw4VVQaoLsFflcdQwqbRYzYkYT86RVtRLNZPv6/6wQHvXdU/OvIIjzjTGmHdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0911
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=330fc4baf=wilfred.mallawa@wdc.com; helo=esa2.hgst.iphmx.com
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

T24gU2F0LCAyMDIyLTEyLTAzIGF0IDEzOjIzICswMDAwLCBBbmkgU2luaGEgd3JvdGU6DQo+IERl
YnVnIHNwZWNpZmljIGFjdGlvbnMgY2FuIGJlIGVuYWJsZWQgaW4gYmlvcyBiaXRzIGFjcGkgdGVz
dHMgYnkNCj4gcGFzc2luZw0KPiBCSVRTX0RFQlVHIGluIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJs
ZSB3aGlsZSBydW5uaW5nIHRoZSB0ZXN0Lg0KPiBEb2N1bWVudCB0aGF0Lg0KPiANCj4gQ0M6IHFl
bXUtdHJpdmlhbEBub25nbnUub3JnDQo+IFNpZ25lZC1vZmYtYnk6IEFuaSBTaW5oYSA8YW5pQGFu
aXNpbmhhLmNhPg0KPiAtLS0NCj4gwqBkb2NzL2RldmVsL2FjcGktYml0cy5yc3QgfCAzICsrKw0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNClJldmlld2VkLWJ5OiBXaWxmcmVk
IE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiANCj4gZGlmZiAtLWdpdCBhL2Rv
Y3MvZGV2ZWwvYWNwaS1iaXRzLnJzdCBiL2RvY3MvZGV2ZWwvYWNwaS1iaXRzLnJzdA0KPiBpbmRl
eCA0YTk0YzdkODNkLi45ZWI0YjllNjY2IDEwMDY0NA0KPiAtLS0gYS9kb2NzL2RldmVsL2FjcGkt
Yml0cy5yc3QNCj4gKysrIGIvZG9jcy9kZXZlbC9hY3BpLWJpdHMucnN0DQo+IEBAIC01Miw2ICs1
Miw5IEBAIFVuZGVyIGBgdGVzdHMvYXZvY2Fkby9gYCBhcyB0aGUgcm9vdCB3ZSBoYXZlOg0KPiDC
oMKgwqAgZm9yIHRoZWlyIHRlc3RzLiBJbiBvcmRlciB0byBlbmFibGUgZGVidWdnaW5nLCB5b3Ug
Y2FuIHNldA0KPiAqKlY9MSoqDQo+IMKgwqDCoCBlbnZpcm9ubWVudCB2YXJpYWJsZS4gVGhpcyBl
bmFibGVzIHZlcmJvc2UgbW9kZSBmb3IgdGhlIHRlc3QgYW5kDQo+IGFsc28gZHVtcHMNCj4gwqDC
oMKgIHRoZSBlbnRpcmUgbG9nIGZyb20gYmlvcyBiaXRzIGFuZCBtb3JlIGluZm9ybWF0aW9uIGlu
IGNhc2UNCj4gZmFpbHVyZSBoYXBwZW5zLg0KPiArwqDCoCBZb3UgY2FuIGFsc28gc2V0ICoqQklU
U19ERUJVRz0xKiogdG8gdHVybiBvbiBkZWJ1ZyBtb2RlLiBJdCB3aWxsDQo+IGVuYWJsZQ0KPiAr
wqDCoCB2ZXJib3NlIGxvZ3MgYW5kIGFsc28gcmV0YWluIHRoZSB0ZW1wb3Jhcnkgd29yayBkaXJl
Y3RvcnkgdGhlDQo+IHRlc3QgdXNlZCBmb3INCj4gK8KgwqAgeW91IHRvIGluc3BlY3QgYW5kIHJ1
biB0aGUgc3BlY2lmaWMgY29tbWFuZHMgbWFudWFsbHkuDQo+IMKgDQo+IMKgwqDCoCBJbiBvcmRl
ciB0byBydW4gdGhpcyB0ZXN0LCBwbGVhc2UgcGVyZm9ybSB0aGUgZm9sbG93aW5nIHN0ZXBzDQo+
IGZyb20gdGhlIFFFTVUNCj4gwqDCoMKgIGJ1aWxkIGRpcmVjdG9yeToNCg0K

