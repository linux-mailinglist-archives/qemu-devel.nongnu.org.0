Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118F5BEE02
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:48:20 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajEB-0006Ha-NV
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeW0-0008S7-7W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:46:24 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeVy-0000sl-Nb
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:46:24 -0400
Received: by mail-ej1-x632.google.com with SMTP id u9so6762949ejy.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Ma5twb1aJxnYlp/V/Zte2yNDOB3+EMZwUDd9s82r0eI=;
 b=OtQbB2c7oxl/+FtJHa9/0Fzf7OvdL2EyhwC1CApZWwS9te59mQLwXEowNpHpB1yj+K
 ZmOZ1pj+Dpk72mBORnLb4U/ivTo5JjG9ezU86r7F8y2/ROMlSdUPew1YQNBaYP95Jiw6
 6Gg5jE/eHjFjnrtbC9K9707lvX9+O0KRlgb9xzWPoWgUCmxuT6HHLsLAVTt0o6QT/n9u
 vna5XmF9gY6B5AWU5WZHxneqFaSpevp1yH2HiiXuYex6DcVe61STMnQBzR/t8/UejZWW
 lh0SZCFlNsuoCI9f0ZD4rgcaMl2CEd+4Qf5mJCfbwKMLTpMm/ExIE7/mG3Avn/94HDo0
 B0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ma5twb1aJxnYlp/V/Zte2yNDOB3+EMZwUDd9s82r0eI=;
 b=L+C+WVlhXzSPuGtdvUeWPhk5aJrqlV9N3Y6MBFayyk4nkvJ+tTzpxubR1zdXdmZZQ7
 OAWqSaXEWAei56k1Ls1m4uK5HW83gyc3AMTzOeK15gPSIexqHjfve8fLu706kn1YkLE0
 TMwGnA5yXxu06XZNOGB/Is4b6Y9TTgcKIpd8TPpMn9J5ZB04KeiioczlBTTo10suzcOV
 FMChZTnrbYqXo/+qyjAm8tgJ+6iA6bLWhrjCg8dw5QFYdQwXA4Rmw6bLpPZVz8YgCyXx
 pxytX5LJFGUkMO+XghtIy2lUABupk4y2lsO65dnGOCyswyunxquYArBcDsgJZDPujp78
 PI/Q==
X-Gm-Message-State: ACrzQf1m7bTw3Jd7uOYBwcPKksHsOBx1pPlOXkHWniQ6xXG7A237uHxi
 jaj5NuXiwj7aJl6oBpeayx2DIkrtWJlGiYAndpnPmQ==
X-Google-Smtp-Source: AMsMyM73261ep7iEl7QbZUYsbkx7LubNJVWLLPRALuVYPRamJ6lFiAEa2Y5pwgozjTrLkFrFJZJsQ5QDJRYVWi/qLKI=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr15253771ejc.365.1663685173049; Tue, 20
 Sep 2022 07:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-16-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:46:00 +0100
Message-ID: <CAFEAcA_gUxhKRynDMLpuJafFQ49MHr3d1PKuDvm7oji9WhHBNw@mail.gmail.com>
Subject: Re: [PATCH v2 15/66] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
> Since we already had a local variable named secure, use that.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

