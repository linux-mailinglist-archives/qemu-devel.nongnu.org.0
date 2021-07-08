Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A83BFA5A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:38:11 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TIA-0006xU-K2
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1TF7-0003CY-1m
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:35:01 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1TF5-0001jd-DK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:35:00 -0400
Received: by mail-ed1-x532.google.com with SMTP id cy23so3293742edb.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFL/IFla6NGF4FQJR0AC3grTjWj/Kw3/jm2dXhCUEr0=;
 b=QcNJDoYCXA0NBf7HLI6SMJrQ38dYKAIgbtxx6BlGpT1wdwba0bNqUBS3EFCKrLyuYn
 qErMEHqqT8fPi3dTZi6myo5ymr8hT3vqE9XMiqID6AyWMsFGzHt/MxBw+cAjqCqySYNA
 CHMhZzRorcvEJqmf+BErm2bKyZk/9FHIjl3DtQwZSlj85T0ZyI/+hBiO5EN7LXn3KqGG
 K4MbM7If76tB7q7+sQPxS86gJHSwjNtQSaCE59IXhloFFEM15K0PRHCBL7ZGrNBCAlfK
 BystqkxCp62qaXyHoQe4wENzDYfwBKd8HylJ3N7cC2mUf2M6uPcbJosY7aVlLkT/L8ji
 I4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFL/IFla6NGF4FQJR0AC3grTjWj/Kw3/jm2dXhCUEr0=;
 b=pP1SdM4xY5svScqlI0EU0qQXkOOwrp50TOXR+sllIsqaKxR9Df3OQ/ENDsj1tE6Ynl
 fGI9bed49/K8sbtCLs10cM240/+0wBI3pF8VG0R5f2GwHjmC6yJr3luC0Y6lRF0QEJiq
 u8/RRrYkTrrfIVZIkCRm3T776eAl/GsQkra4Y0uD7BBcf3lKYqvh56thUuL2x/FezrFe
 2cASlqXr7KoB8ihERUmlV5cjQhWjlQl33qVGD63EYtWC97+A37o4iDXWQWuFne3vi+gh
 QT5ELB4OfuSvhRQnuYwOfhsAfPIN6u7vZmv1ZtHxyc/jViQocqyGIPzLtfrd/EgSnzzP
 eZDA==
X-Gm-Message-State: AOAM530IJmZNu8+BrKlF3WHGImGCGI5wcnph0cm3K3Ur0qrASxlwaThQ
 kbWVtUhh68dod8JhwMmGkd1KjZN4DF/zOwXU5TkFJw==
X-Google-Smtp-Source: ABdhPJzy/gzx6EyX0pWOMMZfbSTgnXs8v/TzSDIVKgpYjBlq9dAiqGQoly3TiIFtpXwZYIr41SGrywtVKtJ+ElWSTK8=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr37804389edz.36.1625747697109; 
 Thu, 08 Jul 2021 05:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-3-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:34:18 +0100
Message-ID: <CAFEAcA89ZDwaoorN--MfHX5_KwngXw8w_cxYzObcWca4SEZHXQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/28] target/alpha: Remove use_exit_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Wed, 30 Jun 2021 at 19:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have not needed to end a TB for I/O since ba3e7926691
> ("icount: clean up cpu_can_io at the entry to the block").
> We do not need to use exit_tb for singlestep, which only
> means generate one insn per TB.
>
> Which leaves only singlestep_enabled, which means raise a
> debug trap after every TB, which does not use exit_tb,
> which would leave the function mis-named.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I wonder if we should rename the 'singlestep' global to
'tcg_one_insn_per_tb' or something (and perhaps also provide a
new command line flag, with the old one deprecated). It's very
misleadingly named...

thanks
-- PMM

