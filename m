Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42D94DCA91
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:54:18 +0100 (CET)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsS9-0007s4-W0
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:54:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsQT-000714-2c
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:52:33 -0400
Received: from [2607:f8b0:4864:20::112d] (port=42800
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsQR-00077k-3l
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:52:32 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso62794727b3.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nT3dJoB0PZAqs4ivhXJR17cZMMDelAl/T6MVbwRp/4=;
 b=E0KMgwrgNLEw8n5pYtfyBifa7I7nFxvZsiVFbDpelTI92Nd6GVWbOsoo8i4xGAS/c7
 h6TImmhEq1MWQ3Lvrc+LnqiBtA8Pn881aX9kXlTPC2yulzdNq313VvMX/5En/ltPJZg6
 pkakypHdKCMJyCTjnqetXTyqMevoH7L4rnN6otyDNwj0PNDEGK/r6JiK7DdXXdrdTg53
 WjtaYZ3JHPE/MqNQts1RKOIguEPap9TypFcySDElSMcLWlrh2bRF9w5v8ZHK+gsncE9b
 G+n1NgZu4h+Hf8MJKehFVMdllA1BiVNeq7A883VZ3O1lX1zAEx5sJXTf/oVbKbdhHOvb
 8AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nT3dJoB0PZAqs4ivhXJR17cZMMDelAl/T6MVbwRp/4=;
 b=gbXw/LZ6zALsAVizC2z4zFuForBEqJEg7RE2B+KNNI+Qcds8uTRPnT7AWiqeQrLlAt
 Oav4rrBqWBPRNfM0cvcV70qQvk/6HkfMJS2UxR5gfq/ZVTH4AxeERikj4h8F+V1gRoA/
 w/ksmpNn9+pweP0gFsRuyaq7dumZuFLIknwJz92BYCDQxX/rHN/17Ud2iY6XJ/V/fFOg
 XOy7BffP1RFEUOZARjuT4IjfbpaknLl9NiJytyOnNmzLp9zJfPsaQGxiPENiIOmqMouK
 LUEQQMkSZ/qNnS+PaH6P4suFO8jklk8Fck6RCNKCAfWNMFplFfn1N9AHDvjyrwKAq/dX
 hRhg==
X-Gm-Message-State: AOAM533Dfvu9/KQyqmSfrdPnnHt8bXwyFAHGn1COAnBI3XTEyZyb3TVR
 GBK02heqNPPsZfqYKVFK6B3yVzQzGcNEUBM1p74kMw==
X-Google-Smtp-Source: ABdhPJx1NEVUnODlfkFemqhuhiBdnzBJBQkhbSPfmcsmu8AEYEWiXE1FE8iI6eStnLUEbTZd/TREQmPgDnbX+IIFA6s=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr6100414ywh.329.1647532350137; Thu, 17
 Mar 2022 08:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-31-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:52:18 +0000
Message-ID: <CAFEAcA-HJk5eRvjvQ5d-uv3kjRBtHLvxcYDYsYRXxUxHBsH9+A@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 30/51] target/nios2: Support division error
 exception
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Thu, 17 Mar 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Division may (optionally) raise a division exception.
> Since the linux kernel has been prepared for this for
> some time, enable it by default.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

