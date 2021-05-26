Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E792391A23
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:28:56 +0200 (CEST)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluWl-0003EE-6S
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lluV3-00026p-S5
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:27:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lluV1-0007cX-Vf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:27:09 -0400
Received: by mail-ed1-x533.google.com with SMTP id df21so1779767edb.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jqWcbUlq0QbXNXG0Dw8Xnw4Ehua1v848QLz9HtiZlhU=;
 b=kSgoVI6IcTg44Xf+7XCQLae0sKO16cAxN7gKt3Fx37wOZjabQN6P4qgBPuvgJBwyF8
 OaUl626hJJAKCGIElg7+DPha3KPf73l7NE+yvWmbS7zZ2bF3b9d6Gw9BLqU55BgvLLMt
 OOx0He/atcyYCtmaEFHV4aZsgf6BrrzM2U8IvxPYNK2clTcu8o+S/RL27jthm+XC2NH/
 UklrqpyfgPOXH9O1U7J8G8xFdHDGFdT8YQJxagRT/AUMjL2f/Mh7xfZPgiSKzJgVOi7U
 0bbBvftYGIjLCDB9E+hZf4sHBPy+ayr3CTxGhg4j/gKFzT4vQcftKzoujdaegZsifpxA
 oTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jqWcbUlq0QbXNXG0Dw8Xnw4Ehua1v848QLz9HtiZlhU=;
 b=fRi3h558xQsGPl5IH06BGMBiwHWxUz+CfZzgUXrobOlbQ9MFK3Q9iOvVolI680XEcR
 U297WGq9eonlxFtRcWFR7lnFFgXada7VG0chMWM8U/fZwFilM0sBAnXzw8t2+BpN6RDy
 HVYFQV9B/ckdVamuXP1nEWHdYFEBMcsu5v/Uf4Q2Hf7NbH+GRzwF8SEA5wA41nrnzJ6s
 Aor1KjitrRCFBGmFJS0JCpTNWkXm67NOGxq/5QQcL/2DrCJbby5zdKAGXqec9Ju/Bguu
 qZTls9tYIzI60mGIsrVtUYRNohqgH777Ggk7rz6nJA90vXcNHUj0oNOsKYB8ThvBOL04
 +UOA==
X-Gm-Message-State: AOAM532JTubCVhqfoe7GFz6n2N3xPx3TRiSV3doNJBUUswu/AqlZNoMN
 +t7G3cOBbN+dLuSNdnN0d78JYMPud0Woac+CJYD77dXZDrk=
X-Google-Smtp-Source: ABdhPJxHcFw3r+Vt939mZLx5GgMhsriJQUGDNGBDuv7jv0pmP7XlIKcU2oWKFV2OGWvYmAWQezxC3XEkwrWWIgd2FcI=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr38138747edv.204.1622039225888; 
 Wed, 26 May 2021 07:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210525160517.1367-1-alex.bennee@linaro.org>
In-Reply-To: <20210525160517.1367-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 May 2021 15:26:41 +0100
Message-ID: <CAFEAcA8_=m4MVfVAdmi2JY9AarxScf0oVt5LBGGKghwxHMAa6w@mail.gmail.com>
Subject: Re: [PULL v2 0/7] testing, gdbstub and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 25 May 2021 at 17:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Tweaked the rules so the needs: line is optional
>
> The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a630=
49:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2021-05-24 15:48:08 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates-=
250521-2
>
> for you to fetch changes up to a6851b49e3b0509168d74050d0e59fe0121b2898:
>
>   plugins/syscall: Added a table-like summary output (2021-05-25 16:52:50=
 +0100)
>
> ----------------------------------------------------------------
> Testing, gdbstub and plugin updates
>
>   - ensure gitlab references master registry
>   - add special rule for hexagon image
>   - clean-up gdbstub's argument handling
>   - fix replay HMP commands to accept long icount
>   - minor re-factor of gdbstub replay handling
>   - update syscall plugin to be more useful
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

