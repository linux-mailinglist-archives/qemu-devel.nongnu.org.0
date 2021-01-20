Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E572FD22E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:11:58 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EDF-0001jM-St
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=647c81a33=Niklas.Cassel@wdc.com>)
 id 1l2E91-0008Ca-Lc; Wed, 20 Jan 2021 09:07:35 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:12723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=647c81a33=Niklas.Cassel@wdc.com>)
 id 1l2E8q-0008Ib-QD; Wed, 20 Jan 2021 09:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611151644; x=1642687644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IJvrYLILF1TU6U6P5VjjTPbTxSIyTd5+5SsEO1QyrQQ=;
 b=h7zH70/ve44nWw6qxX0+n+48mt/wJ09IPSVIo8RbFzBUfn7pb91+TnQv
 FrMLGolsDRlVAZ6Q0DmKIxZqkKBqdI0Ifw6CyckBUwL1znIJTZQ86ZmYu
 J0GPMJPYQErtocVEd2r0zrGlDp0BU6OW2iXnLeyYOkMfxHOOdUe5CZ824
 vZJR3pSU2ddhSqxVT6SxcHlEZd7reQMbOvdbYEOxhxRq8iXPU6cfnPSBc
 wlpf6ZhqGsWdmnfWE+IVopW7LTBmIx7CaEYkQg2b5yJH1PyjjKF2gUxkR
 BLn2Ry7nTdtIrGhqZp6EppP0dkcJIllUSOBbP/bolnXBuJcyFVQdeVMnm w==;
IronPort-SDR: d0YAJXoElexkyX5HxNPwyWP+xb5wWGm6qAbQvQYWEtn9VQGKeJ/iMfUH/HRtbWrg7y/U7n0nDI
 uChSx/eMggtsPNE0mtW21vX5i0Vnkkk7cEfy08v4HdrTWrdlAO+HYmZxzPX4kCefDOk5kAtcY0
 mw39JxME1xsMEz8PD41VvyY8/IrSMGKKJanZ/5PNg08BaMZMEMPix4WxcJb2GNa4nGCV2dF4gS
 UrYedn79popzUD0D240xVGnmzhmwHsG6QMldbV0o4HjXDhX07lSWWmErA8ilx65gEhUv+tdn10
 Eas=
X-IronPort-AV: E=Sophos;i="5.79,361,1602518400"; d="scan'208";a="157900560"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2021 22:07:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKSKIt5Hse48EI7NLT3maKX4/F1ymrEtxS4lPctwoKKvGT5tFtWTYjD4OqUpzS7VwBOIpHGPuZXekAcXWpUmVH5/c+5oi8CyHXLXLFtQuze0lAuwiX8OLCDm8dPW3vydUGZW9i/qFvmFpYRNM78DsdP5WFNb3RA4A4ZPxU8uLgsah28RaBp1qbieCFVi7Ji3h7x9Hs9FiCYtIT8TqxJdZrtTk+6N2hAXpqIJR4mSHDt1+wxDwGVGzxaHGhqg6HoQ7fDzDzlrH92eDj5yjc2X9HJNEljwCcmkdj5pSB9PROjD7WROo+41aN+wNOwCDNkXe6XphBW7StFQPZ2owlSSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYndLNbt4C4mJn59Cwx5ksVqQ7nfte+BBIHIABzi11U=;
 b=eudt2tjYMaiNdWmb+2zpmoTpkCdJ7Jxrtsc3dy0oBJ5zlHbiAMFmZjgVCdu5kQTWLvv1wMHZFAABpXAp55V//lenbQJUPupJhJaE/Cx0yZrgZXauxt2nn+yNogEadkf8oDmRQ+8do74eqd/yM+MUhqfjR3Jwe91dK+YqKSlvodEFHXrYdhPfxoMr105AYXo2+08oidnB6H58xlRSlBcNcR+6Ea58YWS6m1+5fVZ3eEyi17OwvmFLFR53mGDldJSS3NqfipVQiszKkQDtwuyZ8ENIX/QQfkBDgx1nJyjC3yEx1tBlYczRFspKDxQe7VaWoNO808xYh89qoA05Iw5d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYndLNbt4C4mJn59Cwx5ksVqQ7nfte+BBIHIABzi11U=;
 b=QmWPZnSFRUQwjiBmhLcmIRfKfyYOMzilhbSktEpywOxOrX4KqHI2fMVRojt2WgYLZ+jp00GCUHii61OwoqGSq38wS2FfnIFlNbQMXKbS9wHYBltVbsfP+QYFdNGvg2//GRFeKUGlcBc+Pthxj2XQOsqhCX0z+NP38h95m9hEMtE=
Received: from DM5PR04MB0684.namprd04.prod.outlook.com (2603:10b6:3:f3::20) by
 DM6PR04MB4905.namprd04.prod.outlook.com (2603:10b6:5:15::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Wed, 20 Jan 2021 14:07:19 +0000
Received: from DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::11d3:8b30:e11f:87e5]) by DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::11d3:8b30:e11f:87e5%9]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 14:07:19 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace
 ID List
