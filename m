Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDE48B18D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:05:36 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JeR-0005aw-8F
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:05:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7JaN-0003bq-7I
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:01:24 -0500
Received: from [2a00:1450:4864:20::42b] (port=35484
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Ja5-0004Lp-J5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:01:20 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e9so32345267wra.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RZBQQArw+L3ctBf/pcmJn02W7EYSlng3Y7tCjt027+Q=;
 b=M2dSfudkjfNlsChwY6JJFjs1ix/S5cp7jGPHL7wLNvzhIstF78FNqg8Xtao3+IWFiL
 VntmY0JTiNe+mZi4jU7d4airvS4YSddop9o/8aRcPdfjojISdbXRReZyZkiWlVz1vo9I
 E0qNit2Cncvb8S79T0UMtw2LpilIMGhtz5f8lqFKPzfBabwuXxHYVW3kmmpwoP5CBk+n
 +libQc1z3Z75FTRcAQbDPHna5uX5ncxyc42eHKLa7wwTCPlLERR5cZ+ojktAivyCZsC0
 IGRrB8hn3rewIr69cRm3djzECpPkjFzvq/g2MzU3WQYwOBc+Ce2avr3wEkjzo6VD+rMm
 /M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RZBQQArw+L3ctBf/pcmJn02W7EYSlng3Y7tCjt027+Q=;
 b=0GFkx0VgiqkcEFlwcFHx78TUXktSIbafYK6U4d5I7/CyCS2A3i2YqAJUZ9pd3/cb6O
 leejHzvvxhs0piUVti2ug0vV52WeVVMKgbTWk1ZeOGIIJjpuGV1CLRs5/KglrpPyi/gP
 WmpHwdetbsa6BTLPjnPt5eCSY5eWuUxhS3000WtrHDTc5lkKG6ftVTtgxpIwv2Y1TyLE
 FCQZtrHNSjuFYc1S8y28gbDfMUDxZDYaKryBdHaccMpfRR7Vh3UjXRzJLV0wVpRfmXdK
 Ya7YYSjfzQB2sD4kpjzrh5TyL11/piXON1jgp+9pJrKeeNtpffIQyF3MFeD8qUkW+JW/
 jp4Q==
X-Gm-Message-State: AOAM531P6yaVlacTw4PLRui97HLuGNMBNPsSTBl44kwffdtSH6wUKjpy
 Ol7Ib5iwyEGw4YRvepOz3QjEFbxFJyTSGZxk21GDJw==
X-Google-Smtp-Source: ABdhPJxiATRmvJS6Bi9gKE82cZSOpUXEBW7TP6MAau5s4+dgV4S2TFvkp2goX+gDs9yKNk8gPMXplBNf/e+ntjM0o08=
X-Received: by 2002:adf:e907:: with SMTP id f7mr3657783wrm.319.1641916863877; 
 Tue, 11 Jan 2022 08:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-2-richard.henderson@linaro.org>
 <CAFEAcA_rUX9pU7mZQviGcxUAnNUib-ZzfKzzLe-3NMfACg-5MQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_rUX9pU7mZQviGcxUAnNUib-ZzfKzzLe-3NMfACg-5MQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 16:00:52 +0000
Message-ID: <CAFEAcA_SitJo0TL0be8oHi2=RcO62s_+r2cNscAASd0QRNc_AA@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Fault on invalid TCR_ELx.TxSZ
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 at 18:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 8 Dec 2021 at 23:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Without FEAT_LVA, the behaviour of programming an invalid value
> > is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
> > minimum value requires a Translation fault.
> >
> > It is most self-consistent to choose to generate the fault always.


> > -    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
> > -        max_tsz = 48 - using64k;
> > -    } else {
> > -        max_tsz = 39;
> > -    }
> > -
> > -    tsz = MIN(tsz, max_tsz);
> > -    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
> > -
>
> These changes are OK in themselves, but we also use the
> aa64_va_parameters() calculated tsz value in the
> pointer-auth code to work out the bottom bit of the
> pointer auth field:
>
>     bot_bit = 64 - param.tsz;
>     top_bit = 64 - 8 * param.tbi;

...and in particular, for linux-user mode as far as I can
tell we aren't initializing TCR_EL1 to anything particularly
sensible (we set TBI0 and leave the rest to 0) so we are
effectively relying on the clamping there at the moment.
We should probably set TCR_EL1 properly. (cf the user
report in qemu-discuss just now.)

-- PMM

