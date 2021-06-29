Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA83B71F9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:20:08 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyCil-00077x-Fn
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyChe-0006RZ-4N
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:18:58 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyChc-0003Lr-AV
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:18:57 -0400
Received: by mail-ej1-x632.google.com with SMTP id bu12so36120859ejb.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q7ymVovJpzLT1RuPEDxeT5GMJMC/ewf7UQGXZY2T5Zo=;
 b=r3jtlGoD+5ZvicITOBPLHEz8eqcKOwbuxLdBPQ6QPmpLY6MOrJWkY9MUfMkbG5Yqzc
 Em9wA8gWe09USYXL6ET52z0bA//BhUZ14rcZ7TVKTPqTSjjOb6QVu//Yu1SU34Bk4KU7
 hhvNxNQJLxMP0qChrQKDdkE0f5JTclg908hTaZ2DDQE+S3KG6Dnm/+sCIgRVyXVpiuAj
 setiF7Rso/z72NmrhopT+dhWOU6xbBhNgHo0zGovZ6EvBGuL4M5bG7LFMaAlp2PGF/GS
 uXznU2yHlaXvFhhUg89bfGrllmXO3yBKZ8nlwdurvu0cOZ/dQFfNIDQ0oSaqjgG0lNp8
 B1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q7ymVovJpzLT1RuPEDxeT5GMJMC/ewf7UQGXZY2T5Zo=;
 b=JG85hqQnE1UgMj6HAkiXzh72/XAbwEnNL/gO+iKgB63OWGd1KhJHRCuiN+WycofTeC
 UmqCboWD2WtbgGcKcleQm3liFUWy9tSSRHYQ3KE1XQWHn9CH0rb1lKPi6sdZAcgeMa+x
 7rELMO5YKAh+jm4AJpA61Ha4iIxHe/UZmVf4S3yn9Y23FRsM3yMF9c32a2yewRn6KRIz
 F2MfW2QjYwjJK9cIbV2S8FnxwvBI3fc8VdUBzLh6M3IGZwNxRij2X3qFHWqO7z9vLGtV
 i9yOku2if1zL5I1ZHZYhJ5DepKxElGb64nuigQ+gJ/coH93ABQdU7dhkbRm0RmzE3irn
 22aA==
X-Gm-Message-State: AOAM532BJtXqVAHzz3kdgBd8c4YF+cW+VGtLclpGOJ9s+0R1if4ikPRJ
 NZ6v03j5/MDBQCMQuNi0BTzzR1c5bszM2yLXTMBhoA==
X-Google-Smtp-Source: ABdhPJxIontzfGBYJQx2UnicIhfozEhJNX0V567NcrACkAB7ixmxRoYJoo8hziDSfpo3LzZT66ENB21ElB5sJslKPd4=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr29232517ejy.407.1624969133945; 
 Tue, 29 Jun 2021 05:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 13:18:17 +0100
Message-ID: <CAFEAcA9aVKvUM0JKk683mzBQnbAj=g=NnqwqQ-ANXO17ntNbBw@mail.gmail.com>
Subject: Re: [PULL 0/4] Hexagon (target/hexagon) bug fixes
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:08, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210618
>
> for you to fetch changes up to 13ce2ae03000137e1de8d40ff7ceae46fcb34cd5:
>
>   Hexagon (target/hexagon) remove unused TCG variables (2021-06-18 13:26:07 -0500)
>
> ----------------------------------------------------------------
> Fixes for bugs found by inspection and internal testing
> Tests added to tests/tcg/hexagon/misc.c
>

(Philippe kindly reuploaded your gpg key to a keyserver that I could
download it from, so that part is now sorted).

This fails the "clang-user" job on gitlab CI:
https://gitlab.com/qemu-project/qemu/-/jobs/1385267038


../target/hexagon/genptr.c:30:20: error: unused function
'gen_read_preg' [-Werror,-Wunused-function]
static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
^

(Clang is pickier than gcc about not having unused static inline functions.)

thanks
-- PMM

