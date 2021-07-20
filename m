Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E953CF691
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:08:34 +0200 (CEST)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ljt-0001Hq-QL
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5liz-0000Xl-EQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:07:37 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5lix-0000Vq-PT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:07:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hc15so33290788ejc.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpuidRu5s0S1MybLgnyhLQn2C8rFc/TWE1SGPCbIDOI=;
 b=H+jII8kYyzKORNlKZnWbBD0w3qlVBo+vWBGG8P3Ho82docMriE+j0kWfKXbRDP892k
 BdMNEp4u8RT8QnGhrPyR6jKQfrbQZdyTZgIb/jG8W7igUddoSZTKXffziHrQhwbL9uKP
 3NQVhKk0dJXvmnH0WgVGmuJDV5rI7AJSrx4zGPWuNFqzhQY8MYAqYsdo7AzgYIqQFgEI
 s1VhrGhUnaFLd72rH+yGrKPdIDlAFdCTESIDcNRFaPwJPj6W9ESe77x1YjlNN4zVKxLr
 JRCsEYUAC5aJ5qTbZOb5KbFOHcIgP9ffwA2n4amFf4JPgisFA/ovw7gk+L+z8UgLfW/1
 4nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpuidRu5s0S1MybLgnyhLQn2C8rFc/TWE1SGPCbIDOI=;
 b=BMr+zktu+OBXo8JeJN9yTTx1/PcPAcp+gk0077WLSRdLo7caNXg/gha+Ymy3zA6kDq
 HlecX+4mKmLiLsBAkudCKLcMILA9SbvuNEV9b/ixrzlqDCACSJnC1kzZljLUAfcUUhjM
 zY2fOT/7j8NvWiiqhqPAe75qJQVXWSElo0XfwfR4IZ4+f8DnQwkMA7LHRLgV7plWRq8p
 MASbd1l1RAdReogeG6dr6RqWLrwDGd0Nm4AUaqTh4ab/ITltPhxl6EldW9CAvzu8UlGC
 3+FbX9VUSo58LN7nwu/6HXe47qabp+VSAh5t+ZiZzSeIDakYXQH0gZgamYR1jQYdg+4e
 5Z5A==
X-Gm-Message-State: AOAM530EJZSTutLlnEQ3FuQbw84vGs61ZKj2mCdjuNtw58OCSIXy87H0
 gmiKlZPkyED/zG4AQzblkeOFOaCIIQs7cBVNbO7w0A==
X-Google-Smtp-Source: ABdhPJytb0mlRutzM5xA3epqh2KWPX2q5JXXWgHDMe7SsjpyqaVEC/D599lpg4Bd8NgcZYmUGC+0QDdjcylrhtu7E9Y=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr31312947ejc.4.1626772053408; 
 Tue, 20 Jul 2021 02:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
In-Reply-To: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 10:06:52 +0100
Message-ID: <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
Subject: Re: Error in accel/tcg?
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> Hello,
>
> I get the following error:
>
> <long cmd here> -c ../accel/tcg/cputlb.c
> ../qemu/accel/tcg/cputlb.c: In function 'tlb_flush_page_by_mmuidx':
> ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true due to limited range of data type [-Werror=type-limits]
>     } else if (idxmap < TARGET_PAGE_SIZE) {
>
> I don't know why that suddenly shows up.

So, which target are you building for, which host, and which
compiler version? (TARGET_PAGE_SIZE gets a value that depends
on the TARGET_PAGE_BITS setting for the target.)

> In other parts of the code, I think somehow the meson build system
>is triggering errors for warnings

The QEMU build system defaults to warnings-are-errors when
building from git. You can turn this off by passing
configure '--disable-werror'. (Note that that's a bad idea if
you're working on the QEMU source code, because you want to
be able to see and fix the warnings in the code you're working on.)

thanks
-- PMM

