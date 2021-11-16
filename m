Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111BD45272C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 03:15:25 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmo0J-0003pk-Jj
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 21:15:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnyn-00031D-Cj; Mon, 15 Nov 2021 21:13:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:29305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnyk-0002yA-U4; Mon, 15 Nov 2021 21:13:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220813059"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="220813059"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 18:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="735043996"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2021 18:13:38 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 18:13:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 18:13:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 18:13:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j43ljNObfu+f35IdCTbnV/igiQw2cT5y4SG0NiRW+gsNT/b+2t4+FzJ9e1vYJ0l+l69NK5ujx6DkIAtOVG6116q+JGGwba3F8C0iGFQz/bujW46zAFS4kVjpcRfGsOH2WwIDxQVkIfljjEXAmDATnACCpwMB3+CVfHuQE4xztbHsCbCrewEkdf3WT3gXtnmzWUdmM6k4FoNy1chjS0fPNvlOfUgctUbPJjGU92BkA7LVJ//Gh+A5dS1R8IwwC61ZJXtOzvTHsxVi6IgkIUmjwNeWWHznpf8hgolWm/nBQ6lgyjyOBydWlB/QL8jFstgHfWoQWQ9ScCI+nmlnNcXN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf4dLqZjrlaIAfKOUT7mlJnIp2mmd9rr3h6yXgc3pvc=;
 b=ho1jmddRDVj0OMF/D2srS5H0icR0xn9vVHHtrB+O6wnB1KvI3Gx7G/Ta5d1lxvnxMWaYR50LwJKOGlqSupTfOQtiAjNUE1Ev/l+Ze/9UPNeNUPlUGULzXHnocTZm+mEbFkuS1AsEAL4FAdWiO7t/YQsET9WcWCO0m5USSpAcuVzxUbZPRqCxx/hpgBPpddpGo0PbVwg5NN0igi8iSzQnnJ/ECVzUc6wNJnJhmj8kuUKPs3h60B+6XWWpOQ3Tvh+wLJs7fEiVK0GXVoVzdRgyvEcAMwmsiy5IvwmBuIC5hbcgltQegxW2Xf5tMb1hzQRwC1LXXgpExpdaRW1fxWFGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf4dLqZjrlaIAfKOUT7mlJnIp2mmd9rr3h6yXgc3pvc=;
 b=dUM6JE1LKwt5hI8Apz/DG6WP3gYAHYWHoVr+k6j5DJyVcxv41YBVxFk9Q1DxtEw0BoU7IVj+7GAlRPZi5T0o+/BwX/SLqoExHfSVHxnssT9ivLx5/oFcbfa3GVMmE0cFpz2U+J4HoXdqObLwOnUEF3aT61p9k2tl4wxPsLbjqSw=
Received: from BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 by BL1PR11MB5542.namprd11.prod.outlook.com (2603:10b6:208:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.20; Tue, 16 Nov
 2021 02:13:36 +0000
Received: from BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3]) by BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 02:13:36 +0000
From: "Qi, Yadong" <yadong.qi@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Thread-Topic: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Thread-Index: AQHX2dzbzzrtmm1d0kC8epzjRyQo16wEpdmAgADDApA=
Date: Tue, 16 Nov 2021 02:13:36 +0000
Message-ID: <BL1PR11MB5479F4FBAE85464A3BF94AF6E3999@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-3-yadong.qi@intel.com>
 <YZJuGbB7/5tqowm7@stefanha-x1.localdomain>
