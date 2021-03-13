Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D2233A097
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:42:48 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLA9l-0002EI-62
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLA8i-0001Xn-OS
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:41:33 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLA8f-0003Mw-6I
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:41:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id r17so59731495ejy.13
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggpIh+2lIg+KmVYmJL/X1nMsG4jQjjGgYqrMWoqo8Vo=;
 b=K/qRFpqYdx4ULJsjg2T1xv/LVLqFqcb1s6MMl1R3hOnz8vZypLHnALCHk+PvolgfOA
 pdEhfkkx2v3KG5dMJD4Zgw6lvSMPjv6PuoiORGFir1m8psHwykKFhZFkJVJqqAyVdWDB
 6CVOclUlrQg04v8RJDKYM6M27InwwmpQ99SQ4LeW4IA0nxR+NGTUJfQjIsr5WgcVzIOc
 YkvcHK1zNhgN3b1zJFommsJ3wQfJKhB7QG80gWTy+sLwIKByQUUjUAwt/+58nl3xeoQi
 +gib0Ve6DMFsUGjJUL3e3y3PxJXqv0max3H4Hm02i9qAOa0I5Ts7yIgXG5spDlNpgV6e
 RRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggpIh+2lIg+KmVYmJL/X1nMsG4jQjjGgYqrMWoqo8Vo=;
 b=rznJ1bN7oVtJY6gEV7X6NKD7Ww9N3sjQ0nSv7mJe9APAsXJpprYrB23n2ZElCOt8bt
 1itSXF9UpxJQbGUubfvEcH2y8BNh8cpAiNghyG1kIWPLnMK8Wt7egZcZFMTOFALZcFtG
 cbMeniWXtrYFhWbA2mRF2VbFtb+zG5w7hZNFFkVGZmYlKoODXKLsuhL6ZZigVAUnwhf8
 UlGrSvfq77i09DYVwRNx5YpZhpCJDUAbyoS7FinJPomfsLHdIInvSW99/5BywaBvDpEd
 FvsekpnkaZBL0c+mDmsHXF20UdUUVpXBMqFb+nA7dNBeOl3dSLUsh+pP40QgbdD9vuE2
 GnTw==
X-Gm-Message-State: AOAM532DQLtTF2jXJS2F2+GiWKJm+SNrPsubmy4Dvn8DbYgITbOlLhFj
 RAnrb2cim1jZam0F0oumn3nB+2mqDtuHLRbFPRPVTA==
X-Google-Smtp-Source: ABdhPJx2t3Gxh9yp1Tu26HPLWAj9dmrPiWMXPHW6eLB0mbyXGLQCjkLfnrh2PTQ73+9edPkBzsxgXkT0Flyjr8RDdMg=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr15622174ejd.85.1615664484284; 
 Sat, 13 Mar 2021 11:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
 <657618fc-9e62-6c24-c65d-ccc7375c7fcc@linaro.org>
In-Reply-To: <657618fc-9e62-6c24-c65d-ccc7375c7fcc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Mar 2021 19:41:13 +0000
Message-ID: <CAFEAcA88EPzz2kh3gwL99nv=JxYcDQdBJxCDzOO5FfZ1NkQT9Q@mail.gmail.com>
Subject: Re: [PATCH for-6.0 0/2] arm: Make M-profile VTOR loads on reset
 handle memory aliasing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/12/21 12:59 PM, Peter Maydell wrote:
> > On Fri, 12 Mar 2021 at 17:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> This series handles the possibility of aliasing by iterating through
> >> the whole FlatView of the CPU's address space checking for other
> >> mappings of the MemoryRegion corresponding to the location of the
> >> vector table.  If we find any aliases we use rom_ptr() to see if the
> >> ROM blob loader has any data there.
> >
> > The other possible place we could put this code would be
> > to put it into rom_ptr() itself. You'd have to change the
> > callsites to pass an AddressSpace to rom_ptr(), but really
> > we ought to do that anyway, because a Rom has an AddressSpace
> > that we should be checking as well as the address.
>
> I like this as the solution.

I realized that checking against the Rom's AddressSpace
is likely to be a bad plan, though -- in some cases the AS is
used to allow the loader to say "load this image to AS
such-and-such", and we don't want to fail to find the ROM
blob because the rom_ptr() code is reading it from a different
AS that is an alternate view onto the same actual MemoryRegions
(eg Secure vs NonSecure and the RAM is in the same place.)

thanks
-- PMM

