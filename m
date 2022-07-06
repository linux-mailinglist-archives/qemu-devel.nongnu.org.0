Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22D568EDA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:18:12 +0200 (CEST)
Received: from localhost ([::1]:49166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o97j8-0006Zi-Tt
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97fa-0004IN-0d
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:14:30 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97fX-0001Cn-Cz
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:14:29 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id r3so28123391ybr.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wfhnUX8YVSYG9VhiF72A0UQXnWXH6sS7zJvyuE5nKw=;
 b=CDta9/eIqL3uddpLxSZNlaX6CgnXo5V9AQqSubAMU2qLz97NnbnAkvQf5o8kp6eXWI
 uJF/2uL4VWWaAmWG9qdDzKV5A9U6zI1VVP5LE7XbbujfCywb0UAFlo2s6PoDUgWMIDOY
 oKUtSKsII4Ya9uAnqIB8oQhQ/h3Qe1MxyxXaiA5OAI1gQoUdaEgwGHnaXMIkPAdsRW96
 gmRjMxDkKyfO9n6rR6sS4PsQ5ParB40GplM6+Aozxjgz/uToo3IlTF0Aiwzp8b76Wg0R
 ZSdTE3Xkdf8kf56Ja8aGFMjdkfVK0d9xQxaiKv/AACoIOg9GM34v/8XRYwA9CrNlqtkb
 +Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wfhnUX8YVSYG9VhiF72A0UQXnWXH6sS7zJvyuE5nKw=;
 b=TihPmpypu+apL9H0RFuTySF38ORTfuG1ArJUQSHsPUdKzEFwQ/kvtei7JyoHoTcg7E
 n82WoL/NnzX1ppeXnX5+sdxiAgweamDorOLVyMk6i+6Hr2bJ/3J/X59D1VAApUYXhwLC
 iB6XvVzY9RWtGtCWC0JkEcaMf1AQvaxrvtXvh52foAZolLxDmtOgYTXrA1iTlzLxwgM4
 IfPiCV50frebUsREoxqxhXFIG9NJqYv6NZ2/x63wQStJ2phW9EkMb/b9RNbKbKpSATLI
 baSHo+QeRfcnUktWB/P5zepzBJ083UxG9pp+0So7PrR0DagLtBYp36sc3I3ziTJ2501K
 LdXQ==
X-Gm-Message-State: AJIora8F6dK8lkggiQvA1SEtIEMXvBUyP4ybCqLPxqeUkeUrQdrl1u6v
 096+/WSRFMc2e+r96ARmf5yPz9QLXZtN/Auy2f+fog==
X-Google-Smtp-Source: AGRyM1snIl6Ii2iBKDsTH/2ewMX+srwr74LjSiDCDk8BVoR0CBLlEbZUrkx/ZhOvyDqciXxQLSOLHlDG0jiDQ2QvQUw=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr19205169ybg.140.1657124064836; Wed, 06
 Jul 2022 09:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-8-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:13:46 +0100
Message-ID: <CAFEAcA8Hxb1SPLpZSE-jd3HFe+5OtX8OkH8-4tAOxaqmwmQF9g@mail.gmail.com>
Subject: Re: [PATCH v5 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Wed, 6 Jul 2022 at 09:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

