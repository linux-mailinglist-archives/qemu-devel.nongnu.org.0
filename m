Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D673C213C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:08:01 +0200 (CEST)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mUK-0001Na-Mw
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mSI-0007su-Ca; Fri, 09 Jul 2021 05:05:54 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mSG-00024B-DX; Fri, 09 Jul 2021 05:05:54 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N5lvf-1l5RV222fL-017Blt; Fri, 09 Jul 2021 11:05:39 +0200
Subject: Re: [PATCH v2] misc: Fix "havn't" typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210629051400.2573253-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e02ce2cc-7f12-6873-28b6-848059bd6a92@vivier.eu>
Date: Fri, 9 Jul 2021 11:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629051400.2573253-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qokro0qn+ueEC3zmNlCAN/Gh5KkpAscUHVlNtPD+lIunYxRz4OL
 QmY9XjVznkGfCXq9ridWTlgdVgLONNgL6VngzZCJD8IdRasL159WJpMP+z9Y61gBBmQHvG0
 kAjh8j+Ty2YT34WYur0lHw5wGE+Lnno8umoScHH4zr+frhmKBNI5a1DX3MpMqZwOVJUjF8N
 DTxYaokyEB55O6wkCt7lA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pVEJnaUHgwQ=:zJSXex7f/k07pS91nJXg9R
 VTgC2nANNt9ewjPTjZBX9lHWx4bzbp3P0cmnZd4titTRi9IesGygFw8tgkS21Zw8C3FCErIEX
 g1DEr7TyxGAZbaBaw9NvmPvECU0Ymod+Fa/0OKCGJqBrt4U20hCj5+SKk6qnfoi7TPqE3vpxa
 ghexjLhgUY1amX/moOMEAwNl2D0fXVapiquG+JuMEBemZdy18tFZI/A1NOyNGkB9OgIhSfHQj
 Y35z4Hp6CK5kjXi+dxHjKOuPYitAR9frX8jgsDl82BWqSd1YlDLS2VqvTcQtmxjOEKQUfGZ2o
 Gr2Ke9HQPeo5Z9wfyLcdbWDzWy7QBIcJTVBJSOPVRRtMyU64RIx/mwbsBBRMuiu/XSZhHbUiL
 R0AucdEmHSGpKxneqF0q6nkggAjrlplMrbZRLV7YQx7ArZ5i8RIBuA5mdJTYyvK/tKUGgCXu4
 gqOyqk+B/JT9RzGSwukkBRM9DTvOGEDaX4ooSRfPW6krzc8W0csGjWrRSedjPP5j6Y06vdCEp
 SoXgrvdYfR3qbDkOSSgrTunZvQAny55lN9m1OVv0fjr4ASh1lu4T6Cum2K/eGkbEn1VcsKP3K
 v7Z4ldzRWxxU2WIUW4Jo6JipIw8tnqaQA7ZdIYmBNUV+617ijBqTweHE4s4YQR+9l9+0T0Zik
 uXzXIa5cz0Ar0OxyuMVyxz/Gj91ba6hxAs4TD7Ey4FjH1bzhLipD7T2QyLaUcxNG9wkgK8hDK
 dj7PFaMuCe/BMsNOtqEXB0x7ope/JwQp00Uc+tWscr2orgctQBR13Mz+OSGt44NiWnwNMpdTT
 bPGd6fxMKzvyW0V4mP9SugKffm41g7iHfPPHmg5UQylkyjLhn8ai9bt4dVFvmr94+OhfE6j
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/06/2021 à 07:14, Philippe Mathieu-Daudé a écrit :
> Fix "havn't (make)" -> "haven't (made)" typo.
> 
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/usb/desc-msos.c         | 2 +-
>  target/s390x/translate.c   | 6 ++++--
>  tcg/tcg-op.c               | 2 +-
>  tcg/arm/tcg-target.c.inc   | 6 ++++--
>  tcg/sparc/tcg-target.c.inc | 6 ++++--
>  5 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
> index 3a5ad7c8d0f..836e38c67e1 100644
> --- a/hw/usb/desc-msos.c
> +++ b/hw/usb/desc-msos.c
> @@ -181,7 +181,7 @@ static int usb_desc_msos_prop(const USBDesc *desc, uint8_t *dest)
>  
>      if (desc->msos->Label) {
>          /*
> -         * Given as example in the specs.  Havn't figured yet where
> +         * Given as example in the specs.  Haven't figured yet where
>           * this label shows up in the windows gui.
>           */
>          length += usb_desc_msos_prop_str(dest+length, MSOS_REG_SZ,
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index e243624d2a6..6ac797a8a94 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -6270,8 +6270,10 @@ static void extract_field(DisasFields *o, const DisasField *f, uint64_t insn)
>          abort();
>      }
>  
> -    /* Validate that the "compressed" encoding we selected above is valid.
> -       I.e. we havn't make two different original fields overlap.  */
> +    /*
> +     * Validate that the "compressed" encoding we selected above is valid.
> +     * I.e. we haven't made two different original fields overlap.
> +     */
>      assert(((o->presentC >> f->indexC) & 1) == 0);
>      o->presentC |= 1 << f->indexC;
>      o->presentO |= 1 << f->indexO;
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index dcc2ed0bbc8..869dc6cdd29 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2695,7 +2695,7 @@ void tcg_gen_goto_tb(unsigned idx)
>      /* We only support two chained exits.  */
>      tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
>  #ifdef CONFIG_DEBUG_TCG
> -    /* Verify that we havn't seen this numbered exit before.  */
> +    /* Verify that we haven't seen this numbered exit before.  */
>      tcg_debug_assert((tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0);
>      tcg_ctx->goto_tb_issue_mask |= 1 << idx;
>  #endif
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 51571432460..5882479f3d3 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -2444,8 +2444,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>  
>  static void tcg_target_init(TCGContext *s)
>  {
> -    /* Only probe for the platform and capabilities if we havn't already
> -       determined maximum values at compile time.  */
> +    /*
> +     * Only probe for the platform and capabilities if we haven't already
> +     * determined maximum values at compile time.
> +     */
>  #if !defined(use_idiv_instructions) || !defined(use_neon_instructions)
>      {
>          unsigned long hwcap = qemu_getauxval(AT_HWCAP);
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index a6ec94a094f..688827968b0 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -1690,8 +1690,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>  
>  static void tcg_target_init(TCGContext *s)
>  {
> -    /* Only probe for the platform and capabilities if we havn't already
> -       determined maximum values at compile time.  */
> +    /*
> +     * Only probe for the platform and capabilities if we haven't already
> +     * determined maximum values at compile time.
> +     */
>  #ifndef use_vis3_instructions
>      {
>          unsigned long hwcap = qemu_getauxval(AT_HWCAP);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


