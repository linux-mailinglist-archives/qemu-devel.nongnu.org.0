Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFA36DED6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:11:51 +0200 (CEST)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbof8-0002Hi-F9
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbocM-0001m7-Jr; Wed, 28 Apr 2021 14:08:58 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:48232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbocI-0000mM-SP; Wed, 28 Apr 2021 14:08:58 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SI276n022885; Wed, 28 Apr 2021 11:08:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=nQIheyiek2D3747vR+GWVu7KXja7Hc2eKGK/ZiJWKs0=;
 b=qrNcFKg97VJjv/ATYk3KnB1kFZq8Z/ixoxl9EJsg5DPle1BQOF9psijrRo/is3RLaVFl
 etZ7a/HM1IbYjr9xkRxDOHDKDwJ5U851R4NvYgQGn072YUD9Aa8JH/WQ9t0LXmNk3LLb
 5W5wKewV/Fk5mmUhobcO4xmtKxYy9x2sfZeQazLko9vsLKz58Bh6hn755XfBxgugh56Y
 n4Dq9MsgUCqrxoi2NWaSFoqxYBdjA3b2rxVlHscB45fIVqDw3pubsZgUD1i5SW4bJRpS
 ISSIeeuti7qJxFQZwkpmlU+5OVcsM5Lfu+5rAgTmzMVO4G54cCyTGC0HtEkPuA64Aqtj Mg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0b-002c1b01.pphosted.com with ESMTP id 386wwhstgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 11:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajEKrpMem6b3Mf59ar+cNE0M3x4PwUDvIy/5mY455h6lOu2l9ImjWiQ3O2eg13Q3DrErjrIzROfSKpcQA8zrkb2A5DKktQEKYKZd1Ln3p7LkzKJWD6MXyPV6aduMv0eWxeGtDm0BCKlVivHorEYKXPQgj4prWBYsLOnZl0ssXzcBRoHFpEvkq8X96mPBeRei07JUt71K/PV9LBm2uWIH1FPSSpmuDEKXcLxGTXBdlyvQh8KjxO8K7N6HANXf391VyxxTfa0TirlaUrJPBxc74FxEv3NtM0cDyEszsx0D2P5vsKTgtrssNTkPqGRcPQapFjV+pYvk2506kLhNfQwzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQIheyiek2D3747vR+GWVu7KXja7Hc2eKGK/ZiJWKs0=;
 b=ADGmHIw4qU47UrqCM7fW7IUviu3NnpdBEPBTUESuYus3VzUbvmdYednQoqIwPI7BRCf6UlFRcqjIT7bd07aB/S/MP04Ju8NrkSLua6N+t8Tzy73TfiUMYbMmctRu3a+FLDAoNbkyZrmtSlk6N6Wf8DlMD96rMngEQ8L85MmPKrbg96TOGDFD6YT2qq9vFXXrhg7gpZS7Z+OxIipLqiNUjIChO4nQGke4FdC/tk91gVSnpG5aJvPIwgCqpttIrXo+lZg24QHyw4u7B2CnpxtxcTWrQc4aitpnik13+JqMsUImwMzErhY02UZ3gG+ztNCYNsdz2takVwAmbpZlU2kjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA2PR02MB7563.namprd02.prod.outlook.com (2603:10b6:806:14d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 28 Apr
 2021 18:08:48 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 18:08:48 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/5] vhost-user-blk: Use Error more consistently
