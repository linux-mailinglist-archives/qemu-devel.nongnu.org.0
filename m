Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54351580128
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:08:56 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzhX-0001IK-EC
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFzeB-0005nl-9H
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:05:32 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFze9-0001i1-Ar
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:05:26 -0400
Received: by mail-yb1-xb36.google.com with SMTP id 6so20516095ybc.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCjdad4ijwLYheB9wnJcYk9ApovV4RUgp5hjr3H88Cc=;
 b=ZMYyjjPZBx6oBlrKg1Hew6gNSrvMp9kQtU7sJv4si40FC8vpixH2loNfcdmv6KNel5
 gr9yjOOfDpX/JQMuyGLwLNc5JBHFwrQwrUCVgzWiwFm1kAMY8tCx/AcjnaWBcOABJBlc
 2H0oAoO6WZebluntAunnoGSP/dTq5hhIAnC1lomj4MCLGodCTsXlUSfiJ7asYIn2WqvK
 k4k4Q0kJdLubw3Vv+Yrh0fZbXy85aOrIkj5i2hDOYK2gKUAZNMPhXUKGuD4IgDol0/9t
 Qpjer9n/dwMCUntgyLlOiPL6d5/zpezraq23MP+7JfP4TCjU7lMlA02kE2VSAUFdkJLP
 Tqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCjdad4ijwLYheB9wnJcYk9ApovV4RUgp5hjr3H88Cc=;
 b=kbO4QI40M/VEq7VHWMVAWVXvRdF+BegafTV7ZdvKO3TrkFwrtvM6VXeOuZwWL0Itj+
 nsYb50/B9b/vfWQiOfs3HPmczgEwpX2B8JgwqrIrbGU2NyAx99QzWCRaAwvib9OTBvc/
 MAGT3Qlbsrj0u39hfpHJosJzIX+qKt95D3ChZw3E2Hyv6215aVrmIstbK9LaPYqmxqQo
 238+sQDxgquLCcNX3534mqG7LKzat5a9SO85xKvdPIZa8EJ0nKciRI5rAczhPmMKohu7
 0zDfrm10IBH/+dnDBGTJRV+qXsvAbLq122UFvJYOQRzeVV1/YUxwzIgdhCUtu5Xt5RDf
 73bw==
X-Gm-Message-State: AJIora+Edmbf03uCkFTzqLI50lB1AtJ20S6NYK+K/zCBAK5IsCr/XgEl
 A2Ps7efbll701PFT22B3DIhZweF5tH7xP3CIWoJekeTnfS9qYA==
X-Google-Smtp-Source: AGRyM1vCrpvlVbp9sqCUnRbpbWPAyGWjPMptD2lQZdV59RkLR+GRINMnNOktD0AP8eR9brdonDNeCt5VXtvkoPs0Fdg=
X-Received: by 2002:a25:928b:0:b0:671:548f:fabd with SMTP id
 y11-20020a25928b000000b00671548ffabdmr2197904ybl.39.1658761524380; Mon, 25
 Jul 2022 08:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220722170449.853222-1-pbonzini@redhat.com>
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 16:04:44 +0100
Message-ID: <CAFEAcA9wRzwRgvwBzM=JJ3N4ZgVGpeZpuxjCWEsjyCJwmmKyYw@mail.gmail.com>
Subject: Re: [PULL v2 0/8] More fixes + random seed patches for QEMU 7.1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Fri, 22 Jul 2022 at 18:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream2
>
> for you to fetch changes up to 9fa032885583a2f1cb9cacad2f717784ccea02a1:
>
>   hw/i386: pass RNG seed via setup_data entry (2022-07-22 19:01:44 +0200)

Hi -- this tag doesn't seem to be the same commit hash that this
pull request quotes. The tag is commit 67f7e426e53833. Is the
tag definitely pointing at the right thing ?

thanks
-- PMM

