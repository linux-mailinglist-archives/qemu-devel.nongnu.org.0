Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7B348DFD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:29:25 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPNEy-0000lu-DP
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPND8-0008TK-JQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:27:30 -0400
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPNCu-0002lD-UP
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:27:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id E285C2785CA;
 Thu, 25 Mar 2021 11:27:02 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Mar
 2021 11:27:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004bcc9ea12-a140-48f7-b1d5-9c78e6b60135,
 9FF242228AEDA557CE571C504A609AA08406F586) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 25 Mar 2021 11:27:01 +0100
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Crashes with qemu-system-ppc64
Message-ID: <20210325112701.24cfd644@bahia.lan>
In-Reply-To: <bcf868fa-c9b8-2f6c-489c-2b35b859789b@redhat.com>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <20210324000056.349b6782@bahia.lan>
 <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
 <bcf868fa-c9b8-2f6c-489c-2b35b859789b@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 477367a3-c53d-4bbe-86f6-01d68c18ead0
X-Ovh-Tracer-Id: 7311031046327736681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, QEMU
 Developers <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 10:17:55 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 24/03/21 00:35, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hmmm does this assert() matches your comment?
> >=20
> > -- >8 --
> > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > index cefc5eaa0a9..41cbee77d14 100644
> > --- a/hw/core/qdev.c
> > +++ b/hw/core/qdev.c
> > @@ -1130,6 +1130,8 @@ Object *qdev_get_machine(void)
> >   {
> >       static Object *dev;
> >=20
> > +    assert(phase_check(PHASE_MACHINE_CREATED));
> > +
>=20
> Very nice use of phase_check!  Kudos.
>=20

It seems promising at first sight but qdev_get_machine() gets
called under qemu_create_machine() long before phase is advanced
to PHASE_MACHINE_CREATED.

qemu-system-ppc64: ../../hw/core/qdev.c:1133: qdev_get_machine: Assertion `=
phase_check(PHASE_MACHINE_CREATED)' failed.

(gdb) bt
#0  0x00007ffff64a3708 in raise () at /lib64/power9/libc.so.6
#1  0x00007ffff6483bcc in abort () at /lib64/power9/libc.so.6
#2  0x00007ffff6497210 in __assert_fail_base () at /lib64/power9/libc.so.6
#3  0x00007ffff64972b4 in __assert_fail () at /lib64/power9/libc.so.6
#4  0x00000001009e7820 in qdev_get_machine () at ../../hw/core/qdev.c:1133
#5  0x00000001009e7820 in qdev_get_machine () at ../../hw/core/qdev.c:1129
#6  0x0000000100747894 in memory_region_do_init (mr=3D0x101261200, owner=3D=
0x0, name=3D<optimized out>, size=3D<optimized out>) at ../../softmmu/memor=
y.c:1177
#7  0x00000001007fccc4 in memory_map_init () at ../../softmmu/physmem.c:2630
#8  0x00000001007fccc4 in cpu_exec_init_all () at ../../softmmu/physmem.c:3=
034
#9  0x00000001007e9c9c in qemu_create_machine (machine_class=3Dmachine_clas=
s@entry=3D0x1014b96d0) at ../../softmmu/vl.c:2086
#10 0x00000001007eb8c0 in qemu_init (argc=3D<optimized out>, argv=3D<optimi=
zed out>, envp=3D<optimized out>) at ../../softmmu/vl.c:1640
#11 0x00000001002f53c8 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../../softmmu/main.c:49


static void memory_region_do_init(MemoryRegion *mr,
                                  Object *owner,
                                  const char *name,
                                  uint64_t size)
{
[...]
        if (!owner) {
            owner =3D container_get(qdev_get_machine(), "/unattached");
        }

The true condition for qdev_get_machine() to be functional is
actually that the following happened already:

    object_property_add_child(object_get_root(), "machine",
                              OBJECT(current_machine));

This is the case with the call stack ^^ and I don't see any valid
reason to forbid use of qdev_get_machine() here.

So I'm wondering if we shouldn't rather check the existence of the
"/machine" path in the QOM tree instead of checking the phase.

> Paolo
>=20


