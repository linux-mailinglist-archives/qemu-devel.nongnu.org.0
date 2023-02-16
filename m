Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC26698D90
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYLv-00047o-Q9; Thu, 16 Feb 2023 02:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pSYLk-00044u-Jk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:06:36 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pSYLg-0001Rm-PS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:06:36 -0500
Received: by mail-ej1-x636.google.com with SMTP id he33so2824704ejc.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ajHqj5rfj+EUGN3gc6436+bi9dnpuBxhGl0ivup5pWk=;
 b=hAdEgpOweblxLHmUV5gXEdj00sspdwRrDo/lDcMmbbvllkGuqZ3RdQ5c2HN8/f5T/H
 6lPvClL7gQeT4LRwj4rgljODJekxnC7FBslmsDB6ZGbx3im99h+nkPJ5bnPonF5ROe+Y
 YcGWemNC1Q3me6n3EAY5OGhfZFSeg3rP/MAQSRxfkSAewcr8SmylZKhRLTTmMXvj+Tsn
 BPxf+I4bUf1fOurHHbalaV6d16KXs2TctuCnullMTqWzroIz9CNnKcU09xrTalPpSPXB
 kbhYAu3Hm+l+kjsGTFoXBbEElEXXfPbKocLom12PZP1vK0YExgC5ziKzU1yPTz2j5Ydg
 Kshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ajHqj5rfj+EUGN3gc6436+bi9dnpuBxhGl0ivup5pWk=;
 b=pEhxQLJSZTxKKHGoBb5F9xOExZV5nF0/AcrC1uCrlzt/IFtnMtSiORbCZ7bauLVek3
 13gJL5Ui9aQyNQEHVZyhrkX6yPr/gfWetPOEnbHkZsPHDu2QVIB66nj3274kHUgrflEp
 O1pq2pslObyiZF93jZk8OpnzeSWUUuDDp+Ii1jdbA+mposWeixGG8GZwHyuTrl80YqF5
 OHB8EmdFSTt1e/y6tpreSspYm+gE5RoFz9IvIjzOFEDELxRny9k++eNsSDEn5riHQo7A
 gPlBvrDlJ9Ew5agrOdeXj4iFOXkKygl4BRFEX4YJzBuEzPEgvN2bRBT7d6EMAAN3pvh5
 9vRw==
X-Gm-Message-State: AO0yUKVEW/wO18Ar0BsBOfyhKdKhPgfbFKMUuZQ4OEVznAw6HLQ05/F3
 DtEUlX0Qea7kRBLkjnr0DeqIzD4SEtsUY0LXh3Y=
X-Google-Smtp-Source: AK7set8lVOxN2XHFZiRHAWP14AT8kIZkoKeJr9EBbL7qjoNIz5yDHd6SjViNG2JqnX6/UrEk6Z+kaBNdVmoTN3bNfyE=
X-Received: by 2002:a17:906:fac3:b0:8b1:2ebf:386b with SMTP id
 lu3-20020a170906fac300b008b12ebf386bmr2409825ejb.12.1676531190208; Wed, 15
 Feb 2023 23:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20221230162419.3106998-1-richard.henderson@linaro.org>
 <a44ca487-8ce6-c5d3-c415-b11e1b8e4be1@linaro.org>
In-Reply-To: <a44ca487-8ce6-c5d3-c415-b11e1b8e4be1@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 16 Feb 2023 01:06:18 -0600
Message-ID: <CAJy5ezr=G6sqcV6gPQT9dyx_yuikxCJtEGZ2E4CWWAn1oqvHAQ@mail.gmail.com>
Subject: Re: [PATCH] target/microblaze: Add gdbstub xml
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000c1b9a05f4cbd674"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000c1b9a05f4cbd674
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 12:56 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Alex, Edgar, this has been reviewed.  Will either of you take it with you=
r
> trees, or shall
> I just queue it through tcg-next?
>
>

Hi Richard, yeah if you don't mind, please take it through your tree!

Thanks,
Edgar



