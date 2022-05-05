Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69B51BC4A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:37:51 +0200 (CEST)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXvi-0007tj-6N
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmX2I-0008IR-Mg
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:40:34 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:34528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmX2F-0004oY-G5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:40:33 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y76so6474981ybe.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dL/QsWv7q5XTwqFVsDvB5a6hvdAQ0EDvv5rOFpybfw0=;
 b=poJrxCjmIIMOi4gCIYg3/JZaRXbyylfTq9OL8CUNPe6Ydbg7NLlH7/eZiBOjKNJalw
 jGStgv7qqxF8nqwIw8T2pZBff0KER+hH4+VeXCfw2o2lq/678mRcGBWfzNV1P/A9ai8X
 SRv/giNB123BwNLFqJlM5EysayLkSGOYpZpaoj0pAgto0Fv/YY3D3Ev64LSoaEgmiB0s
 qJ6gFQC2JeQOdAQ5YjSfbtQRDfNPWFechwuv36pIb9qTe6h7JxK9CfMHc2NMfmqGD6Kh
 ktGkIOvQXnBlq/B8a7TwQLqJ11wyQqUZUkDdHkQOfieDsvL5yPOn4njXvXQAA5Pj00IO
 fQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dL/QsWv7q5XTwqFVsDvB5a6hvdAQ0EDvv5rOFpybfw0=;
 b=KwecSuZ26YdxRlBuWTh/WhZJEFC/Ueg6WD0Fe8WuVc9eemTGsll9dTibrj9xbApLWX
 Rpsk725DAl6iGJUCT9imzIvLbZE0bv8n2aSa1fqyMgkrHu9quRTaPhldfyEpStKFKG7R
 BPwXeygayl6GdIfN7YsNnDKumcPdngwaJsGv8Y0tOmc4M8LUMuXfvCNUXUYnV63uRjiT
 cbbXSTsto0m7uxmfvHuBAeLAKDHFNDErTQI/DczWcNsD61+eoJ4L1u5bLUqDyHqOv5Oj
 Sj4juw7AKqGhagLyphgI3h1QMtwrAPQGP+JmC8uW5GDFGgfCvnTxZXWvJ0TsYrEJMjyz
 ksMg==
X-Gm-Message-State: AOAM530rdeKYRfP0czdvExwzn1LJdDlgO0EW4eZYIicLUKxU0BlbzrML
 JoVjrChMN+glqLPJGfCSNsRJJBwgbHr30eU+euQGxA==
X-Google-Smtp-Source: ABdhPJyIpl3kLuOb4boi0JLkWM9Xqoe3MlC/iyI0AsaC1O+3LhiG75vc3/XnuLh5EJ2vtYngWftvQNll07wtsU3bBhg=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr20091156yba.193.1651740030511; Thu, 05
 May 2022 01:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
In-Reply-To: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:40:19 +0100
Message-ID: <CAFEAcA-8Awh2jbKTBCig7C-oAfVhs3iuP3E6EzkW=DVAKSZ0=A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: virt: Add SBSA watchdog
To: Jan Kiszka <jan.kiszka@web.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Sun, 1 May 2022 at 19:07, Jan Kiszka <jan.kiszka@web.de> wrote:
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The virt machine lacks a watchdog so far while the sbsa-ref has a simple
> model that is also supported by Linux and even U-Boot. Let's take it to
> allow, e.g., system integration tests of A/B software update under
> watchdog monitoring.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

The virt board has a PCI bus, and QEMU has a model of a
PCI watchdog device -- the i6300esb. Can you use that?

In general I much prefer it if we can support use cases in
virt via pluggable PCI devices rather than hard-wired MMIO
devices -- it means that only users who want the functionality
need to have the exposed attack surface area of the device
present in their VM.

thanks
-- PMM

