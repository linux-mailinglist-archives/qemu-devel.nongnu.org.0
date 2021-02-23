Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1532293C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:09:12 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVZ1-0006cc-T1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVXc-0005Zn-PB
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:07:44 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVXb-0004PB-32
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:07:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id t11so33890889ejx.6
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n6fQBWTxTU/29VDIOFupdpjGY1QJ5/ypRF7jGCsiMF0=;
 b=iTXC9Qyq23wGHW3XckwHBfxRD4EvlZovJuBbR9pdWu4bjE7cuHTvYpnZZ1sDfbv4Qr
 EJsxtVxayAgxAaDc/1ku42QKgshWHRxGSBQiDtkXTCm3UQFEfbffwKd3AADExm+3iWNE
 7gNd/v7G4RUvllDQi9QGeVaaCaD2oJj3oKFADc7NowAN2x271zn39ufAt2SmxDEI4eSv
 QZsRV+K3Xw7nOB/G1/3+Ij9YXDsHbd1m+V3AGD2B/59jBjx/Db6SoaFN9RTNeD/3WIrk
 jz7T8/69Akcz4PcqltAaN1F06AyUcUeY+DwfgGznuKwfO6yaR8VAbrRpzQCO6ADOkwii
 tBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n6fQBWTxTU/29VDIOFupdpjGY1QJ5/ypRF7jGCsiMF0=;
 b=OgE4W3VlN4BFzJPQ/fp8GDv+hdXhF8gZE1GD+vcL+E3ofgPvPPazbgElVrZmHrO/CB
 k7gcL9gtc8lncV7/lnsa/L1i/7dIZQcF1ltwE0Jjxr9rbesRkTn8ocUeydu8h7KvOXw8
 Z5vlZxaFYH3YkEdcuP9R3RIaFNF5cCa1XczlvSV69lzQKvB/YZh4N+JpSYVftOHsjq1w
 vWv7f5jBLgZLl0pZgpIqYtPW1IabtYGA5OfGC2A1vPZKIjaJ5ZMMjSds9A1peKYhdbGL
 EQCBKp6DJOOQ/Z0HodGy5LD2Z0v6np2HStnCnyvszBdNfpqEP4Xs+tLaAFmir4Ppl6fL
 bIIw==
X-Gm-Message-State: AOAM530Xu9YOSxjv/wmgKV42CCPkPspTXgoEFBTPkOqEh76OzFnA6JDZ
 FQ3f6thCcStiEhvMjMBU1lET/jCotIK1etKOFEpiMA==
X-Google-Smtp-Source: ABdhPJy1zc+gr45/IA0tjJEDyDrR81rvQWsZOJMQGPqp5NvbxETs2Tqpj6nl8pMrEmRZDR6YcTqdTSw9AWeJHkFjpl4=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr26153548ejd.250.1614078461665; 
 Tue, 23 Feb 2021 03:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20210223095931.16908-1-alex.bennee@linaro.org>
In-Reply-To: <20210223095931.16908-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 11:07:30 +0000
Message-ID: <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 10:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There is no particular reason to keep this on it's own in the root of
> the tree. Move it into the rest of the fine developer manual and fixup
> any links to it. The only tweak I've made is to fix the code-block
> annotations to mention the language C.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> diff --git a/README.rst b/README.rst
> index ce39d89077..f5d41e59b1 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to use =
'git
>  format-patch' and/or 'git send-email' to format & send the mail to the
>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>  a 'Signed-off-by' line from the author. Patches should follow the
> -guidelines set out in the CODING_STYLE.rst file.
> +guidelines set out in the `style section
> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
> +the Developers Guide.

This is the first instance of a qemu.readthedocs.io URL in the
tree. Do we really want to have our references to our documentation
be to a third party website ?

thanks
-- PMM

