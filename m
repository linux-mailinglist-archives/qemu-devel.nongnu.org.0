Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064796C033B
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 17:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdw6y-0004O6-Tq; Sun, 19 Mar 2023 12:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdw6w-0004NW-IT
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 12:42:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdw6u-0002Is-HB
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 12:42:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so14083987pjt.2
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679244137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KDbDDcd1STS0B94OLiec+C9BpIS98rAvZ4qMwXPqo1M=;
 b=pFGrViV9pN47uoJBRRsbVTuFWG/XjR/lp6+JRxhPOOnenKDVyaP3iQDIx8HlZJMvl1
 Pixo6nTVovvLUkmW6V7QnbCMbq7UqLDbr3OS54w0TaDQww/9YXJ9bZMwVy4Qv8d2OTnw
 gfmz8Qvi+uRG/OfoqBCE6XxVpM+Qg9iq8WhrLVTLtKLoFDKT54J6r7pmi3sxXgcv6Mjx
 G1df0ff07+upLoEISHzwaMh7olAsuPH/+PdgyelAFIp1EBqo0lsouiTRpX7J9fvE198Z
 ynmHVVP7ytJWjRJ3ihAg0FeOqTHbyxQQrUnNPRtyIvAK1marFepSnHWNohPAAPSoTK6s
 SxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679244137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDbDDcd1STS0B94OLiec+C9BpIS98rAvZ4qMwXPqo1M=;
 b=js6YzmB+aFHTYIy7L2OB/eA5hEA5WlE9OnoxS6Z48hlDbdeCFiMzgZBG0viiLTjKu9
 irCEUi5eQ6vr/tSOKA0y3F3lWQbpCmt+VKcyGnpiP5vldxguqB8EIguV8NSFKHLcLoBD
 LJawAePIkVlruRTB7xSdHOm0gIyxO/U54XCq01RltEwbpzNUNemkgL+TsczlZ0L91hoE
 zl1q4XQexK1hzH914l3Ycae0dGFze/d3eEKWYEZCwAbh2QKrrAnxsg8M0GaS5qx58y8I
 zGg8+6VUGb/EiDDvPehr/kcu/YVNFssVRHFjLiiHkqBkiqCQoR2ulkrKUM3DhtttPEob
 Gmsw==
X-Gm-Message-State: AO0yUKVBklMj5Q7YuN5vDs47YOFQNxA/1gSt4QVBM4kErfpW2fIEkb/P
 AKnIVEugKHhyoLhqRMhteaYYJVULr4j2i3+ml8yTww==
X-Google-Smtp-Source: AK7set/hgI7NObmEQL6jlkLsKF/rFm4ZRi9mWsZ8agOqoUu4QpysCsOALP2x/QsqL5cOc0KsY7Ur33RGFQChIOgHCC4=
X-Received: by 2002:a17:903:183:b0:1a1:d366:b0bd with SMTP id
 z3-20020a170903018300b001a1d366b0bdmr12034plg.9.1679244136968; Sun, 19 Mar
 2023 09:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230318185931.181659-1-shentey@gmail.com>
In-Reply-To: <20230318185931.181659-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Mar 2023 16:42:05 +0000
Message-ID: <CAFEAcA8q+2iJ+r7HMnrYsmkCZ=2bDN-LNqOG=oc3F0u6eYST0w@mail.gmail.com>
Subject: Re: [PATCH for 8.0] qemu/osdep: Switch position of "extern" and
 "G_NORETURN"
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Sat, 18 Mar 2023 at 19:00, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Fixes the Windows build under msys2 using GCC 12 which fails with the following
> error:


Apparently it also fixes the compilation with Clang 15 (see
https://gitlab.com/qemu-project/qemu/-/issues/1541 ).

You could use a Resolves: tag so the bug gets closed when
this is applied.

> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f68b5d8708..9eff0be95b 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -237,7 +237,7 @@ extern "C" {
>   * supports QEMU_ERROR, this will be reported at compile time; otherwise
>   * this will be reported at link time due to the missing symbol.
>   */
> -extern G_NORETURN
> +G_NORETURN extern
>  void QEMU_ERROR("code path is reachable")
>      qemu_build_not_reached_always(void);
>  #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

