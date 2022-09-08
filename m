Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF2E5B1D40
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:37:47 +0200 (CEST)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWGmt-0006G3-Ew
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGbb-0004Is-A9
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:26:04 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGbZ-0007or-B1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:26:03 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s206so16599128pgs.3
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=IcmIFuSXCNopV1Bh0Tj1kquO92Rp65/f5fmURKvO/aE=;
 b=jnkDRg43fGxbsHDwY/0QgSODN1RRyYB1TnY1mBMStiXHv1ePTSUmer086keK4cHXAX
 GbITVr0GFm95lorLBkwUTIGOaU9hxYhsf01nFWDXFWdVMLo1EerBZTm4j7X3Wg5vSwiY
 XLoq1GtORJenKGM4UsAACDx/gudmHRtxasASKxHZNO/sSpZUzNvY9wbUUUUAxSzkY7FJ
 Y0w/QYmJOG/dOIKEvQUPpEfboCUZXBRxk64E8gxf2Fea6XzUGBdUcw/5tnG83J3oeJ6e
 eITicBHFuBhRzQ8Ue2uorO/ia9MLYUtzOj/W2T8/5v5oHRIwztsHy/i7iG4ZPI4Jhcv+
 +EcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=IcmIFuSXCNopV1Bh0Tj1kquO92Rp65/f5fmURKvO/aE=;
 b=afqgR09LQyukiBB7PPupe42Rf19Zo+2FgIHlfSyvCv0vI9E94V5F1C7W0o9nL0Lp4w
 n91t2uaXSnJVMyI8Ud6t7d51CgaB8wehCgKNBAIMSkmBS3Fk4bOkgmBofHljboOTpDkA
 CdrNP/uiJrKnoKs1ROHYEKsDGP+Z8Eivzbcn8WuhORXjzVTY/lQU52MlbpdMMXJFdsR5
 CMcy8oou1gzfvhfw8l8E8IzAduIwiuKK240H+elx9MWcLg76suV3vq/2AKWpbFeM2njy
 cQeJlTzshJk6RN9Wu+CMF4CN8rQzzr3eXKiZoC5tpbIBj4LAJO8i3Avcv0+sRWyzbTzL
 Zqkg==
X-Gm-Message-State: ACgBeo06CoHSFo86K5pmv7XA8AgXpy1ITsxMBUeRZycLtfso6tY/dmDL
 hlCg8wKLsyxYm4Xth1qbfG1eU7OyxH/TqgrnmTc=
X-Google-Smtp-Source: AA6agR5aP5DD/c3D1GTRm56diFjlXru5V8kSt04fQ/Q5isaRNeIagzQDiKbvloAQQQ6gh30GCF0JMMPQs81OtHV2Gf8=
X-Received: by 2002:a63:5b15:0:b0:42b:bb74:a2da with SMTP id
 p21-20020a635b15000000b0042bbb74a2damr7663305pgb.406.1662639959411; Thu, 08
 Sep 2022 05:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661934573.git.aburgess@redhat.com>
 <0fbf2a5b12e3210ff3867d5cf7022b3f3462c9c8.1661934573.git.aburgess@redhat.com>
In-Reply-To: <0fbf2a5b12e3210ff3867d5cf7022b3f3462c9c8.1661934573.git.aburgess@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 14:25:32 +0200
Message-ID: <CAKmqyKP5EZDvks7C0HkeBaPRddEX6S5TwWUJfBQcAP-v1m7fUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: remove fflags, frm,
 and fcsr from riscv-*-fpu.xml
