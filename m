Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B32EA524
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 07:03:38 +0100 (CET)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwfRQ-0004SY-M7
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 01:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kwfQE-000406-9o
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 01:02:22 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kwfQB-00066d-4T
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 01:02:21 -0500
Received: by mail-io1-f50.google.com with SMTP id t8so27208742iov.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 22:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTzxSGFYjsTuRn+Fsi7JwUF9CLWoz6VSzKtiGx6ejvc=;
 b=cOIcLSJ78kUZoyznU3exCv+GmezNijdBftZlq/Kkkzg9Hcd90rjMoC1AD31mAku05w
 SBEMFCPyxJLfqotKYYKNsSjEbID8ujH3/832zLHJoRhHjchKPA8vj7bRyZjfc+Qsz4+/
 H+UHLQ4BeYQ4oGmQa2KdgXzIv2bLaqa6WFGqrVRoZZgf8a3uKg2uG1+wVV3uVeCPABBn
 3gM2z0n4b9EPEMxMdGL64lE3IylkauSI/0eClgsOBoR0zo0k36ba2hC/i9Fd4/BmIP6H
 r8hNAMQktcNd9RD0R6z9QHQ/Rbqb7WVX7rgEfHIYLlE08ph8jTSWfUU+2yJ/p8elkN+y
 PM+A==
X-Gm-Message-State: AOAM530Ru6HB3KTRlMoa26L8coAWWqVU0ifg5j2LAU4X7daE19oHIP8q
 LzEwIx39pho/ttMx/H/Zrzx85c0aojU=
X-Google-Smtp-Source: ABdhPJx+p1QE7DyIE4LawtPaORMWJ0rJlCXafaEGrDSFXyKI9JFSzy3RZ1sBpKcFdlg97LUVlG2TBA==
X-Received: by 2002:a02:9469:: with SMTP id a96mr65321408jai.86.1609826537385; 
 Mon, 04 Jan 2021 22:02:17 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id p5sm40609539ilm.80.2021.01.04.22.02.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 22:02:17 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id q5so27565645ilc.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 22:02:17 -0800 (PST)
X-Received: by 2002:a92:84c1:: with SMTP id y62mr73064340ilk.191.1609826536887; 
 Mon, 04 Jan 2021 22:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-20-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-20-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 4 Jan 2021 22:02:06 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAuz8F2Xvw=h7xhYbrMnVhpRWrpEraV=QpQRfPsCuDgAA@mail.gmail.com>
Message-ID: <CA+E+eSAuz8F2Xvw=h7xhYbrMnVhpRWrpEraV=QpQRfPsCuDgAA@mail.gmail.com>
Subject: Re: [PATCH v4 19/43] accel/tcg: Support split-wx for darwin/iOS with
 vm_remap
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.50; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Guarding MAP_JIT with

if (!splitwx) {
    flags |= MAP_JIT;
}

is better because MAP_JIT tells the kernel that we want a RWX mapping
which is not the case. On iOS, special entitlements are needed for
MAP_JIT.

-j

On Mon, Dec 14, 2020 at 6:03 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cribbed from code posted by Joelle van Dyne <j@getutm.app>,
> and rearranged to a cleaner structure.
>
> Reviewed-by: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 65 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 1931e65365..17df6c94fa 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1166,9 +1166,71 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
>  }
>  #endif /* CONFIG_POSIX */
>
> +#ifdef CONFIG_DARWIN
> +#include <mach/mach.h>
> +
> +extern kern_return_t mach_vm_remap(vm_map_t target_task,
> +                                   mach_vm_address_t *target_address,
> +                                   mach_vm_size_t size,
> +                                   mach_vm_offset_t mask,
> +                                   int flags,
> +                                   vm_map_t src_task,
> +                                   mach_vm_address_t src_address,
> +                                   boolean_t copy,
> +                                   vm_prot_t *cur_protection,
> +                                   vm_prot_t *max_protection,
> +                                   vm_inherit_t inheritance);
> +
> +static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
> +{
> +    kern_return_t ret;
> +    mach_vm_address_t buf_rw, buf_rx;
> +    vm_prot_t cur_prot, max_prot;
> +
> +    /* Map the read-write portion via normal anon memory. */
> +    if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
> +                                    MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
> +        return false;
> +    }
> +
> +    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
> +    buf_rx = 0;
> +    ret = mach_vm_remap(mach_task_self(),
> +                        &buf_rx,
> +                        size,
> +                        0,
> +                        VM_FLAGS_ANYWHERE,
> +                        mach_task_self(),
> +                        buf_rw,
> +                        false,
> +                        &cur_prot,
> +                        &max_prot,
> +                        VM_INHERIT_NONE);
> +    if (ret != KERN_SUCCESS) {
> +        /* TODO: Convert "ret" to a human readable error message. */
> +        error_setg(errp, "vm_remap for jit splitwx failed");
> +        munmap((void *)buf_rw, size);
> +        return false;
> +    }
> +
> +    if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
> +        error_setg_errno(errp, errno, "mprotect for jit splitwx");
> +        munmap((void *)buf_rx, size);
> +        munmap((void *)buf_rw, size);
> +        return false;
> +    }
> +
> +    tcg_splitwx_diff = buf_rx - buf_rw;
> +    return true;
> +}
> +#endif /* CONFIG_DARWIN */
> +
>  static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
>  {
>      if (TCG_TARGET_SUPPORT_MIRROR) {
> +#ifdef CONFIG_DARWIN
> +        return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
> +#endif
>  #ifdef CONFIG_POSIX
>          return alloc_code_gen_buffer_splitwx_memfd(size, errp);
>  #endif
> @@ -1201,6 +1263,9 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
>  #ifdef CONFIG_TCG_INTERPRETER
>      /* The tcg interpreter does not need execute permission. */
>      prot = PROT_READ | PROT_WRITE;
> +#elif defined(CONFIG_DARWIN)
> +    /* Applicable to both iOS and macOS (Apple Silicon). */
> +    flags |= MAP_JIT;
>  #endif
>
>      return alloc_code_gen_buffer_anon(size, prot, flags, errp);
> --
> 2.25.1
>

