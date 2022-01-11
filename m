Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83548AA87
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:29:34 +0100 (CET)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DTB-0006VQ-Cd
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:29:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n7DRY-0005oo-MP
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:27:52 -0500
Received: from corp-ob07.yahoo-corp.jp ([183.79.94.94]:51512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n7DRW-0002lj-4d
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:27:52 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01lp2113.outbound.protection.outlook.com [104.47.23.113])
 by corp-ob07.yahoo-corp.jp (Postfix) with ESMTPS id 5850B19FB18A;
 Tue, 11 Jan 2022 18:27:47 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1641893267;
 bh=SQjKoqyd6V/PNryb3EGdH/61DT+Vldeoy2w8GozluaA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=ax7s/6JU+S1XgBC8PBFfmsDX4jTR9Aj5hZ6Lt2zu3yb2fgdTrDFDPXuY7Qz8CoWga
 4f9X1wVnyF4mxtEBPmwjCS9Um5Qi8t+IR18UrxSJ1MmjemYLPInLgIXc3+7p2xyTGT
 b6Otodl1q9rLMwGWDHoi0mHQGfviFygCljTYxPk8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5kKgORg9aHleLD5jtWvXLLkFc3FerITyLLP0oXKJBCXW6XZVPQf706x3brWyje/WVi5+2hYNWfDvXp/3VyvIPY/4vLnQ+wrvpZmQysccI8O+vApg4lGqUZMUsvFucche4vcPA5OsVQrs3M9AXVcLar5n1X19H/W7/EvBRverBXsVpYkukx0xzIr6nCup+xTbQO+iJhSyAhp2s4ojFf/QPofPpQk+byo2r8mObOU1UhNaG0fX6dCG2eLsrp/Fm4wrauJR4a/xBXgE0Lfzf0VJIOpAy8vrLTg7+DaZQvJDGstfxbT7b4+gg8+uv7Effo7AEv3jb0/FsFvC0Iq/sw7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQjKoqyd6V/PNryb3EGdH/61DT+Vldeoy2w8GozluaA=;
 b=SCOVlOkrsn+LB/ykRUAtLTU3+75KYEC2yVhgLAe820fubJsOQYXi9U6Z+X8CyiIUrd7Dm3ygbcJUsgQ+7aR+N1acJZGduQoiJExD/JBw8pMoutOAJJ/WagD45e0PwaW8A8hXrk1EhYr1hlmJfkeW9XhQeiaYzdaaG+hWgMTbfa8d2w6P+fAMA99RnJj3dVwP+FmNb5GCbsLRr8ROLIsZ/2kGmPZe1jWJuQA0NXEecOmnF/rQt5UjDzifEvI87aJFBjAkSGLaAnIHRp+irw/YW9HDUm8QZC4v8xWxYmv2SIJdOAxSzs6XkCh8iwwxb/c3tpBmbAJ+Hw+6CaGErlvXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQjKoqyd6V/PNryb3EGdH/61DT+Vldeoy2w8GozluaA=;
 b=G2GUhQNWnACQSrBxQPO+fuVyspOVKct6f8n8xg/azMd1txC4p8OuCfetLM84Oy2J6TpIG3bNjeoi2ru/x5lMBJ7JD3ZgSq/nXb68nnz9M59fAO/egp9mJWpOFh/HicROQFgLt7xwNiaXCjTwBY09jimiQF4qg4J+kjStfFn6oaY=
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TYWPR01MB8887.jpnprd01.prod.outlook.com (2603:1096:400:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 09:27:46 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::d1fe:ed04:219b:afe9]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::d1fe:ed04:219b:afe9%5]) with mapi id 15.20.4867.011; Tue, 11 Jan 2022
 09:27:46 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: RE: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Thread-Topic: [PATCH 1/1] util: adjust coroutine pool size to virtio block
 queue
Thread-Index: AQHYAtZrDhYJnztOV06MNEHyvWsXiqxcbGcAgAEnFUA=
Date: Tue, 11 Jan 2022 09:27:46 +0000
Message-ID: <TYCPR01MB8357E8D13D661265CDBB442C80519@TYCPR01MB8357.jpnprd01.prod.outlook.com>
References: <20220106082057.968-1-hnarukaw@yahoo-corp.jp>
 <20220106082057.968-2-hnarukaw@yahoo-corp.jp>
 <YdxUgnmY0bt8nV6A@stefanha-x1.localdomain>
