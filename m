Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71031CBCC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:24:38 +0100 (CET)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1HK-0002fp-0q
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1GM-00027N-Op
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:23:38 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1GL-0001es-1b
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:23:38 -0500
Received: by mail-ed1-x530.google.com with SMTP id g3so9872894edb.11
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xXW8vZICAdcaeO7FqLvJ/bL7E0JJoDe05nJEyOiIcE=;
 b=yE5yLI7Sj+G8qLP6IIMVZdztcYhOEpx6/TypWSlhws7Vs6LFp4OAQQ+zmuhrLHBvP4
 nvc1GoxOob5ZTZ8VQG1nI2HGxb2HJwplP4PfS9EErLFtBjeOUGXfjojJ186hsZ0/MRMR
 KXXMXUbWZDcVBJvoo/pipCVumOXN9YSLGVqRiQz+W7Wmi5ytwXA7YR2pRBvmYGCvja1L
 L+8Sj9tcY2GLAf0PZBtrLgOSoHeiIaulhLPsGiDbnda9/25/fov+e0CAc7e6kxUZnzKl
 xmoBBCTocoHFuFLFwK4KKGXG2b8RLKH87CyRqgV2+OISsOBat4ybzqY19jGKoJebGVvN
 JpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xXW8vZICAdcaeO7FqLvJ/bL7E0JJoDe05nJEyOiIcE=;
 b=UcW93am8IzNLrzNkNjvnhY2wjzlkjC03ZdyIOQtjTANDtC08TZuWpH6/FPZlqAJmQK
 3+ynwCIZQE9tITlqDoZWz0IFq91/Ta2a+Y3mAWkJXxpHonwPmvN2yFUvBw8GntgfkkS4
 C4MaETXk6xtYT4nZN0rirU55ueeoLs7pAQxFSkPCeTHRiq8iftl9Kapoj3H6tLNAl/tX
 O3wblG8Ln1EcDsp/+D8wtsf4A/sxLHO9B43+gnLwS0y8ERMQZk+Lrh/cM1nRPwxoeMkp
 ZO0P2jzi403jeORpEjmNu5ho3hLqOka8W/+swFaCBdNg4o/Rz5Sjn/nEYgcc2RyS1B/o
 F2QA==
X-Gm-Message-State: AOAM533LuPLOsXVtuHM7XL+5lMZzwosgK6IgRqjXEmKNyi5xJ/+/4eZe
 KLbXOYTeuxibqp8A0Y/cVuUWBVjZ+gPR+OQ0DJeZeA==
X-Google-Smtp-Source: ABdhPJxGSgnoVmhqrchQvRrpqkM0HGoQNqmKJVDn5rJ71EeB/MOcC3lrKH//T1aNfUnElD/SdN7JMT8whc/FzB3Q3PE=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr20682751edd.100.1613485415498; 
 Tue, 16 Feb 2021 06:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:23:24 +0000
Message-ID: <CAFEAcA8JqjSg=spRdQUonORghEL2HP+q9ZjB=JwL1c2Laco8DA@mail.gmail.com>
Subject: Re: [PATCH 1/2] sbsa-ref: remove cortex-a53 from list of supported
 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 12:36, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
> above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Hi; could you resend your patches in the right format, please?
 * with a cover letter if it's a multi-patch series
 * with the cover letter not a reply-to or follow-up to any
   existing email
 * with each patch in the series being a follow-up to its cover letter
 * with a suitable '[PATCH v3]' in the subject if this is v3 of
   a patch(series), etc
 * with any accumulated reviewed-by, acked-by, etc tags

Otherwise it's pretty confusing to try to fish the right version
out of the mailing list; in particular the automated patch handling
tools and scripts have got confused by your patches here.

https://wiki.qemu.org/Contribute/SubmitAPatch has some notes.

thanks
-- PMM

