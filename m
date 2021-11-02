Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82531442BC8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:46:22 +0100 (CET)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrJ7-0000EZ-FG
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhrHb-0007da-LC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:44:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhrHV-0004Bv-00
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:44:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1753043wmf.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1YbZJKOp+rxVP+Ro0kYV+vfpuUUpMbR9Ehxm+ZNWN0=;
 b=pOQF5Rs6fgoU3yXvhviNb6KdzjOOfiOm7mjy5eCLyabe42kj6LgBWMIwOD2i23fCtc
 3xVxmPFCAvCRjEWedl/qKIhVmgdJ0eovlq9PHzCSCDYdGYkQRT/zfDL4B+HNt1rG7R6N
 hf8k9wCEv8ylWTlR+mZ5mDljJtI7nkXygLjme1FuYyqNP2Az38Ofq/rhNa6GTXG05jBZ
 VDFEppFUQaJCGr78G1OmDN7EnE9Gu666kn9y4rrbmkziLM1lQSYQwal7ZdCjlvvzleH7
 qXMlsZi/s8V2SjOWxe7+TAoJUOioFKUIXt7FtdQPAcOr5iPLbgVAboNznmJwuCQNSSE6
 AUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1YbZJKOp+rxVP+Ro0kYV+vfpuUUpMbR9Ehxm+ZNWN0=;
 b=K9Alz0jzfZu7QI+6EAKeI7eIO9H9JATZZJH9bg5ZDC9yoY5FII2S4XiJywSgKuRlD9
 rSmQ2AS/4demLq3zXnmaDKDS4AvXrNbqC8Zi0wAg9mTqhlNuHvQlX9/hj4zlOgs7/YtS
 XwUBDpSQqEbOuygzzl+xtzYZUFsFl2uuEcdsNfIar73tE+PmYnKGKjAel2ipQSAqp6fN
 sbHShNejjaJErkJVlJyq58i9c60mC1JvOGqB5Ag1PWf2pSCZKoN8uAdn4fB3yZHlT+Iq
 vwSUuHa6haA0uUW93kdX3Uld4TEzy79SCTs8ynpOhdC2Gvkl5yyniXINLQTQpxSIzx9D
 nwbw==
X-Gm-Message-State: AOAM533iYCI9t7VpR/n0fsBvQ2FVTihEjBR1E/T2xME4kaQFeW+gNs/N
 M9BZqtl+pi4tTGlhQksnVXhx3eOpM0+v6FvBCHruOA==
X-Google-Smtp-Source: ABdhPJyuE/r5RIqLmtgpN3n41BkRbyKyvwgi7sXa3SB+6TasIORwaLYkSK2eqxb1JcWv9ZSdJwWlorFWaVXYgVqSUPE=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr6103039wmc.126.1635849879409; 
 Tue, 02 Nov 2021 03:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
 <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
 <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
In-Reply-To: <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 10:44:28 +0000
Message-ID: <CAFEAcA8VnBS=V9BUqGPHg-mXS975SPCsDXQobyJ7P=AwGLeMhQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 10:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/1/21 1:50 PM, Hao Wu wrote:
> > Is this reply to a wrong thread? I thought it was applied a long time ago.
>
> Probably.

Possibly you meant this 5-patch NPCM7xx series ?
https://patchew.org/QEMU/20211008002628.1958285-1-wuhaotsh@google.com/
("[PATCH v2 0/5] hw/arm: Add MMC device for NPCM7XX boards")

which has been reviewed and is ready to go in I think.

thanks
-- PMM

