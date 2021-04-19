Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A043648BE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:07:33 +0200 (CEST)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXMy-00060V-2b
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXKQ-0003yc-Q6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:04:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXKO-0004SD-Ed
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:04:54 -0400
Received: by mail-ed1-x534.google.com with SMTP id e7so41529316edu.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiLLJvAt+sF58oLzWdnpi0HKIJVXrKww4zfffwPeQdk=;
 b=BNK4IqdjFDX/UYaeIAHvWAYSuiXXSuAQq29OMVsX2pcWrZwgnSx7nzEGo0nUsmmFr1
 v+QN2UvPBJP7cubzqAYBU/DMVn0cUnm/3eI0ZyjVQSmD+WChjUTBCejVDkLq1lrgn+tb
 6SkxHOxm4uUBgPF4IFqBQelO8V9KZB36HaRchu9DUQvexoONwjRThERVr9n0hNkuXQYZ
 KYu/3lu1iiJt9H+R60zNXMj85RBDCIfo8oVtW/KMmnG/q5DMKe5HBohwEaFUVFGpVhFm
 wRYZihxsCcyciDqA/NGaoQAI0LR7hhj3aVHOBcyYJCNf2eu3cScGBGWuS4wxgBRlhNvs
 Js2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiLLJvAt+sF58oLzWdnpi0HKIJVXrKww4zfffwPeQdk=;
 b=AEMKyhIzwf/c1HbfwsnHHcXjDywnimEmoecCYklbxbXv/J04wtt6S2AKAdIEXBRpb5
 U/ahQ926ZLVZw70Mp3a/yA7T8nEcqtd6OHBIoH3FABeG+DZRhobPmSQ4kLdFITpC7awi
 9vxmd42uotk3VhJOtdz+icaMu+TRRy171/sKFT+wK5lyhHsdFk4NsqvEcKm9hjTs3Dfb
 UGZl4Y3SgGti1a3xqmewD5buJi08N1ozXMQqCBFcsvGl5wJYMXpZviThsROGVoOKF4kP
 sz4cDUUPwJmYENL/FO56swruXHiYfgJdbD8em2ID0IOTaqmA3bcl8o27yzIReus74JK+
 jUOQ==
X-Gm-Message-State: AOAM530vsx7dAspVP7e+45dD14exMer1O7tIekaPh5X971hJkNEqMkrM
 RJwDnI9pdthvVEpr17wdk1MibxOkfKRcJjZi7OsRKQ==
X-Google-Smtp-Source: ABdhPJyOwjWMsa+dup4wmOZVxwtQrqUtBabAEiHe7w9SXhpoHUnfJbU4/mAxJ8+iK0Aje2s5PzXoUGhUXNGoSl/zI5Q=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr23425930edd.52.1618851890528; 
 Mon, 19 Apr 2021 10:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-3-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:03:59 +0100
Message-ID: <CAFEAcA_skZjvVsftNmGsE1JsZ-+45+22w8xwT9-oim0ET18DkQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/30] target/arm: Rename TBFLAG_A32, SCTLR_B
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 20:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're about to rearrange the macro expansion surrounding tbflags,
> and this field name will be expanded using the bit definition of
> the same name, resulting in a token pasting error.
>
> So SCTLR_B -> SCTLR__B in the 3 uses, and document it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

The new name is kinda ugly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

