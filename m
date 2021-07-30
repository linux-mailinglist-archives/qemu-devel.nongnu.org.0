Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07A3DBE31
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:15:23 +0200 (CEST)
Received: from localhost ([::1]:38854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9X2Y-00033i-5m
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9X1c-0002M6-SP
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:14:24 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9X1b-0001Ek-4A
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:14:24 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hw6so4436890ejc.10
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPKlkhbuv3l6vSIlurAJUQ1aaNM51rxliVgx3fbgkK0=;
 b=X3ERV3BDlFen8V0QaKDc/IF0VaNBtXlke3gS/tm8bsX0QFKM4U1+1Y0s6E/8Io9J7d
 WZRnuPmx6J9LjK7K1ZmT7C4gFXdvoQ8nBZm6fKdsR5t9rtMt/AIZjXJzt97CC/B4K9TX
 mjGq5MrrOSkPKqUeSKEGU7u+2rSI/qZpy8MRoeF7Wx5TFta820DV6vYljhCqGUXHVKoY
 sUa3l9ph3BMpe6wL60PKwQXbq9S5WGW5Ku+JqU1DEzBQg62aCUa2g0Ek1H8uFHFBBFb6
 DCu8+GeGsTk7lc+jTdBs1zKnPuuvGtHcEPBdCesrZiVTpBBntvuLUyWfYNpq60vr4ViN
 ks9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPKlkhbuv3l6vSIlurAJUQ1aaNM51rxliVgx3fbgkK0=;
 b=tvdrQoOZwpESpGoQIFR/jAupDVi7IoYyxkhQMrcIJcsfBokjZSujUxWFPfbvnETv2n
 uEPA87sbbI51v+OPqmgX4Marh7me8ekjL7QvflhdHsHbWv44QRgy3Z5wSO5ql7oYmTC3
 CPzzhs5eh25N9TfXJvYK09DpOR2E3/D2+CBMB87/UmdDLEI/8I9yjjNyblKpfpMkcYMh
 BBjh5nsn+o93w8CwWaPku9RW0fNZM5EncP/A7hx7UvTGOf0fw2TtE2LyuEK754sG9W4L
 4OFLYWQY/W3O4RD4NGil1otXodpHoxHU5dYJXFNS8LXSQQT2LL0hd4N9Rabotpntr9wQ
 rW9Q==
X-Gm-Message-State: AOAM5310iFml74lftXveJ7FkCm5KqkoAKwpBh0hasID+KGY2CqC56oRh
 xGnFISkCfafHfWJzE9AsPcFm+8DcRxewWMNaKpVpRA==
X-Google-Smtp-Source: ABdhPJxhZ1rBeCL7TwJhsQyuiBuP+qXuUcKtY8V+mXgt25jzxw1j50Vd7o4mmDT6CjyR7YOhVIpL7Zvqobx/zdwWH00=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3723108ejy.407.1627668861347; 
 Fri, 30 Jul 2021 11:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
In-Reply-To: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 19:13:38 +0100
Message-ID: <CAFEAcA9QexXsrXMHMQrS-aGNbA_4_G2CB+9KeRJqMEF5LQ84ig@mail.gmail.com>
Subject: Re: QEMU on x64
To: Christopher Caulfield <ctcaulfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: alexsmendez@live.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 19:05, Christopher Caulfield
<ctcaulfield@gmail.com> wrote:
> This is Christopher from the debugging experiences team at Microsoft focused on kernel debugging. I am reaching out with a few questions about QEMU on x64.
>
> Is it possible for the QEMU-x86-64 GDB Server to send the full set of x64 system registers (whether they are included in a separated system xml file or as part of the core registers xml file)?

Do you mean "is it possible for somebody to write code for
QEMU to make it do that", or "does QEMU do it today if you pass
it the right command line option" ? The answer to the former
is "yes", to the latter "no". (If you want the debugger to
be able to write to the system registers this might be a little
trickier, mostly in terms of "auditing the code to make sure this
can't confuse QEMU if you change some sysreg under its feet.".)

> e.g. System registers missing from i386-64bit.xml file

> DWORD64 IDTBase;
> DWORD64 IDTLimit;
> DWORD64 GDTBase;
> DWORD64 GDTLimit;
> DWORD SelLDT;
> SEG64_DESC_INFO SegLDT;
> DWORD SelTSS;
> SEG64_DESC_INFO SegTSS;
>
> How can I access x64 MSR registers by using the QEMU-x86-64 GDB server?
>
> #define MSR_EFER 0xc0000080 // extended function enable register

EFER is in the xml ("x64_efer") so should be already accessible.
For anything else you're going to need to write some code to
make it happen.

>is there any plan to support reading/writing to MSRs via QEMU-x86-64 GDB server?

Not that I know of. We'd be happy to review patches if you want to
write them.

thanks
-- PMM