Thread-Topic: [PATCH 2/5] vhost-user-blk: Use Error more consistently
Thread-Index: AQHXN5lWjexo/QtqaEeqjWt7dSOnyKrKQ96A
Date: Wed, 28 Apr 2021 18:08:48 +0000
Message-ID: <20210428180847.GB20148@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-3-kwolf@redhat.com>
In-Reply-To: <20210422170221.285006-3-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fef4831b-a9f1-4dc8-344f-08d90a70abca
x-ms-traffictypediagnostic: SA2PR02MB7563:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB756387485E8B5EBD51DF72CCEA409@SA2PR02MB7563.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:261;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eWPr6ecfUUa3i91n+eGZoHcoqvkjsusk5GsF/VeLtm2ZQe2nTOaLONHTYUf/enjKsOy4GOuoYzwy1AHzJjjCEV0ph1MefQH6KUi97fmZBsxEadWJMUWhDCDijT8qd8KxX9DytoaT9EkfxM5yxDG8NkMAGc1HoZsWtvi3yUPB5uCUcKLIkSEPKrV0oL8CJJAyYGLuB/MypJiFbe+uzcPVTvK8ijqyHdVbqSbwB14l78jRWg7A2DBMFSRc21G7UOJ/WeQI1azMVtbf6PZxyKKHmg/qkrtzbd2kJZwWfpGW5bxJMBk6pOMZDmALCdf8Ogxiz2Jhpi76agGmhTuz66sSEvnug2/5dhEJdEq0+yNaQFwWKunqCosy8GbezeCvIDlxcF6DuTTjZA791XIxedzGkyeh7FAoCrhzscrN2vxCvuTMzrrCZvzEQpBS4llxFXz+rEoBoBNg1GV6Z9ZSo8keAl/DVphKXmgitu/VTrMmPAEUdTLIWo3QL9yOIvzg2KGln/mmwn7d7A7xe7Sww1ZrK1CwvPZUFmwgTocpHrafTkbTuAnKKmAVv25YfqruZjEK3sQtM/mZ08B/SR4KX0pqKKZuF+vpFtg7VZ54S0NUzcU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(33656002)(83380400001)(86362001)(44832011)(478600001)(33716001)(1076003)(71200400001)(8936002)(38100700002)(122000001)(6916009)(26005)(8676002)(186003)(6506007)(5660300002)(4326008)(316002)(66476007)(6486002)(66446008)(64756008)(66556008)(2906002)(91956017)(66946007)(76116006)(54906003)(6512007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5kc6F/LwlgOEjlHP/OI4EfJuzvJYiISEkVCYaf++Eycwc2D5qZcvw51+QQyv?=
 =?us-ascii?Q?tNslD5ChKNuqwL16lOKQg8UhOqWORigoBk4NjO/8nf91QqxSfO6kYuDjN12T?=
 =?us-ascii?Q?8P5JAbnFmGww2vfKWCIkjh7NEF4Rlw1CJA7S2d2P17IZTrPFot6uM2jKi2o4?=
 =?us-ascii?Q?v99dXHSe6XUrf2yDXjlJ2ynugAxEVogvNaqy8h2GMd/5pDDO9gWs7a34myYX?=
 =?us-ascii?Q?IOxafndM9qe/8eesyzmLklimgOpaC9t2c2yEGV11SkvDZGNGhzQnuFpFQDWi?=
 =?us-ascii?Q?PW/4Xd3nh7G1vEuGpvn9zjBD8YFp78Dga8uFG249/FA1LSCQbb+d/85eV4+e?=
 =?us-ascii?Q?w/KdKXk164BMg+EsfU+pt/ch/02KKN+Ee7ys8eQWObo9e1hbuihJSW0wmdzM?=
 =?us-ascii?Q?ocKiyWDciv8Ln6hK/4Y8MCot3Ye3PhWyWzTC923UgtsU8X20TDEn9BMHMrkn?=
 =?us-ascii?Q?fvrjkPlvxCOncAoT+5kEqHJsuBev/ihxgk38/Cwu7q8VAM5bovVWsYIetow8?=
 =?us-ascii?Q?4UJYZTf2lqeHcvvCmGAxEgpUKCOQj4pnb+Hph6Bv2FXvmrmr+oi6RHqyDIH9?=
 =?us-ascii?Q?87Sxe/NJ8dtemlb58e2HgjZuhMTD5IWwfXbXatQfAlR75Lf/nc6KQNHzy23S?=
 =?us-ascii?Q?lHNNZ7J/ND+dZyMujAOrdtIzZS8swdPXye7aGqePExr754ncdLJkXVFGlrgo?=
 =?us-ascii?Q?NyjXZ+eDM6vhhFLOgAoS3AvYalJOHFfYvB2NiK6nvoAfP5JRDyv/TeoJodxm?=
 =?us-ascii?Q?n5UyzHr5N7JZpccGrNzUlRdVaJ7U6vXHwmqx8gAQ46Z365Ft8SWnvWRdHhE0?=
 =?us-ascii?Q?rYbtYf18Fso7jyd48kUySF4MLBzeJutE5Sw7HPG4S91pnL3EZSZSZotbJnvP?=
 =?us-ascii?Q?ks0M+um8CFa90AJ0jw4k7aTefBOBwGWW9zaziIHOXXdzAwAuB2N3qmSRUPNQ?=
 =?us-ascii?Q?I3cXAT8z8pGgKzzqnzQHwu92WdlZcXym2QrbH3oUfOyPhpQ6M2c/Rmbk4nmp?=
 =?us-ascii?Q?W32aeaFZymmUk4bhprNW9Tl3yH4gRvmPcWk02mMqQCoxsw13PxzmoqAuJlP6?=
 =?us-ascii?Q?BR6x0gYk+Kq0VijJg3BKPxAxJVcl7zxX9483vaEFBzGEgzTmpC8vfxkD3lku?=
 =?us-ascii?Q?5fcYTwxEeVzJ5jBD/A0uI/INJ1lb5Z0cxan7WbFcb3q8glRL+e5WKIs3EWsm?=
 =?us-ascii?Q?ECuqpnlauIT3gSaa7XjixbWbh5vGICcDcGuUEeIqqLavE/nFynzpz0BqgEdB?=
 =?us-ascii?Q?kkECyjVB888Nq643yo38hQn6mz527m8VKg7Z36umq++Y/ebiWhMgFcMrGlfo?=
 =?us-ascii?Q?r+F9Pr/xRAoIgZCNPNoHR7kY?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D3548B2208EC44CA5C37F98CA54502A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef4831b-a9f1-4dc8-344f-08d90a70abca
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 18:08:48.3027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDHJNQ15PBhM6L3N8VbfeTDIa5lfkh+6B8CqTnW7PotAaImotbAFNMOFsnR1sQulonOFNJgT2YZ0tMG0XS6JtSwI0xUmQEr/llbVcZquwPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7563
X-Proofpoint-ORIG-GUID: EIZFzBUukL2D1BnLbdYal8fUncCTdO9o
X-Proofpoint-GUID: EIZFzBUukL2D1BnLbdYal8fUncCTdO9o
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_10:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code looks ok - question about the commit message.

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Thu, Apr 22, 2021 at 07:02:18PM +0200, Kevin Wolf wrote:
> Now that vhost_user_blk_connect() is not called from an event handler
> any more, but directly from vhost_user_blk_device_realize(), we don't
> have to resort to error_report() any more, but can use Error again.

vhost_user_blk_connect() is still called by vhost_user_blk_event() which
is registered as an event handler. I don't understand your point around
us having had to use error_report() before, but not anymore. Can you
clarify?

>=20
> With Error, the callers are responsible for adding context if necessary
> (such as the "-device" option the error refers to). Additional prefixes
> are redundant and better omitted.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index e824b0a759..8422a29470 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -311,7 +311,7 @@ static void vhost_user_blk_reset(VirtIODevice *vdev)
>      vhost_dev_free_inflight(s->inflight);
>  }
> =20
> -static int vhost_user_blk_connect(DeviceState *dev)
> +static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> @@ -331,8 +331,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
> =20
>      ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0);
>      if (ret < 0) {
> -        error_report("vhost-user-blk: vhost initialization failed: %s",
> -                     strerror(-ret));
> +        error_setg_errno(errp, -ret, "vhost initialization failed");
>          return ret;
>      }
> =20
> @@ -340,8 +339,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
>      if (virtio_device_started(vdev, vdev->status)) {
>          ret =3D vhost_user_blk_start(vdev);
>          if (ret < 0) {
> -            error_report("vhost-user-blk: vhost start failed: %s",
> -                         strerror(-ret));
> +            error_setg_errno(errp, -ret, "vhost start failed");
>              return ret;
>          }
>      }
> @@ -380,10 +378,12 @@ static void vhost_user_blk_event(void *opaque, QEMU=
ChrEvent event)
>      DeviceState *dev =3D opaque;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    Error *local_err =3D NULL;
> =20
>      switch (event) {
>      case CHR_EVENT_OPENED:
> -        if (vhost_user_blk_connect(dev) < 0) {
> +        if (vhost_user_blk_connect(dev, &local_err) < 0) {
> +            error_report_err(local_err);
>              qemu_chr_fe_disconnect(&s->chardev);
>              return;
>          }
> @@ -427,7 +427,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>      int i, ret;
> =20
>      if (!s->chardev.chr) {
> -        error_setg(errp, "vhost-user-blk: chardev is mandatory");
> +        error_setg(errp, "chardev is mandatory");
>          return;
>      }
> =20
> @@ -435,16 +435,16 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
>          s->num_queues =3D 1;
>      }
>      if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
> -        error_setg(errp, "vhost-user-blk: invalid number of IO queues");
> +        error_setg(errp, "invalid number of IO queues");
>          return;
>      }
> =20
>      if (!s->queue_size) {
> -        error_setg(errp, "vhost-user-blk: queue size must be non-zero");
> +        error_setg(errp, "queue size must be non-zero");
>          return;
>      }
>      if (s->queue_size > VIRTQUEUE_MAX_SIZE) {
> -        error_setg(errp, "vhost-user-blk: queue size must not exceed %d"=
,
> +        error_setg(errp, "queue size must not exceed %d",
>                     VIRTQUEUE_MAX_SIZE);
>          return;
>      }
> @@ -471,7 +471,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>          goto virtio_err;
>      }
> =20
> -    if (vhost_user_blk_connect(dev) < 0) {
> +    if (vhost_user_blk_connect(dev, errp) < 0) {
>          qemu_chr_fe_disconnect(&s->chardev);
>          goto virtio_err;
>      }
> --=20
> 2.30.2
> =

