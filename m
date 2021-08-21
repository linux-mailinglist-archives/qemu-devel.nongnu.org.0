Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A43F391C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:42:25 +0200 (CEST)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKi0-0004VK-7r
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mHKfL-0003Fy-EU
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:39:39 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mHKfG-0001eY-FY
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:39:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A76E5C00E2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 02:39:32 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Sat, 21 Aug 2021 02:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=wgSpP
 NBlSuBKHWlc5W3ep4Vet7ZKOBLxGTI5shPXHsk=; b=P57lP5+vDpmhwpnWKBrmp
 gV34VhLs0Mj0/J3vG/ZtFfwbdBVYZ9NOh+4q2MOiBxtlQnti1vOyRGQJCKj8MceB
 9on516wk6SKSOMmsZbEyWzEpgz5xD57jxQtynHwOtDaqiandM4+eCppfWIjY2PhV
 bU2P1o0kN29YNa8rELRivknA4hPutcKq9ToKOKQiHXQNa3v5EBWSBavDApUMCZdY
 Wi6uBjG44jm+vvwnldofA1wdYeJgEOi9QH/Jvgyb9Ul1PnX0rFq48q7SCqRwHnrn
 J+bgGpsXXninMhEHdVyS8FQtnZAM8BCoVGY31xOMMx9uvl7qnnKevoQBIT5sV/fK
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=wgSpPNBlSuBKHWlc5W3ep4Vet7ZKOBLxGTI5shPXH
 sk=; b=wf8c9+EJuCtdDDuTQ3TMSvQVArbxqB3BA+8TQ9tdm3e/wrF6ko4FisXEU
 chCgGiHHcahym5E7gCu8uR91wWQ7TBYbwUaXNaNzkPNK1oTrIpWqJ9buPDFrzlt+
 3SwpblBZKajBZldDIE5K85ded+Rr+uSt98rIwgF/nKCXFqP96J7oNxXQX87K5pYP
 FsgDNDus1MyTnAbU4Yg/2iL1NawbOqBZTjGOtLyN3ccu2wWvNUkFJA0eXoMSyiPs
 QD9kKFRBkIMURK6rEv7jSGm3gmnvFKFQEmKizeLorSUSWyApKENP2fxHzmikNYq4
 U7xbtyTBe1/Z5evGBJXFjau5olQYQ==
X-ME-Sender: <xms:pJ8gYetXDVWNtacUhhBq3VzDnpRuM0jL7UmWu_e2Da-MRiB4dUWr5g>
 <xme:pJ8gYTetRVICC862QYmDh4FGGJUVuz-T-qxhqrWfE0W1hAPZF9ir4Vb4cghGcf4Gk
 viNB7bqatqfBDHowjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddttddguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgse
 htqhertderreejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhn
 rdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeetgeekve
 eftefhgfduheegvdeuuddvieefvddvlefhfeehkeetfeeukedtfeejnecuvehluhhsthgv
 rhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghngh
 esfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:pJ8gYZyCXvnA5ElzxU7Z_U79QVW4qoa5_FOaIxVRy6vWLp6pI2iFig>
 <xmx:pJ8gYZMwSQsIEkhXOcCsKUAUdckhd1X51xuHZbtYJtS-3zrIq3z9WA>
 <xmx:pJ8gYe-ElQ0xT2M7dYi5X6BbHpdKmPWeqxgA7lkh6stiYvZ8-AMY7w>
 <xmx:pJ8gYRK1mnaFo12WlSfWiWQnVcpaPFf0UcTd01zpLsUytk1z5SRURA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0E1B5FA0AA4; Sat, 21 Aug 2021 02:39:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <60c40cde-ba97-4623-bdf3-dfd0c2dbd0d2@www.fastmail.com>
In-Reply-To: <20210818201931.393394-3-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-3-richard.henderson@linaro.org>
Date: Sat, 21 Aug 2021 14:39:10 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 02/16] tcg/mips: Support unaligned access for softmmu
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B48=E6=9C=8819=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8A=E5=
=8D=884:19=EF=BC=8CRichard Henderson=E5=86=99=E9=81=93=EF=BC=9A
> We can use the routines just added for user-only to emit
> unaligned accesses in softmmu mode too.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

