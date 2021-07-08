Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D63C1B40
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:53:14 +0200 (CEST)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bxI-0001Om-UB
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1m1bvP-0008JO-6Y; Thu, 08 Jul 2021 17:51:15 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:24014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1m1bvM-0003q1-Ai; Thu, 08 Jul 2021 17:51:14 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168LlA3p030749; Thu, 8 Jul 2021 14:51:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=PABJ514k8LUMkm2km8anpjiqNOACe+QoC3fT0/crPZc=;
 b=1itqS4ug5QSFpIj/TGZUAzO4KFAkMOqCgpxLEs8l/Xs7nuDfQ5z9GoIlgQeSV4uoOLK+
 ahtnR5DNPNrYApzrvFgg7vAbH0BBT7AijUcHZAKiYZdCfyAHWKqlVACEkUTOKQiIJvZB
 cueD5sPy4drroyli8C81mep4RsNtfeQ9Y5YULSTNIu82GQSoBwhiQ5kFQTWKzpSy++Fi
 SIWVCobMv8DDcXofE01TrpXSFYCbGntij7lDva367G9zrFsrN0rOBQOq5TUCOvPyhIoF
 7MtPzVUD398lLGulm7swIgOLxOLzHedZB2oVk6rxT+EmgUTJEPfaC2KEOaxibdApCwTn uA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39n9r84375-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 14:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIME26nph9yKE1Sf4dGefNd1+7GBhk8b/0k4LbkxszAncdAXx5UTwSboJjs7L9Wsv6WPgg9hpaPPJPKB9Of5i+RXEs5sXLppEMePSbnWNA9A0bY76GhFBoJcpqc44mdL1zeopCO0v3XxEatewg6RuPmju8angPRBpXHGU35H3JhN6GSqlgpspN887fv4B1WMlt/GNuzBbR1i3v9XpE0V2MeTPpCFLl3QHePihkCGqpEGl8NY755sEMzHwn49617Sm6uiz2RcxXchGeEwNaeMdrvUBGVhBMYSAj0EWVWR8rd8tyaP046+f199PEdWwxEssSZocH2fGG/bqlGCQA+TkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PABJ514k8LUMkm2km8anpjiqNOACe+QoC3fT0/crPZc=;
 b=Ql8tCYpQ/YJxWsMGUKxBEE5wMvE6apVxpVXLwIzpKW8KYnoF1D+FKHkCFXORDHnbguk57krL7BER/3wYcGdzHF82YmMf1dRXNIAkTeKMJHvfIFvf0u6HlBp+5kdnI5YzUxDBWeCgwO756FuJC0bYhUi5NOrl8x6V0KDzRcsBCe2AHp0WVrcRW1RUwtFHoSnaw/7U4gVn2PsGJGXjBzFEtO9n9PToKOVMhL/EU2eY8AEDgVPFJCtWKPRamSbh+HWE3BWtnFEeAd1LQHx+rt0tk7eayB2cGUsaVFqLRvZKZNBSOcSTztf0M87e8CCRfsw3BtZSUCrHsRX8mIvR/MUCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA0PR02MB7242.namprd02.prod.outlook.com (2603:10b6:806:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 8 Jul
 2021 21:51:06 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 21:51:06 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] vhost-user: Fix backends without multiqueue support
