Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9D32512C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:03:37 +0100 (CET)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHEu-0006oN-SP
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFHDg-0005qn-BC
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:02:20 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFHDd-0008Ra-Uy
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:02:20 -0500
Received: by mail-ej1-x636.google.com with SMTP id hs11so9063740ejc.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJW+9vet3fge9zfwuuj7bLyOiA9MQVZdnOd51FsWXOc=;
 b=GJieJeAdAofnykt2iDUt+hizkgqjMpteAfwH6RdXugxP6PPMhcVrr939uyHwT/Qkv5
 FUUCXOWcLzkH1GeWen6Yfn7WZiGG9+wBGAOmHjwltvA2uEk7sCoCKXtjInmoPzRN1JSK
 /FLC4TIuHHMBrAquJtarrFbiF2TOKjKiSMQn1S111Tp0VU+KdQbzRC0480KEAisKHHiG
 +5ujAV0TGMQbOkgzHqSHxzvth34bnOC5L3+9RMmm0nBBzXCsum59N7IyG41fdTTc2bbx
 lKnQ3wbzAuWf1jbXj93Yq9ifXDfaoB5iuJgMXFQRd4mRcuR4HFJy7rUTC2RtgQe0kwSx
 /7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJW+9vet3fge9zfwuuj7bLyOiA9MQVZdnOd51FsWXOc=;
 b=kvxQEkWlwlKBO0g6keZfwA0ZInalcEfuf+JbRWVumrI+lbJYlh8BeIcz3fYyjr8o9M
 T40x4fgYD/L3Fz5ZbNPrDmNXCwXbuc/X6WXzoCo0nJL53DTDtZ+6VgDllnneIR25fPet
 77WpuxIdrU0TpcJfTxjraymPiq8hoyc4ljqDcz1SXnMs0uD0P/F0RAgbheWwKHxTI3IK
 SNQgV8wGNDyuwy9v5D4f8E9rchDDrPGA6ywq/MMSImIJz6FOxWrDUdJvBZLZu1Ctgxg1
 8EZFaL8jhBd+1ZnjF1UjOQ08+w0mhz7+Vz9QdK8uFmrR6urnC2ti5pR7XfdVZ+2f6BFP
 Zjzg==
X-Gm-Message-State: AOAM533O2ev/ZBIbDpieXbQ+jkEYLc9ZdNSF9FQR/Cli4m1QViudgtoU
 +vHt55aAy2zVT7jUGTNO8i085F7bX87CRJA7xFG8Rg==
X-Google-Smtp-Source: ABdhPJz2e1074qRWgJm0/Cq5HtkkcZa9icNd5DVKQYb6xKZph5fK7Iprk97qUKMP/2vfaCsEV/Kk062rP5oBDPtq23c=
X-Received: by 2002:a17:906:ca58:: with SMTP id
 jx24mr2803757ejb.482.1614261732597; 
 Thu, 25 Feb 2021 06:02:12 -0800 (PST)
MIME-Version: 1.0
References: <87ft1kqqsp.fsf@dusky.pond.sub.org>
 <CAFEAcA-NyQT_m37UfeH5KAQ9+dkNBHcQivYyrS4C9F3EUqJ+Nw@mail.gmail.com>
 <87zgzsb6xu.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgzsb6xu.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2021 14:01:59 +0000
Message-ID: <CAFEAcA9x9DV4Pvu7CifuHRXrqcgvPWs+wB5UUtcmrEK0G+3mYw@mail.gmail.com>
Subject: Re: Bogus "is either too old or uses too old a Python version" from
 docs/meson.build
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 13:41, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm not sure what could reasonably be done. The Sphinx test is just
> > "try building a trivial document with our config (which is what
> > enforces the version requirement)".
>
> This question is almost certainly naive: why is it necessary for the
> "trivial" document to include the truckload generated by qapi-gen.py

Because we want to use docs/conf.py, and docs/conf.py says
"these are the plugins we use" (by setting the 'extensions' config
variable, and so Sphinx will run the bit of the plugin that is "run this to
initialize me".

You could add conditionals to the conf.py to say "don't set the 'extensions'
variable if we're being called for the trivial document by configure",
but if there really is some problem with the user's environment that
means that those extensions don't work, we'd rather have configure
detect that and default to don't-build-docs, rather than configure
believe that all is OK and then the 'make' later falling over.

-- PMM

