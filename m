Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3E6F9826
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 12:11:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvbKZ-0007DY-By; Sun, 07 May 2023 06:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pvbKW-0007D6-KJ
 for qemu-devel@nongnu.org; Sun, 07 May 2023 06:09:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pvbKV-0000nK-1w
 for qemu-devel@nongnu.org; Sun, 07 May 2023 06:09:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so6580846a12.3
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683454161; x=1686046161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAvj99Lt1tAUVXyAbC39vjmWvRvxICJPbNVP+s00+bM=;
 b=mU06WDhbhGcSqyEzzxdhuXNdPi2j3ln6w0ji7pEZPnfx0pc0bHCwCqHEyICGGqvbcM
 HmY7hYR0X7jMtYM3OyR/2aAQfrRTl81MeOU+djoOuXI9C7o6WmBQ7z15hcg7MaYCwkfs
 VO54N0oOzQyVMsOlhn497FMTIooIio5EMd7UlW9cRH3nIdxZ38hZ5ttlerhKn82ZE4Fl
 fkBTYePzZ2Fl4pCdLybtShe5AO7Stpklw2QnxuKiC9upa1ncolCrn+NM8HS/T6NrEGrN
 +N6ORqDqgxQnXU31pOlQwWlPPWhlJT9gw2TKxPxlGoLw4QoIVZdSxEwePTumZRZh7dS1
 CBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683454161; x=1686046161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAvj99Lt1tAUVXyAbC39vjmWvRvxICJPbNVP+s00+bM=;
 b=l18SqAkw6TfQc8mLGie9JfEtvxIZ/q/33Rl/A/WxzX0f3mOHencpBVXmcgP0ajTZLN
 QLtA0fEI7FSOCSdK2f+x0MarfQ+otEKGlXXGCxcFYzhiP8tp1iz7ytwWTsBYe4Wmq3WV
 WSjzNqCd87ltAhwVyxadi+mGxeJ10B25cMEar+PZk6MoFL8N/Losxl5Z9kXgRkCx55NP
 mY6yW57xdK63Rce1UMANfPbmdhLQ/o1hrfwbcYx8lGLzw8+LJxXJ3s6HKgLYqiF5ITrs
 o4ZsvgfUJQKi00Ivk/vpjcFi6wKnCFrODvLWU7dU4+SKSkNvohXVagcFq8NZqtVLEq+f
 oSaQ==
X-Gm-Message-State: AC+VfDwCWBwrcSESx4WAzj8iBmvOmRvEJwG+RBEag+79U3Mi5L9YsmnJ
 TGXYfc/Wy/fOetdffedU6NvVOSkU/d9v0DbCogC8OQ==
X-Google-Smtp-Source: ACHHUZ4nHMDR4fDnDvudMyLLIsINhZrWnO4DTiE/k8PzNeIliAwEgt8O3VWc81UrXvwKPBNbeOR5HgqCVAgWao/1BQ8=
X-Received: by 2002:a05:6402:788:b0:50b:c665:55ea with SMTP id
 d8-20020a056402078800b0050bc66555eamr4753422edy.3.1683454161045; Sun, 07 May
 2023 03:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org>
 <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
 <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
In-Reply-To: <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 May 2023 11:09:03 +0100
Message-ID: <CAFEAcA9h6myNpkgmamxLHp_8We97eyGQpDb4PKPnwqL8rRzSTQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 5 May 2023 at 19:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/4/23 16:02, Peter Maydell wrote:
> > On Wed, 3 May 2023 at 08:15, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Instead of playing with offsetof in various places, use
> >> MMUAccessType to index an array.  This is easily defined
> >> instead of the previous dummy padding array in the union.
> >>
> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >
> >> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env=
, target_ulong addr,
> >>       if (prot & PAGE_WRITE) {
> >>           tlb_addr =3D tlb_addr_write(tlbe);
> >>           if (!tlb_hit(tlb_addr, addr)) {
> >> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> >> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
> >> +                                addr & TARGET_PAGE_MASK)) {
> >>                   tlb_fill(env_cpu(env), addr, size,
> >>                            MMU_DATA_STORE, mmu_idx, retaddr);
> >>                   index =3D tlb_index(env, mmu_idx, addr);
> >> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env=
, target_ulong addr,
> >>       } else /* if (prot & PAGE_READ) */ {
> >>           tlb_addr =3D tlbe->addr_read;
>
> read
>
> >>           if (!tlb_hit(tlb_addr, addr)) {
> >> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>
> write
>
> >> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
> >> +                                addr & TARGET_PAGE_MASK)) {
> >
> > This was previously looking at addr_write, but now we pass
> > MMU_DATA_LOAD ?
>
> This is the read portion of the read+write check.  The write portion is a=
bove in the
> previous hunk.  So this is an existing error, fixed here, and I hadn't no=
ticed.

Yeah, I wondered if it was a pre-existing bug. We should split out
the bug fix.

-- PMM

