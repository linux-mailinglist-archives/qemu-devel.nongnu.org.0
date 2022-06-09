Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FFC545287
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:56:41 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLSa-00083U-CN
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK6n-000333-CT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:30:06 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK6i-0001Hf-3y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:30:04 -0400
Received: by mail-yb1-xb33.google.com with SMTP id l204so42343240ybf.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeRUc+eBDm4UXB4KO3Y4Ks9sq8k72XszYd8newJgXhc=;
 b=gLk26GdoRAFRMQh+63xHj5yvEBkYgsTwrdnEp/7ckUCN9KCMZroVSiGDrar9UHtFyh
 9qIbPvOG/xrRAHyLHL3ZLBEbgFvblkLRtIfrc9ZfnTbXJRtMmtr9MY5aSQRwIuepbeUT
 UbgRFo361OzAMr/hfso+S71nOcjSdQYicI/2vRuOV26J0IKz+jt+pzOO2qS05zcL1x7T
 TVSm5nddDp9DwAsrZPtdDWbXROdE118LQTtHWeDkdGFOV09KY1jI12vRlh4PQ24req5+
 DRyhqt6RAYOLaEggqH7GY97Fz2eczfe0428mNG2e/RKLvEuEyhypbubrPbGbC2H1IaJE
 cLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeRUc+eBDm4UXB4KO3Y4Ks9sq8k72XszYd8newJgXhc=;
 b=pCutPJL9Bz395015Phwh110uZe+7vWf2GxHJNaZMx9eNvjKGVYUQT3EZRhHBK8TLMf
 B/4ENRFZhdP3PTqwyk45CR9kOqtV4ZZ7uHij4x/slDygO1Y6o41TYLqIEjd6+t7pDLqO
 Fkjtwm0nBiaBnQsfVBluq2TBgFcoCw4ma0q17arbUzl2cmTxSPRqqxMU+vq+IMEQw6Ja
 9mULaRnca0tNIdMPbO47NXjDM7qH/g/EXekQlH0orB29eyxvWg8WJpDxxnfpab4kp3co
 DszdS98sTy6aCKv4Ro3WO+41mHnJDtQRZfVbhUqCCuwGXliWnN5FuAWktJslzWaHoa8+
 2RRA==
X-Gm-Message-State: AOAM533bpxzW8ZzINHH49IcEX7QqFAH9MyCgTO65qSaucDTzkFaNOzn8
 Z9tuyYjvdkMajlK1uHjKlppJtT5JNN5fiFb+wLurkQ==
X-Google-Smtp-Source: ABdhPJyNFok2LWTLQCxyTqLygnGmQRsUMK90AFa5KYZyPXrhmbHvxUmxlR0pK8UA2892HtJte6izNjOwP18clKT70Zc=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr40779980ybq.67.1654788593154; Thu, 09
 Jun 2022 08:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-32-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:29:42 +0100
Message-ID: <CAFEAcA_-dbVeDfEGiU0JzG8NmcvSPHT4cqpQ=hYMj6HgOx=JNw@mail.gmail.com>
Subject: Re: [PATCH v2 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep all of the error messages together.  This does mean that
> when setting many sve length properties we'll only generate
> one error, but we only really need one.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