> r~
>
> On 12/30/22 06:24, Richard Henderson wrote:
> > Mirroring the upstream gdb xml files, the two stack boundary
> > registers are separated out.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >
> > I did this thinking I would be fixing:
> >
> >    TEST    basic gdbstub support on microblaze
> >    Truncated register 35 in remote 'g' packet
> >    Traceback (most recent call last):
> >      File "/home/rth/qemu/src/tests/tcg/multiarch/gdbstub/sha1.py",
> >        line 71, in <module> if gdb.parse_and_eval('$pc') =3D=3D 0:
> >    gdb.error: No registers.
> >
> > but in the end it turned out that the gdb-multiarch supplied
> > by ubuntu 22.04 simply doesn't support MicroBlaze, as can be
> > seen with the "set architecture" command within gdb.
> >
> > (I built gdb from source, to try and debug why this still wasn't
> > working, only to find that it did.  :-P)
> >
> > Alex, any way to modify our gdb test to fail gracefully here?
> >
> > Regardless, having proper xml for all of our targets seems
> > like the correct way forward.
> >
> >
> > r~
> >
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> > ---
> >   configs/targets/microblaze-linux-user.mak   |  1 +
> >   configs/targets/microblaze-softmmu.mak      |  1 +
> >   configs/targets/microblazeel-linux-user.mak |  1 +
> >   configs/targets/microblazeel-softmmu.mak    |  1 +
> >   target/microblaze/cpu.h                     |  2 +
> >   target/microblaze/cpu.c                     |  7 ++-
> >   target/microblaze/gdbstub.c                 | 51 +++++++++++-----
> >   gdb-xml/microblaze-core.xml                 | 67 ++++++++++++++++++++=
+
> >   gdb-xml/microblaze-stack-protect.xml        | 12 ++++
> >   9 files changed, 128 insertions(+), 15 deletions(-)
> >   create mode 100644 gdb-xml/microblaze-core.xml
> >   create mode 100644 gdb-xml/microblaze-stack-protect.xml
> >
> > diff --git a/configs/targets/microblaze-linux-user.mak
> b/configs/targets/microblaze-linux-user.mak
> > index 4249a37f65..0a2322c249 100644
> > --- a/configs/targets/microblaze-linux-user.mak
> > +++ b/configs/targets/microblaze-linux-user.mak
> > @@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=3Dcommon
> >   TARGET_SYSTBL=3Dsyscall.tbl
> >   TARGET_BIG_ENDIAN=3Dy
> >   TARGET_HAS_BFLT=3Dy
> > +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml
> gdb-xml/microblaze-stack-protect.xml
> > diff --git a/configs/targets/microblaze-softmmu.mak
> b/configs/targets/microblaze-softmmu.mak
> > index 8385e2d333..e84c0cc728 100644
> > --- a/configs/targets/microblaze-softmmu.mak
> > +++ b/configs/targets/microblaze-softmmu.mak
> > @@ -2,3 +2,4 @@ TARGET_ARCH=3Dmicroblaze
> >   TARGET_BIG_ENDIAN=3Dy
> >   TARGET_SUPPORTS_MTTCG=3Dy
> >   TARGET_NEED_FDT=3Dy
> > +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml
> gdb-xml/microblaze-stack-protect.xml
> > diff --git a/configs/targets/microblazeel-linux-user.mak
> b/configs/targets/microblazeel-linux-user.mak
> > index d0e775d840..270743156a 100644
> > --- a/configs/targets/microblazeel-linux-user.mak
> > +++ b/configs/targets/microblazeel-linux-user.mak
> > @@ -2,3 +2,4 @@ TARGET_ARCH=3Dmicroblaze
> >   TARGET_SYSTBL_ABI=3Dcommon
> >   TARGET_SYSTBL=3Dsyscall.tbl
> >   TARGET_HAS_BFLT=3Dy
> > +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml
> gdb-xml/microblaze-stack-protect.xml
> > diff --git a/configs/targets/microblazeel-softmmu.mak
> b/configs/targets/microblazeel-softmmu.mak
> > index af40391f2f..9b688036bd 100644
> > --- a/configs/targets/microblazeel-softmmu.mak
> > +++ b/configs/targets/microblazeel-softmmu.mak
> > @@ -1,3 +1,4 @@
> >   TARGET_ARCH=3Dmicroblaze
> >   TARGET_SUPPORTS_MTTCG=3Dy
> >   TARGET_NEED_FDT=3Dy
> > +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml
> gdb-xml/microblaze-stack-protect.xml
> > diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> > index 1e84dd8f47..e541fbb0b3 100644
> > --- a/target/microblaze/cpu.h
> > +++ b/target/microblaze/cpu.h
> > @@ -367,6 +367,8 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState
> *cpu, vaddr addr,
> >                                           MemTxAttrs *attrs);
> >   int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
> >   int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> > +int mb_cpu_gdb_read_stack_protect(CPUArchState *cpu, GByteArray *buf,
> int reg);
> > +int mb_cpu_gdb_write_stack_protect(CPUArchState *cpu, uint8_t *buf, in=
t
> reg);
> >
> >   static inline uint32_t mb_cpu_read_msr(const CPUMBState *env)
> >   {
> > diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> > index 817681f9b2..a2d2f5c340 100644
> > --- a/target/microblaze/cpu.c
> > +++ b/target/microblaze/cpu.c
> > @@ -28,6 +28,7 @@
> >   #include "qemu/module.h"
> >   #include "hw/qdev-properties.h"
> >   #include "exec/exec-all.h"
> > +#include "exec/gdbstub.h"
> >   #include "fpu/softfloat-helpers.h"
> >
> >   static const struct {
> > @@ -294,6 +295,9 @@ static void mb_cpu_initfn(Object *obj)
> >       CPUMBState *env =3D &cpu->env;
> >
> >       cpu_set_cpustate_pointers(cpu);
> > +    gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
> > +                             mb_cpu_gdb_write_stack_protect, 2,
> > +                             "microblaze-stack-protect.xml", 0);
> >
> >       set_float_rounding_mode(float_round_nearest_even, &env->fp_status=
);
> >
> > @@ -422,7 +426,8 @@ static void mb_cpu_class_init(ObjectClass *oc, void
> *data)
> >       cc->sysemu_ops =3D &mb_sysemu_ops;
> >   #endif
> >       device_class_set_props(dc, mb_properties);
> > -    cc->gdb_num_core_regs =3D 32 + 27;
> > +    cc->gdb_num_core_regs =3D 32 + 25;
> > +    cc->gdb_core_xml_file =3D "microblaze-core.xml";
> >
> >       cc->disas_set_info =3D mb_disas_set_info;
> >       cc->tcg_ops =3D &mb_tcg_ops;
> > diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
> > index 2e6e070051..8143fcae88 100644
> > --- a/target/microblaze/gdbstub.c
> > +++ b/target/microblaze/gdbstub.c
> > @@ -39,8 +39,11 @@ enum {
> >       GDB_PVR0  =3D 32 + 6,
> >       GDB_PVR11 =3D 32 + 17,
> >       GDB_EDR   =3D 32 + 18,
> > -    GDB_SLR   =3D 32 + 25,
> > -    GDB_SHR   =3D 32 + 26,
> > +};
> > +
> > +enum {
> > +    GDB_SP_SHL,
> > +    GDB_SP_SHR,
> >   };
> >
> >   int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n=
)
> > @@ -83,12 +86,6 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArra=
y
> *mem_buf, int n)
> >       case GDB_EDR:
> >           val =3D env->edr;
> >           break;
> > -    case GDB_SLR:
> > -        val =3D env->slr;
> > -        break;
> > -    case GDB_SHR:
> > -        val =3D env->shr;
> > -        break;
> >       default:
> >           /* Other SRegs aren't modeled, so report a value of 0 */
> >           val =3D 0;
> > @@ -97,6 +94,23 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArra=
y
> *mem_buf, int n)
> >       return gdb_get_reg32(mem_buf, val);
> >   }
> >
> > +int mb_cpu_gdb_read_stack_protect(CPUMBState *env, GByteArray *mem_buf=
,
> int n)
> > +{
> > +    uint32_t val;
> > +
> > +    switch (n) {
> > +    case GDB_SP_SHL:
> > +        val =3D env->slr;
> > +        break;
> > +    case GDB_SP_SHR:
> > +        val =3D env->shr;
> > +        break;
> > +    default:
> > +        return 0;
> > +    }
> > +    return gdb_get_reg32(mem_buf, val);
> > +}
> > +
> >   int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
> >   {
> >       MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(cs);
> > @@ -135,12 +149,21 @@ int mb_cpu_gdb_write_register(CPUState *cs,
> uint8_t *mem_buf, int n)
> >       case GDB_EDR:
> >           env->edr =3D tmp;
> >           break;
> > -    case GDB_SLR:
> > -        env->slr =3D tmp;
> > -        break;
> > -    case GDB_SHR:
> > -        env->shr =3D tmp;
> > -        break;
> > +    }
> > +    return 4;
> > +}
> > +
> > +int mb_cpu_gdb_write_stack_protect(CPUMBState *env, uint8_t *mem_buf,
> int n)
> > +{
> > +    switch (n) {
> > +    case GDB_SP_SHL:
> > +        env->slr =3D ldl_p(mem_buf);
> > +        break;
> > +    case GDB_SP_SHR:
> > +        env->shr =3D ldl_p(mem_buf);
> > +        break;
> > +    default:
> > +        return 0;
> >       }
> >       return 4;
> >   }
> > diff --git a/gdb-xml/microblaze-core.xml b/gdb-xml/microblaze-core.xml
> > new file mode 100644
> > index 0000000000..becf77c89c
> > --- /dev/null
> > +++ b/gdb-xml/microblaze-core.xml
> > @@ -0,0 +1,67 @@
> > +<?xml version=3D"1.0"?>
> > +<!-- Copyright (C) 2008 Free Software Foundation, Inc.
> > +
> > +     Copying and distribution of this file, with or without
> modification,
> > +     are permitted in any medium without royalty provided the copyrigh=
t
> > +     notice and this notice are preserved.  -->
> > +
> > +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> > +<feature name=3D"org.gnu.gdb.microblaze.core">
> > +  <reg name=3D"r0" bitsize=3D"32" regnum=3D"0"/>
> > +  <reg name=3D"r1" bitsize=3D"32" type=3D"data_ptr"/>
> > +  <reg name=3D"r2" bitsize=3D"32"/>
> > +  <reg name=3D"r3" bitsize=3D"32"/>
> > +  <reg name=3D"r4" bitsize=3D"32"/>
> > +  <reg name=3D"r5" bitsize=3D"32"/>
> > +  <reg name=3D"r6" bitsize=3D"32"/>
> > +  <reg name=3D"r7" bitsize=3D"32"/>
> > +  <reg name=3D"r8" bitsize=3D"32"/>
> > +  <reg name=3D"r9" bitsize=3D"32"/>
> > +  <reg name=3D"r10" bitsize=3D"32"/>
> > +  <reg name=3D"r11" bitsize=3D"32"/>
> > +  <reg name=3D"r12" bitsize=3D"32"/>
> > +  <reg name=3D"r13" bitsize=3D"32"/>
> > +  <reg name=3D"r14" bitsize=3D"32"/>
> > +  <reg name=3D"r15" bitsize=3D"32"/>
> > +  <reg name=3D"r16" bitsize=3D"32"/>
> > +  <reg name=3D"r17" bitsize=3D"32"/>
> > +  <reg name=3D"r18" bitsize=3D"32"/>
> > +  <reg name=3D"r19" bitsize=3D"32"/>
> > +  <reg name=3D"r20" bitsize=3D"32"/>
> > +  <reg name=3D"r21" bitsize=3D"32"/>
> > +  <reg name=3D"r22" bitsize=3D"32"/>
> > +  <reg name=3D"r23" bitsize=3D"32"/>
> > +  <reg name=3D"r24" bitsize=3D"32"/>
> > +  <reg name=3D"r25" bitsize=3D"32"/>
> > +  <reg name=3D"r26" bitsize=3D"32"/>
> > +  <reg name=3D"r27" bitsize=3D"32"/>
> > +  <reg name=3D"r28" bitsize=3D"32"/>
> > +  <reg name=3D"r29" bitsize=3D"32"/>
> > +  <reg name=3D"r30" bitsize=3D"32"/>
> > +  <reg name=3D"r31" bitsize=3D"32"/>
> > +  <reg name=3D"rpc" bitsize=3D"32" type=3D"code_ptr"/>
> > +  <reg name=3D"rmsr" bitsize=3D"32"/>
> > +  <reg name=3D"rear" bitsize=3D"32"/>
> > +  <reg name=3D"resr" bitsize=3D"32"/>
> > +  <reg name=3D"rfsr" bitsize=3D"32"/>
> > +  <reg name=3D"rbtr" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr0" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr1" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr2" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr3" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr4" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr5" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr6" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr7" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr8" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr9" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr10" bitsize=3D"32"/>
> > +  <reg name=3D"rpvr11" bitsize=3D"32"/>
> > +  <reg name=3D"redr" bitsize=3D"32"/>
> > +  <reg name=3D"rpid" bitsize=3D"32"/>
> > +  <reg name=3D"rzpr" bitsize=3D"32"/>
> > +  <reg name=3D"rtlbx" bitsize=3D"32"/>
> > +  <reg name=3D"rtlbsx" bitsize=3D"32"/>
> > +  <reg name=3D"rtlblo" bitsize=3D"32"/>
> > +  <reg name=3D"rtlbhi" bitsize=3D"32"/>
> > +</feature>
> > diff --git a/gdb-xml/microblaze-stack-protect.xml
> b/gdb-xml/microblaze-stack-protect.xml
> > new file mode 100644
> > index 0000000000..997301e8a2
> > --- /dev/null
> > +++ b/gdb-xml/microblaze-stack-protect.xml
> > @@ -0,0 +1,12 @@
> > +<?xml version=3D"1.0"?>
> > +<!-- Copyright (C) 2008 Free Software Foundation, Inc.
> > +
> > +     Copying and distribution of this file, with or without
> modification,
> > +     are permitted in any medium without royalty provided the copyrigh=
t
> > +     notice and this notice are preserved.  -->
> > +
> > +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> > +<feature name=3D"org.gnu.gdb.microblaze.stack-protect">
> > +  <reg name=3D"rslr" bitsize=3D"32"/>
> > +  <reg name=3D"rshr" bitsize=3D"32"/>
> > +</feature>
>
>

