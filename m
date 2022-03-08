Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B64D13E2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:52:52 +0100 (CET)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWWR-0006io-6y
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWSj-0004gD-So
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:49:02 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=43835
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWSi-0004cZ-BN
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:49:01 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id g26so36560283ybj.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSgVeGRg8c3KWnBpDtvEipgvqj348INTXfE0ECytGcQ=;
 b=ZpwQxkERGe+iq7Wbaqd5RzTp2M/oxMMUWk8lGImYSiaWEBShKNCQoI98WnS+592l4Q
 rnWkOvk3BwtUT8AW+73tGVXSe5OGkJ5vmO9bNdopXCPWj4ZZ0xd3TQmf4KO+WUHznMj3
 a9FPwICstSblK+Pi0po79WeD8HOSNooeZYm7MjzpjR0XXmJMVfZYpleipM5QKSZDISZJ
 GMaMiawLj6Gru2BWmOg8JPYPRnnwiKtCeyxy/gy4nD0Wj00YJtG2JNc0QqlT0hgko8sr
 WVbIYCjs7t5/jXXA5NmnoshmB+GdwnAwva/0pYtfbr+pexAQktYx9CTMVUyTjRI24SQS
 dKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSgVeGRg8c3KWnBpDtvEipgvqj348INTXfE0ECytGcQ=;
 b=NKC4Z/p26oGRBac9vHmwtDWurfoertSURU58As4SqY5odDzl9Q2oAjRPE8j9Z2lWAl
 +EKKs3Fm9PGSriTXG7qVwwMyKGwMTKzwTaQlf9VGPP/BP7bm4sTpjYFQhmjucGjCbP7R
 7o/Y8/VL3Z/Yk4wh8ovDL2pmFOsio6/HTz0fo+1nlK9XdEVycgLEqSAXYFrjs3f6SaB9
 QK4Qz5XaVxvEo5VUTlNyFZEnynDPLxwk9kGylhJufS2NhTjqpBfATfS/9n4lZd+QrW09
 PqPG2iBBP4HxBTRnSl47kBF5z88B6I9OKeigG5jTyQPUuMejPt/5CgObd+WE0GOwTJbb
 67JQ==
X-Gm-Message-State: AOAM530r58JPPC+nGn7ilQJzEtKD1b5gSlnXGXXbaqhruqNW+r9euvfx
 LQeUlh8YhXImH3kbYqTVAlks9vwAidSBAPOwuuOUHw==
X-Google-Smtp-Source: ABdhPJyRBx61MVVDQe/+rA3j6DlvmLdYVlvfA7ZrjlpxiatzIXncPfBxxyHYF6y6i9elpmwg4CcZDS6VSkzxqXfU7Dw=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11022639ybp.39.1646732939291; Tue, 08
 Mar 2022 01:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-3-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:48:48 +0000
Message-ID: <CAFEAcA-vNu5s+m+KHoNG1k32ZmAPLa5oaKCs+_izTjK21_AfMw@mail.gmail.com>
Subject: Re: [PATCH v4 02/33] target/nios2: Stop generating code if
 gen_check_supervisor fails
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Whether the cpu is in user-mode or not is something that we
> know at translation-time.  We do not need to generate code
> after having raised an exception.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 20 +++++++++++++++-----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

