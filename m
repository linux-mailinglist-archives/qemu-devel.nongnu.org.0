Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA8539070
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:15:35 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0mc-0003ET-Nj
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0e8-0005kH-4l
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:06:48 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0e2-0002L6-Ol
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:06:47 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ff90e0937aso136887377b3.4
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQVXiaYIei9ZECNg97vGelbwxgGo/LE7041Uyi1Z6o4=;
 b=FhIwkXpTKrGg1fxNCj4wCa/6nB7fw7BkNjH79880DHJGuMT4QCSaln5FgbmUBxa0ly
 k9LgOo7qL9uKEz2n4SK50LoojbhujV6Xc5mW4tMeZy+ztlQJtGbKtm/zqx2ckfqb2CSO
 fXY5Tzjuv0oo5Dy35U99CUuclgwjwMlYnwiYOL85R3xZT/SkSpoyTMuigfwinv9odmxG
 VWAzVLQyBfEqIS9QQQEUZ66hHzWuPLDAp6Wt4yGf73X+9+gZBAthDAfcSBhyd/l3LPjG
 GjowRHCFy19QwqVHmqiPAj0h1tWjiMFIeOX5f0Z49kJcch7rNQAbgnmyZpV4QHNjmvxc
 /MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQVXiaYIei9ZECNg97vGelbwxgGo/LE7041Uyi1Z6o4=;
 b=ExJtboB5DTEJtrztzRKeAfJvzRYwKHUKS7uZxmAirUXsnZMwK8AeLYKWLbwk8tuovU
 T7zZdyPegbTfCA8YsYtAm61K8fTOuhWv6g72Zf1t0rEi55U9+OF9fx7FG4D3y0ogwvXP
 5nvMYep8MDaWEjVH6wuRhVGomOJSUchiL4kNfCXBr7/qKEA2THYGbESDxNCBxTuElCgv
 I9+6FsoNt89xYhMq6ORZgeZFbjDO37+WqqoQDLbBS24txH0mFq1gMRqz4K+eyDUatlCZ
 VVhZbVcRVXobiONI9zjK2/W/aqByoEB65b7LgE/frckX+cLerbM92aGZofNIucGXa4zf
 4oFg==
X-Gm-Message-State: AOAM533nf5iLIyN4T4BACXUBLadpNlfPeiK1/SJXFVZ4oC5N1T4dPGro
 xMdzWlnBaloZNZ0jcsr2YmpOXMrwAHohXirEPmUyrA==
X-Google-Smtp-Source: ABdhPJz/+dIDAFJ6QIhN4Vwpccg/irQWV4BAgTrHwEyUA+ryXl6d9uHJZxF9OD+GirqJh+PP7TjU58JqIcWvapnkIB0=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr63685128ywc.329.1653998801044; Tue, 31
 May 2022 05:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-12-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:06:30 +0100
Message-ID: <CAFEAcA9ON7VHFMsSLW7UD8PmnA_1qHDvfScUBr9ZOU+HNBy+VA@mail.gmail.com>
Subject: Re: [PATCH 11/18] target/arm: Move arm_debug_target_el to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Mon, 23 May 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is private to the implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

