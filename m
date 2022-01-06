Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F54862F4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:31:13 +0100 (CET)
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Q36-0002qZ-08
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:31:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Pzv-00084q-V3
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:28:00 -0500
Received: from [2a00:1450:4864:20::432] (port=46945
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Pzt-0001Tt-OK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:27:54 -0500
Received: by mail-wr1-x432.google.com with SMTP id i22so3784833wrb.13
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 02:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7TFE6r6ex+XFQhIq3/ScCBEbuKclp5BFPpqSR1CJP4U=;
 b=xYJ0qB9OAH1UUvck7Z78qsJUI8uJJC+OLlb+ZDPJwvfxUNuqGTsIrZ7OJpIyQXpUXI
 HArtahn7h3fESJyb7+uqBeADFNLzpz6owREQVx+kZ/Ay7zQ9QLaNpUmCeQd5huTixmQa
 Up+uxM1upqyXnBqwETj2uEB7dDdeYNRswX6YKTF6htbzMNH8JK30/rSRvemLzm99hX4U
 U9FKtexOSEQx3x0ZBjR+8bWm1PFl35mUP6PNZdMIYlzzorlEGQw/dtr/mRvYy81OUNcE
 kkT8nIx6c+rRgNj+/PBzyKhutNyWg2LTxKCubF3mnSpPWyV4buOP1wxIgU/0mHZCmef0
 Ek7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7TFE6r6ex+XFQhIq3/ScCBEbuKclp5BFPpqSR1CJP4U=;
 b=UGE3POB14O02Kxw3GjxboM6p9vzxzWsoWrgsij59oC5Wnus5TCaa4fUCaeNYS6hUaX
 CLLBraqRTsMJIlI3O6YnkOsg/YchE5bIgZfF/vuK3h1K7zsCCIWqpUerV1pm3x17ycu2
 1ehFnkhZhJDv54jNO43TuFvd7rzbVCbmiXtDAErH90he3wJQjYHB+A/azXZuuC5YPXk+
 GC7QPadtTlT0dVOKbZYMya0bV2I7RIJVjj4741lctgV7aPE4qTnZWD2hCipmHpFnnxKO
 4eNfe9TOse9WbScPV1Tmhds/+c6HTTaTzLB/69jhQlqZsbt3IHo25iNGbveL1pk3qVnv
 8K1Q==
X-Gm-Message-State: AOAM533WNl6mGmzvYPe4K19WVeIFvXh51VbfFvapJcFhYxE16w9Q/Mz8
 o80AYYMnmxJR9Gpm+He1InKpgSukKm096pJWc1lKHw==
X-Google-Smtp-Source: ABdhPJyP8uoCImRNImIiYTJfj2f6XwS67iB0BvcRQE82COkzOPVPLcHQgMLPU1XVQdOmP7T7lhjyjlFvhfNYFgsKkBU=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr28734669wrv.521.1641464871531; 
 Thu, 06 Jan 2022 02:27:51 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT2fC_bTkoNd=21MrdoC1hKk_jejDBdc8KiNvr86aOyAwA@mail.gmail.com>
 <0f468714-96bd-1e5a-0e40-b7fd5f920964@redhat.com>
 <CAP4GjT0a+eROFs6w1X=WTLsGkVsaTO2QC6f4wq96X386xpNW0g@mail.gmail.com>
 <CAP4GjT2LryD0fUSwCygxwGK3Z5u_yvacm5kKqRWtDGbZEmLbCg@mail.gmail.com>
 <CAP4GjT2ZK0Yc3did19XOr+V89poyemNV-bKh2g=8e4cCJ0qbHA@mail.gmail.com>
In-Reply-To: <CAP4GjT2ZK0Yc3did19XOr+V89poyemNV-bKh2g=8e4cCJ0qbHA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 10:27:40 +0000
Message-ID: <CAFEAcA_rO9WbV77F1fXZONfRi8wiqudw_t+jo5CjhwaHJMvwsA@mail.gmail.com>
Subject: Re: QOM
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Dec 2021 at 16:23, abhijeet inamdar
<abhijeetinamdar3005@gmail.com> wrote:
> How did we decide the NUM_IRQ_LINES 64 for stellaris?

Either:
(a) we looked at the documentation for the hardware, which told us
that this SoC is built with its Cortex-M core configured with
that many interrupt lines

Or:
(b) this is for legacy reasons a bogus setting which happens to
work because it's too big rather than too small

For a new SoC, you need to follow course (a), ie look at what
the hardware is and model that.

-- PMM

