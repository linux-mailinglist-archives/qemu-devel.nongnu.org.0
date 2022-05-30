Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E94537446
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 07:43:25 +0200 (CEST)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvYBY-0002aM-EG
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 01:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=142e1760f=Damien.LeMoal@wdc.com>)
 id 1nvY79-0001c9-Jv; Mon, 30 May 2022 01:38:53 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:60056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=142e1760f=Damien.LeMoal@wdc.com>)
 id 1nvY73-0006Lw-MT; Mon, 30 May 2022 01:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653889125; x=1685425125;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Fs0caKyHp84QaU8p2UjtclfyrMQUl5A9vMEZyxywbdM=;
 b=H75gOH+dN4+R2h3Wk0tXBHUc5pqF0RZPraHXffrytb7TRRp+NGGQKzMm
 fqeVpiNfoaaPQaVPgyEvjvn/z/gYyXjn7lurrghWKWaFRBoZSrlCcK5cL
 In/ijjhFN/H0baqsdpkXhuJR/f8S8ZSkcvljNIbOyKXMfhxNhhWYoUpLI
 cBCx6Qc/a5bMdPTISmQ2QTIWxl2+Xw9Eza73HPQ3rhZgKdI/Lp4cIgr04
 fGcpeCOWNXovbMKtcqQNQ75QEPEsh/V5gnzT7yjfEwGZLeprVJB40MoLR
 L+4oAmXZG+Xpm6sneabFVylHHp3SFIyaTapuHc3KHElbYwP66CpELzVun w==;
X-IronPort-AV: E=Sophos;i="5.91,262,1647273600"; d="scan'208";a="201773485"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 13:38:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffXHV4eVMXAtg7m9f12rRn5+KDnPs/EVMOWnbUnHm32PYKteToGlngYF/92foOOIIN0/pnfMzZrCThU15VdP9CRmuVZPRDS+htvd9QC5xDaO1vRSSiLJqBUVWj2C6SVCeKoGL3gRaoa8i9HAf2xAmsnDbaCoVp9t3N/L3voD9Y0nfHT7hF39D+qKkCHttXv+TNNAkmH4P5CgLh35po/mklF7Duyn/QJeSYpkyo1EQKkLrONAEtKDnn0/Rt/A1OnsiPKeNrIdSisrVdgH6+aqC9uM2Rj82rOtsCm5gk8Idsn/Xh2DY2/Vym+5pu7pV+Y43Asi+4cJcayN1HokQ1f3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs0caKyHp84QaU8p2UjtclfyrMQUl5A9vMEZyxywbdM=;
 b=fBwEcU6L4nHpg4cRx/vTifLQ1MwH48XHlul3EySRDQcCEl/ruEP7G/Qt8Cc4gsFCZFBnkzZ0/EYYlgvC9P3iNWbcHoDKw1OeCtR9fTbSx+JoCLzTsh+MTRNmAIJDLCzJjjOuiE1wWZJQM9/gZuEz8ovm2vo5QIEA5wp3NjC/rKD+7hEsxyRpMa8MgpD/LpKQsqUt1UcjN1JbLKtO5fDPuXhKB8EKZwBRIj5oyK+1XV3XlCT/1is/66FDzG2qQwqDwFnIwKRvbohplWS+XXksoNx1VwbJhk9/JWaQy240B9Mp0Bv5N2MDyAey+pNUc9fjai0fudXTTHpZytxucjWfIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs0caKyHp84QaU8p2UjtclfyrMQUl5A9vMEZyxywbdM=;
 b=GltKTXiAxeouDzQvrZIkgDZUiBH+FTvuJoqaCWxNBm5nj5zixV0CPGms7zt5Akor7ivZkIwxcS2lXEhkVNOJ9+b0qbIetFATnCgI01F3R2xYjqjq8ZDcFqX0OUwS37M7zoFWfloPl9NaqIF3toB7v5Hd9m7ApOu1hnVipYE0kl8=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by BN6PR04MB0740.namprd04.prod.outlook.com (2603:10b6:404:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 05:38:35 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::b080:89a3:62e1:942d]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::b080:89a3:62e1:942d%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 05:38:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sam Li <faithilikerun@gmail.com>
