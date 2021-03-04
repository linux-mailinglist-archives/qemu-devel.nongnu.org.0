Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368EF32CDF3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 08:53:56 +0100 (CET)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHiny-00007u-Qe
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 02:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lHim9-0007lR-KB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 02:52:01 -0500
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lHim6-0002CE-Fk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 02:52:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 2DB0626B463;
 Thu,  4 Mar 2021 08:51:44 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 4 Mar 2021
 08:51:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004249f7c83-7ec3-4544-80c6-29e37b205002,
 6375FD55785A853C7AA22583A95C3BC5ECAE091F) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 4 Mar 2021 08:51:42 +0100
From: Greg Kurz <groug@kaod.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
Message-ID: <20210304085142.34e960af@bahia.lan>
In-Reply-To: <20210303170743-mutt-send-email-mst@kernel.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: bc5f6049-f892-4e8e-bc71-2efaa5e27cf0
X-Ovh-Tracer-Id: 10488602060950903169
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtfedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Laurent
 Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 17:08:32 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Introduce the cpu_virtio_is_big_endian() generic helper to avoid
> > calling CPUClass internal virtio_is_big_endian() one.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Using virtio in the name here probably because virtio wants this?
> That doesn't sound like a good naming strategy, name should
> tell us what function does not how it's used.
>=20

I tend to agree but there was a consensus to deliberately put
virtio in the name when this was first introduced, so that
nobody else ever try to use it, as recorded in the commit log.

commit bf7663c4bd8f8f619d6dbb5780025d92ace250a8
Author: Greg Kurz <groug@kaod.org>
Date:   Tue Jun 24 19:33:21 2014 +0200

    cpu: introduce CPUClass::virtio_is_big_endian()
   =20
    If we want to support targets that can change endianness (modern PPC and
    ARM for the moment), we need to add a per-CPU class method to be called
    from the virtio code. The virtio_ prefix in the name is a hint for peop=
le
    to avoid misusage (aka. anywhere but from the virtio code).
   =20
    The default behaviour is to return the compile-time default target
    endianness.
   =20
    Suggested-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Is there something new on this front ? I'm not convinced that anything
but legacy virtio en POWER (or any other target that can change endian
at runtime) needs this. The next step I see for this is_big_endian()
stuff is deprecation and removal. In the meantime, I think we should
keep the virtio wording to prevent additional users for this.

> > ---
> >  include/hw/core/cpu.h | 9 +++++++++
> >  hw/core/cpu.c         | 8 ++++++--
> >  hw/virtio/virtio.c    | 4 +---
> >  3 files changed, 16 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 2d43f78819f..b12028c3c03 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -602,6 +602,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vadd=
r addr);
> >   */
> >  int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
> > =20
> > +/**
> > + * cpu_virtio_is_big_endian:
> > + * @cpu: CPU
> > +
> > + * Returns %true if a CPU which supports runtime configurable endianne=
ss
> > + * is currently big-endian.
> > + */
> > +bool cpu_virtio_is_big_endian(CPUState *cpu);
> > +
> >  #endif /* CONFIG_USER_ONLY */
> > =20
> >  /**
> > diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> > index 4dce35f832f..daaff56a79e 100644
> > --- a/hw/core/cpu.c
> > +++ b/hw/core/cpu.c
> > @@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState =
*cpu, uint8_t *buf, int reg)
> >      return 0;
> >  }
> > =20
> > -static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
> > +bool cpu_virtio_is_big_endian(CPUState *cpu)
> >  {
> > +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> > +
> > +    if (cc->virtio_is_big_endian) {
> > +        return cc->virtio_is_big_endian(cpu);
> > +    }
> >      return target_words_bigendian();
> >  }
> > =20
> > @@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void=
 *data)
> >      k->write_elf64_note =3D cpu_common_write_elf64_note;
> >      k->gdb_read_register =3D cpu_common_gdb_read_register;
> >      k->gdb_write_register =3D cpu_common_gdb_write_register;
> > -    k->virtio_is_big_endian =3D cpu_common_virtio_is_big_endian;
> >      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
> >      dc->realize =3D cpu_common_realizefn;
> >      dc->unrealize =3D cpu_common_unrealizefn;
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 1fd1917ca0f..fe6a4be99e4 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_e=
ndian(void)
> > =20
> >  static enum virtio_device_endian virtio_current_cpu_endian(void)
> >  {
> > -    CPUClass *cc =3D CPU_GET_CLASS(current_cpu);
> > -
> > -    if (cc->virtio_is_big_endian(current_cpu)) {
> > +    if (cpu_virtio_is_big_endian(current_cpu)) {
> >          return VIRTIO_DEVICE_ENDIAN_BIG;
> >      } else {
> >          return VIRTIO_DEVICE_ENDIAN_LITTLE;
> > --=20
> > 2.26.2
>=20
>=20


