Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629972ED3CF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:58:03 +0100 (CET)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXfm-0004wY-Fl
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXed-0003v2-2P
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:56:51 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXeb-00053r-AG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:56:50 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ce23so10331043ejb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tE6F8Y+uAOLiNnHj5XpVgy8AxDEDwhsX50dwch7V89E=;
 b=MyX55ryjtYkHwS9QKjoSp9NX6q/K6XFWgY8Lp3VIAqAmRqsgh+33URQiH9sU8RrMrZ
 ODAsPrSHfCn8IMrLalwt+K8VJ+NCYPjcrsa+RwKY8MhBGLmhMwCSjhC7NMtHtluff7tK
 za7rVhtYyaqUZWy4pamSkvb3QDETK+PUce2w1JpAAIq3fIHFMflOALe2Cifj8ldKLUCv
 awJGWHSBar4hA+oUZRDVTZ4fDe/h0HTx6K9P3KCWDKzsAiO6TO2f2oSheEvH2CejRP44
 VVRamYt7gMtkHi3skLbJYGARymBv5UDxnqeLIxIl721yWpxk/11NgFo5lqlGU46ChaD8
 mJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE6F8Y+uAOLiNnHj5XpVgy8AxDEDwhsX50dwch7V89E=;
 b=ScvK8pYe4At3vTUpJQ5FeRjQfV7ulc7URC5dJayD1NZZ5DU2Vls4uwp3iyNWZ2IfHz
 mnyrpWx0NIqZngNT6eF1EyAOVoDbFWFZQFS5298RudKoKBhyoxMU/vaQ6oiGPXsM5Oj+
 N1KjoBgrWVDEK+4J62tPu+5M3p9xirCOB9EiLXZMvhHXv/hIAw8Gq1wZwdXzSZYh9K4W
 KQb0o+1SDnAfu6QGMKev6bmM+YEnztrqajTspvfYok+V/CXbCbQTSYnqJxk4RSXMNyos
 hMt0K7IcLcSQfJHRUeXW3l3ndpl1NZdhXfXsO2ciSupigEfPj/NjUk5Jk2Aiz8GLFbwd
 14Ng==
X-Gm-Message-State: AOAM532urhYiiR9/1YK7LiOZBxxy4Gymw/KBYL/NucWBqJ7/EMkRl1gf
 fp3R5CPXn9YI0+4tzuqDlQFNXod0ItbqsV10tfNyng==
X-Google-Smtp-Source: ABdhPJw4FMjG4RReaHWTMdwYKn9IYKja1cYYp4l4ObWZPSmCFdck3x81fnaNwGUkZ3YIez/wwUXqz8+bf8+V039r6iw=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr6970678eja.250.1610035007516; 
 Thu, 07 Jan 2021 07:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-5-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 15:56:36 +0000
Message-ID: <CAFEAcA_0yykn-2LDc+fN+FvF9pb_NFFK1v=f9grfenK--wPbrw@mail.gmail.com>
Subject: Re: [PATCH v2 04/24] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only caller.  Adjust some commentary to talk
> about SCTLR_B instead of the vanishing function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

