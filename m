Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8234807E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:29:38 +0100 (CET)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8G9-0007Q5-KX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lP8Bz-00045I-E2; Wed, 24 Mar 2021 14:25:20 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:47746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lP8Bv-0006cg-8E; Wed, 24 Mar 2021 14:25:18 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OICKVK002460; Wed, 24 Mar 2021 11:25:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=eVIrTEWwZma54+U4GLXe3bJ+Lsv0PVfGSzobTyZRS04=;
 b=dajjaXTHOBC/qjWftAdbowz/daQpOhJoYZebug11i6hGdpcG1llQNFS/P0kKYsplfENX
 92AJmnxGnx9pVi25gEQ25p/fP+Y0jFyvugbrDnnxVIe/9wlbSF8VRNTmVpEIXkND/gYV
 MEM0tRjFL+7H5q0ykiIPQSbw+hCurFi+SK5EWgTQotNTR0DqoMq8OhxhbdndNDyy6+y8
 bN0hmK28qTkXlN2zFfFHgBm+aJ9YGHnbGhe+PAKrTBl+tcSN/3n1ojmbOa+d5J9uysD1
 CLNGp0NVXjn2JX9v49CC0QQJKtakeIVgFIFfQZGMwLJyUx6xAuTfeinsmtDnXLSmWXjo rg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-002c1b01.pphosted.com with ESMTP id 37dg4h32js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 11:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKZ98lAi95jpAMF5O6BeY1H9uPBuzvY7v8MkcL1qbfErRABSUoc+NU0fXGxmjCUGtz7K5ZBmM/jufswdUet96po+DYzZHKl1JZRR6HDxo//BAD3S64qVoyujGiegpqKz39PHxqKzxXYlRnRkdnKvycBNgkHz44/riTHK6z+7RzxnqCUSpQjL3QQP0Z8JUinLeIQL5t3fVk5Rrh9AP1PW3CngjpeIsP1tIFmUzqId68eaHnyY/Z+1q9DJYIjGznBsdwFRiHfcuqkmQAZFRgg3/+5+jtRUTacd18QEPCG32yBYSA5gav1hqnAD92LbsOs356+OlcQjDJ93nFPqVqQJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVIrTEWwZma54+U4GLXe3bJ+Lsv0PVfGSzobTyZRS04=;
 b=VuzfugSavNKqa5eihqoUOg3txi9BqPLYZfR0T0KjQddbNTMyxKSgAN3W5/34knyMUUz3MhTZmMWeDsOSAaeB4dQIJcvn05tvPqfnZ2q+pY2soRntcLZReJksmdViqSyMeWrl3PkSWxa2Too3L2J/qFSO+uAvCXQ6obqjZBCx3B1BZThT78Wf7Wak4I92sVOXGl1VIMxRmYwJDHEE9/xJ9ifAx4AAGK34iunDuxgAcwqMCP3n17FJpsVzASiM5Kj1f8RjBMEjQqWLf2PLIbNrbzvXUqhGtONebdxwnpVCl0tQiyKxp9CHav1ChyfBWRFJSnIR4mGcLB0nKfssl6mOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB5167.namprd02.prod.outlook.com (2603:10b6:805:6a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 18:25:08 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1%4]) with mapi id 15.20.3977.024; Wed, 24 Mar 2021
 18:25:08 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v2 1/2] vhost-user-blk: use different event handlers on
 initialization
Thread-Topic: [PATCH v2 1/2] vhost-user-blk: use different event handlers on
 initialization
Thread-Index: AQHXIJF81FZDZo3ooU+hoJJCMtK3+KqTdN8A
Date: Wed, 24 Mar 2021 18:25:07 +0000
Message-ID: <20210324182502.GA16138@raphael-debian-dev>
References: <20210324093829.116453-1-den-plotnikov@yandex-team.ru>
 <20210324093829.116453-2-den-plotnikov@yandex-team.ru>
In-Reply-To: <20210324093829.116453-2-den-plotnikov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: yandex-team.ru; dkim=none (message not signed)
 header.d=none; yandex-team.ru; dmarc=none action=none header.from=nutanix.com; 
