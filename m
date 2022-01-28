Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0CE49F5C2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:57:35 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDN4Y-0003pN-Pq
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nDMxY-0007c9-Kx; Fri, 28 Jan 2022 03:50:28 -0500
Received: from corp-ob08.yahoo-corp.jp ([183.79.94.93]:49130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nDMxT-0001Lx-RV; Fri, 28 Jan 2022 03:50:19 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01lp2113.outbound.protection.outlook.com [104.47.23.113])
 by corp-ob08.yahoo-corp.jp (Postfix) with ESMTPS id 0655619FB185;
 Fri, 28 Jan 2022 17:50:10 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1643359810;
 bh=HZhOKFHWMqGSU7NiDWl8x5qKRO/wvSGfoerVZdxQlxs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=ciuU3kp1yFIjoelQ33n0MRzOxyQ9vnthbpVJpHMxa+bNRbsrKwI5Y8jpvWO4FXPKh
 mY3zPnw43Fme/S+cqP527+LIvd6Ta/UgXH0wSYElVpJlGNoQJK0Cl8+pPebvpAoTFj
 4ul1+cp6zNLkZr1gSAm0RDdIX+aXldpEKQjFhqik=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+4Lar67ThLuvzbwsm4Q7nYKWCpQYVzJGIYVlP8BfEIxU0dzRBedm1W1DlCp0W2NjvuyaTyAL6SKdO4jp1AQOOyLTdif7eR3hXwIz7jUB38yM9zH9pZIDjSAG12Zw2jblNBe6ZJuTvS++eppUhYvw4KBM0gA0cg4v56QdjLSaAmqxx5pHlMpJzOWL+SRfGlim7am8uh2/ufWCLAWngsX/y4uJY1nQ3tLEaLU3ZbjqPHgd61BMz6thCyFiV0IjRIf8q/RV7P1qRsZvfCVn2Kmo3m7UsesF5IdGduTVzIDohO7uZBa4ImqJNBS8sxPK2FRGHAoLnUE50MPWtSmD9C2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZhOKFHWMqGSU7NiDWl8x5qKRO/wvSGfoerVZdxQlxs=;
 b=mNzELdrcPQ5I+/jDiTzwlctt1iC91zUOB/d7tvEPGj5LuHKDg2tIkIIHzGoZFmHj4z3SJMCBQvgW4/9zWAB0yVaiqr7fSJ+DBWkMZg4SCxUuqFExlk6vAuxW8w/WTeTFpZ7KdaqPJNnjdZt77JZNVJ7AilO1uWu5SGuNoO5GlM7Epbzr/TdHkyr++QAEcMEcWjt2AYR0SAakI0Dpke23I3DvjeQr5dIJUr1d7vi5Zzt9AIxP70tWk2Vfs2/quovzjOXcxnnv46cH/0u/hQgb1ZGfBaENytcqPf1iomAZLdCWZNpONSWafUltfcWtuQztJhUnimBoE2u1vdReIYMXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZhOKFHWMqGSU7NiDWl8x5qKRO/wvSGfoerVZdxQlxs=;
 b=EM5QGRNpE/Gt9vkApXjdlfP49hUzRdF4ke1rAez2KkzgnDy36BO6tThAXPs9EEsAqaR05BTbXluwd95jo7D/pINnv42OmSwEqQA6n00909G3Ql1vnJEGjoJt8YPo7VkOdC6eWtzuK/iLph11leRMEcBDKEppqpDH9zgYb8PeY1Y=
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by OS3PR01MB8764.jpnprd01.prod.outlook.com (2603:1096:604:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 08:50:09 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%4]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 08:50:09 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Thread-Topic: [PATCH 1/1] util: adjust coroutine pool size to virtio block
 queue
Thread-Index: AQHYBsx7+CwKCLB/iUm0fqtJvYL4lKx3HMYAgAEZ92A=
Date: Fri, 28 Jan 2022 08:50:09 +0000
Message-ID: <TYCPR01MB835719101CC22DA327DEDF1280229@TYCPR01MB8357.jpnprd01.prod.outlook.com>
References: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
 <20220111091950.840-2-hnarukaw@yahoo-corp.jp>
 <YfK+kLyUuy245klR@stefanha-x1.localdomain>
