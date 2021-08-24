Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B23F5ADA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:18:55 +0200 (CEST)
Received: from localhost ([::1]:53242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISa1-0006VJ-Kp
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISYf-0005nC-CA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:17:25 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISYc-00072T-S7
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:17:25 -0400
Received: by mail-ej1-x632.google.com with SMTP id n27so10922276eja.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFaD8NPVDNyBcy9iTFwL5zSRfk2GRJd+74Dpw62tpWE=;
 b=GJaep1WXZhFCejIYJkMz3lHzhvrrmXDSYWuVHT+pj/LuwCZWkEuptYDlPU985u3yNV
 5tXQe9Q9AP/ihOT5raI/cTyPkUIwArvgTRaHICLGkld1pHten7/3SJFedKxkRsl7VLx8
 Dk5qvLepDcpQ7fCa3GCl+2lX9umN+iOaVY3GX1J2FfKedLQB4YmVHr5FrDbUOsOCK3Cx
 bsTKrz/bb83hBgpLkQP2S9bcC/TTw8x3t0eVh7fhYRwJf7kQXItWETvWn7bp6YYie416
 IpJMsnAAldNR/3dCBHV3LmQ7lDob9oqbhd1ADfVu62ifR289L70pj9L1Mb5wq4FR1pzS
 YjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFaD8NPVDNyBcy9iTFwL5zSRfk2GRJd+74Dpw62tpWE=;
 b=XYP2sEO3n+uFEi0ThAih1w+AVaVYCnsviSEUO9H7tWn0i2nFEVXk9Yld7LL4kDJcGG
 KzDE0mrx2Nbh7GUQILk21awVQeG547pUi+mtcAY+g+uVm7SfA6kbfGR8gdx4Vvt3TTEW
 mMMnEU2xQ/pEuoBwYIZt2ZCQDtlCrnkm/kL3VT/51a0o+AR6lwJvLUwB7o/MFyvCpXH3
 gN/emFwn4RX7G1Qrzy928kwTvX3Pbf4WmRJCsE9QgJfJwPG/x228EPabnAlK3kEw5B1T
 78V3G4i4KSiEQEo8WWaR6X+Lu8+Z0aikUCW88E6EDGuqzSQxHZywcA3L6mKMuO9TWhpb
 ttng==
X-Gm-Message-State: AOAM533+kjj1TaIZNZvfxaZbR7Dh1atHUhjeWAaCMe4m6cwb5mVZOi7+
 dVX7uxTup3CvV1yMxt4KJtFm+kkrgmRWpgOf66iyMQ==
X-Google-Smtp-Source: ABdhPJwbcliFObofXbQLjpw0PGrzQ44JW9UXcL1jPOf3/tWE2vyRT3o0QhczGQQwpP41tBf7EpPWaLT4CKyvgbu7Uas=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr39976646ejf.482.1629796641000; 
 Tue, 24 Aug 2021 02:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210824072702.520187-1-thuth@redhat.com>
In-Reply-To: <20210824072702.520187-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:16:34 +0100
Message-ID: <CAFEAcA90Y-+Ri42LibkptBbLy_YWi10rV5GKtU+s-m6nNEoPKw@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Update the information about the required
 version of macOS
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 08:27, Thomas Huth <thuth@redhat.com> wrote:
>
> The versions that we specify for macOS are way too old already. Let's
> rephrase this without specific version numbers, pointing the users
> to the latest version instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  _download/macos.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/_download/macos.md b/_download/macos.md
> index 06aa811..6832436 100644
> --- a/_download/macos.md
> +++ b/_download/macos.md
> @@ -6,5 +6,5 @@ QEMU can be installed from <strong>MacPorts</strong>:
>
>  <pre>sudo port install qemu</pre>
>
> -QEMU requires Mac OS X 10.5 or later, but it is recommended
> -to use Mac OS X 10.7 or later.
> +QEMU requires the latest version of macOS (or at least the previous one if
> +it is not out of service yet).

This is a stronger, or at least different, commitment than
docs/about/build-platforms.rst makes:

# The project aims to support the most recent major version at all
times. Support
# for the previous major version will be dropped 2 years after the new major
# version is released or when the vendor itself drops support, whichever comes
# first.

-- PMM

