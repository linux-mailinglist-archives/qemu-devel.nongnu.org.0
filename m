Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE64B4F83
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:01:43 +0100 (CET)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJa34-0004i2-ON
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:01:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nJZwG-0008MS-Ok; Mon, 14 Feb 2022 06:54:40 -0500
Received: from corp-ob09.yahoo-corp.jp ([182.22.125.216]:55572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nJZwE-0004ia-CI; Mon, 14 Feb 2022 06:54:40 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2176.outbound.protection.outlook.com [104.47.23.176])
 by corp-ob09.yahoo-corp.jp (Postfix) with ESMTPS id 362EC19FB18D;
 Mon, 14 Feb 2022 20:54:35 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1644839675;
 bh=B3xc23CcuSaIIjuOYuVaudL1O+JeIL9LiH4QHCrovrY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=oCIgxGWIvabvJeFKNj5ZqeGLn6wL7JEbhDc1GuqRLt/ge+rXb03XY7x2CEl5eCCVC
 r4mcMQ85ijIG5e30P5chzg28L6QGDs4Gh57bu19SSkSqdNQpEifIe5gbgAlr+xWneX
 9OLbaFO2XAfDDAa+V1JMeFV07NfhUG2kszO7/CZ4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ddua3v9x7cYT96iweApMZV3JIURattBH+kaZtVqVbXPluoRiVZ4WBUZxfAf9Y9wBUfgXxgJARiFRhCsk3NR3Zqenm6/F5AfmxEiVpY+1ZhPHiiCrv/OFIiFNjCU+8kpjJZXS4r1TVfWjVowX7KWoYjYcf+g/VgdutXZTW8hTNXGKtwNNwowL2bxAXJpZtyPpLdHih3zLyTRRXMpDIKkPUZb47vqfHw/xI79vfD930s77OQbp5+FgmhsjyU7qtJDChTD/HEMlkJ/xSLxjWG2n1c/Uvh7MOco1UB3K0O+6LaEepmkxDkkLazhpRmMKV3ZsC8bt+c8Mx844j6e8+10A2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3xc23CcuSaIIjuOYuVaudL1O+JeIL9LiH4QHCrovrY=;
 b=ctxsdE/iYXLAWg63hO0UiYytRXAgNliesKq+4VKwtNHTn2iZut5pDY8ozrANppSq4J8P4bo/LMz6HeaVb9QkO7WDT9iW+Gu5+nXm7he3HbOyYL0Ocwgq6oc/J1WEVHxMgTy75RCtt4ry8QI0tKIDk+nBGC3d3MvAfVGgPZlUAJt6DRmbxJHtZQuKiEh2zlSlk9k/5W7FyioVWRPNLu8bn69YhN2UKJQ7hPTz2Ol9l2lxhhYyJDRGb8wueRClyPCGiNl5FWSewIA5jNGesA5JTXkv0CoZY5QEsfSXngSXiq/keuE0TbZclZIABFXuz1xA4ksdIr7eQVsCl2yjblM8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3xc23CcuSaIIjuOYuVaudL1O+JeIL9LiH4QHCrovrY=;
 b=k5PZHqm1C2kPIwg8JQTRDJUruVsYJaC6foQab0R1Rc4u8cflXsSbCk3IUPPJVtNBrHuqbs2tKcbTx0wgjiPPamfcTDgjBCKDoF7OmLbGq4s7bQvcbADgua0oZgN27fv0Dk8uUr2CA3mB4kAE648QpGuO+XJCYxQZGScMq9ll9Lw=
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by OSZPR01MB6889.jpnprd01.prod.outlook.com (2603:1096:604:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Mon, 14 Feb
 2022 11:54:34 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%3]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 11:54:34 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 1/1] util: adjust coroutine pool size to virtio block
 queue
Thread-Topic: [PATCH v3 1/1] util: adjust coroutine pool size to virtio block
 queue
