Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E42FCED7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:12:52 +0100 (CET)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BPw-0007aS-0T
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=647c81a33=Niklas.Cassel@wdc.com>)
 id 1l2BOI-0006hA-2X; Wed, 20 Jan 2021 06:11:10 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:64481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=647c81a33=Niklas.Cassel@wdc.com>)
 id 1l2BOD-0007En-Ls; Wed, 20 Jan 2021 06:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611142196; x=1642678196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kOQKazLPOYJQYnWxw+vleMjU04BPLw2VMf9W6u7if7U=;
 b=gqHlua/OhFL9e9h01jounKBt3E0fwot/0iC9gaXvzgrzYdivVj4o/gpZ
 pbIDSasA6ohaXhbT/C+PAdqLTKAUzGIDVL/fT5DH4vW3i2/knDYDliYcu
 Exyv5FEZCRxqmoAybLMYVXRLEmsEYhrmnfDCUGkBjIjlDh2wGcDVxR/Bt
 USlsaV9/b4AtLUq6HwXUkTjxuszlBLotLHX1ynHengCglyJjEisj6RJpX
 2+SEy0xTaxi2MFN0r/NnaJ8BcBHrwma2ro28h821fhv7of8FkaViJ6vj1
 RUbMKZjEjRbKtBztt8JlRfnCXuS3SX++TUn7Lz7ztyK1CrYnQGEHei9RX Q==;
IronPort-SDR: 4lxqCysgDzOOIT2k2xoqPSG7d2Ec5E/Y68DM9+qj/eojKwFvyczzwg9iIqJkQzDOPA1ACevJFZ
 yR1cUgCgyrWxIuuLsc7WNRIlqxMM4IDVcvKzTUv3zHVL11G5sJnBQpUBmMHIZq+hUEsc3CzZgd
 Ag0M0+n0zxnTp3oTyGVIR91T8jcBiSuuF8hwCRvFuKiXkgFEhn1+5hGOBJDHjLMXNskCZjUK+s
 1LlD6M4+zyHwde8TLM6luPRpdaNKsrk6Ao4n+G5zX9xio67CJ8/chEQWo3aG+qV9RCUAx6Zj1Q
 qPw=
X-IronPort-AV: E=Sophos;i="5.79,361,1602518400"; d="scan'208";a="261858231"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2021 19:29:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpPLudKJbKrj000Qpt04Zb6CPGj+Xf2XPsgWhOASuWfR+PWdeHogzKp9F+S5TOb7eGA0fuLnw+YySgyqH0b+pqNfL8Tw2lO2S2+foXPnHHkWitfVEmxqWm6xgljYnPLqqDeW+ntay5PhpreTKy1sOdk9sX5sHcc2tLPi0aWzOUh/ZqmBaRjz+LmWr4VM1BRKfbLTvl+T4Y+39GJ38dlbEuVz8FiowAnQcb3Ej5gKoIL/cc/RITW/G4skWIYHWQ8TnjsYMbJ/38OthFhgN+O+/e8b9n6ewrn1G1jBgVrvcCqtoyyeEMvT+UpPkEg31Ds3nTLh4DPAxArINegE4GaPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvEUukBY9jziTRmysJjfDpJzjAOKM19dyVOEzER8+wU=;
 b=EUViRlpSzMKdv7+3TemHXjhlHAnHfblZQieYKIwPos/gzeMy4r4hH37hUrkOz0vQZztY3OrjHctKaEtMS8qxeXPkCCyYC141aFHL4JRPxh9sun9AXcr+hGRY0clKq/Sm4BePZY8kYJ/CvqjWB28ZlcLJiKte+aEVjhU1Zmni8Eq2A2/Kc3iMOjRQhRUOZfXT9EmmT/id8Mv13FC4D0mu1kwKYpmm+VYlBWDvj4JdJuwYpm/t6CoF8FgfoHmEW4AqY7W7nV2W5oMXF3V0l+UD8N1GtMUE98aqCufbFd86kNCwSSP5xkOg4clo9GloNK6OlbAsshglryDYwXzwR5DDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvEUukBY9jziTRmysJjfDpJzjAOKM19dyVOEzER8+wU=;
 b=YSHhI708nxo5enJuBDpNlkxQ2RL2/A90Kjjo+GLTh3OeRL6VWHH17xYGonR+138bwOhnPLyL/abFgLDZNw+yYgvJ7q2qpPSw3lFNLAWuEvBx08MVfSJ5xQagSfe2wR4AhEaopMC6PC1b5JsQjbeuiUi3PD6dz1RDOxGtS8MgziY=
