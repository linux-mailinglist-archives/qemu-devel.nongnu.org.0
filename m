Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647BE544D25
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:09:41 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHuu-0008KX-8T
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFUQ-00034f-VD
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:34:11 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFUP-000349-IO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:34:10 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v22so41050939ybd.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uRb7PmZE3RuSstYmmlRwItu/snfK+tY2cVnZPRJcQOw=;
 b=vphnGUAerxAOmuYxmL2Cyi3yDEHP1QTYsUzzvVZr86+QEb7rAkEGSc5Obl8MPb40MO
 TIsaHgTcB7z9rIb/bdq67/oBp4Wicx5hMdYwH3RR3y8HjYdusjw41fswfWmgg4/JOWxh
 bniGvx1arTqJQ/UkmlUGTod2DUQuKlb/nYBCf06czYk1S5OOWHpn1tGzG5F3g91hqza2
 fIBCjWRW9gMNPBtZVWxoCbZzsAgfKxoglE2PaxRXJ4saG1zxBZs38E+jC2xUBPIVkQcg
 TS29Px6TOGe3mtaiuOYeQpUe2LQqapSxqaye1HqiSgufSX7bUDYZTSjJxjFZpqeBysZT
 ROjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRb7PmZE3RuSstYmmlRwItu/snfK+tY2cVnZPRJcQOw=;
 b=ipkiYV0xBCLh6RIyUprYGz/DOe5NPzRcvYOakSLwqPPA+ezOqKAoXO9GQe6dekkJMW
 aGfRFm4BqsCPR/7tVsehkRm1uHeDTKmbi6khmh1fEq5R+W6ieHYDOQuQ0Ok9zfnUxeAs
 ufSrC/Wb56h5FR9PinbmYJU1j1r0xlzy7wxmbGb7tWDOf1dlow74GqjIWj5xWgkuOlDP
 nBvn2Grf6YAvguhAm8EcSKTzEIHJrmceRWtOlX6rg64t1oKQG4f1mktgMH7Q+2b2Iyik
 TmckR+IjHR5z93eZT7Sb5DCyGnMZYt91j4uQFxO+zo9dYW0krF72CyL44F4hhLAvckYj
 tvJQ==
X-Gm-Message-State: AOAM532RQqORZr5yJlsIRT+0c0taXy0q6a9GsPJ5a50kzFcGe/eh05RN
 TJyZ1cH0EwuLrPSlPfPtkM1Ck34FCrnuJHfmnVPIbw==
X-Google-Smtp-Source: ABdhPJx83KKFr/1oRZRiHCKpjX7UmoUrQ1jTbIqJLNR5HQh0AhuuFeliCg4flppgc48NzFFdK6bLG3IgsKKY2bT1uX4=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr39160408yba.39.1654770848523; Thu, 09
 Jun 2022 03:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-2-richard.henderson@linaro.org>
In-Reply-To: <20220608023816.759426-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:33:57 +0100
Message-ID: <CAFEAcA-Y05Tc_BQgqyn1-2RS7sbbKC=U+mz7Z+JQ1fC7Q5wt0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target/nios2: Eliminate nios2_semi_is_lseek
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Wed, 8 Jun 2022 at 03:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reorg nios2_semi_return_* to gdb_syscall_complete_cb.
> Use the 32-bit version normally, and the 64-bit version
> for HOSTED_LSEEK.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

