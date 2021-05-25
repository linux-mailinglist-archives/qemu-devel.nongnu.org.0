Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76638FE4A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:56:53 +0200 (CEST)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llTnv-0001IX-KS
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llTmj-0000IJ-Pq
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:55:37 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llTmd-0006O4-Mj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:55:37 -0400
Received: by mail-ej1-x62c.google.com with SMTP id k14so42916839eji.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zBIvJelCxc1zqHgTlz8reE62AZLhuvB/hLq0T4rOa3g=;
 b=Chw3u3z0XW6/CpLAUw09pRKLw9onI/lWxV5KxqY6kTf1T90MapUue4CUismvQeMKGd
 zyxZmQCHw7DYmSAUUuDYnwtvKknxRfbz4Z+oNKdA0iT76nEZGqHHxiLtBRVvnfcdDpRV
 FTZ2Ijviv9gVBlUgs4WNaTfeaaTeaJTr0w4YqippkFPnLdrFph4EPeBnOtwILPW5wzfw
 2ptZk97CchS+KOq5kQjM8xDsearzss7O6l5/5yG1t1sASHUKSlec33O90j7o9m/oIFw8
 3OucFVX+oOmtjRg13amF1LQzeZeK0huVR/c5ticzL3QFt4KjUS2kAwe5jHyiLcVwa5KA
 qjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zBIvJelCxc1zqHgTlz8reE62AZLhuvB/hLq0T4rOa3g=;
 b=OlAhPDU4IvJjTr3uVfHyqDtm5dIU3wQ/iXCekwOHjaUyetvgxhvsUhPjv/u4GFnbQj
 +9UZSyIm01rCFgbA+Yd9DgRj2du6/OJ7wXjF0gc1Ct3IDwENWk0Z/OmPGJhaYPch0+Iy
 nq+3Jp78uHCWcr1K99yY6HZ06S8t56c/3L++2/33cl8qZl9MfPUpZLpazeOp26exz39a
 rn+QQg0bSK0sVCgZmsEiZfz4vxpBpITOhzV5VYSlFA1iYzjr9Si1JpxSkT+A+IOpc0vx
 a5ZsTM3Z0gftEEn0wZ7ts70r3RqW3MpWs78VAfjuevIuMmPlgzHLdGBWVbh+sMqk7ypN
 WF3Q==
X-Gm-Message-State: AOAM532MRl9Bp1/1DEubqoIeg6Udszpn9r5G67h4SQa+krmnlvHCnL9w
 ACfU5YkuUbPxaTNYooLFGElj93BLyBBVf7EP6iuKBg==
X-Google-Smtp-Source: ABdhPJxf8hplw5CPyzJM1yZfM1AhMViOPFtwGNTplk6MAyh6PoVgh1KuFMw0P4JoFFb97/THWRmQj84eeoaxkHgJmgM=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr28022374ejb.56.1621936528740; 
 Tue, 25 May 2021 02:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <CAAdtpL6u_5AF=H7XaRwfWThTVxM3YvUjUktbmmEenbUL=r2nBQ@mail.gmail.com>
 <820e64bb-8ba1-d56f-d42a-458940600ac7@amsat.org>
In-Reply-To: <820e64bb-8ba1-d56f-d42a-458940600ac7@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 10:55:05 +0100
Message-ID: <CAFEAcA9m1fYkLYg-bLK7Vg_35ahwH-zLup=wThGo8biuRF12jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] accel/tcg: Add tlb_flush interface for a range of
 pages
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 08:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> ping?

I talked to RTH about this yesterday; I actually have it in
my target-arm queue and reviewed. I'm just waiting for Richard
to supply some commit messages to fill in the bits you left
as placeholders/blank...

thanks
-- PMM