--0000000000000c1b9a05f4cbd674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 16, 2023 at 12:56 AM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Alex, Edgar, this has been review=
ed.=C2=A0 Will either of you take it with your trees, or shall <br>
I just queue it through tcg-next?<br>
<br></blockquote><div><br></div><div><br></div><div>Hi Richard, yeah if you=
 don&#39;t mind, please take it through your tree!<div><br></div><div>Thank=
s,</div><div>Edgar</div><br class=3D"gmail-Apple-interchange-newline"></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
<br>
On 12/30/22 06:24, Richard Henderson wrote:<br>
&gt; Mirroring the upstream gdb xml files, the two stack boundary<br>
&gt; registers are separated out.<br>
&gt; <br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; I did this thinking I would be fixing:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 TEST=C2=A0 =C2=A0 basic gdbstub support on microblaze<br>
&gt;=C2=A0 =C2=A0 Truncated register 35 in remote &#39;g&#39; packet<br>
&gt;=C2=A0 =C2=A0 Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 File &quot;/home/rth/qemu/src/tests/tcg/multiarch/=
gdbstub/sha1.py&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 line 71, in &lt;module&gt; if gdb.parse_and=
_eval(&#39;$pc&#39;) =3D=3D 0:<br>
&gt;=C2=A0 =C2=A0 gdb.error: No registers.<br>
&gt; <br>
&gt; but in the end it turned out that the gdb-multiarch supplied<br>
&gt; by ubuntu 22.04 simply doesn&#39;t support MicroBlaze, as can be<br>
&gt; seen with the &quot;set architecture&quot; command within gdb.<br>
&gt; <br>
&gt; (I built gdb from source, to try and debug why this still wasn&#39;t<b=
r>
&gt; working, only to find that it did.=C2=A0 :-P)<br>
&gt; <br>
&gt; Alex, any way to modify our gdb test to fail gracefully here?<br>
&gt; <br>
&gt; Regardless, having proper xml for all of our targets seems<br>
&gt; like the correct way forward.<br>
&gt; <br>
&gt; <br>
&gt; r~<br>
&gt; <br>
&gt; Cc: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" tar=
get=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; Cc: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com" =
target=3D"_blank">edgar.iglesias@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configs/targets/microblaze-linux-user.mak=C2=A0 =C2=A0|=C2=
=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/targets/microblaze-softmmu.mak=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/targets/microblazeel-linux-user.mak |=C2=A0 1 +<br=
>
&gt;=C2=A0 =C2=A0configs/targets/microblazeel-softmmu.mak=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 =C2=A0target/microblaze/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0target/microblaze/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++-<br>
&gt;=C2=A0 =C2=A0target/microblaze/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 +++++++++++-----<br>
&gt;=C2=A0 =C2=A0gdb-xml/microblaze-core.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 67 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0gdb-xml/microblaze-stack-protect.xml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 12 ++++<br>
&gt;=C2=A0 =C2=A09 files changed, 128 insertions(+), 15 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 gdb-xml/microblaze-core.xml<br>
&gt;=C2=A0 =C2=A0create mode 100644 gdb-xml/microblaze-stack-protect.xml<br=
>
&gt; <br>
&gt; diff --git a/configs/targets/microblaze-linux-user.mak b/configs/targe=
ts/microblaze-linux-user.mak<br>
&gt; index 4249a37f65..0a2322c249 100644<br>
&gt; --- a/configs/targets/microblaze-linux-user.mak<br>
&gt; +++ b/configs/targets/microblaze-linux-user.mak<br>
&gt; @@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=3Dcommon<br>
&gt;=C2=A0 =C2=A0TARGET_SYSTBL=3Dsyscall.tbl<br>
&gt;=C2=A0 =C2=A0TARGET_BIG_ENDIAN=3Dy<br>
&gt;=C2=A0 =C2=A0TARGET_HAS_BFLT=3Dy<br>
&gt; +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml gdb-xml/microblaze-sta=
ck-protect.xml<br>
&gt; diff --git a/configs/targets/microblaze-softmmu.mak b/configs/targets/=
microblaze-softmmu.mak<br>
&gt; index 8385e2d333..e84c0cc728 100644<br>
&gt; --- a/configs/targets/microblaze-softmmu.mak<br>
&gt; +++ b/configs/targets/microblaze-softmmu.mak<br>
&gt; @@ -2,3 +2,4 @@ TARGET_ARCH=3Dmicroblaze<br>
&gt;=C2=A0 =C2=A0TARGET_BIG_ENDIAN=3Dy<br>
&gt;=C2=A0 =C2=A0TARGET_SUPPORTS_MTTCG=3Dy<br>
&gt;=C2=A0 =C2=A0TARGET_NEED_FDT=3Dy<br>
&gt; +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml gdb-xml/microblaze-sta=
ck-protect.xml<br>
&gt; diff --git a/configs/targets/microblazeel-linux-user.mak b/configs/tar=
gets/microblazeel-linux-user.mak<br>
&gt; index d0e775d840..270743156a 100644<br>
&gt; --- a/configs/targets/microblazeel-linux-user.mak<br>
&gt; +++ b/configs/targets/microblazeel-linux-user.mak<br>
&gt; @@ -2,3 +2,4 @@ TARGET_ARCH=3Dmicroblaze<br>
&gt;=C2=A0 =C2=A0TARGET_SYSTBL_ABI=3Dcommon<br>
&gt;=C2=A0 =C2=A0TARGET_SYSTBL=3Dsyscall.tbl<br>
&gt;=C2=A0 =C2=A0TARGET_HAS_BFLT=3Dy<br>
&gt; +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml gdb-xml/microblaze-sta=
ck-protect.xml<br>
&gt; diff --git a/configs/targets/microblazeel-softmmu.mak b/configs/target=
s/microblazeel-softmmu.mak<br>
&gt; index af40391f2f..9b688036bd 100644<br>
&gt; --- a/configs/targets/microblazeel-softmmu.mak<br>
&gt; +++ b/configs/targets/microblazeel-softmmu.mak<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt;=C2=A0 =C2=A0TARGET_ARCH=3Dmicroblaze<br>
&gt;=C2=A0 =C2=A0TARGET_SUPPORTS_MTTCG=3Dy<br>
&gt;=C2=A0 =C2=A0TARGET_NEED_FDT=3Dy<br>
&gt; +TARGET_XML_FILES=3Dgdb-xml/microblaze-core.xml gdb-xml/microblaze-sta=
ck-protect.xml<br>
&gt; diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h<br>
&gt; index 1e84dd8f47..e541fbb0b3 100644<br>
&gt; --- a/target/microblaze/cpu.h<br>
&gt; +++ b/target/microblaze/cpu.h<br>
&gt; @@ -367,6 +367,8 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *=
cpu, vaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MemTxAttrs *attrs);<br>
&gt;=C2=A0 =C2=A0int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *bu=
f, int reg);<br>
&gt;=C2=A0 =C2=A0int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf,=
 int reg);<br>
