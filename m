Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FDB4D154E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:58:47 +0100 (CET)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXYE-00053d-LC
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXWC-0003Kw-IY
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:56:42 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=36539
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXWA-0007mD-Id
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:56:39 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id f38so36969389ybi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GW00JYbHJnT7kQ8jSW4APLoyUp1N174r2npnsP/qfXc=;
 b=l3oIlF4h3M01AbZVBSt8hs4o1Z0wxFoF8n8DLR2Yk75XVZg2qbP76EhsThI0DW74l7
 iZeiye2YTXWWykiImKnwI3mYDDNRtwxif2Gcyy3c8FUuFSOaAnzVzbPwvHA2BbTWdhW8
 bOXoqaBRmlWaHFJeSaliGxS17Xkn8aPRiSiVxx26DUTiFW3Q34svl3/gb+KNhL+ow0J6
 wb84J1XJ3cQ0WP/TZ0oiv6EFD9XtPL39vGaYr7nEQn2dlu/SxwvxDoXDqGvK1H3xClpw
 aO2epYV+2OKinHgA5J6ySPjAmAlD8vCw/HfzhqKc7W7xkVvYzswFi4+cW3PdidUR3UVG
 gWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GW00JYbHJnT7kQ8jSW4APLoyUp1N174r2npnsP/qfXc=;
 b=f5pb+fmP8MaUyzUMNVi7oyn+Ii4CGJN9aa4HG4KKKe052/7o3W5dZLVMDOMUXs8rC2
 IDQQG+15/oheyBgtjwtwWqD00SWomBoo9leF0bm1Pg+bFOf2f1eB87xQG3zl1cnbbYAC
 QTVAJE3kyszqeW7UAPAwzB+7OUpHCSDdtpv/LaORDXL9CbC4uhmEuDW5kj0klPdTxLrD
 oT6He11Hk78kxumrTWV/l17J5J9v3kGIYvFkBQEV6IhlixEc8obWiXxO1qYredBHuM+h
 EXclcrHTNynfPNWf8WR+wcRYDwDDIwx8FWDKtnSmEmvdzQTA+MPY11ILfN+PhfZfXibK
 f9pg==
X-Gm-Message-State: AOAM531xo/jEemfCFtI3AZy+CikHAcbn6H3V5165I0vu5KbpYrHwHKL8
 zdbFTUX4sdsh2BOfrsYTidiFL4Vvmq1f+g+58h4ZfqTmuGoQSA==
X-Google-Smtp-Source: ABdhPJx8hDqZ8mWr1E4puO3SSwW+2Thr1PpkqH4MNuWcq/olQabSeutdR+TQrsux/VL4PGVDmYRtNjS2Ny7qClzDqL8=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11183001ybp.39.1646736996470; Tue, 08
 Mar 2022 02:56:36 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-21-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:56:25 +0000
Message-ID: <CAFEAcA_eAHH9Gwxp6SJBkK3rnRjn+gMFyinT0XYLwhrWt9c=LA@mail.gmail.com>
Subject: Re: [PATCH v4 20/33] target/nios2: Remove CPU_INTERRUPT_NMI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This interrupt bit is never set, so testing it in
> nios2_cpu_has_work is pointless.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h | 2 --
>  target/nios2/cpu.c | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

