Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A546483A3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eE5-0000Y6-Rk; Fri, 09 Dec 2022 09:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3eDz-0000WI-UE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:19:43 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3eDx-0002JB-Qw
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:19:39 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c13so3783763pfp.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1VBpzBzMHVCOLGpV8AuWE3F+P/ZttBlPEcoL2wdCd88=;
 b=LbNlyhOEf3eO2b+GbvU/Df0BSLBzP9AaOqzOEhaxsQXUBw09B4Ndnwp6aBuH/G41iQ
 AVJK/XOL8R1GKUMr87yFNOJQFPphCGyLDD3rHgEVECNSx2hEB4m8f0f5t6yEY10Ei6mt
 oSBbE+RSF4uzU/gSiVhVLKdPQorfsFh8AyvOIn6bQq4qFpD6tKLFHSWKJvLnaigXv+Dw
 DgpRmY+fgMmwN/r1YK7aCAP2TeoCDhRKG7ms/WHoaw50WIFJqGuZA7iRkfrdkqkuWJd9
 foNZaja8B1kLSYZU+r2PvdHMkjtRUHoJRF7ZcrDugYUyhehiQhCvQ/NOPyC7EEN/ha8I
 Oe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1VBpzBzMHVCOLGpV8AuWE3F+P/ZttBlPEcoL2wdCd88=;
 b=kJwGBaCl2befVSMoZsXRWeUsiZPHGAYMNyCndTZ0stOY/e0dMtbUP0EXXEQU9eXcBR
 SpJPAKHPnkw+bJqP824vmw8OzmfxQib21hO5eUzAAxLGjV3bd0UJI5CvuBIhpHKtJqMg
 yXIwl9ouNgzyT+6VNHPoTmt2yTOTR2S/2qtyut0S/nL55lmFJWeqHCLpRAvaW63wNJMH
 /Wn/YB12GexTh5ZD0O/FB5zPQo6ylasUKUfxftekCKvreN5Bbuu4Mv7UrAw2bcT7c0ba
 p9FdmPZulTQKk3tGo752lBaKrtJ571CpUisaq6shCC6PVq7B3kI5y6ykDHCTeaKtWJN+
 MiSQ==
X-Gm-Message-State: ANoB5pkzu6JoLG3qc3s97FHMk9fmzaZvDbPNR3hgxaVDMqyRVmMEhY4z
 8P2j616z9Wpuo+bdAyLHabOz4byzk4Rj4ZKqKi4/aQ==
X-Google-Smtp-Source: AA0mqf46u4r4IUUqFlkWT/dJUIIijRbFCs84xmA4A2SmDPrYDZfPakQD4gBi7q9om2I8OljwcvY8o1ODrwBBPOZuOEI=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr78908608pfb.3.1670595576046; Fri, 09
 Dec 2022 06:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-28-pbonzini@redhat.com>
 <CAFEAcA_9wJy47nUpfkuonB_Fcu74MoC-14dj8dwi8i9HggWQKg@mail.gmail.com>
 <af52a8d4-839e-cb0e-abb1-a15782fb071c@redhat.com>
In-Reply-To: <af52a8d4-839e-cb0e-abb1-a15782fb071c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 14:19:24 +0000
Message-ID: <CAFEAcA-3koo6XksOObkxcUT+jjHbqqiUm31h62cho-GJv25C0A@mail.gmail.com>
Subject: Re: [PATCH 27/30] build: move compiler version check to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 9 Dec 2022 at 14:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/9/22 12:52, Peter Maydell wrote:
> > The new code makes it much harder to move our compiler version
> > requirements forward in future, because there's no longer a simple
> > "check for normal clang X or apple clang Y" test where we can
> > bump up X and Y based on what's provided in the various host
> > platforms we have to support. Doesn't meson provide a way to do
> > the version check on the version number the way we were doing
> > previously?
>
> Yes, I could just do the check with #error just like before.
>
> For GCC I used the nicer "compiler.version().version_compare('>=x.y')"
> check.  For clang we have to deal with both upstream and Apple version
> numbers; it's also possible to check for __apple_build_version__ to
> distinguish between the two and then do version_compare(), but at that
> point it's easier to just use cc.compiles() and #error.
>
> While it's possible to learn the upstream version corresponding to Apple
> compilers with "c++ --verbose", it is not really machine-friendly so
> Meson does not attempt to parse it and neither did QEMU's configure script.
>
> So I went for the trick of using -Wpragma-pack, which was extracted from
> https://github.com/simd-everywhere/simde/blob/master/simde/simde-detect-clang.h.
>   The advantage is that you only have one check, the disadvantage is of
> course that it obscures what's going on.  I can add a clearer comment
> around the check, or switch to #error and add a pointer to
> https://trac.macports.org/wiki/XcodeVersionInfo where the mapping can be
> found, or really anything else that is your preference.

I think really I just don't want a check that is "we happen to
know that this particular option switch is supported only
from these versions onward", because as soon as we say
"OK, we can move forward to a clang 7 baseline" we either
need to search around for an equivalent clever trick, or
else we need to get rid of all this code anyway and have
the version number check. So I don't mind how we do this
as long as there's a straightforward bit of code that
currently has "6 "and "10" in it and where we can change it to
"7" and "11 "in future and it does what we intend.

thanks
-- PMM

