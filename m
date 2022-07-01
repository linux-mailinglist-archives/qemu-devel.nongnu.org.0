Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394956337B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:28:26 +0200 (CEST)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Fl3-0004h3-BX
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Ffm-0001Tg-8D
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:22:58 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Ffk-0003wq-SQ
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:22:57 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-317a66d62dfso21885447b3.7
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1HAE9tbimNVrGwXWOXZ+AOUgTZ1SN+6rxBaj40/mJkA=;
 b=louvrRcERJDjpqO3Nk0D3kLBJuPmK9rkfrNS0qrpnI1c+A6/wSbV7dj4JNWb6Ko+nu
 ouTOehSExGWkSLQh9wB5QAuem67YbcfzvC9VDUb6Q4ftthuvSG9wgpDNpN1sBzauf1s2
 RdFy7wdH8u3JDTH6jOk0sAG7cAm/zzbvm91Bg2PJYBb/IvQpRzLlwJpAKQbDWDccw9Bl
 oy/hpEL8KdAnShY5j1jpDTJqwbtv2Hmg5WyJbGU1pq/kTxaEtjRYUZ9GZwI8h5FmOXRu
 ZWsUmiAbL4WJ9s0EpjTNej1y5wJq/5mq8mqI5DXyJXZy7hRLsH5icNbprvCjGYKvbhud
 8gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HAE9tbimNVrGwXWOXZ+AOUgTZ1SN+6rxBaj40/mJkA=;
 b=th3JqgwCZVdp6JCu1Irb576uXngwqhit0YZr/k8bfmJE+VeWvo50pay0eVGWKYplmG
 C2eSz1LtaVh1bJ4vdnALR4I+KHlxc07JAEC5CzrBJAjuIqfoFmqEICmXlNWcP3byEmx3
 w/QT9jdYYfWn9LsW7VQtVz1yqNcuqwT+1AJQ3wwcJG2aR4cPaKHzbXilqN5VWkJxaUrD
 PgKCSKzsmXjB14aAP552mQUmK7AzN7+gjQGy+31UNC+Myn8klvty0z6KRFpMUykmOVZn
 O7GGw03pLYij4OMmMnx51bWZZbcKnkYmTP3e8GY31FDD1LxAH/M01W37jXjn2QkI1Udl
 9/fg==
X-Gm-Message-State: AJIora/V/T0BIS1UEqspJimfVwcSRXi4tSayyAklFrgIR5zhaCzFgYC/
 NnVDY6MHafUnp5V+EVxCbDOkTvXbPCoctbziGz/+1tkDzmI=
X-Google-Smtp-Source: AGRyM1vC0qKsZGlc/5lGIobL2/4tfEofJBWf/KT1lSt/HJjchClJ/WuHTZCaM0ntTh1H5QdhwJdUVtdbgYWUZCMr0MQ=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr16007805ywg.329.1656678174017; Fri, 01
 Jul 2022 05:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-10-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:22:16 +0100
Message-ID: <CAFEAcA9B=2dHJ7m927scmnLuW2V2_r5_Bi=w46QX4=hzVWf-nA@mail.gmail.com>
Subject: Re: [PATCH v4 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jun 2022 at 05:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

