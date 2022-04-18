Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF304504DED
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 10:35:07 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngMqg-0004Kp-Gc
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 04:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=100272efc=Damien.LeMoal@wdc.com>)
 id 1ngMoQ-0003cS-36
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 04:32:46 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:55212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=100272efc=Damien.LeMoal@wdc.com>)
 id 1ngMoI-0006Mo-By
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 04:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650270758; x=1681806758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YXQtPRouIWjcSh+NNaniMUvsqtn6bYUyU3BQMIDmFGs=;
 b=Uudja3v7DiGuh942NXfZPxpFp/uzxA2gexBJNnuSYs28QKz1xI4WuOX1
 PkTC4UaXuctfmw6COwWoVkx6IuRxYzgrCxSTwNH3aZz6DnVldZZ1NS+A9
 zSEU8bmXyC68Kgc6sda3j4nsjGMwUZBg1dHLmNSmUlTBygg6XNxAodyRn
 8GhPIZVbgrqNGdavhg1lDYXl3xqtwGA5odhmISMEPwq9XNczsmDGyrJqY
 zLNPKZal/+vOu/xAr3O2LY/ki15RLNeIQCW0pSWMywnNmp+cjtfmrTBRP
 BlrpvOirTQ5lJ/ONDJv/TUrzp0pF3o84wU4i14WaxMVA3LOMS1vKyC989 g==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; d="scan'208";a="310122641"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:32:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMrPNuGrE9OowyTmpuYHCOy5RtvAHejz7etbetT7FmHxWK9lCfZ4KXNvHc2w8b5mwloqnr4LN5TvMhpI0+gGxUcJRiZeDlP0LVCkvCpuQRAvQEFmsx4q9wR05GM9Qvhwdc1iYCs3h8WSjS+8ZQZuD9b+yQ89JEivCGnK5NqC08FHMJ9aHZbAxkAhfqvDnSGwueOS8/lNJGUeK9kCP1TtP0hedrXz2JjRfEVC2NBc9TG4VzwQXTHiBAIruqusdXUpWw6FMZlCJnSkKCeGr3SvrSD47Wj5NhbCylUGw3OYFUkMCfGc8ui2Mm9WO//4bRiOQ5ajmlx+vEu2QYN78xI34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXQtPRouIWjcSh+NNaniMUvsqtn6bYUyU3BQMIDmFGs=;
 b=PfEQx4kaZpuR8OuxP+lqo0BvgHUmkjBUaJDCyKOOg+ESnYF4k/0pCmKVyGjvsi51lhtuiWSS/n9tPMufBVtzdSUznB3rUaxYpKyff6wAqn9D+/R5XMCkd2WjPA//YGs8cNInP/uEBoXrg5OlGAr+Z9BbB5nqkSUhJHY0GWu7469o4TEXxm9AEmFRDqvysFJe0VpSNSWGnYSGypyPXrEEEg58vos1dtMXt6XGLk6k9Sywn6ElbwxJn19BrtfPXR3SY6uNeOpbdWwFqUQ1zufJHP1eeLSkhq54N2vWm3hgiCScJpJk+4mJ0qFgAz2yoQIBfCHKqNpKYZydi9hZamSQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXQtPRouIWjcSh+NNaniMUvsqtn6bYUyU3BQMIDmFGs=;
 b=HI2B2h3Irgl3WHAK/IiFMvPWqkqzBkq253nxampU73/Lm2xtbdoAuDqiVav7+ORzDj//KTSnr/f1mzRDcBepzFI1NU7C3H8+P4bB++MaoWTwm0v2+vF6MGT6YgHgCwr/HAIAXcAT7ZGBhvrlkFp3joQfO8yF9qjms3aGdix22EI=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by SN6PR04MB4621.namprd04.prod.outlook.com (2603:10b6:805:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 08:32:32 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4ce8:17ca:a43d:4bfa]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4ce8:17ca:a43d:4bfa%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 08:32:32 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sam Li <faithilikerun@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Stefan Hajnoczi <stefanha@gmail.com>, Dmitry Fomichev
 <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] Use io_uring_register_ring_fd() to skip fd operations
