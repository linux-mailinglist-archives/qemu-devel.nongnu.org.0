Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D63F8A62
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:46:29 +0200 (CEST)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGeA-0007CN-LZ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGcT-0005Ns-Tg
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:44:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGcS-00064W-0I
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:44:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ia27so6798102ejc.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g0SrCK3T6Bcjar0Ml+gBVmuA7H/CZ4kD7H+M0p5ThPI=;
 b=TLmoSqCn002FmwidBh7bsWTXF9hHcWGeQAgpy02Lm35YLsK/6KU2K4f6+W6aH2V+FC
 jAA0rqV+IM0YkSus5+E9k8oCEG86T+MJVwEcbrFqx3CEGWLHwWx7PB30sFTHhokVAJkz
 1k2J3zDs+PFye2kE2w+NPEKLon6wfBWiga7HCQDGzpUDvIN9ZEMYm+6CRreD6Rx9x3mv
 O0kgiFP1XfC/8rgPV5Ysdb1gwhQmXUYopYN+sNJoR1tTmKXvqCM2tMga8POmilVLNxsR
 c9ToMOIpc4ZPL/yrLr1ZLCLuqoEg+BIedJ7xWnAbHfayQEVu5mRKesFHOyx0PsZS8PuX
 1SeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g0SrCK3T6Bcjar0Ml+gBVmuA7H/CZ4kD7H+M0p5ThPI=;
 b=l0qcjjqvYeBS5pLGceSITszGHk+1hSWq3XCX4qnM59rxmgUaeZnNoQtddmG49z83g2
 qWqAf1cABfkFyfreVasi3asoYEofpVthsyuMkCqMcssDO1M0bPp8beT4FmfBP7YR8Od3
 2irTkcT082zTncrSfyRW1HheuMdSe4nWOiJbbU+epGEeOTz7JwMH91M/VaPObAkMGoYm
 vOau/C7eA6xwqOzJl4PgTMDMAmOuq9BMPYD2GEhWgw1vqSNi9qQ6JBZTBhUdzJ646TWr
 kPCJwmtyJN3RfC5E4NS+mD1B33+GdetgQz5alceaQGOxoP4KRBTKufsc5tBnlCSsEsbe
 Eyqg==
X-Gm-Message-State: AOAM531z78JdmpEIy8qvD9mmMYq08NCJHWPNvkkeMSpFyDtMi2HzJoX7
 B1bT5VzlShYYG/LX+dhsxUV7cxWuEbTYvQOgZON+4g==
X-Google-Smtp-Source: ABdhPJyIk22BK46PqA1vzfo3XK/F6e7LQiNqnTHD8yVVwxqHMloQcmy6Q6xPlWNS7+Zd1D8ng2qUrGikMhtQUH2NXJE=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr4575290ejb.382.1629989078170; 
 Thu, 26 Aug 2021 07:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210826123225.157891-1-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 15:43:50 +0100
Message-ID: <CAFEAcA8KgG3kb6koa3Pmt4pobhwLvkdeJFdW_yhiQPAYFc9DYw@mail.gmail.com>
Subject: Re: [PULL 00/11] QAPI patches patches for 2021-08-26
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 26 Aug 2021 at 13:32, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit d8ae530ec00368d4adfb996b5ef6c74cb44605=
04:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210825' into s=
taging (2021-08-25 21:09:48 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-08-26
>
> for you to fetch changes up to 8a9f1e1d9cc55f5eb0946cbf8fd1ef9a0e7d3dac:
>
>   qapi: make 'if' condition strings simple identifiers (2021-08-26 13:53:=
56 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-08-26
>
> ----------------------------------------------------------------
> Marc-Andr=C3=A9 Lureau (10):
>       docs: update the documentation upfront about schema configuration
>       qapi: wrap Sequence[str] in an object
>       qapi: add QAPISchemaIfCond.is_present()
>       qapi: introduce QAPISchemaIfCond.cgen()
>       qapidoc: introduce QAPISchemaIfCond.docgen()
>       qapi: replace if condition list with dict {'all': [...]}
>       qapi: add 'any' condition
>       qapi: Use 'if': { 'any': ... } where appropriate
>       qapi: add 'not' condition operation
>       qapi: make 'if' condition strings simple identifiers
>
> Markus Armbruster (1):
>       qapi: Fix crash on redefinition with a different condition


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

