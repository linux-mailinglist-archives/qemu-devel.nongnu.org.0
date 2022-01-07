Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E979A487531
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:06:02 +0100 (CET)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5m8H-0002Yj-Ou
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:06:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5m4a-0000GV-Iz
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:02:12 -0500
Received: from [2a00:1450:4864:20::429] (port=40854
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5m4Y-0005ZG-UK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:02:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id l10so10052113wrh.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYl3eXuVtD70QvmjeluURJ5L1gspJ7DMJRdw4QVj4v8=;
 b=fQHVeluuhYmNXhRdYGJaO7XkUo/faThS9pkJ5Xa+zvGGgYliEj6MS8giraZV/70Pe1
 uAapzW3BOPppPLyt8J8TQzSH0PVvzKnTomlzCfGRpCyG/mb1gjRnAdMAjGzeKhEqi7Gu
 jt0f57Yvijii/+XchHX0hetTEr/r4liz0N4RqMZU8GyCo9dBVZe/s1ZLLWLtRHRDldve
 5+sOpML8x0VWZ4HiVKFUYajK9RCJMXk/yuO+Qp03noj5KEvRso3Ib48hPv3Amm05mXfr
 5iyy048Q4hUyxCB9fM2DrG24zobDvQSxR9bD3+xNQxFqwqoTRzIPb+Fmg8nLmoX3rNod
 2nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYl3eXuVtD70QvmjeluURJ5L1gspJ7DMJRdw4QVj4v8=;
 b=wopgpVAjVnkNDi9pgDDwpJ8mJtBDgOpeFF/gV+VQljwfXW2O49Wp/el3nEYcHcTtv2
 KeB7Xvw+xXBvuFK7QeT0MIjguVCTM3cNMtpA4hsFT+Gnvy8hdWoBvmkSdCaifI5D96JC
 KrmRyeLrB5EmZ4o/L74pVP/DlxRi1j79kXk5cNo6c7mtbG7qCMHOz8SN9f5Ulgr9OYWL
 U3lumrmdGFXb4wxappe3k/6kclhr4Ao+JlyWwnMY4Udolm+2PMOC7AxpAfc0C0KaJTZ/
 bGaZ14Zf2wu9DfcPa31aG9Ge0kTNMSD2aVxB+YSaT20Jw7MrPQJRY3lfQOiJoo8RhdhS
 yNQw==
X-Gm-Message-State: AOAM532EP76o6Ry3JuIewAIrY69OhDDx6v0+uS8HIEEXy9j/oI4yER2J
 Qh4cpmE7y9zTuWyAR3kMSEf8FvZhLeqy8Iv5ulPgAw==
X-Google-Smtp-Source: ABdhPJylM9/210y+skCMbKE2Xa4KG+Ajdwip32NADAxBI/WHsQ2QwWeIIwiJk4H/1+6QsLmhI2dTRfQust86Uaoa8Cg=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr52787358wri.295.1641549729050; 
 Fri, 07 Jan 2022 02:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
 <0570193f-7a2b-9fd2-ac4e-76aeb671f2e9@linaro.org>
In-Reply-To: <0570193f-7a2b-9fd2-ac4e-76aeb671f2e9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 10:01:57 +0000
Message-ID: <CAFEAcA963frbB53toemUGL9OK9A9D1XkDKXfSHrG_SnzN1CwiQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 01:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/31/21 2:39 AM, Idan Horowitz wrote:
> > Some of the instructions added by the FEAT_TLBIOS extension were forgotten
> > when the extension was originally added to QEMU.
> >
> > Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
> > Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> > ---
> >   target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

