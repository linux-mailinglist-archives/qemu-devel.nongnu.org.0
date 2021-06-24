Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70953B2E2E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:50:37 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNsS-0005wA-TY
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anat.heilper@gmail.com>)
 id 1lwNL1-0003zq-37
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:16:04 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:33666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anat.heilper@gmail.com>)
 id 1lwNKs-0006w0-9q
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:16:02 -0400
Received: by mail-oi1-x22b.google.com with SMTP id s17so6980634oij.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=w118365a64A85ekLIV4KfWX2XciHvcF3XjbENN0nlm0=;
 b=AIR+pU//fWJQiwBvmh8OJeQIZCHA36sanPDX2H+FnoxxIKKAn6qqtWCDIfbEkYN3ID
 jLkxmmL+DQsPdWbALIwJQtgFvauH0bJvlro5rRcHWwrIDj+WJ6Wy4gDmRrzT+L0oQDkF
 mJfsC3WUDC+4X3nFYWZnF7nu0S5dMnT9nsyLhPvtiEirOJ6VIv/8FtqMINI9Zy/1ozHx
 KpEWiB4pKE6/wE6TRWUFiGGXm3kTp8w/VQmXWVMVNjLTNjzXmbnSetcGT7rweL/jYtdt
 1IWGyIjsrqmftNwBd5CFWBF322+L7tf+gAOOjtQxlkFUycpHqRu/FKHSSfyvT+LP9UJ3
 FR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=w118365a64A85ekLIV4KfWX2XciHvcF3XjbENN0nlm0=;
 b=Qxq8QVr/LolDnRk1t1cTag4a6g6bAQGu3kXoIgcznsXJQNllvqLBVSCg8/yTrUgrK9
 wJSj/XlQ/zDjPmiWQTjvkId3cphpYNXO1wbjesL2Vdz54PFBATwLlQ7fkS3SeoKO0sMm
 nGuB/2MApaQuyjmec3NIRpvttkIToJ24w+PgXR5VdzvEQszzcjgXdwyNXj/WUro6Jofs
 75BbBpZ5cheSiYZNncUC1KMTEfsu1ZeF63NCvHzNvACYimecozgRrasWY5fyf7ni0T4o
 rhOJiZ3IsJAnrJ2ZyWw6/9TBZjtCzeFbBuhiI9h6wmxwM/ZT2DmW42tgojOeoYtwwCyv
 t5DQ==
X-Gm-Message-State: AOAM532tqIrOn8VuBM4T2EKjo6ikctkUktPcWrXoOaC/gtaY6hj707ze
 dtNxw1RWp4kwD9C34gdLUFy2Mosp2jIakvakZoIvIcbXmw==
X-Google-Smtp-Source: ABdhPJxkIKG8up3FxN5O36si48uTRIPrJ+mSjkei6HKtHH7WpEOAtrzGVZ9pgoyoJ3FS+BfY4H5oKmI9863saCrO97Y=
X-Received: by 2002:aca:4143:: with SMTP id o64mr3519697oia.105.1624533351053; 
 Thu, 24 Jun 2021 04:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.14172.1624515218.20688.qemu-devel@nongnu.org>
In-Reply-To: <mailman.14172.1624515218.20688.qemu-devel@nongnu.org>
From: Anat Heilper <anat.heilper@gmail.com>
Date: Thu, 24 Jun 2021 14:15:39 +0300
Message-ID: <CAPH6Wk9NvkKrrLhNP7cn2eDUgCsM-suB_eutrz+8xjPwoqiBmQ@mail.gmail.com>
Subject: Re: Qemu-devel Digest, Vol 219, Issue 440
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000050bf4b05c58125ca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=anat.heilper@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_MIME_MALF=0.01 autolearn=ham autolearn_force=no
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

--00000000000050bf4b05c58125ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021, 09:15 <qemu-devel-request@nongnu.org> wrote:

