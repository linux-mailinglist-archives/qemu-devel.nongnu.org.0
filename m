Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5835936A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 05:53:58 +0200 (CEST)
Received: from localhost ([::1]:32902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUiDW-0005mB-1S
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 23:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUiCV-000524-N7
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:52:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:44119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUiCT-0005fT-4T
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:52:55 -0400
IronPort-SDR: m8EGFoWHVDFqk1EyysuH0RYq1e/C2Lhz/KxCBP9eu37aj3Ps6Gxxq2Rc9kR4BTsDCmpGV0Tv/s
 Pp8A5+979Eeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173159551"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="173159551"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 20:52:48 -0700
IronPort-SDR: 1Jf3hcAOpdsKGcHq0X+MNoHm1WMtjfADaYOM/VRcMBR0QFOcBsCWB8JhpP7cg92COPQ2pUk3la
 5dvBDD3aFT3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="419385417"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 08 Apr 2021 20:52:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 20:52:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 8 Apr 2021 20:52:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 8 Apr 2021 20:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKnjg39+1sVUqasmT7qBjvGHX0AM2Q2RZGoafTfoNUgDz7rV5VTjrdgAkp30eptfu1yCdznbGbdObATCpxpTjuiRciOy2cnSh1At02m0GXv75nANaEcaUIduinEqembL3g2TsXhXZeJKtvjVHx2SCa5QqN+2aeeD7R0AGCP5LwFZDtEP0ZPA0FTtWc9bMcmgiu6MDd2eMgwguQ9i4tgdRGw7hceBkyeWIZezUbs/xq+Fyk/Bgk0TLFO7N4zG2Ix8FWSlKfcpuqpKYlbLQ7GvQ4h/cvfXHTS3yfbqD6jWRpTdcfE95sm6LBsZ7AAke4vkCGuGa2oOF82mkXFj/wD6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ZMYcQ7+SKBkEx+27H9/rNEhh+2WEsmJCQZJZQgRxg=;
 b=foTMELCtWrjo5RMfadxOa8E3FAqPrl9eWJdvbe1eM/4qSSFKzPwigLXG/HtfyXfzGgQ7WDPrGLbk3c7euP+WBcNlr0WzX0ZIWFmQWIo21LrQJZ9vWpc7I7CDFHFN0ATJxnFOb+xDIP10BVo4HvPYQ+EvzF0FPdTcDykF3z8b3CFM4Qwy5uucPZay0pQPibt+lp/moa4LajRDfoqX0L6wZ62aV0EIPKqY84xidfoVP0d6jeZXw+M4srILHMKFr5i/25URRYXnBi9atlopYsANrB/qkrsbi95S5EfNTuilhke528cqClbCqNyPjVCgR7OAK2jeLbozZ8n7MxamzgM/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ZMYcQ7+SKBkEx+27H9/rNEhh+2WEsmJCQZJZQgRxg=;
 b=uWN7fPYn9xEnFWv5mPFBqW7U/NdKzS2luazZZBD5z64r0LqJhnWLtSCchRY5bzljJopR4K91ClPzYnI0D7K524NGdrN9oF+4be3edRNfNiYWznuAgSnnoS3nIxJfy/KFts3tTY1R4LLFa5zbLdJ6AFx4yEAMe1nVs16pka2LY6w=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Fri, 9 Apr 2021 03:52:45 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::39f3:a8d1:d98e:c2db]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::39f3:a8d1:d98e:c2db%5]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 03:52:45 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.
Thread-Topic: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.
Thread-Index: AQHXISFlKhXI+bGGokSSPmGHItt8EqqVATwAgAB0/YCABWWvgIAQyKYQ
Date: Fri, 9 Apr 2021 03:52:44 +0000
Message-ID: <DM8PR11MB5640BA367764966ACD798025FD739@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
 <1616639091-28279-10-git-send-email-lei.rao@intel.com>
 <YFzRbpcUyLOOYlj8@work-vm>
 <SN6PR11MB31038ED3C97A8B7B681543ADFD619@SN6PR11MB3103.namprd11.prod.outlook.com>
 <YGG6mwQRyYVQ2JpG@work-vm>