In-Reply-To: <YZJuGbB7/5tqowm7@stefanha-x1.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2941bed8-be15-4274-c95a-08d9a8a6b2a0
x-ms-traffictypediagnostic: BL1PR11MB5542:
x-microsoft-antispam-prvs: <BL1PR11MB5542EE5A3671B4448FCAA4ECE3999@BL1PR11MB5542.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lAJnnSPWPp5StjGsXMjziVOaQoT4eYbA/4doXkJJ+u5wfaUWGVx8TFsI1nvnF+pobexZhbdF8sksRZ4Gs0bwaQY7R9RaGFU6DTEpTB6EZQX3uziOLDTKWYO+VGz9MCr+/VvH1KcSQKfdarzskLD4uPYHhqrh4/plVPXkMo9bQ6q5T5ncQ5VlT8Yt7ktH/nzlHblBb0U0vOeW8Wp5aYEj4A4jHJ9mIZJ6nqp2KiUXVgTXUr/zV+y/a77+vcv+vK3GCVwqfU76eC2Q4h5OzSkxtraZKjy06cvmQT/XC/NMpg6tP8cdFR657fCp6SUeziaqhl6MptrgAG4c3cfZXcOjmSMy8LNC+SDuF0aVQ44gZ6kJKQ2uP+nqhrKeL7ES9wyzNEMwxbRu8W+u4YElb2u4gBIW7/b+k2YbS+lIdHbAs9EDrObExXdT7ZNpdtgSOjgWILUkoRAL6hb6NmcuFvypPfSzhQPgwvQ3yXVL0XsiHFNZIR2VF+XmBWppX8VeRRPmJATUGZZf+w/2h6/IroSSFg1YSFrEg5ZziFIDNiwYzbgaAy8MnIEYpFevl6EnTb3rgdhqaprKI1E9u4lPL+yurdhS/IMI+eCscG1vSdSl0qMKx8egzOMakSQKk4ST9F8D8IkoW5VpINc9gaWl+vkzjWOyaVPkvZLeVaZOEJHIIBryMXGJAHp6UeJNLDx9W/2tjBzK30W5bmOsPTKc31IXKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(66556008)(7696005)(26005)(186003)(508600001)(8676002)(66446008)(66476007)(52536014)(6506007)(9686003)(5660300002)(8936002)(6916009)(86362001)(76116006)(64756008)(66946007)(33656002)(55016002)(107886003)(4326008)(38100700002)(122000001)(316002)(54906003)(83380400001)(2906002)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?glmNrGrOdo9b+wWbdoKlog4yVulQLCWMaKGbyhGg3u54c4sOWzr1aXgGTj/w?=
 =?us-ascii?Q?alniSij+qq2XeCFcliY/g2dyzuNICO2piOlaR9zOoIqvwf2lGUuNJKdZy7Zj?=
 =?us-ascii?Q?GHVvSNkSukq4vsJHWatUKwCPPjAgQqyBMckZbZi2N7RNgpeqeBCYBFgVS+Pc?=
 =?us-ascii?Q?zODgOxticVhGxeI5G34oCP8Zkod9xgnH5Zd6zFtMdeo+RlwgUcrh2AVqhuKK?=
 =?us-ascii?Q?gWhG3fJkJCS0OM1Yrlltvs+OJhK0Xu8QzMwcPETLXGDtoA/dYAsfCwRt4HXB?=
 =?us-ascii?Q?2NtqtGlg8JMkEB7OJGmk6y1ItBflZE7a3m/MDvULgwwRUjBIKriI3siI2aNc?=
 =?us-ascii?Q?0ibyR4G7E7vZB4AxdDxiGV6A2OSv7sMMMzymoNYoi4EJlSiL1fjK5clRIRHc?=
 =?us-ascii?Q?n75RASrHqCTw+GASTI9eaUTF76aCTyy/KsSou1jI79ZHBopy+BI4zQ52zkl5?=
 =?us-ascii?Q?niDJp79iPrBPLnporctKDmmAdnZiMT0duIYT2eaRC1qo6dsaHcXWMi9Ed6Wu?=
 =?us-ascii?Q?dtZIuHJZ4EmI+PF72jClj4AcdwoNHY1Iv42CgEdUciiUxfjyFAmYhr00RUnQ?=
 =?us-ascii?Q?Pr0RkCUr6bC3u90qMpVmKWt3kkj9uhHUhHSKQNG5MlqZOjCJ6v8GeBwuVZzn?=
 =?us-ascii?Q?4XyOinH22PPJCrwmYhbxxE4FRZ4kxjoRBDLvQ/7WcMQCILeZF+twW+jGIglI?=
 =?us-ascii?Q?+YZJmNFer+NBoQYdJ6HhBujZp+XS9VJfV9JzjB7YcJrk5UEY+3ZD/iGifwj4?=
 =?us-ascii?Q?VnmrHheWnEalaPW4LYpTWu6qoYf7DQ0GUB8fXZYQQX00tsAlVgxmaL4VJ7rQ?=
 =?us-ascii?Q?0z2MT6r58lvbdAcg+B4L2nN1R0T7XL2UfSO9kH+7t0GRyHYA2EBn6c1IgHLi?=
 =?us-ascii?Q?m2LK/zyD2OtZehGVh/b37G5cgTmSVX5A7UBClizXKILaLTYsNLj5qjfdIU++?=
 =?us-ascii?Q?By6EYqhZYmPGYVgsMBiqZc5KQii55odTWFcIqX6KbTiGDMRr/j5GQ7czzA4W?=
 =?us-ascii?Q?KOdRmQypPuU0GUb9j/apkfOuPWxTDPU3EsjqrDE1THhNjwIK5q+MJCj9+K6W?=
 =?us-ascii?Q?gUPemr3BKSu1a7ScbA4XS7gY3khmbqXA7vNICdRlkalIzJ6kP+/AwyDhJ+zo?=
 =?us-ascii?Q?sOljWpYiWiJmfl55LFKyu0ZVIhaJi6Antb60Aog2ktTBPcEqTmkCrjBiLERa?=
 =?us-ascii?Q?3EPsV23ABxKfmfZSNbp51lfoaGU5NGG0elouSjFZaVxa6fAKHc/KjamsI6BZ?=
 =?us-ascii?Q?ckK63ZADj8FeP6FKbTAADZNxMJabjIBYC6b5zMrYd+HozUZ8PZGou6jNw46W?=
 =?us-ascii?Q?/Mk+th0CB41Me4H5zLBdBD/GbxSUTc2dRtDd4RMVLKgaCrIAlIEVIPD5L6ux?=
 =?us-ascii?Q?FM8GRh+9sp9GB7QbKOD3UECBOqZyxNWnVyp3dH5y4OrRUxMcVW9+9l6Cwnp8?=
 =?us-ascii?Q?v0/iJrP/0kJzwgSrOmgYwEByaRuSWyp40r3tV+kecupmrq79CtbiYOynwdLg?=
 =?us-ascii?Q?Fdislv6GdNxDdrmAI4ARTZwGnTKBvvVAz/EnZTBK0fGOyTjE09nKhFN3nTDB?=
 =?us-ascii?Q?gnNbHwHVP0P07zPAsFI8Th/pOURLDOm3e0+w9Q9A8fKMzDY4rU66fH0OcSWu?=
 =?us-ascii?Q?5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2941bed8-be15-4274-c95a-08d9a8a6b2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 02:13:36.3878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uCJ3x6TQHXc40YrK+ElNR0hvRX5ei40/i8DeDK66VlIJ8O7NQYnJ3QHr8lRn/dh882AJZOvetjjQLFNqAIzXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5542
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yadong.qi@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The Linux block layer shares the DISCARD queue limits with SECDISCARD.
> That's different from BLKZEROOUT (QEMU's WRITE_ZEROES). This is a Linux
> implementation detail but I guess virtio-blk can share the DISCARD limits=
 with
