Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D410375EF9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:05:33 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqo0-0002CR-1Y
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqjX-0007xM-FI; Thu, 06 May 2021 23:00:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58813 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqjP-0004rF-6x; Thu, 06 May 2021 23:00:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbwDm3WdLz9sXL; Fri,  7 May 2021 13:00:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620356440;
 bh=u836YhMci1/6Nm3Knc1E0ddCe8jkIVd6OZkwnwe7g0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dgll5CnNc9L7+1IMLPMTIi3oLDm0w1fh5eTm4y4ALoYS+7Wh2dn8Uv5qw7DWZAnwq
 FV/TVaKnO/LIT7YPae89GGfJMSAbxxJBKnMpMP1pFavNnO79/ihaTi6iRcFwkz+Zax
 L2GSix+BM1p1iFfBXG1dbgEHddByBjlgFyLL7/dQ=
Date: Fri, 7 May 2021 12:50:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [RESEND PATCH v5 2/4] target/ppc: move SPR R/W callbacks to
 translate.c
Message-ID: <YJSq5+ceZtZYu1jU@yekko>
References: <20210506190837.6921-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dJkQ9nBxA/3cen3Z"
Content-Disposition: inline
In-Reply-To: <20210506190837.6921-1-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dJkQ9nBxA/3cen3Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 04:08:37PM -0300, Bruno Larsen (billionai) wrote:
> Moved all read and write callbacks for SPRs away from
> translate_init.c.inc and into translate.c; these functions are
> TCG only, so this motion is required to enable building with
> the flag disable-tcg
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c          | 1037 ++++++++++++++++++++++++++++++-
>  target/ppc/translate_init.c.inc | 1011 ------------------------------
>  2 files changed, 1028 insertions(+), 1020 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a5e144d944..3d7454a125 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -369,6 +369,1034 @@ static inline void gen_sync_exception(DisasContext=
 *ctx)
