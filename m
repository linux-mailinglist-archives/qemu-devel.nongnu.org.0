Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA86280E04
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 09:27:30 +0200 (CEST)
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOFTU-0005En-QD
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 03:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kOFSU-0004hx-Kb; Fri, 02 Oct 2020 03:26:26 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:59231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kOFSR-0002eN-V5; Fri, 02 Oct 2020 03:26:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 44D8667DDE2A;
 Fri,  2 Oct 2020 09:26:11 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 2 Oct 2020
 09:26:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0030aecd035-4465-42fb-bd20-52db086b0b10,
 0341F95EB5BC96075CB197F7895ABA4104766D23) smtp.auth=groug@kaod.org
Date: Fri, 2 Oct 2020 09:26:10 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: Increase max firware size
Message-ID: <20201002092610.36b38900@bahia.lan>
In-Reply-To: <81451df1-43d5-43ce-e3cf-703d78333841@kaod.org>
References: <20201002061353.1340766-1-clg@kaod.org>
 <81451df1-43d5-43ce-e3cf-703d78333841@kaod.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c69ab00f-4d82-4c46-a7eb-48cfab6e87a6
X-Ovh-Tracer-Id: 15425673152302324192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 03:26:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Oct 2020 08:15:46 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> That was sent a bit fast. Can you please add in the commit log :=20
>=20
>   Builds enabling GCOV can be bigger than 4MB and the limit on FSP
>   systems is 16MB.=20
>=20
> Thanks=20
>=20

And also s/firware/firmware in the title.

Cheers,

--
Greg

> C.
>=20
> On 10/2/20 8:13 AM, C=C3=A9dric Le Goater wrote:
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  hw/ppc/pnv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > index 6670967e26a9..d9e52873ea70 100644
> > --- a/hw/ppc/pnv.c
> > +++ b/hw/ppc/pnv.c
> > @@ -61,7 +61,7 @@
> > =20
> >  #define FW_FILE_NAME            "skiboot.lid"
> >  #define FW_LOAD_ADDR            0x0
> > -#define FW_MAX_SIZE             (4 * MiB)
> > +#define FW_MAX_SIZE             (16 * MiB)
> > =20
> >  #define KERNEL_LOAD_ADDR        0x20000000
> >  #define KERNEL_MAX_SIZE         (256 * MiB)
> >=20
>=20
>=20


