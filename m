Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21074E7405
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:14:29 +0100 (CET)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjls-0007tu-UG
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:14:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXjkN-0007BT-4Z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:12:55 -0400
Received: from [2607:f8b0:4864:20::1135] (port=41060
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXjkL-000131-Lt
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:12:54 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e6ceb45174so42797297b3.8
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZpjuFFTl/dm9JwX45C9HkZ4zP02fAm50fBmj/eKc24=;
 b=MDuTCzZqXNu3MurxUT6XKuZ8py+H/UWo9XXjk2ZSe137gGe6dkSUqIwQUcEoZUFAix
 iioVWl1aqpst3x70OCZYakPHYnTMr89sDakCKdRdpvfyiOIKw1Cj+BtqBoqyIVleG1N3
 RWDbSrHIH4DYF0pJYrUQusGqlNVQM0YVLrhmq5ct2Jsl3wMxpq1e/i56zvKJrKExdvyG
 yptuf7JjhLuGk6E+tanRBUVjCCPJwegLPYsmRBaB9FqRwUlguoV8CrWQPshxk+hM2K7J
 OcyzPmnD9r7mCg4P4VvFBqi43rbKcyf3dEokBc5ugiM8JqGk0ghLZXX36YkvTZdkCXXL
 Jdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZpjuFFTl/dm9JwX45C9HkZ4zP02fAm50fBmj/eKc24=;
 b=ZhGLwBuvYM83lKzTbYyf7sPcRB+eWuiHLqEGOzQy37pEVt+iSjQH+xCcuVJ9L4sb75
 KPSq7fDAZYAyBAcT63DB0nCtn52iNgtAW4phzFqL4vlSI5chE7MSTutFCMSDmsrUfoNv
 hO38sL/KqwIbP0ztnNeLxsJOE8AseXhV2Mz5srZ5CF4Ekqh+hooNXpBawTCR8vuhDYaP
 wfdeBzWodAICxN8pO9iw1wxqmq9x7hJXaZjPKI3LLXl5Qycq3tDRJhOpLrGuYjIPyDhl
 sfhazZNoSxqL0yGYmC3ZjjYao48urPnRwkb6qGUhXzaCvrxox9PG6Rf0BfBndLd5AoNG
 I1GA==
X-Gm-Message-State: AOAM5336hVyZx0iUR3+OOS8Hb6A/XYHtMN1T/dCrq3mZVztr8iRoFCsJ
 2hm1OkkYiCiLiGlCmrRH56x12BrZyEBS8P2ya/YclQ==
X-Google-Smtp-Source: ABdhPJyysXq5eLimDLgPlp6UAlqerubnGEJMcsS79SqknmWKfMmF+kjiIkImD+dIO+wYTdvhD+heCuufdaXgorzZEWM=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr10757640ywf.469.1648213972622; Fri, 25
 Mar 2022 06:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220318085931.3899316-1-liucong2@kylinos.cn>
In-Reply-To: <20220318085931.3899316-1-liucong2@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 13:12:39 +0000
Message-ID: <CAFEAcA8uqRbZzEaZOh4xjeqhEbxy82UxjeRBMfhNsbAoXzk_Vg@mail.gmail.com>
Subject: Re: [PATCH] kvm/arm64: Fix memory section did not set to kvm
To: Cong Liu <liucong2@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 at 14:24, Cong Liu <liucong2@kylinos.cn> wrote:
>
> on the arm64 platform, the PAGESIZE is 64k, the default qxl rom
> bar size is 8k(QXL_ROM_SZ), in the case memory size less than
> one page size, kvm_align_section return zero,  the memory section
> did not commit kvm.

Can you give more details on how this happens? The only place
we use QXL_ROM_SZ is in the qxl_rom_size() function, and that
rounds up the value it returns to the qemu_real_host_page_size.
That change was added in commit ce7015d9e8669e, exagctly to
fix what sounds like the same problem you're hitting where
KVM is in use and the host page size is larger than 8K.
Are you using an old version of QEMU that doesn't have that fix ?

> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---
>  accel/kvm/kvm-all.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 27864dfaea..f57cab811b 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -318,6 +318,7 @@ static hwaddr kvm_align_section(MemoryRegionSection *section,
>                                  hwaddr *start)
>  {
>      hwaddr size = int128_get64(section->size);
> +    size = ROUND_UP(size, qemu_real_host_page_size);
>      hwaddr delta, aligned;
>
>      /* kvm works in page size chunks, but the function may be called

The comment we can just see starting here says:

    /* kvm works in page size chunks, but the function may be called
       with sub-page size and unaligned start address. Pad the start
       address to next and truncate size to previous page boundary. */

but your change means that's no longer true.

More generally, rounding up the size here seems dubious -- there
is no guarantee that whatever follows the small lump of RAM
in the address space is sensible to treat as really being
part of the same thing.

thanks
-- PMM