In-Reply-To: <YGG6mwQRyYVQ2JpG@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 007a1f7b-dc00-4fa0-d7a1-08d8fb0aeefb
x-ms-traffictypediagnostic: DM8PR11MB5621:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB562133727F2CE644B7326C4AFD739@DM8PR11MB5621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:208;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dM4/COnUyV3rL42PS3l7sphTD2XA1HB9rld1hl1eTZpGoxodfLEmUI/H1ODrUrc2S+qP5dvXMAm+UuD84c4x6flaa31/kQuH+6Ma4v28qdfm5nYJzMK1erzrQvDA63qRHZ8zyTTH482NpE7Eu85W3735jZ5Pkv3Agn1BNeauQvQ4t9zbc+PdyIs/h9UfJLLTftNExOtlU80bIv1O5njjyjD9k1eyoPF6aYA8CjKCU4MVRACus7VmAqZcQW+N3/Diw8ibcBoGSDa+K3xZoDsx2bZpq/zuSwMYK3HaMxrmbdJtTeBNOOSjuRj9cmbnj37m6hydz+Lu51MKflqfUyogX5Nm9QgZlwHq0msmRQTtkkWocYV453oT856SanLIoc1+gUSQPQXFJ3k0l9uxWrtpwTmBqSSku/KvJ33di1CF26kwBFd2tvvvsl80dMYAHHQADddnu8M0CiezXXpNaFNonwoYXEag2ASSPLSJO28IcRuL4OkeoffbGP3uJ8G4eGEMo5qUeSZtbWFCkjsRDFsLph7oICxlmdUE70lHNyoy1U7Rii69yShw5bH9q4zD5SMI1mcFPv+v7yZoijVZZtVcBtr5uLSwSljuwJn7xmc+pXZzVGh5S33V5rzdfNy/IuiGduUsJy+1dBmuo5Yl4DHdD2WUDYD1Lz6m5nzXc6WlmpI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(346002)(39860400002)(376002)(26005)(52536014)(186003)(66946007)(86362001)(6506007)(55016002)(7696005)(5660300002)(2906002)(53546011)(33656002)(83380400001)(9686003)(8676002)(4326008)(54906003)(316002)(71200400001)(6916009)(66476007)(66556008)(38100700001)(66446008)(64756008)(76116006)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6nRJVxRfTIbIofCzOS1OjK4iPi+/hlEzpIJ6BnH3oIWhU4tPLB2J3ddT1dM5?=
 =?us-ascii?Q?vtOt9M2JLZnEXpvIRlXYlouOSX1YYL1C3lRb/yCCGS8S7i5xzqijupL0NgAL?=
 =?us-ascii?Q?F5Zyl+wJRAfb91bkMSpdfDLgnGt64gUeNkUnX7j34hk5dbE9UuGKxr9fPZgc?=
 =?us-ascii?Q?iOD07hTME71ZXQe0DxLcxeYjHQ1rVeolEbq+N/z1lGS0YZAMm3RPzqNxWdE8?=
 =?us-ascii?Q?1CpD/byRAaj8qx+Gpl+oYP5zzUG2/N3ggp7ZbaCBzfrRQ6YbBU9zAC9Odoo1?=
 =?us-ascii?Q?sfkVGZj6937yQdAJ+E0q0lFM8q04PkUz5ofa06ok23MCPa1dscWMjyEaWiFn?=
 =?us-ascii?Q?2tAsTg/Ms3BztI0P8eZZiEppw5T80pNjByv7tMi4ep+IybajVUoN4aeZe+h5?=
 =?us-ascii?Q?wDUCOr2D+4IY3habJ7HPuqfhISr6pSybzjpBIO79DRRvdMnQLNbQay3ckaXs?=
 =?us-ascii?Q?YGUE9AgiOdd8dPWt3FnNflqDQ7g/3CMkK4M36y2ZCsX2JWgVfUlKVH8QbRD7?=
 =?us-ascii?Q?kV2NaBa9smYLnPor7W2PaSU4IyPzv1aQWPXPf06vkQsYpji2gRsh80fNwVRl?=
 =?us-ascii?Q?1WgQlelc/nxtDGKEU2cKM3DfuZt7UCaHNsctVxL4+YB1Tqmd7juFxaWTaVUv?=
 =?us-ascii?Q?3l85ZXKkeknDy2YbH8wLHhKfOcKRR2DK0MMTmUDzDwJz2X3vpvXPpsKP+xOC?=
 =?us-ascii?Q?T4OF6NkVAVBUQAzuRea4HwoRz4t+9AzkrpMwBzwW6xDdR56X3549yQDy0EqJ?=
 =?us-ascii?Q?Y1r2wyelXu/XgRh3AtH4Nayv99FmjwevP3UsZRg24oiloOGtNgEDtU6h/iV1?=
 =?us-ascii?Q?UxF5RItE+QZr27x2E5VKHHVx2mVoJuPcsDDilXFvOlzxQj+2XlfIz4Ak7qnj?=
 =?us-ascii?Q?gvVvUuyWxhZvVBcw74GaZuKBTz2WawzF4QZnR7N05e54/jr9sN5+xpup3dM4?=
 =?us-ascii?Q?6QWl8Smmq5i0dQ7GRC5VUirVGv2b8DovMQFkI8pn54Nb2fKy2vmr/qnwzhCQ?=
 =?us-ascii?Q?wIYrbmxcERCdwLaVhJRrC1YQ+su0hzN6b7RRZ8WDrfcVxO5yLqkBlyO4pN0I?=
 =?us-ascii?Q?JuXa3vyUsi4kMtN0Tg5j13uD+B+8kIwPX2UqG9e0Q2Pj/74OvhyM9fxWOktB?=
 =?us-ascii?Q?JLimMqm6FFF24KnBLc3/KHXCY46fArqfvsTKbZwY+xQOcrsWHEg2cF9PBKGj?=
 =?us-ascii?Q?zG3NcKB5RLqcmGo76Xm95J3wDC0l64v1Xi4K6j9S2Wwhb95FjORN+lZtqkl9?=
 =?us-ascii?Q?3s0vpSk9xFwOCh7HLx7Q0ND9SziEBuJMIGS6pS2wqYiJ7EYuhjkLMkaWjsBF?=
 =?us-ascii?Q?qpA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007a1f7b-dc00-4fa0-d7a1-08d8fb0aeefb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 03:52:44.8720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlXd1+8I2z7/c7GGuqV+sYOWtHe58noDYRgzlCBh35AESYwYMSDpQC6PsmzVjcQ1qZFJ6mTc9FxiVn2nZHdm2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The performance data has been added to the commit message in V6.

