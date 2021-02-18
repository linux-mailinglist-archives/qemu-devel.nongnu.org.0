Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABC31EB5C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:15:58 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCl24-0005Lj-Qy
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCl0P-0004p3-RS
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:14:18 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCl0L-0006zY-Py
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:14:12 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z22so4763381edb.9
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 07:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a7kBSFDriKNRoZ7V+PFPNfVf/TdIU8WXWDfzdBbBAFA=;
 b=oxdXavauPNKo53qaWC9XpsI3gR6CV+Yd4RG/W30sjXfH+mbDyK7f2l7bcbx5etJG39
 Qshatp9PZ/mEnUexrKKdY9coYK/1xOT0+QpzuSUFXcK4QhUOMVvbMj/E9K6uMNG+1xzU
 mV9Ize6YmdmkNMQ19fN3qdwjJmdtc23s2aowhFpCvEzXUtf20hK611YZMDuvdLEruDoZ
 8UDKdghwjR4yJfP2CabY+BP0+3IGGYSfqT08ZgzdY2jc9KiTHpjjMWGe4vyYunqAo9XP
 COcBObnxBZhrZ1OA5Bxi11REw8NROi2Gjybm0IoDwYSyWzlY/tpbXZD46uMhiOOM7jhs
 S4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a7kBSFDriKNRoZ7V+PFPNfVf/TdIU8WXWDfzdBbBAFA=;
 b=Nbqg13rshX498isdTeG6BqGTdkXkpmMYhLd8lVhLB0wSW2W4rvTfJ7PC0Np+dY1vi+
 mSwv0RM8izeKtE8z9y1xo+3zW9hHg6qvJFODEpzvOLzqtVxbNJxD5kpsex2mOM5BDBjh
 shCiDJP6PpVu0WgHVCYdUzgO3n3TjXpU/tWHCNMm1JELYxyrI7qy2yrGZDD88DRSryIK
 6hBajhMzLlBoByibnLJgSwhVD7RsurlQOV06er1wovuHiff1B9UM6dwVijk/RuQ+wPjN
 RJG7R+0MovNggFag5CpafcO68Xd5AnIuEPD0D5tO19pkPlWfUR79eEeYH6TvDM6JTTiP
 CytA==
X-Gm-Message-State: AOAM532lAidk6ZPhOELFdaQwBxEYogidFsACFOwO9b2EDqzNTxC7z9kc
 XkMBQK/Krs9KUa2ykIi9Oio/5g6QDPkbA9yrcVI9kA==
X-Google-Smtp-Source: ABdhPJyrXl62OnObsJIUO1QRz0UVPAAuwNIAyeHz9hh/RB19xBQdbrrdUkM2M8Q2E9Pu1pmnktSlOnjFcjPNY8X0OCY=
X-Received: by 2002:a05:6402:545:: with SMTP id
 i5mr1127495edx.44.1613661247894; 
 Thu, 18 Feb 2021 07:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20210218094706.23038-1-alex.bennee@linaro.org>
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 15:13:56 +0000
Message-ID: <CAFEAcA9+t8WOZoVe1bSersxCp-8phh-4K_Xe00yBrfOou3tPjQ@mail.gmail.com>
Subject: Re: [PULL 00/23] plugin updates (hwprofile, CF_NOCACHE, io_recompile)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Thu, 18 Feb 2021 at 09:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 1af5629673bb5c1592d993f9fb6119a62845f5=
76:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiof=
s-20210216' into staging (2021-02-17 14:44:18 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-plugin-updates-180221-1
>
> for you to fetch changes up to df55e2a701d02bc01b9425843c667fd0cb4cdfa9:
>
>   tests/acceptance: add a memory callback check (2021-02-18 08:19:23 +000=
0)
>
> ----------------------------------------------------------------
> Plugin updates:
>
>   - expose vdev name in PCI memory registration
>   - new hwprofile plugin
>   - bunch of style cleanups to contrib/plugins
>   - fix call signature of inline instrumentation
>   - re-factor the io_recompile code to push specialisation into hooks
>   - add some acceptance tests for the plugins
>   - clean-up and remove CF_NOCACHE handling from TCG
>   - fix instrumentation of cpu_io_recompile sections
>   - expand tests to check inline and cb count the same
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