> Send Qemu-devel mailing list submissions to
>         qemu-devel@nongnu.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.nongnu.org/mailman/listinfo/qemu-devel
> or, via email, send a message with subject or body 'help' to
>         qemu-devel-request@nongnu.org
>
> You can reach the person managing the list at
>         qemu-devel-owner@nongnu.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Qemu-devel digest..."
>
>
> Today's Topics:
>
>    1. RE: [PATCH v5 10/14] target/hexagon: import parser for
>       idef-parser (Taylor Simpson)
>    2. [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
>       (Vivek Kasireddy)
>    3. [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI
>       (Vivek Kasireddy)
>    4. Re: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
>       (no-reply@patchew.org)
>    5. Re: [PATCH v2 03/10] target/ppc: Push real-mode handling into
>       ppc_radix64_xlate (David Gibson)
>    6. Re: [PATCH v2 02/10] target/ppc: Use MMUAccessType with
>       *_handle_mmu_fault (David Gibson)
>    7. Re: [PATCH v2 04/10] target/ppc: Use bool success for
>       ppc_radix64_xlate (David Gibson)
>    8. Re: [PATCH v3 02/24] modules: collect module meta-data
>       (Paolo Bonzini)
>    9. Re: [PATCH v2 04/37] target/riscv: 8-bit Addition &
>       Subtraction Instruction (LIU Zhiwei)
>   10. Re: [PATCH v2 03/23] qapi/misc-target: Group SEV QAPI
>       definitions (Dov Murik)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Thu, 24 Jun 2021 03:55:35 +0000
> From: Taylor Simpson <tsimpson@quicinc.com>
> To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
>         <qemu-devel@nongnu.org>
> Cc: Brian Cain <bcain@quicinc.com>, "babush@rev.ng" <babush@rev.ng>,
>         "nizzo@rev.ng" <nizzo@rev.ng>, "philmd@redhat.com"
>         <philmd@redhat.com>, "richard.henderson@linaro.org"
>         <richard.henderson@linaro.org>, Alessandro Di Federico <ale@rev.n=
g
> >
> Subject: RE: [PATCH v5 10/14] target/hexagon: import parser for
>         idef-parser
> Message-ID:
>         <
> BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outloo=
k.com
> >
>
> Content-Type: text/plain; charset=3D"us-ascii"
>
>
>
> > -----Original Message-----
> > From: Alessandro Di Federico <ale.qemu@rev.ng>
> > Sent: Saturday, June 19, 2021 3:37 AM
> > To: qemu-devel@nongnu.org
> > Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> > <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> > richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> > Subject: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
> >
> > From: Paolo Montesel <babush@rev.ng>
> >
> > Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> > Signed-off-by: Paolo Montesel <babush@rev.ng>
> > ---
> > diff --git a/target/hexagon/idef-parser/idef-parser.y
> b/target/hexagon/idef-
> > parser/idef-parser.y
>
>
>
> > +for_statement : FOR '(' IMM '=3D' IMM ';' IMM '<' IMM ';' IMM PLUSPLUS=
 ')'
> > +                {
> > +                    @1.last_column =3D @13.last_column;
> > +                    OUT(c, &@1, "for (int ", &$3, " =3D ", &$5, "; ",
> > +                        &$7, " < ", &$9);
> > +                    OUT(c, &@1, "; ", &$11, "++) {\n");
>
> Increase indent level here
>
> > +                }
> > +                code_block
> > +                {
>
> Decrease indent level
>
> > +                    OUT(c, &@1, "}\n");
> > +                }
> > +              | FOR '(' IMM '=3D' IMM ';' IMM '<' IMM ';' IMM INC IMM =
')'
> > +                {
> > +                    @1.last_column =3D @14.last_column;
> > +                    OUT(c, &@1, "for (int ", &$3, " =3D ", &$5, "; ",
> > +                        &$7, " < ", &$9);
> > +                    OUT(c, &@1, "; ", &$11, " +=3D ", &$13, ") {\n");
>
> Increase indent
>
> > +                }
> > +                code_block
> > +                {
>
> Decrease indent
>
> > +                    OUT(c, &@1, "}\n");
> > +                }
> > +              ;
> > +
> > +fpart1_statement : PART1
> > +                   {
> > +                       OUT(c, &@1, "if (insn->part1) {\n");
>
> Increase indent
>
> > +                   }
> > +                   '(' statements ')'
> > +                   {
> > +                       @1.last_column =3D @3.last_column;
>
> Emit the return first, then decrease indent before the curly
>
> > +                       OUT(c, &@1, "return; }\n");
> > +                   }
> > +                 ;
>
>
> > +       | rvalue '[' rvalue ']'
> > +         {
> > +             @1.last_column =3D @4.last_column;
> > +             if ($3.type =3D=3D IMMEDIATE) {
> > +                 $$ =3D gen_tmp(c, &@1, $1.bit_width);
> > +                 OUT(c, &@1, "tcg_gen_extract_i", &$$.bit_width, "(");
> > +                 OUT(c, &@1, &$$, ", ", &$1, ", ", &$3, ", 1);\n");
> > +             } else {
> > +                 HexValue one =3D gen_imm_value(c, &@1, 1, $3.bit_widt=
h);
> > +                 HexValue tmp =3D gen_bin_op(c, &@1, ASR_OP, &$1, &$3)=
;
> > +                 $$ =3D gen_bin_op(c, &@1, ANDB_OP, &tmp, &one);
>
> Can this be done with a tcg_gen_extract_tl or tcg_gen_sextract_tl?
>
> Do you need to worry about signed-ness?
>
> > diff --git a/target/hexagon/idef-parser/parser-helpers.c
> > b/target/hexagon/idef-parser/parser-helpers.c
> > new file mode 100644
>
>
> > +const char *creg_str[] =3D {"HEX_REG_SP", "HEX_REG_FP", "HEX_REG_LR",
> > +                          "HEX_REG_GP", "HEX_REG_LC0", "HEX_REG_LC1",
> > +                          "HEX_REG_SA0", "HEX_REG_SA1"};
>
> SP, FP, LR shouldn't in this array.
>
> > +void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5=
])
> > +{
> > +    switch (reg->type) {
> > +    case GENERAL_PURPOSE:
> > +        reg_id[0] =3D 'R';
> > +        break;
> > +    case CONTROL:
> > +        reg_id[0] =3D 'C';
> > +        break;
> > +    case MODIFIER:
> > +        reg_id[0] =3D 'M';
> > +        break;
> > +    case DOTNEW:
> > +        /* The DOTNEW case is managed by the upper level function */
>
> Should we raise an error if we get here?
>
> > +        break;
> > +    }
> > +    switch (reg->bit_width) {
> > +    case 32:
> > +        reg_id[1] =3D reg->id;
> > +        reg_id[2] =3D 'V';
> > +        break;
> > +    case 64:
> > +        reg_id[1] =3D reg->id;
> > +        reg_id[2] =3D reg->id;
> > +        reg_id[3] =3D 'V';
> > +        break;
> > +    default:
> > +        yyassert(c, locp, false, "Unhandled register bit width!\n");
> > +    }
> > +}
> > +
> > +void reg_print(Context *c, YYLTYPE *locp, HexReg *reg)
> > +{
> > +  if (reg->type =3D=3D DOTNEW) {
> > +    EMIT(c, "N%cN", reg->id);
>
> Why not handle this in reg_compose?
>
> > +  } else {
> > +    char reg_id[5] =3D { 0 };
> > +    reg_compose(c, locp, reg, reg_id);
> > +    EMIT(c, "%s", reg_id);
> > +  }
> > +}
> > +
> > +void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
> > +{
> > +    switch (imm->type) {
> > +    case I:
> > +        EMIT(c, "i");
> > +        break;
> > +    case VARIABLE:
> > +        EMIT(c, "%ciV", imm->id);
> > +        break;
> > +    case VALUE:
> > +        EMIT(c, "((int64_t)%" PRIu64 "ULL)", (int64_t)imm->value);
> > +        break;
> > +    case QEMU_TMP:
> > +        EMIT(c, "qemu_tmp_%" PRIu64, imm->index);
> > +        break;
> > +    case IMM_PC:
> > +        EMIT(c, "ctx->base.pc_next");
> > +        break;
> > +    case IMM_NPC:
> > +        EMIT(c, "ctx->npc");
> > +        break;
> > +    case IMM_CONSTEXT:
> > +        EMIT(c, "insn->extension_valid");
>
> The extension_valid field is a bool indicating if the instruction has a
> constant extender.  Don't you want the actual value here?
>
> > +        break;
>
>
> > +
> > +static HexValue get_ternary_cond(Context *c, YYLTYPE *locp)
> > +{
> > +    yyassert(c, locp, is_inside_ternary(c), "unexisting condition");
> > +    Ternary *t =3D &g_array_index(c->ternary, Ternary, 0);
> > +    HexValue cond =3D t->cond;
> > +    if (t->state =3D=3D IN_RIGHT) {
> > +        cond =3D gen_rvalue_notl(c, locp, &cond);
> > +    }
> > +    for (unsigned i =3D 1; i < c->ternary->len; ++i) {
> > +        Ternary *right =3D &g_array_index(c->ternary, Ternary, i);
> > +        HexValue other =3D right->cond;
> > +        /* Invert condition if we are on the right side */
> > +        if (right->state =3D=3D IN_RIGHT) {
> > +            other =3D gen_rvalue_notl(c, locp, &other);
> > +        }
> > +        cond =3D gen_bin_op(c, locp, ANDL_OP, &cond, &other);
> > +    }
> > +    return cond;
> > +}
> > +
> > +/* Temporary values creation */
> > +HexValue gen_tmp(Context *c, YYLTYPE *locp, int bit_width)
> > +{
> > +    HexValue rvalue;
> > +    rvalue.type =3D TEMP;
> > +    bit_width =3D (bit_width =3D=3D 64) ? 64 : 32;
>
> Better to assert it's either 64 or 32
>
> > +    rvalue.bit_width =3D bit_width;
> > +    rvalue.is_unsigned =3D false;
> > +    rvalue.is_dotnew =3D false;
> > +    rvalue.is_manual =3D false;
> > +    rvalue.tmp.index =3D c->inst.tmp_count;
> > +    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
> > +        " =3D tcg_temp_new_i", &bit_width, "();\n");
> > +    c->inst.tmp_count++;
> > +    return rvalue;
> > +}
> > +
>
>
> > +
> > +void rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue)
>
> Should be called gen_rvalue_free
>
> > +{
> > +    if (rvalue->type =3D=3D TEMP && !rvalue->is_manual) {
> > +        const char *bit_suffix =3D (rvalue->bit_width =3D=3D 64) ? "i6=
4" :
> "i32";
> > +        OUT(c, locp, "tcg_temp_free_", bit_suffix, "(", rvalue, ");\n"=
);
> > +    }
> > +}
>
>
> > +HexValue rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)
>
> Should be called gen_rvalue_extend
>
> > +{
> > +    if (rvalue->type =3D=3D IMMEDIATE) {
> > +        HexValue res =3D *rvalue;
> > +        res.bit_width =3D 64;
> > +        return res;
> > +    } else {
> > +        if (rvalue->bit_width =3D=3D 32) {
> > +            HexValue res =3D gen_tmp(c, locp, 64);
> > +            const char *sign_suffix =3D (rvalue->is_unsigned) ? "u" : =
"";
> > +            OUT(c, locp, "tcg_gen_ext", sign_suffix,
> > +                "_i32_i64(", &res, ", ", rvalue, ");\n");
> > +            rvalue_free(c, locp, rvalue);
> > +            return res;
> > +        }
> > +    }
> > +    return *rvalue;
> > +}
> > +
> > +HexValue rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue)
>
> Should be called gen_rvalue_truncate
>
> > +{
> > +    if (rvalue->type =3D=3D IMMEDIATE) {
> > +        HexValue res =3D *rvalue;
> > +        res.bit_width =3D 32;
> > +        return res;
> > +    } else {
> > +        if (rvalue->bit_width =3D=3D 64) {
> > +            HexValue res =3D gen_tmp(c, locp, 32);
> > +            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", rvalue,
> ");\n");
> > +            rvalue_free(c, locp, rvalue);
> > +            return res;
> > +        }
> > +    }
> > +    return *rvalue;
> > +}
> > +
>
>
> > +void varid_allocate(Context *c,
>
> gen_varid_allocate
>
> > +                    YYLTYPE *locp,
> > +                    HexValue *varid,
> > +                    int width,
> > +                    bool is_unsigned)
> > +{
> > +    varid->bit_width =3D width;
> > +    const char *bit_suffix =3D width =3D=3D 64 ? "64" : "32";
> > +    int index =3D find_variable(c, locp, varid);
> > +    bool found =3D index !=3D -1;
> > +    if (found) {
> > +        Var *other =3D &g_array_index(c->inst.allocated, Var, index);
> > +        varid->var.name =3D other->name;
> > +        varid->bit_width =3D other->bit_width;
> > +        varid->is_unsigned =3D other->is_unsigned;
> > +    } else {
> > +        EMIT_HEAD(c, "TCGv_i%s %s", bit_suffix, varid->var.name->str);
> > +        EMIT_HEAD(c, " =3D tcg_temp_local_new_i%s();\n", bit_suffix);
> > +        Var new_var =3D {
> > +            .name =3D varid->var.name,
> > +            .bit_width =3D width,
> > +            .is_unsigned =3D is_unsigned,
> > +        };
> > +        g_array_append_val(c->inst.allocated, new_var);
> > +    }
> > +}
> > +
> > +void ea_free(Context *c, YYLTYPE *locp)
>
> gen_ea_free
>
> > +{
> > +    OUT(c, locp, "tcg_temp_free(EA);\n");
> > +}
> > +HexValue gen_bin_cmp(Context *c,
> > +                     YYLTYPE *locp,
> > +                     TCGCond type,
> > +                     HexValue *op1_ptr,
> > +                     HexValue *op2_ptr)
> > +{
> > +    HexValue op1 =3D *op1_ptr;
> > +    HexValue op2 =3D *op2_ptr;
> > +    enum OpTypes op_types =3D (op1.type !=3D IMMEDIATE) << 1
> > +                            | (op2.type !=3D IMMEDIATE);
> > +
> > +    /* Find bit width of the two operands, if at least one is 64 bit
> use a */
> > +    /* 64bit operation, eventually extend 32bit operands. */
>
> This is duplicated elsewhere (e.g., gen_bin_op) - should be pulled into a
> single function.
>
> > +    bool op_is64bit =3D op1.bit_width =3D=3D 64 || op2.bit_width =3D=
=3D 64;
> > +    const char *bit_suffix =3D op_is64bit ? "i64" : "i32";
> > +    int bit_width =3D (op_is64bit) ? 64 : 32;
> > +    if (op_is64bit) {
> > +        switch (op_types) {
> > +        case IMM_IMM:
> > +            break;
> > +        case IMM_REG:
> > +            op2 =3D rvalue_extend(c, locp, &op2);
> > +            break;
> > +        case REG_IMM:
> > +            op1 =3D rvalue_extend(c, locp, &op1);
> > +            break;
> > +        case REG_REG:
> > +            op1 =3D rvalue_extend(c, locp, &op1);
> > +            op2 =3D rvalue_extend(c, locp, &op2);
> > +            break;
> > +        }
> > +    }
>
>
>
> > +static void gen_mini_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> > +                        HexValue *res, enum OpTypes op_types,
> > +                        HexValue *op1_ptr, HexValue *op2_ptr)
> > +{
> > +    HexValue op1 =3D *op1_ptr;
> > +    HexValue op2 =3D *op2_ptr;
> > +    const char *min =3D res->is_unsigned ? "tcg_gen_umin" :
> "tcg_gen_smin";
> > +    switch (op_types) {
> > +    case IMM_IMM:
> > +        OUT(c, locp, "int", &bit_width, "_t ", res, " =3D (", &op1, " =
<=3D
> ");
> > +        OUT(c, locp, &op2, ") ? ", &op1, " : ", &op2, ";\n");
> > +        break;
> > +    case IMM_REG:
> > +        op1.bit_width =3D bit_width;
> > +        op1 =3D rvalue_materialize(c, locp, &op1);
> > +        OUT(c, locp, min, "_i", &bit_width, "(");
> > +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> > +        break;
> > +    case REG_IMM:
> > +        op2.bit_width =3D bit_width;
> > +        op2 =3D rvalue_materialize(c, locp, &op2);
> > +        /* Fallthrough */
> > +    case REG_REG:
> > +        OUT(c, locp, min, "_i", &bit_width, "(");
> > +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> > +        break;
> > +    }
> > +    rvalue_free(c, locp, &op1);
> > +    rvalue_free(c, locp, &op2);
> > +}
> > +
> > +static void gen_maxi_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> > +                        HexValue *res, enum OpTypes op_types,
> > +                        HexValue *op1_ptr, HexValue *op2_ptr)
> > +{
> > +    HexValue op1 =3D *op1_ptr;
> > +    HexValue op2 =3D *op2_ptr;
> > +    const char *min =3D res->is_unsigned ? "tcg_gen_umax" :
> "tcg_gen_smax";
> > +    switch (op_types) {
> > +    case IMM_IMM:
> > +        OUT(c, locp, "int", &bit_width, "_t ", res, " =3D (", &op1, " =
<=3D
> ");
> > +        OUT(c, locp, &op2, ") ? ", &op2, " : ", &op1, ";\n");
> > +        break;
> > +    case IMM_REG:
> > +        op1.bit_width =3D bit_width;
> > +        op1 =3D rvalue_materialize(c, locp, &op1);
> > +        OUT(c, locp, min, "_i", &bit_width, "(");
> > +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> > +        break;
> > +    case REG_IMM:
> > +        op2.bit_width =3D bit_width;
> > +        op2 =3D rvalue_materialize(c, locp, &op2);
> > +        /* Fallthrough */
> > +    case REG_REG:
> > +        OUT(c, locp, min, "_i", &bit_width, "(");
> > +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> > +        break;
> > +    }
> > +    rvalue_free(c, locp, &op1);
> > +    rvalue_free(c, locp, &op2);
> > +}
>
> These two look basically the same, create a single function with one extr=
a
> are indicating min/max.
>
>
> > +HexValue gen_cast_op(Context *c,
> > +                     YYLTYPE *locp,
> > +                     HexValue *source,
> > +                     unsigned target_width) {
>
> Don't you need to worry about signed-ness of the result?
>
> > +    if (source->bit_width =3D=3D target_width) {
> > +        return *source;
> > +    } else if (source->type =3D=3D IMMEDIATE) {
> > +        HexValue res =3D *source;
> > +        res.bit_width =3D target_width;
> > +        return res;
> > +    } else {
> > +        HexValue res =3D gen_tmp(c, locp, target_width);
> > +        /* Truncate */
> > +        if (source->bit_width > target_width) {
> > +            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", source,
> ");\n");
> > +        } else {
> > +            if (source->is_unsigned) {
> > +                /* Extend unsigned */
> > +                OUT(c, locp, "tcg_gen_extu_i32_i64(",
> > +                    &res, ", ", source, ");\n");
> > +            } else {
> > +                /* Extend signed */
> > +                OUT(c, locp, "tcg_gen_ext_i32_i64(",
> > +                    &res, ", ", source, ");\n");
> > +            }
> > +        }
> > +        rvalue_free(c, locp, source);
> > +        return res;
> > +    }
> > +}
> > +
> > +HexValue gen_extend_op(Context *c,
> > +                       YYLTYPE *locp,
> > +                       HexValue *src_width_ptr,
> > +                       HexValue *dst_width_ptr,
> > +                       HexValue *value_ptr,
> > +                       bool is_unsigned) {
> > +    HexValue src_width =3D *src_width_ptr;
> > +    HexValue dst_width =3D *dst_width_ptr;
> > +    HexValue value =3D *value_ptr;
> > +    src_width =3D rvalue_extend(c, locp, &src_width);
> > +    value =3D rvalue_extend(c, locp, &value);
> > +    src_width =3D rvalue_materialize(c, locp, &src_width);
> > +    value =3D rvalue_materialize(c, locp, &value);
> > +
> > +    HexValue res =3D gen_tmp(c, locp, 64);
> > +    HexValue shift =3D gen_tmp_value(c, locp, "64", 64);
> > +    HexValue zero =3D gen_tmp_value(c, locp, "0", 64);
> > +    OUT(c, locp, "tcg_gen_sub_i64(",
> > +        &shift, ", ", &shift, ", ", &src_width, ");\n");
> > +    if (is_unsigned) {
> > +        HexValue mask =3D gen_tmp_value(c, locp, "0xffffffffffffffff",
> 64);
> > +        OUT(c, locp, "tcg_gen_shr_i64(",
> > +            &mask, ", ", &mask, ", ", &shift, ");\n");
> > +        OUT(c, locp, "tcg_gen_and_i64(",
> > +            &res, ", ", &value, ", ", &mask, ");\n");
> > +        rvalue_free(c, locp, &mask);
>
> Can't you do this with tcg_gen_extract?
>
> > +    } else {
> > +        OUT(c, locp, "tcg_gen_shl_i64(",
> > +            &res, ", ", &value, ", ", &shift, ");\n");
> > +        OUT(c, locp, "tcg_gen_sar_i64(",
> > +            &res, ", ", &res, ", ", &shift, ");\n");
>
> Can't you do this with get_gen_sectract?
>
> > +    }
> > +    OUT(c, locp, "tcg_gen_movcond_i64(TCG_COND_EQ, ", &res, ", ");
> > +    OUT(c, locp, &src_width, ", ", &zero, ", ", &zero, ", ", &res,
> ");\n");
> > +
> > +    rvalue_free(c, locp, &src_width);
> > +    rvalue_free(c, locp, &dst_width);
> > +    rvalue_free(c, locp, &value);
> > +    rvalue_free(c, locp, &shift);
> > +    rvalue_free(c, locp, &zero);
> > +
> > +    res.is_unsigned =3D is_unsigned;
> > +    return res;
> > +}
> > +
> > +void gen_rdeposit_op(Context *c,
> > +                     YYLTYPE *locp,
> > +                     HexValue *dest,
> > +                     HexValue *value,
> > +                     HexValue *begin,
> > +                     HexValue *width)
> > +{
> > +    HexValue dest_m =3D *dest;
> > +    dest_m.is_manual =3D true;
> > +
> > +    HexValue value_m =3D rvalue_extend(c, locp, value);
> > +    HexValue begin_m =3D rvalue_extend(c, locp, begin);
> > +    HexValue width_orig =3D *width;
> > +    width_orig.is_manual =3D true;
> > +    HexValue width_m =3D rvalue_extend(c, locp, &width_orig);
> > +    width_m =3D rvalue_materialize(c, locp, &width_m);
> > +
> > +    HexValue mask =3D gen_tmp_value(c, locp, "0xffffffffffffffffUL", 6=
4);
> > +    mask.is_unsigned =3D true;
> > +    HexValue k64 =3D gen_tmp_value(c, locp, "64", 64);
> > +    k64 =3D gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
> > +    mask =3D gen_bin_op(c, locp, LSR_OP, &mask, &k64);
> > +    begin_m.is_manual =3D true;
> > +    mask =3D gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
> > +    mask.is_manual =3D true;
> > +    value_m =3D gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
> > +    value_m =3D gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);
> > +
> > +    OUT(c, locp, "tcg_gen_not_i64(", &mask, ", ", &mask, ");\n");
> > +    mask.is_manual =3D false;
> > +    HexValue res =3D gen_bin_op(c, locp, ANDB_OP, &dest_m, &mask);
> > +    res =3D gen_bin_op(c, locp, ORB_OP, &res, &value_m);
> > +
>
> Can't you do this with tcg_gen_deposit?
>
> > +    if (dest->bit_width !=3D res.bit_width) {
> > +        res =3D rvalue_truncate(c, locp, &res);
> > +    }
> > +
> > +    HexValue zero =3D gen_tmp_value(c, locp, "0", res.bit_width);
> > +    OUT(c, locp, "tcg_gen_movcond_i", &res.bit_width, "(TCG_COND_NE, "=
,
> > dest);
> > +    OUT(c, locp, ", ", &width_orig, ", ", &zero, ", ", &res, ", ", des=
t,
> > +        ");\n");
> > +
> > +    rvalue_free(c, locp, &zero);
> > +    rvalue_free(c, locp, width);
> > +    rvalue_free(c, locp, &res);
> > +}
> > +
> > +void gen_deposit_op(Context *c,
> > +                    YYLTYPE *locp,
> > +                    HexValue *dest,
> > +                    HexValue *value,
> > +                    HexValue *index,
> > +                    HexCast *cast)
>
> What's the difference between this and the gen_rdeposit_op above?
>
>
> > +{
> > +    yyassert(c, locp, index->type =3D=3D IMMEDIATE,
> > +             "Deposit index must be immediate!\n");
> > +    HexValue value_m =3D *value;
> > +    int bit_width =3D (dest->bit_width =3D=3D 64) ? 64 : 32;
> > +    int width =3D cast->bit_width;
> > +    /* If the destination value is 32, truncate the value, otherwise
> extend */
> > +    if (dest->bit_width !=3D value->bit_width) {
> > +        if (bit_width =3D=3D 32) {
> > +            value_m =3D rvalue_truncate(c, locp, &value_m);
> > +        } else {
> > +            value_m =3D rvalue_extend(c, locp, &value_m);
> > +        }
> > +    }
> > +    value_m =3D rvalue_materialize(c, locp, &value_m);
> > +    OUT(c, locp, "tcg_gen_deposit_i", &bit_width, "(", dest, ", ",
> dest, ", ");
> > +    OUT(c, locp, &value_m, ", ", index, " * ", &width, ", ", &width,
> ");\n");
> > +    rvalue_free(c, locp, index);
> > +    rvalue_free(c, locp, &value_m);
> > +}
> > +
> > +HexValue gen_rextract_op(Context *c,
> > +                         YYLTYPE *locp,
> > +                         HexValue *source,
> > +                         int begin,
> > +                         int width) {
> > +    int bit_width =3D (source->bit_width =3D=3D 64) ? 64 : 32;
> > +    HexValue res =3D gen_tmp(c, locp, bit_width);
> > +    OUT(c, locp, "tcg_gen_extract_i", &bit_width, "(", &res);
> > +    OUT(c, locp, ", ", source, ", ", &begin, ", ", &width, ");\n");
> > +    rvalue_free(c, locp, source);
> > +    return res;
> > +}
> > +
> > +HexValue gen_extract_op(Context *c,
> > +                        YYLTYPE *locp,
> > +                        HexValue *source,
> > +                        HexValue *index,
> > +                        HexExtract *extract) {
>
> What's the difference between this ant the gen_rextract_op above?
>
> > +    yyassert(c, locp, index->type =3D=3D IMMEDIATE,
> > +             "Extract index must be immediate!\n");
> > +    int bit_width =3D (source->bit_width =3D=3D 64) ? 64 : 32;
> > +    const char *sign_prefix =3D (extract->is_unsigned) ? "" : "s";
> > +    int width =3D extract->bit_width;
> > +    HexValue res =3D gen_tmp(c, locp, bit_width);
> > +    res.is_unsigned =3D extract->is_unsigned;
> > +    OUT(c, locp, "tcg_gen_", sign_prefix, "extract_i", &bit_width,
> > +        "(", &res, ", ", source);
> > +    OUT(c, locp, ", ", index, " * ", &width, ", ", &width, ");\n");
> > +
> > +    /* Some extract operations have bit_width !=3D storage_bit_width *=
/
> > +    if (extract->storage_bit_width > bit_width) {
> > +        HexValue tmp =3D gen_tmp(c, locp, extract->storage_bit_width);
> > +        tmp.is_unsigned =3D extract->is_unsigned;
> > +        if (extract->is_unsigned) {
> > +            /* Extend unsigned */
> > +            OUT(c, locp, "tcg_gen_extu_i32_i64(",
> > +                &tmp, ", ", &res, ");\n");
> > +        } else {
> > +            /* Extend signed */
> > +            OUT(c, locp, "tcg_gen_ext_i32_i64(",
> > +                &tmp, ", ", &res, ");\n");
> > +        }
> > +        rvalue_free(c, locp, &res);
> > +        res =3D tmp;
> > +    }
> > +
> > +    rvalue_free(c, locp, source);
> > +    rvalue_free(c, locp, index);
> > +    return res;
> > +}
> > +
> > +HexValue gen_read_creg(Context *c, YYLTYPE *locp, HexValue *reg)
> > +{
> > +    yyassert(c, locp, reg->type =3D=3D REGISTER, "reg must be a regist=
er!");
> > +    if (reg->reg.id < 'a') {
>
> What is this check telling us?
>
> > +        HexValue tmp =3D gen_tmp_value(c, locp, "0", 32);
> > +        const char *id =3D creg_str[(uint8_t)reg->reg.id];
> > +        OUT(c, locp, "READ_REG(", &tmp, ", ", id, ");\n");
>
> Change READ_REG to gen_read_reg - that's what the macro is.
>
> > +        rvalue_free(c, locp, reg);
> > +        return tmp;
> > +    }
> > +    return *reg;
> > +}
> > +
>
>
> > +/* Circular addressing mode with auto-increment */
> > +void gen_circ_op(Context *c,
> > +                 YYLTYPE *locp,
> > +                 HexValue *addr,
> > +                 HexValue *increment,
> > +                 HexValue *modifier) {
> > +    HexValue increment_m =3D *increment;
> > +    HexValue cs =3D gen_tmp(c, locp, 32);
> > +    increment_m =3D rvalue_materialize(c, locp, &increment_m);
> > +    OUT(c, locp, "READ_REG(", &cs, ", HEX_REG_CS0 + MuN);\n");
>
> Change READ_REG to gen_read_reg
>
> > +    OUT(c,
> > +        locp,
> > +        "gen_helper_fcircadd(",
> > +        addr,
> > +        ", ",
> > +        addr,
> > +        ", ",
> > +        &increment_m,
> > +        ", ",
> > +        modifier);
> > +    OUT(c, locp, ", ", &cs, ");\n");
> > +    rvalue_free(c, locp, &increment_m);
> > +    rvalue_free(c, locp, modifier);
> > +    rvalue_free(c, locp, &cs);
> > +}
>
>
>
> > +void gen_load(Context *c, YYLTYPE *locp, HexValue *num, HexValue *size=
,
> > +              bool is_unsigned, HexValue *ea, HexValue *dst)
> > +{
> > +    /* Memop width is specified in the load macro */
> > +    int bit_width =3D (size->imm.value > 4) ? 64 : 32;
> > +    const char *sign_suffix =3D (size->imm.value > 4)
> > +                              ? ""
> > +                              : ((is_unsigned) ? "u" : "s");
> > +    char size_suffix[4] =3D { 0 };
> > +    /* Create temporary variable (if not present) */
> > +    if (dst->type =3D=3D VARID) {
> > +        /* TODO: this is a common pattern, the parser should be
> varid-aware.
> > */
> > +        varid_allocate(c, locp, dst, bit_width, is_unsigned);
> > +    }
> > +    snprintf(size_suffix, 4, "%" PRIu64, size->imm.value * 8);
> > +    if (bit_width =3D=3D 32) {
> > +        *dst =3D rvalue_truncate(c, locp, dst);
> > +    } else {
> > +        *dst =3D rvalue_extend(c, locp, dst);
> > +    }
>
> Why is the truncate/extend needed for the destination?
>
> > +    int var_id =3D find_variable(c, locp, ea);
> > +    yyassert(c, locp, var_id !=3D -1, "Load variable must exist!\n");
> > +    /* We need to enforce the variable size */
> > +    ea->bit_width =3D g_array_index(c->inst.allocated, Var,
> var_id).bit_width;
> > +    if (ea->bit_width !=3D 32) {
> > +        *ea =3D rvalue_truncate(c, locp, ea);
> > +    }
> > +    OUT(c, locp, "if (insn->slot =3D=3D 0 && pkt->pkt_has_store_s1) {\=
n");
> > +    OUT(c, locp, "process_store(ctx, pkt, 1);\n");
>
> Indent
>
> > +    OUT(c, locp, "}\n");
> > +    OUT(c, locp, "tcg_gen_qemu_ld", size_suffix, sign_suffix);
> > +    OUT(c, locp, "(", dst, ", ", ea, ", 0);\n");
> > +    /* If the var in EA was truncated it is now a tmp HexValue, so fre=
e
> it. */
> > +    rvalue_free(c, locp, ea);
> > +}
> > +
> > +void gen_store(Context *c, YYLTYPE *locp, HexValue *num, HexValue
> > *size,
> > +               HexValue *ea, HexValue *src)
> > +{
> > +    /* Memop width is specified in the store macro */
> > +    int mem_width =3D size->imm.value;
> > +    /* Adjust operand bit width to memop bit width */
> > +    if (mem_width < 8) {
> > +        *src =3D rvalue_truncate(c, locp, src);
> > +    } else {
> > +        *src =3D rvalue_extend(c, locp, src);
> > +    }
>
> Why is this needed?
>
> > +    assert(ea->type =3D=3D VARID);
> > +    int var_id =3D find_variable(c, locp, ea);
> > +    yyassert(c, locp, var_id !=3D -1, "Load variable must exist!\n");
> > +    /* We need to enforce the variable size */
> > +    ea->bit_width =3D g_array_index(c->inst.allocated, Var,
> var_id).bit_width;
> > +    if (ea->bit_width !=3D 32) {
> > +        *ea =3D rvalue_truncate(c, locp, ea);
> > +    }
>
> How can ea be not 32 bits?
>
> > +    *src =3D rvalue_materialize(c, locp, src);
> > +    OUT(c, locp, "gen_store", &mem_width, "(cpu_env, ", ea, ", ", src)=
;
> > +    OUT(c, locp, ", ctx, insn->slot);\n");
> > +    rvalue_free(c, locp, src);
> > +    /* If the var in ea was truncated it is now a tmp HexValue, so fre=
e
> it. */
> > +    rvalue_free(c, locp, ea);
> > +}
> > +
>
>
> > +void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo=
,
> > +                 HexValue *dst, HexValue *val)
> > +{
> > +    yyassert(c, locp, hi->type =3D=3D IMMEDIATE &&
> > +             hi->imm.type =3D=3D VALUE &&
> > +             lo->type =3D=3D IMMEDIATE &&
> > +             lo->imm.type =3D=3D VALUE,
> > +             "Range deposit needs immediate values!\n");
> > +
> > +    *val =3D rvalue_truncate(c, locp, val);
> > +    unsigned len =3D hi->imm.value + 1 - lo->imm.value;
> > +    HexValue tmp =3D gen_tmp(c, locp, 32);
> > +    OUT(c, locp, "tcg_gen_neg_i32(", &tmp, ", ", val, ");\n");
> > +    OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst, ", ", &tmp, "=
,
> ");
> > +    OUT(c, locp, lo, ", ", &len, ");\n");
>
>
> This doesn't match the C semantics of fSETBITS
>
> #define fSETBIT(N, DST, VAL) \
>     do { \
>         DST =3D (DST & ~(1ULL << (N))) | (((uint64_t)(VAL)) << (N)); \
>     } while (0)
>
> #define fGETBIT(N, SRC) (((SRC) >> N) & 1)
> #define fSETBITS(HI, LO, DST, VAL) \
>     do { \
>         int j; \
>         for (j =3D LO; j <=3D HI; j++) { \
>             fSETBIT(j, DST, VAL); \
>         } \
>     } while (0)
>
> You need to put len copies of LSB(val), so emit something like this
>     TCGv zero =3D tcg_const_tl(0);
>     TCGv ones =3D tcg_const_tl(~0);
>     tcg_gen_andi_tl(tmp, val, 1);
>     tcg_gen_movcond_tl(TCG_COND_NE, tmp, tmp, zero, ones, zero);
>     tcg_gen_deposit_tl(dst, dst, tmp, lo, len);
>     tcg_temp_free(zero);
>     tcg_temp_free(ones);
>
>
>
> > +HexValue gen_rvalue_pow(Context *c, YYLTYPE *locp, HexValue *l,
> > HexValue *r)
>
> Which instruction calls this?  I don't think there is one.  If not, remov=
e
> the POW token from the lexer and the associated rules from the parser.
>
>
>
> > +HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *v)
> > +{
> > +    const char *bit_suffix =3D (v->bit_width =3D=3D 64) ? "i64" : "i32=
";
> > +    int bit_width =3D (v->bit_width =3D=3D 64) ? 64 : 32;
> > +    HexValue res;
> > +    res.is_unsigned =3D v->is_unsigned;
> > +    res.is_dotnew =3D false;
> > +    res.is_manual =3D false;
> > +    if (v->type =3D=3D IMMEDIATE) {
> > +        res.type =3D IMMEDIATE;
> > +        res.imm.type =3D QEMU_TMP;
> > +        res.imm.index =3D c->inst.qemu_tmp_count;
> > +        OUT(c, locp, "int", &bit_width, "_t ", &res, " =3D abs(", v,
> ");\n");
> > +        c->inst.qemu_tmp_count++;
> > +    } else {
> > +        res =3D gen_tmp(c, locp, bit_width);
> > +        HexValue zero =3D gen_tmp_value(c, locp, "0", bit_width);
> > +        OUT(c, locp, "tcg_gen_neg_", bit_suffix, "(", &res, ", ", v,
> ");\n");
> > +        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
> > +        OUT(c, locp, "(TCG_COND_GT, ", &res, ", ", v, ", ", &zero);
>
> tcg_gen_abs_i<bit_width>
>
> > +        OUT(c, locp, ", ", v, ", ", &res, ");\n");
> > +        rvalue_free(c, locp, &zero);
> > +        rvalue_free(c, locp, v);
> > +    }
> > +    return res;
> > +}
> > +
> > +HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *v)
> > +{
> > +    yyassert(c, locp, v->bit_width <=3D 32,
> > +             "fbrev not implemented for 64-bit integers!");
> > +    HexValue res =3D gen_tmp(c, locp, v->bit_width);
> > +    *v =3D rvalue_materialize(c, locp, v);
> > +    OUT(c, locp, "gen_fbrev(", &res, ", ", v, ");\n");
>
> gen_helper_fbrev
>
>
>
> > diff --git a/target/hexagon/idef-parser/parser-helpers.h
> > b/target/hexagon/idef-parser/parser-helpers.h
> > new file mode 100644
>
> > +#define OUT(c, locp, ...) FOR_EACH((c), (locp), OUT_IMPL, __VA_ARGS__)
>
> You should be able to handle indenting here.  Unfortunately, many of the =
C
> statements generated use multiple OUT invocations.
> Create two macros
>         OUT                     prints indentation, then the text
>      used for beginning a line of output
>               OUT_CONTINUE      just print the text
>      used for continuing a line
>
> > diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> > index 329219463f..a2257d41a5 100644
> > --- a/target/hexagon/meson.build
> > +++ b/target/hexagon/meson.build
> > @@ -183,7 +183,7 @@ idef_parser_input_generated =3D custom_target(
> >      command: [python, files('gen_idef_parser_funcs.py'),
> > semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
> >  )
> >
> > -idef_parser_input_generated_prep =3D custom_target(
> > +preprocessed_idef_parser_input_generated =3D custom_target(
>
> Don't change the name of this here, use the name you want in the patch
> where it was introduced.
>
>
>
>
> ------------------------------
>
> Message: 2
> Date: Wed, 23 Jun 2021 21:10:39 -0700
> From: Vivek Kasireddy <vivek.kasireddy@intel.com>
> To: qemu-devel@nongnu.org
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann
>         <kraxel@redhat.com>, Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@redhat.com>,
>         Dongwon Kim <dongwon.kim@intel.com>, Tina Zhang <
> tina.zhang@intel.com>
> Subject: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
> Message-ID: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
> Content-Type: text/plain; charset=3DUTF-8
>
> Why does Qemu need a new Wayland UI backend?
> The main reason why there needs to be a plain and simple Wayland backend
> for Qemu UI is to eliminate the Blit (aka GPU copy) that happens if using
> a toolkit like GTK or SDL (because they use EGL). The Blit can be
> eliminated
> by sharing the dmabuf fd -- associated with the Guest scanout buffer --
> directly with the Host compositor via the linux-dmabuf (unstable) protoco=
l.
> Once properly integrated, it would be potentially possible to have the
> scanout buffer created by the Guest compositor be placed directly on a
> hardware plane on the Host thereby improving performance. Only Guest
> compositors that use multiple back buffers (at-least 1 front and 1 back)
> and virtio-gpu would benefit from this work.
>
> The patch(es) are still WIP and the only reason why I am sending them now
> is to get feedback and see if anyone thinks this work is interesting. And=
,
> even after this work is complete, it is not meant to be merged and can be
> used for performance testing purposes. Given Qemu UI's new direction, the
> proper way to add new backends is to create a separate UI/display module
> that is part of the dbus/pipewire infrastructure that Marc-Andre is
> working on:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg04331.html
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Tina Zhang <tina.zhang@intel.com>
>
> Vivek Kasireddy (1):
>   ui: Add a plain Wayland backend for Qemu UI
>
>  configure         |  17 ++
>  meson.build       |  25 +++
>  meson_options.txt |   2 +
>  qapi/ui.json      |  19 ++-
>  ui/meson.build    |  52 ++++++
>  ui/wayland.c      | 402 ++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 516 insertions(+), 1 deletion(-)
>  create mode 100644 ui/wayland.c
>
> --
> 2.30.2
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Wed, 23 Jun 2021 21:10:40 -0700
> From: Vivek Kasireddy <vivek.kasireddy@intel.com>
> To: qemu-devel@nongnu.org
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann
>         <kraxel@redhat.com>
> Subject: [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI
> Message-ID: <20210624041040.1250631-2-vivek.kasireddy@intel.com>
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  configure         |  17 ++
>  meson.build       |  25 +++
>  meson_options.txt |   2 +
>  qapi/ui.json      |  19 ++-
>  ui/meson.build    |  52 ++++++
>  ui/wayland.c      | 402 ++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 516 insertions(+), 1 deletion(-)
>  create mode 100644 ui/wayland.c
>
> diff --git a/configure b/configure
> index 8dcb9965b2..f6caaa6329 100755
> --- a/configure
> +++ b/configure
> @@ -403,6 +403,7 @@ cfi_debug=3D"false"
>  seccomp=3D"auto"
>  glusterfs=3D"auto"
>  gtk=3D"auto"
> +wayland=3D"auto"
>  tls_priority=3D"NORMAL"
>  gnutls=3D"$default_feature"
>  nettle=3D"$default_feature"
> @@ -1372,6 +1373,10 @@ for opt do
>    ;;
>    --enable-gtk) gtk=3D"enabled"
>    ;;
> +  --disable-wayland) wayland=3D"disabled"
> +  ;;
> +  --enable-wayland) wayland=3D"enabled"
> +  ;;
>    --tls-priority=3D*) tls_priority=3D"$optarg"
>    ;;
>    --disable-gnutls) gnutls=3D"no"
> @@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is enabled
> if available
>    sdl             SDL UI
>    sdl-image       SDL Image support for icons
>    gtk             gtk UI
> +  wayland         Wayland UI
>    vte             vte support for the gtk UI
>    curses          curses UI
>    iconv           font glyph conversion support
> @@ -3616,6 +3622,11 @@ if $pkg_config gbm; then
>      gbm=3D"yes"
>  fi
>
> +if $pkg_config wayland-client; then
> +    wayland_cflags=3D"$($pkg_config --cflags wayland-client)"
> +    wayland_libs=3D"$($pkg_config --libs wayland-client)"
> +fi
> +
>  if test "$opengl" !=3D "no" ; then
>    epoxy=3Dno
>    if $pkg_config epoxy; then
> @@ -5870,6 +5881,11 @@ if test "$gbm" =3D "yes" ; then
>      echo "GBM_CFLAGS=3D$gbm_cflags" >> $config_host_mak
>  fi
>
> +if test "$wayland" =3D "enabled" ; then
> +    echo "CONFIG_WAYLAND=3Dy" >> $config_host_mak
> +    echo "WAYLAND_LIBS=3D$wayland_libs" >> $config_host_mak
> +    echo "WAYLAND_CFLAGS=3D$wayland_cflags" >> $config_host_mak
> +fi
>
>  if test "$avx2_opt" =3D "yes" ; then
>    echo "CONFIG_AVX2_OPT=3Dy" >> $config_host_mak
> @@ -6436,6 +6452,7 @@ if test "$skip_meson" =3D no; then
>          -Dkvm=3D$kvm -Dhax=3D$hax -Dwhpx=3D$whpx -Dhvf=3D$hvf -Dnvmm=3D$=
nvmm \
>          -Dxen=3D$xen -Dxen_pci_passthrough=3D$xen_pci_passthrough -Dtcg=
=3D$tcg \
>          -Dcocoa=3D$cocoa -Dgtk=3D$gtk -Dmpath=3D$mpath -Dsdl=3D$sdl
> -Dsdl_image=3D$sdl_image \
> +        -Dwayland=3D$wayland \
>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
> -Dvnc_png=3D$vnc_png \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
> diff --git a/meson.build b/meson.build
> index 626cf932c1..dbafe4a5d4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -855,6 +855,29 @@ if gtkx11.found()
>    x11 =3D dependency('x11', method: 'pkg-config', required: gtkx11.found=
(),
>                     kwargs: static_kwargs)
>  endif
> +
> +wayland =3D not_found
> +if not get_option('wayland').auto()
> +  wlclientdep =3D dependency('wayland-client', version: '>=3D 1.18.90',
> +                           method: 'pkg-config',
> +                           required: get_option('wayland'),
> +                           kwargs: static_kwargs)
> +  wlprotocolsdep =3D dependency('wayland-protocols', version: '>=3D 1.14=
.91',
> +                              method: 'pkg-config',
> +                              required: get_option('wayland'),
> +                              kwargs: static_kwargs)
> +
> +  if not wlprotocolsdep.found()
> +    wlproto_dir =3D
> subproject('wayland-protocols').get_variable('wayland_protocols_srcdir')
> +  else
> +    wlproto_dir =3D wlprotocolsdep.get_pkgconfig_variable('pkgdatadir')
> +  endif
> +
> +  wayland =3D declare_dependency(dependencies: [wlclientdep,
> wlprotocolsdep],
> +                               compile_args:
> config_host['WAYLAND_CFLAGS'].split(),
> +                               link_args:
> config_host['WAYLAND_LIBS'].split())
> +endif
> +
>  vnc =3D not_found
>  png =3D not_found
>  jpeg =3D not_found
> @@ -1146,6 +1169,7 @@ if glusterfs.found()
>    config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
>  endif
>  config_host_data.set('CONFIG_GTK', gtk.found())
> +config_host_data.set('CONFIG_WAYLAND', wayland.found())
>  config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
>  config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>  config_host_data.set('CONFIG_EBPF', libbpf.found())
> @@ -2695,6 +2719,7 @@ summary_info +=3D {'SDL support':       sdl.found()=
}
>  summary_info +=3D {'SDL image support': sdl_image.found()}
>  # TODO: add back version
>  summary_info +=3D {'GTK support':       gtk.found()}
> +summary_info +=3D {'Wayland support':   wayland.found()}
>  summary_info +=3D {'pixman':            pixman.found()}
>  # TODO: add back version
>  summary_info +=3D {'VTE support':       config_host.has_key('CONFIG_VTE'=
)}
> diff --git a/meson_options.txt b/meson_options.txt
> index 3d304cac96..86066c63c9 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -86,6 +86,8 @@ option('rbd', type : 'feature', value : 'auto',
>         description: 'Ceph block device driver')
>  option('gtk', type : 'feature', value : 'auto',
>         description: 'GTK+ user interface')
> +option('wayland', type : 'feature', value : 'auto',
> +       description: 'Wayland user interface')
>  option('sdl', type : 'feature', value : 'auto',
>         description: 'SDL user interface')
>  option('sdl_image', type : 'feature', value : 'auto',
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..55e5967889 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1057,6 +1057,20 @@
>  { 'struct'  : 'DisplayEGLHeadless',
>    'data'    : { '*rendernode' : 'str' } }
>
> +##
> +# @DisplayWayland:
> +#
> +# Wayland display options.
> +#
> +# @rendernode: Which DRM render node should be used. Default is the firs=
t
> +#              available node on the host.
> +#
> +# Since: 3.1
> +#
> +##
> +{ 'struct'  : 'DisplayWayland',
> +  'data'    : { '*rendernode' : 'str' } }
> +
>   ##
>   # @DisplayGLMode:
>   #
> @@ -1108,6 +1122,8 @@
>  #                DRI device. Graphical display need to be paired with
>  #                VNC or Spice. (Since 3.1)
>  #
> +# @wayland: The Wayland user interface.
> +#
>  # @curses: Display video output via curses.  For graphics device
>  #          models which support a text mode, QEMU can display this
>  #          output using a curses/ncurses interface. Nothing is
> @@ -1128,7 +1144,7 @@
>  { 'enum'    : 'DisplayType',
>    'data'    : [ 'default', 'none', 'gtk', 'sdl',
>                  'egl-headless', 'curses', 'cocoa',
> -                'spice-app'] }
> +                'wayland', 'spice-app'] }
>
>  ##
>  # @DisplayOptions:
> @@ -1154,6 +1170,7 @@
>    'discriminator' : 'type',
>    'data'    : { 'gtk'            : 'DisplayGTK',
>                  'curses'         : 'DisplayCurses',
> +                'wayland'        : 'DisplayWayland',
>                  'egl-headless'   : 'DisplayEGLHeadless'} }
>
>  ##
> diff --git a/ui/meson.build b/ui/meson.build
> index a3a187d633..fe255aec04 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -62,6 +62,58 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found(=
)
>    ui_modules +=3D {'egl-headless' : egl_headless_ss}
>  endif
>
> +wayland_scanner =3D find_program('wayland-scanner')
> +proto_sources =3D [
> +  ['xdg-shell', 'stable', ],
> +  ['fullscreen-shell', 'unstable', 'v1', ],
> +  ['linux-dmabuf', 'unstable', 'v1', ],
> +]
> +wayland_headers =3D []
> +wayland_proto_sources =3D []
> +
> +if wayland.found()
> +  foreach p: proto_sources
> +    proto_name =3D p.get(0)
> +    proto_stability =3D p.get(1)
> +
> +    if proto_stability =3D=3D 'stable'
> +      output_base =3D proto_name
> +      input =3D files(join_paths(wlproto_dir, '@0@/@1@/@2@.xml'.format(p=
roto_stability,
> proto_name, output_base)))
> +    else
> +      proto_version =3D p.get(2)
> +      output_base =3D '@0@-@1@-@2@'.format(proto_name, proto_stability,
> proto_version)
> +      input =3D files(join_paths(wlproto_dir, '@0@/@1@/@2@.xml'.format(p=
roto_stability,
> proto_name, output_base)))
> +    endif
> +
> +    wayland_headers +=3D custom_target('@0@ client
> header'.format(output_base),
> +      input: input,
> +      output: '@0@-client-protocol.h'.format(output_base),
> +      command: [
> +        wayland_scanner,
> +        'client-header',
> +        '@INPUT@', '@OUTPUT@',
> +      ], build_by_default: true
> +    )
> +
> +    wayland_proto_sources +=3D custom_target('@0@
> source'.format(output_base),
> +      input: input,
> +      output: '@0@-protocol.c'.format(output_base),
> +      command: [
> +        wayland_scanner,
> +        'private-code',
> +        '@INPUT@', '@OUTPUT@',
> +      ], build_by_default: true
> +    )
> +  endforeach
> +endif
> +
> +if wayland.found()
> +  wayland_ss =3D ss.source_set()
> +  wayland_ss.add(when: wayland, if_true: files('wayland.c',
> 'xdg-shell-protocol.c',
> 'fullscreen-shell-unstable-v1-protocol.c','linux-dmabuf-unstable-v1-proto=
col.c'))
> +  #wayland_ss.add(when: wayland, if_true: files('wayland.c'),
> [wayland_proto_sources])
> +  ui_modules +=3D {'wayland' : wayland_ss}
> +endif
> +
>  if gtk.found()
>    softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'=
))
>
> diff --git a/ui/wayland.c b/ui/wayland.c
> new file mode 100644
> index 0000000000..351d7e1146
> --- /dev/null
> +++ b/ui/wayland.c
> @@ -0,0 +1,402 @@
> +/*
> + * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland
> compositors
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + * Mostly (boilerplate) based on
> cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf-egl.c
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qemu/main-loop.h"
> +#include "sysemu/sysemu.h"
> +#include "ui/console.h"
> +#include <wayland-client.h>
> +#include "xdg-shell-client-protocol.h"
> +#include "fullscreen-shell-unstable-v1-client-protocol.h"
> +#include "linux-dmabuf-unstable-v1-client-protocol.h"
> +
> +#define MAX_BUFFERS 3
> +
> +typedef struct wayland_display {
> +    struct wl_display *display;
> +    struct wl_registry *registry;
> +    struct wl_compositor *compositor;
> +    struct xdg_wm_base *wm_base;
> +    struct zwp_fullscreen_shell_v1 *fshell;
> +    struct zwp_linux_dmabuf_v1 *dmabuf;
> +} wayland_display;
> +
> +typedef struct wayland_buffer {
> +    QemuConsole *con;
> +    QemuDmaBuf *dmabuf;
> +    struct wl_buffer *buffer;
> +    bool busy;
> +} wayland_buffer;
> +
> +typedef struct wayland_window {
> +    wayland_display *display;
> +    DisplayChangeListener dcl;
> +    struct wl_surface *surface;
> +    struct xdg_surface *xdg_surface;
> +    struct xdg_toplevel *xdg_toplevel;
> +    struct wl_callback *callback;
> +    wayland_buffer buffers[MAX_BUFFERS];
> +    wayland_buffer *new_buffer;
> +    bool redraw;
> +} wayland_window;
> +
> +static const struct wl_callback_listener frame_listener;
> +
> +static void
> +xdg_surface_handle_configure(void *data, struct xdg_surface *surface,
> +                            uint32_t serial)
> +{
> +    xdg_surface_ack_configure(surface, serial);
> +}
> +
> +static const struct xdg_surface_listener xdg_surface_listener =3D {
> +    xdg_surface_handle_configure,
> +};
> +
> +static void
> +xdg_toplevel_handle_configure(void *data, struct xdg_toplevel *toplevel,
> +                             int32_t width, int32_t height,
> +                             struct wl_array *states)
> +{
> +}
> +
> +static void
> +xdg_toplevel_handle_close(void *data, struct xdg_toplevel *xdg_toplevel)
> +{
> +}
> +
> +static const struct xdg_toplevel_listener xdg_toplevel_listener =3D {
> +    xdg_toplevel_handle_configure,
> +    xdg_toplevel_handle_close,
> +};
> +
> +static void wayland_refresh(DisplayChangeListener *dcl)
> +{
> +    graphic_hw_update(dcl->con);
> +}
> +
> +static QEMUGLContext wayland_create_context(DisplayChangeListener *dcl,
> +                                            QEMUGLParams *params)
> +{
> +    return NULL;
> +}
> +
> +static void wayland_destroy_context(DisplayChangeListener *dcl,
> +                                    QEMUGLContext ctx)
> +{
> +}
> +
> +static int wayland_make_context_current(DisplayChangeListener *dcl,
> +                                        QEMUGLContext ctx)
> +{
> +    return 0;
> +}
> +
> +static void wayland_scanout_disable(DisplayChangeListener *dcl)
> +{
> +}
> +
> +static void wayland_scanout_texture(DisplayChangeListener *dcl,
> +                                    uint32_t backing_id,
> +                                    bool backing_y_0_top,
> +                                    uint32_t backing_width,
> +                                    uint32_t backing_height,
> +                                    uint32_t x, uint32_t y,
> +                                    uint32_t w, uint32_t h)
> +{
> +}
> +
> +static void wayland_release_dmabuf(DisplayChangeListener *dcl,
> +                                   QemuDmaBuf *dmabuf)
> +{
> +}
> +
> +static void wayland_dispatch_handler(void *opaque)
> +{
> +    wayland_display *wldpy =3D opaque;
> +
> +    wl_display_prepare_read(wldpy->display);
> +    wl_display_read_events(wldpy->display);
> +    wl_display_dispatch_pending(wldpy->display);
> +    wl_display_flush(wldpy->display);
> +}
> +
> +static void wayland_window_redraw(void *data, struct wl_callback
> *callback,
> +                                  uint32_t time)
> +{
> +    wayland_window *window =3D data;
> +    QemuDmaBuf *dmabuf =3D window->new_buffer->dmabuf;
> +
> +    if (callback) {
> +        wl_callback_destroy(callback);
> +        window->callback =3D NULL;
> +    }
> +    if (!window->redraw) {
> +        return;
> +    }
> +    window->callback =3D wl_surface_frame(window->surface);
> +    wl_callback_add_listener(window->callback, &frame_listener, window);
> +
> +    wl_surface_attach(window->surface, window->new_buffer->buffer, 0, 0)=
;
> +    wl_surface_damage(window->surface, 0, 0, dmabuf->width,
> dmabuf->height);
> +    wl_surface_commit(window->surface);
> +    wl_display_flush(window->display->display);
> +    window->redraw =3D false;
> +}
> +
> +static const struct wl_callback_listener frame_listener =3D {
> +    wayland_window_redraw
> +};
> +
> +static void buffer_release(void *data, struct wl_buffer *buf)
> +{
> +    wayland_buffer *buffer =3D data;
> +    QemuDmaBuf *dmabuf =3D buffer->dmabuf;
> +
> +    dmabuf->fence_fd =3D -1;
> +    graphic_hw_gl_block(buffer->con, false);
> +    graphic_hw_gl_flushed(buffer->con);
> +    buffer->busy =3D false;
> +    wl_buffer_destroy(buf);
> +}
> +
> +static const struct wl_buffer_listener buffer_listener =3D {
> +    buffer_release
> +};
> +
> +static wayland_buffer *window_next_buffer(wayland_window *window)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < MAX_BUFFERS; i++) {
> +        if (!window->buffers[i].busy) {
> +            return &window->buffers[i];
> +        }
> +    }
> +    return NULL;
> +}
> +
> +static void wayland_scanout_dmabuf(DisplayChangeListener *dcl,
> +                                   QemuDmaBuf *dmabuf)
> +{
> +    wayland_window *window =3D container_of(dcl, wayland_window, dcl);
> +    wayland_display *display =3D window->display;
> +    wayland_buffer *buffer =3D window_next_buffer(window);
> +    struct zwp_linux_buffer_params_v1 *params;
> +
> +    if (!buffer) {
> +       error_report("Can't find free buffer\n");
> +        exit(1);
> +    }
> +    params =3D zwp_linux_dmabuf_v1_create_params(display->dmabuf);
> +    zwp_linux_buffer_params_v1_add(params, dmabuf->fd, 0, 0,
> dmabuf->stride,
> +                                   0, 0);
> +    buffer->buffer =3D zwp_linux_buffer_params_v1_create_immed(params,
> +
>  dmabuf->width,
> +
>  dmabuf->height,
> +
>  dmabuf->fourcc,
> +                                                             0);
> +    zwp_linux_buffer_params_v1_destroy(params);
> +    buffer->dmabuf =3D dmabuf;
> +    buffer->con =3D window->dcl.con;
> +    window->new_buffer =3D buffer;
> +    dmabuf->fence_fd =3D 1;
> +    wl_buffer_add_listener(buffer->buffer, &buffer_listener, buffer);
> +}
> +
> +static void wayland_scanout_flush(DisplayChangeListener *dcl,
> +                                  uint32_t x, uint32_t y,
> +                                  uint32_t w, uint32_t h)
> +{
> +    wayland_window *window =3D container_of(dcl, wayland_window, dcl);
> +    static bool first =3D true;
> +
> +    if (!window->new_buffer->busy && !first) {
> +        graphic_hw_gl_block(window->new_buffer->con, true);
> +    }
> +
> +    window->redraw =3D true;
> +    if (first || !window->callback) {
> +        wayland_window_redraw(window, NULL, 0);
> +    }
> +    window->new_buffer->busy =3D true;
> +    first =3D false;
> +}
> +
> +static const DisplayChangeListenerOps wayland_ops =3D {
> +    .dpy_name                =3D "wayland",
> +    .dpy_refresh             =3D wayland_refresh,
> +
> +    .dpy_gl_ctx_create       =3D wayland_create_context,
> +    .dpy_gl_ctx_destroy      =3D wayland_destroy_context,
> +    .dpy_gl_ctx_make_current =3D wayland_make_context_current,
> +
> +    .dpy_gl_scanout_disable  =3D wayland_scanout_disable,
> +    .dpy_gl_scanout_texture  =3D wayland_scanout_texture,
> +    .dpy_gl_scanout_dmabuf   =3D wayland_scanout_dmabuf,
> +    .dpy_gl_release_dmabuf   =3D wayland_release_dmabuf,
> +    .dpy_gl_update           =3D wayland_scanout_flush,
> +};
> +
> +static void early_wayland_init(DisplayOptions *opts)
> +{
> +    display_opengl =3D 1;
> +}
> +
> +static void
> +dmabuf_modifier(void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf=
,
> +                uint32_t format, uint32_t modifier_hi, uint32_t
> modifier_lo)
> +{
> +}
> +
> +static void
> +dmabuf_format(void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,
> +              uint32_t format)
> +{
> +}
> +
> +static const struct zwp_linux_dmabuf_v1_listener dmabuf_listener =3D {
> +    dmabuf_format,
> +    dmabuf_modifier
> +};
> +
> +static void
> +xdg_wm_base_ping(void *data, struct xdg_wm_base *shell, uint32_t serial)
> +{
> +    xdg_wm_base_pong(shell, serial);
> +}
> +
> +static const struct xdg_wm_base_listener wm_base_listener =3D {
> +    xdg_wm_base_ping,
> +};
> +
> +static void
> +registry_handle_global(void *data, struct wl_registry *registry,
> +                       uint32_t id, const char *interface, uint32_t
> version)
> +{
> +    wayland_display *d =3D data;
> +
> +    if (strcmp(interface, "wl_compositor") =3D=3D 0) {
> +        d->compositor =3D wl_registry_bind(registry,
> +                                        id, &wl_compositor_interface, 1)=
;
> +    } else if (strcmp(interface, "xdg_wm_base") =3D=3D 0) {
> +       d->wm_base =3D wl_registry_bind(registry,
> +                                     id, &xdg_wm_base_interface, 1);
> +       xdg_wm_base_add_listener(d->wm_base, &wm_base_listener, d);
> +    } else if (strcmp(interface, "zwp_fullscreen_shell_v1") =3D=3D 0) {
> +       d->fshell =3D wl_registry_bind(registry,
> +                                    id,
> &zwp_fullscreen_shell_v1_interface,
> +                                    1);
> +    } else if (strcmp(interface, "zwp_linux_dmabuf_v1") =3D=3D 0) {
> +       d->dmabuf =3D wl_registry_bind(registry,
> +                                    id, &zwp_linux_dmabuf_v1_interface,
> 3);
> +       zwp_linux_dmabuf_v1_add_listener(d->dmabuf, &dmabuf_listener,
> +                                        d);
> +    }
> +}
> +
> +static void
> +registry_handle_global_remove(void *data, struct wl_registry *registry,
> +                              uint32_t name)
> +{
> +}
> +
> +static const struct wl_registry_listener registry_listener =3D {
> +    registry_handle_global,
> +    registry_handle_global_remove
> +};
> +
> +static wayland_display *create_display(void)
> +{
> +    wayland_display *display;
> +
> +    display =3D g_new0(wayland_display, 1);
> +    display->display =3D wl_display_connect(NULL);
> +    assert(display->display);
> +
> +    display->registry =3D wl_display_get_registry(display->display);
> +    wl_registry_add_listener(display->registry,
> +                             &registry_listener, display);
> +    wl_display_roundtrip(display->display);
> +    if (display->dmabuf =3D=3D NULL) {
> +       error_report("No zwp_linux_dmabuf global\n");
> +       exit(1);
> +    }
> +    return display;
> +}
> +
> +static wayland_window *create_window(wayland_display *display)
> +{
> +    wayland_window *window;
> +
> +    window =3D g_new0(wayland_window, 1);
> +    window->display =3D display;
> +    window->surface =3D wl_compositor_create_surface(display->compositor=
);
> +
> +    if (display->wm_base) {
> +        window->xdg_surface =3D
> xdg_wm_base_get_xdg_surface(display->wm_base,
> +                                                         window->surface=
);
> +        assert(window->xdg_surface);
> +        xdg_surface_add_listener(window->xdg_surface,
> +                                 &xdg_surface_listener, window);
> +        window->xdg_toplevel =3D
> xdg_surface_get_toplevel(window->xdg_surface);
> +        assert(window->xdg_toplevel);
> +        xdg_toplevel_add_listener(window->xdg_toplevel,
> +                                  &xdg_toplevel_listener, window);
> +        xdg_toplevel_set_title(window->xdg_toplevel, "qemu-wayland");
> +        wl_surface_commit(window->surface);
> +    } else if (display->fshell) {
> +        zwp_fullscreen_shell_v1_present_surface(display->fshell,
> +                                               window->surface,
> +
>  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,
> +                                               NULL);
> +    } else {
> +         assert(0);
> +    }
> +
> +    return window;
> +}
> +
> +static void wayland_init(DisplayState *ds, DisplayOptions *opts)
> +{
> +    QemuConsole *con;
> +    wayland_display *wldpy;
> +    wayland_window *wlwdw;
> +    int idx;
> +
> +    wldpy =3D create_display();
> +    for (idx =3D 0;; idx++) {
> +        con =3D qemu_console_lookup_by_index(idx);
> +        if (!con || !qemu_console_is_graphic(con)) {
> +            break;
> +        }
> +
> +        wlwdw =3D create_window(wldpy);
> +        wlwdw->dcl.con =3D con;
> +        wlwdw->dcl.ops =3D &wayland_ops;
> +        register_displaychangelistener(&wlwdw->dcl);
> +    }
> +    wl_display_roundtrip(wldpy->display);
> +    qemu_set_fd_handler(wl_display_get_fd(wldpy->display),
> +                        wayland_dispatch_handler, NULL, wldpy);
> +}
> +
> +static QemuDisplay qemu_display_wayland =3D {
> +    .type       =3D DISPLAY_TYPE_WAYLAND,
> +    .early_init =3D early_wayland_init,
> +    .init       =3D wayland_init,
> +};
> +
> +static void register_wayland(void)
> +{
> +    qemu_display_register(&qemu_display_wayland);
> +}
> +
> +type_init(register_wayland);
> --
> 2.30.2
>
>
>
>
> ------------------------------
>
> Message: 4
> Date: Wed, 23 Jun 2021 21:30:46 -0700 (PDT)
> From: no-reply@patchew.org
> To: vivek.kasireddy@intel.com
> Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
>         dongwon.kim@intel.com, tina.zhang@intel.com,
>         vivek.kasireddy@intel.com, kraxel@redhat.com
> Subject: Re: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
> Message-ID: <162450904493.16025.10486341594793128250@7c66fb7bc3ab>
> Content-Type: text/plain; charset=3D"utf-8"
>
> Patchew URL:
> https://patchew.org/QEMU/20210624041040.1250631-1-vivek.kasireddy@intel.c=
om/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below fo=
r
> more information:
>
> Type: series
> Message-id: 20210624041040.1250631-1-vivek.kasireddy@intel.com
> Subject: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
>
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/
> 20210624041040.1250631-1-vivek.kasireddy@intel.com -> patchew/
> 20210624041040.1250631-1-vivek.kasireddy@intel.com
> Switched to a new branch 'test'
> 547ce45 ui: Add a plain Wayland backend for Qemu UI
>
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #260:
> new file mode 100644
>
> WARNING: line over 80 characters
> #266: FILE: ui/wayland.c:2:
> + * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland
> compositors
>
> ERROR: use QEMU instead of Qemu or QEmu
> #266: FILE: ui/wayland.c:2:
> + * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland
> compositors
>
> ERROR: line over 90 characters
> #271: FILE: ui/wayland.c:7:
> + * Mostly (boilerplate) based on
> cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf-egl.c
>
> ERROR: code indent should never use tabs
> #318: FILE: ui/wayland.c:54:
> +^I^I^I     uint32_t serial)$
>
> ERROR: code indent should never use tabs
> #329: FILE: ui/wayland.c:65:
> +^I^I^I      int32_t width, int32_t height,$
>
> ERROR: code indent should never use tabs
> #330: FILE: ui/wayland.c:66:
> +^I^I^I      struct wl_array *states)$
>
> ERROR: code indent should never use tabs
> #459: FILE: ui/wayland.c:195:
> +^Ierror_report("Can't find free buffer\n");$
>
> ERROR: Error messages should not contain newlines
> #459: FILE: ui/wayland.c:195:
> +       error_report("Can't find free buffer\n");
>
> ERROR: code indent should never use tabs
> #519: FILE: ui/wayland.c:255:
> +^I^I uint32_t format, uint32_t modifier_hi, uint32_t modifier_lo)$
>
> ERROR: code indent should never use tabs
> #552: FILE: ui/wayland.c:288:
> +^I^I^I                 id, &wl_compositor_interface, 1);$
>
> ERROR: code indent should never use tabs
> #554: FILE: ui/wayland.c:290:
> +^Id->wm_base =3D wl_registry_bind(registry,$
>
> ERROR: code indent should never use tabs
> #555: FILE: ui/wayland.c:291:
> +^I^I^I^I      id, &xdg_wm_base_interface, 1);$
>
> ERROR: code indent should never use tabs
> #556: FILE: ui/wayland.c:292:
> +^Ixdg_wm_base_add_listener(d->wm_base, &wm_base_listener, d);$
>
> ERROR: code indent should never use tabs
> #558: FILE: ui/wayland.c:294:
> +^Id->fshell =3D wl_registry_bind(registry,$
>
> ERROR: code indent should never use tabs
> #559: FILE: ui/wayland.c:295:
> +^I                             id, &zwp_fullscreen_shell_v1_interface,$
>
> ERROR: code indent should never use tabs
> #560: FILE: ui/wayland.c:296:
> +^I                             1);$
>
> ERROR: code indent should never use tabs
> #562: FILE: ui/wayland.c:298:
> +^Id->dmabuf =3D wl_registry_bind(registry,$
>
> ERROR: code indent should never use tabs
> #563: FILE: ui/wayland.c:299:
> +^I                             id, &zwp_linux_dmabuf_v1_interface, 3);$
>
> ERROR: code indent should never use tabs
> #564: FILE: ui/wayland.c:300:
> +^Izwp_linux_dmabuf_v1_add_listener(d->dmabuf, &dmabuf_listener,$
>
> ERROR: code indent should never use tabs
> #565: FILE: ui/wayland.c:301:
> +^I                                 d);$
>
> ERROR: code indent should never use tabs
> #593: FILE: ui/wayland.c:329:
> +^Ierror_report("No zwp_linux_dmabuf global\n");$
>
> ERROR: Error messages should not contain newlines
> #593: FILE: ui/wayland.c:329:
> +       error_report("No zwp_linux_dmabuf global\n");
>
> ERROR: code indent should never use tabs
> #594: FILE: ui/wayland.c:330:
> +^Iexit(1);$
>
> ERROR: code indent should never use tabs
> #609: FILE: ui/wayland.c:345:
> +^I                                                  window->surface);$
>
> ERROR: code indent should never use tabs
> #621: FILE: ui/wayland.c:357:
> +^I                                        window->surface,$
>
> ERROR: line over 90 characters
> #622: FILE: ui/wayland.c:358:
> +
>  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,
>
> ERROR: code indent should never use tabs
> #622: FILE: ui/wayland.c:358:
> +^I^I
> ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,$
>
> ERROR: code indent should never use tabs
> #623: FILE: ui/wayland.c:359:
> +^I^I                                NULL);$
>
> total: 27 errors, 2 warnings, 607 lines checked
>
> Commit 547ce45b800d (ui: Add a plain Wayland backend for Qemu UI) has
> style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> =3D=3D=3D OUTPUT END =3D=3D=3D
>
> Test command exited with code: 1
>
>
> The full log is available at
>
> http://patchew.org/logs/20210624041040.1250631-1-vivek.kasireddy@intel.co=
m/testing.checkpatch/?type=3Dmessage
> .
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
>
> ------------------------------
>
> Message: 5
> Date: Thu, 24 Jun 2021 13:29:32 +1000
> From: David Gibson <david@gibson.dropbear.id.au>
> To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
> Cc: qemu-devel@nongnu.org, clg@kaod.org, Richard Henderson
>         <richard.henderson@linaro.org>, fernando.valle@eldorado.org.br,
>         matheus.ferst@eldorado.org.br, farosas@linux.ibm.com,
>         lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
>         qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
> Subject: Re: [PATCH v2 03/10] target/ppc: Push real-mode handling into
>         ppc_radix64_xlate
> Message-ID: <YNP8HPVUgSlFkyAm@yekko>
> Content-Type: text/plain; charset=3D"utf-8"
>
> On Mon, Jun 21, 2021 at 09:51:08AM -0300, Bruno Larsen (billionai) wrote:
> > From: Richard Henderson <richard.henderson@linaro.org>
> >
> > This removes some incomplete duplication between
> > ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
> > The former was correct wrt SPR_HRMOR and the latter was not.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Applied to ppc-for-6.1, thanks.
>
> > ---
> >  target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------------
> >  1 file changed, 34 insertions(+), 43 deletions(-)
> >
> > diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> > index 1c707d387d..dd5ae69052 100644
> > --- a/target/ppc/mmu-radix64.c
> > +++ b/target/ppc/mmu-radix64.c
> > @@ -465,7 +465,6 @@ static int
> ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
> >   */
> >  static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> >                               MMUAccessType access_type,
> > -                             bool relocation,
> >                               hwaddr *raddr, int *psizep, int *protp,
> >                               bool guest_visible)
> >  {
> > @@ -474,6 +473,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vadd=
r
> eaddr,
> >      ppc_v3_pate_t pate;
> >      int psize, prot;
> >      hwaddr g_raddr;
> > +    bool relocation;
> > +
> > +    assert(!(msr_hv && cpu->vhyp));
> > +
> > +    relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_d=
r);
> > +
> > +    /* HV or virtual hypervisor Real Mode Access */
> > +    if (!relocation && (msr_hv || cpu->vhyp)) {
> > +        /* In real mode top 4 effective addr bits (mostly) ignored */
> > +        *raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
> > +
> > +        /* In HV mode, add HRMOR if top EA bit is clear */
> > +        if (msr_hv || !env->has_hv_mode) {
>
> Not in scope, because this is a code motion, but that test looks
> bogus.  If we don't have an HV mode, we won't have an HRMOR either.
>
> > +            if (!(eaddr >> 63)) {
> > +                *raddr |=3D env->spr[SPR_HRMOR];
> > +           }
> > +        }
> > +        *protp =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> > +        *psizep =3D TARGET_PAGE_BITS;
> > +        return 0;
> > +    }
> > +
> > +    /*
> > +     * Check UPRT (we avoid the check in real mode to deal with
> > +     * transitional states during kexec.
> > +     */
> > +    if (guest_visible && !ppc64_use_proc_tbl(cpu)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "LPCR:UPRT not set in radix mode ! LPCR=3D"
> > +                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> > +    }
> >
> >      /* Virtual Mode Access - get the fully qualified address */
> >      if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid,
> &pid)) {
> > @@ -559,43 +589,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu,
> vaddr eaddr,
> >                                   MMUAccessType access_type, int mmu_id=
x)
> >  {
> >      CPUState *cs =3D CPU(cpu);
> > -    CPUPPCState *env =3D &cpu->env;
> >      int page_size, prot;
> > -    bool relocation;
> >      hwaddr raddr;
> >
> > -    assert(!(msr_hv && cpu->vhyp));
> > -
> > -    relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_d=
r);
> > -    /* HV or virtual hypervisor Real Mode Access */
> > -    if (!relocation && (msr_hv || cpu->vhyp)) {
> > -        /* In real mode top 4 effective addr bits (mostly) ignored */
> > -        raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
> > -
> > -        /* In HV mode, add HRMOR if top EA bit is clear */
> > -        if (msr_hv || !env->has_hv_mode) {
> > -            if (!(eaddr >> 63)) {
> > -                raddr |=3D env->spr[SPR_HRMOR];
> > -           }
> > -        }
> > -        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr &
> TARGET_PAGE_MASK,
> > -                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
> > -                     TARGET_PAGE_SIZE);
> > -        return 0;
> > -    }
> > -
> > -    /*
> > -     * Check UPRT (we avoid the check in real mode to deal with
> > -     * transitional states during kexec.
> > -     */
> > -    if (!ppc64_use_proc_tbl(cpu)) {
> > -        qemu_log_mask(LOG_GUEST_ERROR,
> > -                      "LPCR:UPRT not set in radix mode ! LPCR=3D"
> > -                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> > -    }
> > -
> >      /* Translate eaddr to raddr (where raddr is addr qemu needs for
> access) */
> > -    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
> > +    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
> >                            &page_size, &prot, true)) {
> >          return 1;
> >      }
> > @@ -607,18 +605,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu,
> vaddr eaddr,
> >
> >  hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong
> eaddr)
> >  {
> > -    CPUPPCState *env =3D &cpu->env;
> >      int psize, prot;
> >      hwaddr raddr;
> >
> > -    /* Handle Real Mode */
> > -    if ((msr_dr =3D=3D 0) && (msr_hv || cpu->vhyp)) {
> > -        /* In real mode top 4 effective addr bits (mostly) ignored */
> > -        return eaddr & 0x0FFFFFFFFFFFFFFFULL;
> > -    }
> > -
> > -    if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &raddr, &psize,
> > -                          &prot, false)) {
> > +    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> > +                          &psize, &prot, false)) {
> >          return -1;
> >      }
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: signature.asc
> Type: application/pgp-signature
> Size: 833 bytes
> Desc: not available
> URL: <
> https://lists.nongnu.org/archive/html/qemu-devel/attachments/20210624/1d7=
06e70/attachment.sig
> >
>
> ------------------------------
>
> Message: 6
> Date: Thu, 24 Jun 2021 13:19:28 +1000
> From: David Gibson <david@gibson.dropbear.id.au>
> To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
> Cc: qemu-devel@nongnu.org, clg@kaod.org, Richard Henderson
>         <richard.henderson@linaro.org>, fernando.valle@eldorado.org.br,
>         matheus.ferst@eldorado.org.br, farosas@linux.ibm.com,
>         lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
>         qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
> Subject: Re: [PATCH v2 02/10] target/ppc: Use MMUAccessType with
>         *_handle_mmu_fault
> Message-ID: <YNP5wNLe/7OqMMaT@yekko>
> Content-Type: text/plain; charset=3D"utf-8"
>
> On Mon, Jun 21, 2021 at 09:51:07AM -0300, Bruno Larsen (billionai) wrote:
> > From: Richard Henderson <richard.henderson@linaro.org>
> >
> > These changes were waiting until we didn't need to match
> > the function type of PowerPCCPUClass.handle_mmu_fault.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Applied to ppc-for-6.1, thanks.
>
> > ---
> >  target/ppc/mmu-hash32.c  | 7 ++-----
> >  target/ppc/mmu-hash32.h  | 4 ++--
> >  target/ppc/mmu-hash64.c  | 6 +-----
> >  target/ppc/mmu-hash64.h  | 4 ++--
> >  target/ppc/mmu-radix64.c | 7 ++-----
> >  target/ppc/mmu-radix64.h | 4 ++--
> >  6 files changed, 11 insertions(+), 21 deletions(-)
> >
> > diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> > index 9f0a497657..8f19b43e47 100644
> > --- a/target/ppc/mmu-hash32.c
> > +++ b/target/ppc/mmu-hash32.c
> > @@ -415,8 +415,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr,
> ppc_hash_pte32_t pte,
> >      return (rpn & ~mask) | (eaddr & mask);
> >  }
> >
> > -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> > -                                int mmu_idx)
> > +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> > +                                MMUAccessType access_type, int mmu_idx=
)
> >  {
> >      CPUState *cs =3D CPU(cpu);
> >      CPUPPCState *env =3D &cpu->env;
> > @@ -425,11 +425,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu,
> vaddr eaddr, int rwx,
> >      ppc_hash_pte32_t pte;
> >      int prot;
> >      int need_prot;
> > -    MMUAccessType access_type;
> >      hwaddr raddr;
> >
> > -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> > -    access_type =3D rwx;
> >      need_prot =3D prot_for_access_type(access_type);
> >
> >      /* 1. Handle real mode accesses */
> > diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> > index 898021f0d8..30e35718a7 100644
> > --- a/target/ppc/mmu-hash32.h
> > +++ b/target/ppc/mmu-hash32.h
> > @@ -5,8 +5,8 @@
> >
> >  hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
> >  hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong
> addr);
> > -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw=
,
> > -                                int mmu_idx);
> > +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> > +                                MMUAccessType access_type, int mmu_idx=
);
> >
> >  /*
> >   * Segment register definitions
> > diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> > index 708dffc31b..2febd369b1 100644
> > --- a/target/ppc/mmu-hash64.c
> > +++ b/target/ppc/mmu-hash64.c
> > @@ -874,7 +874,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu,
> ppc_slb_t *slb)
> >  }
> >
> >  int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> > -                                int rwx, int mmu_idx)
> > +                                MMUAccessType access_type, int mmu_idx=
)
> >  {
> >      CPUState *cs =3D CPU(cpu);
> >      CPUPPCState *env =3D &cpu->env;
> > @@ -884,13 +884,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu,
> vaddr eaddr,
> >      hwaddr ptex;
> >      ppc_hash_pte64_t pte;
> >      int exec_prot, pp_prot, amr_prot, prot;
> > -    MMUAccessType access_type;
> >      int need_prot;
> >      hwaddr raddr;
> >
> > -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> > -    access_type =3D rwx;
> > -
> >      /*
> >       * Note on LPCR usage: 970 uses HID4, but our special variant of
> >       * store_spr copies relevant fields into env->spr[SPR_LPCR].
> > diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> > index 4b8b8e7950..3e8a8eec1f 100644
> > --- a/target/ppc/mmu-hash64.h
> > +++ b/target/ppc/mmu-hash64.h
> > @@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
> >

--00000000000050bf4b05c58125ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jun 24, 2021, 09:15  &lt;<a href=3D"mailto:qemu-d=
evel-request@nongnu.org">qemu-devel-request@nongnu.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Send Qemu-devel mailing list submissions=
 to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-devel@nongnu.org" target=
=3D"_blank" rel=3D"noreferrer">qemu-devel@nongnu.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.nongnu.org/mailman/lis=
tinfo/qemu-devel" rel=3D"noreferrer noreferrer" target=3D"_blank">https://l=
ists.nongnu.org/mailman/listinfo/qemu-devel</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-devel-request@nongnu.org=
" target=3D"_blank" rel=3D"noreferrer">qemu-devel-request@nongnu.org</a><br=
>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-devel-owner@nongnu.org" =
target=3D"_blank" rel=3D"noreferrer">qemu-devel-owner@nongnu.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Qemu-devel digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. RE: [PATCH v5 10/14] target/hexagon: import parser for<br>
=C2=A0 =C2=A0 =C2=A0 idef-parser (Taylor Simpson)<br>
=C2=A0 =C2=A02. [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI<br>
=C2=A0 =C2=A0 =C2=A0 (Vivek Kasireddy)<br>
=C2=A0 =C2=A03. [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI<br=
>
=C2=A0 =C2=A0 =C2=A0 (Vivek Kasireddy)<br>
=C2=A0 =C2=A04. Re: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI<br>
=C2=A0 =C2=A0 =C2=A0 (<a href=3D"mailto:no-reply@patchew.org" target=3D"_bl=
ank" rel=3D"noreferrer">no-reply@patchew.org</a>)<br>
=C2=A0 =C2=A05. Re: [PATCH v2 03/10] target/ppc: Push real-mode handling in=
to<br>
=C2=A0 =C2=A0 =C2=A0 ppc_radix64_xlate (David Gibson)<br>
=C2=A0 =C2=A06. Re: [PATCH v2 02/10] target/ppc: Use MMUAccessType with<br>
=C2=A0 =C2=A0 =C2=A0 *_handle_mmu_fault (David Gibson)<br>
=C2=A0 =C2=A07. Re: [PATCH v2 04/10] target/ppc: Use bool success for<br>
=C2=A0 =C2=A0 =C2=A0 ppc_radix64_xlate (David Gibson)<br>
=C2=A0 =C2=A08. Re: [PATCH v3 02/24] modules: collect module meta-data<br>
=C2=A0 =C2=A0 =C2=A0 (Paolo Bonzini)<br>
=C2=A0 =C2=A09. Re: [PATCH v2 04/37] target/riscv: 8-bit Addition &amp;<br>
=C2=A0 =C2=A0 =C2=A0 Subtraction Instruction (LIU Zhiwei)<br>
=C2=A0 10. Re: [PATCH v2 03/23] qapi/misc-target: Group SEV QAPI<br>
=C2=A0 =C2=A0 =C2=A0 definitions (Dov Murik)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Thu, 24 Jun 2021 03:55:35 +0000<br>
From: Taylor Simpson &lt;<a href=3D"mailto:tsimpson@quicinc.com" target=3D"=
_blank" rel=3D"noreferrer">tsimpson@quicinc.com</a>&gt;<br>
To: Alessandro Di Federico &lt;ale.qemu@rev.ng&gt;, &quot;<a href=3D"mailto=
:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noreferrer">qemu-devel@non=
gnu.org</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:qemu-devel@nongnu.org" ta=
rget=3D"_blank" rel=3D"noreferrer">qemu-devel@nongnu.org</a>&gt;<br>
Cc: Brian Cain &lt;<a href=3D"mailto:bcain@quicinc.com" target=3D"_blank" r=
el=3D"noreferrer">bcain@quicinc.com</a>&gt;, &quot;babush@rev.ng&quot; &lt;=
babush@rev.ng&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nizzo@rev.ng&quot; &lt;nizzo@rev.ng&gt;, =
&quot;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank" rel=3D"norefer=
rer">philmd@redhat.com</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:philmd@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;, &quot;<a href=3D"=
mailto:richard.henderson@linaro.org" target=3D"_blank" rel=3D"noreferrer">r=
ichard.henderson@linaro.org</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>&=
gt;, Alessandro Di Federico &lt;ale@rev.ng&gt;<br>
Subject: RE: [PATCH v5 10/14] target/hexagon: import parser for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 idef-parser<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:BYAPR02MB488679E9F94D4848=
52DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com" target=3D"_blank" re=
l=3D"noreferrer">BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.nampr=
d02.prod.outlook.com</a>&gt;<br>
<br>
Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
<br>
<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Alessandro Di Federico &lt;ale.qemu@rev.ng&gt;<br>
&gt; Sent: Saturday, June 19, 2021 3:37 AM<br>
&gt; To: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"=
noreferrer">qemu-devel@nongnu.org</a><br>
&gt; Cc: Taylor Simpson &lt;<a href=3D"mailto:tsimpson@quicinc.com" target=
=3D"_blank" rel=3D"noreferrer">tsimpson@quicinc.com</a>&gt;; Brian Cain<br>
&gt; &lt;<a href=3D"mailto:bcain@quicinc.com" target=3D"_blank" rel=3D"nore=
ferrer">bcain@quicinc.com</a>&gt;; babush@rev.ng; nizzo@rev.ng; <a href=3D"=
mailto:philmd@redhat.com" target=3D"_blank" rel=3D"noreferrer">philmd@redha=
t.com</a>;<br>
&gt; <a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank" rel=
=3D"noreferrer">richard.henderson@linaro.org</a>; Alessandro Di Federico &l=
t;ale@rev.ng&gt;<br>
&gt; Subject: [PATCH v5 10/14] target/hexagon: import parser for idef-parse=
r<br>
&gt; <br>
&gt; From: Paolo Montesel &lt;babush@rev.ng&gt;<br>
&gt; <br>
&gt; Signed-off-by: Alessandro Di Federico &lt;ale@rev.ng&gt;<br>
&gt; Signed-off-by: Paolo Montesel &lt;babush@rev.ng&gt;<br>
&gt; ---<br>
&gt; diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon=
/idef-<br>
&gt; parser/idef-parser.y<br>
<br>
<br>
<br>
&gt; +for_statement : FOR &#39;(&#39; IMM &#39;=3D&#39; IMM &#39;;&#39; IMM=
 &#39;&lt;&#39; IMM &#39;;&#39; IMM PLUSPLUS &#39;)&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 @1.last_column =3D @13.last_column;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OUT(c, &amp;@1, &quot;for (int &quot;, &amp;$3, &quot; =3D &quot;, &amp;$5=
, &quot;; &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &amp;$7, &quot; &lt; &quot;, &amp;$9);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OUT(c, &amp;@1, &quot;; &quot;, &amp;$11, &quot;++) {\n&quot;);<br>
<br>
Increase indent level here<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code_block<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
<br>
Decrease indent level<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OUT(c, &amp;@1, &quot;}\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | FOR &#39;(&#39; IM=
M &#39;=3D&#39; IMM &#39;;&#39; IMM &#39;&lt;&#39; IMM &#39;;&#39; IMM INC =
IMM &#39;)&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 @1.last_column =3D @14.last_column;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OUT(c, &amp;@1, &quot;for (int &quot;, &amp;$3, &quot; =3D &quot;, &amp;$5=
, &quot;; &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &amp;$7, &quot; &lt; &quot;, &amp;$9);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OUT(c, &amp;@1, &quot;; &quot;, &amp;$11, &quot; +=3D &quot;, &amp;$13, &q=
uot;) {\n&quot;);<br>
<br>
Increase indent<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code_block<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
<br>
Decrease indent<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OUT(c, &amp;@1, &quot;}\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
&gt; +<br>
&gt; +fpart1_statement : PART1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0OUT(c, &amp;@1, &quot;if (insn-&gt;part1) {\n&quot;);<br>
<br>
Increase indent<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;(&#39; statements &#39;)&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0@1.last_column =3D @3.last_column;<br>
<br>
Emit the return first, then decrease indent before the curly<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0OUT(c, &amp;@1, &quot;return; }\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0| rvalue &#39;[&#39; rvalue &#39;]&#39;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@1.last_column =3D @4=
.last_column;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($3.type =3D=3D IM=
MEDIATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$$ =3D =
gen_tmp(c, &amp;@1, $1.bit_width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OUT(c, =
&amp;@1, &quot;tcg_gen_extract_i&quot;, &amp;$$.bit_width, &quot;(&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OUT(c, =
&amp;@1, &amp;$$, &quot;, &quot;, &amp;$1, &quot;, &quot;, &amp;$3, &quot;,=
 1);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValu=
e one =3D gen_imm_value(c, &amp;@1, 1, $3.bit_width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValu=
e tmp =3D gen_bin_op(c, &amp;@1, ASR_OP, &amp;$1, &amp;$3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$$ =3D =
gen_bin_op(c, &amp;@1, ANDB_OP, &amp;tmp, &amp;one);<br>
<br>
Can this be done with a tcg_gen_extract_tl or tcg_gen_sextract_tl?<br>
<br>
Do you need to worry about signed-ness?<br>
<br>
&gt; diff --git a/target/hexagon/idef-parser/parser-helpers.c<br>
&gt; b/target/hexagon/idef-parser/parser-helpers.c<br>
&gt; new file mode 100644<br>
<br>
<br>
&gt; +const char *creg_str[] =3D {&quot;HEX_REG_SP&quot;, &quot;HEX_REG_FP&=
quot;, &quot;HEX_REG_LR&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;HEX_REG_GP&quot;, &quot;HEX_REG_LC0&quot;, &quo=
t;HEX_REG_LC1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;HEX_REG_SA0&quot;, &quot;HEX_REG_SA1&quot;};<br=
>
<br>
SP, FP, LR shouldn&#39;t in this array.<br>
<br>
&gt; +void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[=
5])<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (reg-&gt;type) {<br>
&gt; +=C2=A0 =C2=A0 case GENERAL_PURPOSE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[0] =3D &#39;R&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case CONTROL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[0] =3D &#39;C&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case MODIFIER:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[0] =3D &#39;M&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DOTNEW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The DOTNEW case is managed by the uppe=
r level function */<br>
<br>
Should we raise an error if we get here?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 switch (reg-&gt;bit_width) {<br>
&gt; +=C2=A0 =C2=A0 case 32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[1] =3D reg-&gt;id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[2] =3D &#39;V&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 64:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[1] =3D reg-&gt;id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[2] =3D reg-&gt;id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_id[3] =3D &#39;V&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 yyassert(c, locp, false, &quot;Unhandled =
register bit width!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +void reg_print(Context *c, YYLTYPE *locp, HexReg *reg)<br>
&gt; +{<br>
&gt; +=C2=A0 if (reg-&gt;type =3D=3D DOTNEW) {<br>
&gt; +=C2=A0 =C2=A0 EMIT(c, &quot;N%cN&quot;, reg-&gt;id);<br>
<br>
Why not handle this in reg_compose?<br>
<br>
&gt; +=C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 char reg_id[5] =3D { 0 };<br>
&gt; +=C2=A0 =C2=A0 reg_compose(c, locp, reg, reg_id);<br>
&gt; +=C2=A0 =C2=A0 EMIT(c, &quot;%s&quot;, reg_id);<br>
&gt; +=C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (imm-&gt;type) {<br>
&gt; +=C2=A0 =C2=A0 case I:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;i&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case VARIABLE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;%ciV&quot;, imm-&gt;id);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case VALUE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;((int64_t)%&quot; PRIu64 &q=
uot;ULL)&quot;, (int64_t)imm-&gt;value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case QEMU_TMP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;qemu_tmp_%&quot; PRIu64, im=
m-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case IMM_PC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;ctx-&gt;base.pc_next&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case IMM_NPC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;ctx-&gt;npc&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case IMM_CONSTEXT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT(c, &quot;insn-&gt;extension_valid&qu=
ot;);<br>
<br>
The extension_valid field is a bool indicating if the instruction has a con=
stant extender.=C2=A0 Don&#39;t you want the actual value here?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
<br>
&gt; +<br>
&gt; +static HexValue get_ternary_cond(Context *c, YYLTYPE *locp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, is_inside_ternary(c), &quot;unexistin=
g condition&quot;);<br>
&gt; +=C2=A0 =C2=A0 Ternary *t =3D &amp;g_array_index(c-&gt;ternary, Ternar=
y, 0);<br>
&gt; +=C2=A0 =C2=A0 HexValue cond =3D t-&gt;cond;<br>
&gt; +=C2=A0 =C2=A0 if (t-&gt;state =3D=3D IN_RIGHT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cond =3D gen_rvalue_notl(c, locp, &amp;co=
nd);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 for (unsigned i =3D 1; i &lt; c-&gt;ternary-&gt;len; ++=
i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ternary *right =3D &amp;g_array_index(c-&=
gt;ternary, Ternary, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue other =3D right-&gt;cond;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invert condition if we are on the righ=
t side */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (right-&gt;state =3D=3D IN_RIGHT) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 other =3D gen_rvalue_notl(c=
, locp, &amp;other);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cond =3D gen_bin_op(c, locp, ANDL_OP, &am=
p;cond, &amp;other);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return cond;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Temporary values creation */<br>
&gt; +HexValue gen_tmp(Context *c, YYLTYPE *locp, int bit_width)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 HexValue rvalue;<br>
&gt; +=C2=A0 =C2=A0 rvalue.type =3D TEMP;<br>
&gt; +=C2=A0 =C2=A0 bit_width =3D (bit_width =3D=3D 64) ? 64 : 32;<br>
<br>
Better to assert it&#39;s either 64 or 32<br>
<br>
&gt; +=C2=A0 =C2=A0 rvalue.bit_width =3D bit_width;<br>
&gt; +=C2=A0 =C2=A0 rvalue.is_unsigned =3D false;<br>
&gt; +=C2=A0 =C2=A0 rvalue.is_dotnew =3D false;<br>
&gt; +=C2=A0 =C2=A0 rvalue.is_manual =3D false;<br>
&gt; +=C2=A0 =C2=A0 rvalue.tmp.index =3D c-&gt;inst.tmp_count;<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;TCGv_i&quot;, &amp;bit_width, &quot;=
 tmp_&quot;, &amp;c-&gt;inst.tmp_count,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; =3D tcg_temp_new_i&quot;, &amp;bit=
_width, &quot;();\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 c-&gt;inst.tmp_count++;<br>
&gt; +=C2=A0 =C2=A0 return rvalue;<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
&gt; +<br>
&gt; +void rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue)<br>
<br>
Should be called gen_rvalue_free<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (rvalue-&gt;type =3D=3D TEMP &amp;&amp; !rvalue-&gt;=
is_manual) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *bit_suffix =3D (rvalue-&gt;bi=
t_width =3D=3D 64) ? &quot;i64&quot; : &quot;i32&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_temp_free_&quot;, =
bit_suffix, &quot;(&quot;, rvalue, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
<br>
&gt; +HexValue rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)<b=
r>
<br>
Should be called gen_rvalue_extend<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (rvalue-&gt;type =3D=3D IMMEDIATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue res =3D *rvalue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.bit_width =3D 64;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rvalue-&gt;bit_width =3D=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue res =3D gen_tmp(c,=
 locp, 64);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *sign_suffix =3D=
 (rvalue-&gt;is_unsigned) ? &quot;u&quot; : &quot;&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_=
ext&quot;, sign_suffix,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;_i32_i6=
4(&quot;, &amp;res, &quot;, &quot;, rvalue, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, rvalue=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return *rvalue;<br>
&gt; +}<br>
&gt; +<br>
&gt; +HexValue rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue)=
<br>
<br>
Should be called gen_rvalue_truncate<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (rvalue-&gt;type =3D=3D IMMEDIATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue res =3D *rvalue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.bit_width =3D 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rvalue-&gt;bit_width =3D=3D 64) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue res =3D gen_tmp(c,=
 locp, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_=
trunc_i64_tl(&quot;, &amp;res, &quot;, &quot;, rvalue, &quot;);\n&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, rvalue=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return *rvalue;<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
&gt; +void varid_allocate(Context *c,<br>
<br>
gen_varid_allocate<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 HexValue *varid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool is_unsigned)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 varid-&gt;bit_width =3D width;<br>
&gt; +=C2=A0 =C2=A0 const char *bit_suffix =3D width =3D=3D 64 ? &quot;64&q=
uot; : &quot;32&quot;;<br>
&gt; +=C2=A0 =C2=A0 int index =3D find_variable(c, locp, varid);<br>
&gt; +=C2=A0 =C2=A0 bool found =3D index !=3D -1;<br>
&gt; +=C2=A0 =C2=A0 if (found) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Var *other =3D &amp;g_array_index(c-&gt;i=
nst.allocated, Var, index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 varid-&gt;<a href=3D"http://var.name" rel=
=3D"noreferrer noreferrer" target=3D"_blank">var.name</a> =3D other-&gt;nam=
e;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 varid-&gt;bit_width =3D other-&gt;bit_wid=
th;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 varid-&gt;is_unsigned =3D other-&gt;is_un=
signed;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT_HEAD(c, &quot;TCGv_i%s %s&quot;, bit=
_suffix, varid-&gt;var.name-&gt;str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 EMIT_HEAD(c, &quot; =3D tcg_temp_local_ne=
w_i%s();\n&quot;, bit_suffix);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Var new_var =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D varid-&gt;<a href=
=3D"http://var.name" rel=3D"noreferrer noreferrer" target=3D"_blank">var.na=
me</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bit_width =3D width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .is_unsigned =3D is_unsigne=
d,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_append_val(c-&gt;inst.allocated, =
new_var);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +void ea_free(Context *c, YYLTYPE *locp)<br>
<br>
gen_ea_free<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_temp_free(EA);\n&quot;);<br>
&gt; +}<br>
&gt; +HexValue gen_bin_cmp(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TCGCond type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *op1_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *op2_ptr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 HexValue op1 =3D *op1_ptr;<br>
&gt; +=C2=A0 =C2=A0 HexValue op2 =3D *op2_ptr;<br>
&gt; +=C2=A0 =C2=A0 enum OpTypes op_types =3D (op1.type !=3D IMMEDIATE) &lt=
;&lt; 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (op2.type !=3D IMMEDIATE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Find bit width of the two operands, if at least one =
is 64 bit use a */<br>
&gt; +=C2=A0 =C2=A0 /* 64bit operation, eventually extend 32bit operands. *=
/<br>
<br>
This is duplicated elsewhere (e.g., gen_bin_op) - should be pulled into a s=
ingle function.<br>
<br>
&gt; +=C2=A0 =C2=A0 bool op_is64bit =3D op1.bit_width =3D=3D 64 || op2.bit_=
width =3D=3D 64;<br>
&gt; +=C2=A0 =C2=A0 const char *bit_suffix =3D op_is64bit ? &quot;i64&quot;=
 : &quot;i32&quot;;<br>
&gt; +=C2=A0 =C2=A0 int bit_width =3D (op_is64bit) ? 64 : 32;<br>
&gt; +=C2=A0 =C2=A0 if (op_is64bit) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (op_types) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IMM_IMM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IMM_REG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op2 =3D rvalue_extend(c, lo=
cp, &amp;op2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case REG_IMM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op1 =3D rvalue_extend(c, lo=
cp, &amp;op1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case REG_REG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op1 =3D rvalue_extend(c, lo=
cp, &amp;op1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op2 =3D rvalue_extend(c, lo=
cp, &amp;op2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
<br>
<br>
&gt; +static void gen_mini_op(Context *c, YYLTYPE *locp, unsigned bit_width=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexValue *res, enum OpTypes op_types,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexValue *op1_ptr, HexValue *op2_ptr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 HexValue op1 =3D *op1_ptr;<br>
&gt; +=C2=A0 =C2=A0 HexValue op2 =3D *op2_ptr;<br>
&gt; +=C2=A0 =C2=A0 const char *min =3D res-&gt;is_unsigned ? &quot;tcg_gen=
_umin&quot; : &quot;tcg_gen_smin&quot;;<br>
&gt; +=C2=A0 =C2=A0 switch (op_types) {<br>
&gt; +=C2=A0 =C2=A0 case IMM_IMM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;int&quot;, &amp;bit_wi=
dth, &quot;_t &quot;, res, &quot; =3D (&quot;, &amp;op1, &quot; &lt;=3D &qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &amp;op2, &quot;) ? &quot;, =
&amp;op1, &quot; : &quot;, &amp;op2, &quot;;\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case IMM_REG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op1.bit_width =3D bit_width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op1 =3D rvalue_materialize(c, locp, &amp;=
op1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, min, &quot;_i&quot;, &amp;bi=
t_width, &quot;(&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, res, &quot;, &quot;, &amp;op=
1, &quot;, &quot;, &amp;op2, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_IMM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op2.bit_width =3D bit_width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op2 =3D rvalue_materialize(c, locp, &amp;=
op2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fallthrough */<br>
&gt; +=C2=A0 =C2=A0 case REG_REG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, min, &quot;_i&quot;, &amp;bi=
t_width, &quot;(&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, res, &quot;, &quot;, &amp;op=
1, &quot;, &quot;, &amp;op2, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;op1);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;op2);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void gen_maxi_op(Context *c, YYLTYPE *locp, unsigned bit_width=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexValue *res, enum OpTypes op_types,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexValue *op1_ptr, HexValue *op2_ptr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 HexValue op1 =3D *op1_ptr;<br>
&gt; +=C2=A0 =C2=A0 HexValue op2 =3D *op2_ptr;<br>
&gt; +=C2=A0 =C2=A0 const char *min =3D res-&gt;is_unsigned ? &quot;tcg_gen=
_umax&quot; : &quot;tcg_gen_smax&quot;;<br>
&gt; +=C2=A0 =C2=A0 switch (op_types) {<br>
&gt; +=C2=A0 =C2=A0 case IMM_IMM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;int&quot;, &amp;bit_wi=
dth, &quot;_t &quot;, res, &quot; =3D (&quot;, &amp;op1, &quot; &lt;=3D &qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &amp;op2, &quot;) ? &quot;, =
&amp;op2, &quot; : &quot;, &amp;op1, &quot;;\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case IMM_REG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op1.bit_width =3D bit_width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op1 =3D rvalue_materialize(c, locp, &amp;=
op1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, min, &quot;_i&quot;, &amp;bi=
t_width, &quot;(&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, res, &quot;, &quot;, &amp;op=
1, &quot;, &quot;, &amp;op2, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_IMM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op2.bit_width =3D bit_width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 op2 =3D rvalue_materialize(c, locp, &amp;=
op2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fallthrough */<br>
&gt; +=C2=A0 =C2=A0 case REG_REG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, min, &quot;_i&quot;, &amp;bi=
t_width, &quot;(&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, res, &quot;, &quot;, &amp;op=
1, &quot;, &quot;, &amp;op2, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;op1);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;op2);<br>
&gt; +}<br>
<br>
These two look basically the same, create a single function with one extra =
are indicating min/max.<br>
<br>
<br>
&gt; +HexValue gen_cast_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *source,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0unsigned target_width) {<br>
<br>
Don&#39;t you need to worry about signed-ness of the result?<br>
<br>
&gt; +=C2=A0 =C2=A0 if (source-&gt;bit_width =3D=3D target_width) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return *source;<br>
&gt; +=C2=A0 =C2=A0 } else if (source-&gt;type =3D=3D IMMEDIATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue res =3D *source;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.bit_width =3D target_width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue res =3D gen_tmp(c, locp, target_=
width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Truncate */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (source-&gt;bit_width &gt; target_widt=
h) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_=
trunc_i64_tl(&quot;, &amp;res, &quot;, &quot;, source, &quot;);\n&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (source-&gt;is_unsigned)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Extend uns=
igned */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, =
&quot;tcg_gen_extu_i32_i64(&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &amp;res, &quot;, &quot;, source, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Extend sig=
ned */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, =
&quot;tcg_gen_ext_i32_i64(&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &amp;res, &quot;, &quot;, source, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, source);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +HexValue gen_extend_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HexValue *src_width_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HexValue *dst_width_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HexValue *value_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bool is_unsigned) {<br>
&gt; +=C2=A0 =C2=A0 HexValue src_width =3D *src_width_ptr;<br>
&gt; +=C2=A0 =C2=A0 HexValue dst_width =3D *dst_width_ptr;<br>
&gt; +=C2=A0 =C2=A0 HexValue value =3D *value_ptr;<br>
&gt; +=C2=A0 =C2=A0 src_width =3D rvalue_extend(c, locp, &amp;src_width);<b=
r>
&gt; +=C2=A0 =C2=A0 value =3D rvalue_extend(c, locp, &amp;value);<br>
&gt; +=C2=A0 =C2=A0 src_width =3D rvalue_materialize(c, locp, &amp;src_widt=
h);<br>
&gt; +=C2=A0 =C2=A0 value =3D rvalue_materialize(c, locp, &amp;value);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 HexValue res =3D gen_tmp(c, locp, 64);<br>
&gt; +=C2=A0 =C2=A0 HexValue shift =3D gen_tmp_value(c, locp, &quot;64&quot=
;, 64);<br>
&gt; +=C2=A0 =C2=A0 HexValue zero =3D gen_tmp_value(c, locp, &quot;0&quot;,=
 64);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_sub_i64(&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;shift, &quot;, &quot;, &amp;shift, &=
quot;, &quot;, &amp;src_width, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (is_unsigned) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue mask =3D gen_tmp_value(c, locp, =
&quot;0xffffffffffffffff&quot;, 64);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_shr_i64(&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mask, &quot;, &quot;, =
&amp;mask, &quot;, &quot;, &amp;shift, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_and_i64(&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;res, &quot;, &quot;, &=
amp;value, &quot;, &quot;, &amp;mask, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, &amp;mask);<br>
<br>
Can&#39;t you do this with tcg_gen_extract?<br>
<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_shl_i64(&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;res, &quot;, &quot;, &=
amp;value, &quot;, &quot;, &amp;shift, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_sar_i64(&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;res, &quot;, &quot;, &=
amp;res, &quot;, &quot;, &amp;shift, &quot;);\n&quot;);<br>
<br>
Can&#39;t you do this with get_gen_sectract?<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_movcond_i64(TCG_COND_EQ, &qu=
ot;, &amp;res, &quot;, &quot;);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &amp;src_width, &quot;, &quot;, &amp;zero,=
 &quot;, &quot;, &amp;zero, &quot;, &quot;, &amp;res, &quot;);\n&quot;);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;src_width);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;dst_width);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;value);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;shift);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;zero);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 res.is_unsigned =3D is_unsigned;<br>
&gt; +=C2=A0 =C2=A0 return res;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void gen_rdeposit_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *dest,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *begin,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HexValue *width)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 HexValue dest_m =3D *dest;<br>
&gt; +=C2=A0 =C2=A0 dest_m.is_manual =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 HexValue value_m =3D rvalue_extend(c, locp, value);<br>
&gt; +=C2=A0 =C2=A0 HexValue begin_m =3D rvalue_extend(c, locp, begin);<br>
&gt; +=C2=A0 =C2=A0 HexValue width_orig =3D *width;<br>
&gt; +=C2=A0 =C2=A0 width_orig.is_manual =3D true;<br>
&gt; +=C2=A0 =C2=A0 HexValue width_m =3D rvalue_extend(c, locp, &amp;width_=
orig);<br>
&gt; +=C2=A0 =C2=A0 width_m =3D rvalue_materialize(c, locp, &amp;width_m);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 HexValue mask =3D gen_tmp_value(c, locp, &quot;0xffffff=
ffffffffffUL&quot;, 64);<br>
&gt; +=C2=A0 =C2=A0 mask.is_unsigned =3D true;<br>
&gt; +=C2=A0 =C2=A0 HexValue k64 =3D gen_tmp_value(c, locp, &quot;64&quot;,=
 64);<br>
&gt; +=C2=A0 =C2=A0 k64 =3D gen_bin_op(c, locp, SUB_OP, &amp;k64, &amp;widt=
h_m);<br>
&gt; +=C2=A0 =C2=A0 mask =3D gen_bin_op(c, locp, LSR_OP, &amp;mask, &amp;k6=
4);<br>
&gt; +=C2=A0 =C2=A0 begin_m.is_manual =3D true;<br>
&gt; +=C2=A0 =C2=A0 mask =3D gen_bin_op(c, locp, ASL_OP, &amp;mask, &amp;be=
gin_m);<br>
&gt; +=C2=A0 =C2=A0 mask.is_manual =3D true;<br>
&gt; +=C2=A0 =C2=A0 value_m =3D gen_bin_op(c, locp, ASL_OP, &amp;value_m, &=
amp;begin_m);<br>
&gt; +=C2=A0 =C2=A0 value_m =3D gen_bin_op(c, locp, ANDB_OP, &amp;value_m, =
&amp;mask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_not_i64(&quot;, &amp;mask, &=
quot;, &quot;, &amp;mask, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 mask.is_manual =3D false;<br>
&gt; +=C2=A0 =C2=A0 HexValue res =3D gen_bin_op(c, locp, ANDB_OP, &amp;dest=
_m, &amp;mask);<br>
&gt; +=C2=A0 =C2=A0 res =3D gen_bin_op(c, locp, ORB_OP, &amp;res, &amp;valu=
e_m);<br>
&gt; +<br>
<br>
Can&#39;t you do this with tcg_gen_deposit?<br>
<br>
&gt; +=C2=A0 =C2=A0 if (dest-&gt;bit_width !=3D res.bit_width) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D rvalue_truncate(c, locp, &amp;res=
);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 HexValue zero =3D gen_tmp_value(c, locp, &quot;0&quot;,=
 res.bit_width);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_movcond_i&quot;, &amp;res.bi=
t_width, &quot;(TCG_COND_NE, &quot;,<br>
&gt; dest);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;, &quot;, &amp;width_orig, &quot;, &=
quot;, &amp;zero, &quot;, &quot;, &amp;res, &quot;, &quot;, dest,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;);\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;zero);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, width);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;res);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void gen_deposit_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 HexValue *dest,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 HexValue *value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 HexValue *index,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 HexCast *cast)<br>
<br>
What&#39;s the difference between this and the gen_rdeposit_op above?<br>
<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, index-&gt;type =3D=3D IMMEDIATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Deposit index m=
ust be immediate!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 HexValue value_m =3D *value;<br>
&gt; +=C2=A0 =C2=A0 int bit_width =3D (dest-&gt;bit_width =3D=3D 64) ? 64 :=
 32;<br>
&gt; +=C2=A0 =C2=A0 int width =3D cast-&gt;bit_width;<br>
&gt; +=C2=A0 =C2=A0 /* If the destination value is 32, truncate the value, =
otherwise extend */<br>
&gt; +=C2=A0 =C2=A0 if (dest-&gt;bit_width !=3D value-&gt;bit_width) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bit_width =3D=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value_m =3D rvalue_truncate=
(c, locp, &amp;value_m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value_m =3D rvalue_extend(c=
, locp, &amp;value_m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 value_m =3D rvalue_materialize(c, locp, &amp;value_m);<=
br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_deposit_i&quot;, &amp;bit_wi=
dth, &quot;(&quot;, dest, &quot;, &quot;, dest, &quot;, &quot;);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &amp;value_m, &quot;, &quot;, index, &quot=
; * &quot;, &amp;width, &quot;, &quot;, &amp;width, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, index);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;value_m);<br>
&gt; +}<br>
&gt; +<br>
&gt; +HexValue gen_rextract_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0HexValue *source,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0int begin,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0int width) {<br>
&gt; +=C2=A0 =C2=A0 int bit_width =3D (source-&gt;bit_width =3D=3D 64) ? 64=
 : 32;<br>
&gt; +=C2=A0 =C2=A0 HexValue res =3D gen_tmp(c, locp, bit_width);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_extract_i&quot;, &amp;bit_wi=
dth, &quot;(&quot;, &amp;res);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;, &quot;, source, &quot;, &quot;, &a=
mp;begin, &quot;, &quot;, &amp;width, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, source);<br>
&gt; +=C2=A0 =C2=A0 return res;<br>
&gt; +}<br>
&gt; +<br>
&gt; +HexValue gen_extract_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 YYLTYPE *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexValue *source,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexValue *index,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HexExtract *extract) {<br>
<br>
What&#39;s the difference between this ant the gen_rextract_op above?<br>
<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, index-&gt;type =3D=3D IMMEDIATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Extract index m=
ust be immediate!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 int bit_width =3D (source-&gt;bit_width =3D=3D 64) ? 64=
 : 32;<br>
&gt; +=C2=A0 =C2=A0 const char *sign_prefix =3D (extract-&gt;is_unsigned) ?=
 &quot;&quot; : &quot;s&quot;;<br>
&gt; +=C2=A0 =C2=A0 int width =3D extract-&gt;bit_width;<br>
&gt; +=C2=A0 =C2=A0 HexValue res =3D gen_tmp(c, locp, bit_width);<br>
&gt; +=C2=A0 =C2=A0 res.is_unsigned =3D extract-&gt;is_unsigned;<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_&quot;, sign_prefix, &quot;e=
xtract_i&quot;, &amp;bit_width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(&quot;, &amp;res, &quot;, &quot;, =
source);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;, &quot;, index, &quot; * &quot;, &a=
mp;width, &quot;, &quot;, &amp;width, &quot;);\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Some extract operations have bit_width !=3D storage_=
bit_width */<br>
&gt; +=C2=A0 =C2=A0 if (extract-&gt;storage_bit_width &gt; bit_width) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue tmp =3D gen_tmp(c, locp, extract=
-&gt;storage_bit_width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp.is_unsigned =3D extract-&gt;is_unsign=
ed;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (extract-&gt;is_unsigned) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Extend unsigned */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_=
extu_i32_i64(&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;tmp, &qu=
ot;, &quot;, &amp;res, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Extend signed */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_=
ext_i32_i64(&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;tmp, &qu=
ot;, &quot;, &amp;res, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, &amp;res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D tmp;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, source);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, index);<br>
&gt; +=C2=A0 =C2=A0 return res;<br>
&gt; +}<br>
&gt; +<br>
&gt; +HexValue gen_read_creg(Context *c, YYLTYPE *locp, HexValue *reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, reg-&gt;type =3D=3D REGISTER, &quot;r=
eg must be a register!&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (reg-&gt;<a href=3D"http://reg.id" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">reg.id</a> &lt; &#39;a&#39;) {<br>
<br>
What is this check telling us?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue tmp =3D gen_tmp_value(c, locp, &=
quot;0&quot;, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *id =3D creg_str[(uint8_t)reg-=
&gt;<a href=3D"http://reg.id" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">reg.id</a>];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;READ_REG(&quot;, &amp;=
tmp, &quot;, &quot;, id, &quot;);\n&quot;);<br>
<br>
Change READ_REG to gen_read_reg - that&#39;s what the macro is.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tmp;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return *reg;<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
&gt; +/* Circular addressing mode with auto-increment */<br>
&gt; +void gen_circ_op(Context *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YYLTYPE=
 *locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValu=
e *addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValu=
e *increment,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValu=
e *modifier) {<br>
&gt; +=C2=A0 =C2=A0 HexValue increment_m =3D *increment;<br>
&gt; +=C2=A0 =C2=A0 HexValue cs =3D gen_tmp(c, locp, 32);<br>
&gt; +=C2=A0 =C2=A0 increment_m =3D rvalue_materialize(c, locp, &amp;increm=
ent_m);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;READ_REG(&quot;, &amp;cs, &quot;, HE=
X_REG_CS0 + MuN);\n&quot;);<br>
<br>
Change READ_REG to gen_read_reg<br>
<br>
&gt; +=C2=A0 =C2=A0 OUT(c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 locp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;gen_helper_fcircadd(&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;increment_m,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 modifier);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;, &quot;, &amp;cs, &quot;);\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;increment_m);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, modifier);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, &amp;cs);<br>
&gt; +}<br>
<br>
<br>
<br>
&gt; +void gen_load(Context *c, YYLTYPE *locp, HexValue *num, HexValue *siz=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_unsigned, He=
xValue *ea, HexValue *dst)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* Memop width is specified in the load macro */<br>
&gt; +=C2=A0 =C2=A0 int bit_width =3D (size-&gt;imm.value &gt; 4) ? 64 : 32=
;<br>
&gt; +=C2=A0 =C2=A0 const char *sign_suffix =3D (size-&gt;imm.value &gt; 4)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : ((is_unsigned) ? &quot;u&quot; : &quo=
t;s&quot;);<br>
&gt; +=C2=A0 =C2=A0 char size_suffix[4] =3D { 0 };<br>
&gt; +=C2=A0 =C2=A0 /* Create temporary variable (if not present) */<br>
&gt; +=C2=A0 =C2=A0 if (dst-&gt;type =3D=3D VARID) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO: this is a common pattern, the pa=
rser should be varid-aware.<br>
&gt; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 varid_allocate(c, locp, dst, bit_width, i=
s_unsigned);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 snprintf(size_suffix, 4, &quot;%&quot; PRIu64, size-&gt=
;imm.value * 8);<br>
&gt; +=C2=A0 =C2=A0 if (bit_width =3D=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *dst =3D rvalue_truncate(c, locp, dst);<b=
r>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *dst =3D rvalue_extend(c, locp, dst);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Why is the truncate/extend needed for the destination?<br>
<br>
&gt; +=C2=A0 =C2=A0 int var_id =3D find_variable(c, locp, ea);<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, var_id !=3D -1, &quot;Load variable m=
ust exist!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* We need to enforce the variable size */<br>
&gt; +=C2=A0 =C2=A0 ea-&gt;bit_width =3D g_array_index(c-&gt;inst.allocated=
, Var, var_id).bit_width;<br>
&gt; +=C2=A0 =C2=A0 if (ea-&gt;bit_width !=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ea =3D rvalue_truncate(c, locp, ea);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;if (insn-&gt;slot =3D=3D 0 &amp;&amp=
; pkt-&gt;pkt_has_store_s1) {\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;process_store(ctx, pkt, 1);\n&quot;)=
;<br>
<br>
Indent<br>
<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;}\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_qemu_ld&quot;, size_suffix, =
sign_suffix);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;(&quot;, dst, &quot;, &quot;, ea, &q=
uot;, 0);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* If the var in EA was truncated it is now a tmp HexVa=
lue, so free it. */<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, ea);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void gen_store(Context *c, YYLTYPE *locp, HexValue *num, HexValue<br>
&gt; *size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValue *ea, =
HexValue *src)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* Memop width is specified in the store macro */<br>
&gt; +=C2=A0 =C2=A0 int mem_width =3D size-&gt;imm.value;<br>
&gt; +=C2=A0 =C2=A0 /* Adjust operand bit width to memop bit width */<br>
&gt; +=C2=A0 =C2=A0 if (mem_width &lt; 8) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *src =3D rvalue_truncate(c, locp, src);<b=
r>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *src =3D rvalue_extend(c, locp, src);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Why is this needed?<br>
<br>
&gt; +=C2=A0 =C2=A0 assert(ea-&gt;type =3D=3D VARID);<br>
&gt; +=C2=A0 =C2=A0 int var_id =3D find_variable(c, locp, ea);<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, var_id !=3D -1, &quot;Load variable m=
ust exist!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* We need to enforce the variable size */<br>
&gt; +=C2=A0 =C2=A0 ea-&gt;bit_width =3D g_array_index(c-&gt;inst.allocated=
, Var, var_id).bit_width;<br>
&gt; +=C2=A0 =C2=A0 if (ea-&gt;bit_width !=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ea =3D rvalue_truncate(c, locp, ea);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
How can ea be not 32 bits?<br>
<br>
&gt; +=C2=A0 =C2=A0 *src =3D rvalue_materialize(c, locp, src);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;gen_store&quot;, &amp;mem_width, &qu=
ot;(cpu_env, &quot;, ea, &quot;, &quot;, src);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;, ctx, insn-&gt;slot);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, src);<br>
&gt; +=C2=A0 =C2=A0 /* If the var in ea was truncated it is now a tmp HexVa=
lue, so free it. */<br>
&gt; +=C2=A0 =C2=A0 rvalue_free(c, locp, ea);<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
&gt; +void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *l=
o,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HexValu=
e *dst, HexValue *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, hi-&gt;type =3D=3D IMMEDIATE &amp;&am=
p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hi-&gt;imm.type =3D=
=3D VALUE &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo-&gt;type =3D=3D IM=
MEDIATE &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo-&gt;imm.type =3D=
=3D VALUE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Range deposit n=
eeds immediate values!\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *val =3D rvalue_truncate(c, locp, val);<br>
&gt; +=C2=A0 =C2=A0 unsigned len =3D hi-&gt;imm.value + 1 - lo-&gt;imm.valu=
e;<br>
&gt; +=C2=A0 =C2=A0 HexValue tmp =3D gen_tmp(c, locp, 32);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_neg_i32(&quot;, &amp;tmp, &q=
uot;, &quot;, val, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_deposit_i32(&quot;, dst, &qu=
ot;, &quot;, dst, &quot;, &quot;, &amp;tmp, &quot;, &quot;);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, lo, &quot;, &quot;, &amp;len, &quot;);\n&q=
uot;);<br>
<br>
<br>
This doesn&#39;t match the C semantics of fSETBITS<br>
<br>
#define fSETBIT(N, DST, VAL) \<br>
=C2=A0 =C2=A0 do { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DST =3D (DST &amp; ~(1ULL &lt;&lt; (N))) | (((u=
int64_t)(VAL)) &lt;&lt; (N)); \<br>
=C2=A0 =C2=A0 } while (0)<br>
<br>
#define fGETBIT(N, SRC) (((SRC) &gt;&gt; N) &amp; 1)<br>
#define fSETBITS(HI, LO, DST, VAL) \<br>
=C2=A0 =C2=A0 do { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int j; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D LO; j &lt;=3D HI; j++) { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fSETBIT(j, DST, VAL); \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
=C2=A0 =C2=A0 } while (0)<br>
<br>
You need to put len copies of LSB(val), so emit something like this<br>
=C2=A0 =C2=A0 TCGv zero =3D tcg_const_tl(0);<br>
=C2=A0 =C2=A0 TCGv ones =3D tcg_const_tl(~0);<br>
=C2=A0 =C2=A0 tcg_gen_andi_tl(tmp, val, 1);<br>
=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_NE, tmp, tmp, zero, ones, zero);<=
br>
=C2=A0 =C2=A0 tcg_gen_deposit_tl(dst, dst, tmp, lo, len);<br>
=C2=A0 =C2=A0 tcg_temp_free(zero);<br>
=C2=A0 =C2=A0 tcg_temp_free(ones);<br>
<br>
<br>
<br>
&gt; +HexValue gen_rvalue_pow(Context *c, YYLTYPE *locp, HexValue *l,<br>
&gt; HexValue *r)<br>
<br>
Which instruction calls this?=C2=A0 I don&#39;t think there is one.=C2=A0 I=
f not, remove the POW token from the lexer and the associated rules from th=
e parser.<br>
<br>
<br>
<br>
&gt; +HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *v)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const char *bit_suffix =3D (v-&gt;bit_width =3D=3D 64) =
? &quot;i64&quot; : &quot;i32&quot;;<br>
&gt; +=C2=A0 =C2=A0 int bit_width =3D (v-&gt;bit_width =3D=3D 64) ? 64 : 32=
;<br>
&gt; +=C2=A0 =C2=A0 HexValue res;<br>
&gt; +=C2=A0 =C2=A0 res.is_unsigned =3D v-&gt;is_unsigned;<br>
&gt; +=C2=A0 =C2=A0 res.is_dotnew =3D false;<br>
&gt; +=C2=A0 =C2=A0 res.is_manual =3D false;<br>
&gt; +=C2=A0 =C2=A0 if (v-&gt;type =3D=3D IMMEDIATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.type =3D IMMEDIATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.imm.type =3D QEMU_TMP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res.imm.index =3D c-&gt;inst.qemu_tmp_cou=
nt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;int&quot;, &amp;bit_wi=
dth, &quot;_t &quot;, &amp;res, &quot; =3D abs(&quot;, v, &quot;);\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;inst.qemu_tmp_count++;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D gen_tmp(c, locp, bit_width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 HexValue zero =3D gen_tmp_value(c, locp, =
&quot;0&quot;, bit_width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_neg_&quot;, bi=
t_suffix, &quot;(&quot;, &amp;res, &quot;, &quot;, v, &quot;);\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;tcg_gen_movcond_i&quot=
;, &amp;bit_width);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;(TCG_COND_GT, &quot;, =
&amp;res, &quot;, &quot;, v, &quot;, &quot;, &amp;zero);<br>
<br>
tcg_gen_abs_i&lt;bit_width&gt;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT(c, locp, &quot;, &quot;, v, &quot;, &=
quot;, &amp;res, &quot;);\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, &amp;zero);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rvalue_free(c, locp, v);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return res;<br>
&gt; +}<br>
&gt; +<br>
&gt; +HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *v)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 yyassert(c, locp, v-&gt;bit_width &lt;=3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fbrev not imple=
mented for 64-bit integers!&quot;);<br>
&gt; +=C2=A0 =C2=A0 HexValue res =3D gen_tmp(c, locp, v-&gt;bit_width);<br>
&gt; +=C2=A0 =C2=A0 *v =3D rvalue_materialize(c, locp, v);<br>
&gt; +=C2=A0 =C2=A0 OUT(c, locp, &quot;gen_fbrev(&quot;, &amp;res, &quot;, =
&quot;, v, &quot;);\n&quot;);<br>
<br>
gen_helper_fbrev<br>
<br>
<br>
<br>
&gt; diff --git a/target/hexagon/idef-parser/parser-helpers.h<br>
&gt; b/target/hexagon/idef-parser/parser-helpers.h<br>
&gt; new file mode 100644<br>
<br>
&gt; +#define OUT(c, locp, ...) FOR_EACH((c), (locp), OUT_IMPL, __VA_ARGS__=
)<br>
<br>
You should be able to handle indenting here.=C2=A0 Unfortunately, many of t=
he C statements generated use multiple OUT invocations.<br>
Create two macros<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prints indentation, then the text=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used for beginning a line o=
f output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUT_CONTINUE=C2=A0 =C2=A0 =
=C2=A0 just print the text=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used for continuing =
a line<br>
<br>
&gt; diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build<b=
r>
&gt; index 329219463f..a2257d41a5 100644<br>
&gt; --- a/target/hexagon/meson.build<br>
&gt; +++ b/target/hexagon/meson.build<br>
&gt; @@ -183,7 +183,7 @@ idef_parser_input_generated =3D custom_target(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 command: [python, files(&#39;gen_idef_parser_funcs=
.py&#39;),<br>
&gt; semantics_generated, attribs_def, gen_tcg_h, &#39;@OUTPUT@&#39;],<br>
&gt;=C2=A0 )<br>
&gt; <br>
&gt; -idef_parser_input_generated_prep =3D custom_target(<br>
&gt; +preprocessed_idef_parser_input_generated =3D custom_target(<br>
<br>
Don&#39;t change the name of this here, use the name you want in the patch =
where it was introduced.<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Wed, 23 Jun 2021 21:10:39 -0700<br>
From: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" targ=
et=3D"_blank" rel=3D"noreferrer">vivek.kasireddy@intel.com</a>&gt;<br>
To: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noref=
errer">qemu-devel@nongnu.org</a><br>
Cc: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=
=3D"_blank" rel=3D"noreferrer">vivek.kasireddy@intel.com</a>&gt;, Gerd Hoff=
mann<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:kraxel@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">kraxel@redhat.com</a>&gt;, Marc-Andr=C3=A9 L=
ureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">marcandre.lureau@redhat.com</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dongwon Kim &lt;<a href=3D"mailto:dongwon.kim@i=
ntel.com" target=3D"_blank" rel=3D"noreferrer">dongwon.kim@intel.com</a>&gt=
;, Tina Zhang &lt;<a href=3D"mailto:tina.zhang@intel.com" target=3D"_blank"=
 rel=3D"noreferrer">tina.zhang@intel.com</a>&gt;<br>
Subject: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI<br>
Message-ID: &lt;<a href=3D"mailto:20210624041040.1250631-1-vivek.kasireddy@=
intel.com" target=3D"_blank" rel=3D"noreferrer">20210624041040.1250631-1-vi=
vek.kasireddy@intel.com</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8<br>
<br>
Why does Qemu need a new Wayland UI backend?<br>
The main reason why there needs to be a plain and simple Wayland backend<br=
>
for Qemu UI is to eliminate the Blit (aka GPU copy) that happens if using<b=
r>
a toolkit like GTK or SDL (because they use EGL). The Blit can be eliminate=
d<br>
by sharing the dmabuf fd -- associated with the Guest scanout buffer --<br>
directly with the Host compositor via the linux-dmabuf (unstable) protocol.=
<br>
Once properly integrated, it would be potentially possible to have the<br>
scanout buffer created by the Guest compositor be placed directly on a<br>
hardware plane on the Host thereby improving performance. Only Guest <br>
compositors that use multiple back buffers (at-least 1 front and 1 back)<br=
>
and virtio-gpu would benefit from this work.<br>
<br>
The patch(es) are still WIP and the only reason why I am sending them now<b=
r>
is to get feedback and see if anyone thinks this work is interesting. And,<=
br>
even after this work is complete, it is not meant to be merged and can be<b=
r>
used for performance testing purposes. Given Qemu UI&#39;s new direction, t=
he<br>
proper way to add new backends is to create a separate UI/display module<br=
>
that is part of the dbus/pipewire infrastructure that Marc-Andre is<br>
working on:<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg0433=
1.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.nongn=
u.org/archive/html/qemu-devel/2021-03/msg04331.html</a><br>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
" rel=3D"noreferrer">kraxel@redhat.com</a>&gt;<br>
Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank" rel=3D"noreferrer">marcandre.lureau@redhat.com</a>&gt;=
<br>
Cc: Dongwon Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com" target=3D"_bla=
nk" rel=3D"noreferrer">dongwon.kim@intel.com</a>&gt;<br>
Cc: Tina Zhang &lt;<a href=3D"mailto:tina.zhang@intel.com" target=3D"_blank=
" rel=3D"noreferrer">tina.zhang@intel.com</a>&gt;<br>
<br>
Vivek Kasireddy (1):<br>
=C2=A0 ui: Add a plain Wayland backend for Qemu UI<br>
<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++<br>
=C2=A0meson_options.txt |=C2=A0 =C2=A02 +<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 ++-<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 |=C2=A0 52 ++++++<br>
=C2=A0ui/wayland.c=C2=A0 =C2=A0 =C2=A0 | 402 ++++++++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A06 files changed, 516 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 ui/wayland.c<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Wed, 23 Jun 2021 21:10:40 -0700<br>
From: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" targ=
et=3D"_blank" rel=3D"noreferrer">vivek.kasireddy@intel.com</a>&gt;<br>
To: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noref=
errer">qemu-devel@nongnu.org</a><br>
Cc: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=
=3D"_blank" rel=3D"noreferrer">vivek.kasireddy@intel.com</a>&gt;, Gerd Hoff=
mann<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:kraxel@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">kraxel@redhat.com</a>&gt;<br>
Subject: [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI<br>
Message-ID: &lt;<a href=3D"mailto:20210624041040.1250631-2-vivek.kasireddy@=
intel.com" target=3D"_blank" rel=3D"noreferrer">20210624041040.1250631-2-vi=
vek.kasireddy@intel.com</a>&gt;<br>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
" rel=3D"noreferrer">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.=
com" target=3D"_blank" rel=3D"noreferrer">vivek.kasireddy@intel.com</a>&gt;=
<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++<br>
=C2=A0meson_options.txt |=C2=A0 =C2=A02 +<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 ++-<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 |=C2=A0 52 ++++++<br>
=C2=A0ui/wayland.c=C2=A0 =C2=A0 =C2=A0 | 402 ++++++++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A06 files changed, 516 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 ui/wayland.c<br>
<br>
diff --git a/configure b/configure<br>
index 8dcb9965b2..f6caaa6329 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -403,6 +403,7 @@ cfi_debug=3D&quot;false&quot;<br>
=C2=A0seccomp=3D&quot;auto&quot;<br>
=C2=A0glusterfs=3D&quot;auto&quot;<br>
=C2=A0gtk=3D&quot;auto&quot;<br>
+wayland=3D&quot;auto&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
=C2=A0gnutls=3D&quot;$default_feature&quot;<br>
=C2=A0nettle=3D&quot;$default_feature&quot;<br>
@@ -1372,6 +1373,10 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-gtk) gtk=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
+=C2=A0 --disable-wayland) wayland=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-wayland) wayland=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
=C2=A0 =C2=A0--tls-priority=3D*) tls_priority=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-gnutls) gnutls=3D&quot;no&quot;<br>
@@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is enabled i=
f available<br>
=C2=A0 =C2=A0sdl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDL UI<br>
=C2=A0 =C2=A0sdl-image=C2=A0 =C2=A0 =C2=A0 =C2=A0SDL Image support for icon=
s<br>
=C2=A0 =C2=A0gtk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk UI<br>
+=C2=A0 wayland=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Wayland UI<br>
=C2=A0 =C2=A0vte=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vte support=
 for the gtk UI<br>
