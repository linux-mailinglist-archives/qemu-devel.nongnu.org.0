Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1735B3FB
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:04:38 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVYpR-00072h-BC
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVYmZ-0006Ux-S4
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:01:45 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVYmP-0006ST-4K
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:01:38 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so15604489ejc.10
 for <qemu-devel@nongnu.org>; Sun, 11 Apr 2021 05:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g6C+HZnToEZy4h61+8gV7QhkQJDWuClSsvdsn3E+FGY=;
 b=DwPlbZ0gf+Ws6V+ze06nYfzUqXpX9lYftUtZuQL23Ur0rY7kvzC+oszF1zYeWxrgGD
 biGwVG0g/z7XfM/OYgIgGLH9O/K/02gadbgw+qUlIZR1rdHwiz3IYEp0JJ4MlR9l7OGs
 8ksCp6GAVVvcBiIdCpquHmsjIq+qvwb8q7DoDL4MON//EKYg2JNRtfgQAJshvq+OEdTG
 mpekKL9WdppWvN1onYCKILLnqNG9+qD1UtRsB3Eyi5/5T1ISfcKuyjj4Pxlr9bTkGjf7
 ZfBybQzAI5/1lrj3Jp4hMfCP3ZTjXI2deuEng4ufBklCfkhT3IZDUwwg6qLQoAJmc988
 yrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6C+HZnToEZy4h61+8gV7QhkQJDWuClSsvdsn3E+FGY=;
 b=mfLd2rs3ZBrAtjBWubw0efQjq/h0NGTxynPkX25g5kAVbtZseOXXcRD2cj7pIerpM4
 EBcL1saLBpaiqHME64rdXqfwXV7TgorDCach9ELiRMiRsWhMvS9IVjOpb9tqgl5I6Loc
 M/U1yEKwrKDd6EpWORIe0Mv5JM8esNsTwK8Ieu9i4+IGtunHppX0EsmRHcHagAi4istN
 2XGSHd/xbqUroTCg3TLOPgOTdtgZqBqrrOMzFyheWZYHLGQEx5GEWST+r/fCrcwH/zb1
 5Lucn3taLi2bwRgBSP25/v2EwrFIkGMMPr7980UWmp1TXDOUSKjqcFch5LiGQiWf90Ih
 sQNA==
X-Gm-Message-State: AOAM53262reGkB5jDx86RNZINhoWjJimOI/3uKLyhUswexn+0GWmMm4I
 UE4gYcEHl3prtVQL8Sc4dn4uzJaq7p0UOT2T0nFVtA==
X-Google-Smtp-Source: ABdhPJynDDe60KvuKomFyp1m7Xn8QhvAUiGwnEsxiCFn0Q4hi+GHjD4Al6XlB7qCh185Mj5RJWDB65MdFHsf3Jt/IVM=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr23150283ejh.4.1618142487279; 
 Sun, 11 Apr 2021 05:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210409202246.1857179-1-ehabkost@redhat.com>
In-Reply-To: <20210409202246.1857179-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Apr 2021 13:00:43 +0100
Message-ID: <CAFEAcA_oOxtB8k5AOrae-i1Lmuyrw92Lv0DVSguLH5LoeHXtyg@mail.gmail.com>
Subject: Re: [PULL 0/2] x86 and CPU bug fixes for 6.0-rc3
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 at 21:22, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 471387aa1446e2583f372f79327cc0a8c802b4b4:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210409' into staging (2021-04-09 17:21:18 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
>
> for you to fetch changes up to 0b47ec4b95ad1952e55e639711d442f8ec6e1345:
>
>   cpu/core: Fix "help" of CPU core device types (2021-04-09 16:05:16 -0400)
>
> ----------------------------------------------------------------
> x86 and CPU bug fixes for 6.0-rc3
>
> * Add missing features to EPYC-Rome CPU model (Babu Moger)
> * Fix crash with "-device ...-cpu-core,help" (Greg Kurz)
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