>  }
>  #endif
> =20
> +/***********************************************************************=
******/
> +/* SPR READ/WRITE CALLBACKS */
> +
> +static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
> +{
> +#if 0
> +    sprn =3D ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
> +    printf("ERROR: try to access SPR %d !\n", sprn);
> +#endif
> +}
> +#define SPR_NOACCESS (&spr_noaccess)
> +
> +/* #define PPC_DUMP_SPR_ACCESSES */
> +
> +/*
> + * Generic callbacks:
> + * do nothing but store/retrieve spr value
> + */
> +static void spr_load_dump_spr(int sprn)
> +{
> +#ifdef PPC_DUMP_SPR_ACCESSES
> +    TCGv_i32 t0 =3D tcg_const_i32(sprn);
> +    gen_helper_load_dump_spr(cpu_env, t0);
> +    tcg_temp_free_i32(t0);
> +#endif
> +}
> +
> +static void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_load_spr(cpu_gpr[gprn], sprn);
> +    spr_load_dump_spr(sprn);
> +}
> +
> +static void spr_store_dump_spr(int sprn)
> +{
> +#ifdef PPC_DUMP_SPR_ACCESSES
> +    TCGv_i32 t0 =3D tcg_const_i32(sprn);
> +    gen_helper_store_dump_spr(cpu_env, t0);
> +    tcg_temp_free_i32(t0);
> +#endif
> +}
> +
> +static void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_store_spr(sprn, cpu_gpr[gprn]);
> +    spr_store_dump_spr(sprn);
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
> +{
> +#ifdef TARGET_PPC64
> +    TCGv t0 =3D tcg_temp_new();
> +    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +    spr_store_dump_spr(sprn);
> +#else
> +    spr_write_generic(ctx, sprn, gprn);
> +#endif
> +}
> +
> +static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGv t1 =3D tcg_temp_new();
> +    gen_load_spr(t0, sprn);
> +    tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
> +    tcg_gen_and_tl(t0, t0, t1);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +}
> +
> +static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
> +{
> +}
> +
> +#endif
> +
> +/* SPR common to all PowerPC */
> +/* XER */
> +static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv dst =3D cpu_gpr[gprn];
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGv t1 =3D tcg_temp_new();
> +    TCGv t2 =3D tcg_temp_new();
> +    tcg_gen_mov_tl(dst, cpu_xer);
> +    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> +    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> +    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> +    tcg_gen_or_tl(t0, t0, t1);
> +    tcg_gen_or_tl(dst, dst, t2);
> +    tcg_gen_or_tl(dst, dst, t0);
> +    if (is_isa300(ctx)) {
> +        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> +        tcg_gen_or_tl(dst, dst, t0);
> +        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> +        tcg_gen_or_tl(dst, dst, t0);
> +    }
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +
> +static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv src =3D cpu_gpr[gprn];
> +    /* Write all flags, while reading back check for isa300 */
> +    tcg_gen_andi_tl(cpu_xer, src,
> +                    ~((1u << XER_SO) |
> +                      (1u << XER_OV) | (1u << XER_OV32) |
> +                      (1u << XER_CA) | (1u << XER_CA32)));
> +    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> +    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> +    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> +    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> +    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> +}
> +
> +/* LR */
> +static void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
> +}
> +
> +static void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
> +}
> +
> +/* CFAR */
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +static void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
> +}
> +
> +static void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
> +{
> +    tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
> +}
> +#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> +
> +/* CTR */
> +static void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
> +}
> +
> +static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
> +}
> +
> +/* User read access to SPR */
> +/* USPRx */
> +/* UMMCRx */
> +/* UPMCx */
> +/* USIA */
> +/* UDECR */
> +static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
> +}
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
> +}
> +#endif
> +
> +/* SPR common to all non-embedded PowerPC */
> +/* DECR */
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +#endif
> +
> +/* SPR common to all non-embedded PowerPC, except 601 */
> +/* Time base */
> +static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +ATTRIBUTE_UNUSED
> +static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
> +}
> +
> +ATTRIBUTE_UNUSED
> +static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +ATTRIBUTE_UNUSED
> +static void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +ATTRIBUTE_UNUSED
> +static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +#if defined(TARGET_PPC64)
> +ATTRIBUTE_UNUSED
> +static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +/* HDECR */
> +static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +#endif
> +#endif
> +
> +#if !defined(CONFIG_USER_ONLY)
> +/* IBAT0U...IBAT0U */
> +/* IBAT0L...IBAT7L */
> +static void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> +}
> +
> +static void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]=
));
> +}
> +
> +static void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> +    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
> +    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0L) / 2);
> +    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
> +    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +/* DBAT0U...DBAT7U */
> +/* DBAT0L...DBAT7L */
> +static void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
> +}
> +
> +static void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]=
));
> +}
> +
> +static void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_DBAT0U) / 2);
> +    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
> +    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_DBAT0L) / 2);
> +    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
> +    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +/* SDR1 */
> +static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +#if defined(TARGET_PPC64)
> +/* 64 bits PowerPC specific SPRs */
> +/* PIDR */
> +static void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +static void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +static void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_pre=
fix));
> +}
> +
> +static void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> +    tcg_temp_free(t0);
> +}
> +static void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +static void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +/* DPDES */
> +static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
> +}
> +
> +static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
> +}
> +#endif
> +#endif
> +
> +/* PowerPC 601 specific registers */
> +/* RTC */
> +static void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
> +}
> +
> +static void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +static void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
> +    /* Must stop the translation as endianness may have changed */
> +    gen_stop_exception(ctx);
> +}
> +#endif
> +
> +/* Unified bats */
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> +}
> +
> +static void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> +    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> +    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +#endif
> +
> +/* PowerPC 40x specific registers */
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_store_spr(sprn, cpu_gpr[gprn]);
> +    gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
> +    /* We must stop translation as we may have rebooted */
> +    gen_stop_exception(ctx);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +#endif
> +
> +/* PowerPC 403 specific registers */
> +/* PBL1 / PBU1 / PBL2 / PBU2 */
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
> +}
> +
> +static void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32(sprn - SPR_403_PBL1);
> +    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
> +    gen_store_spr(SPR_PIR, t0);
> +    tcg_temp_free(t0);
> +}
> +#endif
> +
> +/* SPE specific registers */
> +static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv_i32 t0 =3D tcg_temp_new_i32();
> +    tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> +    tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_temp_new_i32();
> +    tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
> +    tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> +    tcg_temp_free_i32(t0);
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
> +/* Callback used to write the exception vector base */
> +static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
> +    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
> +{
> +    int sprn_offs;
> +
> +    if (sprn >=3D SPR_BOOKE_IVOR0 && sprn <=3D SPR_BOOKE_IVOR15) {
> +        sprn_offs =3D sprn - SPR_BOOKE_IVOR0;
> +    } else if (sprn >=3D SPR_BOOKE_IVOR32 && sprn <=3D SPR_BOOKE_IVOR37)=
 {
> +        sprn_offs =3D sprn - SPR_BOOKE_IVOR32 + 32;
> +    } else if (sprn >=3D SPR_BOOKE_IVOR38 && sprn <=3D SPR_BOOKE_IVOR42)=
 {
> +        sprn_offs =3D sprn - SPR_BOOKE_IVOR38 + 38;
> +    } else {
> +        printf("Trying to write an unknown exception vector %d %03x\n",
> +               sprn, sprn);
> +        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> +        return;
> +    }
> +
> +    TCGv t0 =3D tcg_temp_new();
> +    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
> +    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_o=
ffs]));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +#endif
> +
> +#ifdef TARGET_PPC64
> +#ifndef CONFIG_USER_ONLY
> +static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGv t1 =3D tcg_temp_new();
> +    TCGv t2 =3D tcg_temp_new();
> +
> +    /*
> +     * Note, the HV=3D1 PR=3D0 case is handled earlier by simply using
> +     * spr_write_generic for HV mode in the SPR table
> +     */
> +
> +    /* Build insertion mask into t1 based on context */
> +    if (ctx->pr) {
> +        gen_load_spr(t1, SPR_UAMOR);
> +    } else {
> +        gen_load_spr(t1, SPR_AMOR);
> +    }
> +
> +    /* Mask new bits into t2 */
> +    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> +
> +    /* Load AMR and clear new bits in t0 */
> +    gen_load_spr(t0, SPR_AMR);
> +    tcg_gen_andc_tl(t0, t0, t1);
> +
> +    /* Or'in new bits and write it out */
> +    tcg_gen_or_tl(t0, t0, t2);
> +    gen_store_spr(SPR_AMR, t0);
> +    spr_store_dump_spr(SPR_AMR);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +
> +static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGv t1 =3D tcg_temp_new();
> +    TCGv t2 =3D tcg_temp_new();
> +
> +    /*
> +     * Note, the HV=3D1 case is handled earlier by simply using
> +     * spr_write_generic for HV mode in the SPR table
> +     */
> +
> +    /* Build insertion mask into t1 based on context */
> +    gen_load_spr(t1, SPR_AMOR);
> +
> +    /* Mask new bits into t2 */
> +    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> +
> +    /* Load AMR and clear new bits in t0 */
> +    gen_load_spr(t0, SPR_UAMOR);
> +    tcg_gen_andc_tl(t0, t0, t1);
> +
> +    /* Or'in new bits and write it out */
> +    tcg_gen_or_tl(t0, t0, t2);
> +    gen_store_spr(SPR_UAMOR, t0);
> +    spr_store_dump_spr(SPR_UAMOR);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +
> +static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGv t1 =3D tcg_temp_new();
> +    TCGv t2 =3D tcg_temp_new();
> +
> +    /*
> +     * Note, the HV=3D1 case is handled earlier by simply using
> +     * spr_write_generic for HV mode in the SPR table
> +     */
> +
> +    /* Build insertion mask into t1 based on context */
> +    gen_load_spr(t1, SPR_AMOR);
> +
> +    /* Mask new bits into t2 */
> +    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> +
> +    /* Load AMR and clear new bits in t0 */
> +    gen_load_spr(t0, SPR_IAMR);
> +    tcg_gen_andc_tl(t0, t0, t1);
> +
> +    /* Or'in new bits and write it out */
> +    tcg_gen_or_tl(t0, t0, t2);
> +    gen_store_spr(SPR_IAMR, t0);
> +    spr_store_dump_spr(SPR_IAMR);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +#endif
> +#endif
> +
> +#ifndef CONFIG_USER_ONLY
> +static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_fixup_thrm(cpu_env);
> +    gen_load_spr(cpu_gpr[gprn], sprn);
> +    spr_load_dump_spr(sprn);
> +}
> +#endif /* !CONFIG_USER_ONLY */
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> +                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_=
L2LFC));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int =
gprn)
> +{
> +    gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +static void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 =3D tcg_const_i32(sprn);
> +    gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +static void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
> +}
> +static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +#endif
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv val =3D tcg_temp_new();
> +    tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
> +    gen_store_spr(SPR_BOOKE_MAS3, val);
> +    tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
> +    gen_store_spr(SPR_BOOKE_MAS7, val);
> +    tcg_temp_free(val);
> +}
> +
> +static void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv mas7 =3D tcg_temp_new();
> +    TCGv mas3 =3D tcg_temp_new();
> +    gen_load_spr(mas7, SPR_BOOKE_MAS7);
> +    tcg_gen_shli_tl(mas7, mas7, 32);
> +    gen_load_spr(mas3, SPR_BOOKE_MAS3);
> +    tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
> +    tcg_temp_free(mas3);
> +    tcg_temp_free(mas7);
> +}
> +
> +#endif
> +
> +#ifdef TARGET_PPC64
> +static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                    int bit, int sprn, int cause)
> +{
> +    TCGv_i32 t1 =3D tcg_const_i32(bit);
> +    TCGv_i32 t2 =3D tcg_const_i32(sprn);
> +    TCGv_i32 t3 =3D tcg_const_i32(cause);
> +
> +    gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
> +
> +    tcg_temp_free_i32(t3);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(t1);
> +}
> +
> +static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                   int bit, int sprn, int cause)
> +{
> +    TCGv_i32 t1 =3D tcg_const_i32(bit);
> +    TCGv_i32 t2 =3D tcg_const_i32(sprn);
> +    TCGv_i32 t3 =3D tcg_const_i32(cause);
> +
> +    gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
> +
> +    tcg_temp_free_i32(t3);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(t1);
> +}
> +
> +static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv spr_up =3D tcg_temp_new();
> +    TCGv spr =3D tcg_temp_new();
> +
> +    gen_load_spr(spr, sprn - 1);
> +    tcg_gen_shri_tl(spr_up, spr, 32);
> +    tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
> +
> +    tcg_temp_free(spr);
> +    tcg_temp_free(spr_up);
> +}
> +
> +static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv spr =3D tcg_temp_new();
> +
> +    gen_load_spr(spr, sprn - 1);
> +    tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
> +    gen_store_spr(sprn - 1, spr);
> +
> +    tcg_temp_free(spr);
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv hmer =3D tcg_temp_new();
> +
> +    gen_load_spr(hmer, sprn);
> +    tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
> +    gen_store_spr(sprn, hmer);
> +    spr_store_dump_spr(sprn);
> +    tcg_temp_free(hmer);
> +}
> +
> +static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
> +}
> +#endif /* !defined(CONFIG_USER_ONLY) */
> +
> +static void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
> +static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
> +static void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
> +static void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
> +static void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_read_prev_upper32(ctx, gprn, sprn);
> +}
> +
> +static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_write_prev_upper32(ctx, sprn, gprn);
> +}
> +
> +static void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
> +static void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
> +static void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_read_prev_upper32(ctx, gprn, sprn);
> +}
> +
> +static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_write_prev_upper32(ctx, sprn, gprn);
> +}
> +#endif
> +
>  #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                =
      \
