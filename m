Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E0664E85
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFMm5-0004ds-QQ; Tue, 10 Jan 2023 17:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFMm3-0004dU-Gb
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 17:07:15 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFMm1-0005NW-QI
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 17:07:15 -0500
Received: by mail-pj1-x102d.google.com with SMTP id n12so13880448pjp.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wW+CnXgfExubGnVii7hVTKZLWDcf6z3kKoQODMIhaek=;
 b=MT62ytBsNBsUPyn1+G6fW32AmetdGDyeqFm8NOTmeYtkOEn3eqR8bVGMqgaFRDfbf5
 qXsGSoziacM4zcoxKw7bZUHYpzQ24nkEmNr5XlmngZ1vyOml+SRA34vPnF/uIVEa6E6v
 gJ2h5iIVryDdSHpa1vdg5tQjlnLi/bc2OuSINzNTdTwBnG9kTl4qIucnHbWeDqBmGg21
 INfFlpn9CahX7R8NQG8rSWDv+d3noGST9TKlND+kXFOYDcgpsSmHBn5v/JrDsJwBu59L
 fXuqqDbi/uNUFtGKDBD9MQsJ2q+7kFfqusmMaR1LBDBBMJHG2yjyN+LZaVki02pivCAV
 v+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wW+CnXgfExubGnVii7hVTKZLWDcf6z3kKoQODMIhaek=;
 b=E8wG7hhhpy9tuHZYPRO6ldv9jDg+Mic18kHnKGHRU8UCnAF4905ATu0ke6+Nzd4Sk+
 N+NjzKKREogHQLxz5qI6zWz852+TUPRGqlzVIfLwQ40WT+fIVEvDgJCZJIph59A0+8mx
 9W7kBLOQ1pgRmPxiQgYGA/wfeNM32Ah4SSXq6RjHdYkZO8hstTFSj65Ay+g1OozIue40
 jZALCx6Bc2evfguTT47Ry3VHyzbWLV5x0ZKbmCYnktRarcB8KpPNb29Jy1VJXdm9amyU
 G3wbzXcwN5OM0AnIJXZ7yAMskIZxaEdC1eb+elhbBQav38dJTcsWGpcY4P1/gnyLUgN3
 f/rg==
X-Gm-Message-State: AFqh2kquGU3/6fY0yTJaARJUhjfgx9NNRuqoPGSFOKK7o9t2da6ZP2FZ
 s2ntTLi6B2dGQPpDNr1qQQfWBoTWZUQ82+ebqynuZg==
X-Google-Smtp-Source: AMrXdXsADwYReE5UnhHhncA/zTtxge5at+FCt6hCEqc1cS69MVSvN/F/b9o2k9rOgiIon4HKz0q1IIeaf04vPHPuBsA=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr5689009pjs.19.1673388432270; Tue, 10 Jan
 2023 14:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20230110160233.339771-1-pbonzini@redhat.com>
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 22:07:01 +0000
Message-ID: <CAFEAcA_Rhfz27vM5dUMdxQae8W3HJUoAxC3VOHNx8xxObs+=8w@mail.gmail.com>
Subject: Re: [PULL 00/29] Misc patches for 2023-01-10
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Tue, 10 Jan 2023 at 18:29, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 3d83b78285d6e96636130f7d449fd02e2d4deee0:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-01-08 14:27:40 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to cd78f1d264c1ac7dfd7fa50abce0dec71a1f41ac:
>
>   configure: remove backwards-compatibility code (2023-01-09 16:54:56 +0100)
>
> ----------------------------------------------------------------
> * Atomic memslot updates for KVM (Emanuele, David)
> * libvhost-user/libvduse warnings fixes (Marcel)
> * i386 TCG fixes (Joe, myself)
> * Remove compilation errors when -Werror=maybe-uninitialized (Eric)
> * fix GLIB_VERSION for cross-compilation (Paolo)
>
> ----------------------------------------------------------------

This provokes a new warning in compiling the testsuite on ppc:


../../tests/fp/berkeley-testfloat-3/source/fail.c: In function 'fail':
../../tests/fp/berkeley-testfloat-3/source/fail.c:53:5: warning:
function 'fail' might be a candidate for 'gnu_printf' format attribute
[-Wsuggest-attribute=format]
   53 |     vfprintf( stderr, messagePtr, varArgs );
      |     ^~~~~~~~


thanks
-- PMM

