Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D344BC87C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:07:58 +0100 (CET)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPSu-0002U0-Ia
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPLP-0000ic-U0
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:00:15 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=41941
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPKi-0000Ud-8U
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:00:09 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id j12so24747079ybh.8
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0Le6IpReYTEZG4y/QDYaxWjnd461K3lR7ChNTUWPEg=;
 b=LNEhBRxM96BXOXZr633gF+YLETMJz6Yhwn8D9KuDVNNw43IwbJVve9T47gF+1s0P9P
 uE+a2zI0Ae0CzAQX88b24xVAX6LiBaNcvNUdlFYJKzITAFTuLGRy8mrK/knwMDVLr5EB
 3aOE0uuWZOvnbnmmJM5eU2lEaI/sny4cvGfLwNnRCODF4ZfkZRDUAiRNia/CLcZ9ZcYq
 AEto6B1onHmDETzUp1o6emwglEVVZxlsjb95RbZbw3aA74zNXpQ9v+TUjdVnvg+F2MM+
 8M5YubUAks8tWAjU9jAiT9t06kD6rDt3KTY7rnqpT1N3CazQnJmm1Do0c9M7k2iTVdam
 9+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0Le6IpReYTEZG4y/QDYaxWjnd461K3lR7ChNTUWPEg=;
 b=DwIjEvh3n6AkrWByxGIK/+l53ukaND2OKoIMQD1rqfjX1ukVq3QF6lStcOEm4G7DzK
 /fu84tBQhW0/Osth6z5g3sRcF8bz5S4viZ7pjEbrvAA8awJvKxSwMtMVtDblz5RJnXMc
 6sm1oZHdgQfyelaT/SWOb30kIz/rsh+5l7eUG0iw4PftCjKmLpwbfKQmnQyvTrtt0weA
 SPklKU/2FZmkkzm51f7dMO1py1V+g+mXMO3SEtVxeBw2+5CO8lgLIyDhHDOOWHPvQOdO
 61HJSOtfE6Ywj4dE0Bbtzb2vixBLC0AWOL1zJBInAUirUEqbWiBsxm9pEztqSHgYJVEk
 u8SQ==
X-Gm-Message-State: AOAM532OnfdK47hNVodfOFeWXXwn+GW1c7ff1c9MncHycoJOlOGeNaZP
 MxdpkZ6O5OH+lhqn9KTECiah0H51ws8e7LYv3gA3dw==
X-Google-Smtp-Source: ABdhPJyahmCOIky88mt0KeQI/k4hukyH4hy/6LpF/wH+eCqAIqp7qJ3vPWfK3lJsvwceJ9PCPvRd8ieZlfsb9kXgaHI=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr11454847ybb.288.1645275566693; Sat, 19
 Feb 2022 04:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20220217093227.302898-1-pbonzini@redhat.com>
In-Reply-To: <20220217093227.302898-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Feb 2022 12:59:15 +0000
Message-ID: <CAFEAcA--Zt+2U2DqsZBG6GHLPyBs8pdXw3E4tiuLbQ4rYxUuOA@mail.gmail.com>
Subject: Re: [PULL v2 00/29] Misc mostly build system patches for 2022-02-15
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

On Thu, 17 Feb 2022 at 10:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2022-02-15 19:30:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to a971e77aa4a5f31173cd456f9c1d5f819751b997:
>
>   configure, meson: move CONFIG_IASL to a Meson option (2022-02-16 15:01:46 +0100)
>
> ----------------------------------------------------------------
> * More Meson conversions (0.59.x now required rather than suggested)
> * UMIP support for TCG x86
> * Fix migration crash
> * Restore error output for check-block
>
> ----------------------------------------------------------------

This seems to be consistently hitting the 60m timeout on
the tsan-build job:

https://gitlab.com/qemu-project/qemu/-/jobs/2113600369

-- PMM

