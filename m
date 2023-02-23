Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CE6A0E1A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEak-00021S-UV; Thu, 23 Feb 2023 11:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEag-00020l-1l
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:37:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEae-0000an-Ie
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:37:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso13501771pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nSlzryF5KZJWLXPyGf6SJjUg8uAkeD/R4RAa93q3TBY=;
 b=GjEd9NzS4JVH+KzX27Tv1vA5kkd1OfIqvEpvoIqiVtIN/dnf8gcNGZOMztRbjJGQtg
 7RX8wCSy87QEjcwTnqoF9dcJOHCy63l9A5dyGRonuGHkYOA1++L/4KGT9r2NKfpvoLr2
 dnzSH97uqg07y7MJZd64cI9D/RIK9nEGOe1DKSHFRSRyI2q76GM8/UyDtegmzTdoAs1j
 w4TcuPNzV9XKTELf6vS1K67qx7fwS28Lz6/DRTgA732mvAnTxgbWGTfn1w6oFK8R6cly
 ho5owdudoGjbS3biYty0gw//f0xVp5VzVzfzAmZPdVoKip9Vtfj6Nr3sOHBQq+l+9mXH
 8ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nSlzryF5KZJWLXPyGf6SJjUg8uAkeD/R4RAa93q3TBY=;
 b=dKJ3G5Z0zxv/05nMbgXPsClQ1lTa7HYS7Q0f8qVgViQ8OXz5AfjxxlbpZXdfElTOsz
 bOsq/H8Y73376MxXNrX/LkmDD6wok3IPzXyk/eq7ZjTaBuXJb2mu6BvGVAl0k35+Y6nu
 /3AqyMRVTs9ozm5H3rbYOugiJhJQh3QOSOyKoPWKklM4qcUXkRqp4NAYiw0a+5cCVhNF
 e2z2y1JyIfpO0QkL3qZzaaElbgy90ziGYhV3DQGBCIZWYzkXF2vPTAb5aJ8ed0VE6aCl
 yH8a5bedAKsvx2Tyl/f8u2vkkfRJgr/ciaLQ4yiVlt5E/uHd/CnhMx+LkJuYmfYXbbZO
 lcFg==
X-Gm-Message-State: AO0yUKX31PaHT73TyBnuVAi4O0v20twQeSRElGuta9WQr4NG0d9OEz1M
 ue1ZyF8LzPoBIR+7pvSbcYx/YL7KYQ74n5EMBoQzQw==
X-Google-Smtp-Source: AK7set+5+8I7NycKUpsbnVxEtY+Wa4kQQik3vTqUXDTW/SQFo2W1zHNscyUGACHZ1MtPpJYb8NXF7rdM9+SRCsFrKio=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1273721pjb.137.1677170223236; Thu, 23
 Feb 2023 08:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-19-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:36:52 +0000
Message-ID: <CAFEAcA_U31+vQC-58tffpzxreRgYC=TBzKRHrz=iJ0Sm9Szr2Q@mail.gmail.com>
Subject: Re: [PATCH v1 18/19] test/tcg/multiarch: Adjust sigbus.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With -cpu max and FEAT_LSE2, the __aarch64__ section will only raise
> an alignment exception when the load crosses a 16-byte boundary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

