Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C653F89B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:50:04 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyUuZ-0005WA-5b
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUqe-0002fP-4q
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:46:00 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUqS-0002ys-T8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:45:59 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id l204so29965414ybf.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8R/d5a0zxl6iY6cktNdDQf8Dtelrx7tfG0YTcG/ls7Y=;
 b=iUYT1qZnU9MrZ1MlB+MFrCPg7g6tAMlBHRuQd1tMX2w8Dp6t5ywAduLBiqsSgCp3ci
 yQIgqzIgTgJle02fyccBBnkeut1cIEedKyMaKzJCLTHocKtnKExtb10gLWE8Ng2WeaiY
 jESpJUuDzZA9qYiHKcjIhD1ZGI4EePJgBYfWQ87nPr7htqNO4FUqycKxP1cnJlnjWeuq
 iBIAZa2rcY3CgI67ZnssZ1WB6mi8SMI0ODm/KRGrePwRjRy/fPkgaK9aFFDhp8VxfGE6
 SvngHzdsrCiPZ35YIc/sRzZyCyx5cyGNmdj33QOwe9WB4Z35ULAqSIcMrOrjDdAvKFFz
 qZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8R/d5a0zxl6iY6cktNdDQf8Dtelrx7tfG0YTcG/ls7Y=;
 b=dtfRvx2dtwniSHf9ToouteQB/XESkYO4IW6O0KSVDXN/o0brd2Nq6UipCnSh40CiLe
 bMEAPY6sbUUo8tXsDNc1E0NfhiVgF09NZcLNLZuW/LcxDa8k8SXu9hEUjbQ9n81jXo/N
 DM2GaFl1IYkfDMkJW0XBHTyW/hOW94cSXkXdRjcNCg3RtRBP3IKFVrfIVy6V1cGWHCtQ
 cjjfVUYwBzWCHLJsIGgqpZBaF+hV71LnkFsdrUb9sGgWQpSGwg922e7j68hq9I49usRy
 XzRDt2Mt/k9LjIGsGw3EJflI9mCgUpkej4Q8EHMezrJ6E4rMCPpBjUp2dnSNuCIFvniD
 pD6Q==
X-Gm-Message-State: AOAM5305SFss9/IIDT3kgz/AgkYQzymY0uxRX8HgVAInpvMqd8CPw42H
 tgf+8UctKdSDWrpX00DBsjNx9fMmBfpNuqqx6A+dCg==
X-Google-Smtp-Source: ABdhPJxyRZlXTcPfEnG1Fg2LYalpUTdO5tTY1XcSzZkvFkDyD4Sn4Pj1h/ACLuFxIglxZYqgcwosJANuFbADbeqi3Wo=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr27676293ybb.140.1654591547970; Tue, 07
 Jun 2022 01:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-33-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:45:37 +0100
Message-ID: <CAFEAcA9KWvnskAAbQe=5T3Ptk58J4tPCHOTLumr8-g=N=twHrg@mail.gmail.com>
Subject: Re: [PATCH 32/71] target/arm: Create ARMVQMap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Jun 2022 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pull the three sve_vq_* values into a structure.
> This will be reused for SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

