Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8AC50B6D6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:07:34 +0200 (CEST)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs4T-0000QR-VT
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqpn-0005Uy-Rz
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:48:22 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqpm-0000rT-Ar
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:48:19 -0400
Received: by mail-yb1-xb36.google.com with SMTP id x9so6659658ybe.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRmNnSHf+ODPhAE7K0fD97Ygw0w2yu3EL7tiZYeq9Cw=;
 b=a97JEInvNSYkKXPgwjQMUBHGwnwu8QAef6dTttg+XrfpoY5y3shQOOjv6R5pHSbo9W
 9Bf5hWXW7CC9mZNR/IGsMNE3sVdZOmkM49waIoFgaXY5LHNCAuVBt3F6affPZ9YVngg0
 VnYl/bIYiSfbRygeuPjpHxrGFmUb2cDx3/K+J/1LdHOsMkhOomDPtIGFXz7zibT6+5ca
 O8PRRcaHwKlYp0Vl3zhOii/OYfrRaScPo5QcR+XjeYATkf2OaHtu+vEjQQtqZ5oEkXci
 9r0ve0pSr/IX8NQxlQ4XMe9Zykw6USyrzcxBk8GQ5X5OSUnFjS46QaUYNiHrzcbW+GQ+
 J2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRmNnSHf+ODPhAE7K0fD97Ygw0w2yu3EL7tiZYeq9Cw=;
 b=W57fk0M9YJ/oCugTL0z+Mm0kETH3X6hM5pmxbInkoD1ORSM+QBPRnv8mIIrRCZadrG
 2WrlwVcZlfFU7FdwAoSXatwQh0g0mnKSZ8SOOuSzCL8dfTxRWe6zTgKFsNjOZQO2Cae9
 5qg8z/+3wcZxWubOAq3pqsFm0lXjV5UjXF5WZwDYO3SJ+78FUygwojSJQjp+oSupz238
 +zFZCTrHtQ6nqnF18gPIlla7Op2BOacu+TzJgskE6HGwCEOszStuK8EvOaWDSyLrTQp1
 XoCCCkpGqbyJk/oOyfAfwnlC+NJ/ZNuu8msa3K2dQMHSMAPIm1WazQOYtamxQAhOOWgP
 nTGg==
X-Gm-Message-State: AOAM531fEJXC3s+2WkiNwkwNRZgEZ0QOnH6PQPhXnBVepjRl69o33lvI
 dbPkjaLagWe2Z3nbIsGBKUmu1orXAk5jQSixy7Yz4g==
X-Google-Smtp-Source: ABdhPJzwWSf8x+ivfLJccbftQiie5q+lcvMZBUPccoyGazzx2Fx0Olewrhlk/rVPxZEd8vX8Z/VtQbUNA7S9T/e7Qlc=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr3664681ybg.140.1650624497427; Fri, 22
 Apr 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-35-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:48:06 +0100
Message-ID: <CAFEAcA-X0BnHkxSsx=QpM6bWvBZQ-xEfawiNF2-mSXSy8vfEMg@mail.gmail.com>
Subject: Re: [PATCH v3 34/60] target/arm: Cleanup add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a single memory allocation for name and reginfo.
> Perform the override check early; use assert not printf+abort.
> Use a switch statement to validate state.

I think this patch is trying to do too many things in one commit.

thanks
-- PMM

