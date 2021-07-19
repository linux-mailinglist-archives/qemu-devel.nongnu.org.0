Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A33CD447
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:03:49 +0200 (CEST)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Rzw-000777-UT
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Ry2-0004aK-Sw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:01:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Ry0-0003TP-28
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:01:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id c17so28197648ejk.13
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fHsakPnjOpboRDbcIhMyz7tPQWKVIJXPDo3UqEukTjI=;
 b=B9Z+4Cq8xhJD5xdygIftqBlm+aeFFyNEB56Vlyj7PaEyflY4KtEMHlAr8BKnM6d6ER
 F9uK3LIgg7DCw0IWFBRBlWOMOGCb0g/PPTxDQH8jAHBRV1eCvCQf8NwCnFXKy9IFx5LB
 f2DJm1twnAvFk/1fUuJfim8+Xbbndyde7hOXnnrl1NI1c1vpvBRY7nugl+Yoybb5hpF9
 xUGQvJxX8iieSFOExOY3amuYU3+/2n/2eJ0NI8G3nrCUiQ3Fu152P7PufAasyIm9LQ03
 VaX5Fa8LU1dN1AoJ30Zs0VrzOYMkMvwNo4TOoAMQ4ZpZvK3ouunIr+NCcBq1aXJBke3E
 f+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fHsakPnjOpboRDbcIhMyz7tPQWKVIJXPDo3UqEukTjI=;
 b=EihoVvbUqakl47Im6m2xovebPL5N4uYD5bM2/ICBmw85k0ajBnBPfo48rOiAWeUDza
 ViFrcH/MNXScUnSdTOwPg0tcaPnLq8uzRVuDvvkYmM+w1QEggJsXbWmt6K0fPvr55hXe
 flsAeZrFR21TV02fTY10vEXtiNbp5PVjO2j/S3HAJK5q6tCtU/XToF9sYEoPmupEhqAg
 yHzwzC3a3ksqyyPnmxwb/EOal0ijbsq2qotSzBalUsySbc+vBj+LWPnr5/cQWnGtqezE
 kSz+SQCfiHpfQ3Jb95MldU9UnVOdsiNnFomEs7CwbvCQyUMtXankhEzQiyo2TKrYayYc
 yghA==
X-Gm-Message-State: AOAM533cLG+0rt6ZK8qkT+R56yXahcEPL9kFhbO4Y/M2dwy0++v/XbxG
 TpCSI1NrUKhWWnSkeCdK8xskz409gG9Ip2CNw70vVw==
X-Google-Smtp-Source: ABdhPJyhUCCAb06pSYaJHjA0QDWhqnA8F3nM8yfEmBjnBBiBbfVQLf6y/U9LZla+scOeGvcSxsSqJAexwzxHO2mz56w=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr20246952eja.85.1626696106185; 
 Mon, 19 Jul 2021 05:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-2-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:01:05 +0100
Message-ID: <CAFEAcA8VMzowUJQL=ccTCHyc0wghMc+fQOXFTSRE56sZL4rNbw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] qemu/atomic: Use macros for CONFIG_ATOMIC64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Clang warnings about questionable atomic usage get localized
> to the inline function in atomic.h.  By using a macro, we get
> the full traceback to the original use that caused the warning.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/atomic.h | 25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)
>
> diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
> index 3ccf84fd46..99d6030095 100644
> --- a/include/qemu/atomic.h
> +++ b/include/qemu/atomic.h
> @@ -457,26 +457,11 @@
>
>  /* Abstractions to access atomically (i.e. "once") i64/u64 variables */
>  #ifdef CONFIG_ATOMIC64
> -static inline int64_t qatomic_read_i64(const int64_t *ptr)
> -{
> -    /* use __nocheck because sizeof(void *) might be < sizeof(u64) */
> -    return qatomic_read__nocheck(ptr);
> -}
> -
> -static inline uint64_t qatomic_read_u64(const uint64_t *ptr)
> -{
> -    return qatomic_read__nocheck(ptr);
> -}
> -
> -static inline void qatomic_set_i64(int64_t *ptr, int64_t val)
> -{
> -    qatomic_set__nocheck(ptr, val);
> -}
> -
> -static inline void qatomic_set_u64(uint64_t *ptr, uint64_t val)
> -{
> -    qatomic_set__nocheck(ptr, val);
> -}
> +/* Use __nocheck because sizeof(void *) might be < sizeof(u64) */
> +#define qatomic_read_i64  qatomic_read__nocheck
> +#define qatomic_read_u64  qatomic_read__nocheck
> +#define qatomic_set_i64   qatomic_set__nocheck
> +#define qatomic_set_u64   qatomic_set__nocheck

Previously if you tried to do qatomic_set_i64() etc on something
that wasn't an int64_t*, the compiler would complain. Now it will
silently store a different-sized value, I think. Is there a way
to retain the typechecking in the macro versions?

thanks
-- PMM