=C2=A0 =C2=A0curses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses UI<br>
=C2=A0 =C2=A0iconv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0font glyph conve=
rsion support<br>
@@ -3616,6 +3622,11 @@ if $pkg_config gbm; then<br>
=C2=A0 =C2=A0 =C2=A0gbm=3D&quot;yes&quot;<br>
=C2=A0fi<br>
<br>
+if $pkg_config wayland-client; then<br>
+=C2=A0 =C2=A0 wayland_cflags=3D&quot;$($pkg_config --cflags wayland-client=
)&quot;<br>
+=C2=A0 =C2=A0 wayland_libs=3D&quot;$($pkg_config --libs wayland-client)&qu=
ot;<br>
+fi<br>
+<br>
=C2=A0if test &quot;$opengl&quot; !=3D &quot;no&quot; ; then<br>
=C2=A0 =C2=A0epoxy=3Dno<br>
=C2=A0 =C2=A0if $pkg_config epoxy; then<br>
@@ -5870,6 +5881,11 @@ if test &quot;$gbm&quot; =3D &quot;yes&quot; ; then<=
br>
=C2=A0 =C2=A0 =C2=A0echo &quot;GBM_CFLAGS=3D$gbm_cflags&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0fi<br>
<br>
+if test &quot;$wayland&quot; =3D &quot;enabled&quot; ; then<br>
+=C2=A0 =C2=A0 echo &quot;CONFIG_WAYLAND=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
+=C2=A0 =C2=A0 echo &quot;WAYLAND_LIBS=3D$wayland_libs&quot; &gt;&gt; $conf=
ig_host_mak<br>
+=C2=A0 =C2=A0 echo &quot;WAYLAND_CFLAGS=3D$wayland_cflags&quot; &gt;&gt; $=
config_host_mak<br>
+fi<br>
<br>
=C2=A0if test &quot;$avx2_opt&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_AVX2_OPT=3Dy&quot; &gt;&gt; $config_host_mak=
<br>
@@ -6436,6 +6452,7 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dkvm=3D$kvm -Dhax=3D$hax -Dwhpx=3D$whpx =
-Dhvf=3D$hvf -Dnvmm=3D$nvmm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dxen=3D$xen -Dxen_pci_passthrough=3D$xen=
_pci_passthrough -Dtcg=3D$tcg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcocoa=3D$cocoa -Dgtk=3D$gtk -Dmpath=3D$=
mpath -Dsdl=3D$sdl -Dsdl_image=3D$sdl_image \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dwayland=3D$wayland \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
diff --git a/meson.build b/meson.build<br>
index 626cf932c1..dbafe4a5d4 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -855,6 +855,29 @@ if gtkx11.found()<br>
=C2=A0 =C2=A0x11 =3D dependency(&#39;x11&#39;, method: &#39;pkg-config&#39;=
, required: gtkx11.found(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kwarg=
s: static_kwargs)<br>
=C2=A0endif<br>
+<br>
+wayland =3D not_found<br>
+if not get_option(&#39;wayland&#39;).auto()<br>
+=C2=A0 wlclientdep =3D dependency(&#39;wayland-client&#39;, version: &#39;=
&gt;=3D 1.18.90&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0method: &#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0required: get_option(&#39;wayland&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kwargs: static_kwargs)<br>
+=C2=A0 wlprotocolsdep =3D dependency(&#39;wayland-protocols&#39;, version:=
 &#39;&gt;=3D 1.14.91&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method: &#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 required: get_option(&#39;wayland&#39;),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs: static_kwargs)<br>
+<br>
+=C2=A0 if not wlprotocolsdep.found()<br>
+=C2=A0 =C2=A0 wlproto_dir =3D subproject(&#39;wayland-protocols&#39;).get_=
variable(&#39;wayland_protocols_srcdir&#39;)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 wlproto_dir =3D wlprotocolsdep.get_pkgconfig_variable(&#39;p=
kgdatadir&#39;)<br>
+=C2=A0 endif<br>
+<br>
+=C2=A0 wayland =3D declare_dependency(dependencies: [wlclientdep, wlprotoc=
olsdep],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compile_args: config_host[&#39;WAYLAN=
D_CFLAGS&#39;].split(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;WAYLAND_L=
IBS&#39;].split())<br>
+endif<br>
+<br>
=C2=A0vnc =3D not_found<br>
=C2=A0png =3D not_found<br>
=C2=A0jpeg =3D not_found<br>
@@ -1146,6 +1169,7 @@ if glusterfs.found()<br>
=C2=A0 =C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;,=
 glusterfs_iocb_has_stat)<br>
=C2=A0endif<br>
=C2=A0config_host_data.set(&#39;CONFIG_GTK&#39;, gtk.found())<br>
+config_host_data.set(&#39;CONFIG_WAYLAND&#39;, wayland.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBATTR&#39;, have_old_libattr)<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBCAP_NG&#39;, libcap_ng.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_EBPF&#39;, libbpf.found())<br>
@@ -2695,6 +2719,7 @@ summary_info +=3D {&#39;SDL support&#39;:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0sdl.found()}<br>
=C2=A0summary_info +=3D {&#39;SDL image support&#39;: sdl_image.found()}<br=
>
=C2=A0# TODO: add back version<br>
=C2=A0summary_info +=3D {&#39;GTK support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0g=
tk.found()}<br>
+summary_info +=3D {&#39;Wayland support&#39;:=C2=A0 =C2=A0wayland.found()}=
<br>
=C2=A0summary_info +=3D {&#39;pixman&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pixman.found()}<br>
=C2=A0# TODO: add back version<br>
=C2=A0summary_info +=3D {&#39;VTE support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_VTE&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 3d304cac96..86066c63c9 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -86,6 +86,8 @@ option(&#39;rbd&#39;, type : &#39;feature&#39;, value : &=
#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Ceph block device driver&#39;=
)<br>
=C2=A0option(&#39;gtk&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;GTK+ user interface&#39;)<br>
+option(&#39;wayland&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Wayland user interface&#39;)<=
br>
=C2=A0option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SDL user interface&#39;)<br>
=C2=A0option(&#39;sdl_image&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index 1052ca9c38..55e5967889 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -1057,6 +1057,20 @@<br>
=C2=A0{ &#39;struct&#39;=C2=A0 : &#39;DisplayEGLHeadless&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;=C2=A0 =C2=A0 : { &#39;*rendernode&#39; : &#39;s=
tr&#39; } }<br>
<br>
+##<br>
+# @DisplayWayland:<br>
+#<br>
+# Wayland display options.<br>
+#<br>
+# @rendernode: Which DRM render node should be used. Default is the first<=
br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available node on the ho=
st.<br>
+#<br>
+# Since: 3.1<br>
+#<br>
+##<br>
+{ &#39;struct&#39;=C2=A0 : &#39;DisplayWayland&#39;,<br>
+=C2=A0 &#39;data&#39;=C2=A0 =C2=A0 : { &#39;*rendernode&#39; : &#39;str&#3=
9; } }<br>
+<br>
=C2=A0 ##<br>
=C2=A0 # @DisplayGLMode:<br>
=C2=A0 #<br>
@@ -1108,6 +1122,8 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRI device. =
Graphical display need to be paired with<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VNC or Spice=
. (Since 3.1)<br>
=C2=A0#<br>
+# @wayland: The Wayland user interface.<br>
+#<br>
=C2=A0# @curses: Display video output via curses.=C2=A0 For graphics device=
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 models which support a text mode,=
 QEMU can display this<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output using a curses/ncurses int=
erface. Nothing is<br>
@@ -1128,7 +1144,7 @@<br>
=C2=A0{ &#39;enum&#39;=C2=A0 =C2=A0 : &#39;DisplayType&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;=C2=A0 =C2=A0 : [ &#39;default&#39;, &#39;none&#=
39;, &#39;gtk&#39;, &#39;sdl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;egl-head=
less&#39;, &#39;curses&#39;, &#39;cocoa&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;spice-app&#39=
;] }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wayland&#39;,=
 &#39;spice-app&#39;] }<br>
<br>
=C2=A0##<br>
=C2=A0# @DisplayOptions:<br>
@@ -1154,6 +1170,7 @@<br>
=C2=A0 =C2=A0&#39;discriminator&#39; : &#39;type&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;=C2=A0 =C2=A0 : { &#39;gtk&#39;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : &#39;DisplayGTK&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;curses&#=
39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &#39;DisplayCurses&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wayland&#39;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &#39;DisplayWayland&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;egl-head=
less&#39;=C2=A0 =C2=A0: &#39;DisplayEGLHeadless&#39;} }<br>
<br>
=C2=A0##<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index a3a187d633..fe255aec04 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -62,6 +62,58 @@ if config_host.has_key(&#39;CONFIG_OPENGL&#39;) and gbm.=
found()<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;egl-headless&#39; : egl_headless_ss}<br>
=C2=A0endif<br>
<br>
+wayland_scanner =3D find_program(&#39;wayland-scanner&#39;)<br>
+proto_sources =3D [<br>
+=C2=A0 [&#39;xdg-shell&#39;, &#39;stable&#39;, ],<br>
+=C2=A0 [&#39;fullscreen-shell&#39;, &#39;unstable&#39;, &#39;v1&#39;, ],<b=
r>
+=C2=A0 [&#39;linux-dmabuf&#39;, &#39;unstable&#39;, &#39;v1&#39;, ],<br>
+]<br>
+wayland_headers =3D []<br>
+wayland_proto_sources =3D []<br>
+<br>
+if wayland.found()<br>
+=C2=A0 foreach p: proto_sources<br>
+=C2=A0 =C2=A0 proto_name =3D p.get(0)<br>
+=C2=A0 =C2=A0 proto_stability =3D p.get(1)<br>
+<br>
+=C2=A0 =C2=A0 if proto_stability =3D=3D &#39;stable&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 output_base =3D proto_name<br>
+=C2=A0 =C2=A0 =C2=A0 input =3D files(join_paths(wlproto_dir, &#39;@0@/@1@/=
@2@.xml&#39;.format(proto_stability, proto_name, output_base)))<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 proto_version =3D p.get(2)<br>
+=C2=A0 =C2=A0 =C2=A0 output_base =3D &#39;@0@-@1@-@2@&#39;.format(proto_na=
me, proto_stability, proto_version)<br>
+=C2=A0 =C2=A0 =C2=A0 input =3D files(join_paths(wlproto_dir, &#39;@0@/@1@/=
@2@.xml&#39;.format(proto_stability, proto_name, output_base)))<br>
+=C2=A0 =C2=A0 endif<br>
+<br>
+=C2=A0 =C2=A0 wayland_headers +=3D custom_target(&#39;@0@ client header&#3=
9;.format(output_base),<br>
+=C2=A0 =C2=A0 =C2=A0 input: input,<br>
+=C2=A0 =C2=A0 =C2=A0 output: &#39;@0@-client-protocol.h&#39;.format(output=
_base),<br>
+=C2=A0 =C2=A0 =C2=A0 command: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_scanner,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;client-header&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 ], build_by_default: true<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 wayland_proto_sources +=3D custom_target(&#39;@0@ source&#39=
;.format(output_base),<br>
+=C2=A0 =C2=A0 =C2=A0 input: input,<br>
+=C2=A0 =C2=A0 =C2=A0 output: &#39;@0@-protocol.c&#39;.format(output_base),=
<br>
+=C2=A0 =C2=A0 =C2=A0 command: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_scanner,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;private-code&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 ], build_by_default: true<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 endforeach<br>
+endif<br>
+<br>
+if wayland.found()<br>
+=C2=A0 wayland_ss =3D ss.source_set()<br>
+=C2=A0 wayland_ss.add(when: wayland, if_true: files(&#39;wayland.c&#39;, &=
#39;xdg-shell-protocol.c&#39;, &#39;fullscreen-shell-unstable-v1-protocol.c=
&#39;,&#39;linux-dmabuf-unstable-v1-protocol.c&#39;))<br>
+=C2=A0 #wayland_ss.add(when: wayland, if_true: files(&#39;wayland.c&#39;),=
 [wayland_proto_sources])<br>
+=C2=A0 ui_modules +=3D {&#39;wayland&#39; : wayland_ss}<br>
+endif<br>
+<br>
=C2=A0if gtk.found()<br>
=C2=A0 =C2=A0softmmu_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#=
39;win32-kbd-hook.c&#39;))<br>
<br>
diff --git a/ui/wayland.c b/ui/wayland.c<br>
new file mode 100644<br>
index 0000000000..351d7e1146<br>
--- /dev/null<br>
+++ b/ui/wayland.c<br>
@@ -0,0 +1,402 @@<br>
+/*<br>
+ * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland co=
mpositors<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ * Mostly (boilerplate) based on <a href=3D"http://cgit.freedesktop.org/wa=
yland/weston/tree/clients/simple-dmabuf-egl.c" rel=3D"noreferrer noreferrer=
" target=3D"_blank">cgit.freedesktop.org/wayland/weston/tree/clients/simple=
-dmabuf-egl.c</a><br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;ui/console.h&quot;<br>
+#include &lt;wayland-client.h&gt;<br>
+#include &quot;xdg-shell-client-protocol.h&quot;<br>
+#include &quot;fullscreen-shell-unstable-v1-client-protocol.h&quot;<br>
+#include &quot;linux-dmabuf-unstable-v1-client-protocol.h&quot;<br>
+<br>
+#define MAX_BUFFERS 3<br>
+<br>
+typedef struct wayland_display {<br>
+=C2=A0 =C2=A0 struct wl_display *display;<br>
+=C2=A0 =C2=A0 struct wl_registry *registry;<br>
+=C2=A0 =C2=A0 struct wl_compositor *compositor;<br>
+=C2=A0 =C2=A0 struct xdg_wm_base *wm_base;<br>
+=C2=A0 =C2=A0 struct zwp_fullscreen_shell_v1 *fshell;<br>
+=C2=A0 =C2=A0 struct zwp_linux_dmabuf_v1 *dmabuf;<br>
+} wayland_display;<br>
+<br>
+typedef struct wayland_buffer {<br>
+=C2=A0 =C2=A0 QemuConsole *con;<br>
+=C2=A0 =C2=A0 QemuDmaBuf *dmabuf;<br>
+=C2=A0 =C2=A0 struct wl_buffer *buffer;<br>
+=C2=A0 =C2=A0 bool busy;<br>
+} wayland_buffer;<br>
+<br>
+typedef struct wayland_window {<br>
+=C2=A0 =C2=A0 wayland_display *display;<br>
+=C2=A0 =C2=A0 DisplayChangeListener dcl;<br>
+=C2=A0 =C2=A0 struct wl_surface *surface;<br>
+=C2=A0 =C2=A0 struct xdg_surface *xdg_surface;<br>
+=C2=A0 =C2=A0 struct xdg_toplevel *xdg_toplevel;<br>
+=C2=A0 =C2=A0 struct wl_callback *callback;<br>
+=C2=A0 =C2=A0 wayland_buffer buffers[MAX_BUFFERS];<br>
+=C2=A0 =C2=A0 wayland_buffer *new_buffer;<br>
+=C2=A0 =C2=A0 bool redraw;<br>
+} wayland_window;<br>
+<br>
+static const struct wl_callback_listener frame_listener;<br>
+<br>
+static void<br>
+xdg_surface_handle_configure(void *data, struct xdg_surface *surface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t serial)<br>
+{<br>
+=C2=A0 =C2=A0 xdg_surface_ack_configure(surface, serial);<br>
+}<br>
+<br>
+static const struct xdg_surface_listener xdg_surface_listener =3D {<br>
+=C2=A0 =C2=A0 xdg_surface_handle_configure,<br>
+};<br>
+<br>
+static void<br>
+xdg_toplevel_handle_configure(void *data, struct xdg_toplevel *toplevel,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t width, int32_t height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct wl_array *states)<br>
+{<br>
+}<br>
+<br>
+static void<br>
+xdg_toplevel_handle_close(void *data, struct xdg_toplevel *xdg_toplevel)<b=
r>
+{<br>
+}<br>
+<br>
+static const struct xdg_toplevel_listener xdg_toplevel_listener =3D {<br>
+=C2=A0 =C2=A0 xdg_toplevel_handle_configure,<br>
+=C2=A0 =C2=A0 xdg_toplevel_handle_close,<br>
+};<br>
+<br>
+static void wayland_refresh(DisplayChangeListener *dcl)<br>
+{<br>
+=C2=A0 =C2=A0 graphic_hw_update(dcl-&gt;con);<br>
+}<br>
+<br>
+static QEMUGLContext wayland_create_context(DisplayChangeListener *dcl,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QEMUGLParams *params)<br>
+{<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+static void wayland_destroy_context(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUGLContext ctx)<br>
+{<br>
+}<br>
+<br>
+static int wayland_make_context_current(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUGLCo=
ntext ctx)<br>
+{<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void wayland_scanout_disable(DisplayChangeListener *dcl)<br>
+{<br>
+}<br>
+<br>
+static void wayland_scanout_texture(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t backing_id,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool backing_y_0_top,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t backing_width=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t backing_heigh=
t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t x, uint32_t y=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t w, uint32_t h=
)<br>
+{<br>
+}<br>
+<br>
+static void wayland_release_dmabuf(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuDmaBuf *dmabuf)<br>
+{<br>
+}<br>
+<br>
+static void wayland_dispatch_handler(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_display *wldpy =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 wl_display_prepare_read(wldpy-&gt;display);<br>
+=C2=A0 =C2=A0 wl_display_read_events(wldpy-&gt;display);<br>
+=C2=A0 =C2=A0 wl_display_dispatch_pending(wldpy-&gt;display);<br>
+=C2=A0 =C2=A0 wl_display_flush(wldpy-&gt;display);<br>
+}<br>
+<br>
+static void wayland_window_redraw(void *data, struct wl_callback *callback=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t time)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_window *window =3D data;<br>
+=C2=A0 =C2=A0 QemuDmaBuf *dmabuf =3D window-&gt;new_buffer-&gt;dmabuf;<br>
+<br>
+=C2=A0 =C2=A0 if (callback) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wl_callback_destroy(callback);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 window-&gt;callback =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (!window-&gt;redraw) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 window-&gt;callback =3D wl_surface_frame(window-&gt;surface)=
;<br>
+=C2=A0 =C2=A0 wl_callback_add_listener(window-&gt;callback, &amp;frame_lis=
tener, window);<br>
+<br>
+=C2=A0 =C2=A0 wl_surface_attach(window-&gt;surface, window-&gt;new_buffer-=
&gt;buffer, 0, 0);<br>
+=C2=A0 =C2=A0 wl_surface_damage(window-&gt;surface, 0, 0, dmabuf-&gt;width=
, dmabuf-&gt;height);<br>
+=C2=A0 =C2=A0 wl_surface_commit(window-&gt;surface);<br>
+=C2=A0 =C2=A0 wl_display_flush(window-&gt;display-&gt;display);<br>
+=C2=A0 =C2=A0 window-&gt;redraw =3D false;<br>
+}<br>
+<br>
+static const struct wl_callback_listener frame_listener =3D {<br>
+=C2=A0 =C2=A0 wayland_window_redraw<br>
+};<br>
+<br>
+static void buffer_release(void *data, struct wl_buffer *buf)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_buffer *buffer =3D data;<br>
+=C2=A0 =C2=A0 QemuDmaBuf *dmabuf =3D buffer-&gt;dmabuf;<br>
+<br>
+=C2=A0 =C2=A0 dmabuf-&gt;fence_fd =3D -1;<br>
+=C2=A0 =C2=A0 graphic_hw_gl_block(buffer-&gt;con, false);<br>
+=C2=A0 =C2=A0 graphic_hw_gl_flushed(buffer-&gt;con);<br>
+=C2=A0 =C2=A0 buffer-&gt;busy =3D false;<br>
+=C2=A0 =C2=A0 wl_buffer_destroy(buf);<br>
+}<br>
+<br>
+static const struct wl_buffer_listener buffer_listener =3D {<br>
+=C2=A0 =C2=A0 buffer_release<br>
+};<br>
+<br>
+static wayland_buffer *window_next_buffer(wayland_window *window)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; MAX_BUFFERS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!window-&gt;buffers[i].busy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &amp;window-&gt;buffers[i=
];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+static void wayland_scanout_dmabuf(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuDmaBuf *dmabuf)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_window *window =3D container_of(dcl, wayland_window,=
 dcl);<br>
+=C2=A0 =C2=A0 wayland_display *display =3D window-&gt;display;<br>
+=C2=A0 =C2=A0 wayland_buffer *buffer =3D window_next_buffer(window);<br>
+=C2=A0 =C2=A0 struct zwp_linux_buffer_params_v1 *params;<br>
+<br>
+=C2=A0 =C2=A0 if (!buffer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t find free buffer\n=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 params =3D zwp_linux_dmabuf_v1_create_params(display-&gt;dma=
buf);<br>
+=C2=A0 =C2=A0 zwp_linux_buffer_params_v1_add(params, dmabuf-&gt;fd, 0, 0, =
dmabuf-&gt;stride,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 0);<br>
+=C2=A0 =C2=A0 buffer-&gt;buffer =3D zwp_linux_buffer_params_v1_create_imme=
d(params,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmabuf=
-&gt;width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmabuf=
-&gt;height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmabuf=
-&gt;fourcc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<br=
>
+=C2=A0 =C2=A0 zwp_linux_buffer_params_v1_destroy(params);<br>
+=C2=A0 =C2=A0 buffer-&gt;dmabuf =3D dmabuf;<br>
+=C2=A0 =C2=A0 buffer-&gt;con =3D window-&gt;dcl.con;<br>
+=C2=A0 =C2=A0 window-&gt;new_buffer =3D buffer;<br>
+=C2=A0 =C2=A0 dmabuf-&gt;fence_fd =3D 1;<br>
+=C2=A0 =C2=A0 wl_buffer_add_listener(buffer-&gt;buffer, &amp;buffer_listen=
er, buffer);<br>
+}<br>
+<br>
+static void wayland_scanout_flush(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t x, uint32_t y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t w, uint32_t h)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_window *window =3D container_of(dcl, wayland_window,=
 dcl);<br>
+=C2=A0 =C2=A0 static bool first =3D true;<br>
+<br>
+=C2=A0 =C2=A0 if (!window-&gt;new_buffer-&gt;busy &amp;&amp; !first) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 graphic_hw_gl_block(window-&gt;new_buffer-&gt;=
con, true);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 window-&gt;redraw =3D true;<br>
+=C2=A0 =C2=A0 if (first || !window-&gt;callback) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_window_redraw(window, NULL, 0);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 window-&gt;new_buffer-&gt;busy =3D true;<br>
+=C2=A0 =C2=A0 first =3D false;<br>
+}<br>
+<br>
+static const DisplayChangeListenerOps wayland_ops =3D {<br>
+=C2=A0 =C2=A0 .dpy_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;wayland&quot;,<br>
+=C2=A0 =C2=A0 .dpy_refresh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D wayland_refresh,<br>
+<br>
+=C2=A0 =C2=A0 .dpy_gl_ctx_create=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D wayland_cre=
ate_context,<br>
+=C2=A0 =C2=A0 .dpy_gl_ctx_destroy=C2=A0 =C2=A0 =C2=A0 =3D wayland_destroy_=
context,<br>
+=C2=A0 =C2=A0 .dpy_gl_ctx_make_current =3D wayland_make_context_current,<b=
r>
+<br>
+=C2=A0 =C2=A0 .dpy_gl_scanout_disable=C2=A0 =3D wayland_scanout_disable,<b=
r>
+=C2=A0 =C2=A0 .dpy_gl_scanout_texture=C2=A0 =3D wayland_scanout_texture,<b=
r>
+=C2=A0 =C2=A0 .dpy_gl_scanout_dmabuf=C2=A0 =C2=A0=3D wayland_scanout_dmabu=
f,<br>
+=C2=A0 =C2=A0 .dpy_gl_release_dmabuf=C2=A0 =C2=A0=3D wayland_release_dmabu=
f,<br>
+=C2=A0 =C2=A0 .dpy_gl_update=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D w=
ayland_scanout_flush,<br>
+};<br>
+<br>
+static void early_wayland_init(DisplayOptions *opts)<br>
+{<br>
+=C2=A0 =C2=A0 display_opengl =3D 1;<br>
+}<br>
+<br>
+static void<br>
+dmabuf_modifier(void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t format, u=
int32_t modifier_hi, uint32_t modifier_lo)<br>
+{<br>
+}<br>
+<br>
+static void<br>
+dmabuf_format(void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t format)<br>
+{<br>
+}<br>
+<br>
+static const struct zwp_linux_dmabuf_v1_listener dmabuf_listener =3D {<br>
+=C2=A0 =C2=A0 dmabuf_format,<br>
+=C2=A0 =C2=A0 dmabuf_modifier<br>
+};<br>
+<br>
+static void<br>
+xdg_wm_base_ping(void *data, struct xdg_wm_base *shell, uint32_t serial)<b=
r>
+{<br>
+=C2=A0 =C2=A0 xdg_wm_base_pong(shell, serial);<br>
+}<br>
+<br>
+static const struct xdg_wm_base_listener wm_base_listener =3D {<br>
+=C2=A0 =C2=A0 xdg_wm_base_ping,<br>
+};<br>
+<br>
+static void<br>
+registry_handle_global(void *data, struct wl_registry *registry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t id, const char *interface, uint32_t version)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_display *d =3D data;<br>
+<br>
+=C2=A0 =C2=A0 if (strcmp(interface, &quot;wl_compositor&quot;) =3D=3D 0) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;compositor =3D wl_registry_bind(registry=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, &amp=
;wl_compositor_interface, 1);<br>
+=C2=A0 =C2=A0 } else if (strcmp(interface, &quot;xdg_wm_base&quot;) =3D=3D=
 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;wm_base =3D wl_registry_bind(registry,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, &amp;xdg_wm_=
base_interface, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xdg_wm_base_add_listener(d-&gt;wm_base, &amp;wm=
_base_listener, d);<br>
+=C2=A0 =C2=A0 } else if (strcmp(interface, &quot;zwp_fullscreen_shell_v1&q=
uot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;fshell =3D wl_registry_bind(registry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, &amp;zwp_fullscree=
n_shell_v1_interface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1);<br>
+=C2=A0 =C2=A0 } else if (strcmp(interface, &quot;zwp_linux_dmabuf_v1&quot;=
) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;dmabuf =3D wl_registry_bind(registry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, &amp;zwp_linux_dma=
buf_v1_interface, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0zwp_linux_dmabuf_v1_add_listener(d-&gt;dmabuf, =
&amp;dmabuf_listener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void<br>
+registry_handle_global_remove(void *data, struct wl_registry *registry,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t name)<br>
+{<br>
+}<br>
+<br>
+static const struct wl_registry_listener registry_listener =3D {<br>
+=C2=A0 =C2=A0 registry_handle_global,<br>
+=C2=A0 =C2=A0 registry_handle_global_remove<br>
+};<br>
+<br>
+static wayland_display *create_display(void)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_display *display;<br>
+<br>
+=C2=A0 =C2=A0 display =3D g_new0(wayland_display, 1);<br>
+=C2=A0 =C2=A0 display-&gt;display =3D wl_display_connect(NULL);<br>
+=C2=A0 =C2=A0 assert(display-&gt;display);<br>
+<br>
+=C2=A0 =C2=A0 display-&gt;registry =3D wl_display_get_registry(display-&gt=
;display);<br>
+=C2=A0 =C2=A0 wl_registry_add_listener(display-&gt;registry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;registry_listener, display);<br>
+=C2=A0 =C2=A0 wl_display_roundtrip(display-&gt;display);<br>
+=C2=A0 =C2=A0 if (display-&gt;dmabuf =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;No zwp_linux_dmabuf global\n=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return display;<br>
+}<br>
+<br>
+static wayland_window *create_window(wayland_display *display)<br>
+{<br>
+=C2=A0 =C2=A0 wayland_window *window;<br>
+<br>
+=C2=A0 =C2=A0 window =3D g_new0(wayland_window, 1);<br>
+=C2=A0 =C2=A0 window-&gt;display =3D display;<br>
+=C2=A0 =C2=A0 window-&gt;surface =3D wl_compositor_create_surface(display-=
&gt;compositor);<br>
+<br>
+=C2=A0 =C2=A0 if (display-&gt;wm_base) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 window-&gt;xdg_surface =3D xdg_wm_base_get_xdg=
_surface(display-&gt;wm_base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0window-&gt;surface);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(window-&gt;xdg_surface);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xdg_surface_add_listener(window-&gt;xdg_surfac=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;xdg_surface_listener, win=
dow);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 window-&gt;xdg_toplevel =3D xdg_surface_get_to=
plevel(window-&gt;xdg_surface);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(window-&gt;xdg_toplevel);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xdg_toplevel_add_listener(window-&gt;xdg_tople=
vel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;xdg_toplevel_listener, w=
indow);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xdg_toplevel_set_title(window-&gt;xdg_toplevel=
, &quot;qemu-wayland&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wl_surface_commit(window-&gt;surface);<br>
+=C2=A0 =C2=A0 } else if (display-&gt;fshell) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 zwp_fullscreen_shell_v1_present_surface(displa=
y-&gt;fshell,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0window-&gt;surface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NULL);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(0);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return window;<br>
+}<br>
+<br>
+static void wayland_init(DisplayState *ds, DisplayOptions *opts)<br>
+{<br>
+=C2=A0 =C2=A0 QemuConsole *con;<br>
+=C2=A0 =C2=A0 wayland_display *wldpy;<br>
+=C2=A0 =C2=A0 wayland_window *wlwdw;<br>
+=C2=A0 =C2=A0 int idx;<br>
+<br>
+=C2=A0 =C2=A0 wldpy =3D create_display();<br>
+=C2=A0 =C2=A0 for (idx =3D 0;; idx++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con =3D qemu_console_lookup_by_index(idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!con || !qemu_console_is_graphic(con)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlwdw =3D create_window(wldpy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlwdw-&gt;dcl.con =3D con;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlwdw-&gt;dcl.ops =3D &amp;wayland_ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 register_displaychangelistener(&amp;wlwdw-&gt;=
dcl);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 wl_display_roundtrip(wldpy-&gt;display);<br>
+=C2=A0 =C2=A0 qemu_set_fd_handler(wl_display_get_fd(wldpy-&gt;display),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 wayland_dispatch_handler, NULL, wldpy);<br>
+}<br>
+<br>
+static QemuDisplay qemu_display_wayland =3D {<br>
+=C2=A0 =C2=A0 .type=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DISPLAY_TYPE_WAYLAND,<br=
>
+=C2=A0 =C2=A0 .early_init =3D early_wayland_init,<br>
+=C2=A0 =C2=A0 .init=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D wayland_init,<br>
+};<br>
+<br>
+static void register_wayland(void)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_display_register(&amp;qemu_display_wayland);<br>
+}<br>
+<br>
+type_init(register_wayland);<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Wed, 23 Jun 2021 21:30:46 -0700 (PDT)<br>
From: <a href=3D"mailto:no-reply@patchew.org" target=3D"_blank" rel=3D"nore=
ferrer">no-reply@patchew.org</a><br>
To: <a href=3D"mailto:vivek.kasireddy@intel.com" target=3D"_blank" rel=3D"n=
oreferrer">vivek.kasireddy@intel.com</a><br>
Cc: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noref=
errer">qemu-devel@nongnu.org</a>, <a href=3D"mailto:marcandre.lureau@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">marcandre.lureau@redhat.com</a>,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:dongwon.kim@intel.com" target=
=3D"_blank" rel=3D"noreferrer">dongwon.kim@intel.com</a>, <a href=3D"mailto=
:tina.zhang@intel.com" target=3D"_blank" rel=3D"noreferrer">tina.zhang@inte=
l.com</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:vivek.kasireddy@intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vivek.kasireddy@intel.com</a>, <a href=
=3D"mailto:kraxel@redhat.com" target=3D"_blank" rel=3D"noreferrer">kraxel@r=
edhat.com</a><br>
Subject: Re: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI<br>
Message-ID: &lt;162450904493.16025.10486341594793128250@7c66fb7bc3ab&gt;<br=
>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
Patchew URL: <a href=3D"https://patchew.org/QEMU/20210624041040.1250631-1-v=
ivek.kasireddy@intel.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://patchew.org/QEMU/20210624041040.1250631-1-vivek.kasireddy@intel.com=
/</a><br>
<br>
<br>
<br>
Hi,<br>
<br>
This series seems to have some coding style problems. See output below for<=
br>
more information:<br>
<br>
Type: series<br>
Message-id: <a href=3D"mailto:20210624041040.1250631-1-vivek.kasireddy@inte=
l.com" target=3D"_blank" rel=3D"noreferrer">20210624041040.1250631-1-vivek.=
kasireddy@intel.com</a><br>
Subject: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI<br>
<br>
=3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
#!/bin/bash<br>
git rev-parse base &gt; /dev/null || exit 0<br>
git config --local diff.renamelimit 0<br>
git config --local diff.renames True<br>
git config --local diff.algorithm histogram<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> --mailback base..<br>
=3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
<br>
Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384<br>
From <a href=3D"https://github.com/patchew-project/qemu" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://github.com/patchew-project/qemu</a><b=
r>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:20210624041040.1250631-1-vivek.kasireddy@intel.com" target=3D"_blank" rel=
=3D"noreferrer">20210624041040.1250631-1-vivek.kasireddy@intel.com</a> -&gt=
; patchew/<a href=3D"mailto:20210624041040.1250631-1-vivek.kasireddy@intel.=
com" target=3D"_blank" rel=3D"noreferrer">20210624041040.1250631-1-vivek.ka=
sireddy@intel.com</a><br>
Switched to a new branch &#39;test&#39;<br>
547ce45 ui: Add a plain Wayland backend for Qemu UI<br>
<br>
=3D=3D=3D OUTPUT BEGIN =3D=3D=3D<br>
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?<b=
r>
#260: <br>
new file mode 100644<br>
<br>
WARNING: line over 80 characters<br>
#266: FILE: ui/wayland.c:2:<br>
+ * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland co=
mpositors<br>
<br>
ERROR: use QEMU instead of Qemu or QEmu<br>
#266: FILE: ui/wayland.c:2:<br>
+ * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland co=
mpositors<br>
<br>
ERROR: line over 90 characters<br>
#271: FILE: ui/wayland.c:7:<br>
+ * Mostly (boilerplate) based on <a href=3D"http://cgit.freedesktop.org/wa=
yland/weston/tree/clients/simple-dmabuf-egl.c" rel=3D"noreferrer noreferrer=
" target=3D"_blank">cgit.freedesktop.org/wayland/weston/tree/clients/simple=
-dmabuf-egl.c</a><br>
<br>
ERROR: code indent should never use tabs<br>
#318: FILE: ui/wayland.c:54:<br>
+^I^I^I=C2=A0 =C2=A0 =C2=A0uint32_t serial)$<br>
<br>
ERROR: code indent should never use tabs<br>
#329: FILE: ui/wayland.c:65:<br>
+^I^I^I=C2=A0 =C2=A0 =C2=A0 int32_t width, int32_t height,$<br>
<br>
ERROR: code indent should never use tabs<br>
#330: FILE: ui/wayland.c:66:<br>
+^I^I^I=C2=A0 =C2=A0 =C2=A0 struct wl_array *states)$<br>
<br>
ERROR: code indent should never use tabs<br>
#459: FILE: ui/wayland.c:195:<br>
+^Ierror_report(&quot;Can&#39;t find free buffer\n&quot;);$<br>
<br>
ERROR: Error messages should not contain newlines<br>
#459: FILE: ui/wayland.c:195:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t find free buffer\n=
&quot;);<br>
<br>
ERROR: code indent should never use tabs<br>
#519: FILE: ui/wayland.c:255:<br>
+^I^I uint32_t format, uint32_t modifier_hi, uint32_t modifier_lo)$<br>
<br>
ERROR: code indent should never use tabs<br>
#552: FILE: ui/wayland.c:288:<br>
+^I^I^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, &a=
mp;wl_compositor_interface, 1);$<br>
<br>
ERROR: code indent should never use tabs<br>
#554: FILE: ui/wayland.c:290:<br>
+^Id-&gt;wm_base =3D wl_registry_bind(registry,$<br>
<br>
ERROR: code indent should never use tabs<br>
#555: FILE: ui/wayland.c:291:<br>
+^I^I^I^I=C2=A0 =C2=A0 =C2=A0 id, &amp;xdg_wm_base_interface, 1);$<br>
<br>
ERROR: code indent should never use tabs<br>
#556: FILE: ui/wayland.c:292:<br>
+^Ixdg_wm_base_add_listener(d-&gt;wm_base, &amp;wm_base_listener, d);$<br>
<br>
ERROR: code indent should never use tabs<br>
#558: FILE: ui/wayland.c:294:<br>
+^Id-&gt;fshell =3D wl_registry_bind(registry,$<br>
<br>
ERROR: code indent should never use tabs<br>
#559: FILE: ui/wayland.c:295:<br>
+^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, &amp;zwp_fullscreen_shell_v1_interfac=
e,$<br>
<br>
ERROR: code indent should never use tabs<br>
#560: FILE: ui/wayland.c:296:<br>
+^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01);$<br>
<br>
ERROR: code indent should never use tabs<br>
#562: FILE: ui/wayland.c:298:<br>
+^Id-&gt;dmabuf =3D wl_registry_bind(registry,$<br>
<br>
ERROR: code indent should never use tabs<br>
#563: FILE: ui/wayland.c:299:<br>
+^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, &amp;zwp_linux_dmabuf_v1_interface, 3=
);$<br>
<br>
ERROR: code indent should never use tabs<br>
#564: FILE: ui/wayland.c:300:<br>
+^Izwp_linux_dmabuf_v1_add_listener(d-&gt;dmabuf, &amp;dmabuf_listener,$<br=
>
<br>
ERROR: code indent should never use tabs<br>
#565: FILE: ui/wayland.c:301:<br>
+^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d);$<br>
<br>
ERROR: code indent should never use tabs<br>
#593: FILE: ui/wayland.c:329:<br>
+^Ierror_report(&quot;No zwp_linux_dmabuf global\n&quot;);$<br>
<br>
ERROR: Error messages should not contain newlines<br>
#593: FILE: ui/wayland.c:329:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;No zwp_linux_dmabuf global\n=
&quot;);<br>
<br>
ERROR: code indent should never use tabs<br>
#594: FILE: ui/wayland.c:330:<br>
+^Iexit(1);$<br>
<br>
ERROR: code indent should never use tabs<br>
#609: FILE: ui/wayland.c:345:<br>
+^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 window-&gt;surface);$<br>
<br>
ERROR: code indent should never use tabs<br>
#621: FILE: ui/wayland.c:357:<br>
+^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 windo=
w-&gt;surface,$<br>
<br>
ERROR: line over 90 characters<br>
#622: FILE: ui/wayland.c:358:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,<br>
<br>
ERROR: code indent should never use tabs<br>
#622: FILE: ui/wayland.c:358:<br>
+^I^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ZWP_FULLSCREEN_SHELL_V1_PRESENT_M=
ETHOD_DEFAULT,$<br>
<br>
ERROR: code indent should never use tabs<br>
#623: FILE: ui/wayland.c:359:<br>
+^I^I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);$<br>
<br>
total: 27 errors, 2 warnings, 607 lines checked<br>
<br>
Commit 547ce45b800d (ui: Add a plain Wayland backend for Qemu UI) has style=
 problems, please review.=C2=A0 If any of these errors<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
=3D=3D=3D OUTPUT END =3D=3D=3D<br>
<br>
Test command exited with code: 1<br>
<br>
<br>
The full log is available at<br>
<a href=3D"http://patchew.org/logs/20210624041040.1250631-1-vivek.kasireddy=
@intel.com/testing.checkpatch/?type=3Dmessage" rel=3D"noreferrer noreferrer=
" target=3D"_blank">http://patchew.org/logs/20210624041040.1250631-1-vivek.=
kasireddy@intel.com/testing.checkpatch/?type=3Dmessage</a>.<br>
---<br>
Email generated automatically by Patchew [<a href=3D"https://patchew.org/" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchew.org/</a>].<=
br>
Please send your feedback to <a href=3D"mailto:patchew-devel@redhat.com" ta=
rget=3D"_blank" rel=3D"noreferrer">patchew-devel@redhat.com</a><br>
<br>
------------------------------<br>
<br>
Message: 5<br>
Date: Thu, 24 Jun 2021 13:29:32 +1000<br>
From: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au" targe=
t=3D"_blank" rel=3D"noreferrer">david@gibson.dropbear.id.au</a>&gt;<br>
To: &quot;Bruno Larsen (billionai)&quot; &lt;<a href=3D"mailto:bruno.larsen=
@eldorado.org.br" target=3D"_blank" rel=3D"noreferrer">bruno.larsen@eldorad=
o.org.br</a>&gt;<br>
Cc: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noref=
errer">qemu-devel@nongnu.org</a>, <a href=3D"mailto:clg@kaod.org" target=3D=
"_blank" rel=3D"noreferrer">clg@kaod.org</a>, Richard Henderson<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>&=
gt;, <a href=3D"mailto:fernando.valle@eldorado.org.br" target=3D"_blank" re=
l=3D"noreferrer">fernando.valle@eldorado.org.br</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:matheus.ferst@eldorado.org.br=
" target=3D"_blank" rel=3D"noreferrer">matheus.ferst@eldorado.org.br</a>, <=
a href=3D"mailto:farosas@linux.ibm.com" target=3D"_blank" rel=3D"noreferrer=
">farosas@linux.ibm.com</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:lucas.araujo@eldorado.org.br"=
 target=3D"_blank" rel=3D"noreferrer">lucas.araujo@eldorado.org.br</a>, <a =
href=3D"mailto:luis.pires@eldorado.org.br" target=3D"_blank" rel=3D"norefer=
rer">luis.pires@eldorado.org.br</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-ppc@nongnu.org" target=
=3D"_blank" rel=3D"noreferrer">qemu-ppc@nongnu.org</a>, Greg Kurz &lt;<a hr=
ef=3D"mailto:groug@kaod.org" target=3D"_blank" rel=3D"noreferrer">groug@kao=
d.org</a>&gt;<br>
Subject: Re: [PATCH v2 03/10] target/ppc: Push real-mode handling into<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ppc_radix64_xlate<br>
Message-ID: &lt;YNP8HPVUgSlFkyAm@yekko&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
On Mon, Jun 21, 2021 at 09:51:08AM -0300, Bruno Larsen (billionai) wrote:<b=
r>
&gt; From: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro=
.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>=
&gt;<br>
&gt; <br>
&gt; This removes some incomplete duplication between<br>
&gt; ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.<br>
&gt; The former was correct wrt SPR_HRMOR and the latter was not.<br>
&gt; <br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linar=
o.org</a>&gt;<br>
<br>
Applied to ppc-for-6.1, thanks.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------=
------<br>
&gt;=C2=A0 1 file changed, 34 insertions(+), 43 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c<br>
&gt; index 1c707d387d..dd5ae69052 100644<br>
&gt; --- a/target/ppc/mmu-radix64.c<br>
&gt; +++ b/target/ppc/mmu-radix64.c<br>
&gt; @@ -465,7 +465,6 @@ static int ppc_radix64_process_scoped_xlate(PowerP=
CCPU *cpu,<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool relocation,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr *raddr, int *psizep, int *p=
rotp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool guest_visible)<br>
&gt;=C2=A0 {<br>
&gt; @@ -474,6 +473,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vad=
dr eaddr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ppc_v3_pate_t pate;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int psize, prot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr g_raddr;<br>
&gt; +=C2=A0 =C2=A0 bool relocation;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(!(msr_hv &amp;&amp; cpu-&gt;vhyp));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr=
_ir : msr_dr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* HV or virtual hypervisor Real Mode Access */<br>
&gt; +=C2=A0 =C2=A0 if (!relocation &amp;&amp; (msr_hv || cpu-&gt;vhyp)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* In real mode top 4 effective addr bits=
 (mostly) ignored */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *raddr =3D eaddr &amp; 0x0FFFFFFFFFFFFFFF=
ULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* In HV mode, add HRMOR if top EA bit is=
 clear */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msr_hv || !env-&gt;has_hv_mode) {<br>
<br>
Not in scope, because this is a code motion, but that test looks<br>
bogus.=C2=A0 If we don&#39;t have an HV mode, we won&#39;t have an HRMOR ei=
ther.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(eaddr &gt;&gt; 63)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *raddr |=3D e=
nv-&gt;spr[SPR_HRMOR];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *protp =3D PAGE_READ | PAGE_WRITE | PAGE_=
EXEC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *psizep =3D TARGET_PAGE_BITS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Check UPRT (we avoid the check in real mode to =
deal with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* transitional states during kexec.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (guest_visible &amp;&amp; !ppc64_use_proc_tbl(cpu)) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;LPCR:UPRT not set in radix mode ! LPCR=3D&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 TARGET_FMT_lx &quot;\n&quot;, env-&gt;spr[SPR_LPCR]);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Virtual Mode Access - get the fully qualified a=
ddress */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!ppc_radix64_get_fully_qualified_addr(&amp;cpu=
-&gt;env, eaddr, &amp;lpid, &amp;pid)) {<br>
&gt; @@ -559,43 +589,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu=
, vaddr eaddr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access=
_type, int mmu_idx)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>
&gt; -=C2=A0 =C2=A0 CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int page_size, prot;<br>
&gt; -=C2=A0 =C2=A0 bool relocation;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr raddr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 assert(!(msr_hv &amp;&amp; cpu-&gt;vhyp));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr=
_ir : msr_dr);<br>
&gt; -=C2=A0 =C2=A0 /* HV or virtual hypervisor Real Mode Access */<br>
&gt; -=C2=A0 =C2=A0 if (!relocation &amp;&amp; (msr_hv || cpu-&gt;vhyp)) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* In real mode top 4 effective addr bits=
 (mostly) ignored */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 raddr =3D eaddr &amp; 0x0FFFFFFFFFFFFFFFU=
LL;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* In HV mode, add HRMOR if top EA bit is=
 clear */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msr_hv || !env-&gt;has_hv_mode) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(eaddr &gt;&gt; 63)) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raddr |=3D en=
v-&gt;spr[SPR_HRMOR];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tlb_set_page(cs, eaddr &amp; TARGET_PAGE_=
MASK, raddr &amp; TARGET_PAGE_MASK,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TARGET_PAGE_SIZE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Check UPRT (we avoid the check in real mode to =
deal with<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* transitional states during kexec.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 if (!ppc64_use_proc_tbl(cpu)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;LPCR:UPRT not set in radix mode ! LPCR=3D&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 TARGET_FMT_lx &quot;\n&quot;, env-&gt;spr[SPR_LPCR]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Translate eaddr to raddr (where raddr is addr q=
emu needs for access) */<br>
&gt; -=C2=A0 =C2=A0 if (ppc_radix64_xlate(cpu, eaddr, access_type, relocati=
on, &amp;raddr,<br>
&gt; +=C2=A0 =C2=A0 if (ppc_radix64_xlate(cpu, eaddr, access_type, &amp;rad=
dr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;page_size, &amp;prot, true)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -607,18 +605,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu=
, vaddr eaddr,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_u=
long eaddr)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int psize, prot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr raddr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /* Handle Real Mode */<br>
&gt; -=C2=A0 =C2=A0 if ((msr_dr =3D=3D 0) &amp;&amp; (msr_hv || cpu-&gt;vhy=
p)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* In real mode top 4 effective addr bits=
 (mostly) ignored */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return eaddr &amp; 0x0FFFFFFFFFFFFFFFULL;=
<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &amp;raddr=
, &amp;psize,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;prot, false)) {<br>
&gt; +=C2=A0 =C2=A0 if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;r=
addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;psize, &amp;prot, false)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
<br>
-- <br>
David Gibson=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | I&#39;ll have my music baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" rel=3D"noreferrer norefer=
rer" target=3D"_blank">gibson.dropbear.id.au</a>=C2=A0 | minimalist, thank =
you.=C2=A0 NOT _the_ _other_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://www.ozlabs.org/~dgibson</a><br>
-------------- next part --------------<br>
A non-text attachment was scrubbed...<br>
Name: signature.asc<br>
Type: application/pgp-signature<br>
Size: 833 bytes<br>
Desc: not available<br>
URL: &lt;<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/attach=
ments/20210624/1d706e70/attachment.sig" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://lists.nongnu.org/archive/html/qemu-devel/attachments/2=
0210624/1d706e70/attachment.sig</a>&gt;<br>
<br>
------------------------------<br>
<br>
Message: 6<br>
Date: Thu, 24 Jun 2021 13:19:28 +1000<br>
From: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au" targe=
t=3D"_blank" rel=3D"noreferrer">david@gibson.dropbear.id.au</a>&gt;<br>
To: &quot;Bruno Larsen (billionai)&quot; &lt;<a href=3D"mailto:bruno.larsen=
@eldorado.org.br" target=3D"_blank" rel=3D"noreferrer">bruno.larsen@eldorad=
o.org.br</a>&gt;<br>
Cc: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noref=
errer">qemu-devel@nongnu.org</a>, <a href=3D"mailto:clg@kaod.org" target=3D=
"_blank" rel=3D"noreferrer">clg@kaod.org</a>, Richard Henderson<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>&=
gt;, <a href=3D"mailto:fernando.valle@eldorado.org.br" target=3D"_blank" re=
l=3D"noreferrer">fernando.valle@eldorado.org.br</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:matheus.ferst@eldorado.org.br=
" target=3D"_blank" rel=3D"noreferrer">matheus.ferst@eldorado.org.br</a>, <=
a href=3D"mailto:farosas@linux.ibm.com" target=3D"_blank" rel=3D"noreferrer=
">farosas@linux.ibm.com</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:lucas.araujo@eldorado.org.br"=
 target=3D"_blank" rel=3D"noreferrer">lucas.araujo@eldorado.org.br</a>, <a =
href=3D"mailto:luis.pires@eldorado.org.br" target=3D"_blank" rel=3D"norefer=
rer">luis.pires@eldorado.org.br</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-ppc@nongnu.org" target=
=3D"_blank" rel=3D"noreferrer">qemu-ppc@nongnu.org</a>, Greg Kurz &lt;<a hr=
ef=3D"mailto:groug@kaod.org" target=3D"_blank" rel=3D"noreferrer">groug@kao=
d.org</a>&gt;<br>
Subject: Re: [PATCH v2 02/10] target/ppc: Use MMUAccessType with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *_handle_mmu_fault<br>
Message-ID: &lt;YNP5wNLe/7OqMMaT@yekko&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
On Mon, Jun 21, 2021 at 09:51:07AM -0300, Bruno Larsen (billionai) wrote:<b=
r>
&gt; From: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro=
.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>=
&gt;<br>
&gt; <br>
&gt; These changes were waiting until we didn&#39;t need to match<br>
&gt; the function type of PowerPCCPUClass.handle_mmu_fault.<br>
&gt; <br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linar=
o.org</a>&gt;<br>
<br>
Applied to ppc-for-6.1, thanks.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/ppc/mmu-hash32.c=C2=A0 | 7 ++-----<br>
&gt;=C2=A0 target/ppc/mmu-hash32.h=C2=A0 | 4 ++--<br>
&gt;=C2=A0 target/ppc/mmu-hash64.c=C2=A0 | 6 +-----<br>
&gt;=C2=A0 target/ppc/mmu-hash64.h=C2=A0 | 4 ++--<br>
&gt;=C2=A0 target/ppc/mmu-radix64.c | 7 ++-----<br>
&gt;=C2=A0 target/ppc/mmu-radix64.h | 4 ++--<br>
&gt;=C2=A0 6 files changed, 11 insertions(+), 21 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c<br>
&gt; index 9f0a497657..8f19b43e47 100644<br>
&gt; --- a/target/ppc/mmu-hash32.c<br>
&gt; +++ b/target/ppc/mmu-hash32.c<br>
&gt; @@ -415,8 +415,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr=
, ppc_hash_pte32_t pte,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return (rpn &amp; ~mask) | (eaddr &amp; mask);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx)<br>
&gt; +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int m=
mu_idx)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
&gt; @@ -425,11 +425,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, =
vaddr eaddr, int rwx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ppc_hash_pte32_t pte;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int prot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int need_prot;<br>
&gt; -=C2=A0 =C2=A0 MMUAccessType access_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr raddr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D =
2));<br>
&gt; -=C2=A0 =C2=A0 access_type =3D rwx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 need_prot =3D prot_for_access_type(access_type);<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* 1. Handle real mode accesses */<br>
&gt; diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h<br>
&gt; index 898021f0d8..30e35718a7 100644<br>
&gt; --- a/target/ppc/mmu-hash32.h<br>
&gt; +++ b/target/ppc/mmu-hash32.h<br>
&gt; @@ -5,8 +5,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);<br>
&gt;=C2=A0 hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ul=
ong addr);<br>
&gt; -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int r=
w,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx);<br>
&gt; +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int m=
mu_idx);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Segment register definitions<br>
&gt; diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c<br>
&gt; index 708dffc31b..2febd369b1 100644<br>
&gt; --- a/target/ppc/mmu-hash64.c<br>
&gt; +++ b/target/ppc/mmu-hash64.c<br>
&gt; @@ -874,7 +874,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_sl=
b_t *slb)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int rwx, int mmu_idx)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int m=
mu_idx)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
&gt; @@ -884,13 +884,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, =
vaddr eaddr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr ptex;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ppc_hash_pte64_t pte;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int exec_prot, pp_prot, amr_prot, prot;<br>
&gt; -=C2=A0 =C2=A0 MMUAccessType access_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int need_prot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr raddr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D =
2));<br>
&gt; -=C2=A0 =C2=A0 access_type =3D rwx;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Note on LPCR usage: 970 uses HID4, but our=
 special variant of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* store_spr copies relevant fields into env-=
&gt;spr[SPR_LPCR].<br>
&gt; diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h<br>
&gt; index 4b8b8e7950..3e8a8eec1f 100644<br>
&gt; --- a/target/ppc/mmu-hash64.h<br>
&gt; +++ b/target/ppc/mmu-hash64.h<br>
&gt; @@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);<br>
&gt;=C2=A0</blockquote></div>

--00000000000050bf4b05c58125ca--