Thread-Topic: [PATCH] Use io_uring_register_ring_fd() to skip fd operations
Thread-Index: AQHYUvlOhcQkY3I1P0+tbJsIQWAwkKz1V7uA
Date: Mon, 18 Apr 2022 08:32:32 +0000
Message-ID: <6df40dd9-4c5a-42f9-83dd-62fc9270166d@wdc.com>
References: <20220418075228.42882-1-faithilikerun@gmail.com>
In-Reply-To: <20220418075228.42882-1-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee7f4094-7730-48c9-11df-08da2115fb8c
x-ms-traffictypediagnostic: SN6PR04MB4621:EE_
x-microsoft-antispam-prvs: <SN6PR04MB4621DB58457518E1AD5094D8E7F39@SN6PR04MB4621.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NI2R5JQI7rT/9oncDSddBH2zDRkgVJaNSTEjuW4fmPXLbk2/21f6rfE+E4osL4sva3HwRImz+qftySbl1q3k+whzP5UUab90PLMqZS/St10nW2BGG+kku+WII+TvEUl6Y8oKwicJiMq3GcEuDNK5MZaoMNqQeYkQ+PogfhrU/kqvc3tf1MEdBJmDo6zASU9ekftBy6ws41kPMpOpIIW2EpKvANm2RFsFV7uemM/bdqIwaHyfONiqjVGz8ylhr8DUKe8GGp1OA3yRSx2V7V0YFR79IZtM7X3OULc9P0Uik7scjDRKUeGE197jgQ+03q4iVPPpL7UyVmArMCpAtz0rNCYwTbrdZ0KAnXXYKxhxmOKxSRsblgLCFxom3Zc0mQumjgM/GXscnfqX76LpY/Z36yRdQrGXFbBu7TQVVevKR6KvdVhZrRV0QFb1RF/RAIc/1YGo047PUdEeAwg4fjUY3MEFIyyvU/zG6f1q+/Hj3qgG5j/1pqFBxeZ0AGZ+JGOQ6OzBULhI3fRUxAm9DAEOo6h11cgUCjNesSgho+OHyuUys3eDANz95vMoB41BJID9X4hnyb0rVWlG0dtEzSNKgJ/TLYvDJWHS+tS3JQLhyIHgef4rXBrTfSBlQe/E4qDOVo0tMArLAyPKJBJdviZ/ZWQ2lRvaRIQQrPB2Qbf2b/0xCleaF9IKhjaxOy6icUuasrCh4SPpgJQC3PtB4Wi2BTeamBrGE7wcNo0u3180b8KMzUo5LARB4NsechZCpWFIaKJraApp7q+oqWPqOWPUeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(82960400001)(110136005)(5660300002)(8936002)(508600001)(54906003)(6486002)(6512007)(83380400001)(38100700002)(38070700005)(316002)(122000001)(2906002)(6506007)(86362001)(71200400001)(31696002)(53546011)(4326008)(8676002)(36756003)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(2616005)(91956017)(31686004)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFhaQnhoMUZINURIWnlZNzd3bk1yNk1FU1pkVW9EcTBiRzlieFQxSFY5WnZD?=
 =?utf-8?B?d2RZWGpHdm1CWXA1WUJVUXRRWlJKdHdkTGdlUzlLWlRONkZmWVQzeEg5S1JL?=
 =?utf-8?B?Wkp6TEpZak41cUIzVkZWN1F5SG5ucjNXMlpVeVVMMmc1eGMrZEx2OHlqaWJF?=
 =?utf-8?B?Wkl4ZTNoM2hlR0srQWFvV0NzejRvSWMreU5zRlBlMDNsVGk0YXdHUnVDaCtu?=
 =?utf-8?B?eitzWmFBSk03T0cyWWtrUjV3OGF5UFlVaHRCTHlyQXFJSUdjUnJrZnRjYVE0?=
 =?utf-8?B?ZmVqQmNFKzFVeTg3WklMKzVTL1p0L1FDK1JTZ3MwaXM0dHV6THI0S1UzUlNy?=
 =?utf-8?B?ejZGKytxTVd1ZnRvdDlrOFNMVVZGeFVLVVZCTW1kNkZ2TzkzSElJMWFCc0RX?=
 =?utf-8?B?bzdGRlFUM3AzSXUxdnBVZ0NvdzJpZ05mek85UitlNS9jdmxJQTMyck5SdkQ3?=
 =?utf-8?B?Z2ZKZEQvYmhZbUxDZjZZc2pNOXo5WjQrZHRqV1BvR055eEJBdlFHVjJOWTlH?=
 =?utf-8?B?cWo0NEVWNkhreWRBVXdyYzViVG5RZU5xSWE5RWJyTEFXQitWa3F0OE9Wd004?=
 =?utf-8?B?dmtOd3NxbzFUdGxHeE05NjRMZ1ZXZ0JkeDdZcFdOay9lRkhQT1Z4ckNrbmp1?=
 =?utf-8?B?eXB5WHBKYnIzV3ZtUzRTLzJSVmpBNW5kNzY5UDZSM0p4SWFKTG80RU10TDk5?=
 =?utf-8?B?RVJTdXNKYThlbjlZc2xXcVAvQWwvNm5xRDhvcUxiSjU0L3ZCdHFiMnJmRlQ3?=
 =?utf-8?B?R2VUK1ZVcHJwRSt0b1ZxbEFkNm15V3ppR0VxUUQ3OXV3YUR6Z0NNYmhNWHM5?=
 =?utf-8?B?NWlmLzVCdkFMWVNkZXY0d2JPVm40VnZUS3d0MmNBUDlZeklaZGJkYlpIM3pk?=
 =?utf-8?B?bmhaQzQvMzdSc1g4cGZtckV4NGppUitqYWZtQXEyaFZLZ2dTY1pEQTNESjdh?=
 =?utf-8?B?d2ZwSkxBQ0lneUs1ZFh6OXoyUHFzWmFwUTk0NmE3R2lQbXFDbVVlaFYyZjRa?=
 =?utf-8?B?OWxyQnFzT1N1QmhYYzlpcmViZitoeElQdjYyakpSVTV2UjZpb2tvb3FjR3Q4?=
 =?utf-8?B?TmFVZlBsOUlRakNMalFHZncvcnExbXJFR2lqbkFRTUFUbTlKTmVPc1lQQVdK?=
 =?utf-8?B?LzBOOFM1aWcwbDhoOTJockQveWF1cG8xRUg0K2V5V0w5VzE0TFNpT1hDMDY5?=
 =?utf-8?B?bnVNcURUWUlrQnZHd2kwTm1MbUhzU3JPZTA3Q0lqKzFZNStUd29mdTlzcDVv?=
 =?utf-8?B?U21TUGRSSmI4OW85djhzSGNlUktiUW5JdUorWWZ5dHdEZVdRb0lxZmJOTXht?=
 =?utf-8?B?ZDU0bysxeDFhREF2VWVJcHhJM01FWEt4eFU5ellOWXV2NmszUWE5ZE8rbVJ1?=
 =?utf-8?B?azhLaitEK3JEMEE0Qzdwa0g0dEVESkhHa3BxMnhCVytZQkNHNExycjVCTk9o?=
 =?utf-8?B?dkxjeXJFNWJGdm84cUE0d3hwUFlrOWpJUlVWNDE5RVRyYncyUGRYb3hQTTJB?=
 =?utf-8?B?cDVMQzFTSDhqcU1JWnU1SHR6c2R2ZEZtVGFIdkErQjE0ZmdLSFBhQk9POTlm?=
 =?utf-8?B?cWxIZTFxSzhaOEZtdEZHNDk5RjRJbDljVzBlNHlaanZuMTVxSEJ3ckY3ZWh6?=
 =?utf-8?B?MWNVQ2Roa3ZrTWlxTU93eEtCVnFVN3Nqam5meTZxOHZ0ZFdvOEQxRDBsZ05F?=
 =?utf-8?B?bDRNOVBkZnF6MzRyQ0hMNjM5Vm0wWGsybG4wcmErTjFZK2NIS3hDK3VaWWVC?=
 =?utf-8?B?RjhrM2J5OEJ4WWQ4VURzOTZ1Rm0xa1FBMjdER1kxNVNxeDVqUFdYQWNWeTBt?=
 =?utf-8?B?bWVzZUtBUk1mek9ZdkFYd3FjQXpTVWpjeTAzbXlLMGVRU1MrbEtTZDk5WmhJ?=
 =?utf-8?B?VWNoWlEzbHB4SHNvYXdqckZBM2RReGJnbTNBc05icmEyaU5tQXRCR0dveG1k?=
 =?utf-8?B?alNWRE1FWHk3bXRPeXdrRE45aG9zajdaMC81YzdvOGsxYi9keUJTSDRPS2V2?=
 =?utf-8?B?dnFkZ1VLbUg4d0tZZS9pTjhmbThLbGF2RTlLdktRbWhFcHlveGpIM2Zvem45?=
 =?utf-8?B?MHZjTkJLQmh0UzFxajQva1pZRmk0VlhnMlFxalRkTUZSY01EU0NybUxFdE4v?=
 =?utf-8?B?TGFhNHpxY2o2KzBOOWpNM0lLMHBjQUN2NVozNXlIVzVTWkF6QmNhWkJ2SFdN?=
 =?utf-8?B?Q3lFelBiTEsvQkl3OEJ5d1BSaDBDT2FEQ2VYV2FjZjBDNFF0R0NsOXFFYVJF?=
 =?utf-8?B?V002WHd3d0VzT2pjWUtsZkJLcE0raEdXMUtmbkorYjNmREMxQ2gxa2FWa3pK?=
 =?utf-8?B?WlNlM0VvRUpVY0ZOVDlCbVgwVmovU1l6SzhCaFA3TldSd2xMQjkrQWpHOGV4?=
 =?utf-8?Q?9sA+B47mBOb+0p3Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C8B9E02206C3E4FA81E0483FB86EFF8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7f4094-7730-48c9-11df-08da2115fb8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 08:32:32.3243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogDuAKuxzl++P29K1amF2bRSGrGIVBWnRscDlv+P55ZUvDziRgQO/CvDzTijThPo/HFgMsC9cShXaoXLq3b4KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4621
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=100272efc=Damien.LeMoal@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