> ---
>  tcg/mips/tcg-target.c.inc | 91 ++++++++++++++++++++++-----------------
>  1 file changed, 51 insertions(+), 40 deletions(-)
>=20
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 7ed0de9dae..3d6a0ba39e 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1154,8 +1154,10 @@ static void tcg_out_tlb_load(TCGContext *s,=20
> TCGReg base, TCGReg addrl,
>                               tcg_insn_unit *label_ptr[2], bool is_loa=
d)
>  {
>      MemOp opc =3D get_memop(oi);
> -    unsigned s_bits =3D opc & MO_SIZE;
>      unsigned a_bits =3D get_alignment_bits(opc);
> +    unsigned s_bits =3D opc & MO_SIZE;
> +    unsigned a_mask =3D (1 << a_bits) - 1;
> +    unsigned s_mask =3D (1 << s_bits) - 1;
>      int mem_index =3D get_mmuidx(oi);
>      int fast_off =3D TLB_MASK_TABLE_OFS(mem_index);
>      int mask_off =3D fast_off + offsetof(CPUTLBDescFast, mask);
> @@ -1163,7 +1165,7 @@ static void tcg_out_tlb_load(TCGContext *s,=20
> TCGReg base, TCGReg addrl,
>      int add_off =3D offsetof(CPUTLBEntry, addend);
>      int cmp_off =3D (is_load ? offsetof(CPUTLBEntry, addr_read)
>                     : offsetof(CPUTLBEntry, addr_write));
> -    target_ulong mask;
> +    target_ulong tlb_mask;
> =20
>      /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
>      tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
> @@ -1177,27 +1179,13 @@ static void tcg_out_tlb_load(TCGContext *s,=20
> TCGReg base, TCGReg addrl,
>      /* Add the tlb_table pointer, creating the CPUTLBEntry address in=20
> TMP3.  */
>      tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
> =20
> -    /* We don't currently support unaligned accesses.
> -       We could do so with mips32r6.  */
> -    if (a_bits < s_bits) {
> -        a_bits =3D s_bits;
> -    }
> -
> -    /* Mask the page bits, keeping the alignment bits to compare agai=
nst.  */
> -    mask =3D (target_ulong)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
> -
>      /* Load the (low-half) tlb comparator.  */
>      if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> -        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + LO_=
OFF);
> -        tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, mask);
> +        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
>      } else {
>          tcg_out_ldst(s, (TARGET_LONG_BITS =3D=3D 64 ? OPC_LD
>                           : TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LWU : =
OPC_LW),
>                       TCG_TMP0, TCG_TMP3, cmp_off);
> -        tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, mask);
> -        /* No second compare is required here;
> -           load the tlb addend for the fast path.  */
> -        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
>      }
> =20
>      /* Zero extend a 32-bit guest address for a 64-bit host. */
> @@ -1205,7 +1193,25 @@ static void tcg_out_tlb_load(TCGContext *s,=20
> TCGReg base, TCGReg addrl,
>          tcg_out_ext32u(s, base, addrl);
>          addrl =3D base;
>      }
> -    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
> +
> +    /*
> +     * Mask the page bits, keeping the alignment bits to compare=20
> against.
> +     * For unaligned accesses, compare against the end of the access =
to
> +     * verify that it does not cross a page boundary.
> +     */
> +    tlb_mask =3D (target_ulong)TARGET_PAGE_MASK | a_mask;
> +    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
> +    if (a_mask >=3D s_mask) {
> +        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
> +    } else {
> +        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask -=20
> a_mask);
> +        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
> +    }
> +
> +    if (TCG_TARGET_REG_BITS >=3D TARGET_LONG_BITS) {
> +        /* Load the tlb addend for the fast path.  */
> +        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
> +    }
> =20
>      label_ptr[0] =3D s->code_ptr;
>      tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
> @@ -1213,7 +1219,7 @@ static void tcg_out_tlb_load(TCGContext *s,=20
> TCGReg base, TCGReg addrl,
>      /* Load and test the high half tlb comparator.  */
>      if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
>          /* delay slot */
> -        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off +=20
> HI_OFF);
> +        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
> =20
>          /* Load the tlb addend for the fast path.  */
>          tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
> @@ -1535,8 +1541,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s=
,=20
> TCGReg lo, TCGReg hi,
>      }
>  }
> =20
> -static void __attribute__((unused))
> -tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
> +static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg=20
> hi,
>                                      TCGReg base, MemOp opc, bool is_6=
4)
>  {
>      const MIPSInsn lw1 =3D MIPS_BE ? OPC_LWL : OPC_LWR;
> @@ -1655,8 +1660,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const=20
> TCGArg *args, bool is_64)
>  #if defined(CONFIG_SOFTMMU)
>      tcg_insn_unit *label_ptr[2];
>  #else
> -    unsigned a_bits, s_bits;
>  #endif
> +    unsigned a_bits, s_bits;
>      TCGReg base =3D TCG_REG_A0;
> =20
>      data_regl =3D *args++;
> @@ -1665,10 +1670,20 @@ static void tcg_out_qemu_ld(TCGContext *s,=20
> const TCGArg *args, bool is_64)
>      addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ :=
 0);
