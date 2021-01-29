Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0254F3087AF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:12:18 +0100 (CET)
Received: from localhost ([::1]:47168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QlF-0002bT-V3
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5QjW-0001xx-8d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:10:30 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5QjR-00021r-HM
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:10:29 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hs11so12174287ejc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C4mb8GATNyPzqdbPryp8eHcM3kUzqoM9ij/tOdtDaQ8=;
 b=k5ocwe/BWmMBcOlMPdF1yJiy+rWz9g3t/Y3lKnSnfLmik9Mlzo6LRCxb3ngy23/vrP
 JAzOSm6ewkn18vuLIjIxOClvkRzbbXjERaHVJOimuRkAIFzsINxc57HLWFoDuupJcZHx
 MLjkhMbqS3w7qFQQmVbomTfurimKTY8UsHuZzhZZp3bUVV5cBKEN2vOlx4d1ByhG8j3x
 xU18DbjxU1e5DWffYe+yVKG0VxIxxPmxcsYwD9HbZNhoNqzF+oHVONrmCemU0x6ccZvn
 gkhpfiaO5sTZn2zczEzx9m9HHlDT6SdtkKwroV/pRCSTfx9VDTi8pW7Z8bH8HtT87aDt
 eajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C4mb8GATNyPzqdbPryp8eHcM3kUzqoM9ij/tOdtDaQ8=;
 b=Y2e3++Os/pVPJ1m7p4/WJ+1EN7Jj6hV6V2EfhZ2sv6iR65NElgT079qc5EYeTev54S
 g36FAmPXK1ImPdPeZ3PdQMsQd2Ae16TDBYdwlSp8F3DuvrGu5+q4IBzxYdMsuchezy12
 vInakG3Y2YdFnotutD0g1gptvy9FHntKbytbYe/px7UyHvNFEsg3XIGktOGbf2KfOH0N
 UvPRtWd6f+pjJhXinpHYPuNggVF68fy6Ek+TZCOzodiw3eqo6iv39W43YnynWcRi1s3c
 WuviP2tTgdBF5wXB+38hQWeHQ/J/P7BysdBXUnpX+g3e38L9Fa/d+umU4DkwJjE1xtV/
 WKqw==
X-Gm-Message-State: AOAM532TZlyUwKl0XOPezFSb1jzt4wzaUP48J+dJq5wXJX5gvLXTFHV7
 2EwiaIRaaaVcFxk0aEa7kMZgsr3+QA244bXLkNwp5g==
X-Google-Smtp-Source: ABdhPJzHAp2D0qh26B1jM4LTboKoSKhGUShb22X3jJJ7lCXKgF6q8cyBl9tPcEtvQ5VLrz51iwIFvXyyYpqF8qCgEj4=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr3674579ejb.382.1611915023876; 
 Fri, 29 Jan 2021 02:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20210128074506.2725379-1-armbru@redhat.com>
In-Reply-To: <20210128074506.2725379-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 10:10:12 +0000
Message-ID: <CAFEAcA83VOFYt9+Cmv7pX5pguJim==bU9b0-LQMo8SwUW+i4eA@mail.gmail.com>
Subject: Re: [PULL 0/5] QAPI patches patches for 2021-01-28
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Thu, 28 Jan 2021 at 07:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit bf159f0bdc7b8e7aa8342dedb3829ca744c1b612:
>
>   Merge remote-tracking branch 'remotes/edgar/tags/edgar/xilinx-next-2021-01-27.for-upstream' into staging (2021-01-27 17:40:25 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-01-28
>
> for you to fetch changes up to 95b3a8c8a82a34ca874ac0d4a9bbbdb38034acf3:
>
>   qapi: More complex uses of QAPI_LIST_APPEND (2021-01-28 08:08:45 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-01-28
>
> ----------------------------------------------------------------
> Eric Blake (5):
>       net: Clarify early exit condition
>       qapi: A couple more QAPI_LIST_PREPEND() stragglers
>       qapi: Introduce QAPI_LIST_APPEND
>       qapi: Use QAPI_LIST_APPEND in trivial cases
>       qapi: More complex uses of QAPI_LIST_APPEND


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