&gt; +int mb_cpu_gdb_read_stack_protect(CPUArchState *cpu, GByteArray *buf,=
 int reg);<br>
&gt; +int mb_cpu_gdb_write_stack_protect(CPUArchState *cpu, uint8_t *buf, i=
nt reg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static inline uint32_t mb_cpu_read_msr(const CPUMBState *e=
nv)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c<br>
&gt; index 817681f9b2..a2d2f5c340 100644<br>
&gt; --- a/target/microblaze/cpu.c<br>
&gt; +++ b/target/microblaze/cpu.c<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/module.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt; +#include &quot;exec/gdbstub.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;fpu/softfloat-helpers.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const struct {<br>
&gt; @@ -294,6 +295,9 @@ static void mb_cpu_initfn(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUMBState *env =3D &amp;cpu-&gt;env;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_set_cpustate_pointers(cpu);<br>
&gt; +=C2=A0 =C2=A0 gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stac=
k_protect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mb_cpu_gdb_write_stack_protect, 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;microblaze-stack-protect.xml&quot;=
, 0);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0set_float_rounding_mode(float_round_nearest_=
even, &amp;env-&gt;fp_status);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -422,7 +426,8 @@ static void mb_cpu_class_init(ObjectClass *oc, voi=
d *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cc-&gt;sysemu_ops =3D &amp;mb_sysemu_ops;<br=
>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, mb_properties);<b=
r>
&gt; -=C2=A0 =C2=A0 cc-&gt;gdb_num_core_regs =3D 32 + 27;<br>
&gt; +=C2=A0 =C2=A0 cc-&gt;gdb_num_core_regs =3D 32 + 25;<br>
&gt; +=C2=A0 =C2=A0 cc-&gt;gdb_core_xml_file =3D &quot;microblaze-core.xml&=
quot;;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cc-&gt;disas_set_info =3D mb_disas_set_info;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_ops =3D &amp;mb_tcg_ops;<br>
&gt; diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c=
<br>
&gt; index 2e6e070051..8143fcae88 100644<br>
&gt; --- a/target/microblaze/gdbstub.c<br>
&gt; +++ b/target/microblaze/gdbstub.c<br>
&gt; @@ -39,8 +39,11 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GDB_PVR0=C2=A0 =3D 32 + 6,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GDB_PVR11 =3D 32 + 17,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GDB_EDR=C2=A0 =C2=A0=3D 32 + 18,<br>
&gt; -=C2=A0 =C2=A0 GDB_SLR=C2=A0 =C2=A0=3D 32 + 25,<br>
&gt; -=C2=A0 =C2=A0 GDB_SHR=C2=A0 =C2=A0=3D 32 + 26,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 GDB_SP_SHL,<br>
&gt; +=C2=A0 =C2=A0 GDB_SP_SHR,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem=
_buf, int n)<br>
&gt; @@ -83,12 +86,6 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArr=
ay *mem_buf, int n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case GDB_EDR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D env-&gt;edr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 case GDB_SLR:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D env-&gt;slr;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case GDB_SHR:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D env-&gt;shr;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Other SRegs aren&#39;t mode=
led, so report a value of 0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D 0;<br>
&gt; @@ -97,6 +94,23 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArr=
ay *mem_buf, int n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return gdb_get_reg32(mem_buf, val);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +int mb_cpu_gdb_read_stack_protect(CPUMBState *env, GByteArray *mem_bu=
f, int n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (n) {<br>
&gt; +=C2=A0 =C2=A0 case GDB_SP_SHL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D env-&gt;slr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case GDB_SP_SHR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D env-&gt;shr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return gdb_get_reg32(mem_buf, val);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_b=
uf, int n)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(cs);<b=
r>
&gt; @@ -135,12 +149,21 @@ int mb_cpu_gdb_write_register(CPUState *cs, uint=
8_t *mem_buf, int n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case GDB_EDR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;edr =3D tmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 case GDB_SLR:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;slr =3D tmp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case GDB_SHR:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;shr =3D tmp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 4;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int mb_cpu_gdb_write_stack_protect(CPUMBState *env, uint8_t *mem_buf,=
 int n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (n) {<br>
&gt; +=C2=A0 =C2=A0 case GDB_SP_SHL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;slr =3D ldl_p(mem_buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case GDB_SP_SHR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;shr =3D ldl_p(mem_buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 4;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/gdb-xml/microblaze-core.xml b/gdb-xml/microblaze-core.xml=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..becf77c89c<br>
&gt; --- /dev/null<br>
&gt; +++ b/gdb-xml/microblaze-core.xml<br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
&gt; +&lt;!-- Copyright (C) 2008 Free Software Foundation, Inc.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Copying and distribution of this file, with or wi=
thout modification,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0are permitted in any medium without royalty provi=
ded the copyright<br>
&gt; +=C2=A0 =C2=A0 =C2=A0notice and this notice are preserved.=C2=A0 --&gt=
;<br>
&gt; +<br>
&gt; +&lt;!DOCTYPE feature SYSTEM &quot;gdb-target.dtd&quot;&gt;<br>
&gt; +&lt;feature name=3D&quot;org.gnu.gdb.microblaze.core&quot;&gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;r0&quot; bitsize=3D&quot;32&quot; regnum=
=3D&quot;0&quot;/&gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;r1&quot; bitsize=3D&quot;32&quot; type=3D=
&quot;data_ptr&quot;/&gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;r2&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r3&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r4&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r5&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r6&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r7&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r8&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r9&quot; bitsize=3D&quot;32&quot;/&gt;<br=
>
&gt; +=C2=A0 &lt;reg name=3D&quot;r10&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r11&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r12&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r13&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r14&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r15&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r16&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r17&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r18&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r19&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r20&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r21&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r22&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r23&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r24&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r25&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r26&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r27&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r28&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r29&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r30&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;r31&quot; bitsize=3D&quot;32&quot;/&gt;<b=
r>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpc&quot; bitsize=3D&quot;32&quot; type=
=3D&quot;code_ptr&quot;/&gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rmsr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rear&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;resr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rfsr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rbtr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr0&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr1&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr2&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr3&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr4&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr5&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr6&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr7&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr8&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr9&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr10&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpvr11&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;redr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rpid&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rzpr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rtlbx&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rtlbsx&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rtlblo&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rtlbhi&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +&lt;/feature&gt;<br>
&gt; diff --git a/gdb-xml/microblaze-stack-protect.xml b/gdb-xml/microblaze=
-stack-protect.xml<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..997301e8a2<br>
&gt; --- /dev/null<br>
&gt; +++ b/gdb-xml/microblaze-stack-protect.xml<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
&gt; +&lt;!-- Copyright (C) 2008 Free Software Foundation, Inc.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Copying and distribution of this file, with or wi=
thout modification,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0are permitted in any medium without royalty provi=
ded the copyright<br>
&gt; +=C2=A0 =C2=A0 =C2=A0notice and this notice are preserved.=C2=A0 --&gt=
;<br>
&gt; +<br>
&gt; +&lt;!DOCTYPE feature SYSTEM &quot;gdb-target.dtd&quot;&gt;<br>
&gt; +&lt;feature name=3D&quot;org.gnu.gdb.microblaze.stack-protect&quot;&g=
t;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rslr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +=C2=A0 &lt;reg name=3D&quot;rshr&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; +&lt;/feature&gt;<br>
<br>
</blockquote></div></div>

--0000000000000c1b9a05f4cbd674--

