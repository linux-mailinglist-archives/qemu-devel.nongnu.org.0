Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318213AE319
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 08:26:24 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvDO3-0004n6-8U
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 02:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lvDMj-0003KE-Iz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 02:25:01 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lvDMi-0002ZA-9V
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 02:25:01 -0400
Received: by mail-ej1-x62d.google.com with SMTP id my49so26725206ejc.7
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8OigtRyMYOt5Z85lDLqf5G2nVz1j05+1S5pKgBvX8g=;
 b=hIKl1OObtknBgsSrfW5i3hoJxxTk27Q4FaU8InZpoOKs0ryNji1mkIGCCB+V0Q8QHo
 9x+YzXfvZqwtQ13ISp8muSgTHB473bRLWdBd2VpDAxyLGLYq504VvKlYqDXPI3qGk6y+
 H01d4X1dBsS9Hfilm8dShtPlo1suUAL56epL6RLBZf+kBpJ4zMfRpFT3kuHhm7k+WppA
 PGJzr369mqFs+qrLspUepLo47HGsPGp1uzaOGYHEKtJ9zlGnkJMPFPB3NWjIkmWmP+W7
 bRzsngvE8tGTbkvie/vOJ9+l2vvjDfPPtnMnqM+NH+OgVieGNK0hyr6+zmn8bigO8Kw2
 9+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8OigtRyMYOt5Z85lDLqf5G2nVz1j05+1S5pKgBvX8g=;
 b=C0fpnFZasAp5soBZuou9iT4fdB9UXWnVMoNO1b4fY6GidPh3H1LK9hNElP8mh4lmnh
 GpZ5PQKuRRjwDqq43zoOnVBj9LnFkHbJB+1DGWjRBNlpiM6Ys7k1F00pYQmQ2wt7L5SG
 QYyDS/8C4OM04zvJFIYMTS+4V9+9Uu8kXGj9XrWJQph+UpPu4OOuU7Sl0X4YW4YQqCPn
 HmTdHYnh4TXvjM97Dotot7e1A3bgaP2Vhj3V0qqa1GIew64VB+2szU1qaKrKPcKq66nZ
 PItw2XF/V24MUySg77wHGGPbudDshDyN8Bx0onWMyQXT+ZSGhYX8Nq5XdI7qt5tnZMtA
 C2+w==
X-Gm-Message-State: AOAM532w08yXfY+qOg85WCeYBlX20xSnHWsij9VwmfHygORlPG4MpRhl
 yMQn/WKz3n1kCCIyBaAllsYLWgtUUJz1WnWy3yA=
X-Google-Smtp-Source: ABdhPJyPLP2GNuZlrXn8KiRnj3IaB4TyJz7OghvsofgRYe8tU/yA7orrpTVWvhCoUlB0vtT4bTjbPTkyILob2kmz7Ag=
X-Received: by 2002:a17:906:2f91:: with SMTP id
 w17mr23320479eji.443.1624256699061; 
 Sun, 20 Jun 2021 23:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-27-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-27-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 20 Jun 2021 23:24:47 -0700
Message-ID: <CAMo8BfLAYJAHEpb3jP78b9E4H-V4tyWB7GRCVrEF7o54=220cQ@mail.gmail.com>
Subject: Re: [PATCH 26/26] target/xtensa: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 20, 2021 at 6:34 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>


--
Thanks.
-- Max

