Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6C545377
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:53:00 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzML5-0005GL-Rs
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKf1-0005jm-0q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:05:29 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKem-00085d-9f
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:05:26 -0400
Received: by mail-yb1-xb35.google.com with SMTP id w2so42522070ybi.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBajfl/V9PKEjNWjC6gpud/59W1ow91+uYXhZxUnyJc=;
 b=iXCBljsKllXPdXbsBVRgKD43Sb7in/zRrEioT+qwJU6gSuT7I9XigqhLL8IcrYR3Wb
 uy7+5z1UFkV2TC/5eLxQQxPaJl17U0j8vczN6z/b1GrSqWR9TPSWUfHKwzx4I3SJzozd
 5mW2Q5Tz4D3WWxpAwUHaiG0q+1l95X9Swu6H8hRgkic6iLnCw66hUWqbNMKWp6kME17T
 upH/keN+/8KQmmvPtH6TL9d1BsoP2PQ4kPJmUcltYdxJjxA8jwbwEycgb76TQi5CMhU7
 o/gmMm5PF1k20keJuOaOSk7y3nhw1wy1BY0pPKm+unzp/QqPKsqJbijKMWIkITNx68bU
 fTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBajfl/V9PKEjNWjC6gpud/59W1ow91+uYXhZxUnyJc=;
 b=GTAyiy1ur8a5uCj+bdabAuYzG6UGQpxfEABFAb0gg9XRG6aMcXbMKKfgHEHEIY4lrX
 WFWcxukwdczi+4z0d+KudUK3g7Mwfe3Ts/e/ijtpGACtjMnxW4TXt+AnMu0qFRwBwWzL
 YOv4/LoLD6MNCIzLD8L3uCyWCp36wGMTXMYCDVU5DGOrBbajMaCIft1Ylyt3wJr2PPuu
 hmx6bCdQyTr/xB5zS8e94i7Sv7k4Itw0Eii2oktfZ1jwcoWhXTRvVhAYAH5YBMy/Lfgg
 KbiPh6/9waDeyg4BRM8IEJonf0iF4FgPLcXRnzUMkSw7Vn13GmLbk1CaU0PAmE4s5YVs
 kVgQ==
X-Gm-Message-State: AOAM530NJyuGEKyVWL5CFX63Z1kSMq1dHuHs6RIvxu3iXGanlJHODBC0
 qaDFZ+KeWbfHCTHKojkUovYZzwHrCVOOr0BhH/z6HA==
X-Google-Smtp-Source: ABdhPJyPENqcJLWA1r7CnGR1MK9onH5x7vY46iaVaGAMmp6PsMzFOeEKsAQkI41y9cObutDhsJoyhiQXaYKpS/US8yU=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr40938204ybq.67.1654790711269; Thu, 09
 Jun 2022 09:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-12-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:05:00 +0100
Message-ID: <CAFEAcA_CBwzJqMSknGf6kfRGHBukeqFHnNobYksbcuy7J=kt7A@mail.gmail.com>
Subject: Re: [PATCH v2 11/25] target/arm: Introduce gen_exception_insn_el_v
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 7 Jun 2022 at 03:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a function below gen_exception_insn that takes
> the target_el as a TCGv_i32, replacing gen_exception_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

