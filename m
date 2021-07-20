Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547AC3CFD78
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:26:32 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rdf-0000mv-D5
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5ra0-0002yt-Am
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:22:44 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5rZw-0008DN-F6
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:22:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h2so28969016edt.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLNUbwIVu+tT9ipt6s2WtioYLh04Ekz/iPAlbRs94/E=;
 b=koMmBHvwXToXKNL26wGNEptwu361QRNa/cQfi+NbK9joHOrYIViVlgJryacs+d9Ndx
 zkACV9g+N5CcW9+FeOY5ekqSIZjMbL2q3g/tJDw5IByGk8mnxASFsqakJKvCfnCmup7w
 AxwEVT3zt3FP1ZLEOt3QKxuXLhPBBbpv5/muAmGbcmcpJmhBl5s/IW8OOqJejHyRlqoj
 LqMjETg4ddYwIZ4RUFta2+ZJJQpWhtHW5ZqsyKYVH9A1PkS7BGTZjHHL6TPn0OH5KzUG
 4KHVqX3cU8Gfl6Q41w2KR2UbMt0fP7z1Nz9T18XZ5kCYZgogHpRPBva46E9ZvK/ADNg9
 63vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLNUbwIVu+tT9ipt6s2WtioYLh04Ekz/iPAlbRs94/E=;
 b=q0CMUNqauniCKD8wTytVxSVMBxV6KSMlX3oDLsJM02Rmo0RBfeVUDeOgntntI8sSqn
 0kxPdg4opHP7gduHB0gndWP3ONL/uXSVJJMRluel1xRBCo5dZ7wdftQ4YqFGF/N7JW4Z
 3W/VCL8HM1HNCKYVIk87beahSWH8WtdHMw5+HcDRDM7c5ocwrw9l3l6vDw1e3IWSvWtP
 yPQO197snSks/WCK2vCOUayhizRIa6bT7XGOrsUEqEb3x2oxxkBJyYKii46D+UieHDKc
 hUKG3ufvyF0p3nxEPNKQ6xl9jg1mYqmtKNXjCJJGHAYgg7nesaTeydEIloKvpBNRrG2Y
 Si7w==
X-Gm-Message-State: AOAM533iHRVL2VnfRF3B9bpjh0Qs/10+YX/BUY8Cu7j3tCs9lNin43Sg
 rRFTYrXxG7XHKsZrV0CLFFubdCdXw0qBxqJmVySz1Q==
X-Google-Smtp-Source: ABdhPJyZOZAUH7xLB2l7AoyCUJz/0AC06NHX08MZVjrCflBNTkuuvQE99mj9sESxhV7DByaQ9s2adamYrcxLLhUtV8c=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr40832666edy.44.1626794558676; 
 Tue, 20 Jul 2021 08:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
 <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
 <CAFEAcA_cYZHr=Kz2JakLpxkdyBWGJUUpJWZyyV_yMq59X7YJGw@mail.gmail.com>
 <CAFEAcA-sq2GfHkpVc8BF-n=KEVwwrtzsbhM9w+_O=GmN+gg5WQ@mail.gmail.com>
 <CAK7rcp-qm1v-fuNvH8-978SHV=sXOK8DhzMUfmWSEwGQ+utJ4A@mail.gmail.com>
In-Reply-To: <CAK7rcp-qm1v-fuNvH8-978SHV=sXOK8DhzMUfmWSEwGQ+utJ4A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 16:21:57 +0100
Message-ID: <CAFEAcA_2_JJY=kOqC5H3tS7NmW-Mszu+Z68A0pT+YjUo0KFaBA@mail.gmail.com>
Subject: Re: Error in accel/tcg?
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 16:13, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> See of course I thought about editing code outside of my target too, but thought against it.

Yeah, it's a bit of a hard one to judge. Mostly new target code shouldn't
need to result in changes to core code, but sometimes if the target is
doing something nobody else has needed before then the best approach
is to update the core code to provide the necessary facilities for it.

> And doing it that way may make the compiler happier, but then would it be inviting a runtime error

In this case what the code is testing is "can I fit a value into the low bits
of a page-aligned address?": if it can, there's a faster codepath it uses,
and it has a fallback to a slower approach otherwise. If TARGET_PAGE_BITS
is 16 or more, then it is always true that the value will fit into the
low bits, and we can always use the fastpath. The compiler is correct that
the comparison is always true, and that is OK here.

thanks
-- PMM

