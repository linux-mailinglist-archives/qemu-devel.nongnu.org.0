Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5F4B7A91
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:39:47 +0100 (CET)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6U6-0001Cy-It
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK6FT-0006M1-P1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:24:39 -0500
Received: from [2a00:1450:4864:20::42c] (port=38515
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK6FS-0000Wd-6b
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:24:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d27so396213wrb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0XGzw/JpnzzkJGvYBeoA5oz+SbPnjkG+OYo4X70usc=;
 b=YbFoL6+0T0lgS7kNjEY30Frub+A4kZKc3AOLmUlF5LX2BCVa2j/GGedptBl0jMVhkv
 8ooG8ULUr7Av+k8QaNGKUlbMQYyQK5kZNRXrNAZdtmqOgfxQbYnkaGSK7TcAr/6Y1JP4
 UfhhT+cugdg1YvqIWEuzQF9j9Z+iLVWmsm4ZAkrWMXVVtqmfrqCc125leZGLlDpLE2KE
 y8yDai5d/1C6TwWVc/FEd+0iqLykngs7aHaCztkbO1p954aNoXisFuFJReaw0xKt1Gmp
 uehW4HB5LGHL94m4XdT6Az0Cb8CGxgh2RcDLCMfGSRo/mV53lV2FvQ8YSQu5YOm5aDFz
 Md/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0XGzw/JpnzzkJGvYBeoA5oz+SbPnjkG+OYo4X70usc=;
 b=oUmcLhmyX7lXmhlnip8qaveP6+0Rvkbtpf34zFB+ypwwgcGtDmMNgc2FmgaNaduKhf
 ovPjfagHdgTx0JCLm1RJkRbCKxPhaDpTHrsLOyDoHNHPTIpJEdcOfWCSstcaw5MH0o3p
 UsHkhSyO4F6cBWs4Ifo+56nW+HQOpD4Qh63EqQn3mSm2Yg2Usc8nIYoFQe7xhWQnEo5x
 VY40BSE7zpiXz6DZQRtUwkIb4JvaUBm8KHOjmQJOCeRI6SknxuDtSeiHthLKQ9AWsnly
 kpb2COZjZTGDU8TwmCni1LmmhGmU+6JSawyICkYCR1ezVIXOWp0Djm9PicxTjDxega/5
 YqDA==
X-Gm-Message-State: AOAM533nvu5scb+t7aQTbtyVA1UNxkeOvEg+1zv2u8+Hkffn5SsZ2+Hk
 6gBiiXZFIJOPkn4SyUphNn2GpTFOwhCyP445Jko+2g==
X-Google-Smtp-Source: ABdhPJxINqrtldMAfp1RuixdZBh3yrpqU3wibiRBYHWZZ2prTtx2oNoZo5e8bE9mh4PCnGhMiX9pm5uK3uybxQQxIFs=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr114451wrr.172.1644963876691; Tue, 15
 Feb 2022 14:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-15-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:24:25 +0000
Message-ID: <CAFEAcA_yJeqQ0rA582cZhCZYxsFL4bVrMYeUvy5mBEQQ9m7ZKA@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] target/arm: Validate tlbi TG matches translation
 granule in use
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For FEAT_LPA2, we will need other ARMVAParameters, which themselves
> depend on the translation granule in use.  We might as well validate
> that the given TG matches; the architecture "does not require that
> the instruction invalidates any entries" if this is not true.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

