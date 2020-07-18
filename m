Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03522224A51
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jul 2020 11:31:33 +0200 (CEST)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwjBr-0005Cm-HW
	for lists+qemu-devel@lfdr.de; Sat, 18 Jul 2020 05:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwjAq-0004gi-Bm
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 05:30:28 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwjAn-0007zP-M6
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 05:30:28 -0400
Received: by mail-ot1-x332.google.com with SMTP id e90so8669459ote.1
 for <qemu-devel@nongnu.org>; Sat, 18 Jul 2020 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sUcEXwI2+atRClXFkEGkDgaUwA6gk8T8ioGojvNblcc=;
 b=cK3jB+LKLQkc4PfQxW07UOtCOWZHXmzKZge8rJnRZDYluD9byVko+KGWJxUlhZabVe
 Ojv8L4ZCo1WeizLBBM7Ebl7qwdHuBd27J55ggiucqZhX6tTw1j9p8S37w1Pv1bAR7heY
 uS7A0t14WgvhkQfSaESHE0tP/KW+FpVJMQOUfIQ3U4ToDezwEBqcc1+a6nV8jNnU0SC5
 XvWZXwaK5tFJfQmndbywODFzlnhUHScc71q8TPhqwG/N+nRoxUemx/f18BzglOkGfhQ4
 x2CzMDJCxewfzvE7/uk8YPRLt8MC5SZjCb5y9yZw6vVHDo3Zd5QhXKsq13X/L4ZF4K5r
 b9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sUcEXwI2+atRClXFkEGkDgaUwA6gk8T8ioGojvNblcc=;
 b=X3exEDqHfhvgprbzC1ryehR8TMcHq/DFHfcUnfX+IXcf+P/StTMpY2d+7v+WFbzBUD
 wyUV7eUgx7RNQ9hvAZPkXAXpvcGGWKAd/dAXzc280dRXdPuDVLA8fD6fMXYww0cj+khD
 9IHF6PmthYxx/DYkAndyXpIddKDxqp8dBnnbxxi/hOdoHWUKZdbNB69MW1zsCXw+nWBq
 hooM8a4wsreYhQHLNjzzWulGjKltD75z64dfIiSM+310HEtbpzJQdyYV1bQ8WSSigb4y
 7d3NQ/5XHzP+agx3It+S2hOSYnSDptW2pglMqe7T5IjwzzFAGLOz2MvNaCtxC12KPR6c
 MUXA==
X-Gm-Message-State: AOAM532mterXX5Uzau29oZLylvIsVHkhXUk3QfJy5NeAbrxOx60UJO7Z
 gZwmFa/y5XIQBGrAykTh1qaL97U8+GuXiQF2dlIV+A==
X-Google-Smtp-Source: ABdhPJwJQFfJjP24CH87StOrHBO2huPO7fi42obN2NYxYRWHAKYE2FsD6dS8X/1VCO1WyaRe/XX11FOJ5K+Z7/eOeyo=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr12015318ota.91.1595064624271; 
 Sat, 18 Jul 2020 02:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8iKKDKEdq8TtbZNwqfsH=ZO78eEXWfrVbYTDjdy9DYDw@mail.gmail.com>
 <890eb42e-cd77-2a63-c441-61637ac5094f@redhat.com>
 <42c71a79-4911-dc47-d983-783d98e819c5@redhat.com>
 <89f309c2-9909-f306-2f2b-93fc1b8adc17@redhat.com>
In-Reply-To: <89f309c2-9909-f306-2f2b-93fc1b8adc17@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2020 10:30:13 +0100
Message-ID: <CAFEAcA8k50qCcxwp99fF2xOL13jP1unNMbVFEYXy119u00wJcg@mail.gmail.com>
Subject: Re: tests/vm infrastructure fails to notice that QEMU dying is a
 failure
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jul 2020 at 23:24, John Snow <jsnow@redhat.com> wrote:
> - The real problem, though: Why is QEMU hanging? It might need a longer
> timeout, or it might be having problems with the console socket again.

The host machine seemed to be under really heavy I/O load at the time.

thanks
-- PMM

