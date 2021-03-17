Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7833E663
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:45:39 +0100 (CET)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMLFi-0003ct-8a
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMLEZ-0003Dg-SX
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:44:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:16568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMLEV-0007in-JP
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:44:27 -0400
IronPort-SDR: +LDjqWLONY2SqTviQYusWBLI4ukYi8QbAtvn55LWsoPxHjixHdmY8oT7moc4eEjss4ysfCYcq1
 3k7qevAIy5sA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="188727546"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="188727546"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 18:44:17 -0700
IronPort-SDR: VIfrpOQARbbLx+IZ+sT6jqB2bfuALQINy5IBXROezZLglEPk/iP1c2dYQHSt4ZDQiEToszfm2j
 MBjVqrlLeQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="379085298"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2021 18:44:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 18:44:15 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 18:44:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 16 Mar 2021 18:44:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 16 Mar 2021 18:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivprqVlHmMWqDadAVWdIg5lbgaa/7CPsE7cL7LYdJNM+3+9TSkVrAsUHL9ONx4ReVQu3u3v3lY/rpHGjkse/Buyctnz2PwmQyizeD8Bpcg2PmJv9+GFUCYfvuHQ7L3XcIaLt3IsE/bKC/acegs5HDn1b7CTj/RMZyF8WoLRHBqi3E4LxuMsx9PQlL64JNdXwSjxJck1sYGlZm3UYOBemTGuq0d3aA+UZrgoqg/NzFljfyn47xvKkW4fkAgnH3ruCZznmIrwbKMFIcVPU0phz10u4DPXKQXOnjqBn+alL9jZSWwhMM+VjsWL28HywF2F3v5VTfROPqi/NalY8ojqTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LEdPNWGBaTbxV4D4M9wIZTwDZGM3OwfYdCuX+mtZZc=;
 b=nQYr003Td3sL3VV2L3rtu35fgYJ0CzRiPwno+ff6f4v11d2aOyqzRKhzYQx0grbEax2AiCfrR2wXTwI9Fmkojb6iTgoSkcR0iMi/V9275XZ2V9ZFTfXNe8d0IVNI1j1sb1mkfqSGsrWtCo3itZ/8QBLXT0+FCYK8a1WUaZrwb9lO1lvNi4sfxuzHEOYrAXovWAZ0o+tygyUWtzWCUBfW7VyPR6oHvzD8CA54K0OYxJ+yFndKmRHm4ApMlpXRdkNWrYyq5Y7UsRSg3vKwQ9Q4M51cH2G1BEMcpHw1Ww+itzvyow+eR7eMK6y7havMZikSnINp0bJiqLJ/+VJCOMExVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LEdPNWGBaTbxV4D4M9wIZTwDZGM3OwfYdCuX+mtZZc=;
 b=a5kC6JovXc90BtfjWhaEt3GJCKVe1zeJNGQJVX0AP+YFXgk3yY563fS0sHVBbGswqcPEDI8HUOG2WH67k5eRgtk1VTn2ZjUGqqiWEUPQLKLvmEvQq6OAm1yd3rzcQiWCKiZwADoLw0weqgOCBU69MJiu3/QR2zsYBbOh+XFkuEU=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2078.namprd11.prod.outlook.com (2603:10b6:301:4e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 01:44:11 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3933.033; Wed, 17 Mar 2021
 01:44:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Thread-Topic: [PATCH v2 1/1] docs/devel: Add VFIO device migration
 documentation
Thread-Index: AQHXFeKChCZAPNERSkWYs2XEwwoMcKp+iW8AgACn0oCAAG4BkIAHLCmAgACj29A=
Date: Wed, 17 Mar 2021 01:44:11 +0000
Message-ID: <MWHPR11MB1886F02FCFF5D7ABB7DE31E88C6A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <YEnlmqNuvIxAB9mc@redhat.com> <YEpyYY2jE8TAWD8u@work-vm>
 <MWHPR11MB1886E79EB08B27A46D3AC8E88C6F9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YFDS8eavuGHh6EwT@work-vm>
In-Reply-To: <YFDS8eavuGHh6EwT@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64704e2f-0f4e-49e2-111d-08d8e8e629e3
x-ms-traffictypediagnostic: MWHPR1101MB2078:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB20782711C6FDEECADF795AF48C6A9@MWHPR1101MB2078.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WxcqojgnDFoMm4vIdWl3kUfN7ahkGYRWZm1vrSHgZt+uR3kXpui7Bv2epbtCWCac0LZt+DxZhyLQKwOl/x0YkLumsp7HhC3RiucCrJ6k6013VJHmky0euRSOXvLtq65kud+v2GE0Esypco3jXAFss5mN1kEr69pR8uk31bgxW9tsI+KnfWGUQoi5GFp0YjaUZsusuuwM245iKidp9k5Y98RYnKhgXfVltpGXnUeb+rQ3M0wGNly08xpN4WJlAReL7qHORcqmwgRNkUbs5iL+NQ7TvD1ESn14R7kOP+Huja3ieprrMEC5nnDc89mq2Ff+D7Mp4LQdZHWx5PSWyX/6DqhUXu9sr7l5QccI47Va+9MR0c2Hqs/FTCE0EhqfDK1q+ivA9r45whlh4zACIF51c2YyIgFJtiMxBywaW/PbwIWCY3QUzcUawJuBZi+jhlYnTanLkp/cRFboU+NJHs3rvcgGbPJxUBMY5Y1USFDNeIqjbF5ztP2Qb6j59XywRWFibWuGG0Jv1DySOkzI27WOupjtcUGOyAnwXkAL/PCm6f7aIa+zdjB6cE4n+qzOGzwykqEAs7bUd+7c9FxGiKhva6PnJw+3n2ZK1DHmL5a3k4WTnBowKKkrvOJhOI197q6JbvbAGoqMSWdb/yyYQlXiEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(396003)(376002)(136003)(83380400001)(66476007)(26005)(66556008)(71200400001)(52536014)(66946007)(6506007)(64756008)(316002)(7416002)(54906003)(5660300002)(8676002)(7696005)(6916009)(186003)(966005)(66446008)(86362001)(76116006)(9686003)(8936002)(2906002)(33656002)(478600001)(55016002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?gkNvW6D8Mpw7f8Mpba74ruw9Xjc+X70WHqtOIxXekl6APC1wDkKEx6IsfG?=
 =?iso-8859-1?Q?UA1S0MZT+RfxVPGSMDSevJjhbc/sffbB0v2pAr0J/gYSoBiLDLPOaNHHmm?=
 =?iso-8859-1?Q?U2bif+zNnYVj96hLSWiJ/HHDj5GeAlN6xYnjRskk3u9+tBhpwSmxhY40Ih?=
 =?iso-8859-1?Q?7FnSZ9r//TQ5HYwQtjISaPsOfqMobL9oiVL8QxgafNleK1OS+XMHXdBeRM?=
 =?iso-8859-1?Q?/BI94ahMOZltWEj5pXn8jJHkm3TknKxyEsTCZoZtZZ/PPJUa8Z5YzoL6y1?=
 =?iso-8859-1?Q?DtKBSlXbj08HEVAli7m63aSSv0IpOpG55/SZH9gCfKkCzGQCjVrTgs12H4?=
 =?iso-8859-1?Q?CQmk4HuVD9kpiEBAzDXPmDVTx7TM77SmzhWUPAaZNkZLjfZS7VD8IH7LKH?=
 =?iso-8859-1?Q?xTf3R2Y3Xam17+6q/1VAn5EKADIvm/l3wR9APEzBb88pLnOCxF1pr6G/2R?=
 =?iso-8859-1?Q?vqtf3RenTFn5s/9+C+fRjlwxaNGnt6Vk7STVitfCwZJjLaHZsHP2Acyp24?=
 =?iso-8859-1?Q?tb5LdoYVToN0HCdr56fG39WAp5oDAp/jflj92pB3luruhVsX6usWEFu6si?=
 =?iso-8859-1?Q?lRHLd5NcCeUaJ3cb/506kQz4gFiljr4WuobxzoGCXnqOMFJcDp4i2cL9qk?=
 =?iso-8859-1?Q?ytaHnL10rVrNWNirAz0Axkn0p330hTYLhrXMqlwFb5ziEgsUhF2agoMLIw?=
 =?iso-8859-1?Q?Y3ayTOatys3z0r2zUP+dzt+yvNr8alor7jwk+tRd0mZ3D0R+TC/on9SJ2N?=
 =?iso-8859-1?Q?udKdaUtIHlFI0QcA8TwjNcNDP3oKINJMttauBUBeol/Pj2UdEcrrJmTLsj?=
 =?iso-8859-1?Q?pZoF32t3ZTMGdDE3KG31MQCcNXMrOk8QuiBmvhs8ujpO9o6JvQEwZ9dlii?=
 =?iso-8859-1?Q?HGbCjuvZlScn39oCbd9Qx/xGlJd4d3uAjT0wwtWsNq+3s6SWmKdcLVxm4n?=
 =?iso-8859-1?Q?hdQC4q5mSdheuZQFIa5vr+kgNmteDmXiAGoVeYo8AtpH0KuCxUyR8vGEFP?=
 =?iso-8859-1?Q?TCCyCZmk7EwR2P2ODnh2TwRmc2Rq3AeunJLA+l3GFRHyFdFoL+JA4GEbOq?=
 =?iso-8859-1?Q?6HLuZwapq5BupfKB1a+SjQdaE1SglF3sIUvMjWvpFar7NWgvVlepj6hBtg?=
 =?iso-8859-1?Q?BIfECMq4PsGLvzWEkHP9cdcw5eV8ooxpBW57gKPFwOkuv7OKb+bVrRYjg9?=
 =?iso-8859-1?Q?QEhk6wrJMKLcsN86BYGFCGkGvAUUViCdmMGy/hjJOJmtPlqKfUOgDEpBDo?=
 =?iso-8859-1?Q?5Co3RqSDGibBgm+YKW8/BtUhCoy7GGjEUPLC9OHcfLyo+lNKIZG94zo0cv?=
 =?iso-8859-1?Q?CasKX+mcbeohlcT83jyUS11QMGfCqnTh7ovUVrZzfUUzAQFU3owE7gR9Sw?=
 =?iso-8859-1?Q?dKZVqcp7ZC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64704e2f-0f4e-49e2-111d-08d8e8e629e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 01:44:11.4804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRHTnonowfzMbkZjP22ktMDWUP105MXFMZSP7EWpuB8Aa71PbG2pfSSuGTXpacBzTK05fWO6mdRhLguLbG6Zkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2078
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=kevin.tian@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "dnigam@nvidia.com" <dnigam@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Tuesday, March 16, 2021 11:47 PM
>=20
> * Tian, Kevin (kevin.tian@intel.com) wrote:
> > > From: Qemu-devel <qemu-devel-
> bounces+kevin.tian=3Dintel.com@nongnu.org>
> > > On Behalf Of Dr. David Alan Gilbert
> > >
> > > * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> > > > On Thu, Mar 11, 2021 at 12:50:09AM +0530, Tarun Gupta wrote:
> > > > > Document interfaces used for VFIO device migration. Added flow of
> state
> > > changes
> > > > > during live migration with VFIO device. Tested by building docs w=
ith
> the
> > > new
> > > > > vfio-migration.rst file.
> > > > >
> > > > > v2:
> > > > > - Included the new vfio-migration.rst file in index.rst
> > > > > - Updated dirty page tracking section, also added details about
> > > > >   'pre-copy-dirty-page-tracking' opt-out option.
> > > > > - Incorporated comments around wording of doc.
> > > > >
> > > > > Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> > > > > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > > > ---
> > > > >  MAINTAINERS                   |   1 +
> > > > >  docs/devel/index.rst          |   1 +
> > > > >  docs/devel/vfio-migration.rst | 135
> > > ++++++++++++++++++++++++++++++++++
> > > > >  3 files changed, 137 insertions(+)
> > > > >  create mode 100644 docs/devel/vfio-migration.rst
> > > >
> > > >
> > > > > +Postcopy
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +Postcopy migration is not supported for VFIO devices.
> > > >
> > > > What is the problem here and is there any plan for how to address i=
t ?
> > >
> > > There's no equivalent to userfaultfd for accesses to RAM made by a
> > > device.
> > > There's some potential for this to be doable with an IOMMU or the lik=
e,
> > > but:
> > >   a) IOMMUs and devices aren't currently happy at recovering from
> > > failures
> > >   b) the fragementation you get during a postcopy probably isn't pret=
ty
> > > when you get to build IOMMU tables.
> >
> > To overcome such limitations one may adopt a prefault-and-pull scheme i=
f
> > the vendor driver has the capability to track pending DMA buffers in th=
e
> > migration process (with additional uAPI changes in VFIO or userfaultfd)=
,
> > as discussed here:
> >
> > https://static.sched.com/hosted_files/kvmforum2019/7a/kvm-forum-
> postcopy-final.pdf
>=20
> Did that get any further?

Not yet. As you may see in another thread, even the precopy side still need=
s
some time to land.

>=20
> I can imagine that might be tricikier for a GPU than a network card; the
> shaders in a GPU are pretty random as to what they go off and access, so
> I can't see how you could prefault.

trickier but not impossible. e.g. any page accessed by shaders must be mapp=
ed
into GPU page table which could be the coarse-grained interface to track
in-use DMA buffers. However this could be large and prefaulting a large set
of pages weakens the benefit of postcopy. or there may be vendor specific
method to do fine-grained tracking. nevertheless, it does provide an postco=
py
option for many devices which don't support I/O page fault but actual feasi=
bility=20
is vendor specific.

Thanks
Kevin

