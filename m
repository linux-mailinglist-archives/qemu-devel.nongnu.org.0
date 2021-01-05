Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E532EAFEC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:22:09 +0100 (CET)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp61-0004LF-0I
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwp2L-0001fp-Rw
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:18:21 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwp2I-00075e-4b
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:18:21 -0500
Received: by mail-ej1-x62c.google.com with SMTP id 6so713205ejz.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 08:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiOEvq0bJTKLSgtaPHvTS+7cbZtbwHj959Ikn51G0Fg=;
 b=IktXRGqOfVBBCYDpFLvtAdBotOLAZ0s31rWIzQnloxEIQaUoxcnedAjVnhaXd4O3rv
 f9eob/U0zEfPunxyze4QqbiZIsl4NgxpxwRxIDlxbPk/FhN4zYWK7MZmT6OKoFV/6VAR
 xf7aZYiCVGds7wu6UxBYRdRmqBAl0URma+xov1UBQNfkfOX4PwPcusJcGA0TPNiBLguf
 lcLpvvCbEDJQimz0dVvO2PX1tczNbzFBg89L3EERLhfqbzrA4WEoZFJ6a2O0uJVq1V/C
 v2VvS4jsWnFlt8drAXGMF5LH3eVFCLGUy4SJUJiabU2HwNkpwMB1b163zydp/0KyyhrD
 TZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiOEvq0bJTKLSgtaPHvTS+7cbZtbwHj959Ikn51G0Fg=;
 b=fNva4w1/bXyEy+6uFTrvmCNSKdqr+uDNxzNG4nUDKxqTLgODoaXwPgOe+wOW3qn6Sz
 S8jeXrOYcA9D57Abahhl8qcT+E+CSHbnAIA4ZeftlJcRrz4iCV0W789zcxrh2vZ6r971
 HqDWOb+MYZ0ZWmEnknH3hizbmGpg0/WZThANNXRsTrdBHNMdzmQA9hwl/386Tj0LkHbg
 DZhhYNyM/6yuyKWNIi6ReL3GOPYmZ94IYodXoS/HGQgudXh/Tv45AT3Ynq2HV8/v8aJD
 7w4d/1+UvG3F37OOdk196T1ze/a3Hm7msZw9ujGD+rGh5N9keGMZ7dZZDnSDIA2uYaqe
 MyYQ==
X-Gm-Message-State: AOAM531IeZpSKCZKt9KBJZvE7u8DrUPd0bw2Xzze6gRcNf+XbjDOn1vt
 lcVhpK4lkm/zoR0eSU/ZUhJKjsvHauLbL9IN5BUrOg==
X-Google-Smtp-Source: ABdhPJwJq0M8igDHldg3CanqG/L3Y9SqrrUxv4QsZg4fKea5XkrtOpC/6aEeTYTLGJeHLoy8/PESjfBocpn4BGYVKXM=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr69131505ejb.382.1609863496421; 
 Tue, 05 Jan 2021 08:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20210104143154.462212-1-stefanha@redhat.com>
In-Reply-To: <20210104143154.462212-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 16:18:05 +0000
Message-ID: <CAFEAcA-CA0_y7fo=agFA1tgeBubTydoAVHhTiChRC26uU8cRzg@mail.gmail.com>
Subject: Re: [PULL 0/5] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 14:32, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 41192db338588051f21501abc13743e62b0a5605:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-01-01 22:57:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to 7fb48c0ee1bbf5cc4c905e900b054096250e9f39:
>
>   tracetool: show trace-events filename/lineno in fmt string errors (2021-01-04 14:24:58 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> Show trace-events filename/lineno in fmt string errors and send -d trace:help
> output to stdout for consistency.
>
> ----------------------------------------------------------------
>
> Doug Evans (1):
>   trace: Send "-d trace:help" output to stdout
>
> Stefan Hajnoczi (4):
>   tracetool: add output filename command-line argument
>   tracetool: add out_lineno and out_next_lineno to out()
>   tracetool: add input filename and line number to Event
>   tracetool: show trace-events filename/lineno in fmt string errors


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

