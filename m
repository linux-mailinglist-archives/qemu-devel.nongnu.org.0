Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74222FDE70
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:05:29 +0100 (CET)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2OPg-0001k0-F6
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1l2ONN-0001EI-Jc
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:03:06 -0500
Received: from mga06.intel.com ([134.134.136.31]:6073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1l2ONK-0006e1-EY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:03:05 -0500
IronPort-SDR: 6E6JMquR5GmPEOc+MFlDWVMrUTG3l2b9f9sVgzzHiWV2JZbUcuqNT4uoqRW+Ub5U1izGJHIu2D
 mfmZb/usTLLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="240740695"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="240740695"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 17:02:52 -0800
IronPort-SDR: v1cHDiLBAXBNtZ1JCUjRNvkcAiTUVjX2zKnu9un+jUg/hhuK39Xwh0jz6i3+5boxZT+IZ57XGG
 8OLRUoTNf3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="354501644"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 20 Jan 2021 17:02:52 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 17:02:51 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 17:02:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 20 Jan 2021 17:02:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 20 Jan 2021 17:02:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkvWdIedvZe3ZCCc/demXOq6lA6MlecayrQhNDMalMyqn6kb5yiA0bZ7SW2dF7PfREUG1TsHftaCUbu+tMd8Y4RaUi8UrEzmnou5XSu3Vv1V1gshLg/x3wuhdhhLYPbvUkxYTMLRehnHlmm7mY0/dZ2tW8OkvfqvjzEY7Gq2IutIG46igFRS15JkLmBrMHaS8w+a28QPVeNE32bJaltUbW39cwk/opPTD3DtaYPhR4P2D/Q14VLs+2+CtwU1o3908FICNW44TGPqrl7ajV9F0Xf66G9LQ2tR0+mBPMZ13HPR40EIIbsEPXIvrD6S6Mp/HoeRvR3dSKa4zj2yytHd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8dI1iLXV15PPeeJ61AmUO6JgjbUfoSVZRaVEC1px2A=;
 b=BlaSpxhcdDCizJyug5F8rmbUgnu5vujGRWPWLLn1zp89TLFITzLpIhb2azgaX2tOnjxlrZLUsdKnFgqNnKwVCyjTt7Z+CKZDcvd/dolS4xrrq8zfRZPQVXi/tuDIiJml2kEppEre4GukDJeRmQyloXOnhw4yhOvX18sQfWydsEoArm79Ub/5MR4aWy0nXoILef6UUKTEoiezBShaFmS4UVE+in0/F6+EWf8kVX85SVTKwG8gxubva5hgYZV81mErFEBlQbs2/0e3HpyzmKKSBCpnbXR3KU4OjfuMPm8AuIIeTp2fNUU/jRUkyO67pt21blkkrDuJ6PiqVNNojhW2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8dI1iLXV15PPeeJ61AmUO6JgjbUfoSVZRaVEC1px2A=;
 b=C7PVLdmcsQE7HQdisBfHWDkJyuPueIcVPQvG1U8RXtGvCynG0aFkto+2fwdVLfXa3e+orTmjC5JiXAAYl1Ea5/rw/I5GdgMF0CtSs8FqgAeT9zQnQqYTKbG8JX/PsKzh8KyDktoObDTogU/K6ndII5tJ//4HnpEDwARzprbTjEs=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SN6PR11MB3344.namprd11.prod.outlook.com (2603:10b6:805:c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 21 Jan
 2021 01:02:47 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399%3]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 01:02:47 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 03/10] Optimize the function of filter_send
Thread-Topic: [PATCH 03/10] Optimize the function of filter_send
Thread-Index: AQHW6VdKQKYfC2Q1vUKgz4LxYWGvQ6ow8DaAgABdthA=
Date: Thu, 21 Jan 2021 01:02:47 +0000
Message-ID: <SN6PR11MB31031FAC0E8C1884AFE197B0FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-4-git-send-email-lei.rao@intel.com>
 <20210120202128.371778ff@gecko.fritz.box>
