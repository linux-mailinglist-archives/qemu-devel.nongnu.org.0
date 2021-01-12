Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0532B2F2D63
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:06:22 +0100 (CET)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHVF-0006qk-0h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGwe-0001aL-5U
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:30:37 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGwa-0006lf-W5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:30:35 -0500
Received: by mail-ed1-x534.google.com with SMTP id i24so1702825edj.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 02:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRzZHESJBoZj8JikmuXVlwawLJTG5m5xuIkY3RzxGoY=;
 b=eJagsblTXa/cV0jXe+QDusV/Egr5+mPBZX0HlPeXu7Wg0+ok2TTNH73FsnmXOrkqD7
 PKNOP++FyDAhWyOj4I52yN/0XnowgLEgQ7/YfrYgmicGKeKI835ZvlAJVlX8xBlRqN7f
 S0MpeMQ+GfrhuH4Fnc7ekWtkRpKk3Bb4y51v2R2qF/Pgn7synVlhh94PpXL1pa/gN2Le
 TIcIEn3GPMflv96G7tbvhOjBGckZddxl8kwoCRDx5xOG9t20RIVOuiIi8yOJDfcyY/yM
 SbbTyvmwY2dUoO0XeEUZh5R2XMNVtVIKQajEqY7cGvwP/qt6AymKvzQwC/9ZD/TpzGqu
 sUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRzZHESJBoZj8JikmuXVlwawLJTG5m5xuIkY3RzxGoY=;
 b=i7vSORVWY11C9ScfSx1U9krHC8BmkrlMCysk94UFFl6cb6spiBwFOz+XDi0p0rVOf7
 T+o5CJyfFI22HrJExBoNOc6gwd/HTERG3OhXpFo0VxR4DTKqWuxJ6Mo78aVLpTcoD3/i
 auO7qN+gemjqKxlI0NYFWyuVRF2HoZc3inyJCs3toUvHrCUGaQMt/Ium0+w1i5M9xxRN
 bVR+z7y6gS+ZoRjfz0YgFs7FkJHDV0mIuSrQHW1lt4OoLQrwM4I6VHgnkZmvlv27SntY
 RLejN/wNXyU7AW4rI1GXkSudZBeJp/10HSeeTmnZCYzSguxipZfS/IdO9LQ8OU9/IsqI
 v2xg==
X-Gm-Message-State: AOAM531R6AuPdv160MlJ4PimJ/Oh5oq19rfoqL/HHGTjO2vzSlk8a2Dq
 Z8MPEPhjK0NyRMnBI8ic+95FdH1N2KhvCKMowPjwl104Slo=
X-Google-Smtp-Source: ABdhPJwUF9bW6agsxNXvxXDswzzuzrOhzKLJIbO6Gq6RSeTklHnQRvU0Z0W3YWmXXUeampDk34kCFnvhrXO0L4MACL8=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2771705edr.251.1610447430667; 
 Tue, 12 Jan 2021 02:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20210108161416.21129-1-peter.maydell@linaro.org>
In-Reply-To: <20210108161416.21129-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:30:19 +0000
Message-ID: <CAFEAcA8cokqj1jpjAi+2DitYaf0bJrFS+mTWG8qq+HysWhpD+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Build all docs in a single manual
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 16:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Changes from v1 up top since they're minor:
>  * rebase to account for two new manpages
>  * patch 1 fixes the accidental omission of one of the
>    new manpages from the meson.build list
>  * patch 2 has been reviewed already

I'm applying this to target-arm.next so we can get it into
master before somebody adds another manpage :-)

-- PMM

