Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62141D7B9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:29:48 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVtJz-00010G-5o
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVtIl-0000DB-SQ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:28:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVtIi-0004Cg-HT
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:28:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so3943301wme.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zlN8ptRoEgwXQkopPg1kZJlfzWIWE7ZjoNidyMiIh10=;
 b=fzY+khKrXsWxd8I0Bc4BtUmdDAqNPzeUzSMTaPzEadvVlxYO96ZrZtqQ0/cHRVOzRM
 Jq6KoTU+ARqWWHYiWc3QEYr5Nre3/06nT8wgqLZkKrukhzuu4DCv/MXpR1a+wEo3kSlQ
 YPXL9kHyBHUWM8vF9knWnaOPGlebYpClxD74SEvJ7LlXJJqRnxXXQZRfkilSupsJVDkT
 K/39meOwVrPnJhSuf1fUwMaaBdEJukQ1GVnpFjEppKT4mntBxIddyLADZl3cqrHC/J0q
 e7KcUqPXmISSkWHD0H0Y595duzrqlaRQ39MXQ30P7CeNlDlg5KiCZXAD+LrL/jI3jz55
 S4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zlN8ptRoEgwXQkopPg1kZJlfzWIWE7ZjoNidyMiIh10=;
 b=Kwg07CVS8UvepNXcckDh/N0tRTaaMzXJJc+IeQe2iEbUw9w3tIkSCUQsH9hustLCee
 39KsfIbM3fbybVhCXU+ZPV08rViBX9jgMLD9rSfEs+anA3BM0En6GCkcAwuCpLVEybVk
 mTnG+IJgHeg2qvjS6nc5MUmHVh4d582p++XgLJhsGp8/G2RDxTHYFc94zoDH/9on6xVv
 UnO6EqANcqTYKGS3xhhqYIJumm64rhtOppGOZvs05vtiSW2T7+EU2/1ytQzo8JPX6Kij
 ujs9wMgamB+teQSIlsRHTXujvGLz2BWhoS34nyodBUllPt55GNlEhPUtRt+eWJg772v5
 c+rg==
X-Gm-Message-State: AOAM530Fr+Npd0Ede3AJmFIt/4kCOdUCRTKq8nyVzRmkZWxFd5NVzgCY
 OSRBGDDYdIXVVzFGjpQ1Wz2J5xXsySjCwDBr+h1cfQ==
X-Google-Smtp-Source: ABdhPJxbhSRZ4Log4kJOOoEw+VJYbkvwwlXF4sDdozRR57J+1WkQUUvJD41Eq+PUIohTQ+C784slLAIixZialQ3QyNU=
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr15053402wmq.21.1632997706669; 
 Thu, 30 Sep 2021 03:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210929092843.2686234-1-laurent@vivier.eu>
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 11:27:32 +0100
Message-ID: <CAFEAcA9yGup=eFRmAd0ad=Rm_PghNpoa8NrfDhP3T66BUoSEXw@mail.gmail.com>
Subject: Re: [PULL 00/20] Q800 for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

On Wed, 29 Sept 2021 at 10:32, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6b54a31bf7b403672a798b6443b1930ae6c74dea:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2021-09-28 13:07:32 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/q800-for-6.2-pull-request
>
> for you to fetch changes up to 5ef251416b5116bbf7723f31ddf8a6949a2ac271:
>
>   q800: configure nubus available slots for Quadra 800 (2021-09-29 10:45:19 +0200)
>
> ----------------------------------------------------------------
> Q800 Pull request 20210929
>
> NuBus cleanup and improvement
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

