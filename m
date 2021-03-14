Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE39533A7A7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 20:33:14 +0100 (CET)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLWUD-0007vZ-AZ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 15:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7008a0ef5=Dmitry.Fomichev@wdc.com>)
 id 1lLWSs-00076q-DJ; Sun, 14 Mar 2021 15:31:52 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:34470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7008a0ef5=Dmitry.Fomichev@wdc.com>)
 id 1lLWSo-0004J9-Ko; Sun, 14 Mar 2021 15:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615750306; x=1647286306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t+pT7ONk66lKIfIzklepH3AwuToIAOG2PO6vO4iRb5c=;
 b=UDuuXLJjf5CTzRdAHdwfKQJfZqS3sRjBMF11sJvBdAYDRZxNGGwzr6DM
 UMEUqqa3CzGJQ1VPHihPVwZdq72unVlVbP7w5qe5lDv9WWKVvW1KpvhYM
 YJy4hQGvBBYGihJtgr7Ei3m0Gd6lJdhO2SuqNGM6sWKHxleCMZEa9b8iY
 YxMfv5u3PRr37MOVAxc3tLhKWAR60OZik2QtcQNpRxYmK7q4j45wFlroP
 q2OdX2J+7eT+0C4R+fxvkxZreyxmNko3+c+UZofOG94ZPgBBQmQ3MQ6M3
 Rsbb1KcZAYB1nD8m2gw0DerxoUmnrGspVJmzI4/dQt5SsxxbcG/3YdvLB w==;
IronPort-SDR: A+CpCQjAh4NGaI+gn9SG8kXpZTtU6r0VWjU/6uSXmkVYCqfRQAUra6nOjAoTWikiYkMKencoXb
 Ji9u+ADEOWAZH8x28xip89Mu5dCpuuWhPBtCY462V9kLURWn3tmsLReW72XCQAMrjDYW6MNVsA
 LsSC7MelqRmQBI8ck0YHMa7JxzpSMggZ30+v0BnYK424Cv/lns0iPkcRMrT4OVHRDcEIk1weVn
 LhSeHErNk35eLq/81uQWaZ3capxp3SEZQlpm60zizMgvQLkotTlD4i0FLb475KUbLB355OFa5C
 C1k=
X-IronPort-AV: E=Sophos;i="5.81,248,1610380800"; d="scan'208";a="272821061"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2021 03:31:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtD3g6mzyXISwrE95+wu7bdyH40LrgCzZsv10Ug0xxV5KsOSYhJx+FsXpCwAruQKxtV3yutbtoRXDwJ2uYfypXpJ5U6zfU8rTUjyNXluzPRo+e242qWfviUTIGXpXyz9xK0P3wCFXN23spddy7nj0YXLL/19YHPL54/JCBL0vNWDAQ0rkzgkd5rpUYX2eTkvQaei97zwoHD7RIFzNtxtVMWgHJbpulcXgRAjoBZhYJXFqkS0T+d7XKCeZfd5nMzXtrqGoOiPZahbfW8tNZ4xZ+ErT3A9F8seAato0zCDPjnaG5919HQ6+her/s9DDBPWvR5miKON0u7TrikVR/OKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmf82GkIIknZya5WfQPUIi4DITs2DaIRhNIOU0y0qr0=;
 b=eboBL6CvP7zM692rk5oDR1VCWZzhMupzKSIm3uIWWxTBbxnQhcJ53ngr1F/cP7qopDF6ofKNZs5ZBMmGxiHfn7J1Li3wFfvqTUz3/p/nAabiuGHeqOaeDWFFO/bMReV0KUGJCA36usm4Mfz89NR4+Euboz7Inewfx3awC/T+Q8MH8JvAeW7uL7HMzQOGHUHZYDEhj/GK4GFM9vChPvdvNUNGWcOu8704LKJrkldpppE3/1HcwXXcsYdPcMDAoNr5foXLLlAscGGFgfCFsR74mKP+DLgNbkImhAL2Vs89wT5if3+KiLh95QBmZDhHDRPZfHgAeo+tDtTQrhf2m/4cpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmf82GkIIknZya5WfQPUIi4DITs2DaIRhNIOU0y0qr0=;
 b=NRgMQgQhR6juiWq2zv2pJmmSe+tc7ioDT4XkHGnAfwUfgkpGVFjOfN98+JSmXWJwc4M+/mXLI7azFy9mRLOQjjcV2p0mQPUtJQGreeapsBQUFewkb1dE6gbgiiI11kuI6FL9Oob3TyT/phIZEJfubtVUUEKGmVC+PLAgrCuSHTM=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB5824.namprd04.prod.outlook.com (2603:10b6:208:3d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 19:31:38 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 19:31:37 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: Klaus Jensen <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 01/13] hw/block/nvme: fix zone management receive
 reporting too many zones
