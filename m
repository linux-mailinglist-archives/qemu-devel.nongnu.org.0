Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC595657A0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:45:14 +0200 (CEST)
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MO1-0000N8-22
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lup-0000NB-HV
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:15:03 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Luk-0001gy-Bv
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:15:03 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id g4so16846328ybg.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1YJ/HgeYKcYtLDBdns9a+3qzGhociFoi/QTV8085pw=;
 b=zJ/CIHuy7LLiEihqEWIpRHXq95hy9lbeeDh9EU0fCI9Qr0mA9IFJMcSiePZ8FmjNP7
 Gj9+JInvLBz3WSyYytDR2BdrkSvYgDq0OQzBzfKKitLmvWq5x0MDVuP95RPULTYt/p0P
 PR9KZCcC1xWGBtDogvz79svcoX/pRYOyWwXXRpfL/+cA78qfmgxa0SMVp4gwW0pMuFl5
 8jN38CelhZ3aIsF0t4sxrJdJdx0pGFyUtGBSdrYnXQYXfjmG055loSvCsVpwFHgdNMya
 qwSCuiplAnEWMjT8k/2xc/97DzpiGJOeBmWOAwg5VleJSv90d0Um1MN9R9CFc6lOS2FV
 hQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1YJ/HgeYKcYtLDBdns9a+3qzGhociFoi/QTV8085pw=;
 b=2X7hmS5hP15xHyem2PK8BBNefdumMK8d0W3gHZQMQGDrc4Fej2y4bZQNFo/vqQude7
 Qg977+NbfpRgEJ/IPUOArtRqa9ItdqeRuBM3yEVZL/lgrVSDnF65Gmb9ptxqpICM7pwa
 d/dPXzLL4yw78OFWlONf3C2GMyrN25xJa3c+Fa3B7GipgVO+SrPglKEqyfD+IVaBZ7l/
 Rqf6th10cXtk2D/vveErg2EwdPU8dy3HV8FKHExLkn0/M0USe+du/9PdzSWMkO0Q8fX+
 yHWAsiqIo/jio1HPIyO/+tiTW6TDW88h2Ghm5i7s+tUywciiz+2RFfULpadGXOFS0bPt
 UeHA==
X-Gm-Message-State: AJIora9YVTTB0mRIEgxWbMpgyZPfmVH1XQgmqhH7tx4cLnb639xblm9O
 XGsZlnLfdLpa0Oyr5P+pqAAMwiLGZ/s3b1ACJtsrFw==
X-Google-Smtp-Source: AGRyM1t8D8vuXLIiH8w74zriT9h0mdPDF8SScTW+vbGda9j3pAt+PyZmxMGo9re3AhNq7JZOp//PMW9f5KvWGxc26Ow=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6125609ybu.479.1656940497244; Mon, 04
 Jul 2022 06:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-4-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:14:46 +0100
Message-ID: <CAFEAcA8vRaLXmAZpWCkO8FoJd9cwvaCqHRCJugDSZfyEy4rT9A@mail.gmail.com>
Subject: Re: [PATCH 03/40] pl050: change PL050State dev pointer from void to
 PS2State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the compiler to enforce that the PS2 device pointer is always of
> type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
> this type change.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