Thread-Topic: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace
 ID List
Thread-Index: AQHW7zWQMFdEKboD4kOu/J9IUmg3qw==
Date: Wed, 20 Jan 2021 14:07:19 +0000
Message-ID: <20210120140718.GA130091@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <20210119170147.19657-9-minwoo.im.dev@gmail.com>
In-Reply-To: <20210119170147.19657-9-minwoo.im.dev@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 540536d8-69c8-4a6b-3578-08d8bd4cb34c
x-ms-traffictypediagnostic: DM6PR04MB4905:
x-microsoft-antispam-prvs: <DM6PR04MB4905E5AECD4520B41AD27BA3F2A20@DM6PR04MB4905.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l59J2EM4vEN05kWmQlzOS4WLqkGTsK5Iryi9rM2XOqnqY3wblNOi0jqHkAef+mWmqhUMVYmd7MogpvYwHrdQaRunY2CEqAG+3udlKrmx7rMi0OIbRMariSlj69ZGiL3li5F2NMaFFcrNZG4Dxcp4zjUDQQQFYyzHghJoDcJ9A+8hzKSH77b1OAMIRFrzk0RYGSJAkgTAMXsTU+Yn7txiXtIUOsRTjzMq18ktyku9Rzuak+eTnfHdnEBis7q+9U2vm2Ci+z8ulG89wefdz7N6BBngDhVuFdOsHlsnsSePP4MD81JF9sT8sHiahGV6Iq0+6ZfGM4ClIITvfhsKhZ4vcI8V06EB01GH73zzf+p/DXJEu3lwsxfRMbVkgabNbm/EI65wy0jRWUWRVT1XDQC8YmIn+xqYf66JOL+pXu2e+A99JujevnUMo6YV/cdvouCCURSKA3jWDRix+QJeEggHsLmzcudr5pwFqXqqmzr9R/kr5swpuna3cuyAPZU/9ASbd3b0oODLEK083SppV5D7CmSclo5hwkfGmqcCw8E9piy51Lx0G0837SeBysYkFKOYEZtapQBroB86eNK4c4xmZ5UtJ99rOVW8IE50oSpiROU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0684.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(8936002)(8676002)(26005)(186003)(4326008)(5660300002)(2906002)(83380400001)(66556008)(6916009)(76116006)(66946007)(478600001)(66476007)(33656002)(66446008)(1076003)(64756008)(316002)(6486002)(71200400001)(966005)(91956017)(9686003)(6512007)(86362001)(6506007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FaRixDX4bpGurFH/UDXA3yGL+j68j7QObLPwDAsTPPL3TleKiOqhcvp5M+M3?=
 =?us-ascii?Q?Aewtt3U9/U0+oxvRhOZ++rAlfP5ec7CR442BcvYLE68ySPPxrS/6a6Qcm/T1?=
 =?us-ascii?Q?rCvSJGQ8H/6Q5Rjdl5s41VReCmwRi8tclcNixylx9PJHq8kxcbn8xhFR28Cd?=
 =?us-ascii?Q?kjXhjeaJ7YzyCCQvQCTGJP1NT5ey9G3VxZSvAvGF+ppm/muuL3zqL4nnGybz?=
 =?us-ascii?Q?IW/JE7ZQVyh3ggxmzYKvvLGFF1cOXpEJwoG8VqQNYO2GHXB+wQjnjJ2yNaZG?=
 =?us-ascii?Q?n6SccFyTixDtwHigWHvCGUiVmjVKJx4ly2HmYlnwjSnDCSNG/LI8Ju8w4ESY?=
 =?us-ascii?Q?L8SR06qIzjSP+0Y8FW4povulkjdvydPZoj7Ix6wPFCSD6+xx/GeF6jcrVHf1?=
 =?us-ascii?Q?sS0CUSFw25mW4L2JWD2xULW65HKy1xhq4UmLsJiI6Msz4fQhYXv14EikWj8R?=
 =?us-ascii?Q?et06YutIg4ZnGbujHv5AJ3siU1GVFsSdAhIyXMQRIVlHYXdrjrozL08fK9Rf?=
 =?us-ascii?Q?RPF0Ot+5z17aadJoGV9WSJv2FztSvUDCzJ/IvkYSu6V3wRVuCMMw5op53enV?=
 =?us-ascii?Q?q2vmAHQmoKBbpiAWgm7yXHXSy5tS79aRuBzicGWQEOhITm9EPr4NVctzRGkZ?=
 =?us-ascii?Q?xGYp8bYO05D50S+QL3EtY5FtMguh3F15ZieXWKFIM6pNjH+6TdxYZwnocYh+?=
 =?us-ascii?Q?OwQigmA7d6HWMZ6u7gvQGXjw53MeCM66WfEPBxFPXzNH4CCIT851uVurgOsh?=
 =?us-ascii?Q?sru8fGoUOyZwRT6INc2ta+ntFLzK+HZNhW/2GUwklV8Gpkv0JPtj+mw69bZM?=
 =?us-ascii?Q?P2iEQJNhQZ/ShDNRI7ZLrrLYOUfsUpPyJZUPAUbOS0Rd1i6C6cdbzMTztJY8?=
 =?us-ascii?Q?gR8hhOoHx3ijEQHPYJiQN8B9sGfuDF6ag2973amm3muUNmgj4QkqvmYXgpee?=
 =?us-ascii?Q?yidbN5ze+FVFrmgDDmN1uGF2dUWds/u9BW4jRte6qJMuxYulm2PoOegmwmDC?=
 =?us-ascii?Q?Kt2V?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D26A1AB1571114489BAE7A6296EFBAE3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0684.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540536d8-69c8-4a6b-3578-08d8bd4cb34c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 14:07:19.4476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IS+SCqTTE0rKf9hdHOJoqPkmMpMuZ2SqIlf9LV/6UeyshICBR83zmP1dRNjwq8qnnO6NlQ2h5FQR0J4ft1cThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4905
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=647c81a33=Niklas.Cassel@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 02:01:47AM +0900, Minwoo Im wrote:
> Spec v1.4b 6.1.4 "Active and Inactive NSID Types" says:
>=20
> "Active NSIDs for a controller refer to namespaces that are attached to
> that controller. Allocated NSIDs that are inactive for a controller refer
> to namespaces that are not attached to that controller."
>=20
> This patch introduced for Identify Active Namespace ID List (CNS 02h).
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 2b2c07b36c2b..7247167b0ee6 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2883,6 +2883,39 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, =
NvmeRequest *req)
>      return NVME_INVALID_FIELD | NVME_DNR;
>  }
> =20
> +static uint16_t nvme_identify_nslist_active(NvmeCtrl *n, NvmeRequest *re=
q)
> +{
> +    NvmeNamespace *ns;
> +    NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> +    uint32_t min_nsid =3D le32_to_cpu(c->nsid);
> +    uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
> +    static const int data_len =3D sizeof(list);
> +    uint32_t *list_ptr =3D (uint32_t *)list;
> +    int i, j =3D 0;
> +
> +    if (min_nsid >=3D NVME_NSID_BROADCAST - 1) {
> +        return NVME_INVALID_NSID | NVME_DNR;
> +    }
> +
> +    for (i =3D 1; i <=3D n->num_namespaces; i++) {
> +        ns =3D nvme_ns(n, i);
> +        if (!ns || ns->params.nsid <=3D min_nsid) {
> +            continue;
> +        }
> +
> +        if (!nvme_ns_is_attached(n, ns)) {
> +            continue;
> +        }
> +
> +        list_ptr[j++] =3D cpu_to_le32(ns->params.nsid);
> +        if (j =3D=3D data_len / sizeof(uint32_t)) {
> +            break;
> +        }
> +    }
> +
> +    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
> +}
> +
>  static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeNamespace *ns;
> @@ -2914,10 +2947,6 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, =
NvmeRequest *req)
>              continue;
>          }
> =20
> -        if (!nvme_ns_is_attached(n, ns)) {
> -            continue;
> -        }
> -
>          list_ptr[j++] =3D cpu_to_le32(ns->params.nsid);
>          if (j =3D=3D data_len / sizeof(uint32_t)) {
>              break;
> @@ -3045,7 +3074,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequ=
est *req)
>      case NVME_ID_CNS_CS_CTRL:
>          return nvme_identify_ctrl_csi(n, req);
>      case NVME_ID_CNS_NS_ACTIVE_LIST:
> -         /* fall through */
> +         return nvme_identify_nslist_active(n, req);
>      case NVME_ID_CNS_NS_PRESENT_LIST:
>          return nvme_identify_nslist(n, req);
>      case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
> --=20
> 2.17.1
>=20
>=20

Hello Minwoo,

By introducing a detached parameter,
you are also implicitly making the following
NVMe commands no longer be spec compliant:

NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST

When these commands are called on a detached namespace,
they should usually return a zero filled data struct.

Dmitry and I had a patch on V8 on the ZNS series
that tried to fix some the existing NVMe commands
to be spec compliant, by handling detached namespaces
properly. In the end, in order to make it easier to
get the ZNS series accepted, we decided to drop the
detached related stuff from the series.

Feel free to look at that patch for inspiration:
https://github.com/dmitry-fomichev/qemu/commit/251c0ffee5149c739b1347811fa7=
e32a1c36bf7c

I'm not sure if you want to modify all the functions that
our patch modifies, but I think that you should at least
modify the following nvme functions:

nvme_identify_ns()
nvme_identify_ns_csi()
nvme_identify_nslist()
nvme_identify_nslist_csi()

So they handle detached namespaces correctly for both:
NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST
as well as for:
NVME_ID_CNS_NS_PRESENT, NVME_ID_CNS_CS_NS_PRESENT,
NVME_ID_CNS_NS_PRESENT_LIST, NVME_ID_CNS_CS_NS_PRESENT_LIST


Kind regards,
Niklas=

