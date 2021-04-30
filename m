Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7136FF04
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:57:36 +0200 (CEST)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWSM-0003pc-P6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcVzL-0003kH-H2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:27:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcVzJ-00054n-AY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:27:34 -0400
Received: by mail-ed1-x529.google.com with SMTP id h10so83293225edt.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYWpnniB6ke1XQ1Uk5ZSXIIrZ6YmDOiX1GxTSpWkTbQ=;
 b=OPw06aB4SIyp6EZqdh7XZMJaJVWyErzyGipuRKkEWWLHyY983Skk3efMULwhc6i7ov
 1OTXZ8KkrEjIVhuj4Swmp83HtM3xybYHXag0WHuJbrKIx5KeZhWmmF/eq9CJd+zc/n0f
 VJtnC9/z1ZSGcQUTvc2A7F/GPM1owhjy8SosqsLEeMaAQl/1FnqyyAeiTIqcKnjKh1wk
 YGzMYyiuwp2Pf/+Irte9ejMQJmzXrHxR0X9QfHUi+flnMD2VzGQiX3jTTtEE0AwRzXeC
 v60j32sDSxp+4d/AYDv4RBtQZnWDHSxMWBmCdeYZ78CVJ2E8ogNZOZDRluIZMpYDQOJa
 LoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYWpnniB6ke1XQ1Uk5ZSXIIrZ6YmDOiX1GxTSpWkTbQ=;
 b=pGt/7OiDGeldakz5wpKLVee9lNlhrmkg4VuZGAW/zr1QCqmP+tlYSDXH9pScGw1gNi
 Ggv6MbJ/voPEjm7Iih5D3SQNL69q8q38XJtCI0CNBnLLlanjK+/LMpuYHrIqi+kcE0Gc
 RWGzBDdbZWHdpKZU8ceCXCRxZmOIRYTb8kadjrk6r8thl1ot5qQ8FFq8bj5XLU/fj6Xr
 xx+mha+yV525gbgx1eLIuAgErylVivGqpdxRrx3TN/IRUXoC0tf6whCyNo3QDc2Mhi/C
 WhjjAhCL/eJKMRF8kLK08yFpCfUNrwzZajEqwyTvetXCUOU9tdxdfkW+96Lmg1+4QStZ
 dtFg==
X-Gm-Message-State: AOAM531wJpoadSIAYz0bwSCoFIg9U0vL5sROGuKqpzZZpoFkag0htbRu
 d7Wi5CgOJgpuLlOrc39E+F5cUardc1ayZUDrY3amiQ==
X-Google-Smtp-Source: ABdhPJzr7FJzPnaI/DainrHR+mN64ATUhKkPkBBc4T41WcUv3i19OWi50WSINew20ww7GzodT6ob0/bG7Q84uTPYWZE=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr6992355edt.36.1619800051415; 
 Fri, 30 Apr 2021 09:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210430160355.698194-1-thuth@redhat.com>
In-Reply-To: <20210430160355.698194-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 17:26:29 +0100
Message-ID: <CAFEAcA-0aR6spgOOOqJNkJjs+KyyDpNRNbp3vrZSkv8og1FfDg@mail.gmail.com>
Subject: Re: [PATCH] Remove the deprecated moxie target
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 17:18, Thomas Huth <thuth@redhat.com> wrote:
>
> There are no known users of this CPU anymore, and there are no
> binaries available online which could be used for regression tests,
> so the code has likely completly bit-rotten already. It's been
> marked as deprecated since two releases now and nobody spoke up
> that there is still a need to keep it, thus let's remov it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

