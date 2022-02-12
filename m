Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E91C4B3625
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 16:59:29 +0100 (CET)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIuo4-0002P2-5f
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 10:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIulx-0001GM-V7
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:57:17 -0500
Received: from [2a00:1450:4864:20::32d] (port=43765
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIulw-000854-28
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:57:17 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso5055794wmj.2
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t1LWITgrvs85fgPYirZp9xebI6hwkvRq7J6ySJXpOig=;
 b=g302h8PrW4Wcq6pvg54iZqLBmDdi4YxJVRVIxkmuqZ8gCmQZSdYDtrpzRzMC8UvWsJ
 vgL7SF2z4q5t0pngsGQq87cppWy1qRkQgqDA4Cupp8c0CMOoExNnoRkKtJ+WbtAk4Gog
 LE0sMgKIEOIC8FVDnxVqLmEHu49Xuj+JQRFM762FxlyWpJ7AdQwv+c8Ue1R7XLiVtnrt
 e95FY4FtEJNNLKPCyEmD2y/oQA6Jg18ScBwAhJ8aD1SrCxv9i8bOcvZokAS1ARVgoEPS
 IZp5XMYoJRLZrzeGr0aFdKQB62HBgqYy1WNj+cJx3jshqL8Qitsl4TTUM5PvH5dmJDgC
 8FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t1LWITgrvs85fgPYirZp9xebI6hwkvRq7J6ySJXpOig=;
 b=S9goV62WWg3+NBHotVXZBe1R0hWjbJPjjnn46iayB+P+FfP4rhOLTVRgnQ9T+hYVXS
 v8eM8stsOK/a5tpAIBWuUDNNP8f7mqEC49s30vMzqc+xOoFIH/J/2efOdw150CWyb3pY
 KSoa9LZQ00npttVSE3TFHvxJZ2Af2XPOnO+N8CiK16PFLaG8sDA6dX3lewzNn9KQRJEC
 UcqJz6qnz8Fc7gSDOfz2SPTIMkCyghQ25uQVu2tlSQRLPbrHIEiybv9CGq68uFrP+bvc
 3j4wCz+4Qaw29/6L054yThMDT5SB8tThMP3YMRgRO4J8WdZsmghMFzX1SH5ikAcXMInt
 l8Ww==
X-Gm-Message-State: AOAM5337abgOxI0PVId+roZ5f7C1VBY39/1erlr+dUURX+ebDrzGGwSb
 LMOTQExsr3YYk+S0VB9QePkHBVXUbnKnkKrXUhRZxg==
X-Google-Smtp-Source: ABdhPJxxWwW7APq7RdMr+AtBeZLjSok6T/9iIhZrNlRrVEt6NEG/BoPKCC8XrzP+79RrcC2JfP3MbjvJZTMbB6w5TfU=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr4625001wmq.21.1644681433573; 
 Sat, 12 Feb 2022 07:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
 <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
 <878ruhedv0.fsf@linaro.org> <a45108c0-c5ed-3d98-77d2-c8b9c5c26be8@amsat.org>
In-Reply-To: <a45108c0-c5ed-3d98-77d2-c8b9c5c26be8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Feb 2022 15:57:02 +0000
Message-ID: <CAFEAcA_y1RLqzip15b1tFzYsSJ_2AvZjwxavJC=LAqn+vM+7dA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, Andrew Strauss <astrauss11@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Feb 2022 at 16:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> For user-mode, this patch makes sense. For system-mode it is
> not obvious to make sense of SYS_HEAPINFO (except focusing in
> cores targeting embedded systems eventually).

The main user of semihosting in system mode is standalone
binaries compiled with the gnu toolchain using a newlib
that targets semihosting. These generally use SYS_HEAPINFO
on startup to find out where to put the stack etc, rather
than hardwiring it in the linker map. This applies to both
M-profile and A-profile.

-- PMM

