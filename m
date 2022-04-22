Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56B50B63D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:35:56 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrZr-0001bP-6h
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqnx-0002u1-II
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:46:25 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqnv-0000d7-Px
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:46:25 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w187so4376670ybe.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J2SHMgJViLZeVm2LyGmTxtMBQxdO7aHqmkibDbIRJQ0=;
 b=UJ6keIgcN05F3FzIXKN2E7sQ6WP98dBXh6P5Fnwv6XrE7wmeSfUQUYmTXl8xqoa/YU
 U+qYmSzPSGQnuMjcmrtHsA58VNp4i/LjYEJrZpgP2K/XCpp+urQTU47IQnVBtsM7+ipB
 taGtlzyW3dL8xZ+ub6wXJGTmdN70e79HCGoHJcF5yaHfwjJ3+DuqfUkBp10dCxsGoWZO
 eRGIvDaKV70jcKtG9ygGjlr1G3rtqzpdh/t5+b94RuSVZ/BMQM1Y9cHlRfm38kRjxYFJ
 6JqO8t5r6DUf4FwlO1fagusoplcAtyusi8iJXCBfyx1ief43Q7ZDEJNUjG62i33jtPjz
 XXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J2SHMgJViLZeVm2LyGmTxtMBQxdO7aHqmkibDbIRJQ0=;
 b=Hum35X/pqqgLUHfDvIodfPM755zcHJGiqLEj2TjInkbF5YqXonwMIvHgHBm1bIm38D
 9KLWaSmp8bfQpTAOyd64119h/eBgLV/UfJ3cQUHIpV/rMf1DesMuXGaRKPXRNtUevZhw
 ARxgErMWQxPzfyJM5wsCJkLxOfo/z4HJ+W82Q3KOnvx9G9+o7A8G2yhwimC9DzMJdJCt
 TUsYEya37hni2pcTIbuV/w2WWckkAdkFz6kg1V4YVVxIsKuFIVOC03pHpHLz5GQr2+pq
 paf2b/YmbD669uhLQwSVxH7+Hke0U5gtFfAgZk9pXWhWqP3JHpkhZKdpzgHi5U2PEj5J
 G7bg==
X-Gm-Message-State: AOAM532NDYH9h6YspdPTJAkJc6jIVLo75vEko6nwc92fqa7ZdcPRm9Tg
 RBudpYUVrJ3vArTKQwmuf8UvGC6AwL7bpERVNSutfw==
X-Google-Smtp-Source: ABdhPJxZ99kUttKwrePa6u1rI2D/kVAgoJMjfosXbDZkRJyQGmpbYBg/C15ijMewAz6czRT74gt/8+C+sck5O7mCEyc=
X-Received: by 2002:a25:c60a:0:b0:645:d925:64d3 with SMTP id
 k10-20020a25c60a000000b00645d92564d3mr689417ybf.288.1650624382811; Fri, 22
 Apr 2022 03:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-34-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:46:11 +0100
Message-ID: <CAFEAcA-r5JLQyWq+TDWCyFmxXvp9kn_S7bkRroLN3=5dZAVw7w@mail.gmail.com>
Subject: Re: [PATCH v3 33/60] target/arm: Store cpregs key in the hash table
 directly
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cast the uint32_t key into a gpointer directly, which
> allows us to avoid allocating storage for each key.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c     |  4 ++--
>  target/arm/gdbstub.c |  2 +-
>  target/arm/helper.c  | 45 ++++++++++++++++++++------------------------
>  3 files changed, 23 insertions(+), 28 deletions(-)
>


> @@ -231,11 +228,9 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
>  static void count_cpreg(gpointer key, gpointer opaque)
>  {
>      ARMCPU *cpu = opaque;
> -    uint64_t regidx;
>      const ARMCPRegInfo *ri;
>
> -    regidx = *(uint32_t *)key;
> -    ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
> +    ri = g_hash_table_lookup(cpu->cp_regs, key);

Here we turn a get_arm_cp_reginfo() call into a direct
g_hash_table_lookup()...

>      if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
>          cpu->cpreg_array_len++;

> @@ -5915,16 +5910,17 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>
>      for (i = 0; i < ARRAY_SIZE(aliases); i++) {
>          const struct E2HAlias *a = &aliases[i];
> -        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
> -        uint32_t *new_key;
> +        const ARMCPRegInfo *dst_reg;
> +        ARMCPRegInfo *src_reg;
> +        ARMCPRegInfo *new_reg;
>          bool ok;
>
>          if (a->feature && !a->feature(&cpu->isar)) {
>              continue;
>          }
>
> -        src_reg = g_hash_table_lookup(cpu->cp_regs, &a->src_key);
> -        dst_reg = g_hash_table_lookup(cpu->cp_regs, &a->dst_key);
> +        src_reg = (ARMCPRegInfo *)get_arm_cp_reginfo(cpu->cp_regs, a->src_key);
> +        dst_reg = get_arm_cp_reginfo(cpu->cp_regs, a->dst_key);

...but here we turn g_hash_table_lookup() calls into
get_arm_cp_reginfo() calls (necessitating an ugly cast-away-const).
Is there a rationale for when we should use which function ?

>          g_assert(src_reg != NULL);
>          g_assert(dst_reg != NULL);

thanks
-- PMM

