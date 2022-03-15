Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2B4DA2D2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:59:56 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUCOg-0006P0-OF
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:59:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUCNQ-0005iu-9k
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:58:36 -0400
Received: from [2607:f8b0:4864:20::1129] (port=41628
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUCNO-00083Q-KQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:58:35 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e5969bdf31so18976767b3.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VMDQiwNg6AYqrkebokhlK7+etyXfZ+3xgb3vbe5todE=;
 b=DmjeV6QuYzOEP+W+w+S2i5m22YPsCCCq0eJ8VL9iBh/XCZHvtKBFvZaJytqs1egAcg
 oL+is7Uu8met7/1N8F8irMD3vganVrM7e3fiFOU6wKHP7U1ngM9aukBMnwQ5XbfFNsMy
 hHVpVoQT108qzjRruBsAhCwpQytjSzzCabDEEVfllMhGYmA1qpAMpdiK1LAA5gtIKmZ4
 UKZswNYRzNl+RQwNZp9zHQjJHgy+FuAR7wfYxvkt0a3ghy2qDVUgDabdX1ND1n3ABIfB
 Bb7AGeIV1JXU5XaG4mdS0oXqQP/LVTiHXcv0Jx07keeTgw7H1P+3UzUL9nLDsm/BRBvO
 Mo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMDQiwNg6AYqrkebokhlK7+etyXfZ+3xgb3vbe5todE=;
 b=l3pru4xyhnPxsNDmH/Ji6JYKLGOOoxfRqg3S3sGE8xkzUC8Zy0mUGzJ4ZXr6DVYrHN
 ICMpYj3Y5Xx4sKU9cTXa9lSa+lK8uAuFAGJUwDOHLe/hZrjjsZv69uekwmGvOK0FvhRT
 rCu5Z+cXLUN2eRFacsuOhTsIcnwWTsBObClOhXm+MMA13rAu/1AWvi6PSAQdbyYDis53
 2mCnQMiFLclHZVG2l6/NzhvZToE5YHKaVuypHbC+maw7GvynHqhtHovjB/QXKlIgfSUh
 cjGu0wDw9gFW4vunAfMYj1ogqxTVkQbjYkWALo13Wkp5UsD7d5zMS/TxzB0+wlqfI6e/
 rRuA==
X-Gm-Message-State: AOAM533PBLzGcKu4WxnN0J+rUtCcNJDcqT1EgokH8BB4muOOOkvB+wcw
 oyefQi6wDOCOXXYlsEUow50F0s11/EGSdDSBJVxaFA==
X-Google-Smtp-Source: ABdhPJysMc7nscPTsYwDWz4KEUNymzwpNS0jxvZ1i6ECEWzoB887BbtX9sJGx1ZHQHzNAjNIIPYkP3tEQ3tumtrEmvs=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr2895636ywf.10.1647370712856; Tue, 15 Mar
 2022 11:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220315112052.515467-1-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:58:21 +0000
Message-ID: <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
Subject: Re: [PULL 0/8] s390x and misc fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 15 Mar 2022 at 11:20, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:
>
>   Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15
>
> for you to fetch changes up to 36149534792dcf07a3c59867f967eaee23ab906c:
>
>   meson: Update to version 0.61.3 (2022-03-15 10:32:36 +0100)
>
> ----------------------------------------------------------------
> * Fixes for s390x branch instruction emulation
> * Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
> * Fix for "-cpu help" output
> * Bump meson to 0.61.3 to fix stderr log of the iotests
>
> ----------------------------------------------------------------

This results in every "Linking" step on my macos box producing the
warning:

ld: warning: directory not found for option
'-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0'

Obvious suspect here is the new meson version.

thanks
-- PMM

