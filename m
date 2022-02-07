Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFD4AB933
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:59:58 +0100 (CET)
Received: from localhost ([::1]:33764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1kT-0008CX-5q
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:59:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH1ge-0007UD-Fj
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:56:00 -0500
Received: from [2a00:1450:4864:20::42b] (port=44889
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH1gc-0004RN-NV
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:56:00 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k18so23953089wrg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwrJSxKOjz4mUjEiTKgbD9Rd+GluGUmVNmGe0WF9l7Q=;
 b=xWLX/NlY//PR1nCPJcb+CRBReEUp3W3HEHS8GzOgpk/StE0ucILemAsvhqtB6Oh64N
 Fjjxxt5g9IdwHWLYFdxBQ29gwZznUVxEtQoVobV9EH/t7LsrVK/1IDqu71QeiTJrVt3D
 S37OtRRaAhk678EzRTlnANFxG0GiQFVHfVirRbLB/efUef5N5nRpQDwpHGbhgDDcp2ps
 IMwIoRavKPBS3LZ9eIU80V8OtqwUVQY4nJ5kn0Y8Oo+Pjg/5jly6NPr9fhd+tsqUBQlD
 1xg0Kd5m6B/z6LzR2tl1du/2G2FmWBkaDl2DWCHpI4x/jluLrz5Y+XNurwlsNeijxm2u
 Hnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwrJSxKOjz4mUjEiTKgbD9Rd+GluGUmVNmGe0WF9l7Q=;
 b=q81z7S+FaUHB4UjsUWdnAYlUjecXZDlpbLyzasaAxsHuMzIFuiqpDKqQzsjUXY+j7U
 TEYSIIWVSG1rhxr7tcllI2ZVKsmtnGvtB3GItLFfRXcQ6us9YaEzZz+TgsEhlzdv5WP8
 dVP/JiDhNVoj57/MIbipZdUE8G6N1z0aZ0FwsBG0tdeMAYDg9OTaAOglfxU6ajI6QbiP
 WtlaKjk7AhTfucSzMdqvUS7NGuxHX78b2PWCDcpxnhixL9EGm+WecdOsBaVYEmfTHhC8
 uqIeKK0GhNV8iog8CO6/3qatxh6DmIP3wxFGFaMMDYQGZVhFa9RRzAiqhqOTUgP0sQNF
 dPFQ==
X-Gm-Message-State: AOAM531HwgKKI+91OM7CrxAbjcTlxguuew0BkmkksIw2jmuooLtfhC5h
 ZWfttqkAEBc6yAxeZuC5IepEAlCgv86wB8ShWIaxXA==
X-Google-Smtp-Source: ABdhPJxTl2CCSb8ZHaS3VY4HjuY3kR6fVpL8Q5v5ntUa2PPYud1a0aS1e3w1vyiY1OvZzxhIIHMScI2Uv9JfJxIHb2Y=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr9253248wrb.521.1644231356888; 
 Mon, 07 Feb 2022 02:55:56 -0800 (PST)
MIME-Version: 1.0
References: <CWXP265MB2632458273BF3C50900DF150D32B9@CWXP265MB2632.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <CWXP265MB2632458273BF3C50900DF150D32B9@CWXP265MB2632.GBRP265.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 10:55:45 +0000
Message-ID: <CAFEAcA_Bq6Fwf8kN8jwqnFv3wTW5nCri6K4+_wM6BRGUxaivDw@mail.gmail.com>
Subject: Re: Add TCG support for UMIP
To: Gareth Webb <gareth.webb@umbralsoftware.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 21:07, Gareth Webb
<Gareth.Webb@umbralsoftware.co.uk> wrote:
>
> Dear Maintainers,
>
> Please find attached a .patch that adds support for the UMIP cpu feature to x86 TCG. Apologies for the patch being via attachment, I can not get git send-email to play nice with office365.
>
> This is my first time committing to the project, so please be nice and point out any issues or omissions.

Hi; thanks for this patch. Paolo has already reviewed it for
the substantive content, so I'll just point out a minor coding
style nit:

+            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features &
CPUID_7_0_ECX_UMIP && s->flags & HF_UMIP_MASK)
+                gen_exception_gpf(s);

Our coding style wants braces around if() bodies, even for this
sort of single-line if. (scripts/checkpatch.pl can sometimes
help with flagging up style issues, but it is not 100% able
to detect everything, unfortunately.)

thanks
-- PMM

