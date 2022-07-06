Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F756901F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:57:59 +0200 (CEST)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98Le-0001ku-6B
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98JH-0007fo-59
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:55:31 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98JF-0004gc-EM
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:55:30 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id o2so23046800yba.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzRDbeusJSH/uRWYgDMC+U2qMkhIfsVFGfIMpfQktsg=;
 b=J1EsXaHgN62DMefF5NakbeqqvDvm64xVlEydny9klEjgFVTrbk70xeQS9SaE+hqqbA
 WBAyWqJNYzK7TD/AxYrMOuIuyBVb+01pJZL+wn1sEHtDC5ohuTOBQl1xNJmpNZ6VZyWb
 TBs2IWnvqo/xsmfKHJTtwwxsmQTmiwdQv2Xp1x64lX6Zye1JjSdSA10a2fXvgvAg/MDP
 KpUI/au7Lcwtc3u7QkHjRgmGn9K7LY2fnpJhPKeLAuLBHA2LVuS8X+j5q/nMKzPAcCxH
 GvBUmNuBtLPRNr3uO27PndDEESTIGouW1fcpl9gC9wlxCAeL3VH73mVuzuEzrFxZ3sSS
 VZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzRDbeusJSH/uRWYgDMC+U2qMkhIfsVFGfIMpfQktsg=;
 b=tc9z15CkjbxMDyav6/PaMTDa0IjtgHfaOV1bNcbNxT3tmYWkMSbkZcwdtwwOQsvPWY
 8UGOTOoj6qwHg/SMGZJZtJd+4NSlNoZ/BO//EfQLHcto/z8emBQKX8oBhrR4S1HHj88n
 xreeEt7FXn4FgGsEv7SKKcUUxtrj/kHB7MWw8ZP6iwgHllwH9+fvIVcFY0IRH1xZcEMI
 fJFQ9lxFT4gK9YDCGnrL5Fs+oxqYAtneElC9GeAEQU8o0teHS7K8uRFzzagz6oZItkpK
 XrBXf8h2u85h615FOU5CJNZYanGsmmgo15V9JisNajVinvU+cnp1nyBhAShmCUjB5ns/
 rBGA==
X-Gm-Message-State: AJIora+6lMwiu2yNpz2jwBFleCWf9H1ZK2cb567omi2UtHyDZ7IYd/B8
 rKDQE78+vZn1eV5f3oaocx9UTi03ODIHFi7XcgrVb2u46LQ=
X-Google-Smtp-Source: AGRyM1tR50h6ewEuKN7rZHWTR3CfNKZpd5AcYtHScTIdKtESCwLV+MGfMJ60x5c95aPNm7HX5M6mBZ+oteQ4pc29I6A=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr18152101ybb.85.1657126528183; Wed, 06
 Jul 2022 09:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-36-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:54:50 +0100
Message-ID: <CAFEAcA9CGLJZvC+WA8dZqjAiQTeYRYmL=M_o8qszYFRdUo5bKA@mail.gmail.com>
Subject: Re: [PATCH v5 35/45] linux-user/aarch64: Add SM bit to SVE signal
 context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Wed, 6 Jul 2022 at 10:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Make sure to zero the currently reserved fields.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

