Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B96ABFA9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZA5W-0000cn-SJ; Mon, 06 Mar 2023 07:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA49-0007WI-Jf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:35:47 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA48-0004W8-0M
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:35:45 -0500
Received: by mail-pf1-x433.google.com with SMTP id fa28so5620844pfb.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678106142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0VRxSNypHOH0Bluy3jMq6gcyyg4Fi5FYQQHSGnySsR4=;
 b=uITNMdsNO4EsyY8muVsB2z14c1EQhdYaOxIeETIDWs/IOPQAxhrJblQWyYycSSaW4j
 xhBu83e1WUH+nrhpKxnb6PM80AZM1Ni/4TYfyzSZreMmcc3CR3aQ0MVL9h1eA0JpEGsH
 P2ug9whj/isSKJMZ2gB2G3zKNjpq7bjwKtcOwnlKeZlDSYOGsQQUMBnsSYU2dUqayDts
 KfoRKet3Dnb+6cfrtnexUmoi5w1lraYMztdL3dF22HQm3ja7XXD7rzmc66SSobDTFD/1
 wcLwcKVTQnF+Ux8gO5ncDlzgo1RiZ8/EHrnDhlw9Cubb3L+EEdt78Gp3XrnkEj2hhpgq
 JMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0VRxSNypHOH0Bluy3jMq6gcyyg4Fi5FYQQHSGnySsR4=;
 b=bwu+7jTz66U8TT/UT0pbCMTai9Ne0nCWsnhnEodgRiguLQB7ulNLU5Eepgn5vOEux0
 40UAfuTLmN9iaIlmIp89+/AmgZrh1Sclw7lQrylXDr9sdxxaY//f+QbXs7bj0X7AWUpz
 dZLmbZ0MKM6D4gz8H/FMyq5eb8wCDglXobPeKmBJvQuvJzEmljWNDbwZtgAQK2g4P2Pp
 ZaTTx/f8pE+HFPVK2PNH8u05H2roVy5j08LAX0sxCMiVoCVtFYQiXkmaWZyAwTLacAwx
 5J8XQZFJCDDqVgeS4Lrf7DfNCTHzv6JSjNQ+s32fgoR+okC0C3S7uylb0ECmoPHLDDjt
 0qig==
X-Gm-Message-State: AO0yUKWx4HY2DZFb21u84hUD9SAspAijGKu9ObrptQjQ95UzSITWLj7J
 xl76GV0b92FdP7t1UFFi1O4//VOUKFpfrboPD8LDlvRZ9FDlrPcE
X-Google-Smtp-Source: AK7set9kP8cq/9dJEO9a2T1ychjqZX2zi/l6wxPUlaBH9MwiYyqCcdFs437HBXR8TDfMMOn+reBq8Qb/VpXvLFsl+00=
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr3674862pgd.9.1678106142565; Mon, 06 Mar
 2023 04:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20230228003713.861168-1-richard.henderson@linaro.org>
 <20230228003713.861168-2-richard.henderson@linaro.org>
In-Reply-To: <20230228003713.861168-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 12:35:31 +0000
Message-ID: <CAFEAcA84LMWr3qjHuE7YWnWfFUXqMs18PB5qnf6kfALejt4-=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Avoid splitting Zregs across lines in dump
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Feb 2023 at 00:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allow the line length to extend to 548 columns.  While annoyingly wide,
> it's still less confusing than the continuations we print.  Also, the
> default VL used by Linux (and max for A64FX) uses only 140 columns.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 36 ++++++++++++++----------------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

