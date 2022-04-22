Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4950B860
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:23:05 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtFY-0005NJ-2Q
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsnq-0004GB-KO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:54:26 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:43471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsnp-00013O-6p
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:54:26 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ec42eae76bso84109887b3.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t95hY2Z4ujeMLDxNR/ksEqrA3tJ6Pqt2IhRMkLncAAE=;
 b=BdG9FryNCp0IgXrs6kB5ExCRcqPhhPbLrTIMZIh0oX3z7MCehEy5ks5b0wJ+5kYAbQ
 WWYRstB5lXbK26m2wRaERcxt+fKByWyDvlrfvpydWE9Fs7nqXjEosS0zpKZbSWD4dcNg
 d7Yo7oxpbiBEQS1Rcu0vbj3aDuuBTCyImR+45LEX+5b0g2OhHVcszttvcwinORTckViF
 GmilH2p/te9r8eJRBW/WiXE9+iPA98UL2pdwTaCyg4+VTWHYwjHZ0aRzFayebj4rhe2x
 a60UcE/j/vrDpfTmHIgHEWkPjAe8EIsYt2DjxQgHp0RNqj3HtdODIniuOe6MrovthLMe
 CRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t95hY2Z4ujeMLDxNR/ksEqrA3tJ6Pqt2IhRMkLncAAE=;
 b=ZRLL14hQKSM8XaIIlbtm4ZL2qHC5l6gmXEtpQydlIuASD1gi1SKMoIfJTfM2Y1f9O4
 8/2qni366iyEDdZTBt/2yMv2+l7UH24A97U5fCAcvsUs4Vafz+nN7Y+yCto3gSxph9du
 zeAD3/bDSZcgpIaKO+bZHsyQHBhEgUO5VTwLe1DC1U0MKeXYvvmTb+Va22Nn6yQqm6e6
 VIwgQPmhD1gpfC+stbRD/ui29z5ZL/jmM5DynVhuvfrT9xXyh2bq0XEllZTtI2qkO1BK
 IQ23XZpDywUvn1qwUWSohu1NnIZDy86s5LiNr8MGgcYYZGme4AUq4/8vSTO4f50If/zS
 PR0A==
X-Gm-Message-State: AOAM532Q5OQY4wTYyxF5UAr+6o1PGo1G5Ze59qbbrAMuVQbUi6+Clwiy
 DEsQVN8Km9pTIWm3fDk+I4LrHOgCjyZrgrDgechhtoM+3QM=
X-Google-Smtp-Source: ABdhPJwKmT8PhX9RbbanUpWcdTcoSii8+XoK1tx+kE1U1WeNR+ZQ+PwoyjcEa7pxxmFxwFD11vKGIFIT9UF7HKUWU5c=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr4628547ywb.257.1650632064087; Fri, 22 Apr
 2022 05:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-12-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:54:13 +0100
Message-ID: <CAFEAcA-KGnkkxGvZ3VXTtBby3QQHfZ4ujMDTOYV3oDU6_RYjNA@mail.gmail.com>
Subject: Re: [PATCH v7 11/64] target/nios2: Build helper.c for system only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 16:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the #ifdef !defined(CONFIG_USER_ONLY) that surrounds
> the whole file, and move helper.c to nios2_softmmu_ss.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

