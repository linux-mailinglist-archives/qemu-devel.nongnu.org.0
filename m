Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1D31434F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:56:32 +0100 (CET)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FSJ-0006dE-Lp
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Cnb-0002Qc-A8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:06:19 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CnZ-0006EC-KB
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:06:19 -0500
Received: by mail-ed1-x52f.google.com with SMTP id t5so20302790eds.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ogTM7DhgGuYm1SrqRXzXuf7Owk5fR0GY9PDGQmVCEOc=;
 b=YOIXjklcxNd0FFD/o26iSkCrHotgH9p+QqbT4M06W7525bzKSeV5NIx9M2BZcR6ole
 vlfW/AVIABAyAWHXUw4Z61q1FYJOztftSJbIWiKibuyprrRRy4XdD5npM7QLThhRBCBE
 8D41d5JAooHXx2RZkXN/KqHZ1OWt/qG4nWNpofbh8qIOnfA+SQhAlIR8DuvkItHHq05i
 4vPTiBkHjlJ6BNzM/+kvbUJtcYTnU0sMd/F6sHBBL4QDoKMq5f0bLXHLNwg53zBpt0NK
 W8gZPdOKZk2wrwLiehAta9kvIkSz/vPFOzjsKh7lD8DpgbXzNep8yRq4GGjyTrPOizOz
 gWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ogTM7DhgGuYm1SrqRXzXuf7Owk5fR0GY9PDGQmVCEOc=;
 b=Ck2T9XqR+Di8y+XZYJ3zp826dOYIpyrcvtors0UI98kHd3lkeE/GZJXC5ieARsBa/J
 +CzPIucw75SIMj2rrvnS+q2btfTrgel7ns9ILLeD+CSJivMZ6qR/Fao4FE0yAXBPcfo9
 K5ZfQPSkjYgSvkSZvtXpcixzpvkKzbvMaLOkhIVK+8XWt5KRgRmt0iYEhpSRMXjZRs5F
 nmufKvUXMgbvjPgzVFRiZZ8sNkzsTNBXuraxcVzgwzSRbgo/woA3OOmW3eOrdun5HPEi
 oyYd1CpAvZcWfcQv8KhYgEvOIr/iciuSt0IWzez5uEdOEtyWWarGqWwUtb7/lucBX1Kh
 Z2TA==
X-Gm-Message-State: AOAM532g3H75P64xq7wu3EO1H77CKtpYbEGYv8AVjbCkF1q3Y4Uib8mo
 ce9Io632mXB6SRC8fOQn6YXVez4Ud261i4ZzgiJf8Q==
X-Google-Smtp-Source: ABdhPJwxRpOOi2PxticmAG+5IPxaVWgxHXyxGYuWrUdeyr7+cnM39VcOYo1vlFU2bV02DWKVsvrx/k0ShCotOiJYDz0=
X-Received: by 2002:a50:d307:: with SMTP id g7mr17963871edh.204.1612814776048; 
 Mon, 08 Feb 2021 12:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20210208133711.2596075-1-philmd@redhat.com>
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:06:05 +0000
Message-ID: <CAFEAcA-mrzsrOiNw3Fjes=AAg=X3xXh40DZ5fMO=+dA6YUonaQ@mail.gmail.com>
Subject: Re: [PULL 00/18] Integration testing patches for 2021-02-08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 19:58, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab=
60:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205=
' into staging (2021-02-05 22:59:12 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/integration-testing-20210208
>
> for you to fetch changes up to fce8a00839564bf620b6c2957ed924197e54a127:
>
>   Acceptance Tests: remove unnecessary tag from documentation example (20=
21-02-08 14:31:03 +0100)
>
> ----------------------------------------------------------------
> Integration testing patches
>
> Tests added:
> - Armbian 20.08 on Orange Pi PC (Philippe)
> - MPC8544ds machine (Thomas)
> - Virtex-ml507 ppc machine (Thomas)
> - Re-enable the microblaze test (Thomas)
>
> Various fixes and documentation improvements from Cleber.
> ----------------------------------------------------------------

gpg thinks the key you signed this with has expired. I tried
refreshing from the keyserver to see if the expiry date had
been updated, but it doesn't seem so ?

thanks
-- PMM

