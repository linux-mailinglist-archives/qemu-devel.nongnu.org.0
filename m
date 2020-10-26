Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD18298C0E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 12:24:51 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX0cM-0008W3-Ed
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 07:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX0IY-0000iH-KA
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 07:04:22 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX0IV-0002v5-D0
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 07:04:21 -0400
Received: by mail-ed1-x52d.google.com with SMTP id a6so7419120edx.6
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHWi1Fx5pVY6IM1ssURNTrOOhtxky14e/dE80oM7kiQ=;
 b=ZbUsmlEvKJ29wVBLUFTcbHrvz3syAQYZqj5plz60VQ1T4CLXdhvQNVv1spGc3Z84FU
 dH8NGS++kYJXQRaxFWaFSiVNnH5jw3FYTdCNL15nXrzJ+/iKwkE9VUxi4DxSB2GWmZ0h
 s14wF8Wr5rXpVYzF8vNUbt2bRN1vWeGF5iWF75Ol/tpHDP3Kyes2hS/2tlXSJq3p7qCm
 tS6NcHGYGmENBEbw/ylCWP13REoeWGjZtwcAwlul/tGINl6p0x4dyfEFVG897wW+V/mW
 KSYEr8Zz8tRAcLicBUiZyikx1q857kqLZuSTn25y6r9Ysk8mMIUMlHMWm9rgcxCUVTyU
 u6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHWi1Fx5pVY6IM1ssURNTrOOhtxky14e/dE80oM7kiQ=;
 b=ikEUGcQ8L7txSbeyj21ahxytphgWytQKJmiezYtxDY1cuPnQYF7uiw7mNoSbtn8o/Q
 FDlm/ZMElo4FlpN1WW/8pyF+xaAP+auXIiOpiQqDrffateYq5L+bwv/wzcLrpCQePYJ8
 W4PYH27lRpNnCgUPrdzYsR1d36ePZW7g+tN0zBvOIsT7TSUqHvP/g9i5K0g5KkDdxi9c
 8BXdNJ5TUB7n5q5XN0BTU9qZqXclPLxvj85HXoXPw/crf8CCobyReVzduFlheOsJSIpg
 GqrJ2Nzt+yveViLSdlkZcU629o86Z4uJFsh3yovTt7GuW4F5EMJJ3/vF3pVslmx1C5jK
 KmBQ==
X-Gm-Message-State: AOAM5339vVfr0gOWzttHSmZ8zxAfERgKrx+6gKmT9YAaFVP08W6HGpeS
 jLtRRjhLOfwm6ItBmUNMPLGsu3YAMzfzU8GmkesbIg==
X-Google-Smtp-Source: ABdhPJwtFFAeEPB3pT58VwfVEU4+B+GVcIPFYXZsZN0Qm0Js/UDhPuOYbyVHzJB271AnMhR7UsYjO2FgmaArWy1Q/HU=
X-Received: by 2002:a05:6402:1482:: with SMTP id
 e2mr15525431edv.36.1603710257867; 
 Mon, 26 Oct 2020 04:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
In-Reply-To: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 11:04:06 +0000
Message-ID: <CAFEAcA8OjeQ-utD56inorMk8dM6RNRzr-6Dv-YEW4n=qBi_MBQ@mail.gmail.com>
Subject: Re: [RFC] Using gitlab for upstream qemu repo?
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 at 17:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
> now that Gitlab is the primary CI infrastructure for QEMU, and that all
> QEMU git repositories (including mirrors) are available on Gitlab, I
> would like to propose that committers use Gitlab when merging commits to
> QEMU repositories.

> Nothing would change for developers, who would still have access to all
> three sets of repositories (git.qemu.org, gitlab.com and github.com).
> Committers however would need to have an account on the
> https://gitlab.com/qemu-project organization with access to the
> repositories they care about.  They would also lose write access to
> /srv/git on qemu.org.

Yes, this makes sense. Who in practice does it actually affect?
For the main qemu.git repo, my guess is just me, Michael Roth
for the stable branches, plus Richard H and Stefan H who both
volunteered to do a turn on the merge-handling rota once we
eventually get it set up to not depend on my ad-hoc CI setup.

I have a gitlab account so I'm set for this. Michael, do you
have an account there and are you OK with switching to doing
git pushes to the repo on gitlab rather than direct to qemu.org ?

thanks
-- PMM

