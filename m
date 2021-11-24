Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7AD45C893
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:23:57 +0100 (CET)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpu7o-0005Y5-IU
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpu6K-0004sQ-Te
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:22:24 -0500
Received: from [2a00:1450:4864:20::32f] (port=52878
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpu6J-0000YL-3O
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:22:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o29so2747581wms.2
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOEklZUlrfY8LiT9MIfgYYguKnmxNB4ekChqdD7A9Ls=;
 b=eOrFe7IljdPBLLkdipBbwrVGeUTzANbmuozEePqRykyTeqyaRkRwN0TB0+HAIAuEEJ
 nu23Gpos8Z7DStuLTs4IHyqmRh0qDnNf5RprfyyqtsFCIeN3pzYIN0BnScBZwsPn8Okw
 f8wSsOYPlQUutgn1TDathprFDKAWOnokhOTVHUpIXX731PVtAZdPwc8CwPKuNKtlDKLQ
 ozNWxF+qW6DPm9H6XTFdFX0VEk3jWX81L+nZsuz4cQcY+xKEXBdfDfEOsRFIYstGQaoS
 aAgPDPwT7BxYl9lk9v7aB2ldTRbBZF/F/NU4lW3tHO0xH0dYhh1OKV5Hv1h4A+Tyfz44
 PWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOEklZUlrfY8LiT9MIfgYYguKnmxNB4ekChqdD7A9Ls=;
 b=ZdiWSLZ2BS4Hlp/LfcMgjSpQOMQoOk/bZ1wgfRMNc6zcexC1/bmyiJ6eFmtG4hef5z
 gfJj0YpPijKm78rU8R65raRwXxtlpZoEl5yfKiWHkkYJEKViW4dO+7S2CjYmVijjTPUT
 XhxpuErV/90LU1VstK6BHLJX7hMYDow6hljFICcyBpFnvbJQyuflZZV2kpWRd4pHJXAt
 s63l11LoYgwW+wMefWOOs3FPSK0Nsb1+4cMGfiXfIGfvGnbufi0SJ3cyCF6yUaiL4wUZ
 Shn6AclZ5MF0/7YV0nTi86VfrWN49KTrOxh7k5wryrr/TZ8+Zi3Q9N9LcHpIvYb5lz2m
 f9Iw==
X-Gm-Message-State: AOAM533kVl7KoTzdGWz3hTDe96rP9ZtO4Jk4nPCS0M9D5AGicKi2wdSx
 LuqUat1PEaR9zVMuNJFNRLMozc9tarlSibdhojicUg==
X-Google-Smtp-Source: ABdhPJwpZWkVul/YAUh2rEmIxbvrloXfwS0Xd+OLWTYvsZ1zHaGMeXjY7qszSUwOuvmOguzaX6TVQKbBnE/pzeDgHYM=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr16564461wmq.21.1637767341209; 
 Wed, 24 Nov 2021 07:22:21 -0800 (PST)
MIME-Version: 1.0
References: <ba2e8c4b-5e68-af08-bbe6-fef29d3177d1@linaro.org>
In-Reply-To: <ba2e8c4b-5e68-af08-bbe6-fef29d3177d1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Nov 2021 15:22:10 +0000
Message-ID: <CAFEAcA829qfgog8o35OLNsXnZ3WX1smGjfY_hJiTWXv20-3Jdg@mail.gmail.com>
Subject: Re: Delay rc2 until 24 Nov
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 22:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> I'm going to delay rc2 from tonight until tomorrow.
> Hoping for a resolution to the gicv3 issue.

You won't get one today because I don't work Wednesdays.
I'm hoping to have a look Thursday, maybe patch by the
end of the week.

-- PMM

