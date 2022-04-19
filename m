Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BC850761F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:09:34 +0200 (CEST)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrM5-00047k-JT
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngrIC-0000ym-B1
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:05:34 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngrIA-0004Am-Fr
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:05:31 -0400
Received: by mail-pl1-x62d.google.com with SMTP id j8so16338639pll.11
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wQvXd2NhpRuRjFcbWtcCXi1ZqAr5vooAGYv/Zc7gSHQ=;
 b=rnb2e7AL8wWmF4ytMNu7Av2OxVNCq4IXCAKyBlULGyzXUuNH0D2mx600lnOPg822/j
 5AHuRSwWcpM/6NQkjasb9XP/ZoCZ4TkOrPaQGf/4dgufydykdlQPtBVimXO/OvID6aSV
 Re9xokvOT90xkYgjF+DFxb51q13Ye0n3foRcMrRxw/icIw6/hWDmKndBFfyOLwKmynNM
 jC8v13gbziAKjv/+y3cGagzjJ91Eg/TWmTnOH1G1G+C9FhReqOHG4zqvDGgLVuqfsPlf
 jMiWARyhvqmVa9F5aWEzl2EbJ+FacAUjyKt/6FU8SGsaITLeP2PtWXTDlm1Q8zRboWqq
 KewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wQvXd2NhpRuRjFcbWtcCXi1ZqAr5vooAGYv/Zc7gSHQ=;
 b=Bq0/UotibVyUq7bNddhxLw7zdypwBW7XILTxy2nbqIQFrre8VFUsuxpfL2ZsEItvOP
 dqdaMGSRb2AQ+7l4a3mxlR64S34c4q0WAB3UjCJl8jP9mk//OoApNgKNcj2IqLdjBjdK
 SiyVOzZ4hovVXqiwFlqSNgLzMa70p1vpHWtxBGJ6YOsWEhi8GoKUi0cp1+nkFluuMVZc
 kWPVCrLZQDgBGBCwFut/ZbwFYyFj1hftVtM8mNYmm0p6+PLAKaUycnS8DEiXCbCWtvJ8
 zLV4ZsckNihEQ3tZnQ3xX9YVtAgPGctg/RK/ZTYi0cv+83L4i9JTx6x6mV2c1F0vt42P
 UipA==
X-Gm-Message-State: AOAM532aUXQUyPlW8ZAp9sx/NFiwiiClM4zeRmzpZVYkUcmFICaa1zHx
 wxuyBJSrt4rMk3XwHz9PRTaReg==
X-Google-Smtp-Source: ABdhPJy/1DQzSOyAT29kPEJSqB/s2xJhj06I1VSwh8IK2qfuNvsUxXqsmbM79VWMtHHwSf29+ZiAOA==
X-Received: by 2002:a17:902:d709:b0:155:d473:2be0 with SMTP id
 w9-20020a170902d70900b00155d4732be0mr16113180ply.151.1650387928434; 
 Tue, 19 Apr 2022 10:05:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a62a510000000b0050759c9a891sm16556192pfm.6.2022.04.19.10.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 10:05:27 -0700 (PDT)
Message-ID: <a9c3e36b-4c94-a9d3-52d7-a88bc4734db9@linaro.org>
Date: Tue, 19 Apr 2022 10:05:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
 <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
 <8193af0c-4ba3-3154-45a5-de8fefa0ddad@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8193af0c-4ba3-3154-45a5-de8fefa0ddad@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 00:33, yangxiaojuan wrote:
> 
> On 2022/4/16 上午9:04, Richard Henderson wrote:
>> On 4/15/22 02:40, Xiaojuan Yang wrote:
> ...
>>> +void  helper_csr_update(CPULoongArchState *env, target_ulong new_val,
>>> +                        target_ulong csr_offset)
>>> +{
>>> +    uint64_t *csr = (void *)env + csr_offset;
>>> +
>>> +    *csr = new_val;
>>> +}
>> This function should not exist
> ...
>>> +    switch (a->csr) {
>>> +    case LOONGARCH_CSR_ESTAT:
>>> +        gen_helper_csrwr_estat(dest, cpu_env, new_val);
>>> +        break;
>>> +    case LOONGARCH_CSR_ASID:
>>> +        gen_helper_csrwr_asid(dest, cpu_env, new_val);
>>> +        break;
>>> +    case LOONGARCH_CSR_TCFG:
>>> +        gen_helper_csrwr_tcfg(dest, cpu_env, new_val);
>>> +        break;
>>> +    case LOONGARCH_CSR_TICLR:
>>> +        gen_helper_csrwr_ticlr(dest, cpu_env, new_val);
>>> +        break;
>>> +    default:
>>> +        tcg_gen_mov_tl(dest, old_val);
>>> +    }
>>> +
>>> +    gen_helper_csr_update(cpu_env, new_val, tcg_constant_tl(csr_offset));
>>
>> Note that helper_csr_update is nothing more than the store to csr_offset.
> On trans_csrxchg() , I am don't know how to use a TCGv value 'new_val 'to update an 
> uint64_t value "CSR_XXX",  So I use helper_csr_update(),

You'd use a store, just like you were already doing in trans_csrwr.

But here's how I'd improve this.  For avoidance of doubt, all of this would go in 
trans_priviledged.c.inc -- there's no use of csr_offsets[] outside of that file.


r~

----


typedef void (*GenCSRRead)(TCGv dest, TCGv_ptr env);
typedef void (*GenCSRWrite)(TCGv dest, TCGv_ptr env, TCGv src);

