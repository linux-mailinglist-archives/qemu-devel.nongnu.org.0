Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA464EB453
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 21:55:40 +0200 (CEST)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZHwJ-0002WN-81
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 15:55:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZHts-0001Qr-RH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:53:09 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=41473
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZHtr-0004CM-8I
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:53:08 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id y38so30769681ybi.8
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9MMkzFM/jHxt/kdsEinqERwWqo0GyzNRUmnMe/PL/MA=;
 b=AsX4Ty6GiG6t1kmNRsg2miF7OyX/lPEkh1+eouJtTZtjQCZULJhFFOkox1bFeWMdHe
 rewhrzNLTzoxsG0fqKMtCEmvtmUoy/qXaGsb1X04qNrXQdfUn9mZbrlr/y/MQB5rpukz
 M55o+JN9W+6xV4TnEeonzPxl/iNBiLya7Fq4haaQa8P/v3capPQMfp5/SQ0NWyPvYiSe
 SfL8vZqMwtCm3GzeelCO87byzC+Dr33Aqi0Km7WW8t5UCmH56iuH9Z4jGlbq1HCwxJrI
 SuNrvS90Ab+o5AWLAABYrll/9p/oadkIeQONZiaoi91YoW79SkmSP0tH1Efal+yRYzuN
 3RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9MMkzFM/jHxt/kdsEinqERwWqo0GyzNRUmnMe/PL/MA=;
 b=se5fPFBOjL6L4V/8bwXxijJEmWTCFUmIsaKExk5342rGQKojLsKZmuhhOzRT0oKDFn
 M9+lEsk3Eb6f7uxGu9an7LK7IomgGgAbtssx6Szab12EUVXhAviqPz3FBa8XfIih7yVY
 nj3NyoLh/DPNTqAqA7FMb9JlMqZdb9TbbRGu4xUXQwTnhTcEyQ37/KA59FMTNty72Q4k
 j3xeiH8h0pY18O+YWA/CaIk0avAX9s32Q/+9PgMm7ulVC2x8Gex21ILBEABYUWhs2WHg
 F9fihObANrBVb2uceLLvgk/7pmgm3q+RvOyrW9DRBNSERoM49xAZWJEUxQDca9UDH+xQ
 yA4w==
X-Gm-Message-State: AOAM5311+3ThAnJHZxkdAyAreX9faKhT8vDcf9kI6Vr1h04lU3fdNUM7
 HaVC00EgQAzC1yRQ59VZk/C2Q4BlGaUGml6ry8bdZw==
X-Google-Smtp-Source: ABdhPJyqPAOTLSy/Sd0WTUKhndONGk5Apt8G5NvE+2qpYU7uMPGwr6bm2RyX1YPgCgfV1KEyZrpHh4EkCHucLCnHSWU=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr28759969ybu.140.1648583580428; Tue, 29
 Mar 2022 12:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220329140027.869953-1-pbonzini@redhat.com>
In-Reply-To: <20220329140027.869953-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 19:52:46 +0000
Message-ID: <CAFEAcA_uDoBzJWCQ+pfRmKogvvobL_8r_a7sCOrFt7Bc7f+dRg@mail.gmail.com>
Subject: Re: [PULL 0/2] Build bugfixes for QEMU 7.0, 2022-03-29
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Tue, 29 Mar 2022 at 15:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit f345abe36527a8b575482bb5a0616f43952bf1f4:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-03-25 10:14:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 36e38426ff40c9ba86d4e66027f3a98747890623:
>
>   tests/tcg: really fix path to target configuration (2022-03-29 15:58:39 +0200)
>
> ----------------------------------------------------------------
> Build bugfixes.
>
> ----------------------------------------------------------------
> Paolo Bonzini (2):
>       virtio: fix --enable-vhost-user build on non-Linux
>       tests/tcg: really fix path to target configuration

That tag doesn't seem to have these contents (it still has the
patches you sent in your last pullreq last week). Forgot to push?

(Trying to re-merge an already merged tag confuses my merge
scripts, incidentally -- I should fix that...)

-- PMM

