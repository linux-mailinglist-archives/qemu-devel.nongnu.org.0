Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2730C3C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:29:53 +0100 (CET)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xcm-0002Yy-Jm
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6xFD-00050S-NQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:05:31 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6xFA-0003GD-KV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:05:31 -0500
Received: by mail-ej1-x631.google.com with SMTP id w1so30418375ejf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bN4w6xbMIUA+ZUGv136519BHvwmxs47yo8pMTYvgCAI=;
 b=bB3XKUqghLOc6FcJJ0QiMrlAVMRS6e97pOair2PSFwyxuDh0Yj9IPJXGQz98bl12T2
 R/kYE6IFXrulQZLwjq/U6gqquSqVlOCJ5kELIygdjLVaWcPPC5GLVctLKntQ9shssp5X
 F3L5UOuYks1UgPyVnv23QwGsn+t/EQJC6XUQMVXCuFlDNJao37RpA4CBir59jwvZbuH6
 XBYQJwgGnbYi+X6EzcsJxWLowBL3z0peDzLiouskF8+hrgmAUnJbBJ0xMkehLpzIXi8j
 KXZTVmDpFSwxwmOAmrQ0bkjFFDRjAUbhb/DRXeNFcQsvy7ISx+JK1CM8e7CzKbICYXLP
 69Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bN4w6xbMIUA+ZUGv136519BHvwmxs47yo8pMTYvgCAI=;
 b=APZWFXvlNH3AXsTt7LanTtHBgRKKA74refbdSnn57dROiOpN7pAJPiicyMI5vyFd1u
 r1F03rHHCx7cm1mNheBVMnipIoWcFiH8crY3PAdy3j22yGMVVZJaskO/2zYd3jQ3zITp
 fCdkjcsF4ub9SEAWvAB/ieMawag4xAF0zdWqMclEFYH/7kzHwqwKu69UPjgeLrRbFXxb
 icOsBcVQq9aUrAc0jRc75tpueD8EPDMCcZZXZE1iOvrP4nwl7lFbuc0tHSIjdPa5K0O/
 ivuTVKJgJlpmZktOVLeSWyKlrPr7N44nRbp3zFL3Zqu8N9KgSxkuDSVgS9RHJOgjrBhq
 ZcnA==
X-Gm-Message-State: AOAM533ZkVIlMzzIGOfOX4fx5tUyVi9rEJ3PLZFA+RvBqWG4vrIp9jnL
 m1mAkpPcUQ6jn4vc775PwRqlAuDGNNkFfhRJspN7Vg==
X-Google-Smtp-Source: ABdhPJyhz6wK25IHDgliUQyf1ITYmpqmgAiW8DBkGuq7csgOsKLvJEnM2NpxHao6FS/Unj1pkFDhKn9skhAPUeQICJY=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr23070181ejt.56.1612278326504; 
 Tue, 02 Feb 2021 07:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-12-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 15:05:15 +0000
Message-ID: <CAFEAcA_Y4W-zGpE7YWVnTmwtK73DWwDb1K8DLxfz4M5tbX1W1Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] exec: Add support for TARGET_TAGGED_ADDRESSES
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The AArch64 Linux ABI has always enabled TBI, but has historically
> required that pointer tags be removed before a syscall.  This has
> changed in the lead-up to ARMv8.5-MTE, in a way that affects the
> ABI generically and not specifically to MTE.
>
> This patch allows the target to indicate that (1) there are tags
> and (2) whether or not they should be taken into account at the
> syscall level.
>
> Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
> pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
> in the arm64 kernel source.
>
> The prctl syscall is not not yet updated, so this change by itself
> has no visible effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index e62f4fba00..1df9b93e59 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
>  #define TARGET_ABI_FMT_ptr "%"PRIx64
>  #endif
>
> +static inline abi_ptr untagged_addr(abi_ptr x)
> +{
> +#ifdef TARGET_TAGGED_ADDRESSES
> +    if (current_cpu) {
> +        return cpu_untagged_addr(current_cpu, x);
> +    }
> +#endif
> +    return x;
> +}

Can we use thread_cpu here instead of current_cpu ?
I'm more confident that for linux-user that is always valid
than I am about current_cpu (which is documented as only valid
inside cpu_exec(); we used to deliberately NULL it out when
we're not actually in the middle of guest code execution,
but I think we have stopped doing that at some point.)

thanks
-- PMM

