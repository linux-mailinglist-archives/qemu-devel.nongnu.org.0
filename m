Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64B4DCE3A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:56:33 +0100 (CET)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvIW-0000Rn-PQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:56:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvFl-0006f3-Li
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:53:41 -0400
Received: from [2607:f8b0:4864:20::112f] (port=43850
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvFk-0001zs-4l
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:53:41 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e59939b862so68551737b3.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WNPkKs1GhXf0X5PWe/ZUYqK4MpS7NnoeaF5CnXN7WBw=;
 b=y6NKoIJXUGZAyAtLB0hBv4gM2Us09yQBWttVRUdPXsfIMroWVOENM8KOY1csoeTmxg
 fylx7ywvDEQOPxAUD5xbqznteOgwH+RoSBxOIlmAZ4BqS0YH8Is05oITJ/RTsZIXXVpM
 YkfF264EEsH+PWsPJasvYj+HtZoqaSYvL4Are4zZPLsEN/vnsjoFMjIeu+SxFsYCqL5J
 NVys/h0MrbUPsHCO1ilQPWlmXy1YvrZQ9TgNlhaSed5CfFXyhxT3FWau5C/jLqXlDv/8
 3xw0TiMzIS5Mkb+pqEBCisdao4N6dItyw9xzyHdtEU7UFkVAzK6jcYTM2xOSNjsbUpmd
 JYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WNPkKs1GhXf0X5PWe/ZUYqK4MpS7NnoeaF5CnXN7WBw=;
 b=Na+uWOW3SXmax+Dm4iegbpLlDMaX/dj6Rvu+ZH5F+Ub63pZWr6/miwfl+G6QxYN94x
 HRRBbfd8v6PUkMIlFXkAbMB7wfaHVh7YLr5JrTw/6L7RCY5sx6tBPUSlwpwg/uxSESTL
 UO7hHK24N3Hury7lE2gH3AhSx2u6RWnmtmR0VOx0XgTGuZfV3cpiKVUl0Pp8/RRRi0Kw
 GAipknqx8s6dMlFYRTQsZvnlcRvubWBc+q2Cxfz68A3rokqDIJF1dgXNsENxSyub9DQT
 ASIIm35HCjwuOYLZAi6vwaVqDZYoHhOH2DLwcC12WZHUOZHtOxBW7SFfmcuHGkIJj71s
 xQWw==
X-Gm-Message-State: AOAM532kddWGqsuoWjL7Utvz4ffIqqwHl1l5/eMht5dht1j2tVrZD2mx
 2fR6CeOVI6Eq783vcN79ZEuPCFw9AjmDjeGC2OUWUg==
X-Google-Smtp-Source: ABdhPJwh14H9n5i3nus04qj9nMdB+3hHfJHMCu94TCVeXDSXpW2Gp3YIvKePq7zslCa+6rPixChXZMHVT0snamIu178=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr7148911ywk.455.1647543218926; Thu, 17
 Mar 2022 11:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-44-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 18:53:27 +0000
Message-ID: <CAFEAcA8y+dtGTq4Zbh2muky1OV7mFL2mO+p5CGjbqL2zJSkiYw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 43/51] target/nios2: Update helper_eret for
 shadow registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When CRS = 0, we restore from estatus; otherwise from sstatus.
> Update for the new CRS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

