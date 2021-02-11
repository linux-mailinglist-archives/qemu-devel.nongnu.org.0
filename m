Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F21031888E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:49:35 +0100 (CET)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9XS-0008Sr-Jz
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lA9SV-0006G4-GS
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:44:27 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lA9ST-0001sd-VT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:44:27 -0500
Received: by mail-ed1-x52e.google.com with SMTP id y18so6391881edw.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnP9lsz4WaUep8GKRx1ZfNQW4qro7FhDhaHbRSulAIU=;
 b=rLvIeUChM7gRiRXbt0nOS++Vz4f5i0T/vNUxg/twdBoh8ApSKkSq7XfQ4rBFK+1vPH
 36hqfuj0E7RYCblqpPH7NMcMshcv0tjkNBa1yjVNUNImOiCplfhhGLJO40i3+ppYey9X
 HlAcv4vbrd4hsoY06CG1aeEdaJ2fesGbq7WG/NN81XzbYsXQjcP7fLtCL3Qw602Quxlk
 cgIt58hya/p+G2GaQ5YiL5NpZNvHeZtgzeVTdBl/CrF8OIlerqgU/FWaD9LNIG9RQRBC
 9jO9b9MPz6s9iCe5c7h/pQGojJCoBd/2snGUJa+o3Ref0Y2bK2VnhFFvyvPx+Ju8JBaH
 pn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnP9lsz4WaUep8GKRx1ZfNQW4qro7FhDhaHbRSulAIU=;
 b=KlKqhZ5qSGqqXKcB9XY86zwB6cmjZKR/ORCMwDmRpdXsrpi/9W2EINZUq5mPZjC3HD
 QgpH3JBg+DnE5v7QBBD5xvVSRPfYS6AB7LDoYRiUZdcN82tWOm3QarJITOYsmNmvpSS5
 Suub7V6ZWSUKYNRZG8lWyB+IXcUrUF4bwY1/PXof+/9xfTT1HJOgoilOXPg5lTLXV9eA
 AyXdNXFfS0wGnf1w+2VF8f07CR3q+eGmYpAuaXkIiRc5rVcwUX4BXbMclknWV0goZMNe
 mKK4b0nezN14UQx0clGlo4Cbcf6itlMVqqaIwwgtL8wfBpgDNvMoPNuaG4iMNcCkF9Rn
 2eVQ==
X-Gm-Message-State: AOAM532Xr9IbFytW1/mF19OXMAbpTSIhbf6QOYXuZ/KxX2ZL65HqgrWs
 JEBMfLjzI8+nk2PY3kCvKj2LD1et2trUuNXmwA8KJA==
X-Google-Smtp-Source: ABdhPJzuchYnSwCJ8D1vu22fklfbEKpY7eoLRye05tAUcPfimFOWDWHnTmWqsZSQmAku93aA6QUL8VFuJ+KBqVgBJGQ=
X-Received: by 2002:a50:d307:: with SMTP id g7mr7832620edh.204.1613040264244; 
 Thu, 11 Feb 2021 02:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20210210000223.884088-1-richard.henderson@linaro.org>
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 10:44:13 +0000
Message-ID: <CAFEAcA94uj2=mr4bq2Z_QpgqpLRqpHBxg8yX9m=E8P0mPWW23Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/31] target-arm: Implement ARMv8.5-MemTag, user mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Wed, 10 Feb 2021 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v6:
>   * Drop the change to probe_access.  The cpu_untagged_addr function
>     isn't correct, since that's specifically for syscalls.  The uses
>     of probe_access in target/arm/ are already done with clean addresses.
>   * Move unlock_user comparison change from p19 to p18.
>
> The only unreviewed patch is 19.
>
>



Applied to target-arm.next, thanks.

-- PMM

