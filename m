Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067AF3087B0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:13:48 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Qmh-0003fO-3I
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l5QkV-0002Vt-M0; Fri, 29 Jan 2021 05:11:32 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l5QkR-0002Y2-Su; Fri, 29 Jan 2021 05:11:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F39448057358;
 Fri, 29 Jan 2021 11:11:22 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 11:11:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006d103a78d-89f0-4422-9309-1ecfe5bdaa85,
 F0B20D4B8DDBF51DA61C26A45925665B938B7F3E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 29 Jan 2021 11:11:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] pnv/ppc: Set default RAM size to 1 GB
Message-ID: <20210129111115.52d1d862@bahia.lan>
In-Reply-To: <efcf457d-8390-4352-6180-ac9fd6d78b24@redhat.com>
References: <20210129092936.769412-1-clg@kaod.org>
 <efcf457d-8390-4352-6180-ac9fd6d78b24@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4c84b1d2-ceb8-4813-9735-ce88a4d71f09
X-Ovh-Tracer-Id: 16089672620632414502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 10:39:12 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 1/29/21 10:29 AM, C=C3=A9dric Le Goater wrote:
> > Any value below will result in a skiboot crash :
> >=20
> >     [    0.034949905,3] MEM: Partial overlap detected between regions:
> >     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000=
] (new)
> >     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0=
x38400000]
> >     [    0.034980367,3] Out of memory adding skiboot reserved areas
> >     [    0.035074945,3] ***********************************************
> >     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
> >     [    0.035104247,3]     .
> >     [    0.035108025,3]      .
> >     [    0.035111651,3]       .
> >     [    0.035115231,3]         OO__)
> >     [    0.035119198,3]        <"__/
> >     [    0.035122980,3]         ^ ^
> >=20
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  hw/ppc/pnv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > index 50810df83815..70ce12f6dc73 100644
> > --- a/hw/ppc/pnv.c
> > +++ b/hw/ppc/pnv.c
> > @@ -1994,7 +1994,7 @@ static void pnv_machine_class_init(ObjectClass *o=
c, void *data)
> >       * RAM defaults to less than 2048 for 32-bit hosts, and large
> >       * enough to fit the maximum initrd size at it's load address
> >       */
> > -    mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
> > +    mc->default_ram_size =3D 1 * GiB;
>=20
> Maybe also just in case add before the definitions:
>=20
>   QEMU_BUILD_BUG_ON(INITRD_LOAD_ADDR + INITRD_MAX_SIZE > 1 * GiB);
>=20

or

    mc->default_ram_size =3D MAX(1 * GiB, INITRD_LOAD_ADDR + INITRD_MAX_SIZ=
E)

> ?
>=20
> >      mc->default_ram_id =3D "pnv.ram";
> >      ispc->print_info =3D pnv_pic_print_info;
> >      nc->nmi_monitor_handler =3D pnv_nmi;
> >=20
>=20


