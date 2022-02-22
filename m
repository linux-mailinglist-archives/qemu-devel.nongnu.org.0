Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A44C02EF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:18:22 +0100 (CET)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbc5-00039I-1C
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMbar-00028p-CX
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 15:17:05 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=41555
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMbap-0005Mk-5Z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 15:17:04 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id j12so43605247ybh.8
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 12:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DT/oPstjfY4y0YdZYUSwfG6zu5Z23PRRp9FrpxVpMgk=;
 b=erTbNoSNhheV3pcf9lsUZcMpaK/hEWGs5p1KSWZmgkAk5v5NMsbYl1bA+kHfUJ3UqA
 3Xj7+ZlDgsk4wJo1tZR+GjcGhuUweXChGMy3z5wfK2SlM6W4OneDAzpTgqOCyGj1pmyg
 46ILcYVSoSNpv9LaYQws4ToUJQ42ddjRjxPtr+5gne4pP6eI3Lc2/Af5l4UNqbl0kDnG
 5RMIHq+qgETfh/f/r651IdUsvIdbVADxqtRaC2j7VzoH56AwOBwN5HDtpN2O2Fcftjb1
 hyqTi4g39WSVtBHau+gDJ/GjORkgbbbijAK+NsZ5+b2fx84m0NZqT/Axuvgg6ltzAGoH
 eVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DT/oPstjfY4y0YdZYUSwfG6zu5Z23PRRp9FrpxVpMgk=;
 b=r6O7af2cgfBLrWQy+E/Mhh0PPRwIhjv84dKJrat+OgGMX946TEkFcZsd1RwZKopl54
 rx+1iSxI/JxjK160/9aF8mPmfSqELGXlBHwUKLsGJxraFTLRKbZvgwlYzJ9LdXEeNMt1
 1ra3c7k0s0LZqmmDrMLHsSqeLVJMvxbmTTAvGicz0opKhDLu81PKtfopIT0zOOydTs7x
 EHlIBQcsP/xL0unYGcHsfslGrwpSXubdS8hLvKRSN/gR/AaMoTkt9IOf39DdGGtdG6iw
 fjr1T177YkLyiBDA8QNGIcu8N5Yic1HqArEoBeViu0B17Gy+meWANkCOJiZCbFWbqsNw
 HEEA==
X-Gm-Message-State: AOAM532iF7/0VemsTKaA6O7QitUnBqyFn4/HdR8kYuL8JgnXn5heoA7j
 nvQQMrfn1lOlGNS1TVGX1bbsZpWOm3jyEUL5Ei2JGw==
X-Google-Smtp-Source: ABdhPJxnnZN7JkrlMo+BJE33t/d+SVjhmzEGbVvqXUyR9rt7S6/bIKOGdqdtgcctO3u5dqrzr8WeW0gJc3qua4uLrOw=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr25180468ybb.288.1645561022175; Tue, 22
 Feb 2022 12:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20220221120008.600114-1-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 20:16:51 +0000
Message-ID: <CAFEAcA81juAW-yE97FKJv2YcQ7trObv8yUNb_6VoX3K8TNHysw@mail.gmail.com>
Subject: Re: [PULL 00/25] qtest patches and misc header clean-ups
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 12:00, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit e670f6d825d4dee248b311197fd4048469d6772b:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220218' into staging (2022-02-20 15:05:41 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-02-21
>
> for you to fetch changes up to 975592f5523fdf8708e4b53da937cf4805b1b79a:
>
>   hw/tricore: Remove unused and incorrect header (2022-02-21 10:36:50 +0100)
>
> ----------------------------------------------------------------
> * Improve virtio-net failover test
> * Some small fixes for the qtests
> * Misc header cleanups by Philippe



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

