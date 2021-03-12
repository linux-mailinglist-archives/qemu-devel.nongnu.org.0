Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8AC3396FD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:59:06 +0100 (CET)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKn05-0000f2-SA
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKmlJ-00076T-Ex
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:43:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKml5-0004b9-FP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615574613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkssGkLrDyXgIw8D2c8Qp2pnr2Aw3/p8h4YDEdJ/9YY=;
 b=COiQ2dTWmYk6yIqkqzTfdC0xc8ih55Ce9t8OGkkBmc9LLGXxQ3Jdv2yx0HQmJ4j6OLh7if
 WsjV0pdAMlry7ys59LPeP8xZeyC2OuXsIGn3mqyxd8yHvN5aJQszRNkjdyUNCt2wFX7UNW
 Lh6TevShdDymxwF9reL3/99agFzVHpo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-f_1CJM-5MU6wwkKSqiqRag-1; Fri, 12 Mar 2021 13:43:32 -0500
X-MC-Unique: f_1CJM-5MU6wwkKSqiqRag-1
Received: by mail-wr1-f70.google.com with SMTP id h30so11575275wrh.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkssGkLrDyXgIw8D2c8Qp2pnr2Aw3/p8h4YDEdJ/9YY=;
 b=rJLMIBZt0+JJsFRSsgF4+nes6Y22ceLOIoMg891ctLfSZab9gOgzGxnjm8Yv2yhixJ
 4nweyyyaAVZFfSrnmhvVtv2rVw+mqRVOb2iADHff4H5GvI0jzIR/3Z5P50/78yK7okrg
 NEEzOB8QBZrUym8lhi+EDBM+t6FiIDQUSA0DQDu1J2m0K/tdIfedPilkSgSCDkwXODz/
 gxU7dzdOrS7kYeVYkA0hp+K/clboWzqKNOmMQ4FTAYGGYs4iZvggpu+OpXhoydg3LqPx
 OyHpHnlrZVdjnqw4x0MjGCKYDF5BJ+4m080yIHDEC+h2dtGyBWFqNnqZFdoKMeaAZN4o
 ixgg==
X-Gm-Message-State: AOAM533lEqf9bkH4obOaocFG5v+kJYOjuGaFQ1x99gV49pq0oyOZd6ad
 tWndcOtNeO3FBf8W0zotlKnK7NQZRvqEZj/ebpe2oSHVyKHpW5YMBWSZ6GMNukbxzEo4TBBSfqE
 5SCTmIDs6gtRNlZg=
X-Received: by 2002:a5d:6342:: with SMTP id b2mr15303477wrw.421.1615574610983; 
 Fri, 12 Mar 2021 10:43:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy36hQD00atILkfz3h3rLgCCYofZoNFl+USaywCWHqTob0alm4Lc8DAVINdcajZP0j4QhQhuQ==
X-Received: by 2002:a5d:6342:: with SMTP id b2mr15303456wrw.421.1615574610707; 
 Fri, 12 Mar 2021 10:43:30 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h62sm3394495wmf.37.2021.03.12.10.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 10:43:30 -0800 (PST)
Subject: Re: [PATCH] Use identical prototype for tcg_out_vec_op and tcg_out_op
 function
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <20210312121418.139093-1-mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7e802d62-7419-2386-78e0-11ba310e1dda@redhat.com>
Date: Fri, 12 Mar 2021 19:43:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312121418.139093-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing TCG maintainer ;)

