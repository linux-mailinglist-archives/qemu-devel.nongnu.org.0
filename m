Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC7497CAA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:04:11 +0100 (CET)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwCo-0006Kf-Eq
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:04:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nBwAP-0004y8-PX; Mon, 24 Jan 2022 05:01:41 -0500
Received: from corp-ob08.yahoo-corp.jp ([183.79.94.93]:47430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nBwAL-00043I-Fs; Mon, 24 Jan 2022 05:01:41 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2176.outbound.protection.outlook.com [104.47.23.176])
 by corp-ob08.yahoo-corp.jp (Postfix) with ESMTPS id 77EF719FB18C;
 Mon, 24 Jan 2022 19:01:31 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1643018491;
 bh=CEFjFNiA2C/4c3lxROU1PnHaVBEhjhYOb1hYkEYr6fY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=onuY5btrjuCyjiWu0JpVY+JIVa26nvPuM6Q96uaw/Lf97Uc7q9eg4TgSrHnD0+kaw
 uVA8yjVe8I7f8zEl2hcAXclPsQ/Q2bHpUsQOkqbJcgYKKjCxSsVKKXk4QwNIE9lx1Z
 HL9teiw3uQp8OV1tYURYeorve/JYMIRl240NfcK0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEH7pWyUmqZ+JCeI09ut98DJPCCqL4hLYMIiWeFQVMos5l1g3/P5tmOCvlsSzEyIZBl89ru938xi9sgCKe0MF/WR5+9xfgDAZdd4vIa9VG08jiaDcCCLFSEacttWq7uYWGhDZqI3nxxpDGcTv8Dd9dYFE8XfUfdVFjGAallYYrI8MbewApWiVj/1w9IddTGiVZoa1/WyL6Th8UjRbt1CmUfPquqCBwDfXjdvtIgxq9wYnaDGccejBQ7HLvgLIbGC/6zisWEwX8PRVY10m+0pbmOrO0WJGZ+eEkXpi9sjtOrOyj0aBAYuf6ai6AnAkB/dQ/zgmwTvYW/tPi55+g9lQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEFjFNiA2C/4c3lxROU1PnHaVBEhjhYOb1hYkEYr6fY=;
 b=XbM/M+XfO6AEU8ydOppK/NkhduFIkO9RLr9ICWZ/5Y+DuhSnydxG8E0mFxR6e3NWK6Z0olSbwdPz9AV6f5+FXXCq8h8Y/qEL++fyQASuRujqwGE+VuNYKkM2rj1aDP450Lh8Zkh4G/ejej9JXA09kdvH0hGbI+KXf81jiPA3i8uVHse/69wNXIXNsljV+770B30hZlzK22dMXB1X/ELYndGkDIan/9kUoE6WFI9WiCZ9sq4wI7VZoySVS3r2oW4tjCOuUA6tVcSjzCc7IAApojtC5I2DimA7DCDrruHuZQnOBhjHncmET6MMqEy44hHRGCNKAcW36c8zkI9S8v4ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEFjFNiA2C/4c3lxROU1PnHaVBEhjhYOb1hYkEYr6fY=;
 b=cR3BFfzcELr42JRK3mpdV3AGR6dxBAtxpfjKcPB34undvgcTKn/3xLZAu0HFg0orAXalLom45jOw50FOn/1rgBaFRsOiX0l+tzLaZ5/d6fx80qzlS+vLtuHQ2ESrzoSeNPvx73oxg9tFK2opONKmQzZiiqMjAj8HZZCBP1+erKA=
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by OSAPR01MB2946.jpnprd01.prod.outlook.com (2603:1096:604::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Mon, 24 Jan 2022 10:01:30 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 10:01:30 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 0/1 v2] Patch to adjust coroutine pool size adaptively
Thread-Topic: [PATCH 0/1 v2] Patch to adjust coroutine pool size adaptively
Thread-Index: AQHYBsx7+ZfQ6gy1k0CWjCFsI3+CxKxyAz5A
Date: Mon, 24 Jan 2022 10:01:30 +0000
Message-ID: <TYCPR01MB83573704C604BC31B157B3EA805E9@TYCPR01MB8357.jpnprd01.prod.outlook.com>
References: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
In-Reply-To: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66dba7a0-25ba-4beb-51e5-08d9df207e77
x-ms-traffictypediagnostic: OSAPR01MB2946:EE_
x-microsoft-antispam-prvs: <OSAPR01MB29463DE36699B03EA44F9937805E9@OSAPR01MB2946.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bc/S5FtzSdSvzYJK9YfcAa3+WN+BhhOf1+mjrxxfhz24ejhId0Fw6/pD4NPLtHMHkM7xGeFZg9VHbblkBHNlEjcFfh68j8GW0MRvUSTmftWe5arS7apy5g1ywA9KTUPpcJML8lpEe1SoD4Ci3HV4OGJ4K9o2ajQSF+PPBZZBK2kQ63HN7ZNfkDv2+EIdUV1FEaoRdUclslXPRyYPwQcy1oqjUKPdNqT4LqeauFQOXB9/3smAxtKCeja7e3EmtmvSQkViC9jSIVk4Z95B8kZWk/jSDqHOEJFkcKEJCwweklJKc87D7dgw3RS89qQ/ipIQtEMdnHNVJkSt+RZyG+RQTFYwXNoyF3Xvpg0JUn1dHJ104zdqo7fXkCb5rpPMQZcYyAA1aLymerysNQy4HburvXg4oqXuvGU86fwglKR8ju+DxsX/olKXRN4G95w1KBdTUngsMbmoxABhy+cSwMvQpAZMWw0dAhKp5ozfpPfTihQI+hXT/MaMORS3i4TMmcC0QAtnVdCaQSfWB3fs3jZnAVTtX0p3f37YhW7C7zlcGrM/QWxXqCDGd0jFwel7CLAvKaJyLEcZZYOFRmEyuxiVyYUdxL65G8wanMDR2q1tYweCBIjhx3riCzdZULYEJ+0wD5I+FkrGwELfDuOhg8N507HcgjysQey4JlYNOmkqZtYTk4f+gtai/+D2XMcyWnNPS/UxV6mQ2Hphi1apMztzGqiU8qWzqiLZm7FJ6zJQ81LHZF/I9uqjGeDFP9+GaG4tY4uYmavEyWbZZrXeTXKW40ZIaRpnWKZ/+qHqE7kvwRo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(66946007)(38070700005)(186003)(86362001)(316002)(107886003)(122000001)(66476007)(66446008)(64756008)(66556008)(38100700002)(33656002)(966005)(55016003)(9686003)(83380400001)(8676002)(508600001)(54906003)(7696005)(2906002)(71200400001)(45080400002)(4744005)(4326008)(5660300002)(82960400001)(52536014)(26005)(8936002)(6916009)(85182001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?RzZzUlk2ZEhFelZqNTBodUc4V0dLL3l0Wi9TamlWL3A2Y2ZxN0g5QWFF?=
 =?iso-2022-jp?B?cngxUVU5UzBSZ1RGYlRMUWJUMVJYWWhYcG1DTDJwVmNXY3pwSm9Pd3VQ?=
 =?iso-2022-jp?B?WFVaQWYwMlhXaGVRVE5Zb0xNRzFrRWI1Vk1ML2kzZFc0dVdxL1A0QUxj?=
 =?iso-2022-jp?B?TG8welF5T2NUMzN1UkdVMW5KVzkvNWczc0VGbFh1U3l3S1BjVzM5UkNz?=
 =?iso-2022-jp?B?a1dIN3p0NFJhVUM0TW1sT25VT1Nhblc5WFcwRzlkdlZMVFo4UkdvcHZB?=
 =?iso-2022-jp?B?WGtjRWppWXc5cUx6anhwSmt1cGsrTmJSVmFNKzhhVzlReHMyOVI4QXpG?=
 =?iso-2022-jp?B?ajR1eEk4MjlkUWdOZW5ManlZZEw3OTgxeHlYcXY1aDE4Rm5iUDlnMTZZ?=
 =?iso-2022-jp?B?OGhZSk9LREcrMlFwaG5GRDN1Yjh4M21VYmtoZ3hkdnpXNkJ4bi9uUjhO?=
 =?iso-2022-jp?B?dWtPSWJRZThQVVJqYWhNajRsSi9WbmNDR2M4ejIwb2lxZGV0Znd1d1FS?=
 =?iso-2022-jp?B?bEFodHRpTjFzTW1PNzF6MUtuOTAwVlJXNm4zQ1FDc1RyWEx1dGkyYzht?=
 =?iso-2022-jp?B?NUNNa3VLODhoSzJlaXZhVWlObFB4eVp3VytYaUxrVjBJeVRJQXZucDAw?=
 =?iso-2022-jp?B?cEpLNHV0L28rQWVsT0N0TmJKd09oZE1pZkgwWFZ5eVlqUFhGVGZLeXBN?=
 =?iso-2022-jp?B?MmM5SUY5TnVUY2VJekdLZ3F5TnpKR1k1UW9mYTV0YzMrY3FDUUdTVVdy?=
 =?iso-2022-jp?B?UWVnVDU2WnNWR1lneDZMUVlTNEd2ZVI0UHU0eFI0QVV3ZDB2YkdPVnRt?=
 =?iso-2022-jp?B?RjhFcVBzYTFjUzU5eElkWjJIeXBVTmJPT1JPSkp3LzJiYkxMMHg4OEx1?=
 =?iso-2022-jp?B?TlBpVUFLQ1BhZ1h4Vk0yQkg3TXFZbTlDSitpMTVFVEV4V0VuVDNONFA0?=
 =?iso-2022-jp?B?dExVZkd4VURwVHNPYUg0VThCNmR4dmlFdzgwdVZma2thOUY0WnJ0M0x3?=
 =?iso-2022-jp?B?OEgvVUx2aGFremZhNFhTZ1Q4dzMzQzNhYWdOSmJiczArZTMyanlWZmxW?=
 =?iso-2022-jp?B?RkRZaWZJUUxJVmVRaU40V3RiTnhMVlczckFCMjhXRkYzTTFta08rMjh0?=
 =?iso-2022-jp?B?MzFDSmtVK0xYcEpZNWRHcjE1b1hodGoyVDhELzdVNzVBV2c0UUJwWWhm?=
 =?iso-2022-jp?B?TXR3VDV4RVhINDQ0YkZNREN1UlVLcTJSZGJYc0N0L1QxeUJKVGJXRmIy?=
 =?iso-2022-jp?B?OFJLTEluckJpSjJRejVtUTQrMDhrakIxc2QxUjk0MDNrVC9CcHM3ajNs?=
 =?iso-2022-jp?B?OFhYWHQ2WnRDNTJJbDg1dEFZUGl4UStGNUgzM0VPY0gxT3BLbnZHeHph?=
 =?iso-2022-jp?B?UjRVTEpaK1NWRVBqVHBTekpwVVRFWjhCTnhCK2JjL3E4QllUSU4zSW1K?=
 =?iso-2022-jp?B?V3NXUGx2L0h5TmRoR1BDbHl5ckRYalEzc3JObWg1OU5USDh3Z3pLbEtn?=
 =?iso-2022-jp?B?K1NtNTl0WnF2b1NHaHkzZVhlejZlQUx5S3VpOEw5RnlQcVQwck1Oc01E?=
 =?iso-2022-jp?B?UGt4aFYrYnNiNDNmWXFTOS9mTlZYdWg4N3BFRzI2SkREQ1Fzc2c5SzVU?=
 =?iso-2022-jp?B?TFFZWjZ5Y3h4Nk9nUEpKT3hyUzJIMkVrZ1NxaTF5NW1udTFWY2pwdmRQ?=
 =?iso-2022-jp?B?bU0xYzRLc2JBTHc0Q1MvTktqR3hFV1VheW1kbmdPLzRLRlA3RGFoM0FK?=
 =?iso-2022-jp?B?clp4RWM4ODBSejExa0VUQ3AvMWNvaW9BL1l0WEhZeWNSTXl0U0Vla2hN?=
 =?iso-2022-jp?B?ejlsT1Y3Ni9HejhmN0hUVG1RUnNkQ1I3NHlJdzdLendHZWtMVVdrRTh5?=
 =?iso-2022-jp?B?bjNCNURoVFh4b3F1UGRyWWo3Q0o0dXJsNmhIdmdGamM4VndiTHlPMThN?=
 =?iso-2022-jp?B?NDgyMVVOMEtnNUUrb3RRazBSR3E4WTMrMy9vNEh6aUFuZ1RQbW1FdHpZ?=
 =?iso-2022-jp?B?bVVucUFJMHRTM2h3bytrMTA0em16T0Jxd2oxc2dKT01xbTRKaXEwYWw0?=
 =?iso-2022-jp?B?SHFXYVVQOUtUcXVqMHAwaWw4QmpTRzNoNGZaUHdpNG5idVZnVGplc0sy?=
 =?iso-2022-jp?B?NmRZUXJqY3VwT0g1K09tclBsMUVmMVNBclNpMGdQM0swRlphN2xmTFNy?=
 =?iso-2022-jp?B?NWE0UWhSZzYwcm9TQ3lvNTlWb1UyNnNLM0pKak1SQnllV2FUd0tPaFly?=
 =?iso-2022-jp?B?Z1psMU9IejY4SzR0TGYrcGZSRG1UVFFaTzI1VjMzdk9yL2RWUmtwcWJx?=
 =?iso-2022-jp?B?KzdOeTlDZDhkaEhCOVZhNm1jQ1BISW4vTUE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66dba7a0-25ba-4beb-51e5-08d9df207e77
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 10:01:30.2863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: un0yC5s4iu/AlIxVQqeyFObCysePMdDUcMchMbE295jnWL7mooIMre3dh+6+I0Ie9abuJj1B+8Cl6449mhTkdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2946
Received-SPF: pass client-ip=183.79.94.93; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob08.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Akira Oiwa <aoiwa@yahoo-corp.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping, how is the status of this patch?

Link for this patch v2 on patchew is this one: https://patchew.org/QEMU/202=
20111091950.840-1-hnarukaw@yahoo-corp.jp/
The last message on patch v1 is this one: https://lore.kernel.org/qemu-deve=
l/TYCPR01MB8357E8D13D661265CDBB442C80519@TYCPR01MB8357.jpnprd01.prod.outloo=
k.com/T/#u

The difference from v1 is use of qatomic_read().


> Resending patch with fixing atomic access method to use qatomic_read().
>=20
> We encountered random disk IO performance drop since qemu-5.0.0, and this
> patch fixes it.
>=20
> Commit message in c740ad92 implied to adjust coroutine pool size adaptive=
ly, so I
> tried to implement this.
>=20
> Could you review this patch?
>=20
>=20
> Hiroki Narukawa (1):
>   util: adjust coroutine pool size to virtio block queue
>=20
>  hw/block/virtio-blk.c    |  3 +++
>  include/qemu/coroutine.h |  5 +++++
>  util/qemu-coroutine.c    | 15 +++++++++++----
>  3 files changed, 19 insertions(+), 4 deletions(-)
>=20
> --
> 2.17.1


