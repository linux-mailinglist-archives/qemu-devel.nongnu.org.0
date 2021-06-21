Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51C3AEC8F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:35:53 +0200 (CEST)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLxo-0002rO-Bs
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLwF-0001up-4Q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:34:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLwD-0007gC-JO
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:34:14 -0400
Received: by mail-ed1-x535.google.com with SMTP id c7so18612281edn.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xGMrr7p8qMl7IVcxJwut1txRvr6DYlHQ7eAyRXeZcS0=;
 b=JOUTpCnwlOSlK9FXn7yJ3qL9kDGav33osYNjaC3egkIX1k3Z0w3ZWHX9sUklDXms9R
 dPm83z/F94glgC8ZP+eT8jVaoP66zPgyFG4ixJXdmwXFMHh3jZZZCBjRJAIYLXJTm3ID
 dCQVGtijmqG3IN72oVZIYC8mbKIZy+9UQqO2Pd51Xk+L8DMWRKKG6UjyRM2/+/VlcdCo
 RwU4GsquQl/fyI+Dsu1Eveyp9jFhQcoNNVKQLqTctk9nprbP4eFTBcWnmgxt0jumBKco
 c+GElNcfVYtdVRUcJVg9Igxv746SGUMxqNRUjdq2+M7SHZZagMSoJQtqIvbcEIqXklKP
 AMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xGMrr7p8qMl7IVcxJwut1txRvr6DYlHQ7eAyRXeZcS0=;
 b=At+0Jc9CZsPUMOuLw7VW9GlPcHeE8e169jMBpjJB03YCWoW224zwetJHLFMUhxxpN1
 4Z44Mq5U7CBn7fUw4j2UFeI0TlZE1r/PWvuhMPQ+qJ1cndL4dw+uWw+ZPj8x/+AeoC6v
 l4T52bk2uWJrwTyGMq/RZFatDa1N30CO6wHrwIirzElQrbedWIwGE7+lsukmBRvoUJFI
 sPzoK86QnEAyIb64WqdYSlN0Oka3JcMq2iUpH9Jk9hqBZsWnCw+iHn+A7IRcl2wsp38i
 el+wfwdJTJVy4lGupp0vfXe2f6n+htulEuJvIKX8MR2IXXoGa4tocwrSEt+O+Kz3Kadu
 oUoQ==
X-Gm-Message-State: AOAM530JmW3zDdk+sXMIK0L4C3YmMsYhFVsHmk2Yz+dQuapv1fOmO54Y
 QJLNN/IRQEI/k0MTNJTVesiVuuleVUjyYidUQoViPA==
X-Google-Smtp-Source: ABdhPJy5y1CoKhE7i/e8YjeuaBlYwbMSh6qLqBY0Pd+x9nACZyR8+r85fyYWCTvwr4l7YD2YBl1JmVIBELmbxhsYtSQ=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr1770609edz.44.1624289652087; 
 Mon, 21 Jun 2021 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-28-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:33:36 +0100
Message-ID: <CAFEAcA-D+jXJjyb7gBbNaXj9Th3fKn9D7XWODtTaEJXCym91QA@mail.gmail.com>
Subject: Re: [PATCH 27/28] tcg/aarch64: Unset TCG_TARGET_HAS_MEMORY_BSWAP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Mon, 14 Jun 2021 at 09:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The memory bswap support in the aarch64 backend merely dates from
> a time when it was required.  There is nothing special about the
> backend support that could not have been provided by the middle-end
> even prior to the introduction of the bswap flags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

