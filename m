Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723C3DCB82
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 14:05:17 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAADT-0001yF-QS
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 08:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAAC9-0001Ew-Hi
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 08:03:53 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAAC7-0000GI-Qd
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 08:03:53 -0400
Received: by mail-ed1-x530.google.com with SMTP id y7so18318176eda.5
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ms70uFlwXxtayn0TfI3OaTQID/nnUQxOztMhQD5Ws5w=;
 b=oNyNmfMeKT8aAI+Wiq9vktYTcv0H3jCcChDh/Cw1e/acypjukSt1Xz1xCQ1uB7aX14
 R9ottcaz9fIiMXYOoJ9Hv9g1k/pePmBaRvNJ1eGtKPN6XQrm1fCtEMBhLwRX3XdUs4DH
 iD2ojxtdbgrq8sr5UIJTa6AXruEn6TYvXeqTJF3RJEKrXL4nTjjJyLVfn07GqFUhsMFo
 hitzHnLA78zZUz/D0dKxYgtiFIFDvMZB2zjmnAkllxxr8/ap2CIPjZ6AVlUxSOjuA0zM
 KMLLAAkuZ5p7jlVVem0JOA3LqSBad0q92QI/u3hc/O5uPgZL5lVIL49Xor/VdewDJSMX
 W+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ms70uFlwXxtayn0TfI3OaTQID/nnUQxOztMhQD5Ws5w=;
 b=VhIiuxfLMYcf0TvHltAxtfvfWd7NkfE59IdICA6S2wZ+TlK4Y/hz97sx046wv3nBXb
 gg/IsDiNEl7euL0Kb05BRkgpwXPU/gjVwjXs5E1VgtpXL7NIrpa7PqSRC7w6XyOQ732l
 NiYaJiQazUdWjK6de+mcEQHa9L0RnVanJI1cotfti9mYENilnK9VKHdpYuLz37LSS/zg
 YIyluVdAI9j84FXyeM1kPYa1aGfNwyYD1ubeXZBD0NNYudBERKTC/jWeHAyRkKB+FSWR
 1lChwXvxtZlaO7UXmt+TYPFZ6Pum0qEuhzfmKYARzCRXSKdEv2s5SSn8m2H+Eql/NoD9
 6lUg==
X-Gm-Message-State: AOAM531Pitb3/Vfpbj0BqaWZSEErPCyP/qBHkp8vb9pX5E+1tHg3Fg0C
 dyh+XydBYD9a13oDipP5ibwqAXGNa9hO83cUZT5ajQ==
X-Google-Smtp-Source: ABdhPJxdb7zaPkbrCW27FewTzd2aOJ9nHHq1IBZvQddgmIEkR0qTp9cm/TIqBOQbNlvcYkr4MUXOSlOIt1j5pQFCUrw=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr13477931edq.204.1627819430152; 
 Sun, 01 Aug 2021 05:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210730182820.451248-1-richard.henderson@linaro.org>
In-Reply-To: <20210730182820.451248-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 Aug 2021 13:03:07 +0100
Message-ID: <CAFEAcA-+951v6HwU45+7GRb5vndjS8eU9CnR74Tu5XZNRfi91w@mail.gmail.com>
Subject: Re: [PULL 0/2] tcg patch queue for rc2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Fri, 30 Jul 2021 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit dbdc621be937d9efe3e4dff994e54e8eea051f7a:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-07-30 09:14:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210730
>
> for you to fetch changes up to 236f6709ae0da224314c3344c339ed0dc07c15cf:
>
>   target/nios2: Mark raise_exception() as noreturn (2021-07-30 08:23:12 -1000)
>
> ----------------------------------------------------------------
> Fix double bswap in 16-byte atomic store
> Mark nios2 raise_exception noreturn
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