In-Reply-To: <YdxUgnmY0bt8nV6A@stefanha-x1.localdomain>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6116491f-8157-4681-0cf8-08d9d4e4a0c6
x-ms-traffictypediagnostic: TYWPR01MB8887:EE_
x-microsoft-antispam-prvs: <TYWPR01MB8887902FFC51B812633DCD9A80519@TYWPR01MB8887.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gQRfIHtszkrEfH9Cjjbklw3HgoCC/HUaQpbet5GVmkLilLgHPCQe8ddVR9cSwmoWXg03d0xSLYZYGDFIAV0zMOBYy8J6RlZFAPFkdF5vgA1IaBNMgO4GRqrGzdy69920OcJIfcZqdQUZVxkTFgyS+Tw5ri5UBV4qu0ODMfeQaGjzy/7fjjAso9qFAzKf4gNVtcxtQn+YNB7dEh74rpaXPf2K3oCMLTsYPkW6a/8iKl7vqZmuUadaEkXZj3TSPOtP9rBRZy+raSlFjvUsE9b5KhEV8f4haifoyP8bpvTk2zrjPyieaKMPDc3teMtSzFDLd6DItEBCM+1mEUrlfdtzjEF2sEDc3tKajV6+h3voRgpCkWMwbZgzm46s8F/DHS8KFEwj4F20KWhnEAFkdJRVDSdzPZjnDm4ow0ZQjD6pDgB1HVIP31SzteYmry4YvTn06/ZLyRUboAL8Xp8A+wpSIMfJksGpur1jj0y2/HELTAFMMZe014I2bl6Ap11zJBoVxAoGS/QyBUZ2t6vwyfYX7F50yZjijVyJ748PW8jwafDiiKatAO9ZPj4mC5dmwK2anG4T9M6imU+nQR3fFb3IdrV3hNR/fuHFPEuDWsk6zA+LRdLXpvpQve+Cks3iOOujVASDUp0a4WwfHHmWU8d4BsNZSeCe7nZQZF8ITalP9BOCWqit3bWcx8FoxId4VjS/xiCrhaaQBjqGKTyPnv0KxEGnwmi3NfLMuiwZgzB3MdSI3aeoA8jpILrhOjVWpUr+vGWVCHyYtm8ho31kKPDNIejJzGYQEFZ7PgLHw4HrfQw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(82960400001)(55016003)(52536014)(71200400001)(85182001)(186003)(8936002)(316002)(9686003)(508600001)(8676002)(7696005)(66556008)(76116006)(33656002)(4326008)(2906002)(966005)(122000001)(6506007)(38100700002)(86362001)(66946007)(66476007)(66446008)(64756008)(5660300002)(26005)(6916009)(38070700005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?cDhzUUlxT2MwTFhqRUlBTzdJUERSNjdyMGJQRE1BK29SbjVHMVYxcm8r?=
 =?iso-2022-jp?B?NXZHZXF4SC85M2pCRTAvZjdHSWppSWZFSXJoaFlJYVVxRDdLazRSR09I?=
 =?iso-2022-jp?B?dmsvUzJWSUVqS2tvdS96SnI2Ri9PeTFDZXNiK1Yra0p0YkZZdGszZjc2?=
 =?iso-2022-jp?B?b2JuRDlZVHIyYi85bzhkbUF1ay9KaEtlb01nVmQvV1BjL1BwRU1JNE4w?=
 =?iso-2022-jp?B?UXBENEtKN0htdnVJNTFRcEYzaUt2L1dhZTVvYktSTGNVREtDL0E4NHl5?=
 =?iso-2022-jp?B?Y3lIdXRVYjBNUzk0Ry8rMU52T2xnTUE4QWZ2VDU5N0NNS0xHMGtMZ01N?=
 =?iso-2022-jp?B?dEJDdVV5Mk5vNC9ZQjYzV2FXR3ZGYlBvMnJiWjBYdU1ndXBjMGZsdk9a?=
 =?iso-2022-jp?B?cHEvU0hXRklNN3RicDZzWSs1UjY3Zm00Uno5c0xhTmFWcFhUVUhOQmZC?=
 =?iso-2022-jp?B?TEFqMFU5T1FmUkJ6NGx0L2ZvTnZBQTJQVG9zL1d2U1ZQK2wrdGM5SXlT?=
 =?iso-2022-jp?B?b1dSbU04Um1mcmMzN1loTm92QWF3ckxJWjVhc2pDSUJLelNuOWIvVmFs?=
 =?iso-2022-jp?B?OGsxTDB0U3JIK2tDcFowc0NBbzkyNUtHSktTYmhXQ28rTlpvQUJrWmEz?=
 =?iso-2022-jp?B?aDl3RjFVOUE2Yjd1VHJIK3Byc28wNmRsM01zalBxZE9Xa0dBMllOcmsy?=
 =?iso-2022-jp?B?N0ZVYzJYR01ZKzhmQzUrNVVvdWt5dmZRR2tLa0NoK3QvSFJ1eVBjQ1ZQ?=
 =?iso-2022-jp?B?RHlVTy83eFhHRHVXaXlCUlFJdE53SktES09NYlMwazBhcWZFUUVmTGpx?=
 =?iso-2022-jp?B?QnF1TmkwbmJXWVJHbjA2c2JGamJsQkJtR2JKRXNnUlF5NUNNRXBDc2Vj?=
 =?iso-2022-jp?B?bEc1Y0h3M2R6UUhxSHpkc201QjNuVjdsTTJmbW5NZnB2b1NsbTJRNFZn?=
 =?iso-2022-jp?B?T29QZG9YUHdhVWl6eHNROHJwTU9tSUZoTml2cjRVTHdqSURWem9FdXBP?=
 =?iso-2022-jp?B?VU5VakVrWnBETWFvaHo0TkVTN0pPbVlWbXpPNUx5TURIL3U4bGlFNno5?=
 =?iso-2022-jp?B?b0RmL3dzc3JtWmZBUnVTQUlna2Zwc05kelhCNjNUTGRBNFdDbnQ3QVd1?=
 =?iso-2022-jp?B?dE4zOVNBMGdyMnp3MFJXckk3VW4wdkZCR2x0cFRXdksvcjR2VmkrdlVD?=
 =?iso-2022-jp?B?U1phSUNzakRDNi95R0V3Mnpzd0J1MmxzdTI0MTk2eGVHRHYvREZsOHRy?=
 =?iso-2022-jp?B?bml4Zi9LQ2h6cGFNUHc0TlNWQVdDaC9RYVdhem41bG5Ha2JsL2kzbW9Y?=
 =?iso-2022-jp?B?Z3RjMHFuNHNUYWYrSW1uSU5BSDRRUndpSW9kVkNPQ1RiaVE5dFYzS1RB?=
 =?iso-2022-jp?B?Q1FJaG4vOVE3MURTQUhUMjdYSUNjWkJocDdWSHN0cjhzL1k3N0hKS3hn?=
 =?iso-2022-jp?B?MzRXOU82WThFcmxHTVhOdjdITUx1MXlrZnhneTUrbXRSQlF4d1RpSHA3?=
 =?iso-2022-jp?B?ZjJVZ0pPWngxTGpUOTV0d3dyWDk1MjNJN242TzJFWXpsNk9xcmU5dmFq?=
 =?iso-2022-jp?B?U09Nc3dkSkxhbm10ZGpCbk9rdXpBMlc2eFUrQjZESmxkTlZzWGFuQVhk?=
 =?iso-2022-jp?B?dWZBeXN2Z292K2crRFljeFFaN1JadjBQaHpEYmJJcGVTRFBoMlovdHF5?=
 =?iso-2022-jp?B?bHA5ckx4QUhjZE51MlU2dU9OSEE1bXNQaXFSd3hrUVRjSkNvaS9DZjZ2?=
 =?iso-2022-jp?B?U1JLcDJhUXBtSWE1RDE2N21tdTRVdDlZMmhUTmZvd1BVWmpLdS9RQ3No?=
 =?iso-2022-jp?B?RnlqeVRNMFlOWnhaMVp5RUhJVEJKbTVRSTZBZEZQVlZGWmtuSlVxR3d6?=
 =?iso-2022-jp?B?U1crcDJKN0RyVWQ2SzVsWVJVNis5MFpRTjJxbTBRVHgwdXBMWHFIY1dF?=
 =?iso-2022-jp?B?cGlDL1RBY2t1Wm5SOGh4Rk5uWjFXTGpRTzdCLzEyS1NBYkNjZnZWV0ty?=
 =?iso-2022-jp?B?OXlLMWpvT2ZjV01LNkkyMmdUdi9MNkR6WnV6dkw5ZTZ0S3NGSktkWTNK?=
 =?iso-2022-jp?B?TmZpVTdnMmJjVlVwWWR1eGU5K3dtQittT3pDNytNR2ptUzk0bGw4MWpa?=
 =?iso-2022-jp?B?WHBVRngxOGpXcUFlbVgyKzFBUXV3RlpQU0lWUkxzMVpNMks0Y0hYQmlD?=
 =?iso-2022-jp?B?YTl2Y1hTcE0xcVg1dlMyVVVMVHhSV0YwTEVlT3I3T0xJN2Y3cEVMbmF5?=
 =?iso-2022-jp?B?L0dubkdOMXpSK3cvNEZ5cS91NkJCM3hvb0EwUVJXSFhRRUpSeFdjZ25W?=
 =?iso-2022-jp?B?ZThzZWlla2FWOTRoTGgxcGR3aHFKcUZzUlE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6116491f-8157-4681-0cf8-08d9d4e4a0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 09:27:46.3820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l2QgDwF74nKIOnPxb8W5Bn1gh7HxBWih7uQgbsN3rzAWCgqGZGaK6KVum8+Xz3eLGBilsLSRDNLGjlaId2JSJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8887
Received-SPF: pass client-ip=183.79.94.94; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob07.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Akira Oiwa <aoiwa@yahoo-corp.jp>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Thu, Jan 06, 2022 at 05:20:57PM +0900, Hiroki Narukawa wrote:
>=20
> Phil, thanks for notifying me.
>=20
> > Coroutine pool size was 64 from long ago, and the basis was organized i=
n the commit message in c740ad92.
> >=20
> > At that time, virtio-blk queue-size and num-queue were not configuable,=
 and equivalent values were 128 and 1.
> >=20
> > Coroutine pool size 64 was fine then.
> >=20
> > Later queue-size and num-queue got configuable, and default values were=
 increased.
> >=20
> > Coroutine pool with size 64 exhausts frequently with random disk IO in =
new size, and slows down.
> >=20
> > This commit adjusts coroutine pool size adaptively with new values.
> >=20
> > This commit adds 64 by default, but now coroutine is not only for=20
> > block devices,
> >=20
> > and is not too much burdon comparing with new default.
> >=20
> > pool size of 128 * vCPUs.
> >=20
> > Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> > ---
> >  hw/block/virtio-blk.c    |  3 +++
> >  include/qemu/coroutine.h |  5 +++++
> >  util/qemu-coroutine.c    | 15 +++++++++++----
> >  3 files changed, 19 insertions(+), 4 deletions(-)
>=20
> Have you measured with QEMU 6.1 or later? Commit
> d7ddd0a1618a75b31dc308bb37365ce1da972154 ("linux-aio: limit the batch siz=
e using `aio-max-batch` parameter") can hide this issue so it may not be ap=
parent in recent QEMU releases.
>=20
> I like your approach better than what I tried recently (I ended up droppi=
ng the patch from my queue because it doesn't handle coroutines created in =
one thread and terminated in another thread correctly):
> https://patchew.org/QEMU/20210913153524.1190696-1-stefanha@redhat.com/

Yes, I measured with both QEMU-6.0 and QEMU-6.2, and both were affected by =
coroutine pool size. Two versions did not have so much difference in my mea=
surement.

>=20
> >=20
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c index=20
> > f139cd7cc9..726dbe14de 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -32,6 +32,7 @@
> >  #include "hw/virtio/virtio-bus.h"
> >  #include "migration/qemu-file-types.h"
> >  #include "hw/virtio/virtio-access.h"
> > +#include "qemu/coroutine.h"
> > =20
> >  /* Config size before the discard support (hide associated config=20
> > fields) */  #define VIRTIO_BLK_CFG_SIZE offsetof(struct=20
> > virtio_blk_config, \ @@ -1222,6 +1223,8 @@ static void virtio_blk_devic=
e_realize(DeviceState *dev, Error **errp)
> >      for (i =3D 0; i < conf->num_queues; i++) {
> >          virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_out=
put);
> >      }
> > +    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->q=
ueue_size
> > +                                            / 2);
>=20
> This over-provisions coroutine pools when IOThreads are configured, becau=
se --device virtio-blk-pci,iothread=3Diothread2 will only submit I/O reques=
ts in iothread2, for example. Other threads don't need to increase their li=
mit.
>=20
> However, I think it's okay to use this inexact approach. It's still bette=
r than the current hardcoded 64 coroutine pool size.
>=20

