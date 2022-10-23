Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8260981E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:13:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omk7c-0005c5-UI
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 19:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=288efe473=Dmitry.Fomichev@wdc.com>)
 id 1omQ3l-0002So-CX; Sat, 22 Oct 2022 21:46:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=288efe473=Dmitry.Fomichev@wdc.com>)
 id 1omQ3f-0006ME-6m; Sat, 22 Oct 2022 21:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666489547; x=1698025547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=U+iukRg/PvWcqCdaeJK7hIZWs2zGcn4Z1e/9o86ecfE=;
 b=itom6gvgjCy/JasujQ3qd0K2gYBEI8AxUq6Dct9LDE83jSETT2LzAB0i
 r8t8y9JaTlAOHrtfo6w3/HTUIHNyMf+7YYTeZvsuqjDvxy6DfNPVyB8fb
 HqfkemaEJFKGBb00cJSdtdUx6ItqXE5HaXwQnP9Adx2Le/NnM1cAObWfM
 B2+4u7hweD3kqjHS0B5ePmCzGlQXewg8JvbZS6w9lBbNKC/k+3v4PJGCK
 OQO1/gND3QksNELr0+kfSqeymNS5akeICrloXoquCollMBn5525Ekq2ng
 ipc6Ut2N98Is9t9McRlyFiDaKxnbQHY2SvKS9ZjfEm6fJJmypOqY0fCJI g==;
X-IronPort-AV: E=Sophos;i="5.95,206,1661788800"; d="scan'208";a="326629251"
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2022 09:45:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtDxY+Ae7dBFz/SMOsGdSlgb6k66pHBbk+I+qVDRNTB9nJ3E3g4Sb6lcbKZMOSCZFLe8+xU6VTCoDWlZQpZ/xSs8B+AcVS74ETz/zTxlFSUUlQph+Zn0jvFgXuLUJNPSnD8c9LPoLod372e8qn+J9GLzCKKxIuY4ovi2um7RmN5EyBMkpxZdG0R2yuxPI8fHE4jevCf3wCWRcdrKbSljjtfKuovurPaDoGDyOyE+z84eKjTh8c2zljHwMYsBU6niB4nA4nNI6ytymhC/KBPV0m4IFoeP3q8ASh7HxOg1SwZVULXCzc2c8IAo4VaaUATMb+zsiSAXtdfGEj4FlvCuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+iukRg/PvWcqCdaeJK7hIZWs2zGcn4Z1e/9o86ecfE=;
 b=l3+BMrhKFcjmFnxXjzpY3bvuGfYHGh55g6m1jICHNtioxANL76dutvzJkLvrdk+MoNRwr/Nylc9ZZ7F23Q60AEfIrwjZjdD37sbcnWy3ccWThOOzNlrdJtCFvCFQA3vzwfEwFG6N8dr3jfAE1Sn9Zu2ejqI0XmCnQZh8AL2nvr3DfJWfrjUplwrt0FFA+rA/+IDUgVqQ3Zteqf3fwAM4IlzXGQhg6H1k0zpWkyHnPL/ji2/sCwZuW5Rnd+8FPU1TmqphIjP/1llFMzjysvFNqg/AQfJ1nEjUgiUkkI+/sorvsBxrCHk+OIEvdOpriRvbEyjHQ0jGKifHMNbMuDgKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+iukRg/PvWcqCdaeJK7hIZWs2zGcn4Z1e/9o86ecfE=;
 b=aTM8+ZmEFmBR9oEHYb8CSwGUVD5Yv/ySMdOfH3pXk8sNSreIc4/Z4OK9U8dtUj+MMPiTwWmpdfSOmPe4LzGHUDaTT9xayx7Gxh5KCowcDcImQ/d3NorD64b71mioIu5kCP4k9b78iNgtVCiGa9nbdtKI+1IVMnJop8seEjpzv6c=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by DM5PR0401MB3687.namprd04.prod.outlook.com (2603:10b6:4:79::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Sun, 23 Oct
 2022 01:45:30 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Sun, 23 Oct 2022
 01:45:29 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "eblake@redhat.com" <eblake@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "damien.lemoal@opensource.wdc.com"
 <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 6/7] qemu-iotests: test new zone operations
