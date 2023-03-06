Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5E6ABFB1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZA5i-0001K2-VX; Mon, 06 Mar 2023 07:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA5K-0000jQ-59
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:36:58 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA5H-0004dZ-V8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:36:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so7481766pjb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678106214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8bOq3s8mJlTPBrkDKEosfGpF47Iu0auGKo/FZjfAVos=;
 b=TzVJhsQxLd/0qFkj/sjOxg2DbuSx5gVvf+iQCIOqaIvwbyj2IBKGKhGftfIF6gddUi
 FzhN2BFDfmGLiWMwtDbwFpTsdqFshRsEuN5tUs4tUWDkGElERgUj61OApBd3dRNgaJVu
 M0dAxIgOgMkZ4zyzItMoNpXOjn1eInDWrAeO7Bo8SQYRHw0pC49rJl5gTkLiVtSyA1y3
 UR+OlpI+jgueypHtQQb8s2CzSTbsZc4/keQKUDaQe9VG1Jc5eA/blo5SIsIFmGbXV17a
 Vq72MMxY+AKD+87YxtV6vvx1EuNYqSmN4dHhCzsTrx3nmdwX69uUOvHmFlWTB61avjGX
 3+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8bOq3s8mJlTPBrkDKEosfGpF47Iu0auGKo/FZjfAVos=;
 b=2Qf7VSQ1QVJA/KAiDXlPfnSWP9/ZonVoZcuTJMWsvtR6Ib2coR+RPYHzRyFSG1/b3L
 F3JoWFZj8ZcZ4CX0r2CqQImGsUSYHrrFDah9v4Om7DP2+VnBvC2DJA7hv55jUdfZyLhq
 zmQKJakJfvgx+yrW9Bew0A/cq24Kihr/ZGodtOPyZvyPBrrnxr54uerI1jxODxdQlIyj
 pIScIur6flDycIV03lHrm3IJO6IeInuAOaIxaUVYZyns7A/ura0z117R4OgLl0QBmWqM
 YmHQgYcWNXcdDWghZ4Ff6TRC47WrGnc4e9mc/PgGrmXYkL19QlFmhfaxZS7RMz6K6IjT
 PImg==
X-Gm-Message-State: AO0yUKWMpfrX47ASQLA1kevuS5v73/GmF4F3T1JtYAdYyhxVVWFIhwrj
 amz0MtXi0z4McGedOM78cAUoiS1k9G9ZtVNJBjYYJg==
X-Google-Smtp-Source: AK7set9H7AMPO2OXHeXNUeh9elnRDKUjWD+sWHRlRJX880nZmsTaQbmk8u5zbh+PiOa7CE0yW99P1Co64LLIrkbL58g=
X-Received: by 2002:a17:903:258f:b0:19a:98ea:5ef1 with SMTP id
 jb15-20020a170903258f00b0019a98ea5ef1mr4197511plb.13.1678106214377; Mon, 06
 Mar 2023 04:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20230228003713.861168-1-richard.henderson@linaro.org>
 <20230228003713.861168-3-richard.henderson@linaro.org>
In-Reply-To: <20230228003713.861168-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 12:36:43 +0000
Message-ID: <CAFEAcA__Pz+jPZYzVQttxD9bcZD6yiVJM9zyw0oZbW7jSyGC0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Dump ZA[] when active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Feb 2023 at 00:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always print each matrix row whole, one per line, so that we
> get the entire matrix in the proper shape.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

