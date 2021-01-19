Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B512FB573
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:47:03 +0100 (CET)
Received: from localhost ([::1]:54134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oXO-0005La-3F
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=646214f12=Niklas.Cassel@wdc.com>)
 id 1l1oPZ-0008Hv-UM; Tue, 19 Jan 2021 05:38:57 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=646214f12=Niklas.Cassel@wdc.com>)
 id 1l1oPX-0008FU-4O; Tue, 19 Jan 2021 05:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611052735; x=1642588735;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=W/0OZotLAqaO1unacGEa7iz1bjPJLCYeFGyI2XbEfEQ=;
 b=Y6D/bFbxe7isINyrcZ2Vq7S4xdn1nOof4/AXKA6llw83ugHu6JuVTmTS
 rJo3mut8S1NnOiKZ8McOcGoy3S6kYEewLmzj8TyeqA7pE3dtZKhLQOgeT
 uFg+LSN2CZm2ikMDOKi31cK1lYVZ5PIXmM7BM+Fm1lor0IbmcDtqqhILD
 r0nJp0UQYR2nRyInl1hyQ04nuFyW0nuXsBQBrpMrUQTEHyEaht9VeXUPu
 /yDtKwMXO9m0TtLy3hrvpAnu9xqF+9LrrrJJ3jtwP6g2ucMk3gnJfYUjr
 3dsIvA0jZuyK2frUoXzlrbzm+jEVSD0ANLQHBL8dvDnEWU3jJZ3asgA8d w==;
IronPort-SDR: RUj+xWbnHjTVI42uPe3a4EPN/lv/wk0b/B9JkuhhC4KwwDLTeTJRtaAlu6uOED1GOgQ5hbaqw3
 iA6mPcN1AR87pUj/CXNmSEGll4fLz1YfDDfPvEtvFxDFRJry/fYu1QRyrMKhioFJXi5Au7yiGK
 2MzjG3hh/0OrLuYY4aXwIU/pKr5dEBdTQ49labeCoTvjl3xeKLW2SlrHm24uZl2OMsW7bnWmen
 KGOkQ/5q1CsNno795e9f5RI4hqglSxDqo5WXudHC4KgLV3upl7XnsG1esHLMhQPK50Ilt+XwCH
 mKI=
X-IronPort-AV: E=Sophos;i="5.79,358,1602518400"; d="scan'208";a="158965368"
Received: from mail-co1nam04lp2055.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.55])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 18:38:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex3oah/1qeADwl/Vdr29soOnTbjU9qjPC4mh/7aRVsMxX4kHl8SVg9MnT+5Xga1UuuTC1RnXLiHK9XIL2MYrC5GH4fi9SoVYvOfDa8gQ1Y42LCnxbmZL6bD4ulR6L0p1OYIAgUrSXgy6Enpv4Y/Cq179DH2DbIs2l9lC+LnGsFpRVnhggk20oZamnQpIDQ0wnTWhDrWHfsj6KgBpnlw5s8gSRZbxEvEbqZ1WWjFV/Tu6mXVolaEUHVV3c18JbWFXZ+3lDeFs5e/U7pL2FAouvjf7TfIAOo36eBg/YRbzfGKcvWAoMBuOhR6hIRuQD2hUEE3A2m7VB83Tlt2aO8MjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/0OZotLAqaO1unacGEa7iz1bjPJLCYeFGyI2XbEfEQ=;
 b=G7AMmd85MYkZaK14pHTGtE8juVLGKx7CpvE/JHqXgmwbNUAdpFxmfc6YrxjMyg675Ubzy2aHrITkoQO2iVCe+CDc0eZsGdBJ0+ATNx/ZWXLB4vqEYLuXKWKAnjAQ9oEayCbl7/xjzZAbADY5Z2mdlRq/fiwwOM6B7ZDseVu/3AG9eZ+jOR6bCv2yUkwi9af7HdulNZIlVQzCQgq3PJncH0FCnAg20HQfjE2NONQMPybRWEE+bt+M3ts/NRoPZ65/gSqiu8394XSG2xTb8veqMWLGOfGJs8VS8RFAYjPPESaSZpCGXoE+YJPkRQtZJI/WLaoIluEQdo/V5kS2MOv+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/0OZotLAqaO1unacGEa7iz1bjPJLCYeFGyI2XbEfEQ=;
 b=lYchahGDtGus/EQ3CjnEL82G2lY6ClYu6212HicWVBMjQ5FuWV9zBXL6sTnfIQSOL2t/V1btAZeeRePnYxp6We3NoHX5qJnVbZsfpCf/BGYiq7bdNy7t4TH288GEwo4RGDaDmZeWggNpSRa9WvfvmQ+9LcRg2EuDlM9MXs88Nzs=
