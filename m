Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE8A539060
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:13:01 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0k8-00084w-Vw
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0d4-0004WF-VI
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:05:45 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0d3-00026Y-Ed
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:05:42 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-30c143c41e5so79125857b3.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyMZY4+dOuamsYWiMlhHPYG9/sj8ofJWPISXtoYjxRY=;
 b=e205qI4+7lzSfMC8Iyn+/FIPW0Bz9892YBqopPk+J4/3BRn5m3nVhAFTCwx5CRHkOx
 dfDBfS8jYps4RcW8/Jzj4Hd0a1pWD3O9vgJVe1nsdOv3+y3iu3i2eoGL4k+zdjXVv056
 kceKwGnOClpyq/NhWHvU6AnZJLu5T+t+5lN8hPFJll0p2ZfBqWNszeL9qbG3oHSHbQg0
 rJyTHUb9xJK4MreFPNdIn6KffqCYZ1RPtI6DeLCWKa037G86r4iApDWJjqkfqWQ+ylN0
 IO/hvok0VRa+Xpce3W8P9wk/asQ8Cb/JH/8cTxoMalrYZXanVpJ81QGU+GfCHbIFxsNz
 aPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyMZY4+dOuamsYWiMlhHPYG9/sj8ofJWPISXtoYjxRY=;
 b=v7PU3y9O5W7gp1wh1/NBPRIXEsIBYvHjmoyiuJkoF+4oDdAJEKcVRn668rFClmL3xa
 J83JgSoWUzPgu291E0PqDLme4pwgrm+Z7ESKCVTMSd/j0TN0v+nVgmnfeEHHtKdSsuW7
 ljmNqvIk3rAFhNpC6wQ8PRSQzrOJoT70HH7/dj+U/pi8Haa79eNXpzV/lU9O/wF6VY31
 n2kQdL6zhaXjuQsc1U9OiyKhNPwu5H24t9i31KXrF/YtAuUnyrqPE2tSHBCQMvrP5fJV
 +m06p0mU0dv6KW6k09Dv5N3+jlCJ4fP0AUCKveI2Q7DWCVxHZt1qsDbUH5is8735ntde
 0bwg==
X-Gm-Message-State: AOAM5330Q4wOnfHEyXMmX4z3z8PpyQWgJt2ioQr3+6kveG6z1hJ0z8w8
 XKpJrsLdPZwlGd4FlK14/6PIsvcUkt8fHB51D1gMaw==
X-Google-Smtp-Source: ABdhPJy51G42fz3hDrykjetyjwRf+VtBHNt4pvBX4eKGTcHixKs+2vj/n8ckpUyebrXlcyRY091qRyTieIZfbTYtcWo=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr19638727ywd.469.1653998740414; Tue, 31
 May 2022 05:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-9-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:05:29 +0100
Message-ID: <CAFEAcA88bS+rG+KnqKw23eD9D6xm3d=g4Aw9HCWzV_nrfWNhNw@mail.gmail.com>
Subject: Re: [PATCH 08/18] target/arm: Use is_a64 in
 arm_generate_debug_exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 23 May 2022 at 21:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the accessor rather than the raw structure member.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