CC: Stefan Hajnoczi <stefanha@gmail.com>, Dmitry Fomichev
 <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, qemu-devel
 <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
Thread-Topic: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
Thread-Index: AQHYc+N680vCNb3LXEGqexiEqafJWQ==
Date: Mon, 30 May 2022 05:38:35 +0000
Message-ID: <DM6PR04MB7081D63D848FC239F92860F4E7DD9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed949dd4-c370-4dd4-9b29-08da41fea41b
x-ms-traffictypediagnostic: BN6PR04MB0740:EE_
x-microsoft-antispam-prvs: <BN6PR04MB0740D67A1585959ED2D2788EE7DD9@BN6PR04MB0740.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DEx/3AOO4bSqmDl7r+fZDR/0PI0B70/+LGyQu1Yy3josk709iORQ5MBBCDr3D4c01I8fLbnfj+u10cCbfm7dD2SrKbNvzSH1meG98KqftFTrsNN04WQHQregM2Wrn7/gduozYAgn71eTJuwT4DxC/BnCinw1P8H3SfQIwQbydyTezgsFX5BtytnAnwi5nR9+tAaWsAE1naVa+yH6fwqp3TUxY4/NkPY2GL0CjjDt8ZFXVck3LM+OmsxQNw6afAgmYAnOsDGRNgV/2GGwIq3UfPYvMLDME+FaD5jeksAPnlgRgnlq6YT0DEQroMKItLfeeYoGgEhlEpkrVlqyBE5UpwmIteUMX+X6efiMGpfDhI1Zqeikq6iOrqsmxJ6jt7DayZxCz9CzcB6GiEiGCEStXc7DnZZ+WwG/izIgSZTpDBoXNEA92HrkWF+meRbN6iHwVwTWWJOgCFKUSZgSvJdq6yMM6xCZye0ZK13SBuqHvFTQaCSXSfoGbJK/WYbHMFsxLTZvtFCcXl+R6xtykBi3bRyhLCIjqHWkrQrHL7whLqW+pGyYPQNhpnj9eLSxI45AR2/7W5yY2dAYFF0G8PXz12BTm6nQ4YOryUmS1LvITCiZgaeuNlFQPxgLiKwSsE4wih92LjhiGB4vG2mvhpYx4t0iPbi+4XlV6//OeoGkiS/KEKb8jH85eVxN/zIZsZyHdpIi3lvEhv9ghb8YCh1h1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(38070700005)(86362001)(53546011)(55016003)(186003)(2906002)(33656002)(122000001)(26005)(54906003)(6916009)(9686003)(508600001)(8676002)(6506007)(7696005)(66446008)(83380400001)(5660300002)(82960400001)(64756008)(4326008)(66946007)(91956017)(8936002)(76116006)(52536014)(66556008)(66476007)(38100700002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o+mHPgLllwt1SJynslAD5JWZte/39CCJ7gH/gDLgIDjtZcdHeJkEv8Caa7nA?=
 =?us-ascii?Q?mDtYaQ8laZnlee9+sTG2nLF8rrTTFJz9ry4LuQR6pW5MJ6cRKS8SE+zlKhKD?=
 =?us-ascii?Q?YQwZcAd0tKm3zRilQWUChDGGgjjl/C3EskjmDOafBP4b2loeOecu2sW+lkuf?=
 =?us-ascii?Q?crzVHDZFtCe0Fenqs0aUCfTEQFnCm3UK8QY7Ms9IdGOn9ElHFEVkC6aI/q61?=
 =?us-ascii?Q?wcuUp3iJdZkmHGkw8y5Tb1WrEwsJMped9LWh6To2AMZ0d3RYL83eCr47E+z3?=
 =?us-ascii?Q?Y3ghnGzTQSsNiyiJaYFnqCAGALbPpwZQq6H6Ve74neM9DMX2UeWmQ7sKwSo8?=
 =?us-ascii?Q?Sw46hPJVC9lutGpUX+LRTA5lRSYnau81EhwLZwjkg0K6a+ahdBjbcGjmpp2R?=
 =?us-ascii?Q?9GLn1cSrysPO+OEIUhlrWfC2coXWX1cKqTiw+fhKIu9BcLtIA+CODs0R8i6l?=
 =?us-ascii?Q?SSMy3MKuXXKIaz2nTGACeRtE0Xup0NynowfpBCNOTuZN53oww21Nt2gB7y04?=
 =?us-ascii?Q?xZJwlefv6kDWRIlnk63sphPyPnhbiEmwzol+aAzqdgRpQIPj7sPDG7Ko0hqX?=
 =?us-ascii?Q?W1tI5wDKiL/P4SpHqwfUq7DSnpMrYJKESBhcXP0Ky6NS68N8NGwPBtYlMG0L?=
 =?us-ascii?Q?JFUnLHTn+3lFk151Xgfyu/kcaZFG0C4Jqs899dD4/37H4T8uvsmu+wfaY4to?=
 =?us-ascii?Q?S7IWxP0amy5UEC+kQiMsVSvHQijKWeOl9SjLuaqZ4RPoa8yT77R3UqKqPVS+?=
 =?us-ascii?Q?dWTn1syKiDcjOnZFwIi5XOK9Wv9qt2tgeoXusFEbeciMAQe1YfLH2N4r0AFk?=
 =?us-ascii?Q?Yr4D9jHf2mgBfZBG11OTU2A3vg8BXHFnDemwm8verynT/QHzmm5px47tCblp?=
 =?us-ascii?Q?PP/Qs8vFJRQhXJhbSrjlr86MENFNJXRBFBP2V/MCUyV5BbjeKuWvdv48UCNb?=
 =?us-ascii?Q?yqE3iF3PSVLR5aMTdIDTZ8LdCYPZ0YtLsmXyuEvDGLqdp7ote5FH5b4tqhQj?=
 =?us-ascii?Q?D88Xa63DpxKgKxpfId6BJsrxeC8GzRtdZyf5ZG67fkhcIc1aTSN+nkcj5eqE?=
 =?us-ascii?Q?0F60K5CVjAHP2WvEpZwILaorRQm+1TkSfdAIJ1kBuYT7cPwX0dee4bozusGy?=
 =?us-ascii?Q?AQD5uqmrnKnj4MsfeKlxHE1xEImY/n1HBuJ7bs7uptbl4/L3F34W8Q7xSc7M?=
 =?us-ascii?Q?YJDitGgF9dHsKuXUkZkiQuTnKDquihKXssgnJk/HZuqboeS1tyXPiiH8oWgE?=
 =?us-ascii?Q?+Jk5cWTMEMJRGG9qt6lktna8Dne0x3LDVfDpZhwUvybu3+T+yrKxkr7AYShI?=
 =?us-ascii?Q?bIWp9QCl8ugpri/NEuIPSbh+LEGz5hEl8X4GqnTuPtJK5O1Nml+R9gseXLCB?=
 =?us-ascii?Q?BAjMZAFTfz8bA5BDRrV8ByGvolq3bEMyeIE0NN1r9sjyKrmEubvTPCGOaUal?=
 =?us-ascii?Q?mMbOI6B1QUFck9MRXSW1D6RkKDIvfubGOvokvWDzeFZzQSkBsR920LSDOswZ?=
 =?us-ascii?Q?Em2wWgANDrZGGL8jC1O1TpPaAI8+aAkazwIWkp9vaW/r6zxqZZkHbpAzA1aP?=
 =?us-ascii?Q?Q+pX/IAsLba2aQvIJEvSotty53w3G82yJjeanQ5OjWCce9O5mbefsU1FhZWw?=
 =?us-ascii?Q?6NgNDq2qiWWwL41AWtzcyPC9jyGgwlGVA9xkWY5ZDVc9zv+yILgiksn2kzuP?=
 =?us-ascii?Q?wpt2uwIsnsimx23IXradpJw8qnppoAwC94hG30QBjzuoZZDx+NZcLH6kLQcj?=
 =?us-ascii?Q?589Uj9su19UCYl2kXEihPrMB2hcyD90=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed949dd4-c370-4dd4-9b29-08da41fea41b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 05:38:35.6492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSxf8z4XXYDiY3P8Iyo/RmvN98FXxaveziwIDJqM38MEWId5eG0Hi6XYTS4IyPldoikQr7qk1BasEQKyNYmvNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0740
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=142e1760f=Damien.LeMoal@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/05/30 14:09, Sam Li wrote:=0A=
> Hi everyone,=0A=
=0A=
Hi Sam,=0A=
=0A=
> I'm Sam Li, working on the Outreachy project which is to add zoned=0A=
> device support to QEMU's virtio-blk emulation.=0A=
> =0A=
> For the first goal, adding QEMU block layer APIs resembling Linux ZBD=0A=
> ioctls, I think the naive approach would be to introduce a new stable=0A=
> struct zbd_zone descriptor for the library function interface. More=0A=
> specifically, what I'd like to add to the BlockDriver struct are:=0A=
> 1. zbd_info as zone block device information: includes numbers of=0A=
> zones, size of logical blocks, and physical blocks.=0A=
=0A=
Virtio block devices only advertise a "block size" (blk_size field of struc=
t=0A=
virtio_blk_config). So I do not think that you need to distinguish between=
=0A=
logical and physical blocks. However, for zoned devices, we need to add a "=
write=0A=
granularity" field which indicates the minimum write size and alignment. Th=
is is=0A=
to be able to handle 512e SMR disk drives as these have a 512 B logical blo=
ck=0A=
size and 4096 B physical block size. And SMR only allows writing in units o=
f=0A=
physical block size, regardless of the LBA size. For NVMe ZNS devices, ther=
e is=0A=
no logical/physical block size difference, so the write granularity will al=
ways=0A=
be equal to the block size.=0A=
=0A=
> 2. zbd_zone_type and zbd_zone_state=0A=
=0A=
As a first step, I would recommend to only have the zone type. That will al=
low=0A=
you to not issue a zone ioctl that you know will fail, e.g. if the user tri=
es to=0A=
reset a conventional zone, we know this will fail, so no point in executing=
 the=0A=
