Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046A2999C3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:37:55 +0100 (CET)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXB7i-0006Ln-7K
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXB6L-0005S4-PZ
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:36:33 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXB6F-0001Y4-4B
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:36:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id dn5so11380837edb.10
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 15:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L7yzlhlkBGUy2KM82blQYvrsMuYr82wVC6827ah8WgA=;
 b=D2l2yCouOHdXQ+lf6HYJg5DRl7gwXy1Dt06RaLq9/5Jb7RmRZUm+qlwqSbZbv4rBrV
 P6cQ7iApm9rRmTmWupn9zwy7au9qhPIxw6NuU5zuP6zkDbZEgYGsLkp53mHI8c87vyJ8
 4mpgKswu719K+ez+zqWvNLQ6R5KHRnG/dmZbPEtun2cT/joEVf0q1KG1GZxAy9Ec7AfB
 DT3ziaIglDvI0df5GV/hc+l3O9xYnc9Hcq/HlGu6v9O5ysiLyUtnykX00iVtVMLPn9V+
 b6L76BuOvg50FIMObVU4ECwF6DLPNr2cS/VytXHOURmvFxbghbNNYlfrvE2gkHn4eJAB
 J0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L7yzlhlkBGUy2KM82blQYvrsMuYr82wVC6827ah8WgA=;
 b=imk4FqUyuqoqkf3aSmhfEm2W5MATQtJpuFw0o9JG2tAVCZdWWrpnuM2ckxxiQAIqbh
 futGc5+0BWTRNPV/kNYXdVQElmCpFUSZQhrv6FWz16o5e4d+DuDEtKk3xqNd4bSHFzRD
 lx0GuYYxlSRozLEOhg/Nykz4vvS/czYHQdPSunWkDEnvXYJNj9lM/3jGS5BehvxLuZ5a
 5Gsh3d4l+5/Kdp/jpV1kZrF9//Aiy7xQHbR08X77jX2FJ/3EGmZb+Xuvr3WaSk7uIYmI
 +Tzon5e1rTt653V0g+QFn4DIwsOxOUsMl0vZEdz1JB5h1CPgRjlf7hVv6fICejoVIFfC
 0KKQ==
X-Gm-Message-State: AOAM531QGtmneFQGbI8desxHAdJx/sxph03Cs+Dsvo+rxpsXwTeHCo2Y
 flfjkdm4lv0lXFjwap+Irteuh2y3HflidtOeY4JCcQ==
X-Google-Smtp-Source: ABdhPJxo86HFxkb8S9oJItycH8xHHp/WsoWOFfstFE4i6vSywG3ii+YwEcRMSL2HcS+FyH3sGatelxbq4cCNqCkeTeU=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr18433552edf.52.1603751781670; 
 Mon, 26 Oct 2020 15:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201026110315.4026183-1-f4bug@amsat.org>
In-Reply-To: <20201026110315.4026183-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 22:36:10 +0000
Message-ID: <CAFEAcA9PpMUzMoCSNoAH3aj7Pw6Rh2BCD89VG4RVgCRaxqZu7Q@mail.gmail.com>
Subject: Re: [PULL 0/5] SD/MMC patches for 2020-10-26
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 at 11:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit 4c5b97bfd0dd54dc27717ae8d1cd10e14eef14=
30:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/modules-20201022-pull=
-req=3D
> uest' into staging (2020-10-22 12:33:21 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/sd-next-20201026
>
> for you to fetch changes up to 89c6700fe7eed9195f10055751edbc6d5e7ab940:
>
>   hw/sd/sdcard: Zero out function selection fields before being populated=
 (20=3D
> 20-10-26 09:23:47 +0100)
>
> ----------------------------------------------------------------
> SD/MMC patches
>
> - Fix a bug in CMD6/SWITCH_FUNCTION (Bin Meng)
> - Minor housekeeping patches
>
> CI jobs result:
> . https://cirrus-ci.com/build/5461987880599552
> . https://gitlab.com/philmd/qemu/-/pipelines/207532287
> . https://travis-ci.org/github/philmd/qemu/builds/738901111
> . https://app.shippable.com/github/philmd/qemu/runs/888/summary/console
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

