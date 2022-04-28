Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5C51320C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:05:50 +0200 (CEST)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1y0-0005RT-KG
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk16L-00012n-Q0
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:10:26 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk16I-0003Vn-0H
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:10:21 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f16645872fso47163017b3.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niPxWWeB0PtjmqhVVw/3ijfl+grPyzwd2h3dJH4pzeI=;
 b=qCYXMrI3QWz9FMM8B1d6Vv1juywPgi9KRk6hgtZu9jqQJqbfj0A/lumQiY/C594vaT
 ci2mjldlg0gp1VTM2u+1raZWkJ5Ht+xlmBTHEm/ntUAaMsUe4b7hm77QbETaAFiJe/2W
 S37XHAvkJzEQYtX61Xb3SlX08ZI4xUnTeSuCFAvNZ/D944nJFhhn1TRHeaTTcox/Wugx
 OflGsaOHm9BPp0PvyI727XZrjLWfcEfkDb5G0G4XGzCzHjVCtoeK29Ih1XIzLxHVj/W0
 1mMOMVCivxO6b8OBqbShS/HlY6nsh5nCm+4Taj+hruTr9ecSoxyCGpms85GPqn1HslEa
 hNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niPxWWeB0PtjmqhVVw/3ijfl+grPyzwd2h3dJH4pzeI=;
 b=ieLfmlSGN8Qdu1qiAdA6A7+Zb6AZyVkgLy5WHccKsDIMnblBQ/iJZxp7uJYVY47PEo
 +D0B/Hyt5d3oOimeI7oZj130iRsR6VtZ3eXd7agfHYfaRXTYcTNsSq9sVPXDJ0GGx9Lx
 f2gLmXdmK7l/JELllCcmYyH6SURmu30CNuoTIhmf8mdxhSEUihpARPdBJAz3SS7sgfYV
 rIArmhXx+wfv5UQQtvF9fPsvNdUGcsQHoA3ixmZ7c/cnwdh1yu1/VGe2JpeomWPobTdz
 vbPXMu6dNCI4WIXlLV6aPgBQqMCG9w/owiacbLnW3SQXP8Y4p7OULFjyaPqNgIyG5naM
 YC7w==
X-Gm-Message-State: AOAM531O4L/EJ+RpgFZtOIJrHhPJsRq2LY2nBwkmnYJCqNOfQy9Hsuqk
 Ga7eOdNeJzsqAbANQ+1PkUCJTCMJfWdyiXV8wsFC4A==
X-Google-Smtp-Source: ABdhPJzzJKdEk2vuVTOCP6Pgw2qMCyoBSXcSZpHnzRdQCn6wYV1CvOEBPsIxLW0Xi1bZRJ7qq6/uclVlN4O2VtVOqdg=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32104528ywf.347.1651140617111; Thu, 28
 Apr 2022 03:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-20-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:10:05 +0100
Message-ID: <CAFEAcA9ejvnFWyEaTL11jKi3p114M9f3u1TWtDi-_1hfxBJZsw@mail.gmail.com>
Subject: Re: [PATCH 19/47] target/arm: Use tcg_constant in simd fp/int
 conversion
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

