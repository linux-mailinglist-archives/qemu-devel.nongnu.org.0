Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4C375821
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:04:03 +0200 (CEST)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legTq-0001XX-BA
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1legLy-0006eg-0F
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:55:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:28511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1legLv-000838-8F
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:55:53 -0400
IronPort-SDR: MD4u8r0qCAveqSruBWlhK2t9AQU4sEbU/Dk2gKDCQd/HoeKe2bX6CA2HB0A3lak/ayMSMM1Jne
 99R4U9fdsVpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="178745908"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="178745908"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 08:55:43 -0700
IronPort-SDR: 4gf5tVUaiTVdouOquB1/t3spmFu4QoS5/zt+rR6cAcr8jsuGPnDEk7YS5kVxIGEg6dwf/WHArM
 DnKEsOTy9KmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="452592338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 06 May 2021 08:55:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 6 May 2021 08:55:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 6 May 2021 08:55:42 -0700
Received: from orsmsx612.amr.corp.intel.com ([10.22.229.25]) by
 ORSMSX612.amr.corp.intel.com ([10.22.229.25]) with mapi id 15.01.2106.013;
 Thu, 6 May 2021 08:55:42 -0700
From: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH 0/2] virtiofsd: Enable xattr if xattrmap is used
Thread-Topic: [PATCH 0/2] virtiofsd: Enable xattr if xattrmap is used
Thread-Index: AQHXQo/TPMfIUAFmg0quXVYM+pACDarWmtGg
Date: Thu, 6 May 2021 15:55:42 +0000
Message-ID: <f89d4c8297ba422c924c7d4c16a77402@intel.com>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
 <YJQQwcVgMiUWLQ5c@work-vm>
In-Reply-To: <YJQQwcVgMiUWLQ5c@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.100.41
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "vgoyal@redhat.com" <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you both for the suggestions, I had not took a look recently, I will =
check today in my afternoon.

Cheers.

> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Thursday, May 6, 2021 10:53 AM
> To: Venegas Munoz, Jose Carlos <jose.carlos.venegas.munoz@intel.com>
> Cc: virtio-fs@redhat.com; qemu-devel@nongnu.org; vgoyal@redhat.com
> Subject: Re: [PATCH 0/2] virtiofsd: Enable xattr if xattrmap is used
>=20
> * Carlos Venegas (jose.carlos.venegas.munoz@intel.com) wrote:
> >
> > Using xattrmap for Kata Containers we found that xattr is should be
> > used or xattrmap wont work.  These patches enable xattr when -o
> > xattrmap is used. Also, they add help for the xattrmap  option on `virt=
iofsd -
> -help` output.
>=20
> Queued.  You might like to submit some more patches to give the error tha=
t
> Greg was suggesting and/or update some docs.
>=20
> Dave
>=20
> > Carlos Venegas (2):
> >   virtiofsd: Allow use "-o xattrmap" without "-o xattr"
> >   virtiofsd: Add help for -o xattr-mapping
> >
> >  tools/virtiofsd/helper.c         | 3 +++
> >  tools/virtiofsd/passthrough_ll.c | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > --
> > 2.25.1
> >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