Thank you for pointing out, Considering your comment, it seems to be better=
 if pool_batch_size may be thread local variable.
But I couldn't find a way to initialize pool size from the same thread of c=
aller.

> >      virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
> >      if (err !=3D NULL) {
> >          error_propagate(errp, err);
> > diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h index=
=20
> > 4829ff373d..e52ed76ab2 100644
> > --- a/include/qemu/coroutine.h
> > +++ b/include/qemu/coroutine.h
> > @@ -331,6 +331,11 @@ void qemu_co_sleep_wake(QemuCoSleep *w);
> >   */
> >  void coroutine_fn yield_until_fd_readable(int fd);
> > =20
> > +/**
> > + * Increase coroutine pool size
> > + */
> > +void qemu_coroutine_increase_pool_batch_size(unsigned int=20
> > +additional_pool_size);
> > +
> >  #include "qemu/lockable.h"
> > =20
> >  #endif /* QEMU_COROUTINE_H */
> > diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c index=20
> > 38fb6d3084..080a1e0126 100644
> > --- a/util/qemu-coroutine.c
> > +++ b/util/qemu-coroutine.c
> > @@ -20,12 +20,14 @@
> >  #include "qemu/coroutine_int.h"
> >  #include "block/aio.h"
> > =20
> > +/** Initial batch size is 64, and is increased on demand */
> >  enum {
> > -    POOL_BATCH_SIZE =3D 64,
> > +    POOL_INITIAL_BATCH_SIZE =3D 64,
> >  };
> > =20
> >  /** Free list to speed up creation */  static QSLIST_HEAD(,=20
> > Coroutine) release_pool =3D QSLIST_HEAD_INITIALIZER(pool);
> > +static unsigned int pool_batch_size =3D POOL_INITIAL_BATCH_SIZE;
> >  static unsigned int release_pool_size;  static __thread QSLIST_HEAD(,=
=20
> > Coroutine) alloc_pool =3D QSLIST_HEAD_INITIALIZER(pool);  static=20
> > __thread unsigned int alloc_pool_size; @@ -49,7 +51,7 @@ Coroutine=20
> > *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
> >      if (CONFIG_COROUTINE_POOL) {
> >          co =3D QSLIST_FIRST(&alloc_pool);
> >          if (!co) {
> > -            if (release_pool_size > POOL_BATCH_SIZE) {
> > +            if (release_pool_size > pool_batch_size) {
> >                  /* Slow path; a good place to register the destructor,=
 too.  */
> >                  if (!coroutine_pool_cleanup_notifier.notify) {
> >                      coroutine_pool_cleanup_notifier.notify =3D=20
> > coroutine_pool_cleanup; @@ -86,12 +88,12 @@ static void coroutine_delet=
e(Coroutine *co)
> >      co->caller =3D NULL;
> > =20
> >      if (CONFIG_COROUTINE_POOL) {
> > -        if (release_pool_size < POOL_BATCH_SIZE * 2) {
> > +        if (release_pool_size < pool_batch_size * 2) {
> >              QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
> >              qatomic_inc(&release_pool_size);
> >              return;
> >          }
> > -        if (alloc_pool_size < POOL_BATCH_SIZE) {
> > +        if (alloc_pool_size < pool_batch_size) {
> >              QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
> >              alloc_pool_size++;
> >              return;
> > @@ -202,3 +204,8 @@ AioContext *coroutine_fn=20
> > qemu_coroutine_get_aio_context(Coroutine *co)  {
> >      return co->ctx;
> >  }
> > +
> > +void qemu_coroutine_increase_pool_batch_size(unsigned int=20
> > +additional_pool_size) {
> > +    qatomic_add(&pool_batch_size, additional_pool_size);
>=20
> If atomic_add() is used to modify pool_batch_size then qatomic_read() sho=
uld be used for loads. At a minimum it serves as documentation that this is=
 an atomic variable.
>

Fixed this in patch v2 and resent it.