> SECDISCARD too...
>=20
> > @@ -622,6 +628,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq
> *req, MultiReqBuffer *mrb)
> >      unsigned out_num =3D req->elem.out_num;
> >      VirtIOBlock *s =3D req->dev;
> >      VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    bool is_secdiscard =3D false;
> >
> >      if (req->elem.out_num < 1 || req->elem.in_num < 1) {
> >          virtio_error(vdev, "virtio-blk missing headers"); @@ -722,6
> > +729,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req,
> MultiReqBuffer *mrb)
> >       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch st=
atement,
> >       * so we must mask it for these requests, then we will check if it=
 is set.
> >       */
> > +    case VIRTIO_BLK_T_SECDISCARD & ~VIRTIO_BLK_T_OUT:
> > +        is_secdiscard =3D true;
> > +        __attribute__((fallthrough));
>=20
> The DISCARD case doesn't use __attribute__((fallthrough)) so this is inco=
nsistent.
> QEMU doesn't use __attribute__((fallthrough)) so I suggest dropping this.
Sure, will try to drop the fallthrough case.

>=20
> > diff --git a/include/standard-headers/linux/virtio_blk.h
> > b/include/standard-headers/linux/virtio_blk.h
> > index 2dcc90826a..c55a07840c 100644
> > --- a/include/standard-headers/linux/virtio_blk.h
> > +++ b/include/standard-headers/linux/virtio_blk.h
> > @@ -40,6 +40,7 @@
> >  #define VIRTIO_BLK_F_MQ		12	/* support more than one vq
> */
> >  #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
> >  #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is
> supported */
> > +#define VIRTIO_BLK_F_SECDISCARD	15	/* WRITE ZEROES is supported
> */
>=20
> The comment is copy-pasted from WRITE_ZEROES.
Will fix it.

