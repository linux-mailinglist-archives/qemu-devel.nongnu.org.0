Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C350B8EA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:44:56 +0200 (CEST)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtah-0002sy-G8
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtIn-0003ue-Of
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:26:25 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtIm-0000a4-4t
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:26:25 -0400
Received: by mail-yb1-xb31.google.com with SMTP id j2so14519537ybu.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gNui5XDowxEe6a2al7M19gBN9AD9TnSme725+iLAUpQ=;
 b=b9/Q/pt0NaqEnSDl6kadzbChqvY8hAMtp7nH1gA5gTP18FuxT0nPmM4SiTtsaovBPX
 /fh1qkqR6UTCEbAqoD09JSKQbVjillwAR08u+GevTHO9s/i7/hzEAL7HZz72IQXDf2mF
 vFsyefiqYxh9uj9ipf0m7aOe33ha8OH+wRGtqAMqWcb8RJNld81QJPLs3qgh7Rauc9a0
 h70nPmMZJxWWYPvo6HOMP9okIJeIBp22zdqD0KsRJ2ICk5QvSfH/D2HG/Ot0fgW0aKCa
 XSx4bFrpteUdYAtlAWOcOU4cLAMiTqn5xFMMi0tQUOyGfbW+drffZa7e1kRyhYtAyf96
 NwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gNui5XDowxEe6a2al7M19gBN9AD9TnSme725+iLAUpQ=;
 b=O1v2AhPgVpW6nIsPsuJeTn9MrLAyWCXAac800Nnz0B5NRMXsCot0n99Y4y+TALI6+X
 ipuNf7IuGCXYBDQmHDeCVQd06PwajXxX1JthRhxXgw+lOQEsOnyAVETabqKtZgsCUypo
 QZQzP9iJk08xDaGK5bljlP47B4TUlyAWlQ2tpD8+m6jT12WtC6om8fJz3YM31A/nTa4f
 AqpXY2FA0jiLP/ZeqP0OKIShrur+11AN2iPSS/RMlhnm3cGu2sv+JFS0v2BJBg60UxRP
 vi0wydCbChlBwxaHFSZjJBJLCTUR8MM47j+foUvzFdFbIdMPRC17oYhVbMzss1IhItHS
 7PcQ==
X-Gm-Message-State: AOAM532Pf2gJ4TyJc5a8rGKD45EMdcmEmnLiVb/KG7+XSlUDK4nWgTPA
 dP/yAezGG4Rd6uHzXBVYvwi7R0vJNUwkhVKkQ+aYJtNDEk0=
X-Google-Smtp-Source: ABdhPJznCvt+fgkFCv39q92yP6CFDEthw7vnrC3GZtF9lctVp1cecdyk2USgqFgRI4jOS6CNhTUSIUKxZdYd+YVtcGQ=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr4383480ybs.85.1650633983052; Fri, 22
 Apr 2022 06:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-65-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:26:11 +0100
Message-ID: <CAFEAcA_L84ezkCCUPH13x=U_oZsWgpV96NKN7z5-QU=RPGjSDA@mail.gmail.com>
Subject: Re: [PATCH v7 64/64] tests/tcg/nios2: Add test-shadow-1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a regression test for tcg indirect global lowering.
>
> This appeared with nios2, with cps !=3D 0, so that we use
> indirection into the shadow register set.  An indirect
> call verifies alignment of rA.  The use of rA was live
> across the brcond leading to a tcg_debug_assert failure.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> +/*
> + * Regresion test for TCG indirect global lowering.

"Regression".

Also, file is missing copyright/license header comment.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

