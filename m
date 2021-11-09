Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A844AD12
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:04:07 +0100 (CET)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkPrC-00036p-8u
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkPoe-0002Pz-BT
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:01:28 -0500
Received: from [2a00:1450:4864:20::32a] (port=38542
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkPob-0008Pm-SL
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:01:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso1696391wmd.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MGBAu1WW2CCMlAB3dA6l+j+AZCNKr/PbfRytCaVS1IM=;
 b=j3ucnnnLbiCA/23/3YQcAQwRDZuHavs5y6OP6Yif70z2A57JnM2b8GhvrcJRHn5CJd
 qyx7wHZmvW1TReOUazfs/JXPsdG5TJqIN0gZj1U8HH2tA/CH5LnVPHUfrUQvRaW+WVix
 ijSJVRvQ1j75Cf/cWwUL5ysu6Qx3vtsIrJbknYEDZYOYMPI4KU6y4KsI/Aja8Uc/n+Nq
 iXd4c8Sm5jBnR4J3EQ6y8rQw5CoNF/Nqe0VjmEieJOvHyGkI3e3S1ePtJ3uVw1YMJvQq
 cEKjzE8Hpla5/DQ2PsRy7s56oN5/R/7hX0+fHw35r8cCZK2wPEs1gVPLK7p3b6bIjJ40
 80qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGBAu1WW2CCMlAB3dA6l+j+AZCNKr/PbfRytCaVS1IM=;
 b=RIQvmMJrxk2YogF1Ek7oLVXkWkOyKNjwzGkDU2o5jeF5gJr4LAWJ4h8+t3A0+lLiNv
 JScX7AjH7a7kxCgTNEaK5GgFx+yXlEy73XUWI8UNkS0UydAKf8PUuN5H4hBxxvGhoWmO
 /bPKQ2ZmlOOn/SR6mEm2w8UJ3Y8dJ/JZW4ABI/985aufpBAxPlAu5jGL9xTOKHsV+Ic3
 K/oE8X/IhqC0UF1EUb/telPMLrdO6kIFHAe9WqHQ5V8ch4TiVg5SSt71vw/8WHINvw5k
 0oZzH4gzg1g9aGz9+sCmOd7nbw0By2+pJ97nEaBdlldJXS22Ll79+yY6lyFM4jOrBdZB
 cMuw==
X-Gm-Message-State: AOAM53373/F4Wj3RHgFz88Am9hpGAR8FGEH3+lkAsXj0IpipYS7OMtj9
 e6w2Uos5aeOfufd+WEBULBsMrx6njD0rLdpyk0Y=
X-Google-Smtp-Source: ABdhPJz9ZFLLo9Ig4uWlcT0Xlu/bYmuBkDlTnEc7V67xMatdD9Mc3L6+ZWx2KOR3s3jukT7/A/ht8w==
X-Received: by 2002:a05:600c:354b:: with SMTP id
 i11mr6672652wmq.61.1636459283313; 
 Tue, 09 Nov 2021 04:01:23 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id q26sm19617005wrc.39.2021.11.09.04.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:01:22 -0800 (PST)
Subject: Re: [RESEND PATCH v9 16/28] target/loongarch: Add disassembler
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636340895-5255-1-git-send-email-gaosong@loongson.cn>
 <1636340895-5255-17-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac1ec5f7-6c6c-ec33-9575-47bbc01b2be2@linaro.org>
Date: Tue, 9 Nov 2021 13:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636340895-5255-17-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 4:08 AM, Song Gao wrote:
> +/* operand extractors */
> +#define IM_12 12
> +#define IM_14 14
> +#define IM_15 15
> +#define IM_16 16
> +#define IM_20 20
> +#define IM_21 21
> +#define IM_26 26
> +
> +static uint32_t operand_r1(uint32_t insn)
> +{
> +    return insn & 0x1f;
> +}
> +
> +static uint32_t operand_r2(uint32_t insn)
> +{
> +    return (insn >> 5) & 0x1f;
> +}
> +
> +static uint32_t operand_r3(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x1f;
> +}
> +
> +static uint32_t operand_r4(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x1f;
> +}
> +
> +static uint32_t operand_u6(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x3f;
> +}
> +
> +static uint32_t operand_bw1(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x1f;
> +}
> +
> +static uint32_t operand_bw2(uint32_t insn)
> +{
> +    return (insn >> 16) & 0x1f;
> +}
> +
> +static uint32_t operand_bd1(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x3f;
> +}
> +
> +static uint32_t operand_bd2(uint32_t insn)
> +{
> +    return (insn >> 16) & 0x3f;
> +}
> +
> +static uint32_t operand_sa(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x3;
> +}
> +
> +static int32_t operand_im20(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 5) & 0xfffff);
> +    return imm > (1 << 19) ? imm - (1 << 20) : imm;
> +}
> +
> +static int32_t operand_im16(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0xffff);
> +    return imm > (1 << 15) ? imm - (1 << 16) : imm;
> +}
> +
> +static int32_t operand_im14(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0x3fff);
> +    return imm > (1 << 13) ? imm - (1 << 14) : imm;
> +}
> +
> +static int32_t operand_im12(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0xfff);
> +    return imm > (1 << 11) ? imm - (1 << 12) : imm;
> +}
> +
> +static uint32_t operand_cd(uint32_t insn)
> +{
> +    return insn & 0x7;
> +}
> +
> +static uint32_t operand_cj(uint32_t insn)
> +{
> +    return (insn >> 5) & 0x7;
> +}
> +
> +static uint32_t operand_code(uint32_t insn)
> +{
> +    return insn & 0x7fff;
> +}
> +
> +static int32_t operand_whint(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)(insn & 0x7fff);
> +    return imm > (1 << 14) ? imm - (1 << 15) : imm;
> +}
> +
> +static int32_t operand_ofs21(uint32_t insn)
> +{
> +    int32_t imm = (((int32_t)insn & 0x1f) << 16) |
> +        ((insn >> 10) & 0xffff);
> +    return imm > (1 << 20) ? imm - (1 << 21) : imm;
> +}
> +
> +static int32_t operand_ofs26(uint32_t insn)
> +{
> +    int32_t imm = (((int32_t)insn & 0x3ff) << 16) |
> +        ((insn >> 10) & 0xffff);
> +    return imm > (1 << 25) ? imm - (1 << 26) : imm;
> +}
> +
> +static uint32_t operand_fcond(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x1f;
> +}
> +
> +static uint32_t operand_sel(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x7;
> +}
> +
> +/* decode operands */
> +static void decode_insn_operands(la_decode *dec)
> +{
> +    uint32_t insn = dec->insn;
> +    switch (dec->codec) {
> +    case la_codec_2r:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_2r_u5:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_2r_u6:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_u6(insn);
> +        break;
> +    case la_codec_2r_2bw:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_bw1(insn);
> +        dec->r4 = operand_bw2(insn);
> +        break;
> +    case la_codec_2r_2bd:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_bd1(insn);
> +        dec->r4 = operand_bd2(insn);
> +        break;
> +    case la_codec_3r:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_3r_rd0:
> +        dec->r1 = 0;
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_3r_sa:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_sa(insn);
> +        break;
> +    case la_codec_4r:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_r4(insn);
> +        break;
> +    case la_codec_r_im20:
> +        dec->r1 = operand_r1(insn);
> +        dec->imm = operand_im20(insn);
> +        dec->bit = IM_20;
> +        break;
> +    case la_codec_2r_im16:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im16(insn);
> +        dec->bit = IM_16;
> +        break;
> +    case la_codec_2r_im14:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im14(insn);
> +        dec->bit = IM_14;
> +        break;
> +    case la_codec_2r_im12:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im12(insn);
> +        dec->bit = IM_12;
> +        break;
> +    case la_codec_r_cd:
> +        dec->r1 = operand_cd(insn);
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_r_cj:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_cj(insn);
> +        break;
> +    case la_codec_code:
> +        dec->code = operand_code(insn);
> +        break;
> +    case la_codec_whint:
> +        dec->imm = operand_whint(insn);
> +        dec->bit = IM_15;
> +        break;
> +    case la_codec_r_ofs21:
> +        dec->imm = operand_ofs21(insn);
> +        dec->bit = IM_21;
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_cj_ofs21:
> +        dec->imm = operand_ofs21(insn);
> +        dec->bit = IM_21;
> +        dec->r2 = operand_cj(insn);
> +        break;
> +    case la_codec_ofs26:
> +        dec->imm = operand_ofs26(insn);
> +        dec->bit = IM_26;
> +        break;
> +    case la_codec_cond:
> +        dec->r1 = operand_cd(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_fcond(insn);
> +        break;
> +    case la_codec_sel:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_sel(insn);
> +        break;
> +    }
> +}

All of this operand extraction has already been done by decodetree.  We do not need to 
re-do it.

> +/* format instruction */
> +static void append(char *s1, const char *s2, size_t n)
> +{
> +    size_t l1 = strlen(s1);
> +    if (n - l1 - 1 > 0) {
> +        strncat(s1, s2, n - l1);
> +    }
> +}
> +
> +static void format_insn(char *buf, size_t buflen,  const char* name,
> +                        const char *fmt, la_decode *dec)
> +{
> +    char tmp[16];

Better to use GString, with no pre-set buflen in the caller.  Or simply output to 
fprintf_func directly; there's no real need to cache it here.

I suggest a better organization is

typedef struct {
     disassemble_info *info;
     uint32_t insn;
} DisasContext;

#define output(C, INSN, FMT, ...) \
     (C)->info->fprintf_func((C)->info->stream, "%08x  %-9s " FMT, \
                             (C)->insn, INSN, ##__VA_ARGS__)

static void output_rdrjrk(DisasContext *ctx,
                           const arg_fmt_rdrjrk *a,
                           const char *mnemonic)
{
     output(ctx, mnemonic, "%s,%s,%s",
            regnames[a->rd], regnames[a->rj], regnames[a->rk]);
}

#define INSN(insn, type) \
     static void trans_##insn(DisasContext *ctx, arg_fmt_##type *a)
     { output_##type(ctx, a, #insn); }

INSN(add_w, rdrjrk)

etc.

This way you have type checking between insns.decode and the list of INSN macros.  The 
complete output for the instruction is done via a single printf.

> +int print_insn_loongarch(bfd_vma memaddr, struct disassemble_info *info)
> +{
> +    bfd_byte buffer[INSNLEN];
> +    unsigned long insn;

uint32_t insn.

> +    int status;
> +
> +    status = (*info->read_memory_func)(memaddr, buffer, INSNLEN, info);
> +    if (status == 0) {
> +        insn = (uint32_t) bfd_getl32(buffer);
> +        (*info->fprintf_func)(info->stream, "%08" PRIx64 " ", insn);

This errors out, because of mismatch between "unsigned long" and "uint64_t" on 32-bit 
hosts.  But better to fold into the single output, per above.

> +    } else {
> +        (*info->memory_error_func)(status, memaddr, info);
> +        return -1;
> +    }
> +
> +    dec.pc = memaddr;
> +    dec.insn = insn;
> +    if (!decode(info, insn)) {
> +        (*info->fprintf_func)(info->stream, "illegal");

Using the above scheme, this becomes

     output(&ctx, illegal, "")


r~

