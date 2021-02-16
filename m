Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146D31C4B1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:48:16 +0100 (CET)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBoXH-0006S2-Mp
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBoVC-00053X-2y
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:46:06 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBoV9-0003To-WC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:46:05 -0500
Received: by mail-pg1-x532.google.com with SMTP id t25so5208765pga.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 16:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UmQEaEpcZ5m3RF5wXE0g/HWB07grjMeQiTMdkEc+evk=;
 b=uuuWzFjyVV8BwzshWmXZ8K+dfujUsfPkAhlME0knbA6GqBI4TI7fnkRpg2ik8Ad7AW
 ymy45pUnSFhQPTd51d1a0utdahHNNlmkkz+gIe6W6CypcmXkpDF/fe8z/+8hmXIvQ60B
 O2zf08ahyCpRgADV1XWCVypAsh3sTsgD3roqfPeY1D0LtDj0bMTzOt0+6fX310KlvMd2
 BvL9s113bWu0jSqwt+EbKZbgNQn3oimT4W87wVzy/TrVtyZ0ZYt/lvbWYq+rKaQUFskT
 uWjePjAP0+bJqBQHeFy0R1lnuNGHhhujFej4wivtViVvUAIyP6CoPi/Tp/KQ6r0NhrCq
 RUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UmQEaEpcZ5m3RF5wXE0g/HWB07grjMeQiTMdkEc+evk=;
 b=WgcXAe3yvTlskldg4LSJhJUbf3uzq0/8qF/JV6uZtV7BfsvBlofEZjvt7xSEs8Lu8d
 Xj4QxMvKwRyfkGqMxFSNfHeYHSq5NZw/lybpFc+gKY/J2Mnfs7U51tPEcvLlxIAHgmiM
 q0iqkrbhZ+6D/G3/zcEOwA77zUpULq6vfXPZOuvH+XD6HUhktnHWcXGaRe+bLwatvkAA
 mHM7VxpJgtH8lZUlX8fx6qsZNazcXMWLuyEdRXquF6CAWxhmNtyFHmtNxVupSBtKfkik
 Ks3R3fWhFe0oNgx9RZfdjdswuJqidFltdN5My62zi4bL3j/+2ytL1R99ayPHqUkBkDWH
 IcYQ==
X-Gm-Message-State: AOAM533LVDK/1f70RW0g9lA0nFgGX0p9svPEvouwS82EBy23e2pe6qii
 n05SgEdvg8FaCmfK7nuxJ7hh/A==
X-Google-Smtp-Source: ABdhPJx4XH8JdqH1M8UKL2RWgvwAK7D0QXF7xzldHI4qlSqoP7WWjaFQCKgPJ2pBGGXB/7atYL4Ziw==
X-Received: by 2002:a63:580d:: with SMTP id m13mr16856274pgb.342.1613436362633; 
 Mon, 15 Feb 2021 16:46:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id z11sm620311pjn.5.2021.02.15.16.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:46:02 -0800 (PST)
Subject: Re: [PATCH] hw/display/tcx: Drop unnecessary code for handling BGR
 format outputs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210215102149.20513-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17c82dda-2b78-d70c-9f15-87c0fd33c9d4@linaro.org>
Date: Mon, 15 Feb 2021 16:46:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215102149.20513-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 2:21 AM, Peter Maydell wrote:
> For a long time now the UI layer has guaranteed that the console
> surface is always 32 bits per pixel, RGB. The TCX code already
> assumes 32bpp, but it still has some checks of is_surface_bgr()
> in an attempt to support 32bpp BGR. is_surface_bgr() will always
> return false for the qemu_console_surface(), unless the display
> device itself has deliberately created an alternate-format
> surface via a function like qemu_create_displaysurface_from().
> 
> Drop the never-used BGR-handling code, and assert that we have
> a 32-bit surface rather than just doing nothing if it isn't.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested by booting Linux on an SS-5.
> ---
>  hw/display/tcx.c | 31 ++++++++-----------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


