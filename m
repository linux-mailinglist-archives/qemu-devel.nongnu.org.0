Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C6B5670B0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:15:08 +0200 (CEST)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jKV-0004CE-08
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jIX-0001h5-Kn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:13:07 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jIW-0001m4-Ak
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:13:05 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-317a66d62dfso110170127b3.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d56NbgntuKaPhsz9w2swmsKP0dXTGKOGOeJn0h23PX0=;
 b=poZzacN0JdHCa2cYtabOYgBm49mtT5jh9UTW2n/LquJ34uHtf/ZxcZzge9Ikm37Y3k
 0J0uu1Uaf7Bb9g+AQSzQWGufubCRYikTj5ARoYwzWXud5cuzAMQkO+qKy9bLRcljejL6
 5Jc1AHzbiYTEWvY0QvfOoICSpRgIfe3EGsZIlizz6NxKVGx8AuwtRViRhN/H2d2Fqtgw
 1xPqv4LDTWQi27aQQeYlZMCWLD0H/9a48IPqVxLmMXcr4z80Cvh3oRwvXCWEjHKiQ9Jt
 b2ksTiRmd5RDAUFnt57hkmq88JlTF1EXsFEq+MMcYNFCsNPr6kzIamMMnDU7NB72hb0a
 9Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d56NbgntuKaPhsz9w2swmsKP0dXTGKOGOeJn0h23PX0=;
 b=ApZ5BT0xGogiJUy2aymLDc0s+gRtgMaeYgaLhY2QJ2qeEbseYXvmYZpKMqUa2G8gQA
 ZzNN6Iv8CgoxJAZihxc/KCvl4ZQPchDbYwZ9GvotUvowKfFj2B0zlmsbapARs29IGX8P
 yJtad13x4aKwlCMcAPdGzWUJpujR6OgFQPunYg3U3WEZhjcY8YJNE4LPV+uBFNhYR0MM
 oGesYVdlduFeGPV8Vg/SD981kx0RhNUOIV7voziRFucGe50tKjPBx3OWdXF4ljG4Qq6b
 hi8jgslla3xpL5LzyelFiALs45JAW1Gu60yv/citwWNt0n3im/uoEiLsc/3ytrSTMuHj
 WZZw==
X-Gm-Message-State: AJIora9pH5UNrADv75OJhwS46PTzcrQ1Yzt99XZcYQOiAMR40EPyKxaH
 FeD9QXCT8jKFGK6LIufb7kQl8kIXdJ8+laneuyghm909vwc=
X-Google-Smtp-Source: AGRyM1s3JJ64LqYweLAFd8JUcNv4Qxb9ig3EJW/3OHqUSB4NPPYGjz1UE7S8c8IkRSvgdfS+zId5GFTXBHkBR42pPxU=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr38752468ywg.329.1657030383383; Tue, 05
 Jul 2022 07:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-8-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 15:12:52 +0100
Message-ID: <CAFEAcA9dipRZVqvHvBrUGL6nxQtmz8C81W5Dog7uoBVye3m5UQ@mail.gmail.com>
Subject: Re: [PATCH 07/62] include/exec: Remove target_tlb_bitN from MemTxAttrs
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

On Sun, 3 Jul 2022 at 09:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have now moved all uses to PageEntryExtra.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