To: Andrew Burgess <aburgess@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 10:43 AM Andrew Burgess <aburgess@redhat.com> wrote:
>
> While testing some changes to GDB's handling for the RISC-V registers
> fcsr, fflags, and frm, I spotted that QEMU includes these registers
> twice in the target description it sends to GDB, once in the fpu
> feature, and once in the csr feature.
>
> Right now things basically work OK, QEMU maps these registers onto two
> different register numbers, e.g. fcsr maps to both 68 and 73, and GDB
> can use either of these to access the register.
>
> However, GDB's target descriptions don't really work this way, each
> register should appear just once in a target description, mapping the
> register name onto the number GDB should use when accessing the
> register on the target.  Duplicate register names actually result in
> duplicate registers on the GDB side, however, as the registers have
> the same name, the user can only access one of these registers.
>
> Currently GDB has a hack in place, specifically for RISC-V, to spot
> the duplicate copies of these three registers, and hide them from the
> user, ensuring the user only ever sees a single copy of each.
>
> In this commit I propose fixing this issue on the QEMU side, and in
> the process, simplify the fpu register handling a little.
>
> I think we should, remove fflags, frm, and fcsr from the two (32-bit
> and 64-bit) fpu feature xml files.  These files will only contain the
> 32 core floating point register f0 to f31.  The fflags, frm, and fcsr
> registers will continue to be advertised in the csr feature as they
> currently are.
>
> With that change made, I will simplify riscv_gdb_get_fpu and
> riscv_gdb_set_fpu, removing the extra handling for the 3 status
> registers.
>
> Signed-off-by: Andrew Burgess <aburgess@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdb-xml/riscv-32bit-fpu.xml |  4 ----
>  gdb-xml/riscv-64bit-fpu.xml |  4 ----
>  target/riscv/gdbstub.c      | 32 ++------------------------------
>  3 files changed, 2 insertions(+), 38 deletions(-)
>
> diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
> index 1eaae9119e..84a44ba8df 100644
> --- a/gdb-xml/riscv-32bit-fpu.xml
> +++ b/gdb-xml/riscv-32bit-fpu.xml
> @@ -43,8 +43,4 @@
>    <reg name="ft9" bitsize="32" type="ieee_single"/>
>    <reg name="ft10" bitsize="32" type="ieee_single"/>
>    <reg name="ft11" bitsize="32" type="ieee_single"/>
> -
> -  <reg name="fflags" bitsize="32" type="int" regnum="66"/>
> -  <reg name="frm" bitsize="32" type="int" regnum="67"/>
> -  <reg name="fcsr" bitsize="32" type="int" regnum="68"/>
>  </feature>
> diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
> index 794854cc01..9856a9d1d3 100644
> --- a/gdb-xml/riscv-64bit-fpu.xml
> +++ b/gdb-xml/riscv-64bit-fpu.xml
> @@ -49,8 +49,4 @@
>    <reg name="ft9" bitsize="64" type="riscv_double"/>
>    <reg name="ft10" bitsize="64" type="riscv_double"/>
>    <reg name="ft11" bitsize="64" type="riscv_double"/>
> -
> -  <reg name="fflags" bitsize="32" type="int" regnum="66"/>
> -  <reg name="frm" bitsize="32" type="int" regnum="67"/>
> -  <reg name="fcsr" bitsize="32" type="int" regnum="68"/>
>  </feature>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 9ed049c29e..9974b7aac6 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -114,20 +114,6 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
>          if (env->misa_ext & RVF) {
>              return gdb_get_reg32(buf, env->fpr[n]);
>          }
> -    /* there is hole between ft11 and fflags in fpu.xml */
> -    } else if (n < 36 && n > 32) {
> -        target_ulong val = 0;
> -        int result;
> -        /*
> -         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
> -         * register 33, so we recalculate the map index.
> -         * This also works for CSR_FRM and CSR_FCSR.
> -         */
> -        result = riscv_csrrw_debug(env, n - 32, &val,
> -                                   0, 0);
> -        if (result == RISCV_EXCP_NONE) {
> -            return gdb_get_regl(buf, val);
> -        }
>      }
>      return 0;
>  }
> @@ -137,20 +123,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>      if (n < 32) {
>          env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
>          return sizeof(uint64_t);
> -    /* there is hole between ft11 and fflags in fpu.xml */
> -    } else if (n < 36 && n > 32) {
> -        target_ulong val = ldtul_p(mem_buf);
> -        int result;
> -        /*
> -         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
> -         * register 33, so we recalculate the map index.
> -         * This also works for CSR_FRM and CSR_FCSR.
> -         */
> -        result = riscv_csrrw_debug(env, n - 32, NULL,
> -                                   val, -1);
> -        if (result == RISCV_EXCP_NONE) {
> -            return sizeof(target_ulong);
> -        }
>      }
>      return 0;
>  }
> @@ -404,10 +376,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>      CPURISCVState *env = &cpu->env;
>      if (env->misa_ext & RVD) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> -                                 36, "riscv-64bit-fpu.xml", 0);
> +                                 32, "riscv-64bit-fpu.xml", 0);
>      } else if (env->misa_ext & RVF) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> -                                 36, "riscv-32bit-fpu.xml", 0);
> +                                 32, "riscv-32bit-fpu.xml", 0);
>      }
>      if (env->misa_ext & RVV) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
> --
> 2.25.4
>
>