Thread-Index: AQHYFCIpg29gxgiVdkueC3VtimNJGayTCqqQ
Date: Mon, 14 Feb 2022 11:54:34 +0000
Message-ID: <TYCPR01MB8357459CED4A917E0F6CA53F80339@TYCPR01MB8357.jpnprd01.prod.outlook.com>
References: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
 <20220128083616.6083-2-hnarukaw@yahoo-corp.jp>
In-Reply-To: <20220128083616.6083-2-hnarukaw@yahoo-corp.jp>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b9c46e9-38dd-4a21-659b-08d9efb0c4d6
x-ms-traffictypediagnostic: OSZPR01MB6889:EE_
x-microsoft-antispam-prvs: <OSZPR01MB688915CE8798C2716DC9AB7A80339@OSZPR01MB6889.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQcqdzdTxE/gLU1Vvgh/fVYvitbDmwvS3xNSp20MI0PfhUQihJXcX3deQPhsf8JPa0C0wzOuxoyuPiHLdTzMjEoYGO9Rdh39E09yRZjg2o5j3LzblMMbteOZi403NApLvCUBMvtzu8Nhw/jG5QuE5iPEnHEW8DLnOJFhKDKx9clHZRJkmsYLGUKsUuNd2dXCu1tTutB3I0qe6dg9f5IrRnGPbzXUuPADGPUUsNF0wW6Nn112G6AjpGwGSDba2zA/YcBsODTXw06QOespyuKjvNGeVSwDdWK8rXwofVq1Dwwb+yZLBDBf03mP9CQ9o24dYyCxfzf4QSjeZmhkg6KGIBhzWLCvU82ixF0p12W/HgdXmKmavP6tm7tsQwp/xIJjXt99YPh0mlRSSbDch86EYHGEuy74ATBgHxy9wcIPI4X9gp7Unb4kEBrIvXLBoPaC1/s4Im20EMPZ3tew8P8eI6pDcq3euxZg8k554xiTwzb1fUjKIbxAPA/wLfkJwisbDj5WATUS0TlB9mEARJt+i7mhl3lhwAKuodpES2H+7y3VdlI0fOEWoJLEl+54AaEhcy0gySYIezp7lgGJogyuH636F9bEBPoKoMIh4NWzeII9NM8iIyfwNnLKkkdiaE78L636k2veG6jiW+iO2rHDZTAFtJH7a+ybslwhwAQt2Ab/xEOT+eR+eukzaNFDFCo+RGH011k+alnc1FeNxw8KK5x75N5Ce9wYdoiDt+KTCkqYMKk07YUkrzrlgB3ngbZmFGNuiyp19kgSgKehzR/JjaWaGiQ3EqMQZtFc3h7Xla0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(64756008)(55016003)(82960400001)(6916009)(316002)(66556008)(66476007)(38100700002)(5660300002)(966005)(54906003)(4326008)(8676002)(38070700005)(86362001)(85182001)(33656002)(122000001)(508600001)(71200400001)(26005)(107886003)(76116006)(2906002)(8936002)(66946007)(52536014)(7696005)(9686003)(83380400001)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Y3pZaGhHcUF4cExmWkhTWDFBQ0RPSG1Danh0WjhGVFR5KzAzajZ1VHhk?=
 =?iso-2022-jp?B?M09hTjFuQ21JUjN3ZU1PYi9TdDFHNmNWUGZGcHdscHNEQUx2RjVON1pw?=
 =?iso-2022-jp?B?aitSSnJudlJ1MTBoSlB5NWk5MmxCRENqejhma28yOFN4RlJSRkxhZlZv?=
 =?iso-2022-jp?B?SFZqWThNUGhvVEZYcVMrckxUN2JPQVJTdFozcWtNOWgrN3M3a0ZBT0Zl?=
 =?iso-2022-jp?B?ZCthQW9NQ1NGYlBqZ1gxM1Jmb2RpakdiSVhwT0ZzUi9oUEdzeXlsTW5U?=
 =?iso-2022-jp?B?cU1od01WUkJoZjFleEh2a2lHSUhBTGlsY1U5a1U1dGhoQ0M0N0xNSWNu?=
 =?iso-2022-jp?B?eTlnVmNDNk1TNHVqK3R1UEVLRW11dW1EK1U0TTM3dDc2bGl5K1c0a0hw?=
 =?iso-2022-jp?B?VzM2VVNLMVJuNDBDelpBWGhTUUx1Z2JXVGxrbUZnV081eW5haXlBZVc3?=
 =?iso-2022-jp?B?ZTBKMUwvUy9JQnNhaVFHcGd3OTJTRGFMdzhDRW9HTzZIQ3c0ZDRjOG5F?=
 =?iso-2022-jp?B?RWxHREpnWFpGUkp0U0JXN3AyRVV1WENFdE40RUV5SkpPVTlCcFJOR2Fj?=
 =?iso-2022-jp?B?UHpzSXM3SDdMbTZjZFY1QVFoWDVKZnpFRHBpNTRiR0lOcUx1VGRwYXlt?=
 =?iso-2022-jp?B?enl2RXJhQ2V3Z2NCMWJjZ0JsZStiS3JDZnplVFVnZ2JyazZ0Unp6ZDJt?=
 =?iso-2022-jp?B?MDhZakZ0bVhacjQ2c0gzb01hNUQwN1hnd3h4ZmFYMGdxcUxsTGhlQmVq?=
 =?iso-2022-jp?B?ZUJ1Q205UkhCaFJva200Y3FkZXpObUd3TUpzYVJod3QzdkFNZUlxZmlB?=
 =?iso-2022-jp?B?bjAvSjVIOUx3YjNNVlNiYXFvQmM3ckV5Q2c0TTBwN2x3VHZoSGUzZzA5?=
 =?iso-2022-jp?B?OExJTkRzWWdDSWFsQU1HM2tsZmJIdUJGakNURHhpWGUvcEdJcXBWa05v?=
 =?iso-2022-jp?B?b21HSEgxQ0FWb0RneXNwamN1Mjd0d1hOdjZHdHhCdVFNeENQL0ZQS3Rw?=
 =?iso-2022-jp?B?eHZCRW5pRHFER2JraUI4K3h3MzlXSUw1Zm1wSDVnSUpTZWVUMjlKSU1M?=
 =?iso-2022-jp?B?dU10bC9ub1BCQjNsT1VZU2VScG94Q1hEbEVaTU9BOWVsMUJrNFRDMUJ6?=
 =?iso-2022-jp?B?d3JHVUFvZVYzWWNaUXdXdC85OVh6eWZqb1NXSFZ0YjloaWh3N2tudXZD?=
 =?iso-2022-jp?B?YXdRRFNtcXh1MWtLTUl1b25BR3pJWkxrcDFia1BCbnBVMVowc2hNc0pw?=
 =?iso-2022-jp?B?NnZza3Z2cnhqNDM0TnRvSzZqeUVWMXJITjFEMTM5YlNCK0F1L3ljNUhT?=
 =?iso-2022-jp?B?cVhFMURPMjdabitmUnpBcWlyMW9kekVwYm53dWg3NmZKQUZpUGRxMWo1?=
 =?iso-2022-jp?B?REhOMGMza1dVSk9qWHZLOGNDY2l0Rm1jcWY1ZWl4ODdVV3VxYy91V3NT?=
 =?iso-2022-jp?B?Sk1xZ0N6bnNRWVJZVi80UnU1TjlUUVdkc21mVjQ3OUVJakRJQ3JVK0x3?=
 =?iso-2022-jp?B?YVJHOU9UaFJGWHFRZmd1cHlmQ01MYStoWFRjOTdZTlFGNHZPeEFDUFhO?=
 =?iso-2022-jp?B?aHpyVmZiYmFpbmZSSU5SR1VuZTZ4cy8yeXdJcWZrQlZ2WGw5TUlzdEEx?=
 =?iso-2022-jp?B?RlpidnNCaVJrZjhVRkRvOXJ3eU11Rm5Od2g1MFZTcllvU3JkNVdHRHZo?=
 =?iso-2022-jp?B?bytjSWRVb1FzRllacW5FcS9rK1FzWjBvYnpKQng3VlRocVVUQm5JQ0s0?=
 =?iso-2022-jp?B?WEowN1puUDVDcDBBUkRUWHVRdjhlaThWc2IwWUlBSUg0MndQS1pUZE0y?=
 =?iso-2022-jp?B?b1NNWUdiMlYzMlJGeDQ1ekE3Zk81ejZsVnRCemRZamlwNGloUERYaW1v?=
 =?iso-2022-jp?B?Q0JvZmhUZGFvcTFsd2ZuZXQvaFg3b3RSQkIrOGN3SWZxSHBjOThseWta?=
 =?iso-2022-jp?B?MlIxSmZVMnlJNzFLWHBIQVR6RTZSRER4bkg4d0lpcUFuZjFvbk5nYlEv?=
 =?iso-2022-jp?B?aDI0K3VVUCt0T0FSY3RNOTllQ0JaM1ZwbHRHMFFDUlRmRkE4WGJRaWFQ?=
 =?iso-2022-jp?B?MTJqSXpYcSt6UnNLRkQxbUN6WXppaFY3UjdveGQ2R2k3cm5nd3BNUnBD?=
 =?iso-2022-jp?B?SHQ0bnF2MHRVUGRGeWJHMWkra3NTK3hhSHZVLzNOUlpXMEJZbm8rRzd4?=
 =?iso-2022-jp?B?aUJtQ3NjUzlLNWZmNlh6M21zbmxPdHN0RXRBbGRlUDdJQlpFaVlQcnVL?=
 =?iso-2022-jp?B?Wnc1eXl6ZmZPeGZVbkF5REhvWUhSbmRkS1JrUVVMZkFhMHZJUlpBVm9E?=
 =?iso-2022-jp?B?MkpPNjBCZ0d1OTBmNjJzRkpUeHkyRjlOeGc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9c46e9-38dd-4a21-659b-08d9efb0c4d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 11:54:34.4834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxRwZlAlp5biXuIcpDjAe3/K7JDeeAdN9w6Jlyp1X1vupLBgInqa21XDR2xHYsvFD6wp54mRrc3zTYwKoZJncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6889
