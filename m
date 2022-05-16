Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C85288B5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:24:42 +0200 (CEST)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcaP-000642-Ek
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcO3-0002Bh-4D
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:11:55 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcNm-0003TH-HM
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:11:54 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j2so27640435ybu.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3KhamiiW8Zc+aALoJ7fG5e+Wv4ZWsco7WKizv07fuo=;
 b=Q+5+pdOz+5Is4wODnhrpFKYBEFa1nJDYGSlJq/hvQtflgdTP1LXwMshSEU8fMHTRNz
 +MpQrSyzW1Y88KW8jzBViFV4wZbO/yc96J2b9T3N0PslYNok/M4FkL67h8HyZIkrnb5u
 izMu5uPcBSEyrt5zubK0Tr+K/phUcWC756QtNkKoX1IBsqIsIVofw+1oBqT6vAgfrey+
 NGZZhoBsVTLhkoKsFpGJOKspySBOC8wrDUWgDHZ+Y+ObLjZ7qNW61ewMRaRccee1cRdD
 6txeLVuNBehJtOMAI9GU6cT4WhomHEtTv5XoTkKSLmTQjLdD7NufrLbmq3sA/HHnxbmR
 PapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3KhamiiW8Zc+aALoJ7fG5e+Wv4ZWsco7WKizv07fuo=;
 b=NeppKPDp2CY+P8P+8hiHaaTnQv3wKMhax3fOKHxSWPj4r7/DcKsAWeXz7RiKg96jPM
 C29eLKsMJKz5m+6zzeGLebC+6DUEwGTsZUgeKdDrGWvRZ1I8WhbFi9+KqifuYBSmslV1
 iBL7z4cm1DWmRdeNwY7gITHeuKF7hq+fhbWl8uWBqkbh+1Sh3R7lFTJ1NYbDIRyrnxD/
 rEzK1XSsRDflY4F0dAWNarO+L41qg7IiO+2QNdFhPabBb8+a5xcv/rDo+LLQoWLRQ5zj
 Y8oEuAk/tFsichf/JdDiY8M4WCAtNHkZVJbHxFawkhYLodaVygoEAMsIxGFKZXvi77Hy
 KVaw==
X-Gm-Message-State: AOAM532a5UnWtvD7Le7w133ORkcvImsWIl+ddohrPjNvjWmi26ULpbsG
 zCe2zmGmkvet5klhhrZn1NwEh+mnvFNIjvNbbEiQcg==
X-Google-Smtp-Source: ABdhPJxwmPu1rvs1UK71v5Uh+p3LXpE23LG2aLiloDhLUCaKorOj2u9FkXKmGUr/gf5Sq00w+ekLZZZ3zfNA61fomWk=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr4445002ybu.140.1652713874130; Mon, 16
 May 2022 08:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-6-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:11:03 +0100
Message-ID: <CAFEAcA-Ne6c8AjretP4cuSEajOHSbFwFCTVFm3a=w8gm+zzkbw@mail.gmail.com>
Subject: Re: [PATCH v2 05/74] semihosting: Add target_strlen for
 softmmu-uaccess.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 May 2022 at 20:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the user-only function of the same name.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/semihosting/softmmu-uaccess.h |  3 +++
>  semihosting/uaccess.c                 | 29 +++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
> index 03300376d3..4f08dfc098 100644
> --- a/include/semihosting/softmmu-uaccess.h
> +++ b/include/semihosting/softmmu-uaccess.h
> @@ -53,4 +53,7 @@ void softmmu_unlock_user(CPUArchState *env, void *p,
>                           target_ulong addr, target_ulong len);
>  #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
>
> +ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
> +#define target_strlen(p) softmmu_strlen_user(env, p)
> +
>  #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
> diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
> index 0d3b32b75d..3cd809122c 100644
> --- a/semihosting/uaccess.c
> +++ b/semihosting/uaccess.c
> @@ -23,6 +23,35 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
>      return p;
>  }
>
> +ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
> +{
> +    char buf[256];
> +    size_t len = 0;
> +
> +    while (1) {
> +        size_t chunk;
> +        char *p;
> +
> +        chunk = -(addr | TARGET_PAGE_MASK);

'chunk' is unsigned but we're assigning it a negative number here...
I assume this is doing some clever bit-twiddling trick but it isn't
very obvious.

In any case, rounding to a page boundary isn't sufficient to
avoid problems, because we don't mandate that RAM-to-device
MemoryRegion boundaries happen on page boundaries. I think you
either need to do this at a low enough level that you can
look at what MemoryRegion types you're reading from, or you need
to do it byte at a time.

> +        chunk = MIN(chunk, sizeof(buf));
> +
> +        if (cpu_memory_rw_debug(env_cpu(env), addr, buf, chunk, 0)) {
> +            return -1;
> +        }
> +        p = memchr(buf, 0, chunk);
> +        if (p) {
> +            len += p - buf;
> +            return len <= INT32_MAX ? (ssize_t)len : -1;
> +        }
> +
> +        len += chunk;
> +        addr += chunk;
> +        if (len > INT32_MAX) {
> +            return -1;
> +        }
> +    }
> +}

thanks
-- PMM

