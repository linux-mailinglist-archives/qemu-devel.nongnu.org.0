Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64039B578
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:04:58 +0200 (CEST)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5lB-0007OJ-Ap
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5kH-0006XO-1S
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:04:01 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5kA-0001YK-Oh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:04:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so5486207pjq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMXi9vHXpchxUon/pDdTEr1IO0c6b/Xo3Am4EQsqEB4=;
 b=FryNAoGKkQDLCNAazAJdd8f0K7jSxi7Zeb0WrhKGp6n61H6XSYXwTwV3/RHwiMgw0V
 b3LbpnMRK25Vvc20NN5j2I/fzyY7NOjDNsxvYVbvn5ALTsdBNsKGO2L0h5W8AUSAc3ZK
 StMGDm1A5rsCtlc2+iSFhtBvmKJzEULREplBOHHBlOD83R9HJuToY/uPJJpeN6f4MXk2
 sISjJI5ryYUaOgb+X6N0C9uxOAI7eam9gTXGnjWpXkHvDn7L47ZqeoTjpSs32/chkT3+
 piO0Re87MN0mFJSu30JLQhqdpbMnDqtyPZWR/BNrakhzXqkmNj0w3NW1u2LLDy8v7H34
 LHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMXi9vHXpchxUon/pDdTEr1IO0c6b/Xo3Am4EQsqEB4=;
 b=f0y5Bf3+sF0dvhp7hsnOODPmwv5Vi5KxkPMdOODcJ65keNYs/vp7kAv5rjOJoP9ibk
 VNtKdRGYCqISVynXfKlUNFC9NPz7W4F4oCs7z2vKLksHivgRjYcHd4zICOFwnA33fPRf
 SKN1DCOTmtTZS1/5RdBuNwH6tLDtDBiHxeNV5dGezrKdsZH5LTDSE1kCJ1TLnIb0ehyB
 mVU55Z+PxHrBPkCh7yEl4hPqBDiWLgX84t+4BkVa7XQ3KBqo2jPKefacScoIcXfTHQjr
 2Ypin4vZaYoJfR+Owi1iRrGZe2Xj84xAN0cqh3QrMiMtC2Zgj51FPpTwAxG2805tpATA
 xWcg==
X-Gm-Message-State: AOAM5324BqoQWCaWuI+RrVzgzikHzk3r6sK3GShNEY3jlFDy84jOX9/N
 9BqOwpQ0XV+z/7vZB/QMm7XU/+b6QZlZFRWWnIyOXA==
X-Google-Smtp-Source: ABdhPJxREXPcn8pd0hBe7FkMk1MWJSUjjx8yeuP/812HVYhhwIKrKot/0JF8ioOqIqOQvrBDm8gybAJfE7Q1st8wVa8=
X-Received: by 2002:a17:902:c403:b029:106:7793:3fcc with SMTP id
 k3-20020a170902c403b029010677933fccmr3290089plk.81.1622797433383; Fri, 04 Jun
 2021 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
 <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
 <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
In-Reply-To: <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 10:03:19 +0100
Message-ID: <CAFEAcA9GM72tvOLDZfW=TmvV=DN1cAeXJ_MScWb3oivAR7X9LQ@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 06:26, Swetha Joshi <swethajoshi139@gmail.com> wrote:
>
> Hello, I have tested this patch with our qemu and it works, thank you.

Thanks for testing.

> What are the next steps for this patch? So is it approved and ready to go in mainline?

It will go in once it has been code-reviewed.

-- PMM