BLKRESETZONE ioctl for that zone. With the zone type cached, you can easily=
=0A=
catch such cases. But even that is actually optional as a first step. You c=
an=0A=
rely on the host device failing any invalid operation and return the errors=
 back=0A=
to the guest.=0A=
=0A=
Once you have an API working and the ability to execute all zone operations=
 from=0A=
a guest, you can then work on adding the more difficult bits: supporting th=
e=0A=
zone append operation will require tracking the write pointer position and =
state=0A=
of the device sequential zones. For that, the zone information will need th=
e=0A=
zone capacity and write pointer position of all zones. The zone state may n=
ot be=0A=
necessary as you can infer the empty and full states from the zone capacity=
 and=0A=
zone write pointer position. States such as explicit/implicit open, closed,=
=0A=
read-only and offline do not need to be tracked. If an operation cannot be=
=0A=
executed, the device will fail the io on the host side and you can simply=
=0A=
propagate that error to the guest.=0A=
=0A=
See the Linux kernel sd_zbc driver and its emulation of zone append operati=
ons=0A=
for inspiration: drivers/scsi/sd_zbc.c. Looking at that code (e.g.=0A=
sd_zbc_prepare_zone_append()), you will see that the only thing being track=
ed is=0A=
the write pointer position of zones (relative to the zone start sector). Th=
e=0A=
state is inferred from that value, indicating if the zone can be written (i=
t is=0A=
not full) or not (the zone is full).=0A=
=0A=
> 3. zbd_dev_model: host-managed zbd, host-aware zbd=0A=
=0A=
Yes. The current virtio specs draft adding zoned block device support adds=
=0A=
struct virtio_blk_zoned_characteristics. Most, if not all, of the fields in=
 that=0A=
structure can be kept as part fot the device zone information.=0A=
=0A=
> With those basic structs, we can start to implement new functions as=0A=
> bdrv*() APIs for BLOCK*ZONE ioctls.=0A=
=0A=
BLK*ZONE :)=0A=
=0A=
> =0A=
> I'll start to finish this task based on the above description. If=0A=
> there is any problem or something I may miss in the design, please let=0A=
> me know.=0A=
=0A=
Supporting all operations will be difficult to do in one go. But as explain=
ed=0A=
above, if you initially exclude zone append support, you will not need to=
=0A=
dynamically track zone state and wp. This will simplify the code to give yo=
u a=0A=
solid working base to build upon the remaining support.=0A=
=0A=
> =0A=
> Best regards,=0A=
> Sam=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

