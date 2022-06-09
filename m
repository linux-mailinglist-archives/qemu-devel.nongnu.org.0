Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AC5451CA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:23:49 +0200 (CEST)
Received: from localhost ([::1]:34536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKwm-0003gT-E9
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKa1-0006Jn-LJ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:00:19 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKZy-0007AZ-Aw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:00:16 -0400
Received: by mail-yb1-xb35.google.com with SMTP id g201so14669307ybf.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LuJdV9RcBxUS3p+t4Op6SaIp2uMpZ/T9dQbnP6eEAjo=;
 b=dhRWQCxYPFSb2sSJQ1WDiEVpVXnTqvAQsQgBtNaAIuZiPjDBqMMJa9bkwEqruNPoNa
 +PWOy1GUMLmH1BZcsilNWm4Y4hawP56UAhQqddGsNCO2SLJ87rJhpwq56dnWCGYCTrus
 oLgpiOAQm6ItIgsxwg+ygYJfja6B/yavIg/COtn1yzyMjB8MGwzakiIBkKRl1k+OWOxU
 yYiLYxxeCbCsa9sVwP9pY0anNOMXIYELUVm/1Vla8pLmQTqFuRP/2w5G930/ca3Wn+Ht
 d8RWoFjHvTzwHu49ddtjMekTTXByMGWpPk/JEeJDlxdCBmjHRRNrErxtRX/JDA4948b4
 RvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LuJdV9RcBxUS3p+t4Op6SaIp2uMpZ/T9dQbnP6eEAjo=;
 b=X4FHqK6r36lLJffI3LcxcKBMjHo8PVXf2ZvNoq1LSOpmjgyPbpuE2rKQ05LKhX4mh/
 SUnwdUzLGNMaXH/vPdEAWZZT1RBUhzXVaC+5mWlKsMHhqkAMGQeOZpvgmKUjUCkTjYbH
 m8S+SrlAb8h4a51KjjB5y/YgH6Ag0QYbaaQSmjQYgsDFS+ssmL0IzSJOx1atD9ezI8lE
 YV731K2IPr/DinpeYHU7FAumK6RzchB+nGENCVlS10ryWA0g+BUDqVNXZFZDKA2J99F7
 pdlinh+YTeXYGnWQ/uKMF1tkLdjeRm9OZYzdJtgLGdz9hB27+L/G7U5wa1kg5/OFrXkp
 BgaA==
X-Gm-Message-State: AOAM531+D3TSZQGgxFSnJK9ROGaYYgYBwdJGcrYCD4X6hiMaDvdnuSD8
 XxdqzeFl5KjOlAXh0HQxo71LxA4eDgcR66xjeB64/w==
X-Google-Smtp-Source: ABdhPJyCzev/T9d+d3Qq+86SnS3G6ZvBIQAtQR+SV98PwCI80fgcs+FESTgKWqX1sQmM6mNF+fRjgF2nmtGKm+yIou0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr40913355ybq.67.1654790413041; Thu, 09
 Jun 2022 09:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-5-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:00:02 +0100
Message-ID: <CAFEAcA8dMVsGr_LQEeBgf+euG1qJQ8SBgzkbNzFLacRdYggvCw@mail.gmail.com>
Subject: Re: [PATCH v2 04/25] target/arm: Move exception_target_el out of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 7 Jun 2022 at 03:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the function to op_helper.c, near raise_exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

