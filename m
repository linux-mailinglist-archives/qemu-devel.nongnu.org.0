Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B9311DA9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 15:29:53 +0100 (CET)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8Oau-00010F-Bv
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 09:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8OZz-0000X2-Rw
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 09:28:55 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8OZx-0001wv-10
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 09:28:55 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lg21so17599929ejb.3
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 06:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8g9ZK4CB8bB9cad3+qoOqz3l68lkJS7Z0h/KhRj6Qyg=;
 b=BkYXOgGzEBFrLEHhIGeMtJVtEBY0/bCLVSUPHgpybtebrB2ljSR9ajPbwPRifhE/xG
 Fh12HvCWE/4D3OviaQpZX7MurEdA0+on9+pGkVQ8/ZA7pd6erYD+nucjPhoDRcErj8pL
 tFNWBCntyxijTmtLZyDDlgTU2QnrGGyV7eS8CAjV9CCIYTBYC13oN+sAM3ucoNc0eU2s
 1gEHgKIwifWXexomIHyTaVOqPzuB0YDEW8FFBpJy3YCi9YAvRFYGta9QFpmnCp2vNpQc
 Hl7kjLgYVWIkBkqSlkOoqMjNdRG2GvP/PLi6/XUTfuXpSxaFqZat1cFyMryi8m8Jb8Fz
 sc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8g9ZK4CB8bB9cad3+qoOqz3l68lkJS7Z0h/KhRj6Qyg=;
 b=AhZY+5yh2xlmIuIOtcBZGIlkgCY3An2MyJdzab33HJfHGfOLOHGxELD84ednEv/v2Z
 I7g7Jhasn71LDwMa2YYVleL4PjN7TMfNeVNlUFMYDfii5/M0PVA/9mnXvHrow/e0bmON
 tt1fSGCMCG0peVe9+qfeTL8hw0RueyArR/pt8wVt0LLiOhu6HQpPnzEx+wu6T7X29CBe
 /sh90B/MgBd9f7Tx09xlJZtafSV+0O8eeNfdH6DFSjiwa5iElUSr7ML+WUzM6AQMBmZR
 qDFCt1PKIPE0TqogAWkY3ViRzh5BEUBWOZGDs5HxvOhzMTdz2qh1rqBuSKIlkNFJAYn4
 Jz1Q==
X-Gm-Message-State: AOAM533VelvydOrOjs/l1URhhEx8FzgMpgOH8XERrqr35xOgyxlozg4Q
 l15qdlmxWt2L/jPi/+kgOSMzlYrnJ/dbZJjnRaVP6g==
X-Google-Smtp-Source: ABdhPJwYmU8PLQ061Cl8Uc0ivfaMQbAz/uPpw/1R2kUXt+WxVpJ0Hfh5DcEDD7rWsmiMBZ3kvniiXQfNAySLUKxmHsY=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr9129256eji.407.1612621730556; 
 Sat, 06 Feb 2021 06:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2021 14:28:39 +0000
Message-ID: <CAFEAcA-+Y+NcPdct_APTPnEA-rngyFwHbVEvwKvT-hWTHBqSJg@mail.gmail.com>
Subject: Re: [PULL 00/46] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Fri, 5 Feb 2021 at 22:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit d0dddab40e472ba62b5f43f11cc7dba085dabe71:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-05 15:27:02 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210205
>
> for you to fetch changes up to fb6916dd6ca8bb4b42d44baba9c67ecaf2279577:
>
>   accel: introduce AccelCPUClass extending CPUClass (2021-02-05 10:24:15 -1000)
>
> ----------------------------------------------------------------
> TCGCPUOps cleanups (claudio)
> tcg/s390 compare fix (phil)
> tcg/aarch64 rotli_vec fix
> tcg/tci cleanups and fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

