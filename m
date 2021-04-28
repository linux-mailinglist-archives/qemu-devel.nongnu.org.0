Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594536DF08
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:39:48 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbp6A-0008Oq-N2
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbp4W-0007y4-Nw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:38:04 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbp4T-0006F9-65
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:38:04 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a4so2742165ejk.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hspDl4ilYQJm3YCqVfH3poxeWbfP/IepHQxmNhzct50=;
 b=REPk1zFc35K+dcaxwOa9seK+8Gw+dPVsyuFfaHicNbemTjD0bUzTiFDHqD6lrUG0hk
 4oqUrg8stHvjS1uMikJtAXbuIgOoVQ2y8kx/czQnApA1x16xm+dgIMGFFNmp3/0dSnKH
 i3u0Gmpb96Ql5M4V4iO6AdIk1o8dZPbqBFL4mAk7Ndg5ELteIfKfORidlSy6tm1Ip+WT
 BzmL1Vf+o2vQerbRzLG87JsKdlRbn+mnrU6ZVQhRxsqiEiSZXhOyA2NvsoQoZ0kMQcan
 BHQ6PnxMtlITyOwkGZlegGBmvhs3K556wxK76E6iAoNnnFjyqAZCkEy+a85QxrgV0pW3
 x+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hspDl4ilYQJm3YCqVfH3poxeWbfP/IepHQxmNhzct50=;
 b=pnqW7aytMoOxAutOUVG2oRR1LUBFWzAqQweo33XgxxCZnUpwP8i45X2oGAFepT52ha
 Awk3yWSvtdzK9wOj1CXkXiic0CvISjrOOEgmpJfJIcDU66UmvfwuEfF83urwRvWIknSw
 Oar9bxg85vdbC4JHWqutFLpekmYuC6Ar+M7TyGF8ZoxNS3o8qaTNPgrdSVX4vh78JjP5
 aNhtenXaBj1VMhsvMDf9rbpyR5+6mD6BOoI1aVpM9GZP/O2Nsz4T32uk34ZVLwmg2MrZ
 sXhgANJf60FzEsISkEQ1J7f5k08xaZcOtVAvDClf5XYzLXA/LUxZbY8348v1NttGZxeZ
 vixg==
X-Gm-Message-State: AOAM530pA5TsGoubAeRO363cFu913WeI91E8HfOcWm3zz4ZM8gEhKWly
 ZZyPMqiYEduW80PnMu6fR/k2i+NPsqI9wlxqPnURYQ==
X-Google-Smtp-Source: ABdhPJxYCssNoY/W9qd81xwCI/dSibQ0ARGDwg34HLwY3Sl8mavOdjf80VcjiOpsn4zuCgNnk1Ass3TZ+cal4rYfAxw=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr9418245ejb.250.1619635079339; 
 Wed, 28 Apr 2021 11:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-2-philmd@redhat.com>
 <15dbfc38-f0ba-65f1-382c-3ce5b961f108@linaro.org>
 <e2f18183-2b7d-f7c1-b1a2-e624950c7627@redhat.com>
In-Reply-To: <e2f18183-2b7d-f7c1-b1a2-e624950c7627@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Apr 2021 19:36:59 +0100
Message-ID: <CAFEAcA9L5R3RfbcJx+D3LMTWmT6+_-0kB9sAEm-GcmcBzKmzAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if
 virtiofsd is enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 at 19:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> On 4/28/21 6:34 PM, Richard Henderson wrote:
> > I think the test should have been
> >
> >   if (have_system or have_tools) and
>
> Yes but virtiofsd is not a tool... It is a standalone binary.

This is not a distinction that our build/configure system
currently makes. We have three categories:
 * user-mode emulator binaries
 * system-mode emulator binaries
 * tools

where essentially a "tool" is "any binary we build that isn't
a QEMU binary proper".

If virtiofsd is genuinely not related to QEMU at all, what is
it doing in our source tree ?

thanks
-- PMM