Thread-Topic: [PATCH v12 6/7] qemu-iotests: test new zone operations
Thread-Index: AQHY4W7crUBxZeoQsk+CnkDJ7sbaDq4RxAQAgAIT9ACAB2dsgA==
Date: Sun, 23 Oct 2022 01:45:29 +0000
Message-ID: <d90b06c8b707cdca85b33e7a76bdd96203fd52eb.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-7-faithilikerun@gmail.com>
 <0e24771f0db95ffbd2ff413f24a4dfdc4674b89e.camel@wdc.com>
 <CAAAx-8Kdz--HDTZ0c8iu2KD0Ntn2Tp_ohUWu6vCzaALD2Wi+zw@mail.gmail.com>
In-Reply-To: <CAAAx-8Kdz--HDTZ0c8iu2KD0Ntn2Tp_ohUWu6vCzaALD2Wi+zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|DM5PR0401MB3687:EE_
x-ms-office365-filtering-correlation-id: b110ede7-4af7-4749-8065-08dab4984427
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u7LZO+a5UXOUaxvHN8cooigJFNdsvCgmhppCN0Admqz0bWN6zdUhZJFvYZJglf1aQTlC4Ssr4YleItM7HqKaQLqK5nZ69XBYK5pp+YG1FQhTVOfqfwx2ywB+md0V0ozxWtYTRR+R3bIsClMMD4cYo6jSoNwqiO1/HRqckdhJYzGZ8ffbjOSk7TNdh22Xr4IavsYAa1Dq25jtCPBvqE+7o1p4ugwICT32FvEykyz17WkVCZ4FPQbFXrJPYj3hzumhfX8WoXHKM1iKJDO6pglUXyFFHGbk08TgbKh++Uu24Lv5QDUfkt53ZCwJlZQxhBW+MySma8v+GjPEdOzyZf/yeY8jKZoV1oqOpqkTbEDStqC8TP+0wKBRIdegibZuYCkGh6PoHAHciI9UX3dogCWM0D2qiFcNbAOHIpLgHkcfPVjKV+EFLE+eJMA2wvc+R7+ICDOadajy2idiiF1n1n5Q2fusTBoqVWGlwFs0zls3vNlceOrOWRoS0/RNuG68MOobCM2CuGItWWI2DzDxl46UXd1ibko5p40q3I237xE/310p8pcXdKpFSlhEzHBi9lit0sbjmtmjB4ZCUzFsGMRZ9bYcchs9TqNTDJS1sd8ge746KiU5wHXuRhblYgJy88ZrPyVnOFfA7UVToye2kJOvbnZM74UzcR4koaRb5BdSoz2Z/NzjqOo/7jbbaT0/wCEDz8hQCX8YGXAsJP6gcuzMykDIdiIvOTLydLx7KyYhn0POHJXGPD0YD0Zi9sHe+/tKx9MjrQFxd8CheC18ykJZ4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(6506007)(82960400001)(6512007)(36756003)(86362001)(7416002)(6486002)(2906002)(478600001)(122000001)(71200400001)(4001150100001)(38100700002)(66946007)(41300700001)(76116006)(6916009)(66556008)(64756008)(8676002)(66446008)(66476007)(4326008)(8936002)(54906003)(5660300002)(26005)(316002)(38070700005)(186003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVqdHROYXdvdndUWnk3M05xenlZWXlSNE1mNk5aWXJKVXBLeWFWYjNSWHVz?=
 =?utf-8?B?VjQ2eFZ6bzhkQ0xveFFlZlZBdTZndEkyYVZwZUFzcVRRdktxRHdtVVN6amZF?=
 =?utf-8?B?aGhVMk41TEwvSkhIQmFIUVFRUGJ0TUpQa21GNFFBRElWenFzMTBXYkg2OUk2?=
 =?utf-8?B?aVNDTTVJaFp5bURvSHBXYlhscFprWlNDY3BzRzVlSGsyUkVaN0VXQ1RnakpH?=
 =?utf-8?B?U3JLR0E3YzBPUmtlcDZRZDM2M1pQcnVEbWFpazRUeWtJdXBweVRSTGNWQUor?=
 =?utf-8?B?WldKcHBFRC9wZTlhRWlob1A2bjJPMUV2Q0hld2ZqdWNKNEZqcUsrYlI2OWVt?=
 =?utf-8?B?UmF5cVNNb3ZjajYyNHFCTm14MHVTRGphVjBBMSsyZ2l4RTU0aDY0OHF3NXJP?=
 =?utf-8?B?OHdGS3F1T3NNY1BwODZ0Wi9YY0Y4cjZOWjF2NnR0YVZ2WERtVnp3YmtaVmxR?=
 =?utf-8?B?TlJ1MXAyNE1XTkxjdnVFWHYzdVE3d3R4YTJCWnBtM3ZVM0ZXQWhEbmNkUmQ2?=
 =?utf-8?B?VnBKUE1kcGZNTkZyTFpiVHpvSGVWMGRZb1RyOTRFbi9QdU5Wb2pSQnd0aE5G?=
 =?utf-8?B?cWxzQ2dXL2RSZmU2WWtIME5XaUhIVjhnTGEycW9rSGFJWFptemhBc1h6NG5T?=
 =?utf-8?B?UitWOEd1ZVdwbThJWElxTHphbE5yK2s5aUZrTHh1bzJlaG0vTXpiT1BaejZ6?=
 =?utf-8?B?TXFMOFdJSUFnb3dPejZ5NTUzS3dnQ3orT3VMYjJ3cm1XaGxkeFZxK3hUZ0Js?=
 =?utf-8?B?eTZhbE92ZEpXb2pidTBrN2tVRFBLcncvMytQOFpTR2x0OExSTzdUMmt3Zm1q?=
 =?utf-8?B?elpJTEZET1BUalJzREZuRDBwRE5LN2tDVm1FQ2hGTU5QQ1VUajdra1pwNmQz?=
 =?utf-8?B?cHhoS3dLa3YwYTNuUVQ3dG5BNEZPWlN5dHROSFhzUGJ3Ym5xaGtrT0ZVc05i?=
 =?utf-8?B?YzZEVDZBaFoyWWhLNkE0VUVBcXVMU01KMEd3RXhtc2Q3dlRLTUFwQkJMaWJp?=
 =?utf-8?B?Y2lua3VNaUNrTnhmbDZ3WTJVY2RGNkRiTVJLL2ZJZE9nUW56MVpGK0FKUXdq?=
 =?utf-8?B?QTcvL3U5UktJUTlKN3hIOFA3VjJZU2lWWnR4Qm5aTzdqZ3BFZURRTUZCSDF1?=
 =?utf-8?B?aHV6cTVDU0h6a0trQzFFQ1NKd2JFb1F5eW1HaFdLYXlFNlQ5L25JVElUdjZE?=
 =?utf-8?B?WnpSSTRYR05NU2lpcGRZREV1NlZ1VnRWT0lTWnZKbzNLR0VJQVFmaFZ5RnhH?=
 =?utf-8?B?S3FpMUFWaTExNjJ2UmNsVU9QZEpGdkw1aUwreWJucC81SGRyUVk2bmVQNzJR?=
 =?utf-8?B?cTkxeGJ6L3dudWdhVVZCQ0QzazRoeTNvNWJFM3JGM1lURDgzUWxTQVE3TlRS?=
 =?utf-8?B?T0lZSk1CNnZUTDRYU3U3OVVNQnJMS0o0UGlGNUdGUE9DSUw2LzZqL1pkRnZ0?=
 =?utf-8?B?c0ROS1RzcExpWGVHeXMyKzFwSVQ3VlM0aWtTZEFkTDA5aTVSc3NNRkJNRHhH?=
 =?utf-8?B?YVlhNEV2YWZxWXFxWVpJdy9iMmNRNnQ0SENCalczK2E1MWlRcUdTcWE4VTFP?=
 =?utf-8?B?c243Q216YXQ0alhVYzBxK0dVMHVHc210MU8xZHA5VW94R1p4cDk4VEFzcHFr?=
 =?utf-8?B?VWgwa0JGTlN0VlRWa0tyYjFVYUgzaU55ZDhBVzlRdE5pMjZUYko5SlZ3bk8z?=
 =?utf-8?B?Q0t1SC8wOXdwKzU3Q2krakdOWWg5QU5haXNCK0FzYW80ejlPQ2t2SG15TWVu?=
 =?utf-8?B?RE1HYWJ5L0t0YnM0aU51YW9NUW1GRWdxZ2NSQWZpUW5TUzA1bGZFeTVWdm1J?=
 =?utf-8?B?ZW1tak8xVG1pd0FXaStGaExSMjYrdFJYMlNBNEY2cEtGZEU2bkFVQU5YeThM?=
 =?utf-8?B?TGh2dkJ3c051Z0lTMXMzbjBWZXFwMlJhL1R0TEg0d2tzYzk5cWxTWU9VTk5J?=
 =?utf-8?B?VmxTZW5RejVSZnFjTnNRU1Jzd1VGT3E5eHU0dUNNbm1QL1hTb0s0cnBhVFlS?=
 =?utf-8?B?dmpBZGRJMUFaN1hDK0Q0UDZ5czZ6TS9OM0FsSG1wNDVDTXpnRnRZUmRRckRn?=
 =?utf-8?B?VEM4bFFmQ0tQR3A4YU5SMXJlMk43ajFiQkg0MW1zbXlIc0JNUlU3TUNJRjJk?=
 =?utf-8?B?czJac2RzTEhDSEY3Q1h3ZnpFZ0FxYy9VNFB0aFV6eDFYOTM2bDRRVmhGSk1N?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E773961E92E784299CFCC1A33B56B64@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b110ede7-4af7-4749-8065-08dab4984427
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2022 01:45:29.7658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxvLdeWWG1Lzhh4jsQPHt1wrMpxOX1o19lkCpzRT5QqoVmR5GNdp0rdLvTgPxKkceXclVjlRc0nMT1yHwRp8lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3687
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=288efe473=Dmitry.Fomichev@wdc.com; helo=esa1.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIyLTEwLTE4IGF0IDE2OjQxICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IERtaXRy
eSBGb21pY2hldiA8RG1pdHJ5LkZvbWljaGV2QHdkYy5jb20+IOS6jjIwMjLlubQxMOaciDE35pel
5ZGo5LiAIDA4OjU35YaZ6YGT77yaDQo+ID4gDQo+ID4gT24gU3VuLCAyMDIyLTEwLTE2IGF0IDIy
OjUxICswODAwLCBTYW0gTGkgd3JvdGU6DQo+ID4gPiBXZSBoYXZlIGFkZGVkIG5ldyBibG9jayBs
YXllciBBUElzIG9mIHpvbmVkIGJsb2NrIGRldmljZXMuDQo+ID4gPiBUZXN0IGl0IHdpdGg6DQo+
ID4gPiBDcmVhdGUgYSBudWxsX2JsayBkZXZpY2UsIHJ1biBlYWNoIHpvbmUgb3BlcmF0aW9uIG9u
IGl0IGFuZCBzZWUNCj4gPiA+IHdoZXRoZXIgcmVwb3J0aW5nIHJpZ2h0IHpvbmUgaW5mb3JtYXRp
b24uDQo+ID4gDQo+ID4gY2hhbmdlIHRoaXMgdG8gIndoZXRoZXIgdGhlIGxvZ3Mgc2hvdyB0aGUg
Y29ycmVjdCB6b25lIGluZm9ybWF0aW9uIj8NCj4gPiANCj4gPiA+IA0KPiA+IA0KPiA+IENvdWxk
IHlvdSBwbGVhc2UgZGVzY3JpYmUgaG93IHRvIHJ1biB0aGlzIHNwZWNpZmljIHNldCBvZiB0ZXN0
cw0KPiA+IGluIG1vcmUgZGV0YWlsPw0KPiANCj4gSSBqdXN0IHJ1biB0aGlzIHNjcmlwdCBvbiB0
aGUgdGVybWluYWwgZGlyZWN0bHkgYW5kIHJlZGlyZWN0IHRoZQ0KPiByZXN1bHQgdG8gdGhlIG91
dHB1dCBmaWxlLg0KPiANCj4gTWF5YmU/DQo+ICsgUnVuIGVhY2ggem9uZSBvcGVyYXRpb24gb24g
YSBuZXdseSBjcmVhdGVkIG51bGxfYmxrIGRldmljZSBhbmQgc2VlDQo+ICsgd2hldGhlciB0aGUg
bG9ncyBzaG93IHRoZSBjb3JyZWN0IHpvbmUgaW5mb3JtYXRpb24uDQoNClllcywgdGhpcyBpcyBm
aW5lLiBBbmQgc3BlY2lmeSB0aGUgZXhhY3QgY29tbWFuZCBsaW5lIHRoYXQgeW91IGFyZSB1c2lu
Zw0KdG8gcnVuIHRoZSB0ZXN0Lg0KDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBTYW0gTGkgPGZhaXRoaWxpa2VydW5AZ21haWwuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4g
wqB0ZXN0cy9xZW11LWlvdGVzdHMvdGVzdHMvem9uZWQub3V0IHwgNTMgKysrKysrKysrKysrKysr
KysrDQo+ID4gPiDCoHRlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cy96b25lZC5zaMKgIHwgODYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTM5
IGluc2VydGlvbnMoKykNCj4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3FlbXUtaW90
ZXN0cy90ZXN0cy96b25lZC5vdXQNCj4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RzL3Fl
bXUtaW90ZXN0cy90ZXN0cy96b25lZC5zaA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvcWVtdS1pb3Rlc3RzL3Rlc3RzL3pvbmVkLm91dCBiL3Rlc3RzL3FlbXUtDQo+ID4gPiBpb3Rl
c3RzL3Rlc3RzL3pvbmVkLm91dA0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGlu
ZGV4IDAwMDAwMDAwMDAuLjBjOGY5NmRlYjkNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsr
KyBiL3Rlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cy96b25lZC5vdXQNCj4gPiA+IEBAIC0wLDAgKzEs
NTMgQEANCj4gPiA+ICtRQSBvdXRwdXQgY3JlYXRlZCBieSB6b25lZC5zaA0KPiA+ID4gK1Rlc3Rp
bmcgYSBudWxsX2JsayBkZXZpY2U6DQo+ID4gPiArU2ltcGxlIGNhc2VzOiBpZiB0aGUgb3BlcmF0
aW9ucyB3b3JrDQo+ID4gPiArKDEpIHJlcG9ydCB0aGUgZmlyc3Qgem9uZToNCj4gPiA+ICtzdGFy
dDogMHgwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgwLCB6Y29uZDoxLCBbdHlw
ZTogMl0NCj4gPiA+ICsNCj4gPiA+ICtyZXBvcnQgdGhlIGZpcnN0IDEwIHpvbmVzDQo+ID4gPiAr
c3RhcnQ6IDB4MCwgbGVuIDB4ODAwMDAsIGNhcCAweDgwMDAwLCB3cHRyIDB4MCwgemNvbmQ6MSwg
W3R5cGU6IDJdDQo+ID4gPiArc3RhcnQ6IDB4ODAwMDAsIGxlbiAweDgwMDAwLCBjYXAgMHg4MDAw
MCwgd3B0ciAweDgwMDAwLCB6Y29uZDoxLCBbdHlwZTogMl0NCj4gPiA+ICtzdGFydDogMHgxMDAw
MDAsIGxlbiAweDgwMDAwLCBjYXAgMHg4MDAwMCwgd3B0ciAweDEwMDAwMCwgemNvbmQ6MSwgW3R5
cGU6DQo+ID4gPiAyXQ0KPiA+ID4gK3N0YXJ0OiAweDE4MDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAw
eDgwMDAwLCB3cHRyIDB4MTgwMDAwLCB6Y29uZDoxLCBbdHlwZToNCj4gPiA+IDJdDQo+ID4gPiAr
c3RhcnQ6IDB4MjAwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgyMDAwMDAs
IHpjb25kOjEsIFt0eXBlOg0KPiA+ID4gMl0NCj4gPiA+ICtzdGFydDogMHgyODAwMDAsIGxlbiAw
eDgwMDAwLCBjYXAgMHg4MDAwMCwgd3B0ciAweDI4MDAwMCwgemNvbmQ6MSwgW3R5cGU6DQo+ID4g
PiAyXQ0KPiA+ID4gK3N0YXJ0OiAweDMwMDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAweDgwMDAwLCB3
cHRyIDB4MzAwMDAwLCB6Y29uZDoxLCBbdHlwZToNCj4gPiA+IDJdDQo+ID4gPiArc3RhcnQ6IDB4
MzgwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgzODAwMDAsIHpjb25kOjEs
IFt0eXBlOg0KPiA+ID4gMl0NCj4gPiA+ICtzdGFydDogMHg0MDAwMDAsIGxlbiAweDgwMDAwLCBj
YXAgMHg4MDAwMCwgd3B0ciAweDQwMDAwMCwgemNvbmQ6MSwgW3R5cGU6DQo+ID4gPiAyXQ0KPiA+
ID4gK3N0YXJ0OiAweDQ4MDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAweDgwMDAwLCB3cHRyIDB4NDgw
MDAwLCB6Y29uZDoxLCBbdHlwZToNCj4gPiA+IDJdDQo+ID4gPiArDQo+ID4gPiArcmVwb3J0IHRo
ZSBsYXN0IHpvbmU6DQo+ID4gPiArc3RhcnQ6IDB4MWYzODAwMDAsIGxlbiAweDgwMDAwLCBjYXAg
MHg4MDAwMCwgd3B0ciAweDFmMzgwMDAwLCB6Y29uZDoxLA0KPiA+ID4gW3R5cGU6DQo+ID4gPiAy
XQ0KPiA+ID4gKw0KPiA+ID4gKw0KPiA+ID4gKygyKSBvcGVuaW5nIHRoZSBmaXJzdCB6b25lDQo+
ID4gPiArcmVwb3J0IGFmdGVyOg0KPiA+ID4gK3N0YXJ0OiAweDAsIGxlbiAweDgwMDAwLCBjYXAg
MHg4MDAwMCwgd3B0ciAweDAsIHpjb25kOjMsIFt0eXBlOiAyXQ0KPiA+ID4gKw0KPiA+ID4gK29w
ZW5pbmcgdGhlIHNlY29uZCB6b25lDQo+ID4gPiArcmVwb3J0IGFmdGVyOg0KPiA+ID4gK3N0YXJ0
OiAweDgwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHg4MDAwMCwgemNvbmQ6
MywgW3R5cGU6IDJdDQo+ID4gPiArDQo+ID4gPiArb3BlbmluZyB0aGUgbGFzdCB6b25lDQo+ID4g
PiArcmVwb3J0IGFmdGVyOg0KPiA+ID4gK3N0YXJ0OiAweDFmMzgwMDAwLCBsZW4gMHg4MDAwMCwg
Y2FwIDB4ODAwMDAsIHdwdHIgMHgxZjM4MDAwMCwgemNvbmQ6MywNCj4gPiA+IFt0eXBlOg0KPiA+
ID4gMl0NCj4gPiA+ICsNCj4gPiA+ICsNCj4gPiA+ICsoMykgY2xvc2luZyB0aGUgZmlyc3Qgem9u
ZQ0KPiA+ID4gK3JlcG9ydCBhZnRlcjoNCj4gPiA+ICtzdGFydDogMHgwLCBsZW4gMHg4MDAwMCwg
Y2FwIDB4ODAwMDAsIHdwdHIgMHgwLCB6Y29uZDoxLCBbdHlwZTogMl0NCj4gPiA+ICsNCj4gPiA+
ICtjbG9zaW5nIHRoZSBsYXN0IHpvbmUNCj4gPiA+ICtyZXBvcnQgYWZ0ZXI6DQo+ID4gPiArc3Rh
cnQ6IDB4MWYzODAwMDAsIGxlbiAweDgwMDAwLCBjYXAgMHg4MDAwMCwgd3B0ciAweDFmMzgwMDAw
LCB6Y29uZDoxLA0KPiA+ID4gW3R5cGU6DQo+ID4gPiAyXQ0KPiA+ID4gKw0KPiA+ID4gKw0KPiA+
ID4gKyg0KSBmaW5pc2hpbmcgdGhlIHNlY29uZCB6b25lDQo+ID4gPiArQWZ0ZXIgZmluaXNoaW5n
IGEgem9uZToNCj4gPiA+ICtzdGFydDogMHg4MDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAweDgwMDAw
LCB3cHRyIDB4MTAwMDAwLCB6Y29uZDoxNCwgW3R5cGU6DQo+ID4gPiAyXQ0KPiA+ID4gKw0KPiA+
ID4gKw0KPiA+ID4gKyg1KSByZXNldHRpbmcgdGhlIHNlY29uZCB6b25lDQo+ID4gPiArQWZ0ZXIg
cmVzZXR0aW5nIGEgem9uZToNCj4gPiA+ICtzdGFydDogMHg4MDAwMCwgbGVuIDB4ODAwMDAsIGNh
cCAweDgwMDAwLCB3cHRyIDB4ODAwMDAsIHpjb25kOjEsIFt0eXBlOiAyXQ0KPiA+ID4gKyoqKiBk
b25lDQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcWVtdS1pb3Rlc3RzL3Rlc3RzL3pvbmVkLnNo
IGIvdGVzdHMvcWVtdS0NCj4gPiA+IGlvdGVzdHMvdGVzdHMvem9uZWQuc2gNCj4gPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNzU1DQo+ID4gPiBpbmRleCAwMDAwMDAwMDAwLi5mY2VkMDE5NGM1DQo+ID4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi90ZXN0cy9xZW11LWlvdGVzdHMvdGVzdHMvem9u
ZWQuc2gNCj4gPiA+IEBAIC0wLDAgKzEsODYgQEANCj4gPiA+ICsjIS91c3IvYmluL2VudiBiYXNo
DQo+ID4gPiArIw0KPiA+ID4gKyMgVGVzdCB6b25lIG1hbmFnZW1lbnQgb3BlcmF0aW9ucy4NCj4g
PiA+ICsjDQo+ID4gPiArDQo+ID4gPiArc2VxPSIkKGJhc2VuYW1lICQwKSINCj4gPiA+ICtlY2hv
ICJRQSBvdXRwdXQgY3JlYXRlZCBieSAkc2VxIg0KPiA+ID4gK3N0YXR1cz0xICMgZmFpbHVyZSBp
cyB0aGUgZGVmYXVsdCENCj4gPiA+ICsNCj4gPiA+ICtfY2xlYW51cCgpDQo+ID4gPiArew0KPiA+
ID4gK8KgIF9jbGVhbnVwX3Rlc3RfaW1nDQo+ID4gPiArwqAgc3VkbyBybW1vZCBudWxsX2Jsaw0K
PiA+ID4gK30NCj4gPiA+ICt0cmFwICJfY2xlYW51cDsgZXhpdCBcJHN0YXR1cyIgMCAxIDIgMyAx
NQ0KPiA+ID4gKw0KPiA+ID4gKyMgZ2V0IHN0YW5kYXJkIGVudmlyb25tZW50LCBmaWx0ZXJzIGFu
ZCBjaGVja3MNCj4gPiA+ICsuIC4vY29tbW9uLnJjDQo+ID4gPiArLiAuL2NvbW1vbi5maWx0ZXIN
Cj4gPiA+ICsuIC4vY29tbW9uLnFlbXUNCj4gPiA+ICsNCj4gPiA+ICsjIFRoaXMgdGVzdCBvbmx5
IHJ1bnMgb24gTGludXggaG9zdHMgd2l0aCByYXcgaW1hZ2UgZmlsZXMuDQo+ID4gPiArX3N1cHBv
cnRlZF9mbXQgcmF3DQo+ID4gPiArX3N1cHBvcnRlZF9wcm90byBmaWxlDQo+ID4gPiArX3N1cHBv
cnRlZF9vcyBMaW51eA0KPiA+ID4gKw0KPiA+ID4gK1FFTVVfSU89ImJ1aWxkL3FlbXUtaW8iDQo+
ID4gPiArSU1HPSItLWltYWdlLW9wdHMgLW4gZHJpdmVyPXpvbmVkX2hvc3RfZGV2aWNlLGZpbGVu
YW1lPS9kZXYvbnVsbGIwIg0KPiA+ID4gK1FFTVVfSU9fT1BUSU9OUz0kUUVNVV9JT19PUFRJT05T
X05PX0ZNVA0KPiA+ID4gKw0KPiA+ID4gK2VjaG8gIlRlc3RpbmcgYSBudWxsX2JsayBkZXZpY2U6
Ig0KPiA+ID4gK2VjaG8gImNhc2UgMTogaWYgdGhlIG9wZXJhdGlvbnMgd29yayINCj4gPiA+ICtz
dWRvIG1vZHByb2JlIG51bGxfYmxrIG5yX2RldmljZXM9MSB6b25lZD0xDQo+ID4gPiArDQo+ID4g
PiArZWNobyAiKDEpIHJlcG9ydCB0aGUgZmlyc3Qgem9uZToiDQo+ID4gPiArc3VkbyAkUUVNVV9J
TyAkSU1HIC1jICJ6cnAgMCAxIg0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvICJyZXBvcnQgdGhl
IGZpcnN0IDEwIHpvbmVzIg0KPiA+ID4gK3N1ZG8gJFFFTVVfSU8gJElNRyAtYyAienJwIDAgMTAi
DQo+ID4gPiArZWNobw0KPiA+ID4gK2VjaG8gInJlcG9ydCB0aGUgbGFzdCB6b25lOiINCj4gPiA+
ICtzdWRvICRRRU1VX0lPICRJTUcgLWMgInpycCAweDNlNzAwMDAwMDAgMiIgIyAweDNlNzAwMDAw
MDAgLyA1MTIgPQ0KPiA+ID4gMHgxZjM4MDAwMA0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvDQo+
ID4gPiArZWNobyAiKDIpIG9wZW5pbmcgdGhlIGZpcnN0IHpvbmUiDQo+ID4gPiArc3VkbyAkUUVN
VV9JTyAkSU1HIC1jICJ6byAwIDI2ODQzNTQ1NiLCoCAjIDI2ODQzNTQ1NiAvIDUxMiA9IDUyNDI4
OA0KPiA+ID4gK2VjaG8gInJlcG9ydCBhZnRlcjoiDQo+ID4gPiArc3VkbyAkUUVNVV9JTyAkSU1H
IC1jICJ6cnAgMCAxIg0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvICJvcGVuaW5nIHRoZSBzZWNv
bmQgem9uZSINCj4gPiA+ICtzdWRvICRRRU1VX0lPICRJTUcgLWMgInpvIDI2ODQzNTQ1NiAyNjg0
MzU0NTYiICMNCj4gPiA+ICtlY2hvICJyZXBvcnQgYWZ0ZXI6Ig0KPiA+ID4gK3N1ZG8gJFFFTVVf
SU8gJElNRyAtYyAienJwIDI2ODQzNTQ1NiAxIg0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvICJv
cGVuaW5nIHRoZSBsYXN0IHpvbmUiDQo+ID4gPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6byAw
eDNlNzAwMDAwMDAgMjY4NDM1NDU2Ig0KPiA+ID4gK2VjaG8gInJlcG9ydCBhZnRlcjoiDQo+ID4g
PiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMHgzZTcwMDAwMDAwIDIiDQo+ID4gPiArZWNo
bw0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvICIoMykgY2xvc2luZyB0aGUgZmlyc3Qgem9uZSIN
Cj4gPiA+ICtzdWRvICRRRU1VX0lPICRJTUcgLWMgInpjIDAgMjY4NDM1NDU2Ig0KPiA+ID4gK2Vj
aG8gInJlcG9ydCBhZnRlcjoiDQo+ID4gPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMCAx
Ig0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvICJjbG9zaW5nIHRoZSBsYXN0IHpvbmUiDQo+ID4g
PiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6YyAweDNlNzAwMDAwMDAgMjY4NDM1NDU2Ig0KPiA+
ID4gK2VjaG8gInJlcG9ydCBhZnRlcjoiDQo+ID4gPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6
cnAgMHgzZTcwMDAwMDAwIDIiDQo+ID4gPiArZWNobw0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hv
ICIoNCkgZmluaXNoaW5nIHRoZSBzZWNvbmQgem9uZSINCj4gPiA+ICtzdWRvICRRRU1VX0lPICRJ
TUcgLWMgInpmIDI2ODQzNTQ1NiAyNjg0MzU0NTYiDQo+ID4gPiArZWNobyAiQWZ0ZXIgZmluaXNo
aW5nIGEgem9uZToiDQo+ID4gPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMjY4NDM1NDU2
IDEiDQo+ID4gPiArZWNobw0KPiA+ID4gK2VjaG8NCj4gPiA+ICtlY2hvICIoNSkgcmVzZXR0aW5n
IHRoZSBzZWNvbmQgem9uZSINCj4gPiA+ICtzdWRvICRRRU1VX0lPICRJTUcgLWMgInpycyAyNjg0
MzU0NTYgMjY4NDM1NDU2Ig0KPiA+ID4gK2VjaG8gIkFmdGVyIHJlc2V0dGluZyBhIHpvbmU6Ig0K
PiA+ID4gK3N1ZG8gJFFFTVVfSU8gJElNRyAtYyAienJwIDI2ODQzNTQ1NiAxIg0KPiA+ID4gKw0K
PiA+ID4gKyMgc3VjY2VzcywgYWxsIGRvbmUNCj4gPiA+ICtlY2hvICIqKiogZG9uZSINCj4gPiA+
ICtybSAtZiAkc2VxLmZ1bGwNCj4gPiA+ICtzdGF0dXM9MA0KPiA+IA0KDQo=

