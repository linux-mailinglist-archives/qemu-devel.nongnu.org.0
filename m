Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C002CD4B7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:41:32 +0100 (CET)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmzL-0007LQ-5f
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkmxj-0005W8-7Y
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:39:51 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:44671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkmxh-0000Wp-KU
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:39:50 -0500
Received: by mail-ej1-x644.google.com with SMTP id m19so2943473ejj.11
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gd3rdRVQrCJq2qG72YpjmUlcWFR2YcH25MFq8ASPB/M=;
 b=WAlLJOHwlWc1/JOUEd5KGO8Hl6tnWIL0kagUj8oeQGsdv9HAI5B//hSM5K831W8g0y
 mXMl98MNxCBkhgxVPXn2kXZ6mR1wsdnBggThqSX3waimxTWChTQxNIaAPH2S20qmb01L
 2xw3pxRbXtrL0wWa6TpYrHk16jcaLo8FxYkzI/019jRMnOoHnlyvYA2Wfr5oRHb0O8mz
 XO7sPaGKYzvEZ4kvO2Tg7iXWs04BJJdUXNzhuyRDfqA5isdUqmQTZIc7ZHEmmeWvRgJ5
 5HMcFbZn8HF68HEE3kz1qDOOaJbp/7CkBLskqCryxfBqVlm1sNAxNrVRNQTBVfSoQXC0
 P9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gd3rdRVQrCJq2qG72YpjmUlcWFR2YcH25MFq8ASPB/M=;
 b=g258aRtdySDsyJdbKdRKY3I0KcL1jE2mQDQI4b9GkRD6I4KGMABg3V0cub6Qflq7uq
 ROKxV25CIJs6NBR/JYFJ4K+SaMDmOVAm5cYByaLemyxVLZp422HL/v2SZjDqNvlMOnOB
 4fA+J2RuZPBiohp5l7uVqSZVD9DOi7hcF8v0uK7i2+Jve3uOlYJwzIAlFjnMq+uBwXFc
 hypBa/BucCWSTGDGgAC6iV9fTgbWj/HrDanX0Vz6yDkiqXx6SIfpdgEA/kc2D1AJkQx6
 HFRpv1PEnD+V0ykBv3YMivSkYfBnnfVs1v8kP+hxEwdGZYG/uYOay8bVWj03PMi+H7YD
 0OWg==
X-Gm-Message-State: AOAM532h92YvxZp3v/D7RftjA2AbTn2V70Gvwlms6jw6wL8seC/Y6VL7
 uvV+W9iNOHUshXK9NuvvldNJYNtglcmTYZme/Br/Rw==
X-Google-Smtp-Source: ABdhPJx6m0IJHqQ5gWoNyawTPC4otz2U3RLsIkRhA1hOaODHop0uUEvvJ3Vi1ZLgpJ1UP7ktdapvRaIVwa4B7kEQF34=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr2132098ejv.4.1606995587527; 
 Thu, 03 Dec 2020 03:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-10-peter.maydell@linaro.org>
 <74666363-8965-279c-8b00-bf6d61d22be4@linaro.org>
In-Reply-To: <74666363-8965-279c-8b00-bf6d61d22be4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 11:39:36 +0000
Message-ID: <CAFEAcA-8LR3f3ArcbK3iWRGLMRrUTwJUEmYvGYHpzMLXHMmkvA@mail.gmail.com>
Subject: Re: [PATCH v2 09/28] target/arm: Implement VLDR/VSTR system register
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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

On Tue, 1 Dec 2020 at 13:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/19/20 3:55 PM, Peter Maydell wrote:
> > +    gen_aa32_st32(s, value, addr, get_mem_index(s));
>
> This is MemA, so should use
>
>   gen_aa32_st_i32(s, value, addr, get_mem_index(s),
>                   MO_UL | MO_ALIGN);
>
> a-la my patch set from last week fixing other instances.

Also " | s->be_data", right ?

thanks
-- PMM

