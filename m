Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3134798D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:27:19 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3XZ-0001gX-QG
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP3TI-0004wD-S6
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:22:52 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP3TF-0000JJ-6h
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:22:52 -0400
Received: by mail-ej1-x634.google.com with SMTP id hq27so32827493ejc.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZ7zsLedbr/EhLtnmvlzdpjCQonJa/LGAB2yIQvIh/A=;
 b=dE+jrSssOzQYSHj+IOaza0Lb/3H/Wmlys02CvR/FM7g05bfwZs3NeNGh+dMxj4DMoK
 9FcShEIz/IXOfl+UvQWTwyJk4MW3XR8vwHc42E9azz6cWFYxOaU4xz17RpcsFVcG58ee
 8Sc9kznSm/uAbvUnXsZvOJzx5vSYWyt2cSLQ1/j+TzPwMnj4VlqtFx/ktWeymcpXdLB6
 FnLM4V/oyDEBuiIcXgP8UyEFDbxcXNVD6XqmkZDAY4tjWyU9f56EqDP67eG/upFiM4Vp
 /aC69wydzJqY97RgVqE9SESGJzA+2XRk+/YnpDb7rsBPYu/dNNZWuoiDgGD8KfjC0KoR
 yWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZ7zsLedbr/EhLtnmvlzdpjCQonJa/LGAB2yIQvIh/A=;
 b=pE/s9cuXzkrUKCu1Jrq7phubdWkKbRrUmjOLtGfV7ms7NvDLYZbrbVHeFdFLcFtUA+
 EHEDMG/S8eeAI3LxwqcHnje9f46/jvRBkh07+2ktwDvPor3xLitdMGNks0vZEc5vxBJK
 poGQKdL8K3k9FWYzFgrhHzIvxnreddRTdd0vMdvANDzn5gp0ZBhEO/XbHXykRvm8iMfG
 DXm0pmycnuTjR+Jr0+9jV1MVCirq9joXN1AWlqKmsL5AOSK6/OwwJ5KSXS2vv88PZHl4
 FOi/wzJDQVSStvSZGii7a746EnXNtS/Lsk0qQ0dvBdi9QGwJxcnmHzv66gpl1ODPKGVc
 YniQ==
X-Gm-Message-State: AOAM530t+4kP8ScNE8/AfnQl1mNPQyi3seO0TUzYM1MszWYVBs63zPYM
 7OYuqHOaerGvqjHtNkpjD+vwNVFPe380o46T5rECqw==
X-Google-Smtp-Source: ABdhPJzkNP5wJMSPvTWnn7E0HnYmhaxIU/PM2x7dsufk3yvkmQTEaLYdI2Csm0kuyi4AVZza7mG1SuZwVskVGyTbnV0=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr3654377ejh.4.1616592166744; 
 Wed, 24 Mar 2021 06:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210324014332.6331-1-richard.henderson@linaro.org>
In-Reply-To: <20210324014332.6331-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 13:22:16 +0000
Message-ID: <CAFEAcA8jMJJdBDK4pyYj5NTPYvKvOrbyn4HrAabzb-iRmJU=-Q@mail.gmail.com>
Subject: Re: [PULL 0/5] tcg patch queue for 6.0
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Wed, 24 Mar 2021 at 01:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 266469947161aa10b1d36843580d369d5aa38589:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-03-23' into staging (2021-03-23 22:28:58 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20210323
>
> for you to fetch changes up to 44b99a6d5f24afcd8476d0d2701e1ca4ab9b35c1:
>
>   exec: Build page-vary-common.c with -fno-lto (2021-03-23 19:36:47 -0600)
>
> ----------------------------------------------------------------
> Workaround for macos mprotect
> Workaround for target_page vs -flto
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

