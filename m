Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245612EF0A6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:29:06 +0100 (CET)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxp0z-0005G3-7u
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxp0G-0004pS-S7
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:28:20 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxp0F-0004jR-4K
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:28:20 -0500
Received: by mail-ed1-x52a.google.com with SMTP id j16so10749041edr.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lLpWtzdPQfFiUn7ndft0bQTqwhqAebBKmdK+eSvT5CA=;
 b=B8w8769tpVSIncMXYaZovV6Ik3bJFr1bql5Qh4Snm9swxuICysNLvsCpivIPYZB/WD
 rKVJTpTdXuiClh5agf982sZYdwru6Ru8t4muDxwH3GFIfN7e2m4u8wvbA8BJbCovtYa6
 3AYl41C9J1kcoBDQK8oytmkQIEu0WpIqzpDq+hm3FVmM4gdliWQk9FZogJQtsdrTZbZR
 q5uxPDIHPVer8txSrfg4LrHACz46bIg0PScw8QH9OgPOZNN0nrMId19jVPb4xefd3E3z
 Sx3YvXVg6821+wiMyFLdUduTNPRLvPhnIa/a3hZUHzvgTiK2lRaAuhNUPlejrCceukCm
 FN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lLpWtzdPQfFiUn7ndft0bQTqwhqAebBKmdK+eSvT5CA=;
 b=MRQBDGVykrJFdIVgGQYEd9HMX4Tp36b9oBpLF4xA5Ff+DZAM14LK1anXCe3FA4zz1q
 4qTqVOT6WjMKAvVvGXPd8/LUQuntYlpWw895HABCoghYQ61xuWk51PyhlZFWm4UZlhKw
 HL6qdLziJKBLmXTBDjH8bkeoZtmxBoMpcAsYC11sKjveHefMvdBPVHmeViulTb9MvwDT
 JkncPVOya55BtxhHmluoK1i6AvVbOOT38fNXfDQtERVQnpWWBBnlXt3NdnRVM8nBvE88
 9y25jrSFqLU08rGhkwRVa+2FLOIkqbBzJxHxuSMc9gGT8PrAQkNSO21pTna6NiwDKpQm
 otbw==
X-Gm-Message-State: AOAM53255+sA4BW5jCt3iedHl8ZPXrnGIl7A4N2rLaNGLLxIZXbSYxDA
 pg9GhxU7k/hi2yQOKGIbD+psD/tPGjfP9WjvcWJpCQ==
X-Google-Smtp-Source: ABdhPJy8+5zZNk6TpIc/axPxAkFU8EltZjYpj36ROjNfpgXWky6lYkSLBW6lcAKYu7CTU+FfUb7vh3GebR6tsr9hgXk=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr4685319edw.44.1610101696869; 
 Fri, 08 Jan 2021 02:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 10:28:05 +0000
Message-ID: <CAFEAcA9AOW5_jHuBC=vWZC--MxjSypm6qZ=9Nu_5oJixG-1oww@mail.gmail.com>
Subject: Re: [PULL 00/47] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Thu, 7 Jan 2021 at 20:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 470dd6bd360782f5137f7e3376af6a44658eb1d3:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-060121-4' into staging (2021-01-06 22:18:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210107
>
> for you to fetch changes up to e5e2e4c73926f6f3c1f5da24a350e4345d5ad232:
>
>   tcg: Constify TCGLabelQemuLdst.raddr (2021-01-07 05:09:42 -1000)
>
> ----------------------------------------------------------------
> Build fix for ppc64 centos7.
> Reduce the use of scratch registers for tcg/i386.
> Use _aligned_malloc for Win32.
> Enable split w^x code gen buffers.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

