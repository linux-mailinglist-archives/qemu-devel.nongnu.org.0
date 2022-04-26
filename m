Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B6510158
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:07:17 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMma-0006m7-Dk
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njMk6-000540-T2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:04:42 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:46861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njMk5-0005Ts-6T
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:04:42 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i38so14463328ybj.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIJrMVEyGd5MpYV8h1wf6heX3GRjHxNZyi8HWic22uE=;
 b=Mt8241MyNXD+rvbRkCPeMU/wlj81qkWrNInet8lkDCvQ/p1Qsol4gQvpA1S5HeZcV0
 tHWJld50OQlMWbqVKvOkScLCDqTUq5gXTmvo9aRp8D7nZru2CTqsDdq0akNq4ibLM6xe
 nDaQHlO566dhiUlFtFzbMSCF7yF4OmRLLXsSBnKZFfw8m7t7iXnws+jX34/GWBoXd158
 UiwLijHgqX2Bqu0/bKrBlgIDoMa8B6mAT7CbWzhbes2CqYY9sA0fYyumPUHMqyGeLjQS
 UnmriDcnWRAf9JD/ymHJ73uAHzhaCjq+5WNsaS9ZDoGkurws7GadPy7ncc00EWhzwcoa
 WcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIJrMVEyGd5MpYV8h1wf6heX3GRjHxNZyi8HWic22uE=;
 b=5g9Mii5Yu8Atet/XdIPXKwDXScFqUVw5Zs09yDKnfCSJLYyQa795BA1bHRxwza4AGf
 PZTlxGiXXNclE7IAKsL4zimtTXrF74n1YUPQyiPLtExuvjpDB/e8ufwBWAZX/CNdljzI
 AUdDhCafuD5lrHMcKPLkSszSr+ENPgC0GmF6LwL5kBGR1+KeYaVAMZo1OO9aCpFT5tbd
 JWodggcKJlwgbukVrcgr3NhUsgWL5knuihbTUVpYL3yRcYAN6C3Qi21MQu4826T6uRPg
 FPlL+zH9EgBO4cH5aHfYFPO0QfrfYsBYROqZHT6LAM8kSUnz3pPNCzhegtZ1Mhy0MQUH
 UsqA==
X-Gm-Message-State: AOAM5316Lo8mDyXEvHrtgxDWRSczNrh6b+si4d6ghBgdxxPW7SyRW6eo
 RqJQSF7mXa4clFxUEKb9csEBjMLZzMZtsWiPkn+Mkqu9/1I=
X-Google-Smtp-Source: ABdhPJyFxEkxAERkolRUpkU/t7575EdbqcsCPTlh0NU5SyrCB+oFVF5LMlHSDFl7ptKXfdx0qcDGL9xlxaXhQphx5Hw=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr20588226ybg.140.1650985478795; Tue, 26
 Apr 2022 08:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
In-Reply-To: <20220318173038.3350098-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 16:04:27 +0100
Message-ID: <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
Subject: Re: [PATCH] Fix 'writeable' typos
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 at 17:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We have about 25 instances of the typo/variant spelling 'writeable',
> and over 500 of the more common 'writable'.  Standardize on the
> latter.
>
> Change produced with:
>
>  sed -i -e 's/writeable/writable/g' $(git grep -l writeable)
>
> and then hand-undoing the instance in linux-headers/linux/kvm.h.
>
> All these changes are in comments or documentation, except for the
> two local variables in accel/hvf/hvf-accel-ops.c and
> accel/kvm/kvm-all.c.
>
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Ping for this to go via qemu-trivial now 7.0 has been released
(patch has been reviewed).

thanks
-- PMM