Received-SPF: pass client-ip=182.22.125.216;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob09.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> Coroutine pool size was 64 from long ago, and the basis was organized in =
the
> commit message in c740ad92.

Sorry, I noticed that commit ID mentioning here was incorrect.
The correct one is 4d68e86b.

https://gitlab.com/qemu-project/qemu/-/commit/4d68e86bb10159099da0798f74e75=
12955f15eec

I have resent this patch as v4 with exactly the same code as v3, just chang=
ing this commit message.

>=20
> At that time, virtio-blk queue-size and num-queue were not configuable, a=
nd
> equivalent values were 128 and 1.
>=20
> Coroutine pool size 64 was fine then.
>=20
> Later queue-size and num-queue got configuable, and default values were
> increased.
>=20
> Coroutine pool with size 64 exhausts frequently with random disk IO in ne=
w size,
> and slows down.
>=20
> This commit adjusts coroutine pool size adaptively with new values.
>=20
> This commit adds 64 by default, but now coroutine is not only for block d=
evices,
>=20
> and is not too much burdon comparing with new default.
>=20
> pool size of 128 * vCPUs.
>=20
> Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> ---
>  hw/block/virtio-blk.c    |  5 +++++
>  include/qemu/coroutine.h | 10 ++++++++++
>  util/qemu-coroutine.c    | 20 ++++++++++++++++----
>  3 files changed, 31 insertions(+), 4 deletions(-)
>=20


