Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A553073A7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:23:57 +0100 (CET)
Received: from localhost ([::1]:40352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54Sy-0002q9-HO
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@huayun.com>)
 id 1l50BY-00005Q-Mu; Thu, 28 Jan 2021 00:49:41 -0500
Received: from mail-shaon0139.outbound.protection.partner.outlook.cn
 ([42.159.164.139]:9999
 helo=CN01-SHA-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@huayun.com>)
 id 1l50BR-00042s-Vo; Thu, 28 Jan 2021 00:49:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7rnEHxlJOQ3467S3VTTYCoOmz8z04+jezP2V/Z+ge/IbtP5+eMfsuPQThBTn4SX3GEJCw7v5g5sBwb4UxA6yz+EDP7bSJsLGRJeWluPCkLlbPfcw6xF2Wq+4y5zu5eKwWN5r22JdDNTOWom4kKDfYAlE5+lvwQOZGq/ekaAS7OTZtyDx7DJ0MQJjkbVGF7LLgWXNC8wxHJpEhCp79nwlheDN3NS5GZJsOsAfMmpT+Ljg17jNQVqRNBhVxV07YmL0cdFb47mTKym3TMLJiNYMNXT2CuPrMV7kI8eBuH/1Wtodqbp6czwMPQTjazeFMIIenvelR5r/KUfvBmvNgBWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkeDHnA7CHhLvE9fihqOXyKJFoBiwfCSkrUS+nzQtfg=;
 b=YiQDs/hJ+KIkkqDNBs+u0nFwP9oEwlSMpwRbl7b/kVekOwCaT2pxIFaaeVrgGus21QrSncKsoVYTeV4TQaXHN/kq5CKHauYKzBx/DBqxau5bsZdtWkaFFSwjN719o69IRt2nOdLrPKVxihj9Hn81qX/JGiSHzMnMXDK35mkwowdmKtQ7Jrv9u2pomjz2KO/tEaqI14yH/hmIcJYZT+gj+usztwRxv3tKWEJhAcMpK4P9FawRyj4LmJhYNpONltkpQiyKWH8fgEDIRsL2DwEzeJvrYsCj4aw6is0R+dsvnclapkjpcSpl1By3weghebeBzkE/BdZEemQXWA6kEDMELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=huayun.com; dmarc=pass action=none header.from=huayun.com;
 dkim=pass header.d=huayun.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hycloud.partner.onmschina.cn; s=selector1-hycloud-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkeDHnA7CHhLvE9fihqOXyKJFoBiwfCSkrUS+nzQtfg=;
 b=HBH4+SgavCIprcLs+MZ10mroTPshQ8gMv4d9zO9kP55LSiZC5+gmUDdRsaxo8xo9glDdTGUf5TEoZBtG4NGM4RB9BYRKFXRvT9eWIBjQeqJGLpF8Zi63hlQURiByK8WGWCVmWXDsAPaTMfuwoS19ML11bxRrQgH0fuFJpki+m7Y=
