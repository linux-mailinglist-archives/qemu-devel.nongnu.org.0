Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC22D7849
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:56:42 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjqb-000507-Az
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjoR-000343-9n
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:54:27 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjoP-0003PB-Ln
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:54:27 -0500
Received: by mail-ej1-x642.google.com with SMTP id n26so12712284eju.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yv6Kv7zVmdOImyngQBzuVUFbKmD8JGL1z777gucKcIk=;
 b=OAvnXDfUZXLzewgxnDWK5jj0UXrtGXfnSOZZPIulJl+yS9FfFAC/lUqL/dk4kGIh2J
 axL8oYJc/3gOa4MZps2sKN7vzrbfSy23NiSemoO2P9bpL8uy99tE5NtFMbC/ODV4E96B
 KAd5vL07WFhvb+9yhMEDwS4bON6vF7s2wiKdGgI3wkXsdcH+Bnb8B2HOl7pYa9SY8mCr
 9cvhrR3VI7usbThYOBu2nA/Dd9I2MypuCw5RyCS1ydQz9HTU468ERquiRRsDL61B2uma
 Asj4/tIm7nR8Dd2METCXqfHUMuK0pJkbDKSQ0vhY2UplOoBaMh7OWbMYiS/DqgGa3DYf
 kSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yv6Kv7zVmdOImyngQBzuVUFbKmD8JGL1z777gucKcIk=;
 b=MFJTt+pjIJj+7VidXliTQF6jUvDnmpORrFWip1PffZPEOL1aMiDb6Hhn/cs79/WMs2
 CdSRAI10/sV5RdGuSsNmZrYyUjWpODmeeIUcSs8YOlC342DogSPoAu3dWXJmATT7bEEG
 CxW1kNRYHKKy76vAmZ2hQ+ppbWtwvKI6ig1NOJ//w7wV2JKo/2dLbnJFheeTSlmPH84d
 EMxMofZ71Do8Z9PM0R0Pbp7KOGxKQyaBYLiQIKCKN9LCzHJ0RsnmJu8W7ulLypxHFH95
 Ly3oJUvgeO12R0lguMliu+P7bWBLP+NMlhzHWYrJ3EhFSa5ju3rAAoFu2+fEdFhh9orv
 85AA==
X-Gm-Message-State: AOAM532DFoIe+LDFE06iwmWd8XUUCgdu3gWAE42U5UFaxGj/Z+lvQIl0
 6Ixwl+H+BBIepmHtGcaaRjtbQo+b+rVtVoQPRZp0Mg==
X-Google-Smtp-Source: ABdhPJzzDKNlEOPFQgq8z/iRDxh+5ppfCyjvGO72kpi2PFrAaepbXRvhoeALq8dlrwzHTSXyRxiIeCCxgw9+qGAYzYI=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr11408373ejb.56.1607698464410; 
 Fri, 11 Dec 2020 06:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20201209174225.401337-1-stefanha@redhat.com>
 <20201209174225.401337-2-stefanha@redhat.com>
In-Reply-To: <20201209174225.401337-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:54:13 +0000
Message-ID: <CAFEAcA-MiY--xnLjjj4Z2uNDwyUEiYH6fECp_4exD1buf9r8rg@mail.gmail.com>
Subject: Re: [PATCH 1/3] trace: fix simpletrace doc mismerge
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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

On Wed, 9 Dec 2020 at 17:42, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The simpletrace documentation section was accidentally split when the
> ftrace section was introduced. Move the simpletrace-specific
> documentation back into the simpletrace section.
>
> Fixes: e64dd5efb2c6d522a3bc9d096cd49a4e53f0ae10 ("trace: document ftrace backend")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/tracing.txt | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

