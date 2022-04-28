Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBEF513059
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:53:18 +0200 (CEST)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0pp-0007Vg-OJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0eb-0005ar-MZ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:41:43 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ea-0007Nz-7I
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:41:41 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec42eae76bso46281247b3.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4fyclb+xTkjhM8px6Fa1jTKmdI88iRNedFML/RKbQI=;
 b=dJh0c9v4d0DkJje5DKqvGkVkxHxVtHsKvqGG1xCpKhcEst76C0bL7u3aHMxco3WwWV
 MJKGqncI40LdOVts5UONddNwkS2+mv2TcGKXqwzCb7omd8UFQOY+LbL9LCGx75B5gpsk
 Y4cO77ePj25EPmxpnYrsf27CYFsXSTBgy3Embjz+Q/aqzBHLKHxSzoLYMFeEjpuUmTUv
 JBU43aRr3QY6qEZVBErRH/PmVTzo7KxIZXPe6Uqa0hOR4mnJV/Bb7jNd7+NA4Iye/zcg
 +GUm/+rCGKScFv5NqWQhh2owcOGwsa1atg/ueNvICT+jrCu+gXhBN3J4iTslQY3oUHFh
 lLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4fyclb+xTkjhM8px6Fa1jTKmdI88iRNedFML/RKbQI=;
 b=PHJkouB+VUwTwyWoVjac+yJRa+1AVpUDNF5mU5+kFLhd8pgRtTffcVK9joVDwaRkcR
 5T8urSFestvIO6YzSsn05FF28miy7YxXsd4+FlzsGygb2ZP2dtm7WGYKau+6iJnP3Kua
 DFlNBKRdm6nqH5inCTa3esZr5AaxoNNgN/rgIsHk6spm17Sjv+V5MQgnhOHwTro597Wi
 Sf/IMcOdFttxuPhQ4pFXcAimpv1K81SGHT5+DH05d6wJ0bVmjG0lxPnH86kpeZydNNUP
 wT68nTw3F5XrqSQPZCZeF5lXCBdVFVBl51YlpQcunfs6xgTMMSTnS6IwanP6P843Ealz
 +Mhg==
X-Gm-Message-State: AOAM531MeICrREwrNVAu9XY3hMDeY+R808yd4/hJYC0IN+cx3ECUtYeJ
 licbR6yoz/VMww62XnX/jRr6KVjRaC1u326HZmqpqA==
X-Google-Smtp-Source: ABdhPJzeF+W7RV2ip7bTve8TY6Y2nLYK5mqfy1D7doYjvbIGj63bE/cpgos0zAY7YS9WHTLlEnSEJiwkHEe8Ypq6/yU=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32000041ywf.347.1651138899072; Thu, 28
 Apr 2022 02:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-7-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:41:28 +0100
Message-ID: <CAFEAcA9PpQ3oUVkH0dG2eKa-xn7h-K37=kBS4gy9PPankPsF7A@mail.gmail.com>
Subject: Re: [PATCH 06/47] target/arm: Use tcg_constant in handle_sys
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 31 +++++++++----------------------
>  1 file changed, 9 insertions(+), 22 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

