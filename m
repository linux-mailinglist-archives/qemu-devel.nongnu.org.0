Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75817A305
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 11:23:03 +0100 (CET)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9neg-0006fL-2A
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 05:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1j9ndj-000643-0x
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 05:22:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1j9ndh-0002Go-T2
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 05:22:02 -0500
Received: from 5.mo4.mail-out.ovh.net ([188.165.44.50]:35351)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1j9ndh-0002EX-Mi
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 05:22:01 -0500
Received: from player774.ha.ovh.net (unknown [10.110.171.30])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 653C721E4CB
 for <qemu-devel@nongnu.org>; Thu,  5 Mar 2020 11:21:59 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id DFF8A102753C0;
 Thu,  5 Mar 2020 10:21:52 +0000 (UTC)
Date: Thu, 5 Mar 2020 11:21:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 3/5] hw/scsi/spapr_vscsi: Simplify a bit
Message-ID: <20200305112146.0704d3aa@bahia.home>
In-Reply-To: <20200304153311.22959-4-philmd@redhat.com>
References: <20200304153311.22959-1-philmd@redhat.com>
 <20200304153311.22959-4-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 15188108271996475683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddutddgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehrshhprdgurghtrgenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.44.50
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  4 Mar 2020 16:33:09 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> We already have a ui pointer, use it (to simplify the next commit).
>=20

Small typo, s/ui/iu=20

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/scsi/spapr_vscsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index 7e397ed797..3cb5a38181 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -261,9 +261,9 @@ static int vscsi_send_rsp(VSCSIState *s, vscsi_req *r=
eq,
>      if (status) {
>          iu->srp.rsp.sol_not =3D (sol_not & 0x04) >> 2;
>          if (req->senselen) {
> -            req->iu.srp.rsp.flags |=3D SRP_RSP_FLAG_SNSVALID;
> -            req->iu.srp.rsp.sense_data_len =3D cpu_to_be32(req->senselen=
);
> -            memcpy(req->iu.srp.rsp.data, req->sense, req->senselen);
> +            iu->srp.rsp.flags |=3D SRP_RSP_FLAG_SNSVALID;
> +            iu->srp.rsp.sense_data_len =3D cpu_to_be32(req->senselen);
> +            memcpy(iu->srp.rsp.data, req->sense, req->senselen);
>              total_len +=3D req->senselen;
>          }
>      } else {


