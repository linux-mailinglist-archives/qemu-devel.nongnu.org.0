Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E61257A72A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:22:34 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDsnf-0000au-Ix
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDsln-0007R7-1C
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:20:35 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:42539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDsll-0005Sk-Ct
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:20:34 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ef5380669cso151446627b3.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 12:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GgjY1bQHjeFz8wmodk8gxE+6Z4s1zlUQ63SvUM0qPwM=;
 b=J+IirCNS1I56KPGnT81xOkNCE6BUJlrjej4WKdaaUnclmXEL6NnWik4poKcNDxm4Na
 uH4Z5mgORQXN/+RyZaJE2ZOiRrK7ma/mbVXb+Edpxq7OW9FrLRtT2e3Z394MQhJiG/Zi
 tE41T6WnrYN8WJyZFKRecbb5daMLIoUafpgLhFFrPQHmCATmOohBeXxERlxjssiJ56yU
 8lgwl5t01+/8hLzM33m+5n2L+k8lsnbnV9BcpA9LZxPjV69gG6qy6J0SAZk4FGEPDmum
 hOJgDdAXFIupsYv2AyB2/wBP8oG1uzDGT6yIyh2n8cGaYED/C3DbOsR7XemOBvkM+aNC
 1F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgjY1bQHjeFz8wmodk8gxE+6Z4s1zlUQ63SvUM0qPwM=;
 b=AS6rkk+/ZZ4ukeoalBOu4qIh/koEpfVSZgnJfDcTGtXZzy0xJ6/4AiCnZeoc9bHJ52
 Ysve8pt/WxOQ+iio7V45323aIf5weTeZTpeSiQDJUIrrb1S2KkK57nTZG9kho9SGWrQ5
 /kN9/M9OqnNmQkraFNsCV0c2Vq6cTlInF9FFacQiPCIXsJ1vZ0yuoufS0/LyXdevcc6R
 82m00c0BFEFc1u8TKfBTDSxttZnwv9v5X+Q3eqlKChFGrY+6Po0uhqf3Bv2LU9w37szd
 ul74rrh9eWnZ+CI4FkST+92HE4fplUIXcCLeC7yf5lnGOsSNVkHfiC3GP7WT+Ivb/v4S
 9Qxg==
X-Gm-Message-State: AJIora9GBMALUkDfIR0R6SCV1CKltvDT0lBJk0q/mP3xuKoYR1eUnsAO
 09LdjybEVDAY5zNeeq1Rb/MZhotxquaroyAy7nQDiQ==
X-Google-Smtp-Source: AGRyM1vDzSzw1CT04LjPNojRuFZLd0lCDdo2NPyRnhJuQN1sqdX/UFDTqBvzFCEQVkkBO6cSRYSg9dpmj5YbAfh2p0o=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr37421234ywp.347.1658258425691; Tue, 19
 Jul 2022 12:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220719152218.825707-1-kraxel@redhat.com>
In-Reply-To: <20220719152218.825707-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 20:20:14 +0100
Message-ID: <CAFEAcA9nGHbSd4JoPp6=G6JPzBkEWHQQbGEX1XYUwpUtEXxKdQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Kraxel 20220719 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Sergio Lopez <slp@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 16:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:
>
>   Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/kraxel-20220719-pull-request
>
> for you to fetch changes up to c34a933802071aae5288e0aa3792756312e3da34:
>
>   gtk: Add show_tabs=on|off command line option. (2022-07-19 14:36:42 +0200)
>
> ----------------------------------------------------------------
> ui: dbus-display fix, new gtk config options.
> usb: xhci fix, doc updates.
> microvm: no pcie io reservations.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