T24gMjAyMi8wNC8xOCAxNjo1MiwgU2FtIExpIHdyb3RlOg0KPiBMaW51eCByZWNlbnRseSBhZGRl
ZCBhIG5ldyBpb191cmluZyg3KSBvcHRpbWl6YXRpb24gQVBJIHRoYXQgUUVNVQ0KPiBkb2Vzbid0
IHRha2UgYWR2YW50YWdlIG9mIHlldC4gVGhlIGxpYnVyaW5nIGxpYnJhcnkgdGhhdCBRRU1VIHVz
ZXMNCj4gaGFzIGFkZGVkIGEgY29ycmVzcG9uZGluZyBuZXcgQVBJIGNhbGxpbmcgaW9fdXJpbmdf
cmVnaXN0ZXJfcmluZ19mZCgpLg0KPiBXaGVuIHRoaXMgQVBJIGlzIGNhbGxlZCBhZnRlciBjcmVh
dGluZyB0aGUgcmluZywgdGhlIGlvX3VyaW5nX3N1Ym1pdCgpDQo+IGxpYnJhcnkgZnVuY3Rpb24g
cGFzc2VzIGEgZmxhZyB0byB0aGUgaW9fdXJpbmdfZW50ZXIoMikgc3lzY2FsbA0KPiBhbGxvd2lu
ZyBpdCB0byBza2lwIHRoZSByaW5nIGZpbGUgZGVzY3JpcHRvciBmZGdldCgpL2ZkcHV0KCkNCj4g
b3BlcmF0aW9ucy4gVGhpcyBzYXZlcyBzb21lIENQVSBjeWNsZXMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBTYW0gTGkgPGZhaXRoaWxpa2VydW5AZ21haWwuY29tPg0KPiAtLS0NCj4gIGJsb2NrL2lv
X3VyaW5nLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2Jsb2NrL2lvX3VyaW5nLmMgYi9ibG9jay9pb191cmluZy5jDQo+IGlu
ZGV4IDc4MmFmZGI0MzMuLjI5NDI5NjcxMjYgMTAwNjQ0DQo+IC0tLSBhL2Jsb2NrL2lvX3VyaW5n
LmMNCj4gKysrIGIvYmxvY2svaW9fdXJpbmcuYw0KPiBAQCAtNDM1LDYgKzQzNSw5IEBAIEx1cmlu
Z1N0YXRlICpsdXJpbmdfaW5pdChFcnJvciAqKmVycnApDQo+ICAgICAgfQ0KPiAgDQo+ICAgICAg
aW9xX2luaXQoJnMtPmlvX3EpOw0KPiArICAgIGlmIChpb191cmluZ19yZWdpc3Rlcl9yaW5nX2Zk
KCZzLT5yaW5nKSA8IDApIHsNCj4gKyAgICAgICAgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJu
bywgImZhaWxlZCB0byByZWdpc3RlciBsaW51eA0KPiAgaW9fdXJpbmcgcmluZyBmaWxlIGRlc2Ny
aXB0b3IiKTsNCg0KVGhpcyBsaW5lIHNlZW1zIGJyb2tlbi4gUHJvYmFibHkgeW91ciBtYWlsZXIg
d3JhcHBlZCB0aGUgbGluZS4gSWYgeW91IGNhbiwNCnBsZWFzZSB1c2UgImdpdCBzZW5kLWVtYWls
IiB0byBhdm9pZCBzdWNoIHByb2JsZW1zLg0KDQpUaGUgbGluZSBpcyB2ZXJ5IGxvbmcgYW55d2F5
LiBTbyBpdCBwcm9iYWJseSBpcyBiZXR0ZXIgdG8gc3BsaXQgaXQgYWZ0ZXIgZXJybm86DQoNCgll
cnJvcl9zZXRnX2Vycm5vKGVycnAsIGVycm5vLA0KCQkiZmFpbGVkIHRvIHJlZ2lzdGVyIGxpbnV4
IGlvX3VyaW5nIHJpbmcgZmlsZSBkZXNjcmlwdG9yIik7DQoNCkFsc28sIGlmIEkgdW5kZXJzdGFu
ZCB0aGlzIGNvcnJlY3RseSwgeW91IGlnbm9yZSB0aGUgZXJyb3IgaGVyZSBhbmQgdGhpcyB3aWxs
DQpuYXR1cmFsbHkgZmFsbGJhY2sgdG8gdGhlIG5vbi1vcHRpbWl6ZWQgaW91cmluZyBvcGVyYXRp
b24gd2hpY2ggd2lsbCBkbyB0aGUNCmZkZ2V0KCkvZmRwdXQoKSwgcmlnaHQgPyBJZiB5ZXMsIGl0
IHdvdWxkIGJlIGdvb2QgdG8gYWRkIGEgY29tbWVudCBiZWZvcmUgdGhlDQplcnJvcl9zZXRnX2Vy
cm5vKCkgY2FsbCB0byBtYWtlIGl0IGNsZWFyIHRoYXQgdGhlIGVycm9yIGJlaW5nIGlnbm9yZWQg
aXMgbm90IGFuDQpvdmVyc2lnaHQuDQoNCj4gKyAgICB9DQoNClBlcnNvbmFsbHksIEkgbGlrZSBh
IGJsYW5rIGxpbmUgYmVmb3JlIHJldHVybi4NCg0KPiAgICAgIHJldHVybiBzOw0KPiAgDQoNCkFu
ZCB3aGlsZSBhdCBpdCwgSSB3b3VsZCByZW1vdmUgdGhpcyB1c2VsZXNzIGJsYW5rIGxpbmUuIENv
bXBsZXRlbHkgb3B0aW9uYWwgOikNCg0KPiAgfQ0KDQoNCi0tIA0KRGFtaWVuIExlIE1vYWwNCldl
c3Rlcm4gRGlnaXRhbCBSZXNlYXJjaA==

