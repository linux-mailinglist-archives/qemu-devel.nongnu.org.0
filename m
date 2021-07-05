Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805273BBE9D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:05:59 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QAY-00061b-Ii
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q8B-0004W8-JF
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:03:31 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q8A-0001TX-0J
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:03:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id gb6so12792516ejc.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=viGaPrwPRmGQ4jEkrgd71Q2v9IVY4KVegInd7a9aLVo=;
 b=j5OYRfQQ1X0iMIlvdiAnL8Jj+nXCUk0EZH4MHV4fD+0zK+cNaKd4QWwqgYvqktMSTv
 mO4zOF3vQPZOh7lqmXQYCaKBEQ3rlFYpMSuG0KFuc+AyZDVP/xO8HqkCacCIvXm+sgoa
 46KZzEH30OacffoavFrXPNx9OZzt2zNjyQSDBvIbrWjWr/5Qr04x2pp5xZqTgCzazmPe
 5CX9PNjZrNPjAJWXsYrvdmX1355aifYYoVCnD3g5DSU7C2N2Ju0o/kHh4PhaG+iseQjA
 5Az83EMM3QyM7R2QbATCCVx+gPCr0uQ4m3FNYxYA8Dr5jIfevPh1i3zsE5X+X6bHtmlL
 zROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=viGaPrwPRmGQ4jEkrgd71Q2v9IVY4KVegInd7a9aLVo=;
 b=laeTd+ngmN/5SJCu96Ij+6OAlcaJFkNJmdsVCwsXGP/GGtZgfeCar1D33PC24yo/wy
 FknBxueKz6tkgpqhYfKmf+hAQ7BdsQNIZWcGWdbKlaGqIaoaAL+r9t0PaZb4RXaewEqf
 FuRtAHpLBgM5o1WEZlsgcOpnxKygj49R9D5nSrkbA+JIJ7vlmFkKlL7MIN866XHgMN8e
 9ZXMnrEMBEvNFMh+dEqG8hFQ6MhAavUKb8kWIDZ2juABNL3tehB+dv8Z4iQY4t+kj2br
 ANA54Rq/rp11tWrCWS441e8Rhr009MHxlslWAl/IdroIqQ4L1Kq+AnPDh4i/MaF38FNm
 CxZw==
X-Gm-Message-State: AOAM533Ygm3tmRhmwpa+qh1k7bhQ5YN/Q2rWB43sbmaZ90um0Gq+mmAq
 nwvNY+yyNRdcIDj4nnzfsr51rq3yQbJTJNeW6kBW9Q==
X-Google-Smtp-Source: ABdhPJytJBhDDV2SkbdfTjYl5VagO5PMjhNHuhcKmNatxdjVVgO89M1vGN9ukae7prFzpqRHQEEPAbs/FxsqdfggZDk=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr13500745ejc.382.1625497408724; 
 Mon, 05 Jul 2021 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-11-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-11-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 16:02:50 +0100
Message-ID: <CAFEAcA9uN4gVrPPcvu7uUePrwyxbMvekwZREXhyoNU68iBDdnA@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Updated expected IORT files applicable with latest GICv3
> ITS changes.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

The comment in tests/qtest/bios-tables-test.c requests that
patches with updates to the expected binaries should include
the IASL diffs in the commit message (so that reviewers can
confirm that the changes happening are sensible).

thanks
-- PMM

