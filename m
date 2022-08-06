Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35258B646
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 17:03:26 +0200 (CEST)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKLKn-0008KG-B7
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 11:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oKLH8-0005nD-Tv
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 10:59:38 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oKLH7-0004X8-DT
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 10:59:38 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e127so7700521yba.12
 for <qemu-devel@nongnu.org>; Sat, 06 Aug 2022 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=7aEbHqYQJMcdlDVXwfS/AhAw6kMQ7zNZA1Sag8KdMA8=;
 b=M8YOfYFRb1Qm1sAXK9DkAe6mYB/8SmPNGlwTgFVtcIIgZYZHAPZWcmcrFA/kfn8Lwj
 6sCwnAdTpCZmDlwhvfk8esJ520L9PrmvKHY0NB0jJBqF3g89MaYMqOkRFwX5IPmyQktx
 vsBqnhuzaQTflWOSWRNbo15Lc6NdJrh2UF93uVKnN8FL9L1u4sNTmRvYMrpNczczZm1E
 NzBSOlJXI6Esq1lQrZQvOHlQAwkQf7St16dWttm/pvA/zvxSs9y8wDb3G8TtP+WM1/Mq
 xxWsr5nozg8tpVTJ/2vriZXVaitsB5WgiA1s8FX8YgL2hpL5hc6kHzfroiU8P3SZ9AgS
 C/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=7aEbHqYQJMcdlDVXwfS/AhAw6kMQ7zNZA1Sag8KdMA8=;
 b=TkyERhzX+qaIV93nnfLhv6Dn3QO610/X/nZt1KLBcNQG4/enPFYH+ZzsqRG3X77STe
 qVNOyBNjXvqkSoPIVjFwdiYAFxcaNOS723PGHuccoaS+fbO0E1S0SYwu2ophbqZsoHw5
 cQzTw5Ridfhk16VJIYCJkTOisWMjlQJRa6tYjvLMcTSDCnJSdkObrxpkz8VS+86JApyZ
 Jv+YW8qknpYEElb5PWnK36GifXF7HdtrXzEqqZmxHnCI45bp4aVET7a/Gd48/GhqBUzS
 KzzfCgz5NYWfaVqmf6Id+FBPnpEGpBf+9KhO6/vmCTJLP5lHkgb6yIlTBkCr0eyMcoPj
 uIBQ==
X-Gm-Message-State: ACgBeo3/ppZJ3U//MB7ORgoitbDtroAus1NlX2IGQvaoSKI3I6aTXvFL
 H+Md4PzvRF9HqjK/7MiWZ9dpwqJmJPG0vOuUWNaGXQ==
X-Google-Smtp-Source: AA6agR5koscvsBhr9R/i4IGE0q7hvO0GorHbO3PzoIHNkPLVnte/dNmgxI9EJKIy1GL2Ag8cAzCHR9VtCOGv4jzb7pk=
X-Received: by 2002:a25:2f47:0:b0:671:8223:4325 with SMTP id
 v68-20020a252f47000000b0067182234325mr9152792ybv.67.1659797976315; Sat, 06
 Aug 2022 07:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220805205435.139286-1-danielhb413@gmail.com>
 <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
 <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
 <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
 <1ecd8b2-4ab4-70b1-c5d3-7c733d8ab42@eik.bme.hu>
In-Reply-To: <1ecd8b2-4ab4-70b1-c5d3-7c733d8ab42@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Aug 2022 15:58:56 +0100
Message-ID: <CAFEAcA8GrZO6JtdBJbP4r-Znv5kNSROtGqkpOUo5kJoGsVC_yQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Aug 2022 at 12:24, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I may look at it later when Peter's second patch changing
> this code lands if there are any cleanups possible

You mean the 2nd patch I sent in that RFC series? I'm not
currently totally sure what I want to do with that. Looking
at the code and at the docs that describe how the device
works, there's definitely quite a bit of missing
functionality. So I'm sort of undecided between "do a fair
bit of overhaul to the device to fix up the more obviously
missing pieces (but without much ability to test the changes)"
and "just leave the code as it is in git at the moment, since
it's sufficient for the only guest we know touches it to be
able to boot". What would you prefer?

thanks
-- PMM