Thread-Topic: [PATCH] vhost-user: Fix backends without multiqueue support
Thread-Index: AQHXccFIffmZRh805ESYDWmHP8bL3qs5oysA
Date: Thu, 8 Jul 2021 21:51:05 +0000
Message-ID: <20210708215100.GA29901@raphael-debian-dev>
References: <20210705171429.29286-1-kwolf@redhat.com>
In-Reply-To: <20210705171429.29286-1-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2afbd39-22d5-418e-d572-08d9425a7cfe
x-ms-traffictypediagnostic: SA0PR02MB7242:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB724255139A5052966B33E88CEA199@SA0PR02MB7242.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cUxVx/XtuunyC0xdi0nlQ2CC1r9lBaaQTj91Nu/Z12U5BBAbxaxfUbYiAEdmiM1/SVUDCLUlTvfYyhKG79SfcDcTl0s06nB7kbRLNZyQNLkWYvk2BmUgi1GJtZNF5vO022XkIlFjhyF1odfzTbqAzgaz98Lrvqxd1WjBMPDHaoCrmvS/W/+A7NVdAICl+GpyF70RqMvyz1WBMTaWobC3Jci0gxmVBZ+SEvf01EXIv7/gO36VFuUHhcTGUxuNgLyPD2OpkZFPkBMGxxnpPTEo2ai6RDw53YmYpk76AHHVwyRRwuB3tROGCJGKAtWelhIvR1IzYg4Fsp6jCv99+3vQHaPfIOKQajAR4yxJKdmQTkcInOJ0h7iF15C6pNZgriySe0E/iQlI5jIk9LNfD91FAOa5BQv/OYz/mPqIeYFWb1Dhpr4rw5FVnlxTysE5INbxXisisBHGvn131M64c8tk2rBLlZQHkCzMz6nCTYgjwuHxfHKmSpkUN8PV+2q/ymUlzHUNNd5Dd0AHp8bCuQPuXbqaA/LuKV5pu+uPoJF9yB5w/TIYlQitjXAAYM+gQRwdHO+V+U7vmXtTn/vaxS8XeRKsZTlR53MmOWQI/vpOcvss4RgNcONwapkFweR5zSIYMoToeq2akjRwKRuI2lvzBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(346002)(396003)(376002)(39860400002)(136003)(2906002)(6512007)(91956017)(76116006)(33716001)(66946007)(5660300002)(8676002)(8936002)(4326008)(186003)(1076003)(38100700002)(6486002)(6916009)(71200400001)(9686003)(316002)(54906003)(66446008)(66556008)(33656002)(6506007)(86362001)(44832011)(122000001)(26005)(66476007)(64756008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VJFsatXQJeVF+hdtLxD4W9RQjr2XiGC1yn6/ckSpMvLVJUeFATpzdICe14jG?=
 =?us-ascii?Q?QqnGOQ6Ni4/lAOfj3+3SaGVT5r1yBifimDjTyN5vvkdFw7szDqUdNSkAMvEP?=
 =?us-ascii?Q?folbN0X+Fe3RFeYFOHOf/7wOUehG5CodBdzJZAA/Aq+88dqZwC8fpolk1ccD?=
 =?us-ascii?Q?WcySreygut7QzFVrkPp1k19+rFBDvoHI+WLRVq6HlFL+/+2cWzo86HAjG29l?=
 =?us-ascii?Q?9P648G5mda5ie5RqnWL6JJLGx/Ym2IjNOz9pe71v+Dke+W65+7wRILMuyvPk?=
 =?us-ascii?Q?c8sfSzpUiSU6WCd+4g2ItnytjhKY5uHvmfp/E6A8F1rvuGNjTuEi5EQ5xVyb?=
 =?us-ascii?Q?jpSe796NrXmfThkPbSZUvVWRLCO2m+0ioUzU4935Msjapth5r61SaRYJwpBQ?=
 =?us-ascii?Q?f+JkDrDLdMu35V2xPTFa7n5F+LhDCboZKASlH6mxTdtxgHP1UX+mzu2YLiVF?=
 =?us-ascii?Q?TCvdYskllsoTO51tvgL1d4Y3DHf/A8CixQ+lEWJPhV6bq7wC8fQx/TrrytUg?=
 =?us-ascii?Q?1vhbkxRu4tZ0nCtPsl8Rx8G9mMhKPCQ1OZaulLam2lqKlCyndQ2J547WHuOX?=
 =?us-ascii?Q?ArJpCS7ZKgIw2AHe/hSwIMUvA71lh2TSz5F/4TeE9C+gJPEE9xdi6Tb3t66e?=
 =?us-ascii?Q?20by8rj2P5YKt264VBE//AQ8Lcz7QecPS7R5IzzEa4qlcnATTRfifMyzBaC2?=
 =?us-ascii?Q?bLh8NVFG+Er8k/e8ODOw/EfKMvlKIzcL+O43Mv1KSJEPAX8wLw+++mIx+YTR?=
 =?us-ascii?Q?8lB/NU2NUoWAFgTRIatyTOBps5fa8MyAZJNrks33IX4tSMQVxFobqvCy4uVW?=
 =?us-ascii?Q?kGGPbaFy+uXDdfrvWvsWgo9kq6OrIFnqJdvKxFknSiDekrJ5TQkSjLhcQb9d?=
 =?us-ascii?Q?mKGt3ACJ0JyoXZ6ktR2I1IZDiDWKoiIn86+uMT2gsgUc/jPCTOkhrImAdPP5?=
 =?us-ascii?Q?ena/XDqaryOuvisW0TeFft5q5i/aomF5lwVG0Ym/2v7Ne9AZLHA3eoiSKYus?=
 =?us-ascii?Q?48m5Ck8kReUTR+yVYJEAb9eDAbpqwnTkyBimYD7370THAmKc3OaGoePTFhTJ?=
 =?us-ascii?Q?3OKbT1CKiF4hEFzfjWVbIWX+XnQCdMcjbIzqS3LdxO+k13xDvjg0u3O0TVNg?=
 =?us-ascii?Q?w13AICJ2o7/2WByilWYHTOGo0itJZLHKpmXa5oNi3bj+sAlyJ0vQdmw24Y6m?=
 =?us-ascii?Q?QV0Cd6YIyuptMsN0qDRouyTS7OLiDYB+1gtf22WyXIh4FZYqXnmPUPJjp64u?=
 =?us-ascii?Q?aiuh1URwhkxLgRAYRSu9EOcHcWg9t/A5CQh0zqerpo33sn3zf46FpJzgepV8?=
 =?us-ascii?Q?BcOe+shEq/nDF4MZpfcFxs3k?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8101FF8E8391E438CA421BE3AD44103@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2afbd39-22d5-418e-d572-08d9425a7cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 21:51:06.0091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42SL7FHRJtmISOGH9A3CuSs3hR0jVbTWOOlyqVBWN/JTlP9qEevSP3Ps9PgpkqI3TQZhGno49J8nb+zx7Pc5qLOzolpUK4ozewItjLmYw54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7242
X-Proofpoint-GUID: Vsnm6VhQ9AOuOiwnSD5HNziAJ60sAXax
X-Proofpoint-ORIG-GUID: Vsnm6VhQ9AOuOiwnSD5HNziAJ60sAXax
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_12:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 07:14:29PM +0200, Kevin Wolf wrote:
> dev->max_queues was never initialised for backends that don't support
> VHOST_USER_PROTOCOL_F_MQ, so it would use 0 as the maximum number of
> queues to check against and consequently fail for any such backend.
>=20
> Set it to 1 if the backend doesn't have multiqueue support.
>=20
> Fixes: c90bd505a3e8210c23d69fecab9ee6f56ec4a161
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/virtio/vhost-user.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 1ac4a2ebec..29ea2b4fce 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1913,7 +1913,10 @@ static int vhost_user_backend_init(struct vhost_de=
v *dev, void *opaque,
>              if (err < 0) {
>                  return -EPROTO;
>              }
> +        } else {
> +            dev->max_queues =3D 1;
>          }
> +
>          if (dev->num_queues && dev->max_queues < dev->num_queues) {
>              error_setg(errp, "The maximum number of queues supported by =
the "
>                         "backend is %" PRIu64, dev->max_queues);
> --=20
> 2.31.1
> =