>      oi =3D *args++;
>      opc =3D get_memop(oi);
> +    a_bits =3D get_alignment_bits(opc);
> +    s_bits =3D opc & MO_SIZE;
> =20
> +    /*
> +     * R6 removes the left/right instructions but requires the
> +     * system to support misaligned memory accesses.
> +     */
>  #if defined(CONFIG_SOFTMMU)
>      tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
> -    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
> +    if (use_mips32r6_instructions || a_bits >=3D s_bits) {
> +        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc,=20
> is_64);
> +    } else {
> +        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc,=20
> is_64);
> +    }
>      add_qemu_ldst_label(s, 1, oi,
>                          (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
>                          data_regl, data_regh, addr_regl, addr_regh,
> @@ -1685,12 +1700,6 @@ static void tcg_out_qemu_ld(TCGContext *s, cons=
t=20
> TCGArg *args, bool is_64)
>      } else {
>          tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG,=20
> addr_regl);
>      }
> -    a_bits =3D get_alignment_bits(opc);
> -    s_bits =3D opc & MO_SIZE;
> -    /*
> -     * R6 removes the left/right instructions but requires the
> -     * system to support misaligned memory accesses.
> -     */
>      if (use_mips32r6_instructions) {
>          if (a_bits) {
>              tcg_out_test_alignment(s, true, addr_regl, addr_regh,=20
> a_bits);
> @@ -1770,8 +1779,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s=
,=20
> TCGReg lo, TCGReg hi,
>      }
>  }
> =20
> -static void __attribute__((unused))
> -tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
> +static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg=20
> hi,
>                                      TCGReg base, MemOp opc)
>  {
>      const MIPSInsn sw1 =3D MIPS_BE ? OPC_SWL : OPC_SWR;
> @@ -1851,9 +1859,8 @@ static void tcg_out_qemu_st(TCGContext *s, const=20
> TCGArg *args, bool is_64)
>      MemOp opc;
>  #if defined(CONFIG_SOFTMMU)
>      tcg_insn_unit *label_ptr[2];
> -#else
> -    unsigned a_bits, s_bits;
>  #endif
> +    unsigned a_bits, s_bits;
>      TCGReg base =3D TCG_REG_A0;
> =20
>      data_regl =3D *args++;
> @@ -1862,10 +1869,20 @@ static void tcg_out_qemu_st(TCGContext *s,=20
> const TCGArg *args, bool is_64)
>      addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ :=
 0);
>      oi =3D *args++;
>      opc =3D get_memop(oi);
> +    a_bits =3D get_alignment_bits(opc);
> +    s_bits =3D opc & MO_SIZE;
> =20
> +    /*
> +     * R6 removes the left/right instructions but requires the
> +     * system to support misaligned memory accesses.
> +     */
>  #if defined(CONFIG_SOFTMMU)
>      tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
> -    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
> +    if (use_mips32r6_instructions || a_bits >=3D s_bits) {
> +        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
> +    } else {
> +        tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
> +    }
>      add_qemu_ldst_label(s, 0, oi,
>                          (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
>                          data_regl, data_regh, addr_regl, addr_regh,
> @@ -1882,12 +1899,6 @@ static void tcg_out_qemu_st(TCGContext *s, cons=
t=20
> TCGArg *args, bool is_64)
>      } else {
>          tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG,=20
> addr_regl);
>      }
> -    a_bits =3D get_alignment_bits(opc);
> -    s_bits =3D opc & MO_SIZE;
> -    /*
> -     * R6 removes the left/right instructions but requires the
> -     * system to support misaligned memory accesses.
> -     */
>      if (use_mips32r6_instructions) {
>          if (a_bits) {
>              tcg_out_test_alignment(s, true, addr_regl, addr_regh,=20
> a_bits);
> --=20
> 2.25.1
>=20
>=20
>=20


--=20
- Jiaxun

