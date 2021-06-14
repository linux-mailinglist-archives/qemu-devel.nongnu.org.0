Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E20A3A670B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 14:51:17 +0200 (CEST)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsm3g-0004KD-FP
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 08:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lslzu-0006o3-NZ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:47:23 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lslzr-0003mC-Jf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:47:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id k7so16464006ejv.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 05:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OA82ZwdaoMHXCqQ6oVSFi//CHAooaWv9JqU5McqyZFI=;
 b=Eftg5CWnajVEWdtNtItjt7zbjOgbV6MMVioHfFQHbHRkLe76i+ULL9AGoy+DPB8P88
 fx+QI/E1aI6Irkq1LH3vQgcdWMvVjdGw6om+Vpq9Do59e5DmeztXwsDyWYl6tU3yUtH4
 VnNrjok4DzStedWJGhfOb/PR5gtFyJTzbYZ7FITZ/sDVKI37dmWA0foAcfJHSLgot9BG
 BMculdHyJGrlb8LLGRdn/drHnSHNH+YZLj/M0/q2lfdB53ToNpr5f/qZRtCwBmHh3YkR
 JTXSXWLNUi6M9Q/NAWSSwf+SwFhHKvID5y5cJfu+nOeOkGhoPvmdu3zQR+cVflyAFwKZ
 pHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OA82ZwdaoMHXCqQ6oVSFi//CHAooaWv9JqU5McqyZFI=;
 b=gpxyG4HaybxjAifo6uOXk7ukKviChe4H/y9aMjaaquJCVEOGhNlr7jxkJNy5zgVQEg
 Fn9DNbyK1DpJ6/gXc8Cio2hBqrtwEVm8+x1srFDjAD2l7QdRwrjnRWHTAcAndK/4ukDi
 UH7EiYV2usJ7Xd3vLNr18RYjUejEaQ5fYVHxNfBiSHh0pREwgGUvp07uVLCYEjibGuty
 Jk6WkrZCwnD9n0N87NLgx5sJJHDpuw+uawlBrzKQaXI23In4wHnL9RibIvJBViFSyDnO
 Q1GM96PI4MMu82jEfqjJ7xXRZhoc2AlpeyE1kWC+YyTsBkBCGsCeUzoW8yQtjW0Scdd1
 dJBQ==
X-Gm-Message-State: AOAM532XjGthmoOajZbDsgfAwBnBHrn3T1cCLwtO+b4PvUL4so1WsQ3A
 z6kNebH9frNcsRbIJuzWAEDllqfV9nKQT1gwtBzfZw==
X-Google-Smtp-Source: ABdhPJzX0/sx72o+YXKVkPmKToaV2+YXhKe2AZh9ySzByE1tgNRW0FB9BCSKIFkLMFSa6tdcdoJAvOG2X7kMEvhZE/w=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr15608350ejk.250.1623674837845; 
 Mon, 14 Jun 2021 05:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210614012031.1081133-1-richard.henderson@linaro.org>
In-Reply-To: <20210614012031.1081133-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 13:46:43 +0100
Message-ID: <CAFEAcA_tz58+HEnAY9TGOr4rB8KhR=BhQtt9Xx2trTg5r4F-fA@mail.gmail.com>
Subject: Re: [PULL v2 00/34] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 02:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> V2 fixes an error in patch 22 wrt MacOS.
> It's a shame we don't have public CI for that.
>
>
> r~
>
>
> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210613
>
> for you to fetch changes up to a5a8b84772e13066c6c45f480cc5b5312bbde08e:
>
>   docs/devel: Explain in more detail the TB chaining mechanisms (2021-06-13 17:42:40 -0700)
>
> ----------------------------------------------------------------
> Clean up code_gen_buffer allocation.
> Add tcg_remove_ops_after.
> Fix tcg_constant_* documentation.
> Improve TB chaining documentation.
> Fix float32_exp2.
> Fix arm tcg_out_op function signature.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