In-Reply-To: <YfK+kLyUuy245klR@stefanha-x1.localdomain>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5dd6f13-bc0b-4fe0-fb8a-08d9e23b305e
x-ms-traffictypediagnostic: OS3PR01MB8764:EE_
x-microsoft-antispam-prvs: <OS3PR01MB8764069B9D2B027802CA64ED80229@OS3PR01MB8764.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kzDbxSA8ANPd+clZqTcGRrJ2iUKB3u7pURmP+hh4sX9kp9eocf7OEnP0wdAd+LQLaAavLEx8YjYh68TgqmRQ6D3BVP0kORFkD/WK4nK2v+Xr1FL8iz3aRAgc2P+7EsV4kJT0L8XSFq2AgiBSdafcf4906/kmdzPkIz6dsafGRQkyurOp5ZWR3vVv+zxERiE/4nh8XRN7mY1cApHkLTalIcMBN7fTFInnGDQTlzvs4THYKarR0XDGzhW9t10mkmigFavqyzAHU05Y4lwiAGNKrfVo+dgfFPuIXkegx0oMK1NW8E6thkAl2S2ijqUaUG4PxxNfQllvaGRG0wZJVQUkXRaPe7e7gc110su62YIF3kJvUdZJuOxtyBg1OBcDaooZOEEfQR/6+rakJ+0ydeIarDRN4KqlhbFxU2o7SoPc+oz6zdGjTSsGSrwMaet411lTSmlYcVyFaiHt1lddNJ1URlinM+KxS8XYFZvLOMl98XonxiS1eFQ8rpy4Iek4b+HtGEdAxpsL3sMtD+iYWeiTXom2NSt4hraOfBhDTSsq0p1rCMHjOO3dtXXFt5I5VuuBpe116AStqhNllY6J41BhZOYrV3C6Bz4fLjhTNgr41GwLyNE9SRh+kWKm3m7Jh7QKDbOgLt28z+2+Fqz1oboUphe92G4fHY0ue6xtEE/tWgXe7Dyn75MwLPDsH/6Xb3Y99pT6XMNcbAtJ07PVcGGMrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(83380400001)(52536014)(38070700005)(86362001)(71200400001)(55016003)(6506007)(38100700002)(7696005)(6916009)(2906002)(85182001)(5660300002)(186003)(66446008)(316002)(122000001)(66476007)(9686003)(508600001)(8936002)(8676002)(4326008)(82960400001)(33656002)(66946007)(26005)(64756008)(107886003)(76116006)(66556008)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?NjdMc281b3AxaEhWRmpaYUFmRkpMTzFVWVNBbEZNNXFDUkVEaHM5UDFK?=
 =?iso-2022-jp?B?Q2wyZ3RUT2FpNHU0VmJGT1NWYnFRdVVaZFBmZVZBY1Q4VHRDeGE1RDBp?=
 =?iso-2022-jp?B?UXhXT1doM2s5SWpjY2N4N1A5YTRJMW1iR0JWTk9tcUk4UDdRZGxOalNJ?=
 =?iso-2022-jp?B?NFVRYUloZjFiM2dJdEF6SHFQbEk5YlZPVmpxYmRJMVdzZENpcWE2YmRU?=
 =?iso-2022-jp?B?TE9IZllRRzNWVndoWnYwUnFJTE42cGphQXJ2MEd0dS9ydDhOOXh0T0Qz?=
 =?iso-2022-jp?B?WW81OC9qdlJKeE1sbDB1bWYyRUV3Q0NYbHBqK21GQzBwaVVHZThMR1Yz?=
 =?iso-2022-jp?B?WHBtQ1l2eVZML2x4QXhRVEsweDhFVjdWSit5WUxJMVhwZGZxYnRzYVZE?=
 =?iso-2022-jp?B?REZRTXZRZmhwUlV4ZXUxYys1d0V1SDk3akI3c3o2MWxmUlI0bitiTkpI?=
 =?iso-2022-jp?B?T0NDUlIybUExdmVLcGtWSUlqUGx6MGJLU0xOOG1tQnhRUmhSSkF3MTRj?=
 =?iso-2022-jp?B?UktWSDZkekhQMEYycHhSWkFZdkNLdUVYYllkVWZuOEpJSGE2Mmp5UXIy?=
 =?iso-2022-jp?B?WFFjMWhFWGhyZVhUVFA2dmd2UHhXM3NLRFNCay9qYnd1YmdRYk5raWd5?=
 =?iso-2022-jp?B?YjRUU0F0TEh1clcwNVZHR0NHT0hOY29uV0M1RWIyWmlTbFRhWjFPMy9u?=
 =?iso-2022-jp?B?dmw2T2JBQUVPajZCL3FYc21uNlhOS0xrTnRQOU11SFA2cjgra0I1cUtj?=
 =?iso-2022-jp?B?ZFA4ckhwTWhOZlVzWXYrd1dSK0hBYXNzQ00rK0ZXTmV3RW1scHVnOWFp?=
 =?iso-2022-jp?B?VS9DcGt5NTN3dHdHSWR0RG44TkdXT0F1Y3hRZmhqbG1NWmRNMXc5Wmps?=
 =?iso-2022-jp?B?a0FmaDlnMEd6UGVTd0pveDBVZEdzWHpUUjk1dmlCcTljaDZRVlF0cll3?=
 =?iso-2022-jp?B?a2NmaDBMTGRnUE1vVEtCQzlRRm5rK1p6c3ZrYzM3MDVGak5aMUtOM0li?=
 =?iso-2022-jp?B?ZnkwS2g4MWFOeVZWd0dMWlpCa0JHWVJlRmdVZFJ2UkxhZG9iYi8yd0NG?=
 =?iso-2022-jp?B?Nk1OZG1JY01vNUNMMTNSR0RaMjdmTTgzbGhtUGNKWW5wcDVmU2ttK2lr?=
 =?iso-2022-jp?B?eHhlTmxrakVqcDdpMC9CNEc4VHdzUGFqTDBIekFlUjlyOEQzYnU4Q0Qr?=
 =?iso-2022-jp?B?VHhRbXVpejNJNi9odXBwWnFKMUdLOEdDU01FODJtamVjSkdndFAzdVdM?=
 =?iso-2022-jp?B?a1plNE56cGNSM2lEUm5iTnNwTDM5MzltamN1cFpSNWxYRDhOZkY5K0Vu?=
 =?iso-2022-jp?B?NHNxSEtCVCtRWGV3MGRLU3VzNFcrTkU3TU5sakhySytXWFdXL2dmL0Uz?=
 =?iso-2022-jp?B?NFhUQU9adGxBamZtRWlOdjZqMGF1OVFLVkV6NmFPdzZpTFpQQmVWaVk2?=
 =?iso-2022-jp?B?UlBXRU5NMWgyc2J1SVRKVFlMQ0tyRmJQOWFOWCt1Zy92YXF3RTF2R3hY?=
 =?iso-2022-jp?B?RU82eE11M2RnZlZKdFZsK3ZKOHB1L21jRDlWTS8yL1RKMVlYLzhOUzRh?=
 =?iso-2022-jp?B?K1JleUdVSHV2ejByVEdrSE12THhDeXpEMDVQQ2dMa0Y3Y2M2MHMzcW1a?=
 =?iso-2022-jp?B?eGo0d1RtRXE5UFVmUUVLWElQWTdQVlBVTkZIWFRYVU44UUhLR3dGbHJh?=
 =?iso-2022-jp?B?R05pWnVWdHlPL2NSKzVzaWlSYzR5OVQrUU5pRytZa2lIRzdtR2hQWVRG?=
 =?iso-2022-jp?B?NmppaDM3Rm4vUlk3WlgyWFRBRHRqZURzL2EzeTFnZ3FydEhPRFFIb3kz?=
 =?iso-2022-jp?B?Z01zRDV0enhrOW5aSVRqQTRGOEY2a1NpTnNGYlA4U3hlUnZjSTJjL3E2?=
 =?iso-2022-jp?B?NXZ0L0NIRFRwcEFSNU9Qbjk4OFg1TFBGVGJZV2NzS2RLeFVIcGlFclFa?=
 =?iso-2022-jp?B?MEZhOTNPajgyUkxnSTh1ZVJ5R043bmoveGFtc0s5dEFxNXlSdk1GbDd1?=
 =?iso-2022-jp?B?UW5UVk0xZlRRRnVhbVF2MXdwNzRRVHRyYkFoSFptSXltd0JSYSs4WGNH?=
 =?iso-2022-jp?B?Znplbmt3ZDh0TVFFdU1Rd2dHL1Y0OHhuR0padTlLNVpUK1JEZ3oxVDAw?=
 =?iso-2022-jp?B?d01jQ3dNRlcyVkxreWtoOFlTamtFU2hoL0VTcTNMRzNyaU9PTk9JdlYw?=
 =?iso-2022-jp?B?ODhqeTZoNWdFZUZjdklCdGllVjJ4L0lqNXh6SzVEeW1SMkFDLzZzZ0xJ?=
 =?iso-2022-jp?B?eTc3UzZQeDdoamw0aGxUTnZjeWd1bW92NVAyMkluR2YyNDNob1c5STJY?=
 =?iso-2022-jp?B?cTI0ajN3M1dGaXV3SjAySytoUEIzY0pTanc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dd6f13-bc0b-4fe0-fb8a-08d9e23b305e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 08:50:09.1490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4o7dZtf8gOg33rVpqZAWfd4s3WRmmRqUozi66iESuS0cQ2f2uUucRjRYm2EWe2SgpHtZ1Loj9hwc6z7H699jAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8764
