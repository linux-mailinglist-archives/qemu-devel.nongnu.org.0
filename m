Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907864BA839
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:29:10 +0100 (CET)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlWf-0000E2-K4
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKlVe-0007uY-6x
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:28:06 -0500
Received: from [2607:f8b0:4864:20::1131] (port=46228
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKlVc-00053B-8H
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:28:05 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d07c4a0d06so41617787b3.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FTZhiIlTYR3afH0CyngXtoVkK46qG8SRdl/oEM+O84I=;
 b=vJCGnWtjV7t1oPIqdzhlw8akYWTfh95CKubAyest75aBwolyQcYsb1DHQAkMmfAvj9
 e4U4DXCXpyiGNwIowFT+7i8MqmufVPE0vHC0DyoKA7+fPwTmKeJevLSM7tvNjrRDB8K3
 f7FqYXK6z+C3tCHrnA8lCpEqSdHWrW5LQkgmGD2073hw9ZYinI+7heaZGm11BrpZa+HE
 KalPHGEg4KfmfzwozCxrlbzKWQkJLhpMSdXoMyKLvHtJj07RubA3sQpED49beCNv0MWV
 SMaZYo+dIhT4zhQeCJeA4ZMFDiOqHqxpI6vg/W14V3sE6rYxwboCJ1GEdw6XU+RMluAP
 mFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FTZhiIlTYR3afH0CyngXtoVkK46qG8SRdl/oEM+O84I=;
 b=REuYCB2tQUdY7yU334KASXujpI4+8QnddCdjyotP1sKT9rt0gDGd/Te4fNFta77dku
 kRW8GzGcxlp+ksPTgzQomEaCTPP1gu8X8PYxNyAX45R0/vljMndZb6x/zl1mCwTK9zZQ
 cFx8AjmRGip31C5ZsAcEbc32M9AkdZ5LkpsdCIl8j4HjdxbqnOM6dVDvprpc6Ci8yTMT
 FDLieMMfEIACsVEZQadWKKsE0Gq/ED1XMR+QSAk+B5+64mHwXRTh28GzLiIC9ScpNPbR
 8+cmxl3JLyQk1MrVE+YZGFHXToTb4PIwiKApXEFVyjfe7d39DCLOitaNEYNk8Ki8OZUg
 qmEA==
X-Gm-Message-State: AOAM531VnvPYojOHJLvOOfv5z4X1VtHIXssy8fccZ1FDHdyLSLoWR6Qg
 wrEudzyLntcbEhz/ZMWaNg9uF/6DdGJULew2nIQVPA==
X-Google-Smtp-Source: ABdhPJxG6oFjTsTw80Qes3P3S9pdbYezXz6Y90fOZ4iOBxFD/reZ4fiTf9Yu72olAxPr1b8dmPQ+I5hnNwHRlkodOzw=
X-Received: by 2002:a81:e20c:0:b0:2cb:66fa:df1f with SMTP id
 p12-20020a81e20c000000b002cb66fadf1fmr3811033ywl.455.1645122483298; Thu, 17
 Feb 2022 10:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-2-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 18:27:52 +0000
Message-ID: <CAFEAcA_ct2Mp9EaZ6QoAjm_k2FtgbTPp8kDVxLmChmNFx0xZjA@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> From: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20220213021215.1974-1-akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

