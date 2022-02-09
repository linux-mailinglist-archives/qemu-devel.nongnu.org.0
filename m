Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C494AFCF7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:11:52 +0100 (CET)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHsNZ-0008RC-Bc
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:11:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHsFQ-0004bK-Hd
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:03:24 -0500
Received: from [2a00:1450:4864:20::432] (port=34677
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHsFN-0003fp-UB
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:03:24 -0500
Received: by mail-wr1-x432.google.com with SMTP id f17so5757782wrx.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 11:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ueC1kQfHhKS0AerE+f9Egq41aiqK8o/ee1DDJkhXXSs=;
 b=mSXERXtJNSQS8TOaAs7oW0fIGjjvzZmgXj9wnKL1LZLC3jIj/XP0Pgf5F0JkTOMh7y
 u73rwiaSEKfF0a0pgkQQP6q4gaue+1QaRL6zQL2XP+RvceN4/+Y0k+jczE5AEoOU6kjP
 baQXnXX+X+2j+xao+E0Hek2T7efIqMdvSXfQtIerExtxc2MdNa6wmWzsfHwSS8uqGk7/
 HX36Du7Ros9u8rU2cbyTlTWnZO+UPCv3QqDiY8lqezrpkcDyzodVfqFQMk9SdAWOxONn
 OxLByyiKB6uGVb7gJ8oZAvwPMPQGj8bmUGwLh/w3+C8qU677xI//dsWPtVAgkyfgo6JQ
 bwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ueC1kQfHhKS0AerE+f9Egq41aiqK8o/ee1DDJkhXXSs=;
 b=YlWmcU92Z4/TgA/IokD9VDRqzVcVM5ZwyimnxVxYyeslOgLMBllYJqc7JDDUijzzDz
 R1wcUy36RO/azOX1L0V48PJnEHIb6dm2mDxgTAZjegMQ6FGQfCuFtZ3TRSLGsa8+T6il
 t+K8q34M2NlzyqrZ3KQwhOfZRSNbFP+0H9y/DKTlFE5Rw2CC7X+HXJY9nIGl6m0h2FjN
 cTM20v4v1qvh1YVzy1DyYVSE428R6e/hAGhpE6IhLVm41QD/YLxVwF1Qiko/+Kt0KqGL
 Kv+ez0/YGkz0iG2aTyUCSa5NuKGS22blUd1KS8Q0LPIX9SK0l5aUFVHxphEmFzGRNWcj
 Br1A==
X-Gm-Message-State: AOAM530ulMSRz2db/4j7HhMFdYuh2eoGM1Npl/3luKAMX0ie4D1FE62U
 0g93yuG0D+Pm9JwklYLF8Kr7pdCWkHFJvbjLttr9Fg==
X-Google-Smtp-Source: ABdhPJzeJuzbQdkGrgychcDT+PIaUdkQHGQjyD5NQv+NNI6cihfcvsMXRAHNUnm6XQYTdEEP3I9jjQl1gRAUNZ/1fBY=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr3379621wrb.521.1644433379202; 
 Wed, 09 Feb 2022 11:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
 <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
 <87o83gdk9d.fsf@linaro.org>
 <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
 <87k0e3ewjg.fsf@linaro.org>
In-Reply-To: <87k0e3ewjg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 19:02:48 +0000
Message-ID: <CAFEAcA87H4OibHzuz=EycSEFo=jAzMoCxij8KDdoFHjrp54vjQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

On Wed, 9 Feb 2022 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 9 Feb 2022 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> It should be in this case because boot.S sets stack to be inside out
> >> data segment.
> >
> > So what you mean is
> >
> >  /*
> >   * boot.S put our stack somewhere inside the text segment of the
> >   * ELF file, and we know that SYS_HEAPINFO won't pick a range
> >   * that overlaps with part of a loaded ELF file. So the info
> >   * struct (on the stack) should not be inside the reported heap.
> >   */
> >
> > ?
>
> Well the data segment (but not the bss).

Ah, yes, I missed the ".data" when I was scanning the file.
(For a system binary it doesn't matter, because our ELF loader
doesn't care whether the segment is marked read-only or
read-write, it just loads it into RAM.)

> So as long as the ELF loader
> includes that in the calculation (which it should I think) then we are
> ok.

Should be OK -- the ELF loader creates a rom blob for every
segment in the file, and then the SYS_HEAPINFO implementation
will avoid them all.

-- PMM

