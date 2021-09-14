Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4C840AE1E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:44:24 +0200 (CEST)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7nT-0004Ro-Dv
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7YP-0006bS-7T
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:28:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7YN-0007qq-G9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:28:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id x6so19886242wrv.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VHXyVPj/SULYTckfHFTt78IIWIyQaHg4Q/PvExRkC7w=;
 b=hmFFFzzcvxerTAEhQeFol2wW49HygkjcBOmubBZdejGvxxITPzH1XH79LWIhhA/DLJ
 f2sXSNggaMWS+mAFDw0aDGbcVNUsR7sIafGeho4Ugudv7JaEb7df/p08UefUcHGo8pCR
 /SK8Z8gexlvqRLlB4YSYD9ntlUv8MVVhjKnLSeu3DY38+eflHYYnPs/x1Q1Iza6r4bCy
 ikNZvTrJ1IDsxoJj+80QL0R5tWi7T9MbS/0aP8QP6zHH9J4NK5Zxhy9x1VMJ415+V94T
 oYVqce7ZuyyU+Qqs0hl2HqeNkPH2m6n/CQjeloi0krXvSkiA+TOOno5lymUoPjbZqvvN
 T0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VHXyVPj/SULYTckfHFTt78IIWIyQaHg4Q/PvExRkC7w=;
 b=fM9Ho74PORNPWx5X2AMW7LuYZvVI/zMARuAo+PiZlmkpOMOozelAPYfNx50OztDVqP
 QZMpmAa4eQX8ykCgh3x70AhxCwsag+ENnVRVAYe8WN+EOeGMXZipyVYD7TiWogs5KiJ/
 ETAXFj13YtVu9uR7+v/V5Q1s+MkBVRLD/Jdu5YuImWdZfSjUd5p4LbWhZJx3pLoeip0U
 LKOcpxLv6NLDRRCOF9i0jiQEE1Vx0GCl9qGOPHwck5f+M67SFkAS+sHSS5ujAdkTD5jl
 Jz2PadM81o617swmhBVir09ci/MzS5TKy9FYNhwfSpLyGRtyJSkOkdElwfgqZuhzDACi
 JOdw==
X-Gm-Message-State: AOAM5325egQEC3cpz4UCVakYc2NvzmE2D5KXMc7WV7iU8P6Hjoqp2apx
 soZ7G20bJN5fF7BHBAxm8pp9gXi4ohweOJViIb+BbQ==
X-Google-Smtp-Source: ABdhPJxPE5CeP4A8SuP+34QUsm3dQLUoklhp0uMsFsXqHzcVRiT52ZGg4r8SItK8/jfOPIrZ5+arxZSrvF29yIDwmo8=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr18062025wrr.376.1631622525927; 
 Tue, 14 Sep 2021 05:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210914122536.280978-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210914122536.280978-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 13:27:55 +0100
Message-ID: <CAFEAcA-_xCK_n_DNqc3CUXPxGdROZ2SDtz2zBu8T7es7bzCahQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: add supported host CPU architectures section
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

On Tue, 14 Sept 2021 at 13:25, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I was looking for such documentation, but couldn't find it. Add it to
> the build-platform.rst document.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/about/build-platforms.rst | 33 +++++++++++++++++++++++++++++++++
>  docs/about/deprecated.rst      |  2 ++
>  meson.build                    |  2 +-
>  3 files changed, 36 insertions(+), 1 deletion(-)

The meson.build typo fix should be in its own patch. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

