Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0370E52AA6A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:17:04 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1kd-0000zq-0W
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1j3-0008OZ-7t
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:15:18 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1j1-00031J-FF
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:15:16 -0400
Received: by mail-pg1-x52e.google.com with SMTP id h24so12319836pgh.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4840HIlPsAg01x4ssWTJTV2DuV0GjByvEndfX2I5pkg=;
 b=GXebJQ/e4315abGeLvK3JdQJd8o/kTAnWfFaEYNvNJp+j7EFzEZ7wDYYpPsxLEppvn
 Pt5WsgmvQlqHI6my1pnB4eRgbhCClgG0CCBLV1TTAGyYtprZXtMetyg2PFhgCEw6GBM8
 K/5glzzWoLzbHuxlrYM9/T9lx+rA8C/LhNAqbuajY94tu6BN1EScWrDcPSCcM1MMaizQ
 M5arb5rLJeLEs2IS4tXFpak8PyDGQktqRUERc5gABui0cI8CHm6YY9DbkTu+h1qY0FBf
 DEqFZ++pt8QnBkRVJBwZA5/cGg0hNv7XDoPV7rc/VrWUduCje6GJosxm6p0a+Gi4rgVZ
 Dirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4840HIlPsAg01x4ssWTJTV2DuV0GjByvEndfX2I5pkg=;
 b=vS22/T0uvO1SIfUdRdpyVp0E94JdymLTyIEkBK6bUIRvxWqjvnJCIofkmn6vg0BiC+
 6bTntHmV5I2ZypIWOhM7u3w0uBKxst5Dv/kHQOotGd/+eZ/vIfMqysZCo1T1Jfv2JwaN
 BRu6EoyMbjo3N1bOqUEZa3kfw9fmnoJFIATZc2dxkF1u7OdilKpjn/jYbg3HMQDYYMSO
 mY5GzEiyxpLLjd9L7iRuPuFL5YQKjJYtwxsQrfOWCkXiLLzgqIo/E2bpPZqYETiC99Nf
 UWb2SWvTbT27Qp0vfdmE5KxD/aTiNzQNW4pwVk30w4bGNB+Z33lkj5BqT/pozVGiLo/c
 VBBw==
X-Gm-Message-State: AOAM530dY3h4NjTdagPk1KrXZtwwtNQxXN7GlR/d3hmkmg2UIrUNAs7q
 6V08hSyz22hYtCnNOqkQEu8bZA==
X-Google-Smtp-Source: ABdhPJxT68zs7zAdXAJ7jFOTg0lWS1yT8CrnK99MeXKhHWOIhCZ0dDg3Kow3ffCzkys0Y5DnhdiqPw==
X-Received: by 2002:a63:88c8:0:b0:3ab:1871:13b4 with SMTP id
 l191-20020a6388c8000000b003ab187113b4mr20654566pgd.85.1652811313978; 
 Tue, 17 May 2022 11:15:13 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p124-20020a62d082000000b0050dc7628150sm55580pfg.42.2022.05.17.11.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:15:13 -0700 (PDT)
Message-ID: <c27fcb6f-e159-3c45-0145-431911a020e8@linaro.org>
Date: Tue, 17 May 2022 11:15:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 07/16] tests/tcg: merge configure.sh back into main
 configure script
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 02:26, Paolo Bonzini wrote:
> tests/tcg/configure.sh has a complicated story.
> 
> In the beginning its code ran as part of the creation of config-target.mak
> files, and that is where it placed the information on the target compiler.
> However, probing for the buildability of TCG tests required multiple
> inclusions of config-target.mak in the _main_ Makefile (not in
> Makefile.target, which took care of building the QEMU executables in
> the pre-Meson era), which polluted the namespace.
> 
> Thus, it was moved to a separate directory.  It created small config-*.mak
> files in $(BUILD_DIR)/tests/tcg.  Those were also included multiple
> times, but at least they were small and manageable; this was also an
> important step in disentangling the TCG tests from Makefile.target.
> 
> Since then, Meson has allowed the configure script to go on a diet.
> A few compilation tests survive (mostly for sanitizers) but these days
> it mostly takes care of command line parsing, looking for tools, and
> setting up the environment for Meson to do its stuff.
> 
> It's time to extend configure with the capability to build for more
> than just one target: not just tests, but also firmware.  As a first
> step, integrate all the logic to find cross compilers in the configure
> script, and move tests/tcg/configure.sh back there (though as a
> separate loop, not integrated in the one that generates target
> configurations for Meson).
> 
> tests/tcg is actually very close to being buildable as a standalone
> project, so I actually expect the compiler tests to move back to
> tests/tcg, as a "configure" script of sorts which would run at Make
> time after the docker images are built.  The GCC tree has a similar idea
> of doing only bare-bones tree-wide configuration and leaving the rest
> for Make time.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure              | 398 +++++++++++++++++++++++++++++++++++++++--
>   tests/Makefile.include |   1 -
>   tests/tcg/configure.sh | 376 --------------------------------------
>   3 files changed, 388 insertions(+), 387 deletions(-)
>   delete mode 100755 tests/tcg/configure.sh

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

