Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA635417B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 13:18:41 +0200 (CEST)
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTNFg-0005y6-5z
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 07:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTNDx-0005XI-46
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 07:16:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTNDv-00047l-Dx
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 07:16:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id f8so8141262edd.11
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=No5lFfJegCygv5vY+fc9sWnFUEDe7lvEgx6EvwjE9Q0=;
 b=snZkQFFramRaBuGEO6dBD6JmuGN0H44OFWddx1xMbOLLG9fh5SbZPsMLGDrMNBCMll
 Xj5wiI9qL8arbDWWUMVqcn7nMVf1Ea2d0BqQT5Gu57RlTpa79IG4sAPIdXosm49Zag8Q
 sPMTTd2B/v5U9Cc2s0v7virq/3AgF9jlmjeLSWOp/hE4laTFXA4cIglJqW30J4M6ofkV
 1uuf1YHOu4VU16Tk68nMfpjzXqxyOtfPi/i8lclIY+HNFoCYcYsmwopTavyQwHZU3AQB
 3evzcE9Gyj/nYezSB5NbidHTJYtoO2hIwCZH2aVfYjPF1cIp2xN1dzG6zvLGLRZGNDFY
 PaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=No5lFfJegCygv5vY+fc9sWnFUEDe7lvEgx6EvwjE9Q0=;
 b=ZI7k7T/7PUtTSlMtIGIIWVv7z1oZ97qCIS/w5NrG+PQ+6zvQZF6xIvoSKnhJ+kwfXi
 8JGge5AN6g07t02NS6W8/PaFJjS2pcW7B+xcjTIMhIOPrC/za8bRQ2oKRVNcM9i0Dl+c
 ALDAsZ90B0RkRraov5NylDcbKOCvIrroP3JvGvnB90Cp/OFmMOaD0dHu8mT6xJkEGou8
 IiUXBjPE1FgCRiXEn483TX/wXZPKuiSe9Xuo86zguF4cJbrle3bBNtUykFByjPAinDdc
 uBSJdJnh0SThU9msF4GjqJVLC/mwoNxZA2OsoV9vMNOw3BWEqJYnvApMOssnRpg/ZycS
 4WdQ==
X-Gm-Message-State: AOAM5335ZAIVtc7c7j6LU9Wrf+o8qrld0xaY/38XrYOH2NZyr3uuOlE9
 6j5l5SsUyCZBDYNRHCiSHF/6xLz10j8pAIOWTEtkxQ==
X-Google-Smtp-Source: ABdhPJyaqEo4oh3tnQmavltaYeXlJTaiv1a4lj3iRiRqiAMhOW6ZpoLwP7Ul+EPXhpnM3p+spR7BQ11LtOgXzSFBPHo=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr30382920edv.44.1617621409934; 
 Mon, 05 Apr 2021 04:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <33e27175-688d-3f9e-d999-cda18122f3d9@gmail.com>
In-Reply-To: <33e27175-688d-3f9e-d999-cda18122f3d9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Apr 2021 11:16:12 +0000
Message-ID: <CAFEAcA-vkEei56zGpa5x1kqcZA1-_d__34LxNdVkS1+LP86NSw@mail.gmail.com>
Subject: Re: qemu-system-sparc64 instruction set architecture compatibility
 (sparc v8+ vs sparc v9)
To: CKIM <sgplap30@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: cheolyon38@naver.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Apr 2021 at 23:26, CKIM <sgplap30@gmail.com> wrote:
> I have very old binary (testgen) which was built from old sparc station.
> (no source code)
>
> If I run "file testgen", I get the following.
> ELF 32-bit MSB executable SPARC32PLUS Version 1, V8+ Required,
> UltraSPARC1 Extensions Required, statically linked, not stripped

You don't say what OS this binary is intended to run on.

> I was able to install most of sun4m / sun4u guests listed in the wiki
> and network setup was also ok but none of them could run the "testgen"
> binary.
>
> I always get "Cannot execute ELF binary" error message.

Are any of them the OS that the binary requires? You should
start by using the right OS, not by trying to test all of them.

thanks
-- PMM

