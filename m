Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC08402B7A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:14:30 +0200 (CEST)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcnt-00026n-Cm
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcgg-0003xU-CL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:07:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcgd-0005hF-KR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:07:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so2096608wmn.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/pCJL7qiT2UsMwGYhBVGmFYsPWmxtAI+srQ20ormhw=;
 b=ieRe9PaLZJitUpPYPBEOnNuij6hy6p96iWRBmBM5NQRbIPdZJsgeyiYVUEX0hyw7OB
 WKtw92f8vdMsUqVpnJvOKFZ+PKInvDQbVzJGgp08jzQm7rYDx/ibJZOr7L0win1mlYI9
 gTs202Hvt3pmZODa8HkFQgPKH7urLAjXGo+X8m8FgbSt1jtpVGtJQmIjzDrfLlaAYTGA
 qMFXIVxQ08iofw8pNyq6nWcnIqi1oW1bBdT97thfPI7M02ufX0kq4o8Q+PRVISPnQsKt
 fAhExzwnQM5sEmStUjDmV4sbujTSsm1npouYqEbMxGoyRbsUomjiSX2aHqwpUHTGN0DQ
 zQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/pCJL7qiT2UsMwGYhBVGmFYsPWmxtAI+srQ20ormhw=;
 b=Saq1LukxvK/AuD6mUJwn5GQwdwMQdCtaopBTCEbIRUiN5JNFnztPgJJv9t1jzz78I0
 /KxQ1NFeD+hmE3B/LK4PRlrGCjS8jU6GhS7t3qcLN/w8NUw7pFE2PDCAH0KjksJwSvKO
 cJxDFBqLMHe8p3VYT0Hf1m/S/1EIRpTdQ/094qCt82lBslqwfLtaN0FUi6s4y96Vl5W4
 IPuvTFRrz6zBBfJt3IC8m7eMrarS/+fWCXwCERr7SWF11MUNt1LtkK/rSXfnnIzt904y
 dzlktI6t3Wb+C7crVc1aLPfjHj+xuoZZv6iz9CW03HoXxLalgri9JUsO1ivgexbEioG6
 ODOg==
X-Gm-Message-State: AOAM532s0f+jmt+IzbVPN7Wp29VYTseD03+WmWPVy5c1fQC9rBJlgJGh
 /M0COmnX8ZxlZFLfF3BO8aOiNgVVohcxebYQsyewZg==
X-Google-Smtp-Source: ABdhPJybqw1zB5BZPa1peyit0cRU1aoBje06zTjC0Z0ghhmTAWvWBxcAGd5/N87ItfMfaXaowtY/4mNWijARsuxerdM=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr4612072wmj.126.1631027217626; 
 Tue, 07 Sep 2021 08:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210307222625.347268-1-f4bug@amsat.org>
 <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
 <CAFEAcA_nMogdN-Q7Z7S=5BY6RWKDq0jnHya5BaoUe+6n8oKWYQ@mail.gmail.com>
 <db4abdf8-bbc7-ae63-a7a7-8496a4ed8dbd@amsat.org>
In-Reply-To: <db4abdf8-bbc7-ae63-a7a7-8496a4ed8dbd@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 16:06:08 +0100
Message-ID: <CAFEAcA-6+S1Ugh56wac02AnUdnbHftq0aYozHs5Yyq0vkX-usA@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/block/pflash_cfi01: Remove
 pflash_cfi01_get_memory()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 15:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> The problems I see:
>
> - pflash_cfi01_get_memory() doesn't really document what it returns,
>   simply an internal MemoryRegion* in pflash device. Neither we
>   document this is a ROMD device providing a RAM buffer initialized
>   by qemu_ram_alloc().
>
> - to update the flash content, we get the internal buffer via
>   memory_region_get_ram_ptr(). If the pflash implementation is
>   changed (.i.e. reworked to expose a MR container) we break
>   everything.
>
> - memory_region_get_ram_ptr() doesn't do any check on the MR type,
>   it simply calls qemu_map_ram_ptr(mr->ram_block, offset).

Using memory_region_get_ram_ptr() is tricky to get right, too --
if you're writing directly to the underlying ram while the system is
running you need to use memory_region_flush_rom_device() to make
sure it's marked dirty. I think the current users of this on the
pflash devices get away with it because they do it during initial
machine init.

-- PMM