>  GEN_OPCODE(name, opc1, opc2, opc3, inval, type, PPC_NONE)
> =20
> @@ -4262,15 +5290,6 @@ static void gen_mfmsr(DisasContext *ctx)
>      tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
>  }
> =20
> -static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
> -{
> -#if 0
> -    sprn =3D ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
> -    printf("ERROR: try to access SPR %d !\n", sprn);
> -#endif
> -}
> -#define SPR_NOACCESS (&spr_noaccess)
> -
>  /* mfspr */
>  static inline void gen_op_mfspr(DisasContext *ctx)
>  {
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 261d168009..2f4e463bb6 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -43,705 +43,8 @@
>  #include "qapi/qapi-commands-machine-target.h"
> =20
>  /* #define PPC_DEBUG_SPR */
> -/* #define PPC_DUMP_SPR_ACCESSES */
>  /* #define USE_APPLE_GDB */
> =20
> -/*
> - * Generic callbacks:
> - * do nothing but store/retrieve spr value
> - */
> -static void spr_load_dump_spr(int sprn)
> -{
> -#ifdef PPC_DUMP_SPR_ACCESSES
> -    TCGv_i32 t0 =3D tcg_const_i32(sprn);
> -    gen_helper_load_dump_spr(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
> -#endif
> -}
> -
> -static void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_load_spr(cpu_gpr[gprn], sprn);
> -    spr_load_dump_spr(sprn);
> -}
> -
> -static void spr_store_dump_spr(int sprn)
> -{
> -#ifdef PPC_DUMP_SPR_ACCESSES
> -    TCGv_i32 t0 =3D tcg_const_i32(sprn);
> -    gen_helper_store_dump_spr(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
> -#endif
> -}
> -
> -static void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_store_spr(sprn, cpu_gpr[gprn]);
> -    spr_store_dump_spr(sprn);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
> -{
> -#ifdef TARGET_PPC64
> -    TCGv t0 =3D tcg_temp_new();
> -    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -    spr_store_dump_spr(sprn);
> -#else
> -    spr_write_generic(ctx, sprn, gprn);
> -#endif
> -}
> -
> -static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -    gen_load_spr(t0, sprn);
> -    tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
> -    tcg_gen_and_tl(t0, t0, t1);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -}
> -
> -static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
> -{
> -}
> -
> -#endif
> -
> -/* SPR common to all PowerPC */
> -/* XER */
> -static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv dst =3D cpu_gpr[gprn];
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -    TCGv t2 =3D tcg_temp_new();
> -    tcg_gen_mov_tl(dst, cpu_xer);
> -    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> -    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> -    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> -    tcg_gen_or_tl(t0, t0, t1);
> -    tcg_gen_or_tl(dst, dst, t2);
> -    tcg_gen_or_tl(dst, dst, t0);
> -    if (is_isa300(ctx)) {
> -        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> -        tcg_gen_or_tl(dst, dst, t0);
> -        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> -        tcg_gen_or_tl(dst, dst, t0);
> -    }
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv src =3D cpu_gpr[gprn];
> -    /* Write all flags, while reading back check for isa300 */
> -    tcg_gen_andi_tl(cpu_xer, src,
> -                    ~((1u << XER_SO) |
> -                      (1u << XER_OV) | (1u << XER_OV32) |
> -                      (1u << XER_CA) | (1u << XER_CA32)));
> -    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> -    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> -    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> -    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> -    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> -}
> -
> -/* LR */
> -static void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
> -}
> -
> -static void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
> -}
> -
> -/* CFAR */
> -#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> -static void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
> -}
> -
> -static void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
> -{
> -    tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
> -}
> -#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> -
> -/* CTR */
> -static void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
> -}
> -
> -static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
> -}
> -
> -/* User read access to SPR */
> -/* USPRx */
> -/* UMMCRx */
> -/* UPMCx */
> -/* USIA */
> -/* UDECR */
> -static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
> -}
> -
> -#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> -static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
> -}
> -#endif
> -
> -/* SPR common to all non-embedded PowerPC */
> -/* DECR */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -#endif
> -
> -/* SPR common to all non-embedded PowerPC, except 601 */
> -/* Time base */
> -static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -#if defined(TARGET_PPC64)
> -ATTRIBUTE_UNUSED
> -static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -/* HDECR */
> -static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -#endif
> -#endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -/* IBAT0U...IBAT0U */
> -/* IBAT0L...IBAT7L */
> -static void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> -}
> -
> -static void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]=
));
> -}
> -
> -static void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> -    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
> -    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0L) / 2);
> -    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
> -    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -/* DBAT0U...DBAT7U */
> -/* DBAT0L...DBAT7L */
> -static void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
> -}
> -
> -static void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]=
));
> -}
> -
> -static void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_DBAT0U) / 2);
> -    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
> -    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_DBAT0L) / 2);
> -    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
> -    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -/* SDR1 */
> -static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -#if defined(TARGET_PPC64)
> -/* 64 bits PowerPC specific SPRs */
> -/* PIDR */
> -static void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_pre=
fix));
> -}
> -
> -static void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> -    tcg_temp_free(t0);
> -}
> -static void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -/* DPDES */
> -static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
> -}
> -
> -static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
> -}
> -#endif
> -#endif
> -
> -/* PowerPC 601 specific registers */
> -/* RTC */
> -static void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
> -}
> -
> -static void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
> -    /* Must stop the translation as endianness may have changed */
> -    gen_stop_exception(ctx);
> -}
> -#endif
> -
> -/* Unified bats */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> -}
> -
> -static void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> -    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> -    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -#endif
> -
> -/* PowerPC 40x specific registers */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_store_spr(sprn, cpu_gpr[gprn]);
> -    gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
> -    /* We must stop translation as we may have rebooted */
> -    gen_stop_exception(ctx);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -#endif
> -
> -/* PowerPC 403 specific registers */
> -/* PBL1 / PBU1 / PBL2 / PBU2 */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
> -}
> -
> -static void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(sprn - SPR_403_PBL1);
> -    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
> -    gen_store_spr(SPR_PIR, t0);
> -    tcg_temp_free(t0);
> -}
> -#endif
> -
> -/* SPE specific registers */
> -static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv_i32 t0 =3D tcg_temp_new_i32();
> -    tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> -    tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_temp_new_i32();
> -    tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
> -    tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> -    tcg_temp_free_i32(t0);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -/* Callback used to write the exception vector base */
> -static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
> -    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
> -{
> -    int sprn_offs;
> -
> -    if (sprn >=3D SPR_BOOKE_IVOR0 && sprn <=3D SPR_BOOKE_IVOR15) {
> -        sprn_offs =3D sprn - SPR_BOOKE_IVOR0;
> -    } else if (sprn >=3D SPR_BOOKE_IVOR32 && sprn <=3D SPR_BOOKE_IVOR37)=
 {
> -        sprn_offs =3D sprn - SPR_BOOKE_IVOR32 + 32;
> -    } else if (sprn >=3D SPR_BOOKE_IVOR38 && sprn <=3D SPR_BOOKE_IVOR42)=
 {
> -        sprn_offs =3D sprn - SPR_BOOKE_IVOR38 + 38;
> -    } else {
> -        printf("Trying to write an unknown exception vector %d %03x\n",
> -               sprn, sprn);
> -        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> -        return;
> -    }
> -
> -    TCGv t0 =3D tcg_temp_new();
> -    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
> -    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_o=
ffs]));
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -#endif
> -
>  static inline void vscr_init(CPUPPCState *env, uint32_t val)
>  {
>      /* Altivec always uses round-to-nearest */
> @@ -1254,105 +557,6 @@ static void register_7xx_sprs(CPUPPCState *env)
>  }
> =20
>  #ifdef TARGET_PPC64
> -#ifndef CONFIG_USER_ONLY
> -static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -    TCGv t2 =3D tcg_temp_new();
> -
> -    /*
> -     * Note, the HV=3D1 PR=3D0 case is handled earlier by simply using
> -     * spr_write_generic for HV mode in the SPR table
> -     */
> -
> -    /* Build insertion mask into t1 based on context */
> -    if (ctx->pr) {
> -        gen_load_spr(t1, SPR_UAMOR);
> -    } else {
> -        gen_load_spr(t1, SPR_AMOR);
> -    }
> -
> -    /* Mask new bits into t2 */
> -    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> -
> -    /* Load AMR and clear new bits in t0 */
> -    gen_load_spr(t0, SPR_AMR);
> -    tcg_gen_andc_tl(t0, t0, t1);
> -
> -    /* Or'in new bits and write it out */
> -    tcg_gen_or_tl(t0, t0, t2);
> -    gen_store_spr(SPR_AMR, t0);
> -    spr_store_dump_spr(SPR_AMR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -    TCGv t2 =3D tcg_temp_new();
> -
> -    /*
> -     * Note, the HV=3D1 case is handled earlier by simply using
> -     * spr_write_generic for HV mode in the SPR table
> -     */
> -
> -    /* Build insertion mask into t1 based on context */
> -    gen_load_spr(t1, SPR_AMOR);
> -
> -    /* Mask new bits into t2 */
> -    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> -
> -    /* Load AMR and clear new bits in t0 */
> -    gen_load_spr(t0, SPR_UAMOR);
> -    tcg_gen_andc_tl(t0, t0, t1);
> -
> -    /* Or'in new bits and write it out */
> -    tcg_gen_or_tl(t0, t0, t2);
> -    gen_store_spr(SPR_UAMOR, t0);
> -    spr_store_dump_spr(SPR_UAMOR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -    TCGv t2 =3D tcg_temp_new();
> -
> -    /*
> -     * Note, the HV=3D1 case is handled earlier by simply using
> -     * spr_write_generic for HV mode in the SPR table
> -     */
> -
> -    /* Build insertion mask into t1 based on context */
> -    gen_load_spr(t1, SPR_AMOR);
> -
> -    /* Mask new bits into t2 */
> -    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> -
> -    /* Load AMR and clear new bits in t0 */
> -    gen_load_spr(t0, SPR_IAMR);
> -    tcg_gen_andc_tl(t0, t0, t1);
> -
> -    /* Or'in new bits and write it out */
> -    tcg_gen_or_tl(t0, t0, t2);
> -    gen_store_spr(SPR_IAMR, t0);
> -    spr_store_dump_spr(SPR_IAMR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -#endif /* CONFIG_USER_ONLY */
> -
>  static void register_amr_sprs(CPUPPCState *env)
>  {
>  #ifndef CONFIG_USER_ONLY
> @@ -1397,15 +601,6 @@ static void register_iamr_sprs(CPUPPCState *env)
>  }
>  #endif /* TARGET_PPC64 */
> =20
> -#ifndef CONFIG_USER_ONLY
> -static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_fixup_thrm(cpu_env);
> -    gen_load_spr(cpu_gpr[gprn], sprn);
> -    spr_load_dump_spr(sprn);
> -}
> -#endif /* !CONFIG_USER_ONLY */
> -
>  static void register_thrm_sprs(CPUPPCState *env)
>  {
>      /* Thermal management */
> @@ -1771,57 +966,6 @@ static void register_74xx_soft_tlb(CPUPPCState *env=
, int nb_tlbs, int nb_ways)
>  #endif
>  }
> =20
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> -                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_=
L2LFC));
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int =
gprn)
> -{
> -    gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(sprn);
> -    gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -static void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
> -}
> -static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -#endif
> -
>  static void register_usprg3_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_USPRG3, "USPRG3",
> @@ -4902,31 +4046,6 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
>  }
> =20
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv val =3D tcg_temp_new();
> -    tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
> -    gen_store_spr(SPR_BOOKE_MAS3, val);
> -    tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
> -    gen_store_spr(SPR_BOOKE_MAS7, val);
> -    tcg_temp_free(val);
> -}
> -
> -static void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv mas7 =3D tcg_temp_new();
> -    TCGv mas3 =3D tcg_temp_new();
> -    gen_load_spr(mas7, SPR_BOOKE_MAS7);
> -    tcg_gen_shli_tl(mas7, mas7, 32);
> -    gen_load_spr(mas3, SPR_BOOKE_MAS3);
> -    tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
> -    tcg_temp_free(mas3);
> -    tcg_temp_free(mas7);
> -}
> -
> -#endif
> -
>  enum fsl_e500_version {
>      fsl_e500v1,
>      fsl_e500v2,
> @@ -7638,58 +6757,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
>  #define POWERPC970_HID5_INIT 0x00000000
>  #endif
> =20
> -static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> -                                    int bit, int sprn, int cause)
> -{
> -    TCGv_i32 t1 =3D tcg_const_i32(bit);
> -    TCGv_i32 t2 =3D tcg_const_i32(sprn);
> -    TCGv_i32 t3 =3D tcg_const_i32(cause);
> -
> -    gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
> -
> -    tcg_temp_free_i32(t3);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t1);
> -}
> -
> -static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> -                                   int bit, int sprn, int cause)
> -{
> -    TCGv_i32 t1 =3D tcg_const_i32(bit);
> -    TCGv_i32 t2 =3D tcg_const_i32(sprn);
> -    TCGv_i32 t3 =3D tcg_const_i32(cause);
> -
> -    gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
> -
> -    tcg_temp_free_i32(t3);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t1);
> -}
> -
> -static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv spr_up =3D tcg_temp_new();
> -    TCGv spr =3D tcg_temp_new();
> -
> -    gen_load_spr(spr, sprn - 1);
> -    tcg_gen_shri_tl(spr_up, spr, 32);
> -    tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
> -
> -    tcg_temp_free(spr);
> -    tcg_temp_free(spr_up);
> -}
> -
> -static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv spr =3D tcg_temp_new();
> -
> -    gen_load_spr(spr, sprn - 1);
> -    tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
> -    gen_store_spr(sprn - 1, spr);
> -
> -    tcg_temp_free(spr);
> -}
> -
>  static int check_pow_970(CPUPPCState *env)
>  {
>      if (env->spr[SPR_HID0] & (HID0_DEEPNAP | HID0_DOZE | HID0_NAP)) {
> @@ -7984,24 +7051,6 @@ static void register_power5p_tb_sprs(CPUPPCState *=
env)
>                      0x00000000);
>  }
> =20
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv hmer =3D tcg_temp_new();
> -
> -    gen_load_spr(hmer, sprn);
> -    tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
> -    gen_store_spr(sprn, hmer);
> -    spr_store_dump_spr(sprn);
> -    tcg_temp_free(hmer);
> -}
> -
> -static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
> -}
> -#endif /* !defined(CONFIG_USER_ONLY) */
> -
>  static void register_970_lpar_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -8199,18 +7248,6 @@ static void register_power6_common_sprs(CPUPPCStat=
e *env)
>                   0x00000000);
>  }
> =20
> -static void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> -    spr_read_generic(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> -    spr_write_generic(ctx, sprn, gprn);
> -}
> -
>  static void register_power8_tce_address_control_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_TAR, "TAR",
> @@ -8219,30 +7256,6 @@ static void register_power8_tce_address_control_sp=
rs(CPUPPCState *env)
>                       KVM_REG_PPC_TAR, 0x00000000);
>  }
> =20
> -static void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_read_generic(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_write_generic(ctx, sprn, gprn);
> -}
> -
> -static void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_read_prev_upper32(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_write_prev_upper32(ctx, sprn, gprn);
> -}
> -
>  static void register_power8_tm_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_TFHAR, "TFHAR",
> @@ -8263,30 +7276,6 @@ static void register_power8_tm_sprs(CPUPPCState *e=
nv)
>                   0x00000000);
>  }
> =20
> -static void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_read_generic(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_write_generic(ctx, sprn, gprn);
> -}
> -
> -static void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_read_prev_upper32(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_write_prev_upper32(ctx, sprn, gprn);
> -}
> -
>  static void register_power8_ebb_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_BESCRS, "BESCRS",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dJkQ9nBxA/3cen3Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUquYACgkQbDjKyiDZ
s5L0ug//XvZoquHwZPERNltVRo1WDfixZhui/iG4/op3KzPliwyGC6NRyg7pjrbJ
6vXZqttBWt4MjZD9sf3S9jmtoJwQRDfFy4cZ0rou8YXs4K+1WK0mgQXOFpzi4MjJ
lIfFwjfsirP8CDNDKOu7SvDkfnWBF0DmlULGgE+GBQ2HdOsToK6zfALbrPXLD+qN
AJAvCc1O+nnTQcwjy+Ij5gkaBoGUFy4nkx+Jjp6PSEUUgED1S3cLqXUbAxMRakz9
Kdm8e+eCEaAdHnwmqPTozyPPGHMK8hXQdU4oRm7KZeAeKsB7DtFZ5Q8rO4wPdYRG
ipucwKHtg/XAlAq5XiiGrbywMpj6y+TqoxuAHlTdd0iWwfLEEkmtB1whhkKs9FXE
uRB3mKMWaXjgpXOTaBzbyrPGjU81l8N1CZuLFq20AERmADaVb2f+bcuhOg9s+Fi8
0sA7AECMNHta9WhuFMK26HfTRhqk3H0aT7VQ3u7RsAytnT+dkTqPT7DQKOpouzPl
KOP4vWA2hn6yW9Pk4Zsk9jOPh88pV3qF7utUJybRoL0EyxXr2xoo8x1L6O8/C/LY
TT17sBeJyOw4An8URfNreZH7Ga8SBWL0THeJuxmSFls2FIxLqrgZVUl90Gim/Qpm
SgZ+sBBOf8aFBD7kP2WeAFFkgDAer53CtTxBplCply78gmDz7lk=
=ngai
-----END PGP SIGNATURE-----

--dJkQ9nBxA/3cen3Z--

