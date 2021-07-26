Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F061E3D582D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:59:41 +0200 (CEST)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yKi-0004U9-Qt
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7yJ8-0002dh-Og
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:58:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7yJ5-00076e-Us
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:58:02 -0400
Received: by mail-ej1-x630.google.com with SMTP id gn26so9666788ejc.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qsDbt63OCeJH2XQqD2nB/I7kiILKLEh68LhGWk3ylCc=;
 b=pNi4sLVgt2Tqhtp9keVXBVoC17N0oLRFlB9BcDILO7V1E0DAMwovwuzuKQNN/PxOBg
 0GV0D6ZqiDWFflyjMsZGddtsW5nJF0K9Wy0UIslBrVY7iYVrBNJJFZPYkBv0dlQ/h+je
 8AnswSoHFH5eEhhZHyH5W1esbDbNl5ADS8fEqVXD/dAQUm/GblLWIYPBn0+NOtaUB3BP
 Qzq4Lec/XtnxKWPlKFHvjpMV66UZ0ciXw37/CWoLs6PR9KjUc2ld2o/nGQ36rxPYqa5F
 DPA7sS4a1JUx780PkZIJBKR/slmWIri/YUJiz7SSjKljWNOpDnP2DQNzq9sWyo4qs39q
 /sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qsDbt63OCeJH2XQqD2nB/I7kiILKLEh68LhGWk3ylCc=;
 b=dQWgFvUBXGoAeHdakQ6NCaZj85wf664zfutf5Vy/KtaNnDL3DouHy55X6J/8nMlK5G
 mFwUOQNUpJX9HeNv7UJmMWBHy5bA5DHXr1C5uccoHKdYLFD49o+CE+kYxlyrlQBLkcPz
 kbQwa/djGwmlsXd78SNwkXxjpeDL39+GPsZgT2gNiyLM3dXzqJvXnAJmsMNkkKoa+GNy
 5Su4ssiF+X4SUmilmycSGmjOBK9f7vlGt6Uvffiu4unhN10AR4HaE4hTCyeIcZRuBN4l
 SGFgjkcvgs6ztsGrf7X4Jmqz93PY/7hCCNihvECNhBcevQufMXMBu8Qxs74ryD+FM+QX
 YPTQ==
X-Gm-Message-State: AOAM532VOuYlF1opYQTLQsoAj6Q9Ss5BgKgSfCke5eZThyMEAByB7uaI
 J+NW7iypoykFmdvwF46AGCaXtAC3ZUaP4TSbnjdNNw==
X-Google-Smtp-Source: ABdhPJyDQlYUQWGqkwjtABZtuqvqhBgcGENi2tBPHqsyIBbjnKwQE7MUhN+UDkSPz3hgp1oi7ufMLxecU+IPADHm/1w=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr16747863ejc.56.1627297078680; 
 Mon, 26 Jul 2021 03:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-3-richard.henderson@linaro.org>
In-Reply-To: <20210723203344.968563-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:57:16 +0100
Message-ID: <CAFEAcA8CdAba9W+k1SerET73TOooDcazinxHwj+YToHQ_j7jLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm: Export aarch64_sve_zcr_get_valid_len
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from sve_zcr_get_valid_len and make accessible
> from outside of helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 10 ++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

