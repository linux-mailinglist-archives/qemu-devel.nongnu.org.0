Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A0E694DBA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:09:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcJa-0004jJ-Mz; Mon, 13 Feb 2023 12:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRcJW-0004fy-CC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:08:26 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRcJS-0000Ug-9Y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:08:26 -0500
Received: by mail-pg1-x533.google.com with SMTP id u75so8531440pgc.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676308101;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zBgQ2Kv70clb7onBellHSuQSnMxfuFif80PLTHE/VNQ=;
 b=ZCKsUyVUONtykARlsZC9DHmdAJQM2zjOr2nFRBmUTRkSzmkvSH/AFxabQBYwwMdHTl
 Jvy/dnThkfG+GIXXN0XON+LzhhBFQBh5Jvka/dhY3dYi31LZpdpoC6njUBgGSR8w+4r1
 d//SNPDu/Ko9X2nYwke+QwHKcbIPhxG5yfBJvdFtfBnT3GDKkNO2QVGT4BjRd8wbw2mh
 AxMI+QMoeXj8Dnl/Si6N2U0fQCZYkZ8oUHEGE8Tj8yZBacAOmFulN48OUMCS4o8ANEk7
 A5JYyunz+EmrdqaPUQmPihhLFsNoGcdW4Twk/IArfm89QF7vUumE1uK1RSjL6j4F3k4N
 CC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676308101;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBgQ2Kv70clb7onBellHSuQSnMxfuFif80PLTHE/VNQ=;
 b=gZTRTznr4yjItiripoiBMr2qBoMovmEe7zuN9BQmqQTMLeyIgjsPRUcSistJO4n9q7
 SqsTd46wsvxzuCGLgWYFeurtGntLp7M7JDs+V44+n2XSHsq3P6CGu8YGmrWWsi4UW7iV
 0Zwv62wjcglqkWo77SLk5VjaHQzKTs/9U7prWbwLv7WZgLyhFmeI7o+2H9g6EOf4Mofm
 4JrbhVZVJp+06u7e8wd4aM2vCSTU3TR48/YNg9TWclFfSksA8sgWpSIYDGw67F2ITgmA
 hoDdUAdD50ZNiuQkc08TOFQTK7NBcenTe34xUl9Jw1NzYMijtEA1tgfQg0VGuj1Qa9U/
 GP9Q==
X-Gm-Message-State: AO0yUKWOdF+oIrvbvlQVGCqWyqHHrqMEOMdT8+r/DJtgnAHEPcciZFpH
 +/JrQDuQjnu3X031Gg9Pab6N+/VjWvy31o3OUJXi5A==
X-Google-Smtp-Source: AK7set9jUoQvPc1yTd2cDigZ2Pt5mQddG3AyzrotGx7NyzVUSNAb0DfT9o3Dl1y4huvUYKF6SIQamt2wNX4M4GOMNmc=
X-Received: by 2002:aa7:9ec5:0:b0:5a8:beb3:d561 with SMTP id
 r5-20020aa79ec5000000b005a8beb3d561mr591920pfq.17.1676308100717; Mon, 13 Feb
 2023 09:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-6-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-6-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 17:08:09 +0000
Message-ID: <CAFEAcA_VM_nCp0rC9PxZ=VT+PpXtuom0Tb6FvtrRMcRC4FArEg@mail.gmail.com>
Subject: Re: [PATCH 5/7] targer/arm: Inform helpers whether a PAC instruction
 is 'combined'
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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

On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> An instruction is a 'combined' Pointer Authentication instruction if it
> does something in addition to PAC - for instance, branching to or
> loading an address from the authenticated pointer. Knowing whether a PAC
> operation is 'combined' is needed to implement the FPACCOMBINE feature
> for ARMv8.3.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---


> -uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
> +static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
> +                            bool is_combined)
>  {
>      int el = arm_current_el(env);
>      if (!pauth_key_enabled(env, el, SCTLR_EnIA)) {
>          return x;
>      }
>      pauth_check_trap(env, el, GETPC());

You can't move a GETPC() into a sub-function like this : it has
to remain in the top level helper function. If you need the
value in a sub-function, you need to pass it down. This is why
pauth_check_trap() has its 'ra' argument. (See patch 6 review
comment for more explanation.)

> -    return pauth_auth(env, x, y, &env->keys.apia, false, 0);
> +    return pauth_auth(env, x, y, &env->keys.apia, false, 0, is_combined);
>  }

thanks
-- PMM

