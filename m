Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7CB1AC22B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 15:17:50 +0200 (CEST)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP4Or-0004h9-Au
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 09:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4Ne-00048g-0T
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 09:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4Nc-0002cY-JP
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 09:16:33 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38541)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP4Nc-0002c5-Bi
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 09:16:32 -0400
Received: by mail-ot1-x344.google.com with SMTP id k21so3013000otl.5
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9OFyrGh0eE1YABFUF+nwyRCn1JfdgbcSY8EmfJuFtc=;
 b=vlhGFYIe6ysFjF3D2qEWeA1nBBEqJv6zaZGPc1YCcMuVof1r6ZdHL2mbSS/Mkx92L+
 8QtsSwRz1k+EKtXj+mt9ScO/yKbxXfkYcDBvhhgZuoLia7S+hVCL7MbYAzSz5AjP2Hpt
 /YRscDG53218V0kg7qoUgqF5ZkscgPvTCzlBcsC0yy6MSzrwlqQDH7UY6DDtXms9RaTI
 yBi7e0Pn46KlUWTiqglu4fraE5w8A6LRMa3NiwZwSZomMP4fM2wd4UX6fi6wjTAq8cqg
 FVJLroT+juqzYxRFg+4dBPKL7g8fntOtcrEhGS5ypvZPPd+RmkBnQW+m4pFSFQ6GhY/i
 z9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9OFyrGh0eE1YABFUF+nwyRCn1JfdgbcSY8EmfJuFtc=;
 b=P1KTVX4qBzlEEM5GiQ+3vNtRtwBl1kBj63zeRvmz46xSkB8t/ycsKiZrp7mov5QWdQ
 PX9AbUWE1M1+mrQzRMBSDqQ0fCskPAPaOXboDrPYEFA5OG+5/be3H/IvGQT1KsU+Kvnc
 dDicTM2c7PVPMB5o6IKIlFxeRaszf+q8K6EY7vvuLGknHLGopGflo7P4lY6sqv/AwHVz
 jLYw+LYyK2Mfgmf5UM7hbAzq+2HT0WJyjgF+MjaKlvbbbVT6tvoxSXxvRo1FsXA/odWM
 hupkl5SKCNwxT9slP3vIAemgmykd1p/GmUVcKKVuaP+a+QR91+60mAqitXePZDlL2c4K
 m8lg==
X-Gm-Message-State: AGi0PuaBmCxIhsakF1AurNOzg+PHtOAtYY0u/RYtj//j1qizmwyahDG0
 chC/x+UF43eTiuK254//zY0blccGdij5MuayrHWJFA==
X-Google-Smtp-Source: APiQypIbhW48WSHaHoOLpCOkYM2GHoFKJqeuBCMua2gSv/d10xDorHFL01vJ0R9f7xHwZYUqPYlXZAUmNqwkw4Q1q6U=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr27010878oth.135.1587042991330; 
 Thu, 16 Apr 2020 06:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-8-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 14:16:19 +0100
Message-ID: <CAFEAcA8K1A00YKQ3VH+0=3M3j_JjTV-pEtqkNTWvft5tUoNs9w@mail.gmail.com>
Subject: Re: [PATCH 07/16] target/arm: Adjust interface of sve_ld1_host_fn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The current interface includes a loop; change it to load a
> single element.  We will then be able to use the function
> for ld{2,3,4} where individual vector elements are not adjacent.
>
> Replace each call with the simplest possible loop over active
> elements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(I haven't attempted to verify the details of all the
arithmetic, but I assume you've tested it all...)

thanks
-- PMM

