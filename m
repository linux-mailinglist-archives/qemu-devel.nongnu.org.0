Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B564744D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 17:29:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Jkv-0002yC-Pc; Thu, 08 Dec 2022 11:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3Jks-0002xM-Cx
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:28:15 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3Jko-0007Vj-QA
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:28:14 -0500
Received: by mail-pj1-x1034.google.com with SMTP id u5so2058916pjy.5
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qF3Tl1BtJngOjOEyRPlipms8qVGqIMWbgIg6xXE1r1M=;
 b=ncotLYTCwlzYKsuDekW5yq7jwCNW65b2t9njQDo+B8deu7kObBJMW3yCxcuh890K/0
 j/ZYTKy5tEK9ApZk3p+u9cY1OO9zuZ95r8skUbhgys7iHoH463Z9qp7F1A1XMOvtQktw
 3ijHJRGZESanhMfmWWYUSaW0hWrWNKus6mc5jx6unJdvvdwNnJz4WLA7EFIW4zUvxfay
 +U4WJdA/m2QhaLVzYod1eGTtJTDcziZ+Gh8+bw74kJsGnJLrppfT+RrOIGbG2z/yp0LA
 DI1ePKmuD+gHKQfZbRLvuG3Sco3gR+1Z9bKIPaVdeL1UVWeKjA/zsxmokJjmPE0YoILD
 ziyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qF3Tl1BtJngOjOEyRPlipms8qVGqIMWbgIg6xXE1r1M=;
 b=VMX7Hnhfv44FgLjbSN70PfWm4K1t5fC7wJ4nR2W8ImKYgX2ekm4GEOXysX0oTsVSXZ
 7S3WgWAvAEo3CBNMvzeycx+hA9P7+ahA98pNI+Tgep27S8Fvv6SvYvqlrZSQEJczWEWf
 NYtvSlWGb12uAqUgfNpvBx9jbAAiOSIGy5qOMvV5QwwIeUmZUT5/slMZrrAgIDTnBdeN
 e3/R1zn/kAyLq3YTgILJjLmLLI0tDs3rYG8gU8o2gkqmm1L/9GusEvmuKEOqfeuV6A1d
 qyjQeqKPhwQr/23LdvTfN5fE+gwZVkntvXWmqjPvnvgGE+owbiG1W4vwvPTqEhDpkL9w
 Xw/w==
X-Gm-Message-State: ANoB5pmz7nTmGCygKrkJyuvwSfzy0k3fBB+6O8KfqSfikAdimBUTfBaS
 hebK+SAH4s7JCqA/47K5IC3FDZ3qKNi64+BC7Gihkg==
X-Google-Smtp-Source: AA0mqf6fVRuRUrg10PmGtNgOLn3CJulUTHqt0wcHZXQyFOLhxZDI9ONlJqOUjKp79N4awSKc5TTRb43LHdFIFYtRVC8=
X-Received: by 2002:a17:90a:ac0b:b0:219:9874:c7d3 with SMTP id
 o11-20020a17090aac0b00b002199874c7d3mr27683065pjq.221.1670516889025; Thu, 08
 Dec 2022 08:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20221208161152.28976-1-philmd@linaro.org>
In-Reply-To: <20221208161152.28976-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Dec 2022 16:27:57 +0000
Message-ID: <CAFEAcA8jC_tXvN6WwcO1YHmBw_L5iDiCa8HUMLAo3H_vmbieRQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0] hw: Avoid using inlined functions with
 external linkage
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Babu Moger <babu.moger@amd.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 8 Dec 2022 at 16:11, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
> and building with -Wall we get:
>
>   hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove=
_by_asid_iova' is used in an inline function with external linkage [-Wstati=
c-in-inline]
>   hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function =
'smmu_iotlb_inv_iova' internal linkage
>     void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>     ^
>     static
>
> None of our code base require / use inlined functions with external
> linkage. Some places use internal inlining in the hot path. These
> two functions are certainly not in any hot path and don't justify
> any inlining.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC: Any better justification?

I don't really understand what the warning is trying to warn
about, and googling didn't enlighten me. Does anybody understand it?

In any case, it does seem weird to define a function inline and
also have it be defined in a C file rather than as a 'static inline'
in a header file, so these are likely oversights rather than
intentional.

> ---
>  hw/arm/smmu-common.c | 10 +++++-----
>  hw/i386/x86.c        |  3 +--
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e09b9c13b7..298e021cd3 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -116,7 +116,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *c=
fg, SMMUTLBEntry *new)
>      g_hash_table_insert(bs->iotlb, key, new);
>  }
>
> -inline void smmu_iotlb_inv_all(SMMUState *s)
> +void smmu_iotlb_inv_all(SMMUState *s)
>  {
>      trace_smmu_iotlb_inv_all();
>      g_hash_table_remove_all(s->iotlb);
> @@ -146,7 +146,7 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointe=
r key, gpointer value,
>             ((entry->iova & ~info->mask) =3D=3D info->iova);
>  }
>
> -inline void
> +void
>  smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                      uint8_t tg, uint64_t num_pages, uint8_t ttl)

While we're changing this, can we put the "void" on the same line as
the rest of the function prototype, to match the style of these other
functions ?

>  {
> @@ -174,7 +174,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_=
t iova,
>                                  &info);
>  }
>
> -inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asi=
d);
> @@ -374,7 +374,7 @@ error:
>   *
>   * return 0 on success
>   */
> -inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags=
 perm,
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>                      SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)

This second line now needs re-indenting.

>  {
>      if (!cfg->aa64) {
> @@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *=
n)
>  }
>
>  /* Unmap all notifiers attached to @mr */
> -inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
> +void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
>  {
>      IOMMUNotifier *n;

> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 78cc131926..9ac1680180 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -64,8 +64,7 @@
>  /* Physical Address of PVH entry point read from kernel ELF NOTE */
>  static size_t pvh_start_addr;
>
> -inline void init_topo_info(X86CPUTopoInfo *topo_info,
> -                           const X86MachineState *x86ms)
> +void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x8=
6ms)
>  {
>      MachineState *ms =3D MACHINE(x86ms);

This function is not used anywhere outside this file, so we
can delete the prototype from include/hw/i386/x86.h and
make the function "static void".

With those changes,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

