Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF03432A2
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 13:58:39 +0100 (CET)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNxfC-0001eh-QG
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 08:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNxdM-00016e-1n
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 08:56:44 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNxdK-0002Ni-82
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 08:56:43 -0400
Received: by mail-ej1-x62d.google.com with SMTP id a7so16868875ejs.3
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PkspXhnsIGIYJ3kK2hTFUr6Dn0UnI/2ULLbAmEcOi/Q=;
 b=tLsB0cddRT/TYUKptDOsBW31Xry5Yo2sqvXPmUajvG+/n+6x2dB2lzUGi08IYR/n/6
 hInVv5+Ao3+w8ifJuLLva8VT9g1h3yuOkjAtJutslwPjUl99FskX976sGTssyGTlTnJY
 1e8ZmYS/g1MZKfdMSSwvQm7w0Xjyc8Tdlfcf0Hv6XFNkDxdvO17HVkVPDwX2e/7AWAda
 rKFpMTOjMyxh7wxgfcx9ekmB0lztOkQe4GOaldTRNPJLMcWJ5ZS6mlEhhy04VU1WQCqM
 VviB+rMAMf2zkFgQJdnt4zEIoISo+aqn1VKqXV8AiwpA/888EO+AVADqi6UHsL9+I7LX
 eaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkspXhnsIGIYJ3kK2hTFUr6Dn0UnI/2ULLbAmEcOi/Q=;
 b=Gi0O2hNuks6IlHX3zdv1U7b5PzZM78oh0yQsn2qq4wu3KrEw4cV3ArMtZq4jiJGJ0b
 gCVJz98WVtYpOvpFaJAI1oDPo2n18W8P8H/h9X+kqJRhQvZN1TnSiCmP9/pTH8ynd7iI
 PQy6/oWotZDZWZcDRpocxeBPRGfNB8tsZaLVC5KcskfG9Xxz8r0My/2dr4GiSg5Ej3OZ
 b3g7FAc3qo8VGjPiomz2VYNteDruO30fN72hShV6LrDuHF8yR6gzNK8gNxkCYHNfPTCD
 hlSovxfiQeBBFnEFGQWyG2t/izEBAt5rKSZdQ573+7cyDmNcZRpsFdWYvUBE02rScdCT
 j13A==
X-Gm-Message-State: AOAM532UpwhqJprC22UFVRRP2rkPbDlWl7mvd2yp1oPqXZicvd0GZNJZ
 9ZJJAtvcpQPtgNlNV+rF22Bnh6JnfW6GF7H0ArObpw==
X-Google-Smtp-Source: ABdhPJwkkEjjSUgwA6eGmvJBLEL8KAOR2qE/5GJ/WChWpQKv9045ie67LVHh450Z7v5YCpoja1hdJNH87wf8m2sKFqw=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr14461784ejg.482.1616331400018; 
 Sun, 21 Mar 2021 05:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <YFZ5YgPWLraY5v3o@os.inf.tu-dresden.de>
In-Reply-To: <YFZ5YgPWLraY5v3o@os.inf.tu-dresden.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Mar 2021 12:56:12 +0000
Message-ID: <CAFEAcA-=7y1g8D7Hk_bYe5F9Q51WufbC3RKw9wN8=PoefN9K2w@mail.gmail.com>
Subject: Re: Arm: VFP regression
To: Adam Lackorzynski <adam@l4re.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Sat, 20 Mar 2021 at 22:38, Adam Lackorzynski <adam@l4re.org> wrote:
>
> Hi,
>
> I'm seeing a regression in Arm's vfp handling, giving an undefined
> instruction when reading mvfr1 in PL2/armv7 although the FPU is enabled.
> The following makes it work again for me, however this just looks like a
> band-aid. Thanks for taking a look.

Could you provide a test case, please (QEMU command line and
image/etc files needed to reproduce) ?

thanks
-- PMM