typedef struct {
     int offset;
     int flags;
     GenCSRRead readfn;
     GenCSRWrite writefn;
} CSRInfo;

enum {
     CSRFL_READONLY  = (1 << 0),
     CSRFL_EXITTB    = (1 << 1),
     CSRFL_IO        = (1 << 2),
};

#define CSR_OFF_FUNCS(NAME, FL, RD, WR) \
     [LOONGARCH_CSR_##NAME] = {                             \
         .offset = offsetof(CPULoongArchState, CSR_##NAME), \
         .flags = FL, .readfn = RD, .writefn = WR           \
     }
#define CSR_OFF_FLAGS(NAME, FL) \
     CSR_OFF_FUNCS(NAME, FL, NULL, NULL)
#define CSR_OFF(NAME) \
     CSR_OFF_FLAGS(NAME, 0)

static const CSRInfo csr_info[] = {
     CSR_OFF(CRMD),
     CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),
     CSR_OFF_FUNCS(TCFG, CSRFL_IO, NULL, gen_helper_csrwr_tcfg),
     CSR_OFF_FUNCS(TVAL, CSRFL_READONLY | CSRFL_IO, gen_helper_csrrd_tval, NULL),
     CSR_OFF_FUNCS(TICLR, CSRFL_IO, NULL, gen_helper_csrwr_ticlr),
     CSR_OFF_FUNCS(ESTAT, CSRFL_EXITTB, NULL, gen_helper_csrwr_estat),
     ...
};

static const CSRInfo *get_csr(unsigned csr_num)
{
     const CSRInfo *csr;
     if (csr_num < ARRAY_SIZE(csr_info)) {
         return NULL;
     }
     csr = &csr_info[csr_num];
     if (csr->offset == 0) {
         return NULL; /* undefined */
     }
     return csr;
}

static bool check_csr_flags(DisasContext *ctx, const CSRInfo *csr, bool write)
{
     if ((info->flags & CSRFL_READONLY) && write) {
         return false;
     }
     if ((info->flags & CSRFL_IO) &&
         (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT)) {
         gen_io_start();
         ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     } else if ((info->flags & CSRFL_EXITTB) && write) {
         ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     }
     return true;
}

static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
{
     TCGv dest;
     const CSRInfo *csr;

     if (check_plv(ctx)) {
         return false;
     }
     csr = get_csr(a->csr);
     if (csr == NULL) {
         /* CSR is undefined: read as 0 */
         dest = tcg_constant_tl(0);
     } else {
         check_csr_flags(ctx, csr, false);
         dest = gpr_dst(ctx, a->rd, EXT_NONE);
         if (csr->readfn) {
             csr_readfn(dest, cpu_env);
         } else {
             tcg_gen_ld_tl(dest, cpu_env, csr->offset);
         }
     }
     gen_set_gpr(a->rd, dest, EXT_NONE);
     return true;
}

static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
{
     TCGv dest, src1;
     const CSRInfo *csr;

     if (check_plv(ctx)) {
         return false;
     }
     csr = get_csr_info(a->csr);
     if (csr == NULL) {
         /* CSR is undefined: write ignored, read old value as 0. */
         gen_set_gpr(a->rd, tcg_constant_tl(0), EXT_NONE);
         return true;
     }
     if (!check_csr_flags(ctx, csr, true)) {
         /* CSR is readonly: trap. */
         return false;
     }
     src1 = gpr_src(ctx, a->rd, EXT_NONE);
     if (csr->writefn) {
         dest = gpr_dst(ctx, a->rd, EXT_NONE);
         csr->writefn(dest, cpu_env, src1);
     } else {
          dest = temp_new(ctx);
          tcg_gen_ld_tl(dest, cpu_env, csr->offset);
          tcg_gen_st_tl(src1, cpu_env, csr->offset);
     }
     gen_set_gpr(a->rd, dest, EXT_NONE);
     return true;
}

static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
{
     TCGv src1, mask, oldv, newv, temp;
     const CSRInfo *csr;

     if (check_plv(ctx)) {
         return false;
     }
     csr = get_csr_info(a->csr);
     if (csr == NULL) {
         /* CSR is undefined: write ignored, read old value as 0. */
         gen_set_gpr(a->rd, tcg_constant_tl(0), EXT_NONE);
         return true;
     }
     if (!check_csr_flags(ctx, csr, true)) {
         /* CSR is readonly: trap. */
         return false;
     }

     /* So far only readonly csrs have readfn. */
     assert(csr->readfn == NULL);

     src1 = gpr_src(ctx, a->rd, EXT_NONE);
     mask = gpr_src(ctx, a->rj, EXT_NONE);
     oldv = tcg_temp_new();
     newv = tcg_temp_new();
     temp = tcg_temp_new();

     tcg_gen_ld_tl(oldv, cpu_env, csr->offset);
     tcg_gen_and_tl(newv, src1, mask);
     tcg_gen_andc_tl(temp, oldv, mask);
     tcg_gen_or_tl(newv, newv, temp);

     if (csr->writefn) {
         csr->writefn(oldv, cpu_env, newv);
     } else {
         tcg_gen_st_tl(newv, cpu_env, csr->offset);
     }
     gen_set_gpr(a->rd, oldv, EXT_NONE);

     tcg_temp_free(temp);
     tcg_temp_free(newv);
     tcg_temp_free(oldv);
     return true;
}

and then in loongarch_tr_tb_stop:

     case DISAS_EXIT_UPDATE:
         tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);

         /* fall through */
     case DISAS_EXIT:

         tcg_gen_exit_tb(NULL, 0);

         break;



