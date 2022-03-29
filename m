Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB394EB612
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 00:34:24 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZKPs-0007NY-6y
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 18:34:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZKNt-0006gi-RB
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 18:32:17 -0400
Received: from [2607:f8b0:4864:20::1136] (port=33292
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZKNo-0004WN-MU
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 18:32:14 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2e68c95e0f9so199909037b3.0
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gb/DWvp0QJ6RY5K6oC4HVxylOLElVdvZP6OaeDW43zk=;
 b=dcrmvLoWDgUqriNA/AD7YUHk4PADxqew1+tuD51sneeyUm78dE5hcwEbv6pV4z7+RR
 PryanPrQ26QnCs0UVZ//arVgjcpehIPuBgFV9Zx49ifUJTmEhBhKyaJSoXuvTAxX4s9E
 8lOENJpSSTlXn5Pcj9SiLrk18hISVC3KbfGyBR7Yx6+Z90EkuVzvY8EeaWYBNtIZp9Us
 yDFCh54vYJdY0FFW5ma0nAOONqZb5Q3L967tHfOtRz2V3kok3DFXf1IMpUfq7slAZiOH
 ZZfaIW0AVvJWS9oDoK1a6KYFeFQeAbs8unxffy30dUg5STbKwlhZdJ6X2h245CiWWggq
 +wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gb/DWvp0QJ6RY5K6oC4HVxylOLElVdvZP6OaeDW43zk=;
 b=AXyLS513a9GmPRccOwMtRlBOFda4sON9kbaT+//15VOigjZz0PGKPRuNWm5WsETDB+
 WSs4UYqYiztiu6CjTJSfXbLPrsxW5txfOTqFHP1WUrWdq4euCLiFmBW+OPSjdyCs5yl9
 abm21Uu9aVGd1M1ZErJmcsKaWEMaWtnZ9R7JCqqi3mKJ3pPVCGs5c7uNZej/UZsyV6p2
 VVxygaktI8f+14MIj+OBcJ30qQHjnAfbEROxwjd+pfZjD9FQ3589JFoa/sP5+675xDii
 8MRujKhddC0Y/SLa2p874aRFU3Ake8epsW8q0BiPTuTRm+N7eGb5hLLP4CXO8PpMHVuz
 7Ecg==
X-Gm-Message-State: AOAM530cHboUUVFqHjW6naOjH4c1EBhmPFlmLH9U63RshdOvnqOc1kWN
 DJzFe09T9kpa+wSAqLuW547zmldDvEt7IIIUrVVLqA==
X-Google-Smtp-Source: ABdhPJxCfinyKHdXaoLJmk16gZtOidh7qY2h6RTxo0x4wC0iIbmjKwOav2t4SNTm3Z/uGlmViw4Yc0Uqe0BW7GaZC/k=
X-Received: by 2002:a0d:e684:0:b0:2ea:7c43:3081 with SMTP id
 p126-20020a0de684000000b002ea7c433081mr12404334ywe.64.1648593131564; Tue, 29
 Mar 2022 15:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220329140027.869953-1-pbonzini@redhat.com>
In-Reply-To: <20220329140027.869953-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 22:31:57 +0000
Message-ID: <CAFEAcA-ar87q+0jTbr72O_g8YmUGPj92=+VCiT6u9H78OW72DA@mail.gmail.com>
Subject: Re: [PULL 0/2] Build bugfixes for QEMU 7.0, 2022-03-29
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

