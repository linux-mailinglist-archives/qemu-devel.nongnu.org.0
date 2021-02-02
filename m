Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B030BB68
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:53:33 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sNI-0007rk-EW
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sM5-0007Pf-6P
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:52:17 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sM3-0003TH-H5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:52:16 -0500
Received: by mail-ej1-x630.google.com with SMTP id i8so12488534ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 01:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UApUxOaJP+t6fV9jHDHIoe/lBEmmZCaRZndQmeCaNQ=;
 b=fxTPgBk5PV6ClcV9p4GVeakuzhJl9BeOC73OlaIpZBqkg7mYCmsQrqwG64kv/Qu7qB
 jQDi0TPoU85Jtat3wx4LKe5f7h9RTKrnzbNe+dC4581hGqkmAyGtrHl7QHD9b4kUbZ5o
 C+uIbv7GQoMe2jFlv7zduqSxPXkCaVM97KYQQBrGwyDpLs9XzzDfXcWstXS22gZfRpgz
 kDYnq/xQGiMqbluUXVIZ/GyOKpWFLxfTPrPfA3KJr2Uv4PTSoh4eQgHNYXPsrAU5EEH/
 5M6U94HutNPDX8hSbCcB/kJ/hT7pDpTv8yw9qQWekEL+uAaYh0242fjy6cLKuG00smeM
 Js8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UApUxOaJP+t6fV9jHDHIoe/lBEmmZCaRZndQmeCaNQ=;
 b=c5PrmDx1QAi6a1+r9sOYn+Bv4TiwYKIYJo+a9H0tjbBWZq/b3NfxV1nAghlpazJCsg
 Z8ShFUTuw+mMQUzB18VkMIK89Fma7CycU1cuXUbSqnek+da1CdXJNRE6S+dOFHSZWYKT
 lg3ARbrixj2k6m0lJDP85HNXfJVTmVQPdWdT/DLgc8IdiXfhw/HIq9vI2g8KWO+2BBNm
 PzL/uLKrIj7sJ2rHRajIn//LjJ6X2d2r7ki4gXm8qJiszkA/be0Lxl6aqADwIIfMeRjT
 kAPhexytjFhzLid2zRn0U0lcQrpQ7ljly/l09v7kCpT3XdAIMqC7OXQbpzGKfmVARVQJ
 zECw==
X-Gm-Message-State: AOAM533LhfuLmyVR9plxUXzZ3OX72tjS+aBkGFnq30ZcCcMJrxXFBNJJ
 0in5xmb6l4XVfNMMM5bTjf2KS08aaI58IjkE85q2tQ==
X-Google-Smtp-Source: ABdhPJza2bFH/YqXQbrpk0ThFHUodhuy3ihqdc49nWfq097v1u8WQCCYlpnlPlG0IbClC+qOJpCtWsuYfKQ1x9fP4Hg=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr22441433ejd.250.1612259533861; 
 Tue, 02 Feb 2021 01:52:13 -0800 (PST)
MIME-Version: 1.0
References: <161049230444.13717.10732991676985431455.malonedeb@gac.canonical.com>
 <161224193914.13121.15293709183751600564.malone@soybean.canonical.com>
In-Reply-To: <161224193914.13121.15293709183751600564.malone@soybean.canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 09:52:02 +0000
Message-ID: <CAFEAcA_4tk9oAwmTCw_+FDH1bVkEU+LZU_XzN6LTVsoV33UXPA@mail.gmail.com>
Subject: Re: [Bug 1911351] Re: x86-64 MTTCG Does not update page table entries
 atomically
To: Bug 1911351 <1911351@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Tue, 2 Feb 2021 at 05:07, Venkatesh Srinivas
<1911351@bugs.launchpad.net> wrote:
> BTW, the RISC-V MMU code _does_ get this right and the model could be
> followed by the x86 version - - something like
> https://github.com/vsrinivas/qemu/commit/1efa7dc689c4572d8fe0880ddbe44ec22f8f4348,
> (but with more compiling + working) might solve this problem and more
> closely model h/w

target/i386 is the wrong place to put the fix, though:
the abstraction layers for working with AddressSpaces need to
provide atomic operations and then under the hood do the right
thing to implement them. target-specific code shouldn't need
to manually do the translation, fish out a MemoryRegion,
check whether it's really host RAM, and so on.

thanks
-- PMM

