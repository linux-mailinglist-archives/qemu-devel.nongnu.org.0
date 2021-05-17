Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9A38255F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:30:55 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXiI-0005kS-Ii
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1liXgX-0004ui-6x; Mon, 17 May 2021 03:29:06 -0400
Received: from esa8.fujitsucc.c3s2.iphmx.com ([68.232.159.88]:34280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1liXgR-0003kK-Vs; Mon, 17 May 2021 03:29:04 -0400
IronPort-SDR: nB6x8msP8X1Z3JfXap6pgjS9LIP4UUIaKc3UY7p97BDw/cXIIFZz01hSK6x3Xm5PxxzgdFY7Kp
 nSiyoD1mFqQo6UzYkWypVkqVxA7JNy+KloOmeqkFalvwEfg/Gnt3F/x/O9niS8sZIiP3gwZVNL
 6AFRfN7jhuhso6+slEPm4LZJR/D3Hv5ikDO5tfOJ0QXZT58uoIkhGh0lkQdV/79hO72Wvb05dJ
 bQzDAewoOMpI4FyJFmJwyepCt1LAdDPdyv2AfTjRNxOLRLA8mM9eVM3YB+ryxKMp75AMY0pEpf
 I1s=
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="31407721"
X-IronPort-AV: E=Sophos;i="5.82,306,1613401200"; d="scan'208";a="31407721"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 16:28:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrM4YCTOPbu198lbdgULK4JquI2uS8LmoXnXM5y1gaul7cLdPXMaoFT7jL2yiyY99K+zODQXnQvrO38s94mINZBEL8AFtmEQUwLGRkojvZeqZxnUp+cVO34pV5Rl/YoTSi4NWywRT2kFU2HJa5HnzQKDyojzJg9QqgffiT8qUYnWpLYt1q68JoDI7864+nMHgROdeOnPFCNJDf6Zch9yWB1KfchB/P0p/hvEmee/03W6+fKgX6RGYU7kfnA4WkX/wDsl19C/ATcEX2KLsN3EkkwIz3jBt1nmp1aP0YJBBodqN77ikH6FBZZexooY0wrZ31drf21kwdoQqOYBqdITXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oty5ynqirwfzkvvsinore/hqdwH8ti+UoRHsOompEI=;
 b=gPUTCN1N/fH7rBW+bzSipgb5mVHad9h1gmahIi8JsaQsmMXSv84Cbk9KzLWokFjo4/1hL0YkR0CI5GThrte7igLxdEAoc+wui6mMFikiIzrtuZ+dvBKHApG6IshJU4P3/s0J64Nol1lHCo0s6Tuy4SV2/37vD59S45gnzq0wqPLQr55l1IsUBAOX4CkPBz5oT0NHA6udBkGlpw7O6kXHwLEd8OqMvCRkSfA3fAOXTKWkbcJFXrjzT1GCHmb2yWDldtLjgprTXQjQemyQ+AiG4GOkMo+9X2V9S3c+9hFNQuyukqmJwtOJfdu5plDDNU+v43Fi1VzUOa+Z9ruWOfwKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oty5ynqirwfzkvvsinore/hqdwH8ti+UoRHsOompEI=;
 b=nHIAWUnL0FJKJvPGvY/UV1tZLyyhvnAJZzr56yCu8e0IbVolrdo3lMhCQvxJEYsUxhFGRmc0yPmvmp+D6c8H79fuFblbQOHHuW7uY1o6jaxtUGTIRdrWmIYuy6/gGTwTWgXhO/Ov0bpknq1F354Vq4H9H3qpavv/ydCbTp5rLBw=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB5611.jpnprd01.prod.outlook.com (2603:1096:404:8052::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 07:28:52 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 07:28:52 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Kevin Wolf <kwolf@redhat.com>, =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2] block: Improve backing file validation
Thread-Topic: [PATCH v2] block: Improve backing file validation
Thread-Index: AQHXRipOmS2VIMyvKEm3SxxthultZ6rd9O8AgAIAmICAB1qigA==
Date: Mon, 17 May 2021 07:28:52 +0000
Message-ID: <391cfc19-3919-9e00-ec29-80e25a4c66be@fujitsu.com>
References: <20210511055518.31876-1-lizhijian@cn.fujitsu.com>
 <YJpB4IVbg8vHBiOZ@redhat.com> <YJvv34h42YF534Wa@merkur.fritz.box>
In-Reply-To: <YJvv34h42YF534Wa@merkur.fritz.box>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7f7d7a7-f97f-4b9a-3126-08d919056bcc
x-ms-traffictypediagnostic: TYAPR01MB5611:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB56113AAEF551E516A2876C59A52D9@TYAPR01MB5611.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SZppeK5VVhbm+a8P4L7zSxMEHaR7AA0MFzZaeisVh/27LiRTp3Mhsnw6Hvq2grz9cZdgsREjN7608cRn7FFp5KgWtLLpEMkAvDOWHlUca4KvqGWhvE+mYG4S9/DZETu5bRXDBF481+Tjx0OWfY4BVd8bWlrq7wLSow2DmMmcDYvFTWep8mqhz0xH5iOuCO9ovgLyXtwnSbzEEElrjN4hk0wqzuxszNf3ITZMbtbNTQLbT846GRu1D7v5H0XzaANWuasAw1/qh12PPzf8BGegxrN3zSztkrU5j9V9+kPYRs7r4BlPGzMCN6gcWdTDHmgAVnUO16z18AO6Q5pXGNnxGIgWyoXdlJPuZBub3RyTPBvwRhrE3H/NsvmyomnHUBKQof8CWs2gCwVnw9C1LRCMZ/rU1a/7Xy66hIFtXaeS13h4Zf6unoWv5XxB8RMZMKH8+TTz29DglYWneH1P0X+aF52aDGRH8IQh+4qyQpImKK2GCc8s2hSd5Hclg5fR+Sz883fbU49c2DBQRKyXDsZx+iZR65VyEcgJHSjjPPNdLzRY+5PPbmlYZIVgvN2FgT6024GBuDB98ILJ8npygHDP1FF5NMWilIGHQ+IC5/b8RgqjgbYeKD27qaWr+UeucIFcFkKaBrt+4WRC8EVhN7to5w0W7iqVnuTfJo9d3j6h+HY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(8676002)(8936002)(2616005)(6506007)(316002)(54906003)(31686004)(5660300002)(122000001)(64756008)(186003)(66556008)(66446008)(2906002)(71200400001)(86362001)(4326008)(83380400001)(6486002)(36756003)(31696002)(478600001)(110136005)(85182001)(66946007)(76116006)(26005)(6512007)(38100700002)(66476007)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZjNJajFtd2NlN3A4WjBXOEVpU1NrYzNiS25jL09HbFhCYmZFeDZKSzFITXhZ?=
 =?utf-8?B?OVdPcFp2L3lVNmZ1ejVQMDk3ZU5oeGtvbXd3aGJwVEFWd0xlRGw2eHBOSUVQ?=
 =?utf-8?B?bjJmRUVxRVJrbjR6QkdaZjNwMmZUNXRNOWpkRTZEQ3JaMkVtMEpRVEdZL0ht?=
 =?utf-8?B?Q2tNNUdvbFdiaGNCUHZGTzZkQllWaDMvc20zT0F1ZUVqbi80SEJwR3AyVWli?=
 =?utf-8?B?MUIrK0lWSEtnK3VRNmx3SldsTlZCUS9ZUFNwZDZCQndkNnhtanVwc29XKzFa?=
 =?utf-8?B?dncySk9mNDBaSTYycmh1QXJOSTVhb1BTekJwcXk0NXI3akVYZ3drTHFaU255?=
 =?utf-8?B?T0RYK1dMbTZsSnJSaUkrSWVaOHJuN2RqN2crVTdaSnNObjNBSVNDZ2hKbVQx?=
 =?utf-8?B?TGhidVQxYnFUcVJURjNPU0d2V05KV2FnNGlBUkhNYXd5VWk5eGFCekI4MUh0?=
 =?utf-8?B?TG5JaVNyL2hGQVdLQVBwKzU3QVQ1djcveXhsMUwxMEFEek4yZ0g5QmtncW9n?=
 =?utf-8?B?T0k3eWdSWmJYbi9NSDFqWlpRSkE1UUlBNjhUTDVEUjBhUEhkd2lyT1E1bGFo?=
 =?utf-8?B?OWlzNGVMSGtxdDRKM01yTXo3UDhyejZGbnFxazE1TEc1TXVWeG5sNjhmU05z?=
 =?utf-8?B?YkZjM3Zud1F4VHFzc1VDZkRFWVhoYWRScFRHRXA1VUVjak9KUXF4RzdHRWQr?=
 =?utf-8?B?OVBmZ1Z4Vy9JMFZlWFZxSUZRb2RuNnE0ckFKcnN5eXptQ2IwaUt1alc4MkEv?=
 =?utf-8?B?cUVCRjV6Qm1mbExVWU1ySHVpWk5jb0pjQ2hyTlNWRVl0dkY1b1ZkQ2NXVWYw?=
 =?utf-8?B?WC9hQU1ua3pwNWh5MHNhZUhHcVJtNVJYN1JyVHFGSmp5TXpqamxuQk5Ga2V5?=
 =?utf-8?B?WkZzb1FWd1BKWWdEcE9rdTBOMkwvS2luY2tRNnZiRy9uN2JZYWxhaFVsT0RE?=
 =?utf-8?B?UWZqQWlIVERiTk04WFlCaGZGeTlLNXl3Z1dZQjlpY29Ld1hXZkQya1EraHl0?=
 =?utf-8?B?VGJWVDJld0dPZHpuUXp4aTh3MnlNWFB1dlBQWWhKT1E3TE5hWnJ1TEJ1d285?=
 =?utf-8?B?NGw2R1F4M2MxYzBqalBEVFVDMFhEV00vdldXbFdvTlVOTjRpNk85Q2RrZkZ0?=
 =?utf-8?B?SmNteHB0Ui91STI4a05zZ2RUNlJzdXEvRERBc2RIWUpvUG9zYmlsWU1VVHda?=
 =?utf-8?B?bzg0NDVMSWY4K3hCT2p1NEgxSEMzaHJUYnpRdG0zWmJnRWhjWVo2aWF3RWc4?=
 =?utf-8?B?ckNrUGtWZVMyVENacHQxK1QxSWUzcU1sZkdoeVlNRldaRW9yMnVTUis0WkRZ?=
 =?utf-8?B?bXNNRWZ2dCtRbmpWRlFkZ09RdmdIb0ZLRzdqMUI4bmdZMzBoSkFydVdFTnEv?=
 =?utf-8?B?VFNCZXJ2MGV1anFBUEVqcGdvUHAzazcrcW5FV3p1RStndW9TMFAxTS95MENU?=
 =?utf-8?B?TmZKVklDbFlOTW9HV254NHNjK2NZUU55Sm5WQkZUSkN4YUZpNGlwaXliVHdu?=
 =?utf-8?B?bjlOZW15OVQ1ZFgxTklCelFVb0RjN2hpKy9QdWhPcVB2LzVpMGZiYk5yclNJ?=
 =?utf-8?B?eHBRQmFabTJjUlU3WVgxbDl4MjNXTjNzVDlXOVE2RjNtWXFEVExtMURFd29R?=
 =?utf-8?B?Tmw3Nk1UNVBDS0ZXbGdQY3JIQnhtb1pzdmlWQnRrSnk2ZjlhUzZOd0Vtcld0?=
 =?utf-8?B?U09RdjhrYjRFbHMrNVQxNEdyQjR3MU1IR3ZoZWtRazduQlk1WFhZSlJrVStw?=
 =?utf-8?B?bk9FZXFDRGJKZjJLTjZuaXNzN0tqWDNOS0JtVlhyV0g1eE5ucStMOFJSWFFi?=
 =?utf-8?B?MFlTVGhMTzZRTWcva0Zkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EA0570AF52B974CB6655813CB6D6980@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f7d7a7-f97f-4b9a-3126-08d919056bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 07:28:52.2951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgcolL5pQ2Uzr09e4XNoG6ETMjD4qeuzqIr2jVz3FuagtJaTCfNXDhRqQqgSaBG1mVSnHWiZf/dJ4GaA71toog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5611
Received-SPF: pass client-ip=68.232.159.88; envelope-from=lizhijian@fujitsu.com;
 helo=esa8.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDEyLzA1LzIwMjEgMjMuMTAsIEtldmluIFdvbGYgd3JvdGU6DQo+IEFtIDExLjA1LjIw
MjEgdW0gMTA6MzUgaGF0IERhbmllbCBQLiBCZXJyYW5nw6kgZ2VzY2hyaWViZW46DQo+PiBPbiBU
dWUsIE1heSAxMSwgMjAyMSBhdCAwMTo1NToxOFBNICswODAwLCBMaSBaaGlqaWFuIHdyb3RlOg0K
Pj4+ICAgdm9pZCBiZHJ2X2ltZ19jcmVhdGUoY29uc3QgY2hhciAqZmlsZW5hbWUsIGNvbnN0IGNo
YXIgKmZtdCwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmJhc2VfZmls
ZW5hbWUsIGNvbnN0IGNoYXIgKmJhc2VfZm10LA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
Y2hhciAqb3B0aW9ucywgdWludDY0X3QgaW1nX3NpemUsIGludCBmbGFncywgYm9vbCBxdWlldCwN
Cj4+PiBAQCAtNjUwNywxMyArNjUzOCw3IEBAIHZvaWQgYmRydl9pbWdfY3JlYXRlKGNvbnN0IGNo
YXIgKmZpbGVuYW1lLCBjb25zdCBjaGFyICpmbXQsDQo+Pj4gICANCj4+PiAgICAgICBiYWNraW5n
X2ZpbGUgPSBxZW11X29wdF9nZXQob3B0cywgQkxPQ0tfT1BUX0JBQ0tJTkdfRklMRSk7DQo+Pj4g
ICAgICAgaWYgKGJhY2tpbmdfZmlsZSkgew0KPj4+IC0gICAgICAgIGlmICghc3RyY21wKGZpbGVu
YW1lLCBiYWNraW5nX2ZpbGUpKSB7DQo+Pj4gLSAgICAgICAgICAgIGVycm9yX3NldGcoZXJycCwg
IkVycm9yOiBUcnlpbmcgdG8gY3JlYXRlIGFuIGltYWdlIHdpdGggdGhlICINCj4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAic2FtZSBmaWxlbmFtZSBhcyB0aGUgYmFja2luZyBmaWxl
Iik7DQo+Pj4gLSAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+IC0gICAgICAgIH0NCj4+PiAtICAg
ICAgICBpZiAoYmFja2luZ19maWxlWzBdID09ICdcMCcpIHsNCj4+PiAtICAgICAgICAgICAgZXJy
b3Jfc2V0ZyhlcnJwLCAiRXhwZWN0ZWQgYmFja2luZyBmaWxlIG5hbWUsIGdvdCBlbXB0eSBzdHJp
bmciKTsNCj4+PiArICAgICAgICBpZiAoIXZhbGlkYXRlX2JhY2tpbmdfZmlsZShmaWxlbmFtZSwg
YmFja2luZ19maWxlLCBlcnJwKSkgew0KPj4+ICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4g
ICAgICAgICAgIH0NCj4+PiAgICAgICB9DQo+PiBUaGlua2luZyBhYm91dCB0aGlzIGFnYWluLCB0
aGlzIHNlZW1zIHRvIGJlIHF1aXRlIGhpZ2ggaW4gdGhlIGdlbmVyaWMgYmxvY2sNCj4+IGxheWVy
IGNvZGUuIEFzIHN1Y2ggSSBkb24ndCB0aGluayB3ZSBjYW4gYXNzdW1lIHRoYXQgdGhlIGJhY2tp
bmcgZmlsZSBoZXJlDQo+PiBpcyBhY3R1YWxseSBhIHBsYWluIGZpbGUgb24gZGlzay4gSUlVQyB0
aGUgYmFja2luZyBmaWxlIGNvdWxkIHN0aWxsIGJlIGFueQ0KPj4gb2YgdGhlIGJsb2NrIGRyaXZl
cnMuIE9ubHkgb25jZSB3ZSBnZXQgZG93biBpbnRvIHRoZSBwcm90b2NvbCBzcGVjaWZpYw0KPj4g
ZHJpdmVycyBjYW4gYmUgdmFsaWRhdGUgdGhlIHR5cGUgb2YgYmFja2VuZC4NCj4gWWVzLCB5b3Ug
ZGVmaW5pdGVseSBjYW4ndCBhc3N1bWUgdGhhdCBmaWxlbmFtZSBpcyByZWFsbHkgYSBsb2NhbCBm
aWxlDQo+IG5hbWUgaGVyZS4gSXQgY291bGQgYmUgYW55IG90aGVyIHByb3RvY29sIHN1cHBvcnRl
ZCBieSBRRU1VLCBvciBldmVuIHVzZQ0KPiB0aGUganNvbjogcHNldWRvLXByb3RvY29sLg0KPg0K
Pj4gSSdtIG5vdCBzdXJlIHdoYXQgdGhlIHJpZ2h0IHdheSB0byBkZWFsIHdpdGggdGhhdCBpcywg
c28gcGVyaGFwcyBLZXZpbiBvcg0KPj4gTWF4IGNhbiBtYWtlIGEgc3VnZ2VzdGlvbi4NCj4gQ2Fu
IHdlIGp1c3Qga2VlcCB0aGUgYmFja2luZyBmaWxlIG9wZW4gd2l0aCB3cml0ZSBwZXJtaXNzaW9u
cyB1bnNoYXJlZA0KPiBzbyB0aGF0IGxvY2tpbmcgd2lsbCBmYWlsIGZvciB0aGUgbmV3IGltYWdl
Pw0KDQoqDQoNCk5vdCBzdXJlIGlmIGkgaGF2ZSB1bmRlcnN0b29kLsKgIEluIG15IHVuZGVyc3Rh
bmRpbmcsIG9wZW4oMikgY2Fubm90IHN1cHBvcnQgJ29wZW4gd2l0aCB3cml0ZSBwZXJtaXNzaW9u
cyB1bnNoYXJlZCcsDQoNCml0IGhhcyB0byBjb29wZXJhdGUgd2l0aCBmbG9jaygyKS9mY250bCgy
KSB0byBhY2NvbXBsaXNoIHdyaXRpbmcgZXhjbHVzaXZlbHkuDQoNCg0KQ3VycmVudGx5LCBxZW11
IGJsb2NrIGFsc28gZG9lc24ndCBzdXBwb3J0ICdvcGVuIHdpdGggd3JpdGUgcGVybWlzc2lvbnMg
dW5zaGFyZWQnLCBidXQgaSBmb3VuZCBzb21ldGhpbmc6DQoNCiNkZWZpbmUgQkRSVl9PX05PX1NI
QVJFMHgwMDAxIC8qIGRvbid0IHNoYXJlIHBlcm1pc3Npb25zICovDQoNCg0KQW5kIEkgaGF2ZSB0
cmllZCBiZWxvdyBjaGFuZ2VzIGFuZCBleHBlY3QgdGhlIGJsb2NrIGZhaWxzIHRvIHdyaXRlIHRo
ZSBpbWFnZS4NCg0KQEAgLTY1NjMsNyArNjU2Myw3IEBAIHZvaWQgYmRydl9pbWdfY3JlYXRlKGNv
bnN0IGNoYXIgKmZpbGVuYW1lLCBjb25zdCBjaGFyICpmbXQsDQoNCmFzc2VydChmdWxsX2JhY2tp
bmcpOw0KDQovKiBiYWNraW5nIGZpbGVzIGFsd2F5cyBvcGVuZWQgcmVhZC1vbmx5ICovDQoNCi0g
YmFja19mbGFncyA9IGZsYWdzOw0KDQorIGJhY2tfZmxhZ3MgPSBmbGFncyB8IEJEUlZfT19OT19T
SEFSRTsNCg0KYmFja19mbGFncyAmPSB+KEJEUlZfT19SRFdSIHwgQkRSVl9PX1NOQVBTSE9UIHwg
QkRSVl9PX05PX0JBQ0tJTkcpOw0KDQpiYWNraW5nX29wdGlvbnMgPSBxZGljdF9uZXcoKTsNCg0K
DQpCdXQgaW4gcHJhY3RpY2UsIHRoZSBpbWFnZSBpcyBjcmVhdGVkIHN1Y2Nlc3NmdWxseS4NCg0K
U28gZG8geW91IG1lYW4gd2Ugc2hvdWxkIGltcGxlbWVudCBhIG5ldyBmbGFnIGxpa2UgJ0JEUlZf
T19OT19TSEFSRV9XUicgdG8gaGFuZGxlIHRoaXMNCg0KKg0KDQpUaGFua3MNClpoaWppYW4NCg0K
PiAgIE9yIHdvdWxkIHRoYXQgZXJyb3INCj4gY29uZGl0aW9uIGJlIGRldGVjdGVkIHRvbyBsYXRl
IHNvIHRoYXQgdGhlIGltYWdlIHdvdWxkIGFscmVhZHkgYmUNCj4gdHJ1bmNhdGVkPw0KDQo+DQo+
IEtldmluDQo+DQo+DQo+DQo=

