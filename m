Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED6457C8F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:21:56 +0100 (CET)
Received: from localhost ([::1]:34810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moLdD-0004v9-Ak
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moLbc-000495-8i
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:20:16 -0500
Received: from [2a00:1450:4864:20::330] (port=34806
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moLba-0001e9-5F
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:20:15 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so134174wmb.1
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 00:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TcrowQmRHGgCS9TupezP3iR3sOd34KCc0+1esHuz5Es=;
 b=cHKzLx22hIABJJL6roAW4FStL/a7w9OZvuAJ1daiMrm2kQiHnPlpDO4aDu4divcUHD
 6IG5ETFFlbcJStJ4RQwj3jfwhOmUc87lElvITMHw+wt9LKlsphX3k40JLAoiP4Q6oWzk
 +G4s07CdlXGnn7xN0v4jMa5A8Bx3on+E2wQxMNOq9LIDPR57ifwy/605ImZduAw6iQ55
 ZBOgd5tClYvCqEZxCf9mDkNo2mE3V3C6hJKR9a7QnZFhRkadzLt08a1m38fCVI+WPAen
 lytdxQqK3ingspFkYZfGiOp5Pr4LxcqqKGJ6HSRSOiZcut/SwI3e7CugnUlr4lPuzuwT
 DSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TcrowQmRHGgCS9TupezP3iR3sOd34KCc0+1esHuz5Es=;
 b=zlXhpHNxG5+b+nIa8LUmrTtiE51vd0NTrdEgdVZGrBTY1WLEmZizKwAV6IMV/l8IsU
 tDlqXvqzVQCstLnwhurzgcFkawRX5rlShoUSeW8tUyL7osG3GXjlI3TJUWwAMHoe7oCE
 D5Etb/j0ZOyRY7XSWG/Z2W7KZvyL7/n8B2FhbpmaofoUDt2/1xFOiRptdHnL7tPWW15w
 uHkHTbNKARVGH112S/8xHWixFDTr/fwpMMaMXLIrBUDsT3UNMoFdZZ8Z/as3SubpFvAZ
 0zqxhW5j3jMyoyDUfIEOZLzJI7+7vlnJnT6cgWiNfs8PRXto35aU8fw5vZPcYTJ2Sb8V
 lLxQ==
X-Gm-Message-State: AOAM530APHqQ+16Y+funQ3UrwhqmlRD9ALi/VwRm3L3eBcjp2dY8rKxY
 c3xLYKPVCPPwe0xRZ9oBOqqLEQ==
X-Google-Smtp-Source: ABdhPJzjKFVv4NTxv56x79Yvzpq2BEkDELoPho8skfLAULFVF3RWCEHZiUOyRA3pnkYTsEtvHw539g==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr7907185wml.63.1637396412495;
 Sat, 20 Nov 2021 00:20:12 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id n2sm15127943wmi.36.2021.11.20.00.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 00:20:12 -0800 (PST)
Subject: Re: [PATCH v11 07/26] target/loongarch: Add fixed point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-8-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52e99aaa-1fa3-7b54-76e8-2ba4df4853fa@linaro.org>
Date: Sat, 20 Nov 2021 09:20:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-8-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
>   DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
> +
> +DEF_HELPER_3(asrtle_d, void, env, tl, tl)
> +DEF_HELPER_3(asrtgt_d, void, env, tl, tl)

Use DEF_HELPER_FLAGS_3 and TCG_CALL_NO_WG.

(They do not write globals, but do implicitly read them via the exception path, and of 
course the exception is a side-effect.)

> +static bool gen_load_gt(DisasContext *ctx, arg_rrr *a, MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
> +    TCGv addr = tcg_temp_new();
> +
> +    gen_helper_asrtgt_d(cpu_env, src1, src2);
> +    tcg_gen_add_tl(addr, src1, src2);
> +    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);

This add is incorrect.  The address is rj (src1).
Likewise for the rest of the bound check memory ops.

> +static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv temp = NULL;
> +
> +    if (a->imm) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm << 2);
> +        addr = temp;
> +    }

I think it would be cleaner to have this immediate shift handled by decodetree, so that 
gen_ldptr is dropped in favor of gen_load (and also for stores).  It would also print the 
correct logical offset on the disassembly side.

%i14s2      10:s14 !function=shl_2
@rr_i14s2   .... .... .............. rj:5 rd:5  &rr_i imm=%i14s2


> +/* loongarch sync */
> +static void gen_loongarch_sync(int stype)
> +{
> +    TCGBar tcg_mo = TCG_BAR_SC;
> +
> +    switch (stype) {
> +    case 0x4: /* SYNC_WMB */
> +        tcg_mo |= TCG_MO_ST_ST;
> +        break;
> +    case 0x10: /* SYNC_MB */
> +        tcg_mo |= TCG_MO_ALL;
> +        break;
> +    case 0x11: /* SYNC_ACQUIRE */
> +        tcg_mo |= TCG_MO_LD_LD | TCG_MO_LD_ST;
> +        break;
> +    case 0x12: /* SYNC_RELEASE */
> +        tcg_mo |= TCG_MO_ST_ST | TCG_MO_LD_ST;
> +        break;
> +    case 0x13: /* SYNC_RMB */
> +        tcg_mo |= TCG_MO_LD_LD;
> +        break;
> +    default:
> +        tcg_mo |= TCG_MO_ALL;
> +        break;
> +    }
> +
> +    tcg_gen_mb(tcg_mo);
> +}

This is copied from mips, I think.  The only defined hint for dbar is 0.  I think this 
function should be removed, and just emit the tcg barrier directly within trans_dbar.


r~

