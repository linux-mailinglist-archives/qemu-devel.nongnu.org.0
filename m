Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA340C8A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:47:21 +0200 (CEST)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQX84-00026L-Om
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQX4k-0007Fi-Nk
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:43:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQX4i-0006CH-Tn
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:43:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so5160966wmq.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8c8XdpV0joi0dwxjCGSjhfA5PrGb+9IVtV0lUbIGmA=;
 b=nhstBdXstH1zhgrwDcxN7ZgNe/P4XLcc8y0QKNuMNdUyOjWKjPlnp+Pf9XLmFRNs2l
 iwomD1TO7O6Er2rWmgFdFccKQgwIHVAppuEDc5aLmMwNyhiEWHiFRQyVDzbRM4STBGlX
 92/GfwF1jcqI62UNXP/RdaVio5Ct0FdN3g/pW/GrmWAyz5erwbA/dtft0+1Eg1lNKQUE
 +G7ozrFv60kKtDDQBHtaPkL+3i58wZqMrmbZZMUCNzuw9JqEPEpxzAujkoU8d1QbNScp
 st9XTO1IWtGmsE7K81K+icnC31feMbExEInXiMIhlhRCzr3e6WUqyuRk1E+ruq8VBuxh
 DgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8c8XdpV0joi0dwxjCGSjhfA5PrGb+9IVtV0lUbIGmA=;
 b=uq9twALrXh8kldNCv+BThdLgTJ4MJkpxMMK+6C1xMmKzRDmNlAiUMjxHK9ys6u1O6r
 mQ2a2ER0Vcl7y8+qdCkjsg1yrU4tEXTd4witoJrhb/3jRTU1lJoACcauvGyfgf7DZJT/
 e/dU0GRUaJSTwItUgAWbFgHwaEYRfOrIsotiSzBAWj4WCp+inEWcdogHFkEdgX7JiP0o
 2QZrNB9Hm4XkyHRMX7/JsuoR8xepyyqCj0v35BhU9Mw/nQRBnONCrnq0nDY6qkDrBbik
 cHqkRG0lnCdAjNPBzaD2J7/i68YQibXrZEsmizvRM7VlhLR0+KfP9wnMq1aUIXkRN5i2
 4R1Q==
X-Gm-Message-State: AOAM530yiM7l+h01viCfxvHLlhtv654rn+Yz1WgbJss7TD4UKBA36R+c
 7I2U7nbCJUbdMSDLRaPnFOy8NbTTy1IeBaLywQozS5RGHjU=
X-Google-Smtp-Source: ABdhPJxG0egcp6O0hNb/VKxZsPu4gNM9tcsCNhNDgDE9t+o0xPH1vVUxLX+IaSioX/tXVqJNrYluENJKUKOF9JrAW+4=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr5194661wmo.21.1631720630910; 
 Wed, 15 Sep 2021 08:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210915123412.8232-1-peter.maydell@linaro.org>
In-Reply-To: <20210915123412.8232-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 16:42:59 +0100
Message-ID: <CAFEAcA8c4ZURFTd1KYiASFCwGn0jr2ozjJ_U++qeLPvjk1SGmw@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Mark manual-only jobs as allow_failure
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If a gitlab CI job is marked as manual-only but is not marked
> as allow_failure, then gitlab considers that the pipeline is
> "blocked" until the job has been manually triggered. We need
> to mark these manual-only jobs as also allow_failure: true
> so that gitlab doesn't insist that they have run before it
> will consider the pipeline to be complete.
>
> Fixes: 4c9af1ea1457782cf0adb29
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Applied to master, thanks.

-- PMM

