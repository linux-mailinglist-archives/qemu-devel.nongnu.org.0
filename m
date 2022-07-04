Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0765657D8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:52:37 +0200 (CEST)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MVA-0004Ai-0C
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1v-0006MX-RW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:22:27 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1u-00032T-CB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:22:23 -0400
Received: by mail-yb1-xb29.google.com with SMTP id j7so10518820ybj.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Q27uk8pvJmbxB78LTaAXQW4xiRQyEv4vKell8PzJto=;
 b=CAASx03rZBnkjx6dOnf2jNkT0QjDwmTM+FOIaQKTANGyKt17Bd/bLEEd16fw56BjJ+
 2NhBp+ScJYw4u77P5F/SE/wiM8z5g/t+mfBjfTZ/JgMRHdv95IyZWkIJaDwtVDH+/TeW
 qZoGDewv9zMYmJe3U2qgP3EpweA/Plf3nzvpf5GvGu0F6XIAfSEur184Mt1762YihChN
 TLUcUAykfC+elvy3f3s06Fl0zSAyJsfHl3a9EXc3GLT6uQbx2CJq5U5m+bVk75V92SfB
 H5/gc5DEXNfhQjNrYNDWj6oDHRq0rfXmAEwJsPFEXwHnuINqHgFCHFAqw9mu9Ja9p0Cw
 xxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Q27uk8pvJmbxB78LTaAXQW4xiRQyEv4vKell8PzJto=;
 b=zsOt9zqDKE/DBDVUO7WA4zAwzFvRm6kIzesgGF3bLbuGa0FdEQH9MjWb60D9HHKCLW
 BOJgKqUAGk6kZi5E472LZka6CvBjUfUuEK+pIaLKK8iUO3sGMvsJ8oA6IJ9O15/XoQnq
 VJio8wC15/1PcJezIf+ZiZldv0WBs9/5tMes1RjUh2X7QDcVIXueDL++2sF/l8+Kiqew
 1VdQ92wrRs0o51J+unwT2H2bPTSuVWXYT0Az0wgjZ8jUWHJrDKwPqz7w2urmtFhQr69t
 Lyy9RVAoaSXa/ou12wn3ijOgpDr1OpXppuqk6OtUmX2JCdc8KoV/tsCUFYVj/hmtNmVA
 HbRw==
X-Gm-Message-State: AJIora/KYtMscwIANaHQH3w77Z7ag6V1PbadMx6HmDiDxWUVsXr1KP0L
 2psrydayiDeMMOvurg0Ncf6tknmRNgbesZCKCZ5ySw==
X-Google-Smtp-Source: AGRyM1vnPzI9BLjo9RLCMW78VahhlD/gBXRhuCBJ9566UVuaR+Els6LvFq6Gy8/yzOhUv2/sqTk6ykUKGfyNkSneobU=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6165879ybu.479.1656940941305; Mon, 04
 Jul 2022 06:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-15-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-15-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:22:10 +0100
Message-ID: <CAFEAcA-fBs5uXx1SdChkfNEAMT5HabMYA4SspCZ58hAZ2OATvQ@mail.gmail.com>
Subject: Re: [PATCH 14/40] lasips2: remove legacy lasips2_initfn() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> There is only one user of the legacy lasips2_initfn() function which is in
> machine_hppa_init(), so inline its functionality into machine_hppa_init() and
> then remove it.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

