Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A6239B6D8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:13:22 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp6pN-0005YK-1I
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp6ky-0004Wv-P4
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:08:51 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp6ku-0003mW-7L
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:08:48 -0400
Received: by mail-ed1-x535.google.com with SMTP id u24so10443356edy.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q1vMgjE0cpnKjqmaVn7IjvMtiKgkumRZFvX3vwLUQLw=;
 b=Pi0X5vd0i8bf4Fx2A5wV1aQDaH2mZ5xz75jwNXv5DC2ozQJfIYeKZJ9D5RqTaof39g
 fBIuT/9chuxB7UWJXK2dKjAFKwt7x4V4pFpWgJ4TeJmXmzf1/D5AdRG+f0mt/oWnSZrx
 bJcrfdiO0G1+Ju9eGzR46cuJF/HceMWEzszjJd4WEXp2bLykj4dW3za3+zF96LYCo2S2
 upSE8thP30oyQipRi4tgS+jti0qQAHaV7RTO+qytJ2uLD+85j3C8tFKDGxdFi+oWR587
 SJ9lc6a8ac4kX3l3z6RXVHO3ZEP8i2V8f3LqNXpV/4SEYlwqzgOBJlxOZx0cfJGTOE3e
 zGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1vMgjE0cpnKjqmaVn7IjvMtiKgkumRZFvX3vwLUQLw=;
 b=km6sm21Vm3rLj9h363gXj8GmLeIUM0Q6FnTXBy3ILaUBhwhBcHyLCaosTGLRQMa4tR
 e09IBI6XnZ9OKvSdFKKmtUdNbr2tqNKoWHXU0z34NkKw80QfApYPoi5eExOtjqsrJ0Xu
 HIB8N76mtsth60TfpsoSu0i57D4+nA8+/iki/TY2SbIepT95d3BGjC6hLe4sXl1JGLjM
 iXUMf4BSS2lRF+d8HRvk8fDYI6kmE4IX+yULUIxKhsSUTM7dfnf9wj6wlJJnAyACeSyP
 VRFwHFvyTyOETL0aT3g5MFsiPGR4vTdquHB0Kjpzt3FUwl9Ys3DPpEijLpZLEroGIBLo
 2KDA==
X-Gm-Message-State: AOAM531kd+Igj1CHtAlEf75vCAplHF/wYLVkoK5iCUY3dxq6SG4JqcCJ
 2VGJVl4/xNIWR1ADuN4jRVcEdrDi2GVn5x1s8JZyTw==
X-Google-Smtp-Source: ABdhPJzDIpGsGnz5vUre7WAE7N1jQUo4LXnHeT5Z1vAZZnHRMp2i2mZpjeX3nPrDdS6bz45Bc3TbQlYfX8e1TkCvlj0=
X-Received: by 2002:a05:6402:2791:: with SMTP id
 b17mr3857791ede.44.1622801321601; 
 Fri, 04 Jun 2021 03:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
 <20210527052122.97103-3-ysato@users.sourceforge.jp>
In-Reply-To: <20210527052122.97103-3-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 11:08:07 +0100
Message-ID: <CAFEAcA895CptJ7w_HzhVQc4EgCJUNACNEovmym3qMbGmLkqzkA@mail.gmail.com>
Subject: Re: [PATCH 02/11] hw/char: remove sh_serial.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
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

On Thu, 27 May 2021 at 06:24, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> Migrate to renesas_sci.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  hw/char/sh_serial.c | 431 --------------------------------------------
>  MAINTAINERS         |   4 +-
>  hw/char/Kconfig     |   3 -
>  hw/char/meson.build |   1 -
>  4 files changed, 2 insertions(+), 437 deletions(-)
>  delete mode 100644 hw/char/sh_serial.c

This won't compile, because there are still boards which use
the old code you are removing here. The patchset has to be able
to compile and work at every step, so you need to first add new
devices, then convert the boards to use them, and then as the
last step you can remove the old implementations.

Checking, I find that patch 1 doesn't compile either.

thanks
-- PMM

