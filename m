Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491575452CB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:18:14 +0200 (CEST)
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLnQ-0006jb-Ri
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAo-0000Kb-Gh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:34:14 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAn-0002Mo-4O
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:34:14 -0400
Received: by mail-yb1-xb36.google.com with SMTP id e184so42376310ybf.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+wOYvc5+YO8xJrz5nnNrLhoFJlpWxW9ZnRW66oZyGy4=;
 b=u4B2GgV1eiZqiKI2SdIvT9Ef/Cc0l84O+S2cNf5chdTK3WV61UK6DrUAGiT/zNQ+Gh
 L/s7rD4BRBr1NJDyKujqAmToeCE361tZ3nVwpgzM1yEOPuqOuKoVr06K0HL6sbLIQRZd
 dCtNAvODMRamqOXekwQt4nP3vM/l8RGRlIoxrV3Cc/iIOqFmqF2ZOBtQJkzhrHqKw4MO
 GQbQ5w/DHblSoiSmqrD0YC0wtOT7z8wDjXuDE9k+DfJb8poeWl/WLsRoIUWNqEtlvcWW
 wpi94IIu+3sIqSnP9udy2daw+ChHA1TFRHwyZj+tbJbTl/Ezy+zrkM07g7IzOqCjKBYC
 hsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wOYvc5+YO8xJrz5nnNrLhoFJlpWxW9ZnRW66oZyGy4=;
 b=qC7TMtz693JdK1oCfMk8wcrn0SZyWrrCRwwEqRswRLwXoEjynumNm3CVPzzKxgr2tN
 bBjSCfHyCNIQF22iyVcxyEXKTUJ4XW0gfx6WAkwQS61Uqwpolqm3zhS3TKvzrkn+PWSJ
 LTZbmNHEXH7el3w79/W1UQJMd0AsK2Nu4ZJwGsO9HFuUbi1EZBzXX4tNKXbO3INOtVZf
 P1rMWNCA0rKnSGl97PRLSUyzeezm8Cl1BnZaG1WUvCYaAxE84yPo/jgzxE7jD7eh5SiM
 MXtaWcDL7nzWMF/gu+ChhltKmtsWe75L+Hsw0kc1jfxGJ62vLvejdxqpKASJQRiZVFSv
 3noQ==
X-Gm-Message-State: AOAM532rwXhSWDRRemi4usq41YcyUDJ2kyIPMom/M0udciyZY/B45WNH
 gnLhwwkJAxyeKbgUcOZNSIo7WIOw0AHCKkq/mYpD+g==
X-Google-Smtp-Source: ABdhPJwq+ujUlW7Xs1SzYADwlFG8pMKeATNwO+DgUkvetcLbLJd0g0XUI4QRZtyp4lG2z5BYE7GIKwOP+LVjNq03/IY=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr40049697ybr.193.1654788851997; 
 Thu, 09 Jun 2022 08:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-41-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:34:01 +0100
Message-ID: <CAFEAcA_BCtnJZb6hzXD2zRB9yfSChNqA5RWY6n3E7o1k=8m+yg@mail.gmail.com>
Subject: Re: [PATCH v2 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Tue, 7 Jun 2022 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need these functions in translate-sme.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

