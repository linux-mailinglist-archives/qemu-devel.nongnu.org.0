Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A14A3729
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 16:09:37 +0100 (CET)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEBpg-0001rX-7s
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 10:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEBok-00016P-8k
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 10:08:38 -0500
Received: from [2a00:1450:4864:20::42f] (port=46717
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEBoi-0000ws-GP
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 10:08:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l25so20543903wrb.13
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZhWMEdoy5cSlGcwdx4phA95rLeVZ6Yu7ZA2svyN830=;
 b=qRXdHbnyYr34I9S7jJ+XO1ZOhgA7jV2tDMgJKLrKNXq2MFrqQnQGUPNg4Va+5bHq/U
 zYkxWECf6JNEQwB/QMc0/xlcve/CkpH6N8rhl0ga28CKRGN2Jw8nK0IxbYfRCwWaOBIO
 rSaRxsk3a3jVTb+tge1tR9KCefzFIqKw88Bnmt3xV/yrK7lFxPuUQmRXJ2baf5QWZSfc
 mpE8OfWlqWwwyxy2yqk1Xe+B9Rhjedoy2fmYr1tGEbkDVY3cC1eDlSWFvIGLWP9U01fF
 RtFro4EC+r94KmiS+MrBlp6I4sHJmeVR+8WqagCCNKu58I+U2u04RmDue2LaqYnM7YvC
 8fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZhWMEdoy5cSlGcwdx4phA95rLeVZ6Yu7ZA2svyN830=;
 b=R2RJ3C+Zu+IamUg+ltcT2IqyoRi5Og5wS/9GhzIlq9hJxxYmy60NyMnwFUcdTqitJ9
 Wiq+qOpchYuAIIZor0E1xoFAAYOW7K56+CyoC9gdmwnXSSfY2Z8nwjZJ3q0BU+wZMuDm
 7wwJZUG+k/RPiEEyrEtKkFC12i+BYgs1PAf/ka2EY8O7AsJSYR5LJp/kEmHmMhJF3Tld
 6NFJv5zXj+Dmu5MNvLpgZV3xqW9x6nXwEhXDKtyqKW6EFCFu81tZLyLDwswmvWnc50CE
 pyDWYnnkZBkfbm/C2w3zUC3/+sMlSnWpIPgtVsYbfGW7XGBHR1DpPEK3qd2vG3EEJqdV
 0bYg==
X-Gm-Message-State: AOAM530h2hv+wo2r6x5+SMKG8BhtIl/tXhIcQGWe9u8g3Bm4Q3FMR1o2
 7cdTEPA7wo5hAlRM2tyj/qh20o7XEavrm4n6p87w7Q==
X-Google-Smtp-Source: ABdhPJzxJ0LOl6e6BT5dEbb73DqGw/CFf/0fWHeCBgrHEnIw8jBjaBsNQf5CNCfLBauIwrsOYCDYWGKh0WQhg+CVDQw=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr14527684wrz.2.1643555314388; 
 Sun, 30 Jan 2022 07:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20220128230003.1114719-1-eblake@redhat.com>
In-Reply-To: <20220128230003.1114719-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Jan 2022 15:08:23 +0000
Message-ID: <CAFEAcA9u3reRzB2PUYgk7VNosBNBpTRbS78tpaAz3hheE_-PaA@mail.gmail.com>
Subject: Re: [PULL 0/4] NBD patches for 2022-01-28
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Fri, 28 Jan 2022 at 23:04, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 7a1043cef91739ff4b59812d30f1ed2850d3d34e:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-28 14:04:01 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-01-28
>
> for you to fetch changes up to 6384dd534d742123d26c008d9794b20bc41359d5:
>
>   iotests/block-status-cache: New test (2022-01-28 16:55:23 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2022-01-28
>
> - Hanna Reitz: regression fix for block status caching
> - Philippe Mathieu-Daude: documentation formatting
> - Nir Soffer: dead code removal


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