Received: from DM5PR04MB0684.namprd04.prod.outlook.com (2603:10b6:3:f3::20) by
 DM6PR04MB3865.namprd04.prod.outlook.com (2603:10b6:5:ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Wed, 20 Jan 2021 11:10:59 +0000
Received: from DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::11d3:8b30:e11f:87e5]) by DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::11d3:8b30:e11f:87e5%9]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 11:10:58 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/2] hw/block/nvme: zoned fixes
Thread-Topic: [PATCH 0/2] hw/block/nvme: zoned fixes
Thread-Index: AQHW7xztlEs7ph6PgE2T2AR06NgElw==
Date: Wed, 20 Jan 2021 11:10:58 +0000
Message-ID: <20210120111057.GA126026@localhost.localdomain>
References: <20210119135500.265403-1-its@irrelevant.dk>
In-Reply-To: <20210119135500.265403-1-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3021eac-a0ef-4b79-5a82-08d8bd3410b7
x-ms-traffictypediagnostic: DM6PR04MB3865:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB386541AB814E09EB4B1939CCF2A20@DM6PR04MB3865.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zFp6md06NBgSxh9IwxesFF3ktwoSP5ac+vevxhE9hqm2bsWAXNDP5GJ1JcuSRvA3u6bHMYdGxdMEpfiomlL/OQqY/5cIf1YMACv7/mGVAqUnWGBR0nrrVBJz04fyoCs3SIzyh4qoN0+ZlqQlzBaOZnlJoogZVtvll/EbQyOQrdmJruHjkYu/NmQLOeLFPQ7X6cTRAlOvjo7q1d/JyG2BjlTn6r3dnhigTYkhVlAR56tTwvzIP66puicciIGNKpT8JB0qZ6V4i/SH3a2ll4opYoFYzGVMSJb1Pqymkkhu6bnMIeto7FY9+b7q5Y+TxuLCOx7b3Aw35Ltu66VcYOVkumJpt2VL/wjgCdJZv0nHim0arOsS7NqxxqyoL3vlkf9b2hqi9ZIOs8Rt0tmi+RzY6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0684.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(2906002)(498600001)(1076003)(33656002)(9686003)(5660300002)(66446008)(66556008)(6486002)(76116006)(186003)(6512007)(8676002)(91956017)(71200400001)(4326008)(8936002)(4744005)(26005)(66946007)(64756008)(66476007)(83380400001)(54906003)(86362001)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pYRx4SEt7TTHt4td1wN1Kr/UlQn4yTdasqvdlyiuMYsBQysRNdeGohuBFQDs?=
 =?us-ascii?Q?EuhD0UGND4hjY2t2hdDJ16dDzfDPdNO59jSHj9l3vTwo0GKsF1+rFt/GHcyK?=
 =?us-ascii?Q?x9Z475uQ2ivkiIeRAAQ3KEHfD1lhSwskTxZESOZfc0Dj9PCVDm7JJkQtss2t?=
 =?us-ascii?Q?i7Umcg+4s/2zQ+me0VwHTw4y6E1V2u/5gsMH3gsla8k3ju7ZjaL9bGKJzSOV?=
 =?us-ascii?Q?iOPeKo47WPqLsCjNjkhfZr9HpXP4y2Zp0NN+5yAXII92/GkFHu1Rb7MyNbPR?=
 =?us-ascii?Q?GomRPqmslOuPOAPFAJLMX+/GKKepOl1MzK7Fjj4mbtCF9qf8uwgRJ01QgXfv?=
 =?us-ascii?Q?b3nq/8SpnukHTwzz82z9LGf/MxKgTik9ES58fqBfHkM6QGTkCGtQn82Kghsq?=
 =?us-ascii?Q?r8DSUpxYaC+Y5GUSJtRg+OSuFVLX1gjJwmUCSzXe3hLiGPJYn1qIvG6ZO0lk?=
 =?us-ascii?Q?YR0ANrArpGp3g6yYFW+4iGVHF2aYOYRBYH2a3nBPWL4iah+u/Rq5DIwEATS8?=
 =?us-ascii?Q?x+3jZuWt1PJz9yVYEJKUAZE4gSJZPbaPvHiXohWY7OZmV6FDldcMMFsWb0bi?=
 =?us-ascii?Q?K/X04ujEj9EmeQj/CW+uoeOKFxf70USDaVNREKnYvX0UUMkL7qnwPgitkxM4?=
 =?us-ascii?Q?oYrWZet7yyOWZ9ZR3US4aOmlyzToIzzWpLeldm3Mtu5gwpELB18hC+jAIKgJ?=
 =?us-ascii?Q?U+987ImyOW3UGxeaE/zzkAVh8VKo8FqtqQ/lpmQEltUPdnbSwv5jZS6ifm5n?=
 =?us-ascii?Q?TpDy5/gVbgURyxIPXTMWaigEPsYp7+PphQGbxADf5bGmoYmmcJRPUI/sicXd?=
 =?us-ascii?Q?/+SyKaLRYSptrx9UoiyxoHW1nNuGT4W30wRNgkB7JIJhdTD8FYcm6Sa6wUh0?=
 =?us-ascii?Q?YxNrIWoR+ekdlJJE0rd4BsG1vfcPa2gzoa1JuU9rb0eALeJLw3vgpM6xmiZC?=
 =?us-ascii?Q?8M1MGDxu/An7BbXSLP0Fl6Ol9GzKKDue+T7wDekd65vQoTdmenOP/yN2VZYZ?=
 =?us-ascii?Q?eFh4?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <968DC73E45067543838C38469E9E9D37@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0684.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3021eac-a0ef-4b79-5a82-08d8bd3410b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 11:10:58.8676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TGyBFgoG9rzvfQVaLBnK4OlKs8sByJ8NwTdG8uxtq0yT3t+eOD02fdGg2+GgpLMbgndrZQuNBcyr+dLQUcsnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3865
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=647c81a33=Niklas.Cassel@wdc.com; helo=esa2.hgst.iphmx.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 02:54:58PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Patch [1/2] fixes the zone append bug reported by Niklas. [2/2]
> refactors the zone write check function to return status codes in a
> different order if there are multiple zone write violations that apply.
>=20
> Klaus Jensen (2):
>   hw/block/nvme: fix zone boundary check for append
>   hw/block/nvme: refactor the logic for zone write checks
>=20
>  hw/block/nvme.c       | 89 +++++++++++++++++++++----------------------
>  hw/block/trace-events |  5 +++
>  2 files changed, 48 insertions(+), 46 deletions(-)
>=20
> --=20
> 2.30.0
>=20
>=20

For the series:
Tested-by: Niklas Cassel <niklas.cassel@wdc.com>=

