Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C5363E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:20:33 +0200 (CEST)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQ51-0000ii-9a
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYQ3X-0000Hm-C7
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:18:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYQ3S-0005sR-BR
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:18:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id r12so51804070ejr.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xqxo4dkLef72zkgngAHolqf5qMhHwtMCTBSEolKZspM=;
 b=g5KudRU/27uCPVep7yKVRoZz5Krw4tI9c19KGRL+ahD20/p047vxU8YlW+zrdu2H/m
 qC+2O1jvajIwuKCguUHfN+WCvghpcZS2N+OmiJJqV5JGXJcUGfWAgeDsLeJdix2Q8nMK
 HvbBhy7CI6xiPmyAd1XxG2J3AXgiD4AwQbT1hG7VOgIouxCUhpxxwWOzRxbqt2XasHQO
 AiB2jrPvB/IvE23xiVLqgUorwCpwxhlAhUTySTV9N7bKxgJ1ZBZ9XOLzYP5qrO66ipOW
 ab3OSeDMyScUF4DOpObHgSv46dZIbYxPYIUjTDjKsi4+3HMEdNY1FlhrmjYaL0t0xlnh
 Lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xqxo4dkLef72zkgngAHolqf5qMhHwtMCTBSEolKZspM=;
 b=EGzdfc2WpUNwjuCnbbh02u7R7jqE/nRStlwDbhaEWaNfdl4NQ1RHilksDUzA5usFr5
 IyY9gwRAibRK1yEzGHezj2AwNE9IKJvBQ1blndybtcJSYtj81sOMg7jnwHtvezSSnclp
 5kqBgraenqxjJj1WM5oK3AfSXGWVZbxlRKoPSP50XN2H2Z2Zv2EqJ44N7Qh++Md6xU4B
 YW9GBNLHmJiqGF67gUiAOCD2cEDFeMvHZQ8Hh5bMf00Lv+UCK2wsXtft50eHChPMIAvE
 3A7gZzA2BSwaxKOx9wQSfRO2+XrXhwuLVO5FDwMJnR/S7sd/pY/fmrBvgUywsbqjWQ29
 rh4A==
X-Gm-Message-State: AOAM5304/h7di8HmqecMYUsoZiCdyCWNxh5s7dSpaHWuq7eTYd658xdP
 Gd2UX9J1Fu82Tjx2PIfENY6y3Jj+dknu6tzP4LTTrA==
X-Google-Smtp-Source: ABdhPJxUZU5iu6zihfC1DtoasAsJF/2K5JEULvi5SPBcc9iE/zfp190OwJfei7zgG/IqAO9zXT7J2ZFc08CYNMQzXjA=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr20897016ejc.407.1618823932157; 
 Mon, 19 Apr 2021 02:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210417194205.17057-1-peter.maydell@linaro.org>
 <87tuo38sgg.fsf@linaro.org>
In-Reply-To: <87tuo38sgg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 10:18:01 +0100
Message-ID: <CAFEAcA8EBz4JAkyYn-iEabh7ByceOw62sN7LYCZg_gneg2w64g@mail.gmail.com>
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Apr 2021 at 17:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > This pullreq contains fixes for the remaining "not fixed yet" issues
> > in the 6.0 Planning page:
> >  * Fix compile failures of C++ files with new glib headers
> >  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
> >  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
> >
> > None of these are 100% rc4-worthy on their own, but taken all together
> > I think they justify rolling another release candidate.
>
> If you are rolling it would be nice to include:
>
>   checkpatch: Fix use of uninitialized value
>   Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
>
> just to avoid the messy warning in the CI checkpatch check.

I always ignore the CI checkpatch check in the github UI anyway :-)

-- PMM