In-Reply-To: <20210120202128.371778ff@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13cffbbb-c249-44a7-bdba-08d8bda8446a
x-ms-traffictypediagnostic: SN6PR11MB3344:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3344C633555B7D1F1FD115DEFDA19@SN6PR11MB3344.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rbNT5jCH3WY3u23+JGxpUhn2I8hNcyeMgIjt/Zo/JI/t7dgWSxDEWe/1YIRc6mURW3y5m6r8IucJgH7iED/ol7Gf5QnwU5a2e0nvdTnw26tWQFvbaz721coa0HSF5kMXjhsDb3luEGVmwiLIkVaeQI7uHYgeSMXXdA9sf1erAZ6ozGB0uBBUjVpXb4w/TFCA3hnMhB9IXV9aX4o3e+KbJWz659b+QhOPBQrYt3Af5NMdZkmT3AsMM6oBmdEQ8avxuz+vjOZFWYzVM2uwN0MwezspEpVlQCr7f8hxDSHv1gHZJZr19+SbYSTQJddDKQGgo6Xhl+9X+EhiaH//kkYrbPBJjlYPWZQjUmPx4j36sVJ2JLkRm8Q2TAECI37Cf4Tu454CKjU9US3YtwzMA7342A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(8676002)(86362001)(26005)(8936002)(33656002)(9686003)(55016002)(66946007)(186003)(478600001)(64756008)(66446008)(66476007)(53546011)(83380400001)(66556008)(76116006)(6506007)(7696005)(4326008)(52536014)(71200400001)(2906002)(316002)(6916009)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?85iklo7pSZxAen1qttbCMirk554s15rusl/d/bZP8hizcxuBzw71SEd9CUou?=
 =?us-ascii?Q?Djo1E74jzVDecifgxZI3+iDgUa+J6eqpn5bkhTAjKDLJxl5pJBwbgRrvPK4j?=
 =?us-ascii?Q?HOlxEaB+le7cVIFIsfzjKZbX86GmyW7seo6lztUKD5JP5a8En71sGS6qAcxd?=
 =?us-ascii?Q?axVlJzh+yajKW3KsX+y2jaev5idqPGNg34FsTmx0J6fSfSaE4HgzcyoQOvC4?=
 =?us-ascii?Q?mmZI1Lm21KUnufkzOAQ+FzPkJbwkOaBwINhJJ87RIXIShqXkuNcLQ9Jh5p9A?=
 =?us-ascii?Q?/pheSI/oHy7I9kLWddC/EB7a4HtZZIwNwTwT8nk7LPMNfhbyC/9aMnTT+l+x?=
 =?us-ascii?Q?e67XPPdjz7AQCKbACujkEv+6Q1aNTM7MRj4rgw5OrZHf4t2BTpKI9Ohmy65+?=
 =?us-ascii?Q?st4mdNr57ox0hcacNaKtX2bxZBulQpeer6RqNCXe0ySITT70Pozqny1xrden?=
 =?us-ascii?Q?7Rvh8Z65KcYRc0+g1VMcp98jkICBVeSihgfiR2b1ejzd216u+GaR0uFhhpZY?=
 =?us-ascii?Q?bsJYwsMDyW/eEFOfrl0+gs1FgiJXR2OKmBSkjeIBpv32BfTGq37hE65VHIxI?=
 =?us-ascii?Q?cy0VJG6nM3qp7dCqEu1rPv8k4oemH/d2Z6wClTnpLSRunnXU5dklcT+/I5KL?=
 =?us-ascii?Q?pdp6xgAPD7Y9QzC/bQxJU/bIpg5hUtBnnwNryTwZqS8h2oXyi2TcM2utNg4s?=
 =?us-ascii?Q?oBQrCOiXdw+lS/NMSDV1D0MXbYS1S++NKypUChtXpKNXULapapqYQtvvt4jf?=
 =?us-ascii?Q?QfLdG3X6Ce5SqwWw1h+cIM8/QZWdssY4nhWCKhuqs3ncozQkqWE+Oa5PoTAM?=
 =?us-ascii?Q?VsxCn1eQtCKY7ImWv6cY3OnEXZjZMzEGgBv4N15tbKi5S0Afbx5aSd+LLRnr?=
 =?us-ascii?Q?UBv/xyKrACb9sD559J0brbB/WUiRUwlrBHLrDcPsuhrXhzdSQNQccupfvYtK?=
 =?us-ascii?Q?pq0dpeVQX0Ey7nNEWuCQgPBvnD+pFNBkIzA9CsseED0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cffbbb-c249-44a7-bdba-08d8bda8446a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 01:02:47.1677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6LYMrTXE++/qMEOc9Wgt5oQbhrU194HlfkDJzTC4YO1BaBOxS56inVuNomgNmvv+DAP42leBOLE+x5cez3vTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3344
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei.rao@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OK, you are right,  I will change it in V2.

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>=20
Sent: Thursday, January 21, 2021 3:21 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH 03/10] Optimize the function of filter_send

On Wed, 13 Jan 2021 10:46:28 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> The iov_size has been calculated in filter_send(). we can directly=20
> return the size.In this way, this is no need to repeat calculations in=20
> filter_redirector_receive_iov();
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  net/filter-mirror.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c index=20
> f8e6500..7fa2eb3 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -88,7 +88,7 @@ static int filter_send(MirrorState *s,
>          goto err;
>      }
> =20
> -    return 0;
> +    return size;
> =20
>  err:
>      return ret < 0 ? ret : -EIO;
> @@ -159,7 +159,7 @@ static ssize_t filter_mirror_receive_iov(NetFilterSta=
te *nf,
>      int ret;
> =20
>      ret =3D filter_send(s, iov, iovcnt);
> -    if (ret) {
> +    if (ret <=3D 0) {
>          error_report("filter mirror send failed(%s)", strerror(-ret));
>      }

0 is a valid return value if the data to send has size =3D 0.

> @@ -182,10 +182,10 @@ static ssize_t=20
> filter_redirector_receive_iov(NetFilterState *nf,
> =20
>      if (qemu_chr_fe_backend_connected(&s->chr_out)) {
>          ret =3D filter_send(s, iov, iovcnt);
> -        if (ret) {
> +        if (ret <=3D 0) {
>              error_report("filter redirector send failed(%s)", strerror(-=
ret));
>          }

dito

> -        return iov_size(iov, iovcnt);
> +        return ret;
>      } else {
>          return 0;
>      }



--=20


