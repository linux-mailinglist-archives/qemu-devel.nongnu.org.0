Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16A4AF9D2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:20:08 +0100 (CET)
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrZX-0006bN-4y
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:20:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHr2M-0005qI-BO
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:45:50 -0500
Received: from [2a00:1450:4864:20::335] (port=41507
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHr2J-0001qd-4A
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:45:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2215313wmb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 09:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P12BXBx4nH+sUKT0uZDTF2l3OQB++5PWTSl04wBfxpk=;
 b=XXSiPjVKlRY0Td/3Zd+sS0m7Gj1SuqGy40StMjMj/1NKe92L5FOShh2y31qeT9kjGJ
 +EwOShnquaxI2xtg8fL2FHRZeIOtb+pa/x6LtNkh1sMvFcRaCjHSaBM3XORFBGJ5ScXC
 nCXmG82QWZ7uP2gpLTkxQdzCrrTYL9uS0xNlZwxXFZi72KOm9NrbS3yqlM6ty+Zt3IkX
 f6YIhIGT0Asyc6RTzDM2Vvk1uy5WndUqrDl5ezlI13me1PcIw79P+DrwoUSc5sZ8n6PZ
 fFjDOguqgzhKfoZlHFoJ/HpRlaNYudXyyXuX0P3LlwpsBczjtGzRutN4gKQZL4km0v3O
 QC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P12BXBx4nH+sUKT0uZDTF2l3OQB++5PWTSl04wBfxpk=;
 b=vPSKi+dpQfgbK4n/OEafLHVL1TcGaoQOfuJDcW0o7aXegz1q1xGZfc6dF7/U9InsIM
 vQJq7jTWkRE2rHIo12eq9zPx/mDcyii9TJ9xNybtxTsIzU6AtK/B3lUZx52FFRo+gaSE
 rcPWvOfrPP4NE/rsZO8Ac/xsMBUBWIKEf9mdl81B6hGj+hR0M+hJQBJxE/pK2zhy1r95
 hi9TF1UNk72Ckj3y8l5sG+7Mle6qstC+/5pr3H6EO3kRroZrF4z6TOrUaW2tvkbkSRgJ
 CtUSVtfXDTfMpNPILlecam0uptzB7NwgJSfj8aNwB+cM8MhHR4JqHb7FD8SxEMv6rlR3
 oE5A==
X-Gm-Message-State: AOAM533V9sXwcxafkVAEGnyekOXxYQxIyHEeExMSF2+F0bAoiS8G5NQY
 R6ckC8AZEpc1zuIZqSvQz7U3FtuBkO+X5sMtlRx/IA==
X-Google-Smtp-Source: ABdhPJzqTVs43X+8C4hFtAUrnrHrHXeTQk7a+eUn3JLcGpG6ThCOsnRnoGJZntnQ2l6n9kx2rjNpqBQBKwu7zmC5GCQ=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr3612387wmi.37.1644428706261; 
 Wed, 09 Feb 2022 09:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
 <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
 <87o83gdk9d.fsf@linaro.org>
In-Reply-To: <87o83gdk9d.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 17:44:54 +0000
Message-ID: <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> This allows us to check our new SYS_HEAPINFO implementation generates
> >> sane values.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  tests/tcg/aarch64/system/semiheap.c | 74 ++++++++++++++++++++++++++++=
+
> >>  1 file changed, 74 insertions(+)
> >>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
> >> +    /*
> >> +     * We don't check our local variables are inside the reported
> >> +     * stack because the runtime may select a different stack area (a=
s
> >> +     * our boot.S code does). However we can check we don't clash wit=
h
> >> +     * the heap.
> >> +     */
> >> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit=
) {
> >> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n"=
,
> >> +               ptr_to_info, info.heap_base, info.heap_limit);
> >
> > I'm not sure this test is valid -- the 'struct info' is on our stack,
> > so it could be anywhere in RAM, including possibly in the big
> > range we got back from SYS_HEAPINFO.
>
> It should be in this case because boot.S sets stack to be inside out
> data segment.

So what you mean is

 /*
  * boot.S put our stack somewhere inside the text segment of the
  * ELF file, and we know that SYS_HEAPINFO won't pick a range
  * that overlaps with part of a loaded ELF file. So the info
  * struct (on the stack) should not be inside the reported heap.
  */

?

-- PMM

