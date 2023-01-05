Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD965F264
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTos-0000t6-HW; Thu, 05 Jan 2023 12:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTop-0000oy-By
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:14:19 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTon-0000Kt-SR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:14:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v23so40525481pju.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdilCHwS46w19fmxCIAcVhRc5zHuDqK7E2UCzfqV8Hg=;
 b=irX8N6MdqXzRl4MD3LFHdybZlXIkSZEJykupSXOHY+MfVOaz61tAgGnEISd+9Xhr7j
 o7Yn35nn2gevRxYK9X1RnCW21PG2JIgP7GQ3DIIK8sv5FzF9H6zE2WQEUldc3kbRBc3Y
 IP5lqjLzr2fI4FO6uY80lokIjaN0My9Xjn9x/WlBv65QnKTFMnLlWSwv1hKBZxYaryFJ
 6rTx0WeFDsApY+RuKECt7RSsdabN2HkDWQxNiruazbZRNZNwJae9nzyFtX+iYq72gr64
 4b/iVQycVT5Uj7Z7yYVFVVRFmove+4DXKrQ89g3URSZGlBVu0Lj576AgqhOvRW+ovZ9j
 oyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdilCHwS46w19fmxCIAcVhRc5zHuDqK7E2UCzfqV8Hg=;
 b=14CAf89+0LrrI8CYo2W7bR/i1GAYCSPaZZleItJU6mN6lUrkDlpdZmuZaDzVH8K0WC
 Ub9YQ54ciWZFuXDb5hNbERPKdNJO3Z8e2o5za7jXVueeDwMXyux/BN8hHD1DaukdI071
 ku0Dur/DSqGm224FJ5d9SoxttuCJIIrmbyiLCT4eyES2wHxHpUDIfh9VObV9G2wBOv/7
 ZLPo2DbcK4NsZjhTfQxqVnnQ84DxSq4zIx1JTcbrx9QuCFSd3c22qeFkB0W55m9GBDyS
 qjZUkvsvllu4Gq6O/t8UQQNM3uh/NhXUW/iIsJLCQ9J4VpzxtphA7gO4KR9ZlsJfvp5P
 2Zjg==
X-Gm-Message-State: AFqh2kq5kWzGwZ1ttr9VApgJz1D7I4Es7f3KHOUZtXg6tyNky2/uDkE0
 OUgb+c53KsL4vuJ8ZzsnTkHe9rtDMKc2xqLtP2OKWQ==
X-Google-Smtp-Source: AMrXdXv/plYW/uw+qszi23rLe/AERu55xAzij42c96ZnLPMPXqNqzfL4j8l6j/aVuyzAQGjOunxNSAVoshypP5o3L4o=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3505456plb.168.1672938855962; Thu, 05
 Jan 2023 09:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20230105110007.1977399-1-alex.bennee@linaro.org>
In-Reply-To: <20230105110007.1977399-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 17:14:04 +0000
Message-ID: <CAFEAcA987Q7LQZkxB67XyayE2cwfyv5ZproLrNEa0xyOLsopUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Some tweaks for semihosting-tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 5 Jan 2023 at 11:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Hi Peter,
>
> I discovered that semihosting syscall support got broken and while
> preparing to bisect I ran into a few warts.
>
>  Alex Benn=C3=A9e (4):
>        semihosting-tests: add timeout support
>        Makefile: drop microbit.lds from the sources
>        Makefile: simplify path to QEMU binaries
>        Makefile: explicitly disable -net for our -M virt runs
>
> Alex Benn=C3=A9e (4):
>   semihosting-tests: add timeout support
>   Makefile: drop microbit.lds from the sources
>   Makefile: simplify path to QEMU binaries
>   Makefile: explicitly disable -net for our -M virt runs

Thanks, applied to the semihosting-tests repo. I also threw in
a patch adding a "make clean" target, since we turned out to be
missing one.

-- PMM