Received: from CY4PR04MB0678.namprd04.prod.outlook.com (2603:10b6:903:e2::7)
 by CY1PR04MB2139.namprd04.prod.outlook.com (2a01:111:e400:c617::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 10:38:50 +0000
Received: from CY4PR04MB0678.namprd04.prod.outlook.com
 ([fe80::a0e7:ba2:422:c686]) by CY4PR04MB0678.namprd04.prod.outlook.com
 ([fe80::a0e7:ba2:422:c686%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 10:38:50 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: NVMe ZNS zone append past zone size?
Thread-Topic: NVMe ZNS zone append past zone size?
Thread-Index: AQHW7k9GHWaPD4RQa0CY96H5lakufQ==
Date: Tue, 19 Jan 2021 10:38:50 +0000
Message-ID: <20210119103848.GA92347@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc1d1d9a-7ab1-4cf2-8672-08d8bc6668d4
x-ms-traffictypediagnostic: CY1PR04MB2139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB21394E58B54218B489E332ADF2A30@CY1PR04MB2139.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qcbz9hERC6pTFrWwi9Pqrrza7SCykDMFkCCcH+CoudDJZ4mx/wsVsfxt7XoOJCRIU/noWuy77b0pHq2/5Yz0+hxcEdae572see/dMBVLnPeOjo2i2+AYJzFZh6hT7sJwbEXCVjrwSJKFLAi2dNmfbZot/WzZLOH43QE83Px+eqOGggx0SiJ2uyqGGtkyzxRyDX+BDfOTYh2o70cWjyPJ0Qpl4H7Eib6DLwuPG4twCiRzZwRIfr7cBrKFkKQ77t0o1eupRnPehlNkcAZJsPl/Ym+TGBu65N8c85hQO6aKhGzgYXbHL31Ja9R/r2Kq45qQSx+m6FbZiwleecwp5dN2fBkhslI0WhPkvdLoFn71U1vuEMBElepr2MWwscsxttku6UTUgrvTV+XZXB4sNWwlx/NzraYfGVkxer8YjV8p1Xp4+WPdHcANaiMrI/3nmlg2IpdUCKvoC/EPirg9hmMPUJt/yaWHAnTdF3mBU9r9AS1H3z7z6w8OedIf7G4BhPhlLw0pS0HkI6pV/zQvXAOVHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0678.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(6506007)(66476007)(8936002)(66946007)(316002)(83380400001)(33656002)(478600001)(76116006)(54906003)(186003)(6486002)(6512007)(110136005)(4326008)(2906002)(91956017)(5660300002)(6636002)(8676002)(1076003)(71200400001)(86362001)(66446008)(66556008)(64756008)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?g1ZJrvqwBTH8TOh1gNiJLyeDvmxdLBekYFVnxVFr/goi6n0O5g7fZ7jkpfnt?=
 =?us-ascii?Q?vC5xcnQQSfknsAUC8ZPGbXRS4wtHjXqknB76eRvMdWMcs+Wbx/W3Cr5TQrxL?=
 =?us-ascii?Q?JOp6Tl8PjyT/s6ZnFf8mfbNLZPZCYEpUdIvCHlUclvwBPjzfeOCbY+O0N7TM?=
 =?us-ascii?Q?1ASFDTqXWtLMh/X9wOrvZDM0CKdaC92AHoG0RmtwurJVJy52r5/O3Mu0oisb?=
 =?us-ascii?Q?695E1VCY5qyy6y6vpXpaPS1A+pZw03Ioxztkj3GdDp6B/kHhAN6r67fz8wJt?=
 =?us-ascii?Q?c9q1VzAWBZs+ar8ecIj/Yb2VhE1BdTELcYqnRXY1EWOckCiyCvFTXV5B0hi3?=
 =?us-ascii?Q?Nx25dVW41OwEzEOnuEsf9lhDEb71491gun0GjxtZF5Vq+X9eaZGYTvkj85W/?=
 =?us-ascii?Q?I27PjNP7/wg7f63pkNuDpwkCxNpxGiJ5SVNQA1VhhlOqtKQvsN2JGjmuparc?=
 =?us-ascii?Q?zTeQ8cNNY5APdcC2nAYNgKBL2PvZBwAFRxoQxSZFtLf5tOD+IjvpXSkwsX4A?=
 =?us-ascii?Q?kA1UdA0NH2dwJCCHcbEXDpQH4L0Tds5NgfK7vDeXNLa6zx5pYKJYrloN9P/g?=
 =?us-ascii?Q?HHYAZH2U/+nQFcXB38ALUpQVAui8qPVjjLca1y9FPpAcBHs7zLMD6jy7tjHs?=
 =?us-ascii?Q?tec/X7JsDPRhYKQArBp/jPtF8JHpfj+CH5+XI7BvnGta/S3NSh+xXUH7FrF1?=
 =?us-ascii?Q?9x9RVWNdzzSITyKoY5bsTi0vUPopfcJIKFVfzzGCeJ2thU1ebCSK1rs8uA4l?=
 =?us-ascii?Q?vAvKndIUab31D0ySbhFeKBs6koIJdKk3UzVADap4dRRbCqSa2lz49v9HDYHm?=
 =?us-ascii?Q?cVXhCW54R49XG7eLNZkKPHKL4FtHiZemVcVbrtiSjgnkF3z4hCVy/xlvaEdj?=
 =?us-ascii?Q?ZdP9CAqwfR+2IjLBPOLkQ6X67dILe0LnzMR662h6QUOxwlB5mgVcVzPHWMks?=
 =?us-ascii?Q?EfsZ3yOx2mQY5aCDAcfMuVZDnjK+7mpcyDGPk/dSF8YBl5q7xRC+yyalLzNJ?=
 =?us-ascii?Q?LsWp?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E04FE57F85045C4A838DA474D9856EF2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0678.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1d1d9a-7ab1-4cf2-8672-08d8bc6668d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 10:38:50.2910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCHoRCBqWYo8Cpb50ZbRQf/dhIQZRuM7+cLqRQfRlE8B+XcDVHUp3C6wURU+cw2DDGoRrTmErWJjA9VdiXOEIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2139
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=646214f12=Niklas.Cassel@wdc.com; helo=esa6.hgst.iphmx.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,


When testing with the ZNS code that is in nvme-next,
I can zone append, targeting the first zone by specifying zslba 0,
and then just put that call it in a while loop, it will
manage to fill up not just zone0, but the whole drive.

Since zslba is defined as:
"Zone Start Logical Block Address (ZSLBA): This field indicates the 64-bit
address of the lowest logical block of the zone in which the data and
metadata, if applicable, associated with this command is to be stored."

Should an append that specifies zslba 0 (=3D=3D zone 0), be allowed
to write into zone 1 (and beyond).

According to 2.3.1.1 "Writing in Sequential Write Required Zones",
we should get either a "Zone Boundary Error" or "Zone Is Full" error,
depending on zone 0 write pointer, combined with how many LBAs we try
to append.


Looking at the code, I think that this has to be handled in
either nvme_check_zone_write() or nvme_advance_zone_wp().

Considering that Dmitry and Klaus were discussing when to advance
the write pointer, etc, for several of the patch series revisions,
I think it is better to leave a potential fix to you guys.


Kind regards,
Niklas=

