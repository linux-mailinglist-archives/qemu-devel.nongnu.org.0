Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B892D9CBF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:32:18 +0100 (CET)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqlm-0002MV-1F
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koqkA-0001fw-T3
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:30:38 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koqk8-0007BE-V7
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:30:38 -0500
Received: by mail-ej1-x644.google.com with SMTP id b9so23379470ejy.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 08:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8B7+zYUweweONGryM1QRTDVe0/pNEBzLt2IUf+Cg9WI=;
 b=ZmsypVWEm4GXhF/Ep+66XIU4YmP/zr+4lJDQ6zQshC1yoKrpB7bkBOyDHDvCYF1Z21
 jKh6u5DHKRq1HgelI68KBtKy4il8FhP5adZFUxd1Mye/u2og+5M7hMjGX0LIym8kYW76
 u3bLdPGFe33VURIImYAsEf/SLCmrCAgvR6MuN+ITYGuFCeXLwxdUEl6B/4juBcqb1ceE
 JUddYrWleibdm3l59vEsBBgJ5RAMxSsUoTE7XUV91B4ngQuURhIDlJwpEUPkuTKsKUgd
 QslUJVnkRfSy2UEVYufRH4u10djxQQVDo5XvLXfVfPOH8Qhad0j91Q67fSYxv+AM8S9M
 uQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8B7+zYUweweONGryM1QRTDVe0/pNEBzLt2IUf+Cg9WI=;
 b=kWcBR5BBizYpqNgC5+aMEY6GD1tIy9/NPJmqg3Ltjc5ydWH5+k1ZxF5u+LkvIbM3rw
 rShsjQwMLDE2/ka4CfB9rAkvn46TZnqFr9bksXWvtZLRgexaT6j7DjP9dJrpqWBYBjel
 X4n3U5HBeTDYKtsvg4CjsVFWUQazMcpaRT9u5JodPX+xO74Y6dPRJ8C4qGSVn9l8edxe
 yGUKO/X3UbwjiOWZGRnCydEEr7PI5VbwcOSsOAuRFpmHPqDPLjOUnn71WIW4UIVaE5XC
 rHI02GSDG1hYwS53uJA1KFS7lifNjSPSXXPUQWgNV2DvDmu30mjNP8HK16oKF25U0K1/
 F+wQ==
X-Gm-Message-State: AOAM5319xSMmJm8zgN+hdt+FREc3izVsIXOCqh46AoFJ4Ccy3Wd1bANF
 vmiDbzjxWLX8eh6x8lZnFfh2zHl8lbbrpvmKG2TUlbE9c44=
X-Google-Smtp-Source: ABdhPJzil14mjfEaZWUFW+0q9dMnOcFfbqvkre1sPSeGuy5t7wOOcMo5LM4ya8roTY1LkP2oOlnYI5leVZDEtC4Ho3I=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr11103257eje.4.1607963434989; 
 Mon, 14 Dec 2020 08:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20201214133702.24088-1-peter.maydell@linaro.org>
In-Reply-To: <20201214133702.24088-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 16:30:23 +0000
Message-ID: <CAFEAcA_fmLscCun27+1zKQ0WQUAuj1m8jakEPG1sjN61XY+c=A@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg/multiarch/Makefile.target: Disable
 run-gdbstub-sha1 test
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 13:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Disable the run-gdbstub-sha1 test: it provokes an internal error
> assertion failure in Ubuntu gdb 8.1.1-0ubuntu1 (Ubuntu gdb
> 8.1-0ubuntu3.2 was fine) :
>
> timeout 60  /home/petmay01/linaro/qemu-for-merges/tests/guest-debug/run-test.py --gdb /usr/bin/gdb-multiar
> /build/gdb-veKdC1/gdb-8.1.1/gdb/regcache.c:122: internal-error: void* init_regcache_descr(gdbarch*): Asser
> A problem internal to GDB has been detected,
> further debugging may prove unreliable.
>
> This is a bug, please report it.  For instructions, see:
> <http://www.gnu.org/software/gdb/bugs/>.
>
> Aborted (core dumped)
> /home/petmay01/linaro/qemu-for-merges/tests/tcg/multiarch/Makefile.target:51: recipe for target 'run-gdbst
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to master to unblock pullreq processing. We can
revert it later when we have a more sensible fix.

thanks
-- PMM

