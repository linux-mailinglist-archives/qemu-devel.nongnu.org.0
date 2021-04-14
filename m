Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0EC35FABC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 20:25:47 +0200 (CEST)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWkCw-0003jk-2I
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 14:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkAV-00034C-Hs
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:23:15 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkAT-0005OQ-Qr
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:23:15 -0400
Received: by mail-ed1-x530.google.com with SMTP id e7so24815393edu.10
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7JQ2jqbLr3kIeursdtrGDBRh11ToHLSdLxWaL4YeZag=;
 b=M0PasrpDLq5EXE5OLXuKdbt1k5PLQmpyo1Fn8uskaESQ/oV48q/aZ7dKyXX+e0F8Vm
 StLrOf5Hck9N92/oKksk+QUWExA0PhHYNB3aCOndobjc0SzARW3atfWUNfgCGQREZeSv
 AnqPLBOHENTuDt0eLaOGkcAA98950+fiYSTGowir6hlP/NnyoORQpXA/a36Jrwrn9aE1
 sAaadi+774ER+BgLnmItx4SWXRYfF9K6JAXChOMfiWv6BJMe3c8G3de30JKI75gXcK5+
 4lXYZ5lcNxRmxh3V2aJxi2KYTCT2nICL0Xi6JfgLvpNg3iTy9w9zIqU2NpLvrKnLwx9B
 mMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7JQ2jqbLr3kIeursdtrGDBRh11ToHLSdLxWaL4YeZag=;
 b=b3ouYcD9gq5DqFFBGIWU/e6ylhXkbhwzP1+vCjrcz+0meqishArgCDMMH29TVw709Z
 evusQHlwNRZiHs7YVNQULmoidQwJpVbBo6tl0vzhqs8p19+nlWmUUrr7KJ5ITbM67Ywt
 h3XSnb4HmINfiC003pmMMlJWAcKPwY2f2+ZDwhkAhHeghO7yVJoHUuL4VAPcphwfUrea
 iPCR5dMcD1FHdefPx0NyPKb5lDqrBozUH4KmoceCG8sonSr//1i4NLxgBsK5aN7pf3U+
 1ai7apBjIQeWj8g5FIrJHdEeCjZ/jDj1N0LcPh6e4zi2txSBJwQDqvJ56nYQaKSZJ7b9
 HYtg==
X-Gm-Message-State: AOAM5327YPgJQPM1QBceShJGUol+1mBHbqMPovJ4jV7CJYRMLQz1cTu8
 uNoe0a52y2dio+YaiCfXRzo1fNXX/8uNCOSDySlW8w==
X-Google-Smtp-Source: ABdhPJy/zNF1SoQwZIhY/3/oi/1JjNK5Yfj1KCW0bd7gZy2YipzG2ylJxK7cVVKwSDppe/uc5JAGvb9m3Vut6tT/xps=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr271557edt.36.1618424592197;
 Wed, 14 Apr 2021 11:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160850.240064-1-pbonzini@redhat.com>
In-Reply-To: <20210413160850.240064-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 19:22:25 +0100
Message-ID: <CAFEAcA8vf5Ra0MxwunQPGsahnHgaSCE9QYS86xY7tkKEVSO+TA@mail.gmail.com>
Subject: Re: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Tue, 13 Apr 2021 at 17:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 1a0b186eaf3d1ce63dc7bf608d618b9ca62b6241:
>
>   qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code (2021-04-13 18:04:23 +0200)
>
> ----------------------------------------------------------------
> * Fix C++ compilation of qemu/osdep.h.
> * Fix -object cryptodev-vhost-user
>
> ----------------------------------------------------------------
> Paolo Bonzini (2):
>       osdep: include glib-compat.h before other QEMU headers
>       osdep: protect qemu/osdep.h with extern "C"
>
> Thomas Huth (1):
>       qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code

Given Dan's review, I think that the osdep patches need another
revision. So my plan is to cherry-pick the CONFIG_VIRTIO_CRYPTO
patch here and tag rc3 with just that. If we need an rc4 (which
on our current track record is not unlikely) we can put in some
version of the osdep patches; if not, this isn't a regression
since 5.2 so I'm happy releasing 6.0 with it still present.

thanks
-- PMM