Thread-Topic: [PATCH v5 01/13] hw/block/nvme: fix zone management receive
 reporting too many zones
Thread-Index: AQHXFZNMfXlSi3qowUa22Vt9TqUy86qD3Rwg
Date: Sun, 14 Mar 2021 19:31:37 +0000
Message-ID: <MN2PR04MB59510F893FD416825A3B7E5FE16D9@MN2PR04MB5951.namprd04.prod.outlook.com>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-2-its@irrelevant.dk>
In-Reply-To: <20210310095347.682395-2-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 83966c7a-f008-46cc-46f9-08d8e71fc93c
x-ms-traffictypediagnostic: MN2PR04MB5824:
x-microsoft-antispam-prvs: <MN2PR04MB58243A919629D4CC721E439AE16D9@MN2PR04MB5824.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c7sNfvBnFi0du8r4benF8PSU0ekTQWdpRJ24fYS8iS0Gh0mArnXg2CwXaZAFDLv+f9bnqL/ojc/zM1D3L5wkJc1pEkX1uID6UE3ocT1dlsMiDXEQJtkRr4LU5SC6KhZ94+w0+Z+8pjd+WH8Lz9/oOIFylHj8y1ECvQK+o99t56UPDeLGKMNCQ3psqSikewWLEzmhRriYjJatJxqDuucaK+7TSJX4VN6i2E8gOBKSPdywD+05QMYXBKKaNwSJkslg3YxxTYCzQ1JYDx7JOKR90u4eXsFJpr5ulBTADYXbjqn2ZN+m2EYfifDINi0QN6xTLL294MnmgBWE45YmpLJ1GwWqreasZwGy4VMLcPM5ez8weJP3E5DRznl15tEZMa/Q5Qc/KitpOAZ82Nvp/xV7OQ0mOAF2sisBrzfWIvMtdHsfI5cWpFuNzH8Wq6AgNCIilYvTg4FVDaa0E81znGiTkd9Z0OaziWQ0PXexMvF1WUg/EvV9n8tezE/ejixCQchlLwlT9P3pRpnWY0G6ELfaJbkkMkz67DTgA5y6FW7+sFxcG9ZqHKXsE2rlSdGCJb8W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(52536014)(33656002)(66946007)(66446008)(26005)(478600001)(83380400001)(4326008)(66476007)(76116006)(110136005)(66556008)(5660300002)(64756008)(316002)(54906003)(71200400001)(6506007)(9686003)(53546011)(8936002)(55016002)(8676002)(86362001)(7696005)(7416002)(2906002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZAr/JEVYEEDum/zLWtOo5Jd6GIDiHf4A9NRd6mQ63VFHhJubBgrkFEjJxX9y?=
 =?us-ascii?Q?YGEUFg4SYFRVnA3lg2bApy8TYa/zVRcRu2FK7ixB+F72U/LucwDRnn5mxe5A?=
 =?us-ascii?Q?AiER7CtJGhKsg3FsgGpoUjyGqRArWccdVoRB+suz3pxI28+PowQZ3tKekFmR?=
 =?us-ascii?Q?u4gXOYJ7WVE4jXRWrMrqXbxr5ju2MOXIAA2mOqn2ojMAv++OXTX1REuSwjD3?=
 =?us-ascii?Q?4kdBZ++IUR6q4UX52QnMiKMpo8Gke1VQ4kwvEANsM4U5YHcseUDbvTXDxyMi?=
 =?us-ascii?Q?f8Uy7w8TEuyvvhWQEbyqJj5zYaza63twQMV+6ShPbrYOJu6YXyD+4Z1FPjfk?=
 =?us-ascii?Q?efIWJQbhiAXd7Yo8XF4GfExCYKJ5B8C4rxeMyqFQBblID4XAhyFBNBCXlIc5?=
 =?us-ascii?Q?khz87PSgkw3pNoF3xW5CHfDeqPmQGlM6hOmIwJwYZ/QfjOwKhXnIaqAD7qYp?=
 =?us-ascii?Q?gJSsBK/t4sqmFVmPk7dDDy76kGc+5hqUlTx0bcJb4mFMRChgL0+SUTH2Krra?=
 =?us-ascii?Q?IdzEYp6Kg9lpkTqdIwC4Nj3XoPIrEQvcZJkjpXOXMKLX+Afme4/+/u383z87?=
 =?us-ascii?Q?gqR/v504sWOe9FnPu4aRYUm1F+Zm70RCFMfj/J7ZbfHu/jEvP3roSBsr9IlW?=
 =?us-ascii?Q?zQFgbhO9qyqllQTd/egynCnr3hsFXEmwWno5kEDg8EphPMXig9Tos1jfow+r?=
 =?us-ascii?Q?/RQ1VMNKvE6Fr22Uc0bKnn8Fp719V3bE2PCDiBA3gzkkI9JiEKrKvVzeQZJ6?=
 =?us-ascii?Q?A1x0fASab1AK5y4VdMVTQfyszS2UCUs4BSdHg2hWUnVhGLOmAWbGVjYaV9HJ?=
 =?us-ascii?Q?7aGlDGnptRUWYebEQhggUEmwcxNqohlwTPUQf77wGqg3JVvndJTFsj4O3GDe?=
 =?us-ascii?Q?zHoCitIXtFcaM7UFRXDmRN9oV39l1kCYnnDM435Q9bTPL7pJ2ZqMyDsMNEYc?=
 =?us-ascii?Q?8LpeVV9NVa1aNWCaDGYj6MmT5aZZ+TmrmKjrp9A44KRL0+UXbGXJllxHNUKY?=
 =?us-ascii?Q?pIzB8SGpNtVm5TNJkdsn8hQziStEYDFi0/6Sh1OMFMEWvhBqORX5qhNpGFlt?=
 =?us-ascii?Q?DZghsY7k59yy4zTwEm9b/N2lshIk3QT+S6zEiaZbP4X4TeCSUYtyHVZLg4hp?=
 =?us-ascii?Q?F+jSuhOyLehXEM96WzK8U8es7ObDDfegYxs1pxoONJuNlKARcCN3jTui14pI?=
 =?us-ascii?Q?eQoFIhdFqBEg5cNzlrB3GFy/0tsNbB6/hqs84I2QdSWqVxCKGw4hRhgvAHUf?=
 =?us-ascii?Q?fy6hYyzUwG7pqQJp0hWxSbcw5/Tjj2nMGHJE/Bp1Xzyj9kKOCfrkVIthuVCM?=
 =?us-ascii?Q?sAA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83966c7a-f008-46cc-46f9-08d8e71fc93c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2021 19:31:37.5560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1A3InEqpye/r943bIeei5CjsfRsXk7TQ8mvGzgvKU8eyobfkWuYID01XBFuvY59+rh5sWi0ERrIcB8TZs9TJ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5824
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7008a0ef5=Dmitry.Fomichev@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LGTM,
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

> -----Original Message-----
> From: Klaus Jensen <its@irrelevant.dk>
> Sent: Wednesday, March 10, 2021 4:54 AM
> To: qemu-devel@nongnu.org
> Cc: Stefan Hajnoczi <stefanha@redhat.com>; Klaus Jensen
> <its@irrelevant.dk>; Fam Zheng <fam@euphon.net>; Max Reitz
> <mreitz@redhat.com>; Kevin Wolf <kwolf@redhat.com>; qemu-
> block@nongnu.org; Gollu Appalanaidu <anaidu.gollu@samsung.com>; Keith
> Busch <kbusch@kernel.org>; Klaus Jensen <k.jensen@samsung.com>;
> Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
> Subject: [PATCH v5 01/13] hw/block/nvme: fix zone management receive
> reporting too many zones
>=20
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> nvme_zone_mgmt_recv uses nvme_ns_nlbas() to get the number of LBAs in
> the namespace and then calculates the number of zones to report by
> incrementing slba with ZSZE until exceeding the number of LBAs as
> returned by nvme_ns_nlbas().
>=20
> This is bad because the namespace might be of such as size that some
> LBAs are valid, but are not part of any zone, causing zone management
> receive to report one additional (but non-existing) zone.
>=20
> Fix this with a conventional loop on i < ns->num_zones instead.
>=20
> Fixes: a479335bfaf3 ("hw/block/nvme: Support Zoned Namespace Command
> Set")
> Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index d439e44db839..c7b9a1663dd7 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2619,12 +2619,13 @@ static uint16_t
> nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
>      uint32_t zone_idx, zra, zrasf, partial;
>      uint64_t max_zones, nr_zones =3D 0;
>      uint16_t status;
> -    uint64_t slba, capacity =3D nvme_ns_nlbas(ns);
> +    uint64_t slba;
>      NvmeZoneDescr *z;
>      NvmeZone *zone;
>      NvmeZoneReportHeader *header;
>      void *buf, *buf_p;
>      size_t zone_entry_sz;
> +    int i;
>=20
>      req->status =3D NVME_SUCCESS;
>=20
> @@ -2666,7 +2667,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl
> *n, NvmeRequest *req)
>      buf =3D g_malloc0(data_size);
>=20
>      zone =3D &ns->zone_array[zone_idx];
> -    for (; slba < capacity; slba +=3D ns->zone_size) {
> +    for (i =3D zone_idx; i < ns->num_zones; i++) {
>          if (partial && nr_zones >=3D max_zones) {
>              break;
>          }
> --
> 2.30.1


