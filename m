Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938244EB49F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:21:27 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZILG-00061u-74
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:21:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZIJ0-00054k-KA; Tue, 29 Mar 2022 16:19:08 -0400
Received: from [2607:f8b0:4864:20::22b] (port=41960
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZIIz-0001SW-84; Tue, 29 Mar 2022 16:19:06 -0400
Received: by mail-oi1-x22b.google.com with SMTP id e189so20164663oia.8;
 Tue, 29 Mar 2022 13:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urTmgRq694LEmnMrwqVJ911oJM64xPzpZIcOLN5FYt8=;
 b=ClcLmguVG2IQf5qofUcreP7HZymP1NUafnnlRcLT3Y/JKCzefaSMyDi+s1AZ59BCDE
 jOFnGtHehMdBwCF7Hcgg7kr0GgcDcQekzyb4rShLqA+zPsIaffhE+Feox6srRkDqIosd
 WPUOVCPBTdI/f1kSlq3+uZtnjQnwV/7uwkDfBWuMxJOIWjGmZWcpVzUyWrZZUPdj78fy
 LxtKNRIhfNury6FI6oAj6NvXrvuyoTWucLpXKfQuLex32vBLG1lsj+We1suoB95O4nGJ
 jAF1TaLfQY0yj0JHDVGGMs7oDBUsufo5h9XSEs4AyHhDYWtVAeDrpbef4Aj4I+zpDEse
 x1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urTmgRq694LEmnMrwqVJ911oJM64xPzpZIcOLN5FYt8=;
 b=lt2lyND1RfYsQ73FKwknzKOCcfpfnfAN/MHwCjcCfWS/hSi2OHq6N/bUzKprMA6/Po
 FZUzMBC353dMlYT1OB1L555Qq3VN/asqbpIRLnCGEliDHFzjGF3xOxRjek76FXhLGB77
 e/JSA0fFWyRtTuneYy1NU0k2Y59KAi6fXM3sxMl6OUFd/bgSihHr187JI8w7c1Mj6LGy
 qjkPmoec5f30Q9cq0Rwf7crHpgAfw/EjNNdRUSLsuaxXNL9ROgh/Cseqy8wzRNUGvz69
 ATmvNUznrrQCARQsgnozFjj9AriEb5KmYfUIqv9uBE4TK41IeBIo6+3Ql3Dmbd4mjZI7
 PBGg==
X-Gm-Message-State: AOAM532LEaUSJBDIYm4bGm3zM705YeuKEU27splfp3GgCGRF1NPis6VQ
 ixZUCP7mLl1t27jOguAoTbB+tTyJKqGd2rWZ4kxEfEB+6D1kMw==
X-Google-Smtp-Source: ABdhPJz3YvtV1ZbE+MwfyHCfkVjuTSPNCgsah/2p5bNf+8iqg4vJbEymrXiTPvqEcxh4hfbZb9Xz0usU5Lo9Z0Y43Qk=
X-Received: by 2002:a05:6808:2008:b0:2da:5b12:83ff with SMTP id
 q8-20020a056808200800b002da5b1283ffmr466436oiw.216.1648585143181; Tue, 29 Mar
 2022 13:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-4-idan.horowitz@gmail.com>
 <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
In-Reply-To: <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Tue, 29 Mar 2022 23:18:52 +0300
Message-ID: <CA+4MfEJDvN5aRf-RnmxgUqOt7OcG1Dzkte5zV=7oFQsTN_zVLA@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: Determine final stage 2 output PA space
 based on original IPA
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=idan.horowitz@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 22:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> I believe I follow: because the walk uses walkstate.address.paddress.paspace, the ipa
> input parameter is unchanged, and it is ipa that is passed to
> AArch64.S2NextWalkStateLast() to form the output address.
>

Indeed, I initially found the issue when a test case passed on arm IP
but raised a data abort in QEMU.
Since fixing this issue solved the inconsistency, I believe this is
the intended behaviour and not a spec bug.

>
> r~

Idan Horowitz

