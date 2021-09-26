Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08529418A8F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:48:01 +0200 (CEST)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZBw-0002Ui-0W
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUZ8u-0001Vi-Jg
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:44:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUZ8s-0005CG-Pw
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:44:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id s21so5303014wra.7
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQ9PAEO69AwbpuuCY/uk+YciiFogKGJKFZe2ObbnGLA=;
 b=sT8Q32n2W/qNdPhsoXvpM+kBgZVO1+9UU4zIK3ryr6FpsBWejyUzh8Uy0jr3wMyySv
 WhhkprR/Tp9J4F3JzcpKXMx13aRfAeuEsk2ZmkyFwoaP3HrmLLH2puZ+HnP74aD7ux7b
 1yOGiPtosI52LYaGn3OQzQi8NE8ZcfW4qLua5sCieX/d6JczFK5VTyb0D5lEP2AIiiNJ
 CEWXPh4uqAko2ZRlIMwp3JIJBInveuMFgqiB/cz+dz0mQh51MjL2dSe1nqptTHXcOilV
 QWT1hyiCQIOPUesKbJYl9TdLmwVE9Os9WTds9z5nIyNdCJxTeGR3UGiGWjdhfkqWkL/u
 NKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQ9PAEO69AwbpuuCY/uk+YciiFogKGJKFZe2ObbnGLA=;
 b=L/d1+gqp4cxalIOIWxGyWmgQ+zyCg+SvCu85e0euvyK0l8ZPFTlOim5/D2AaGusdF7
 rL9rqHOXEiNE9tx/hrS0zU7J8/VSlffbONSV3UZXpWvkV7ttKDQj/0qNUskvoT35oJQr
 g6r5F+O4x2SxH4qyQ7w2xXpOT8u2OA2RVwQ4fSVc4YxTPGGdqiAd++r+rkg8xETSYAQg
 qzOqXkNvVzTx54P+lZRv0XORa9Lv7m+O7cKSyTpdsiKkC8j7H7hMlNvLTbR1HcWk3cYW
 D1jGxJjW9xH6jQRTY5P5AD2vs+xvE2gfK5hNxhVXYj9c+I3rfoFp1vd79HEftXgN8CkY
 rdcQ==
X-Gm-Message-State: AOAM533Y9P42YMdf3iz+FUp313gOYsYV6lnfGxidoSm09zkbGwKfvxK9
 GdYJQOYRTY7hB78giUeTCR7eMkrZXaqSMJyoRgZqpA==
X-Google-Smtp-Source: ABdhPJxX2x/RYE3ze1MxatG1UJaSjBQkrzyv4IiwVtmMPnrVk2Zj0UpmZ19FxVih7urnbUMmKUZArh0/MEa9gpQr/OE=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr12328755wmm.133.1632681886521; 
 Sun, 26 Sep 2021 11:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210926171708.455435-1-pbonzini@redhat.com>
In-Reply-To: <20210926171708.455435-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Sep 2021 19:43:53 +0100
Message-ID: <CAFEAcA_-hQsSwA221j9R3T7GpqBn4vP6=g9=vFQZyk9P8PY+vg@mail.gmail.com>
Subject: Re: [PULL v2 0/5] Update meson version
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

On Sun, 26 Sept 2021 at 18:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson
>
> for you to fetch changes up to 1d4bef90b570b8f4ab10c380227d325eb49ce084:
>
>   tests: qtest: bios-tables-test depends on the unpacked edk2 ROMs (2021-09-23 06:40:15 -0400)
>
> ----------------------------------------------------------------
> * Bump Meson submodule to 0.58.2
> * Fix dependencies of tests upon ROMs
>
> ----------------------------------------------------------------
> Paolo Bonzini (5):
>       meson: bump submodule to 0.58.2
>       meson: switch minimum meson version to 0.58.2
>       hexagon: use env keyword argument to pass PYTHONPATH
>       meson: unpack edk2 firmware even if --disable-blobs
>       tests: qtest: bios-tables-test depends on the unpacked edk2 ROMs

Isn't this in the wrong order? You need to fix the tests first
and update meson after that, or it breaks bisection.

thanks
-- PMM