On 3/12/21 1:14 PM, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> There are two different versions of prototype for tcg_out_op and
> tcg_out_vec_op functions:
> 
> 1) using const TCGArg *args and const int *const_args arguments
> 2) using const TCGArg args[TCG_MAX_OP_ARGS] and const int const_args[TCG_MAX_OP_ARGS]
>    aguments.
> 
> This duality cause warning on GCC 11 and prevent build using --enable-werror.
> 
> As second version provides more information, unify functions prototypes to
> this variant.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> --
> Note: These changes were send to mailing list before:
> 
> - First sending by me using first variant
> - Several iterations sended by Philippe Mathieu-Daudé with additional fixes
>   that were not accepted.
> ---
>  tcg/aarch64/tcg-target.c.inc |  3 ++-
>  tcg/i386/tcg-target.c.inc    |  6 ++++--
>  tcg/mips/tcg-target.c.inc    |  3 ++-
>  tcg/ppc/tcg-target.c.inc     |  8 +++++---
>  tcg/riscv/tcg-target.c.inc   |  3 ++-
>  tcg/s390/tcg-target.c.inc    |  3 ++-
>  tcg/tcg.c                    | 19 +++++++++++--------
>  tcg/tci/tcg-target.c.inc     |  5 +++--
>  8 files changed, 31 insertions(+), 19 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index fcaa5aface..f07ba98aa4 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -2286,7 +2286,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>  
>  static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>                             unsigned vecl, unsigned vece,
> -                           const TCGArg *args, const int *const_args)
> +                           const TCGArg args[TCG_MAX_OP_ARGS],
> +                           const int const_args[TCG_MAX_OP_ARGS])
>  {
>      static const AArch64Insn cmp_vec_insn[16] = {
>          [TCG_COND_EQ] = I3616_CMEQ,
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 40326c2806..415c5c0796 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -2177,7 +2177,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
>  }
>  
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                              const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0, a1, a2;
>      int c, const_a2, vexop, rexw = 0;
> @@ -2613,7 +2614,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>  
>  static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>                             unsigned vecl, unsigned vece,
> -                           const TCGArg *args, const int *const_args)
> +                           const TCGArg args[TCG_MAX_OP_ARGS],
> +                           const int const_args[TCG_MAX_OP_ARGS])
>  {
>      static int const add_insn[4] = {
>          OPC_PADDB, OPC_PADDW, OPC_PADDD, OPC_PADDQ
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index ab55f3109b..8738a3a581 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1651,7 +1651,8 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
>  }
>  
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                              const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      MIPSInsn i1, i2;
>      TCGArg a0, a1, a2;
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 4377d15d62..838ccfa42d 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -2319,8 +2319,9 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>      tcg_out32(s, BCLR | BO_ALWAYS);
>  }
>  
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args)
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0, a1, a2;
>      int c;
> @@ -3115,7 +3116,8 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
>  
>  static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>                             unsigned vecl, unsigned vece,
> -                           const TCGArg *args, const int *const_args)
> +                           const TCGArg args[TCG_MAX_OP_ARGS],
> +                           const int const_args[TCG_MAX_OP_ARGS])
>  {
>      static const uint32_t
>          add_op[4] = { VADDUBM, VADDUHM, VADDUWM, VADDUDM },
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index e700c52067..ef43147040 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1212,7 +1212,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>  static const tcg_insn_unit *tb_ret_addr;
>  
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                       const TCGArg *args, const int *const_args)
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0 = args[0];
>      TCGArg a1 = args[1];
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index 695d7ee652..af8dfe81ac 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1705,7 +1705,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>          case glue(glue(INDEX_op_,x),_i64)
>  
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      S390Opcode op, op2;
>      TCGArg a0, a1, a2;
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 2991112829..de91bb6e9e 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -107,8 +107,9 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg);
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args);
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS]);
>  #if TCG_TARGET_MAYBE_vec
>  static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
>                              TCGReg dst, TCGReg src);
> @@ -116,9 +117,10 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
>                               TCGReg dst, TCGReg base, intptr_t offset);
>  static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
>                               TCGReg dst, int64_t arg);
> -static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
> -                           unsigned vece, const TCGArg *args,
> -                           const int *const_args);
> +static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
> +                           unsigned vecl, unsigned vece,
> +                           const TCGArg args[TCG_MAX_OP_ARGS],
> +                           const int const_args[TCG_MAX_OP_ARGS]);
>  #else
>  static inline bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
>                                     TCGReg dst, TCGReg src)
> @@ -135,9 +137,10 @@ static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
>  {
>      g_assert_not_reached();
>  }
> -static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
> -                                  unsigned vece, const TCGArg *args,
> -                                  const int *const_args)
> +static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
> +                                  unsigned vecl, unsigned vece,
> +                                  const TCGArg args[TCG_MAX_OP_ARGS],
> +                                  const int const_args[TCG_MAX_OP_ARGS])
>  {
>      g_assert_not_reached();
>  }
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index c79f9c32d8..221ad7150f 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -392,8 +392,9 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
>  # define CASE_64(x)
>  #endif
>  
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args)
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      uint8_t *old_code_ptr = s->code_ptr;
>  
> 


