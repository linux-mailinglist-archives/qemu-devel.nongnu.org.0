Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17F52B194D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:47:04 +0100 (CET)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWbf-0000fe-6p
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWZj-0008GP-HO
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:45:03 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWZf-0005l5-1J
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:45:03 -0500
Received: by mail-ej1-x642.google.com with SMTP id f20so12714452ejz.4
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UjMmZ1rq0duNjCIn1TJgyIq8diQ8uf5F0C7zaSJ3gc=;
 b=WsTrS9EBMazIl3PuJAMk/k4cYNOX4Fci3NyW/vcg+Lb+t7A3jFUusle1LFcPssBM6/
 iCPePb5sk4Zy81dYarZN89aaVK3JoturgU31GqQiy+Gf7UKHjunZ39FksUsDyKevflVg
 E8fi07M/lk9Oz01Ln13XBRhjFdtrpPS9hrEUk89afHlk+PyW+eGuUnNw4Gds1uxZ1/RK
 CBPyu10OLJV1a2FN11b86fPwwOuTV+jG1nJAOIAAHd9Ac05f7t3llgY3zna8EnBorRtq
 aXCpdS8LHIOYqVBq4VummnEQqk+sDmtNb3wNLGpuA7sFvJNz8PXzr8AXAZh5FPQNtlqB
 ycmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UjMmZ1rq0duNjCIn1TJgyIq8diQ8uf5F0C7zaSJ3gc=;
 b=SDKDQyhorwkB5sk4pzMotT2nK+LBRa6EROq0JoVOqVBFzTvWej1+EHD7rDqEs9pHBo
 9ktOEkXnM5m91EX2srfpfY0Y0a91PUDFAx2F29Q5XjqkVwrpngIcUY4u783MEr5CEzoq
 0g0hSnVQdPEjEEVlqximTiMI0F7Io+23a0xE7wGulKWMGpHKGHpTiJJXFL3VKTZmB8gr
 nZhhCBdo1itQeibZBt9/AOUDnGjAYGOkNikUTlKjcHfwcWSBoNMMrfa/SMEQoXRiFjNo
 c/po45B/GWllY1yYSm2lz42x8CvQMYRtI5ZghrXN7bp/xIpMB8fUBTJp5sKhWZVu0zlk
 Mu0w==
X-Gm-Message-State: AOAM530dWNO+nvBMZbcCGWkwNStatUMuMYivySx+IdpvL90JcP69K9sK
 DO76MR7JbRPeWQPO+zKpWCnVtnFPlzXx7qbR8Vq0rw==
X-Google-Smtp-Source: ABdhPJwO9h1H15UkP5kKXZLu6t+FygUozyQ/WNMk5Nwnw6OK8FwS3/Iap4BiHprsupSV3hXrywe/d4LHZjf+KHv7InY=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr1232037ejk.382.1605264297220; 
 Fri, 13 Nov 2020 02:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20201113101715.1438460-1-pbonzini@redhat.com>
 <CAFEAcA_rg8hZTH8pb6VJ8Wo7z52pqx0TOsXB-hOfmaHmHBLg0w@mail.gmail.com>
 <2e9c99af-7bf0-902c-f673-1ed233af9225@redhat.com>
In-Reply-To: <2e9c99af-7bf0-902c-f673-1ed233af9225@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:44:45 +0000
Message-ID: <CAFEAcA8StDxUgfCKNUR2FNjqOtBWB44G-UNNQQTTh5S+L=jdSw@mail.gmail.com>
Subject: Re: [PATCH v2] digic: remove bios_name
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/11/20 11:22, Peter Maydell wrote:
> >> Pull defaults to digic4_board_init so that a MachineState is available.
> >>
> >> Cc: Peter Maydell<peter.maydell@linaro.org>
> >> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> >> ---
> >>   hw/arm/digic_boards.c | 19 +++++++------------
> >>   1 file changed, 7 insertions(+), 12 deletions(-)
> > Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> >
> > Did you want me to take this via target-arm.next or are you
> > planning to include it in some other series/pull ?
>
> I have ~15 patches each for bios_name and ram_size and I was planning to
> send them all myself (most have already received acks/reviews from
> maintainers), but it's the same.

Yeah, I though you might. That's fine (less work for me!), just
making sure we were on the same page.

-- PMM

