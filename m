Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE3F4D46BC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:22:16 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHo7-0000pS-7X
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:22:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHk1-00065P-2S
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:18:01 -0500
Received: from [2607:f8b0:4864:20::1129] (port=37934
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHjz-0008Id-HT
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:18:00 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2dbc48104beso55598767b3.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEWL9mFnpb+ApQhigdzm2s1Rek537wY2YX94UHn+FoM=;
 b=dkjuKFGYbAD81vZ8JMelW/aV/s0IrqMf2+tUUoAL6m6DU+ro3CBa3impXQwRRC/kR+
 KUCsN8iOgqF6sTFMauKGhK9T5F+3AyAZ+vFkPsyMIHhq9/D4szbJ/GEDk9Cxgv/JSf8T
 6w+x4PsQ6JkrLNZk70z/mZLCYcGu2ECmLTsAO9yVxEoPwaSvDmDxan6+NCZ1zhGiPm+S
 NrwA0F7+XigDNjl0tEKBEjRmW0vJV/Bq8OxgkHQfgvTzxkTH1CVD6kUB+VrsQx+12p6v
 A0sJ/nPoKIar71fcKsHj1piDF8cAqDtuJKJ6OUwciVzZAHEQ9w2m2sJQT2yLxvtHjCHJ
 +ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEWL9mFnpb+ApQhigdzm2s1Rek537wY2YX94UHn+FoM=;
 b=3dwp6OBPZHD96K/rbiQKrbF/Ahk5nUCllGUZgd62GPEgU+v0yR/CAVl0BkHOUhcG2L
 5eYx1QiVpUaTOMGhoQDF+5cutuOcBV5I4urMx1uftB0WR8IW+AN89eXo6u7PPuPjs6g8
 mUDhihyXujKM50TQHgJuu5ECPoFiOZFaSvHl2a3yuA9ppcI44dLfrknbul0PX346GOvK
 r0YMaIZ4w+Sur5QJJVc9utpWvOgYdD4FA3HAhR47hix6pi7YdZ9lIKgd1dP6o5Z0sM9/
 rnLsKasbeuO/QMLh8elcKtbHCNRqK/unsRUjQOV3rPkpBAFhg0hSbXtmxm9u+BC5mGyg
 6o3A==
X-Gm-Message-State: AOAM530UZiboC//ytM9PoXN8Bji6pCuzMNVMtxXg0I+/ZHjO9PN404AS
 YOOC7zotI4BeXosqNIIoxL9mjH17XQDr8XvovRD5FA==
X-Google-Smtp-Source: ABdhPJwvTbEVp8rglVapBLGciXP8P2fMtMNZsrMCeCT0zTQEHav6tJii7UvKCG2QeCCVhWmIsPemXuz1LudUq2mroOk=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr3492290ywl.455.1646914678473; Thu, 10
 Mar 2022 04:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-7-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 12:17:47 +0000
Message-ID: <CAFEAcA_xuqqgExpaBC6y2GW8YpTbK6PVBFX=TsB9xA7_9=Z0LA@mail.gmail.com>
Subject: Re: [PATCH v5 06/48] target/nios2: Fix BRET instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Thu, 10 Mar 2022 at 11:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had failed to copy BSTATUS back to STATUS, and diagnose
> supervisor-only.  The spec is light on the specifics of the
> implementation of bret, but it is an easy assumption that
> the restore into STATUS should work the same as eret.
>
> Therefore, reuse the existing helper_eret.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

