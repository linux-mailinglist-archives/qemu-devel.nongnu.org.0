Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC6474CC9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 21:51:43 +0100 (CET)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxElx-0005y7-Q7
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 15:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxEk8-0004jp-OA
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:49:48 -0500
Received: from [2a00:1450:4864:20::335] (port=37834
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxEk6-0007HF-AA
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:49:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso17145047wms.2
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 12:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V86Ak97w0iT+USHouUHOgA0bANbWTGGMZfJKgNy9qrE=;
 b=yIR6f9igDP9bi5b4FaJqEqflhWZZ3CnI+uIttaM9h4upgf/maqomlhAF8Z7J/EUAc+
 ad2f0uorfbKsbf58P4hQQIXSDLfBFf1SPuqfH06nGPKqqQwvmdeG+uo6YHandQiNl8zF
 iX+N7h6seKLd46U4Ir/ySmTmQrQ96HavEZt1hOrGKVAVkLMmqMS9QhTPjTTfIRgmVVV6
 lrYcb0xHcMiwmbwPA4FnvhZu+rkeoftX+GOq83MG58PvH/GITnox7LJqtNI3g8JHfPhV
 o6jYQuHBszTNo29GdEqMejO93ZeIBXkCND5RcfvjDHFy6lz9rzAX7lH9rYk84hy7ePIh
 Zibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V86Ak97w0iT+USHouUHOgA0bANbWTGGMZfJKgNy9qrE=;
 b=xNvtcv+TCC80pJnNsvv7E7/iY69bfTiM/OiF0r1P2FUMw4IXg2cVTGE0pc7ky4LvCO
 RY2ZXpC4DO42stGbjc5qs0+q3I9wSYkgtPccem8IecX6UbA458H6lqJ31gmBxZv55BTO
 o1hcD67PFvyi1uCb94hEnJOoJFGogjZK0j+Ni39yvGAHvvyH9oHwt5SEI/KmxE53kZcb
 c9Vm/LPwq8bmrCSmAD5ckGPOLrZFibOECAf58otkLifStTFr3ns9qdYaeo4pxYIookSz
 HDTR4JEfy+Nv15opjfog85GETj0pC9gq/qqAwtQZ0Od0YYknIBz8/9F8mpEgx4OdFWst
 +2Iw==
X-Gm-Message-State: AOAM532Sv8G7W5q23hVo/fBH9EEwr1C03NMNZnNOwLiWLJBbRQOqvqli
 Wd3JlXR/jI8/PlO70u5+REfrEH+BJ7xNzE4+744tcg==
X-Google-Smtp-Source: ABdhPJzLy48CTJS1KD+FcmDOvHxwZzYpb1/WoAchdqCUidJEdtc2yUjHJdZ+JNTq+jCvM6jTCrdI+3h2WAbmC9tEOyk=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr1593584wmd.133.1639514984329; 
 Tue, 14 Dec 2021 12:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-29-git@xen0n.name>
 <fce709e8-f122-f410-0c62-4d14f46ed999@linaro.org>
In-Reply-To: <fce709e8-f122-f410-0c62-4d14f46ed999@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Dec 2021 20:49:33 +0000
Message-ID: <CAFEAcA8ayDTVRjuJ9cWjt6ca==N0k39e4nN4ON0n1c6ODPFtFQ@mail.gmail.com>
Subject: Re: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <Laurent@vivier.eu>, qemu-devel@nongnu.org,
 Song Gao <gaosong@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
> For loongarch64, according to glibc,
>
> #define __SYSCALL_CLOBBERS \
>    "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "memory"
>
> which does suggest that a6 is unused, saved across the syscall, and also call-clobbered
> (so we don't have to allocate a stack frame).
>
> I've had a browse through the loongarch kernel code and that seems to be all true.
> (Curiously, loongarch restores more registers than it saves on the way out of
> handle_syscall.  There may be a subtle reason for that, or room for improvement.)

Sadly most of the kernel architectures don't document the "which registers
are clobbered" part of their ABI. It would be helpful if they did. (I did
nudge a local arm kernel dev to have a look at doing that for arm...)

-- PMM

