Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEA8F89E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 03:52:20 +0200 (CEST)
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyRPf-0002qA-BD
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 21:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1hyROs-0002Q8-Jb
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 21:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1hyROq-0004te-ET
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 21:51:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:36285)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1hyROq-0004ry-6Z
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 21:51:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 18:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="206097346"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2019 18:51:23 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 15 Aug 2019 18:51:23 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 15 Aug 2019 18:51:23 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.19]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.250]) with mapi id 14.03.0439.000;
 Fri, 16 Aug 2019 09:51:20 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v2 0/3] colo: Add support for continious
 replication
Thread-Index: AQHVU5R7TpP312DWoEaTVPlBuIos5Kb8CVaAgAAOGQCAAONlQA==
Date: Fri, 16 Aug 2019 01:51:20 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D780621F1B6@shsmsx102.ccr.corp.intel.com>
References: <20190815200815.2cffc21b@luklap>	<20190815185737.GC2883@work-vm>
 <20190815214804.69e4334f@luklap>
In-Reply-To: <20190815214804.69e4334f@luklap>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzBlNjEyNzgtMTU0ZC00ZjBjLTllY2YtNjRkYjMwMjZhMTg2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic2RLT0VUMFdUcHZ5XC83NjFsVjFiNVdKK1JzK1U5bFk4YzM3TTFPOTdydk8yUHpNbXVOYWlxXC9CUnZQV0p5ajZtIn0=
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [PATCH v2 0/3] colo: Add support for continious
 replication
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
Cc: Wen Congyang <wencongyang2@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub [mailto:lukasstraub2@web.de]
> Sent: Friday, August 16, 2019 3:48 AM
> To: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: qemu-devel <qemu-devel@nongnu.org>; Zhang, Chen
> <chen.zhang@intel.com>; Jason Wang <jasowang@redhat.com>; Xie
> Changlong <xiechanglong.d@gmail.com>; Wen Congyang
> <wencongyang2@huawei.com>
> Subject: Re: [Qemu-devel] [PATCH v2 0/3] colo: Add support for continious
> replication
>=20
> On Thu, 15 Aug 2019 19:57:37 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>=20
> > * Lukas Straub (lukasstraub2@web.de) wrote:
> > > Hello Everyone,
> > > These Patches add support for continious replication to colo.
> > > Please review.
> >
> >
> > OK, for those who haven't followed COLO for so long; 'continuous
> > replication' is when after the first primary fails, you can promote
> > the original secondary to a new primary and start replicating again;
> >
> > i.e. current COLO gives you
> >
> > p<->s
> >     <primary fails>
> >     s
> >
> > with your patches you can do
> >
> >     s becomes p2
> >     p2<->s2
> >
> > and you're back to being resilient again.
> >
> > Which is great; because that was always an important missing piece.
> >
> > Do you have some test scripts/setup for this - it would be great to
> > automate some testing.
>=20
> My Plan is to write a Pacemaker Resource Agent[1] for qemu-colo and then =
do
> some long-term testing in my small cluster here. Writing standalone tests=
 using
> that Resource Agent should be easy, it just needs to be provided with the=
 right
> arguments and environment Variables.

Thanks Dave's explanation.
It looks good for me and I will test this series in my side.

Another question: Is "Pacemaker Resource Agent[1] "  like a heartbeat modul=
e?   I have wrote an internal heartbeat module running on Qemu, it make COL=
O can detect fail and trigger failover automatically, no need external APP =
to call the QMP command "x-colo-lost-heartbeat". If you need it, I can send=
 a RFC version recently.

Thanks
Zhang Chen
>=20
> Regards,
> Lukas Straub
>=20
> [1] https://github.com/ClusterLabs/resource-agents/blob/master/doc/dev-
> guides/ra-dev-guide.asc#what-is-a-resource-agent

