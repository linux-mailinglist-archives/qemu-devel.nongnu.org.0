Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3E5288CC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:28:14 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcdp-0005HV-QG
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcOR-00038P-Rz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:12:19 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcOQ-0003dd-5d
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:12:19 -0400
Received: by mail-yb1-xb31.google.com with SMTP id o130so11993181ybc.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s0E1XPn0PTqEXJIEWvk7NZ9FwIcVnCU9EdPfWwJy/eA=;
 b=HMxm+wA+PGlfS/17wm8V/VPOnPc5EuYuOcNe3GQqTamYN5rLlzRXcRp0DNTD2XKIhf
 bnaPf1dilojctDdC0Og5SqNY0ohutCMT2NlN4fsmr/suZWFN4gJ0rF6NrSupCkxO3Xfg
 HBtR6A98sAyrnoAm2tkjjC/RFxD6CDlA0Cvm7uZjCExl3E+EzDzsOivR9G6MkXvn+3aj
 g7P62m3ulIQWTmjPKt1YgXIit+3Uk0E6cwI0Q2p13/FBGGoaec2zChxHPjb+viRFNrtH
 sn+RYUGLVQnaLGAkv2C9nq6q0wM04lpmJSgWWjQAll+XFEyBjL8QgIaanwZ+bzQyeksI
 +NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0E1XPn0PTqEXJIEWvk7NZ9FwIcVnCU9EdPfWwJy/eA=;
 b=RPBQ5b7CxB99DamlcUXJY93cZ6BKbkBwv5E38EKqNGoieWXa/C5JE/bRkLiBIf8vse
 xEz8DifJvNoaqusKOa8hUUbwuR31UsBcCfidirMcEuf4FezSLRPAqUbteUco8mSPM1+c
 8vyKJml8aJYAfkiQe00xlUMg8zdUcOpXoQr3I1n9M5Uo6I0hit5fqadqcj10jvx0/wEm
 z6/Xoe5+MiTfVmMvFiCq4nqUE0W+UbM/RWsvtOnw3JW9hSxPhjIGxSQMHrXLFLlzOGDJ
 sgBRu6ABwQRV35QGUKD5thsbGAY91y1GYponKTNf1kyZ0cRbqrxDcCD+pkiBoYo9HJUy
 wa6g==
X-Gm-Message-State: AOAM530CspEHz5LZ/eO3K1elQKI9X/N4xetRqGO7MDikOM/chkDHogW8
 cENzB9/CaMPswQrfWc2/YAWV+B08UCMkoMIgyqzgHUL9DsE=
X-Google-Smtp-Source: ABdhPJxCKry8pBfPzwYE476+MxubVt17X5JkcrQvDRm3VzH4z+3ukr1wHhLWlsM1yxQxzJrt6vpqgKLqg9FZBIXzV1I=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr18305966ybq.67.1652713936253; Mon, 16
 May 2022 08:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-7-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:12:05 +0100
Message-ID: <CAFEAcA8_PbxmN7EDnkEtNkAfdUQ=NbVp1RuKdUTqqzEycMEdfA@mail.gmail.com>
Subject: Re: [PATCH v2 06/74] semihosting: Simplify softmmu_lock_user_string
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 May 2022 at 21:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are not currently bounding the search to the 1024 bytes
> that we allocated, possibly overrunning the buffer.
> Use softmmu_strlen_user to find the length and allocate the
> correct size from the beginning.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

