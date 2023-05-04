Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486BE6F7189
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:51:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoQ-00070a-N0; Thu, 04 May 2023 13:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaTm-0003Rp-2l
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:02:48 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaTj-00018e-E3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:02:45 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso4957011fa.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683212561; x=1685804561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAocgrsmEG603ZQnZ5CcZYHrN6ZBFyDbbTu3VCHsd9A=;
 b=F5Lf4HMj5EDCPlBNDdOROkY7rL3tB9dkVfjlF0oq9y/8yhYT+/yhnK2nE0hwkHEV0y
 5J81IkkQfN52l2ARjnvLgau0rCxMM8h2nWkOl0MdRdw21OFixdT4lJ5CNVbBry56mzfb
 yr0Im6nBMdPRvddSuEfWCmGkCTA+AbZZPGCIlQGgb0H+2bOZ5xuw9X0rgQvNvcyVsaqG
 YoSULS1L/3wBePrmXwue0lL9+kA541dX4KoJeTOLJqw2NalzEWjndaPNLSRT0eanCihr
 XCJlUxZZVv+mqd7QbYRL+fueSvCNJ9nb57/sV5qMh6CMWw0SeasWIo/qXP605FRyniw9
 X1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683212561; x=1685804561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAocgrsmEG603ZQnZ5CcZYHrN6ZBFyDbbTu3VCHsd9A=;
 b=NJ0TkDTbp5d5Sv8WcCX/KuLOGgHi1dRj6pHRb2euoMYiP815bNz3nSpz01uF2ru182
 BNex8AAEyvPR1IPzADfQiL09dRAew07eyf9Co9JhzYurBAwDglrPycRJNu+kjX5g4w7m
 FyJsBlJw9ld4O9bCdtJZA/Jw1HUbIBrAbABRq+w3Gr5vl7k77xX2axj2x36IHvhyaiKv
 0lzPnYbXSzw41Tok3A+Vfkz6dSpmvI92fAw8nSlFExh1Mc+pgVIRcgPbEc9EkL73i6DG
 W8SKnRJSVn8QY3LLRNBH7ZQdLo2loesowG67NFlubVawfPG5bpvGSiT//mgTR2mC8Es5
 7TyQ==
X-Gm-Message-State: AC+VfDy/95L/ISDprvqMAS/CV+vXinxqf9Q6lY2iCEuwwD1hKPjZIHBZ
 TVZdoJD1yTsyDPl8jyZWNAEfO6eq017Zn/aYO6agvA==
X-Google-Smtp-Source: ACHHUZ70ZJ5nS7SJYchXMEhZ86p6VAPNGSHQNuYDTYgMkadcT9NIj+L4y7vdoGyQ5J0eJRWMhP3UN0mLmAY/LPBKWdk=
X-Received: by 2002:a2e:9b84:0:b0:2ac:7e64:ef8 with SMTP id
 z4-20020a2e9b84000000b002ac7e640ef8mr971691lji.16.1683212561375; Thu, 04 May
 2023 08:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:02:30 +0100
Message-ID: <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of playing with offsetof in various places, use
> MMUAccessType to index an array.  This is easily defined
> instead of the previous dummy padding array in the union.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
>      if (prot & PAGE_WRITE) {
>          tlb_addr =3D tlb_addr_write(tlbe);
>          if (!tlb_hit(tlb_addr, addr)) {
> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
> +                                addr & TARGET_PAGE_MASK)) {
>                  tlb_fill(env_cpu(env), addr, size,
>                           MMU_DATA_STORE, mmu_idx, retaddr);
>                  index =3D tlb_index(env, mmu_idx, addr);
> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
>      } else /* if (prot & PAGE_READ) */ {
>          tlb_addr =3D tlbe->addr_read;
>          if (!tlb_hit(tlb_addr, addr)) {
> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
> +                                addr & TARGET_PAGE_MASK)) {

This was previously looking at addr_write, but now we pass
MMU_DATA_LOAD ?

>                  tlb_fill(env_cpu(env), addr, size,
>                           MMU_DATA_LOAD, mmu_idx, retaddr);
>                  index =3D tlb_index(env, mmu_idx, addr);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

