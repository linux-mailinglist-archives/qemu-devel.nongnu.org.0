Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE4B7A4E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:15:05 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK66C-0004Xr-QT
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5k3-0000yo-Gf
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:52:11 -0500
Received: from [2a00:1450:4864:20::430] (port=37766
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5k1-00044s-8D
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:52:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id w11so298533wra.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T07S4JHhtp008CEFdV/z8mu7sXcuQjmjrMpL3M/sk3E=;
 b=EOS1zmsXUXOWj20dnyzgn0EfdBJZ5Fw5+T35RRlqxajcnyEDr1kguR6LyTpb3lYO0U
 DM0BeR6h8D3NrUSZkkjFPVVlDg6I/D1HLkoEkB63/HjFYc87X4/FrMW2jX/dxp/atc3R
 2DPHbDlVNQ54hixwSDw9Q+rAhm6zJa4Ql+38PebyIsnQUOedOistfguSWn2wHWuurNUb
 bC8sTiDRdzJ3jbHD0f6kykl36GAvjouvMtskhE1N/TiZwCGpEDzvKA9fGK3C4pE1Pkx3
 u13ADx3IPm2F0gkHiEHYsZLdP4gh9t7yKEH8IwiDQOHbHOeyx2eyQgVZGjtEK092s9dN
 VXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T07S4JHhtp008CEFdV/z8mu7sXcuQjmjrMpL3M/sk3E=;
 b=jEnc3DDY5dwRb41/QnZDHA4gU6mX/w/OsBbah+KFLJ6gmQWEFufUZskvvmVBS/45cv
 QbHzgQIxHGKiqa873RjhuHiAT7AapTy6/gGFqYPEBJzp9RDGR3f/SHBLLReLqt+0iRKV
 38fMuAG7vr3ZfMdxVJI9b1TwfnhkfRzXt/aXPwCh+8MHJotzfPaJn9YFUKYAMajRf4D+
 0G535O3XoYFtpewbPYYizPUGQJEkf7WiNNkW/e9X6TL8zs5Qu+NPjGWML//Xk0BbExj/
 ZnuRRa3LoqEZJzX2GW9D91WPE9W67Mor2TCl/ddzRXTAuL4zk287C51anccQbkZ5NeyZ
 mqhA==
X-Gm-Message-State: AOAM531XabLbwmc3+4ebcgpC2WWbHLkMYMnz9O8pEO9/8wWpURO83Kyo
 Q6FfAN++SZrkBRUmLuBpQnTMpOgINTbJzlnRp2HvUw==
X-Google-Smtp-Source: ABdhPJyIgODgzgCYo5XBtTD9O6/9bnf7/2/8LieuUZxaOrNZRr53K2hXNKLSsrIJIEhinJsMK9NkqDVX712ZRaBTmFI=
X-Received: by 2002:a5d:4534:0:b0:1e4:9d38:2d4f with SMTP id
 j20-20020a5d4534000000b001e49d382d4fmr57174wra.2.1644961927988; Tue, 15 Feb
 2022 13:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-5-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:51:57 +0000
Message-ID: <CAFEAcA-4+F9uv-tG777tqZo-k1d6dg_NhPdQZ4cChTKpUT5TDw@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] target/arm: Move arm_pamax out of line
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly share parts of this function with other portions
> of address translation.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 19 +------------------
>  target/arm/helper.c    | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+), 18 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