Received: from BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn (10.43.36.76) by
 BJXPR01MB0712.CHNPR01.prod.partner.outlook.cn (10.43.36.14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.13; Thu, 28 Jan 2021 05:16:10 +0000
Received: from BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn ([10.43.36.76])
 by BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn ([10.43.36.76]) with mapi id
 15.20.3805.019; Thu, 28 Jan 2021 05:16:09 +0000
From: =?gb2312?B?s/C089Px?= <qiudayu@huayun.com>
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
Thread-Topic: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
Thread-Index: AQHW9RU6HzbrvThE906I7emhJunSaKo8fsbg
Date: Thu, 28 Jan 2021 05:16:09 +0000
Message-ID: <BJXPR01MB077611B90E717085D41CA0B5CFBA0@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
References: <20210126032545.13349-1-08005325@163.com>
 <20210128013053.23266-1-08005325@163.com>
In-Reply-To: <20210128013053.23266-1-08005325@163.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=huayun.com;
x-originating-ip: [218.90.171.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69c1cbea-2a96-4102-2f72-08d8c34bd2cf
x-ms-traffictypediagnostic: BJXPR01MB0712:
x-microsoft-antispam-prvs: <BJXPR01MB07127D5C3BF976A2650A2F32CFBA0@BJXPR01MB0712.CHNPR01.prod.partner.outlook.cn>
x-ms-oob-tlc-oobclassifiers: OLM:294;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aNkbp33AyzIZP7wnm2uRV/UQhUW8sl8y4yoTgzp00+eWnW8gtIvRQoLgTZgzcO1GmdbaSvjc+3ZXmLkIxYmLu3Vt7PYNeITUcqrPF3UTPw96Tp3x8Qy/RrQfWlAKNRoQ9LRx93kgM9J+OrcF9iEjkt/o2OtZ10NIcvAvaPlR6901o5rCQqxtN2vErYQAG+3N3xOn/tKTX6NFxCx1/X4bz1Z6HFanRg7obUXV1zZYNViwysSNQ/SIuk+JL8LruW7btMZ/XQm/iQHfMMcs6ymMbN+8mNiCz+X/uuab6+JDq/rq0y9nKmhZilVOlZlzd+JUHn7R1nevnBkIDbBX+gkLYqhYttUC0AHibXsze0l+FXtcYAfcDcoWgrDEeBwt+Q2xcxyqMjARZL7x0vwTtdEwm/xs0qPFs9vp++U/xiwy6Wb6cgC9dLqRTriCN9rfY1z7AAvY/FkLiN5EWdIy4Ar459CsKPEaEo62fPP2zG/QItzAaAkApVmt444n3INTI6u2AWmn2iYWA2NFSQ5V/ADXsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(376002)(366004)(346002)(328002)(329002)(2906002)(33656002)(4326008)(63696004)(95416001)(83380400001)(55016002)(71200400001)(5660300002)(9686003)(85182001)(8936002)(8676002)(508600001)(66476007)(86362001)(76116006)(66446008)(64756008)(26005)(186003)(53546011)(54906003)(66556008)(110136005)(7696005)(66946007)(59450400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?VWNCcWFOQ1RtUS9kalAwZStwcEJGdE1SdjhxT0haRE5JRmlpOXg0OXhRNDAr?=
 =?gb2312?B?eExtdWpxaGpWaEhDTENRbnFZRjNianIyNDZDdGsxNFd2amU0QklvSysrWVF5?=
 =?gb2312?B?bG1tM0Jkb1ZjZTB5RldOdUlMTEthcW13Z3FrWDNNZWRWTTRUSDVzQmluaW15?=
 =?gb2312?B?RTF1SnhYVnoxRlZsTVJzZEpSdzJtYzk0enRKTFFRc0Q3N1JzL3lvdU1raDN5?=
 =?gb2312?B?ZWtsNzZjSnp2ZERiaHduWHlHNmhzQWFEZjR6Ly9ma0Z0Tml2b05RVUlGdktn?=
 =?gb2312?B?bUt5RXRsbks3clBobnZ3UHZYcnp1enExZUVMKzcvMGJ0L01jMkpYNTd5NjA1?=
 =?gb2312?B?a0kwR0V5UnYyN0RSTk9nYnFzY3hoNGlkWjVYeVpyUWdUNzBLYXcvMmQydGxz?=
 =?gb2312?B?UnVIZEI1b2w3YjdZRTRPVzA4MStFTmE2L1ZMZ3dzcWlIK2ZQOUdCazRRbUlr?=
 =?gb2312?B?c3NDeDA1YW90QWhUR0FTOU9sWVZqdFd5cUxuZDJEbVFmRDdwSXJqbXNITXhC?=
 =?gb2312?B?eTFEUFJLQlRjVTJyWjFJaXI0eVJOMXQzcmg5bmpySWtjSllkK05sRTRmRmE4?=
 =?gb2312?B?QmtDdEFTc0EwdkpNWHg0THRXR2ErYlN0NUwzYzR1TEZVLytIUVNxSm95S1dT?=
 =?gb2312?B?alE5T1VQNnNVOWw5L2tvdFNWa1NUOE5idE9hVEJyTWd1WmRQL0x1WWx5TU1s?=
 =?gb2312?B?WmtnU0grRWNPbGJnZm5LeitnMkFVUjZsdURCbGZVc3hHNDQ2QXR0bVhHdmta?=
 =?gb2312?B?ZkFWdzJsTS80S21nNmxKTjJKRUNySVV4OEpaWGxTRHdVQU13NUdDbFNGNlcx?=
 =?gb2312?B?U2tMejJWSGd6dGhtb2NUcGVOMDRYd0FPaUVHdm9FMjNkSy90ZEN6cHRocWVB?=
 =?gb2312?B?SU1RMm0vcnBlRVYraCtWZ1JQamw0ZkE2QWZNSXUxR2hrb2RubmRaQ0pYYjBl?=
 =?gb2312?B?UDNYQ2F0VjlEVFRRRXZ3SDdJdFZHZXN1TFovQjFaeEV6bC9VN0x6VU9sMkpT?=
 =?gb2312?B?SURSZHRHUitOdGx1R0NYQVJQZ056Y1hINDBEOVRWQTVYbUZNQXU5aS9pSmpl?=
 =?gb2312?B?YThQa2lHa3V2QndEaklLYmRlODZCMzFCZVNBa0paQmpLTjhHeHdGdGdIVDMx?=
 =?gb2312?B?NDd5bGVCYjd6V001S2J4QmlnZFRvVk0zZktab3p1YkU3R3AveEZERS9ia1Rw?=
 =?gb2312?B?Tm1ZVGI2bllCTDhZdDg2ekNOaGtGc29KRmVHcnNpN3Z6VjZxTnByV21sWi9X?=
 =?gb2312?B?ZjNxWkcxenFmR3AzWjNnYUVnVDJUcVNleEc2b0FJVFZtSUxMZEtod3Nxb3VK?=
 =?gb2312?Q?tzpaleVaBwQZQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: huayun.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c1cbea-2a96-4102-2f72-08d8c34bd2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 05:16:09.8562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a674a363-98d5-4f2d-95da-d54302c8edaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ujjXdAZMExqPRPa9ATug4xSi0GBwg6CqWDAstKd1vOhV+s7jqe1WrA/xVjVmiYJopzvA7H/347aOYVaBawL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0712
Received-SPF: pass client-ip=42.159.164.139; envelope-from=qiudayu@huayun.com;
 helo=CN01-SHA-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MIME_CHARSET_FARAWAY=2.45,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Jan 2021 05:22:43 -0500
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "08005325@163.com" <08005325@163.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QW55IGNvbW1lbnRzPw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogMDgwMDUz
MjVAMTYzLmNvbSA8MDgwMDUzMjVAMTYzLmNvbT4gDQpTZW50OiAyMDIxxOox1MIyOMjVIDk6MzEN
ClRvOiBrd29sZkByZWRoYXQuY29tOyBtcmVpdHpAcmVkaGF0LmNvbTsganNub3dAcmVkaGF0LmNv
bQ0KQ2M6IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyCz8LTz
0/EgPHFpdWRheXVAaHVheXVuLmNvbT4NClN1YmplY3Q6IFtQQVRDSCB2NF0gYmxvY2tqb2I6IEZp
eCBjcmFzaCB3aXRoIElPdGhyZWFkIHdoZW4gYmxvY2sgY29tbWl0IGFmdGVyIHNuYXBzaG90DQoN
CkZyb206IE1pY2hhZWwgUWl1IDxxaXVkYXl1QGh1YXl1bi5jb20+DQoNCnY0OiByZWJhc2UgdG8g
bGF0ZXN0IGNvZGUNCg0KdjM6IHJlZm9ybWF0IHRoZSBjb21taXQgbG9nLCByZW1vdmUgZHVwbGlj
YXRlIGNvbnRlbnQNCg0KdjI6IG1vZGlmeSB0aGUgY29yZWR1bXAgYmFja3RyYWNlIHdpdGhpbiBj
b21taXQgbG9nIHdpdGggdGhlIG5ld2VzdA0KICAgIHFlbXUgd2l0aCBtYXN0ZXIgYnJhbmNoDQoN
CkN1cnJlbnRseSwgaWYgZ3Vlc3QgaGFzIHdvcmtsb2FkcywgSU8gdGhyZWFkIHdpbGwgYWNxdWly
ZSBhaW9fY29udGV4dCBsb2NrIGJlZm9yZSBkbyBpb19zdWJtaXQsIGl0IGxlYWRzIHRvIHNlZ21l
bnRmYXVsdCB3aGVuIGRvIGJsb2NrIGNvbW1pdCBhZnRlciBzbmFwc2hvdC4gSnVzdCBsaWtlIGJl
bG93Og0KDQpQcm9ncmFtIHJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLCBTZWdtZW50YXRpb24gZmF1
bHQuDQpbU3dpdGNoaW5nIHRvIFRocmVhZCAweDdmN2M3ZDkxZjcwMCAoTFdQIDk5OTA3KV0gMHgw
MDAwNTU3NmQwZjY1YWFiIGluIGJkcnZfbWlycm9yX3RvcF9wd3JpdGV2IGF0IC4uL2Jsb2NrL21p
cnJvci5jOjE0MzcNCjE0MzcgICAgLi4vYmxvY2svbWlycm9yLmM6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkuDQooZ2RiKSBwIHMtPmpvYg0KJDE3ID0gKE1pcnJvckJsb2NrSm9iICopIDB4MA0K
KGdkYikgcCBzLT5zdG9wDQokMTggPSBmYWxzZQ0KDQooZ2RiKSBidA0KDQpTd2l0Y2ggdG8gcWVt
dSBtYWluIHRocmVhZDoNCi9saWIvLi4vbGliNjQvbGlicHRocmVhZC5zby4wDQovbGliLy4uL2xp
YjY0L2xpYnB0aHJlYWQuc28uMA0KLi4vdXRpbC9xZW11LXRocmVhZC1wb3NpeC5jOjc5DQpxYXBp
L3FhcGktY29tbWFuZHMtYmxvY2stY29yZS5jOjM0Ng0KLi4vcWFwaS9xbXAtZGlzcGF0Y2guYzox
MTANCi9saWIvLi4vbGliNjQvbGliZ2xpYi0yLjAuc28uMA0KDQpJbiBJTyB0aHJlYWQgd2hlbiBk
byBiZHJ2X21pcnJvcl90b3BfcHdyaXRldiwgdGhlIGpvYiBpcyBOVUxMLCBhbmQgc3RvcCBmaWVs
ZCBpcyBmYWxzZSwgdGhpcyBtZWFucyB0aGUgTWlycm9yQkRTT3BhcXVlICJzIiBvYmplY3QgaGFz
IG5vdCBiZWVuIGluaXRpYWxpemVkIHlldCwgYW5kIHRoaXMgb2JqZWN0IGlzIGluaXRpYWxpemVk
IGJ5IGJsb2NrX2pvYl9jcmVhdGUoKSwgYnV0IHRoZSBpbml0aWFsaXplIHByb2Nlc3MgaXMgc3R1
Y2sgaW4gYWNxdWlyaW5nIHRoZSBsb2NrLg0KDQpUaGUgcm9vdGNhdXNlIGlzIHRoYXQgcWVtdSBk
byByZWxlYXNlL2FjcXVpcmUgd2hlbiBob2xkIHRoZSBsb2NrLCBhdCB0aGUgc2FtZSB0aW1lLCBJ
TyB0aHJlYWQgZ2V0IHRoZSBsb2NrIGFmdGVyIHJlbGVhc2Ugc3RhZ2UsIGFuZCB0aGUgY3Jhc2gg
b2NjdXJlZC4NCg0KQWN0dWFsbHksIGluIHRoaXMgc2l0dWF0aW9uLCBqb2ItPmpvYi5haW9fY29u
dGV4dCB3aWxsIG5vdCBlcXVhbCB0byBxZW11X2dldF9haW9fY29udGV4dCgpLCBhbmQgd2lsbCBi
ZSB0aGUgc2FtZSBhcyBicy0+YWlvX2NvbnRleHQsIHRodXMsIG5vIG5lZWQgdG8gcmVsZWFzZSB0
aGUgbG9jaywgYmVjYXN1ZSBiZHJ2X3Jvb3RfYXR0YWNoX2NoaWxkKCkgd2lsbCBub3QgY2hhbmdl
IHRoZSBjb250ZXh0Lg0KDQpUaGlzIHBhdGNoIGZpeCB0aGlzIGlzc3VlLg0KDQpTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIFFpdSA8cWl1ZGF5dUBodWF5dW4uY29tPg0KLS0tDQogYmxvY2tqb2IuYyB8
IDYgKysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2Jsb2Nram9iLmMgYi9ibG9ja2pvYi5jDQppbmRleCA5OGFjOGFm
OTgyLi41MWEwOWYzYjYwIDEwMDY0NA0KLS0tIGEvYmxvY2tqb2IuYw0KKysrIGIvYmxvY2tqb2Iu
Yw0KQEAgLTIxNCwxMyArMjE0LDE1IEBAIGludCBibG9ja19qb2JfYWRkX2JkcnYoQmxvY2tKb2Ig
KmpvYiwgY29uc3QgY2hhciAqbmFtZSwgQmxvY2tEcml2ZXJTdGF0ZSAqYnMsDQogICAgIEJkcnZD
aGlsZCAqYzsNCiANCiAgICAgYmRydl9yZWYoYnMpOw0KLSAgICBpZiAoam9iLT5qb2IuYWlvX2Nv
bnRleHQgIT0gcWVtdV9nZXRfYWlvX2NvbnRleHQoKSkgew0KKyAgICBpZiAoYmRydl9nZXRfYWlv
X2NvbnRleHQoYnMpICE9IGpvYi0+am9iLmFpb19jb250ZXh0ICYmDQorICAgICAgICBqb2ItPmpv
Yi5haW9fY29udGV4dCAhPSBxZW11X2dldF9haW9fY29udGV4dCgpKSB7DQogICAgICAgICBhaW9f
Y29udGV4dF9yZWxlYXNlKGpvYi0+am9iLmFpb19jb250ZXh0KTsNCiAgICAgfQ0KICAgICBjID0g
YmRydl9yb290X2F0dGFjaF9jaGlsZChicywgbmFtZSwgJmNoaWxkX2pvYiwgMCwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgam9iLT5qb2IuYWlvX2NvbnRleHQsIHBlcm0sIHNoYXJl
ZF9wZXJtLCBqb2IsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVycnApOw0KLSAg
ICBpZiAoam9iLT5qb2IuYWlvX2NvbnRleHQgIT0gcWVtdV9nZXRfYWlvX2NvbnRleHQoKSkgew0K
KyAgICBpZiAoYmRydl9nZXRfYWlvX2NvbnRleHQoYnMpICE9IGpvYi0+am9iLmFpb19jb250ZXh0
ICYmDQorICAgICAgICBqb2ItPmpvYi5haW9fY29udGV4dCAhPSBxZW11X2dldF9haW9fY29udGV4
dCgpKSB7DQogICAgICAgICBhaW9fY29udGV4dF9hY3F1aXJlKGpvYi0+am9iLmFpb19jb250ZXh0
KTsNCiAgICAgfQ0KICAgICBpZiAoYyA9PSBOVUxMKSB7DQotLQ0KMi4yMi4wDQoNCg0K

