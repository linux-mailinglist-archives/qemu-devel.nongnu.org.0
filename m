Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFDE4D2443
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 23:28:15 +0100 (CET)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRiJR-0004fM-RC
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 17:28:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRiIQ-0003m2-S8
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:27:10 -0500
Received: from [2607:f8b0:4864:20::b32] (port=45607
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRiIP-0001xD-9K
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:27:10 -0500
Received: by mail-yb1-xb32.google.com with SMTP id w16so588456ybi.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 14:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55lVVSxGir6II66nletmT1steikdHa+8aia/315f94g=;
 b=vkyMq9DuH4A24ZmEIJMnqIjbKDNDa4zPS9I+deeyQwolrP+IYpfhGTPGIpE9n6TyBU
 FL9d0Xb+7k3l2cD/RjIZ+NEatilqI7no9pZ9DJy/OCvqCJCvNMtxU5AtZCdb68nRqiMo
 +Z/hA1m3McOmKllefDdlD4PD619Is9lm58C8aalEgV1l8zQ58tqISaXGVKXutZMUTYAp
 L70wg4v/gcHi1BrN/deKHNYk3QjmcfzGNGIZDYFnnltn4btg2vHzEEZ70tTA5x3FL/M0
 1xnQWFoeZuV+eat1HGS1J6G+N0io8Dm5ZKXT2YnxMefBPiRezknvDtJA1AGPymL2l7eF
 gtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55lVVSxGir6II66nletmT1steikdHa+8aia/315f94g=;
 b=C8Kuwlq8VPHlCz/qdn06/EPFxD1eOlMVfS590jUzhOWeCtA0tIglIpqlqF49hKZM/W
 yI12H5jonxUPzSyXw98Mw+SPgt8o8fu4csO79Sbu+DqoUkBWBg59Hl7dhc/ec3WKQ8QW
 Ff3YffkZ9bq/K1JCFLt+c4XtQD5bVLhKVhhjyZ5u1vlsW1wrzaz6EpDxYFdCLzeSREgz
 A15b6+mni5AG0lV+x3FfAn9X9IE0ZimHHVQ4CB/TLW8tc3ztHtpTGtjoYOdRlsCN+YEq
 CPmnZpKdAjYT2Hi4PDMjLZ32bAjX2QxnFanWwQmn4dOb1Gr+atBIDpBEUaJKW9LEYJgk
 T7og==
X-Gm-Message-State: AOAM531SqbVd045AI8G+IC3fa6QaZzjZZxCIpM9fl0xTqpVZHCP3sFzj
 Uqgum0FYwXP0g4sHpfq9cZRvgbKCB5JcGVt3s7Xw0w==
X-Google-Smtp-Source: ABdhPJyAclDVfUwbw75K10LGvqQuWdR+8jSHhzFKPivS5j5HAaKB06XRiyFRNDdTmttyPKgBmzxUYd3O6UPdbl6+Utw=
X-Received: by 2002:a25:b11c:0:b0:62c:16d9:c028 with SMTP id
 g28-20020a25b11c000000b0062c16d9c028mr1659591ybj.288.1646778428212; Tue, 08
 Mar 2022 14:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20220307221507.1218892-1-jsnow@redhat.com>
In-Reply-To: <20220307221507.1218892-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 22:26:57 +0000
Message-ID: <CAFEAcA9NoiJQ8Rf0gtQMd7egs85LHk8HmP_DFxtGE4PeHMcDbw@mail.gmail.com>
Subject: Re: [PULL 00/11] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 22:15, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33:
>
>   Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-03-07' into staging (2022-03-07 17:14:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 7cba010e821bf227e5fa016d0df06f2a33a0c318:
>
>   scripts/qmp-shell-wrap: Fix import path (2022-03-07 14:36:47 -0500)
>
> ----------------------------------------------------------------
> Python patches
>
> Hopefully, fixes the race conditions witnessed through the NetBSD vm tests.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