Thanks,
Lei.

-----Original Message-----
From: Dr. David Alan Gilbert <dgilbert@redhat.com>=20
Sent: Monday, March 29, 2021 7:32 PM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; quintela@redhat.com; pbonzini@redhat.com; lukasstraub2@web.de; =
qemu-devel@nongnu.org
Subject: Re: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.

* Rao, Lei (lei.rao@intel.com) wrote:
>=20
> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Friday, March 26, 2021 2:08 AM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;=20
> jasowang@redhat.com; quintela@redhat.com; pbonzini@redhat.com;=20
> lukasstraub2@web.de; qemu-devel@nongnu.org
> Subject: Re: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.
>=20
> * leirao (lei.rao@intel.com) wrote:
> > From: "Rao, Lei" <lei.rao@intel.com>
> >=20
> > When we use continuous dirty memory copy for flushing ram cache on=20
> > secondary VM, we can also clean up the bitmap of contiguous dirty=20
> > page memory. This also can reduce the VM stop time during checkpoint.
> >=20
> > Signed-off-by: Lei Rao <lei.rao@intel.com>
> > ---
> >  migration/ram.c | 29 +++++++++++++++++++++++++----
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/migration/ram.c b/migration/ram.c index=20
> > a258466..ae1e659
> > 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -855,6 +855,30 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs,=
 RAMBlock *rb,
> >      return first;
> >  }
> > =20
> > +/**
> > + * colo_bitmap_clear_dirty:when we flush ram cache to ram, we will=20
> > +use
> > + * continuous memory copy, so we can also clean up the bitmap of=20
> > +contiguous
> > + * dirty memory.
> > + */
> > +static inline bool colo_bitmap_clear_dirty(RAMState *rs,
> > +                                           RAMBlock *rb,
> > +                                           unsigned long start,
> > +                                           unsigned long num) {
> > +    bool ret;
> > +    unsigned long i =3D 0;
> > +
> > +    qemu_mutex_lock(&rs->bitmap_mutex);
>=20
> Please use QEMU_LOCK_GUARD(&rs->bitmap_mutex);
>=20
> Will be changed in V5. Thanks.
>=20
> > +    for (i =3D 0; i < num; i++) {
> > +        ret =3D test_and_clear_bit(start + i, rb->bmap);
> > +        if (ret) {
> > +            rs->migration_dirty_pages--;
> > +        }
> > +    }
> > +    qemu_mutex_unlock(&rs->bitmap_mutex);
> > +    return ret;
>=20
> This implementation is missing the clear_bmap code that migration_bitmap_=
clear_dirty has.
> I think that's necessary now.
>=20
> Are we sure there's any benefit in this?
>=20
> Dave
>=20
> There is such a note about clear_bmap in struct RAMBlock:
> "On destination side, this should always be NULL, and the variable `clear=
_bmap_shift' is meaningless."
> This means that clear_bmap is always NULL on secondary VM. And for the be=
havior of flush ram cache to ram, we will always only happen on secondary V=
M.
> So, I think the clear_bmap code is unnecessary for COLO.

Ah yes; can you add a comment there to note this is on the secondary to mak=
e that clear.

> As for the benefits, When the number of dirty pages from flush ram cache =
to ram is too much. it will reduce the number of locks acquired.

It might be good to measure the benefit.

Dave

> Lei
>=20
> > +}
> > +
> >  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
> >                                                  RAMBlock *rb,
> >                                                  unsigned long page)=20
> > @@ -3700,7 +3724,6 @@ void colo_flush_ram_cache(void)
> >      void *src_host;
> >      unsigned long offset =3D 0;
> >      unsigned long num =3D 0;
> > -    unsigned long i =3D 0;
> > =20
> >      memory_global_dirty_log_sync();
> >      WITH_RCU_READ_LOCK_GUARD() {
> > @@ -3722,9 +3745,7 @@ void colo_flush_ram_cache(void)
> >                  num =3D 0;
> >                  block =3D QLIST_NEXT_RCU(block, next);
> >              } else {
> > -                for (i =3D 0; i < num; i++) {
> > -                    migration_bitmap_clear_dirty(ram_state, block, off=
set + i);
> > -                }
> > +                colo_bitmap_clear_dirty(ram_state, block, offset,=20
> > + num);
> >                  dst_host =3D block->host
> >                           + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
> >                  src_host =3D block->colo_cache
> > --
> > 1.8.3.1
> >=20
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


