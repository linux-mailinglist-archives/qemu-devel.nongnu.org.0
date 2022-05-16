Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4075288AF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:23:57 +0200 (CEST)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcZg-0004xL-QI
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcDa-0001NS-Pa
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:01:10 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:36868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcDP-0001uk-V9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:01:06 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f16645872fso156191407b3.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KlLIF8r1YVfZ4JXgpPsihuRIxIYsldy5yTw37PnwsI=;
 b=mpy/xvUUH1bZG1XrmzOZg1MeBho48+MmWbtsNp5aYi7wxIVam+4Z8gc3ZAO0KST4fD
 hraLqReeJR3aDeZGQh409GcnpoAxp8UdoOVbYikoQP3HR30SF7pIAMN1Ranlcv8+YYhL
 B3k+ihSfi2X63CzbuC5dERaSd66cYNRzjLewIwxfchWhuROUXe25GekWAeMwRKlYUs3M
 WZ0EEBDqt3xmwztJq7xOlPT0I2Nd+ByVAOTIYJ5C2yfSqFa1atsoTLBznIq6a+ICz0Nr
 bYtO5DuMqOditfRpV+0to7R3UzctGoMrwMEkWDlm2+jBb6HI2anCcO52HbweFVgmE0Yx
 Fd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KlLIF8r1YVfZ4JXgpPsihuRIxIYsldy5yTw37PnwsI=;
 b=odgnkz04qHSvtaa095a1gL3yOI3gwu+Qr2nb8pSGjN77N8svrdlPGHvjSHiifGCaJ2
 3UDC+RmUaaAL6ntUg/sWYw8GMIw1n0YcA+KM9dCzCjDsj4d0XjU0qZ+Fns4M4Pmj0sjk
 HE1Wg1tVFhJnBDId0ohdWtMLFOKCYH9nSVGr9FAvKOgHHhUJDssptexbdMb4/hUEhkEU
 0VoDRqv+ljBZBhvFkXqlfbQDKbEaealUsolipuS02RAw2SPFqNQ2BPKM/W9mcPMuNgd0
 5TFwO9fWmiWq0HxDbbjEzD2MEUHOGgh8avp8xs5pwCtx0Jpm+xYrh5X1SxzAOn6HeO7z
 RtIQ==
X-Gm-Message-State: AOAM5321UUKLpHTnR2bvgyX51zV4KjW3T7hPh9j2tuD/eBhVSitXye4v
 3YZwNZAJrH0VAqYIwC7gHtYhEPc09Zo3TnLGAOBtyqlgFds=
X-Google-Smtp-Source: ABdhPJyMfZXP0tAmJt6Iq+bHKpVLC+YBaNmMXqyHM5SZaM28GW5iSnN/HvMjMSQFlzASDStjcYKPIhWsX51kjRAnhSs=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr17791365ywd.469.1652713251454; Mon, 16
 May 2022 08:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-4-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:00:40 +0100
Message-ID: <CAFEAcA-5NRUewQ2HvpbVn_sV_3N95j-4iZ9YtoohYE0Lii+UKg@mail.gmail.com>
Subject: Re: [PATCH v2 03/74] semihosting: Improve condition for config.c and
 console.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 3 May 2022 at 20:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While CONFIG_SEMIHOSTING is currently only set for softmmu,
> this will not continue to be true.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