x-originating-ip: [98.151.208.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 815350aa-984e-4eac-14d1-08d8eef2274d
x-ms-traffictypediagnostic: SN6PR02MB5167:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB5167CB73F15AD5BAD5ACB256EA639@SN6PR02MB5167.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kXD+dXuyIr88AwAh5B2bCoom9G2whm99VrGlsHCn2eVQzlKYCxqutYmrzRToi0Egs69NegVywIzWK1H/aqUpK4/hCQGkzaQg3fFXbAiGPNLR4jt2n2ZrDJBMA/Ya7g2804E0eLOxV1f8DKtIkZaQVNVQ1R0YUqO9rshzMwWDyNQtk+P6wcAK/24Cgn4uiy810pxow9QtwchXotnqltxnl8W7TTtjafKV/w6Lq3YLRJI1Dh68cayf1KdleZ3MiOjCs77kNUvHAzMlqBjg7Eb0KEHY3N+UrXkT1FdizeAmCD+HoKvcyWfhe1RufjaHQwAbICjgWsqZhX89ClnVWzJo4h5beE5BaW9q3w8dVUww2s9Bk72VXkjLvdXqeKd4xMAyBuoD1BOAcXv6aX4AVE07B0p1R/hv2tVcK30QDtOvWYLB60HR8T3FPKAni/73TiiYFnwAbxg9jIbQa8ZTXsV+dqIveAOQlDs0/kWXiL1h4gjCvYW3SlpeC+bySuDCO6sHwqOngCdoY71qMgN5cP7dVMbTHCGcZKlQ9y6fKOsS4hnriIoUTfABFiop8s8YBbeGGfVwYzmzNADM7fF65bXKYCB7BQAL51FnJgSEkpQhCpINS/3OKtlzXNWwm5H/EDO7VqtnIMvn0ZEeU5A6dyFWvkqgZmwGKALl2CkcwKHGhc4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(396003)(376002)(366004)(346002)(39860400002)(91956017)(66946007)(76116006)(26005)(186003)(38100700001)(4326008)(33716001)(44832011)(64756008)(71200400001)(66446008)(1076003)(9686003)(83380400001)(86362001)(8936002)(6486002)(2906002)(6506007)(66476007)(66556008)(316002)(6512007)(8676002)(54906003)(5660300002)(33656002)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?B5UUcG3b28gWr0cQhtSwf6xlOS5zg8bRpbrDZFS+O93lCUADIVjXafOfQPHx?=
 =?us-ascii?Q?BHoMyMhB+EMApxlZhXe5O3nujLgTBpTTQ3A40t+McTIvZSu31t8jmvXteExJ?=
 =?us-ascii?Q?2u0pV6xHNEnkymkSmj2gwZPDhK2v55JyDxSJbNGEnIOaxvFLMs/mC7g1+APy?=
 =?us-ascii?Q?L9b+wnV4a+W9hb1gM0FzZ4AClk+PmYajcM3DEj5uVldD9wXQlRUpUhStMYRF?=
 =?us-ascii?Q?sDgYiz04e7/n2RlnBAis3DG7mdoG+Ki1rM+/1BGriUnYkksWuQ7DtvtwckPY?=
 =?us-ascii?Q?hsDiMxzo5oV7BTpuM0TAzZNkYIIdL7ph//awTGXFL0ak9MS9rJNu1h/wUTzO?=
 =?us-ascii?Q?bZZ/bTFgdfVpTCjAcoqwW5XbUYHbvgklpJ/GjO6uEIXJjecZS0UUcL9c1sqY?=
 =?us-ascii?Q?vVOn2zwzPwEgCjYnJLPNroJcEyFxwd9htUFb4Ww2iAkTSzedCh0LH4EgiFhl?=
 =?us-ascii?Q?1inVUak17MJEQMybMn2LWz+gCDl+cWbLg1UI+yzFMxHu+E63o7rwNiZHopC9?=
 =?us-ascii?Q?7h7IXNdhL4kDaJiC1YNEaD9j6dmQ8UPCDuis+5FLCU3aa79OqIMtOsod1MF3?=
 =?us-ascii?Q?6iQODL84CK247gPPLKBGpPIlGFNNyanbIZvQKz8smmDof9E3L5eHmPqA/cWR?=
 =?us-ascii?Q?zBUuvYnYX4GGLyLKFyHWwCdXINfpL+v0wB/cX5k0DTdJK3CIFoUJO8pto2yY?=
 =?us-ascii?Q?lOYTWFZZN3yg4Zlqxk/yRpjLh99VojtY7jlk76XOiixNYNGQswizXrpfrIBd?=
 =?us-ascii?Q?UF17ecmiKDkuSVlMdbXhNyCxXXWPztx/vLCPFDPSH18dhqiRh9YRhOUNEBs9?=
 =?us-ascii?Q?322BXPe/j2tEqy3DUPKn1aq7wFvmkXdpxgZ0ibardrLjSPwvf7oPHQwURJv6?=
 =?us-ascii?Q?QL12uHHfF6iBWSkuS62Lg4aO6lQ0hWAzutkCD869jnBbRHQgFop+/LpBr2fS?=
 =?us-ascii?Q?n5AJ1VGlzmX7Eq5vwOOW7NEq1eSdMYqlB6p2YxEOj8lheQARpIGLxTrMMURc?=
 =?us-ascii?Q?UAgzrlAlz4y8x00/UVHyYMDb/RwjlKopDjdUzFbN/CKJtSZeijSNO4wJEwE9?=
 =?us-ascii?Q?6cG4SkG2z1nJ6P4z/RAmcbNDd+PTb+UJ4+ku0HAxbZBMN4lTPX3ShE2ymo/+?=
 =?us-ascii?Q?Qii9+tHJZbWv+Uq8nInmq+PLTGu2vG4y4fRao1zXDTThtrMGuVXJaS9cuH44?=
 =?us-ascii?Q?pnkxQrLiknRlNaZcGI8Re2t3D0s4ZWWbuArJJlxPElcYIB95NBbYqadalF8X?=
 =?us-ascii?Q?zgQqVWQbKCiMSu4wTq9mkcQ/4y2QGq8ouHc2A8HmLJ6U8Uj1NHpisTmenUaY?=
 =?us-ascii?Q?P6kZK5LYAYmHtAqYICvutMdSlTMUgdYwoGddl03GdqNH9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF8C7CB625B2A548BD1DE07597881008@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815350aa-984e-4eac-14d1-08d8eef2274d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 18:25:08.0605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uxq6oVBle4lqQmI0iemtkJEswiquRf82HisWs/FLPrvuhh59Vr9uyd06GQ5+WGLIjhZgDLLUoteSItfDyeOsyv3DFJBuWUj5Vmwr6QOSIKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5167
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Couple commit message NITs but otherwise I'm happy with this.

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Wed, Mar 24, 2021 at 12:38:28PM +0300, Denis Plotnikov wrote:
> It is useful to use different connect/disconnect event handlers
> on device initialization and operation as seen from the further
> commit fixing a bug on device initialization.
>=20
> The patch refactor the code to make use of them: we don't rely any

s/The/This and s/refactor/refactors

> more on the VM state for choosing how to cleanup the device, instead
> we explicitly use the proper event handler dependping on whether

s/dependping/depending

> the device has been initialized.
>=20
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  hw/block/vhost-user-blk.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index b870a50e6b20..1af95ec6aae7 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -362,7 +362,18 @@ static void vhost_user_blk_disconnect(DeviceState *d=
ev)
>      vhost_dev_cleanup(&s->dev);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> +                                 bool realized);
> +
> +static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent even=
t)
> +{
> +    vhost_user_blk_event(opaque, event, false);
> +}
> +
> +static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> +{
> +    vhost_user_blk_event(opaque, event, true);
> +}
> =20
>  static void vhost_user_blk_chr_closed_bh(void *opaque)
>  {
> @@ -371,11 +382,12 @@ static void vhost_user_blk_chr_closed_bh(void *opaq=
ue)
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
>      vhost_user_blk_disconnect(dev);
> -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_eve=
nt,
> -            NULL, opaque, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> +            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> +                                 bool realized)
>  {
>      DeviceState *dev =3D opaque;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -406,7 +418,7 @@ static void vhost_user_blk_event(void *opaque, QEMUCh=
rEvent event)
>           * TODO: maybe it is a good idea to make the same fix
>           * for other vhost-user devices.
>           */
> -        if (runstate_is_running()) {
> +        if (realized) {
>              AioContext *ctx =3D qemu_get_current_aio_context();
> =20
>              qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL=
,
> @@ -473,8 +485,9 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
>      s->connected =3D false;
> =20
> -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, vhost_user_blk_ev=
ent,
> -                             NULL, (void *)dev, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> +                             vhost_user_blk_event_realize, NULL, (void *=
)dev,
> +                             NULL, true);
> =20
>  reconnect:
>      if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
> @@ -494,6 +507,10 @@ reconnect:
>          goto reconnect;
>      }
> =20
> +    /* we're fully initialized, now we can operate, so change the handle=
r */
> +    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> +                             vhost_user_blk_event_oper, NULL, (void *)de=
v,
> +                             NULL, true);
>      return;
> =20
>  virtio_err:
> --=20
> 2.25.1
> =

