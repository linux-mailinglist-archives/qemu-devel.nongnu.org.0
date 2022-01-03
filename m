Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE06482F6D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 10:27:35 +0100 (CET)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Jcs-0003eN-NH
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 04:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andy.pei@intel.com>)
 id 1n4JbJ-0002mu-Pm; Mon, 03 Jan 2022 04:25:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:21269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andy.pei@intel.com>)
 id 1n4JbG-00052z-VG; Mon, 03 Jan 2022 04:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641201955; x=1672737955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X8s7b9zjL7HIPfXu7oC9fTPmD2XMd6qGlktwyRZTstQ=;
 b=GekLl9W8PEmzKQkYA5imBAeNpnHDh6h/i4RSXLKYStTwjM7vN1x8nNMy
 isi8zrDItMbA0eiVJ5oY0/3wL/3GBJgoaEZiB7Sb596MjzeljLzF7iylH
 A8u7ZGTC/CZWNbO5z/bItOvZojMkh8r3y3lPTlCpolBiHSDCqdzUkzHZK
 oC1bnQTMXcnLGlOKbZ2slkgtr1h0rvkxsrGjnVE66TpDdConCNq9x4gPV
 FnBZLKTYMfLuI5fEuSSezedg5rz6QOkRNYLrkY43mKScuoNl01gc9yYrN
 pi/db2COJbfe77eClUcdMlKNkyX1OHCIvqmX7gNlakTrIrRbo2SuU+R7K Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="302791791"
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; d="scan'208";a="302791791"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 01:25:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; d="scan'208";a="620259632"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 03 Jan 2022 01:25:50 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 01:25:50 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 17:25:48 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2308.020;
 Mon, 3 Jan 2022 17:25:48 +0800
From: "Pei, Andy" <andy.pei@intel.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: RE: [PATCH] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature
 for virtio blk device
Thread-Topic: [PATCH] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature
 for virtio blk device
Thread-Index: AQHX4m9+IYUGhcVMdU2sZbuldi6YsawbE1kAgDYvOxA=
Date: Mon, 3 Jan 2022 09:25:48 +0000
Message-ID: <787eba524fcb425db426ea12ff168191@intel.com>
References: <1637892018-89555-1-git-send-email-andy.pei@intel.com>
 <20211129215732.GA5722@raphael-debian-dev>
In-Reply-To: <20211129215732.GA5722@raphael-debian-dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.31; envelope-from=andy.pei@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Raphael,

Thanks for your reply.
I will fix the grammar mistake in V2.

-----Original Message-----
From: Raphael Norwitz <raphael.norwitz@nutanix.com>=20
Sent: Tuesday, November 30, 2021 5:58 AM
To: Pei, Andy <andy.pei@intel.com>
Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org; Liu, Changpeng <changpeng=
.liu@intel.com>; Raphael Norwitz <raphael.norwitz@nutanix.com>; mst@redhat.=
com; kwolf@redhat.com; mreitz@redhat.com
Subject: Re: [PATCH] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX featu=
re for virtio blk device

Just a commit message nit. Otherwise I'm happy with this. OFC should not be=
 queued for 6.2.

On Fri, Nov 26, 2021 at 10:00:18AM +0800, Andy Pei wrote:
> Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX virtio blk device to=20
> avoid guest DMA request size is too large to exceed hardware spec.

Grammar here. Should be something like "...DMA request sizes which are to l=
arge for the hardware spec".

>=20
> Signed-off-by: Andy Pei <andy.pei@intel.com>

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c=20
> index ba13cb8..eb1264a 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -252,6 +252,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
>      /* Turn on pre-defined features */
> +    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> --
> 1.8.3.1
>=20

