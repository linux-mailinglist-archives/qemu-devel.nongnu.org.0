Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2633839F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 03:31:51 +0100 (CET)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKXaf-0004VC-Uf
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 21:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lKXZj-0003xp-OX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 21:30:51 -0500
Received: from mga18.intel.com ([134.134.136.126]:60543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lKXZg-0007Xc-2x
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 21:30:51 -0500
IronPort-SDR: u5YboajPP4kuC6l6votx/mxQhMnj1VIBzq+sZKclTKEdHK5Ro8HiqjvFrM6gdyRgTb6I5Kc+VB
 WvydO8HYYdUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="176364479"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="176364479"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 18:30:39 -0800
IronPort-SDR: 8x5P0V3tmv3XU4At0WqMmCoMJB4MSIIz6XObIjmsaM6YWyO7sj4n3M1azcc4dPwfCe+0yGviLp
 NQyd8gUVu3PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="600444585"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 18:30:39 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 18:30:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 18:30:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 11 Mar 2021 18:30:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 11 Mar 2021 18:30:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hokl7Oew6fzKdVApZsdajclVcmlKJ0jyOeFhrK9Z2evPZxGESykWl7nHplEjBpFBBvF1+dZEGe4P7ujU0rJzyKEhEWk9IxrpXJzfrzhoD45xCjBrC1OkDWrRb15tj1Zq+Ypg7tXc5VFfTAT/DKmZnbxSVuAB5q4S2PxQ1R3+B7xTMu2BsubqOeORWRSpZ+jRnCId1gLDAlrgsT0VFlg4Oz6Ui+J8j4D3aZxVkocwTDioNJMefhgIleEBobwfA/c8mzBEtOxVmT4X1zVx0gv1wvDijsnQDaMinZMvbZL0zDyM3sKAUw5aNw+2FEJK5vFMJz0hN6d9CwvGepyYNrtQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFtoz79tBYALqlq0/U9IfRpCSinP6Ire3Y80SZkyC7o=;
 b=kiUJL8wTJf93aZfncb1g/kXnrBhJoyAIJs5eYJ17h93GkCvGsMgVlXOhOSYfyiPBS0lI8bQiCCltbwrZUtD0n/xl/NRvvqjLm6kr+paZtnhfoskmPcPXoqkNvbp2nVNl0xIOcNedD/LwLX/Ma/y6379nAtR81Zbnci2j7NYLLHal1H2gLzh1qy4l9QRRtz11vSXgUi0KTnj2FKw35GVx7jFEmzEPHlKKxsckrODAwcAns1epV118UboWTEBNGiAr5SFFVygtGVN52VyKxrs1ag8YCHam8ou7owteQr1HGf7abnQRXo8FVCFb+d2OqHLOYx2ZaGvkX2eBggd/3NUvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFtoz79tBYALqlq0/U9IfRpCSinP6Ire3Y80SZkyC7o=;
 b=iQysdTUuxf3gYcWqBmJ3b7jjiEZ5PPS29sZE5SquJ2NnIFF0zcQIy1n1mtXwVtZObC8hSVBeOf/12feuXXtpBqjLX4s6CXvgZibzhIB8N/0RkQldJ3JNFMNdQlK4sd8flxpwCISN5xdnd86GdNXb9qxmDHAPuPcRwr8WA16p5oI=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1469.namprd11.prod.outlook.com (2603:10b6:301:c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 02:30:33 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 02:30:33 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: RE: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Thread-Topic: [PATCH v2 1/1] docs/devel: Add VFIO device migration
 documentation
Thread-Index: AQHXFeKChCZAPNERSkWYs2XEwwoMcKp+iW8AgACn0oCAAG4BkA==
Date: Fri, 12 Mar 2021 02:30:32 +0000
Message-ID: <MWHPR11MB1886E79EB08B27A46D3AC8E88C6F9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <YEnlmqNuvIxAB9mc@redhat.com> <YEpyYY2jE8TAWD8u@work-vm>
In-Reply-To: <YEpyYY2jE8TAWD8u@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3660c0d9-d7ab-462c-2244-08d8e4fecfe1
x-ms-traffictypediagnostic: MWHPR11MB1469:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB14697F59256CD402D18736748C6F9@MWHPR11MB1469.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OC+A63/imPZTVjcF/jjofp2W/9MqRhBTTjQ+79gXzkjHO1fYgZssYLuUzfK1gqadzre5z3tV2CPzqNVJGuRphJLkiodD9qzFMM33dIMuq4XQpyiU1sRjov4JIxwY1mFcbvwU3d8kgFDAcJA1+nv7yFsvlEOYGD1Oxsoqzh+d2PjJPI15s5D+yT9PyLAR5PP34sXMK1YbM0l4VOCyHOQ5QBCrIoIGAll+gRpuJyLcoZrbD3CuOusJumyrMyAmrQgnBUkQkrfK9tqH0OluQA1MOPKASkq7rIHkNj2WIyzhwnIORNF0eZJKKWePOJchyJuQu5coPHxbS49dKkQRfEF8xd+lxyPPPFfEPUEAYg5+GlREuln2aQw6LxS53jl2PNmFK+gAyv1UvoXszSyP67Z2sXkiL20MkfvfMdmrfhJMC3S6l93w9NYidfCJOo78cxOx351spY0xKIpa6iqZeqD0Kk5VgPL2nYStvyjT5eAgxyStBk6d61vuaYM8Q2AL4jqGPq6+j57E5Ey8a1KEACIWHEOFSzL+hEv75Fw721nLDR0y49HRXGjpntpMWHItS4vzDw4C1K3LgpUZJuG7D+2TNNG9jtuIut0+feNFcn133H4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(396003)(346002)(376002)(966005)(7696005)(2906002)(76116006)(478600001)(26005)(4326008)(66946007)(186003)(66446008)(66476007)(7416002)(64756008)(66556008)(52536014)(5660300002)(8936002)(8676002)(86362001)(33656002)(9686003)(316002)(71200400001)(110136005)(83380400001)(6506007)(54906003)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?HJRsW+dTqIOCPP/t5pd7ZhkhKGAP+SH87MXBtm+IO6tn3wJAryQ2ZKw2dz?=
 =?iso-8859-1?Q?bDb+iuhchfLmLi69oNUfiaimolgIJ2UTio4/8RTPut+cPbxgq0cncfhl1O?=
 =?iso-8859-1?Q?XnT4jm9LvZMQ5WEE3D1gM6iCzKXAdSFXFlrHOFuWVxCYUwp7OPc5tbeBBH?=
 =?iso-8859-1?Q?Ap967e4TInmr8+krsw+BJZVEFtaCburm0mAwDO6ZY7FP7bnLiQkg6XX56M?=
 =?iso-8859-1?Q?27XSoj3udtFpyRIkjypJmLvR0hWKWuEeg9qjeUskv0jOWH9MaMG1G8qwVI?=
 =?iso-8859-1?Q?s9OLGlZp9gA6NlYZLgJBNJybhohJqtv6jbxEqm4jfnjY7JaedNufIsvOF4?=
 =?iso-8859-1?Q?PipkkUQsVz8U0fCsSjhE0Xp7xeuIcQkq1Ls7ov5wC4UJetVN4kXSiJhLwG?=
 =?iso-8859-1?Q?cJuPkQ7GTLNWKNMBEbFw5K8O3yUWxkVzxH0Lgdsgf7lsljXqdOATNARKQW?=
 =?iso-8859-1?Q?SmUhBO9tWyqNCEwwucPL/jUd0HLMlr/NtWJArDUWhD8FQiWBcJbx8O0Noc?=
 =?iso-8859-1?Q?ekAFlqKh5HDm6sKe89szxn2AEnPpxo218eTVV2BUtdHkV9FPNqozM216bh?=
 =?iso-8859-1?Q?cBYe0aSg6iRDuKd74JObBHc/W1VW0Tl2VdURs3EVRkJBzBvNPJAQOg0Q8p?=
 =?iso-8859-1?Q?Jydp5TeM+BbPL1AsLiMwPiII4QJRrH82INZx2SfuCFPWlTam0d+o3qkWJQ?=
 =?iso-8859-1?Q?UfVpISWA+bMum93XiSqRWChLm7dJr158u4lJwZVNj+fThYoGalwGUYwZ0J?=
 =?iso-8859-1?Q?IS42gpB89TYfnP9FyX8rrdUgL45mEm+KrbJoeY5DL561ty5jOihWbfNiqe?=
 =?iso-8859-1?Q?sTzL0DmUVojhmYbD5ISg/fR8CE2xMHRsEkRlnrkbj5owK298qJGZt1x6/1?=
 =?iso-8859-1?Q?UUU/qoXeLFDJ/DkEAD/xYzJcLRu3qSg6UfrpBdVYhjsWac8v9Ir4KBuVNU?=
 =?iso-8859-1?Q?La7Sr54T8dAfgekmkDYzzOnSe8ILI5Kl4jsEA4l0Aj9fPgeQglmnPJ7Wof?=
 =?iso-8859-1?Q?+5/8Sz9tm5QZ5IFUK6zSkDIlyCRu+QiKQYDhMm8lDV1fmkBjKto3qkNZmK?=
 =?iso-8859-1?Q?RkyF3UnzeMskCmHZXlj0xjIRZwL1DboX1q6S5NY5qUgQGTp1n4FQm3bqxy?=
 =?iso-8859-1?Q?I/gNrgLHVbUh/S9KY9qotkP2H2u+mrYWSsLhcOSIDV9B9ug/wWPQUY5Vbb?=
 =?iso-8859-1?Q?aoe2qmq8vIqpSQVZfnmR+xRi3gVU4jjDtVb1IMu6uURxUeWLNwzJAHa83W?=
 =?iso-8859-1?Q?2T1/ADeS7C4s3yw5hBzyUa+BBzAN7PG6Lvy7Ifx84tWzMrhkG5cDRwmT/l?=
 =?iso-8859-1?Q?MTXqgNTmUSaeYXox5VB+rcq85Q9vtiZ3a3VS0m2BgrRqLY0JXxirluNIdr?=
 =?iso-8859-1?Q?Y4uKQ5fgZh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3660c0d9-d7ab-462c-2244-08d8e4fecfe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 02:30:32.7462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScXcwNmxZdelYoyNpmQ0EjNM6img/QdGnf59tIgG1oL0a2pWZ6WlgshD25a7dB392jW8kbu2vWnz31R50s35Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1469
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=kevin.tian@intel.com; helo=mga18.intel.com
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
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>, "philmd@redhat.com" <philmd@redhat.com>,
 "dnigam@nvidia.com" <dnigam@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Qemu-devel <qemu-devel-bounces+kevin.tian=3Dintel.com@nongnu.org>
> On Behalf Of Dr. David Alan Gilbert
>=20
> * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> > On Thu, Mar 11, 2021 at 12:50:09AM +0530, Tarun Gupta wrote:
> > > Document interfaces used for VFIO device migration. Added flow of sta=
te
> changes
> > > during live migration with VFIO device. Tested by building docs with =
the
> new
> > > vfio-migration.rst file.
> > >
> > > v2:
> > > - Included the new vfio-migration.rst file in index.rst
> > > - Updated dirty page tracking section, also added details about
> > >   'pre-copy-dirty-page-tracking' opt-out option.
> > > - Incorporated comments around wording of doc.
> > >
> > > Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> > > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > ---
> > >  MAINTAINERS                   |   1 +
> > >  docs/devel/index.rst          |   1 +
> > >  docs/devel/vfio-migration.rst | 135
> ++++++++++++++++++++++++++++++++++
> > >  3 files changed, 137 insertions(+)
> > >  create mode 100644 docs/devel/vfio-migration.rst
> >
> >
> > > +Postcopy
> > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Postcopy migration is not supported for VFIO devices.
> >
> > What is the problem here and is there any plan for how to address it ?
>=20
> There's no equivalent to userfaultfd for accesses to RAM made by a
> device.
> There's some potential for this to be doable with an IOMMU or the like,
> but:
>   a) IOMMUs and devices aren't currently happy at recovering from
> failures
>   b) the fragementation you get during a postcopy probably isn't pretty
> when you get to build IOMMU tables.

To overcome such limitations one may adopt a prefault-and-pull scheme if=20
the vendor driver has the capability to track pending DMA buffers in the
migration process (with additional uAPI changes in VFIO or userfaultfd),=20
as discussed here:

https://static.sched.com/hosted_files/kvmforum2019/7a/kvm-forum-postcopy-fi=
nal.pdf

>=20
> > Postcopy is essentially the only migration mechanism that can reliably
> > complete, so it really should be considered the default approach to
> > migration for all mgmt apps wanting to do migration, except in special
> > cases.   IOW, if we want VFIO migration to be viable, we need postcopy
> > support.
>=20
> There's lots of other things postcopy doesn't work with; so hmm.
>=20

Agree. Also given the amount of work even for pre-copy migration, it makes=
=20
more sense to do things step-by-step.

Thanks
Kevin