Received-SPF: pass client-ip=183.79.94.93; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob08.yahoo-corp.jp
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, Akira Oiwa <aoiwa@yahoo-corp.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >  /* Config size before the discard support (hide associated config
> > fields) */  #define VIRTIO_BLK_CFG_SIZE offsetof(struct
> > virtio_blk_config, \ @@ -1222,6 +1223,8 @@ static void
> virtio_blk_device_realize(DeviceState *dev, Error **errp)
> >      for (i =3D 0; i < conf->num_queues; i++) {
> >          virtio_add_queue(vdev, conf->queue_size,
> virtio_blk_handle_output);
> >      }
> > +    qemu_coroutine_increase_pool_batch_size(conf->num_queues *
> conf->queue_size
> > +                                            / 2);
>=20
> Why "/ 2"?

In my understanding, a request on virtio-blk consumes 2 entries each for rx=
 and tx,
so there can be num_queues * queue_size / 2 requests running at the same ti=
me.

Start point of this was that coroutine pool size was 64, queue_size equival=
ent size was 128,
and num_queue equivalent size was 1 from long ago and seems to work well.
New value num_queues * queue_size / 2 also seems to work well as more overp=
rovisioned value.


>=20
> >      virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
> >      if (err !=3D NULL) {
> >          error_propagate(errp, err);
>=20
> Please handle hot unplug (->unrealize()) so the coroutine pool shrinks do=
wn
> again when virtio-blk devices are removed.
>=20

Added it in v3 and resent it.


> My main concern is memory footprint. A burst of I/O can create many corou=
tines
> and they might never be used again. But I think we can deal with that usi=
ng a timer
> in a separate future patch (if necessary).

In my understanding coroutine pool size does not limit the peak memory cons=
umption,
so I think even when coroutines are temporarily released, it is a room requ=
ired for
qemu to keep running with accessing disk IO, which I think users does not i=
magine to be memory-consuming task.

Timer to release unused memory would be nice, but how serious is it?

