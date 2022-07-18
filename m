Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88915781A6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:09:12 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPYl-0004pZ-Uy
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPWY-0000qh-FU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:06:54 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPWV-00083z-DY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:06:54 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c89653790so104010767b3.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0p5dw0Fhmgk5ZebZo2UiZaVDlaAVVAqWk8uDDVIwDc=;
 b=DMJ/LNhQSMz55hbvXcB/KYNzvUnD50LfkK8cszCuHjYSUa2OBE5cxcEH1F0L21SkGZ
 35dfw76u6CenFCTaXUneaFICHCAbEeaIvlN/5Eb5e6ChfEf6T8D8EhkpyqgigKupSwVs
 lcvapndp4vU1E5DLsIu6RQ+XBqSaidXdApVcaKnYlLwH96XSqmPhiS7Sr+61oeNEyhw/
 sjgEdiBSoTOvk3nEWLjRqvpYOBd33RGdvTTH2rau9VkuQrJV/UX4sKg8a6rt6IIr65E1
 LQ5Iit9/BJXPkMwYuPodPcUWlMUgc8o8kVuSSEIIw0px8Os2oRAasWS9hzjguboPEMlD
 T+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0p5dw0Fhmgk5ZebZo2UiZaVDlaAVVAqWk8uDDVIwDc=;
 b=EvoyuhF3dV4/gYOyJ9V+b15kJGT28Ezg5XpQ1s9TZkcHtdciP/53yOKoeQ6WsOT5xh
 hE7j2nZ+CvLMKG00CXbPTqN2paVw27ipclE0l546bfQ8GEMv8dDMyWl7Fb01Kty44M9h
 3NxgsjK43EV69ttvxEkA3uuBFD+xqFU/e+OhFautlO0QPe0QoEj2hmVt6z+2YVEimGPF
 5CNar7tvfMEAzxQ1qF69FeL3XieE40V4JQOG1RbAsd++Kl6BwMa/+LjB+/1mHtqssQGG
 W90FePzuK8wu8eAqiMuhXj+KO4rehmcwCjhGW4zltADxPLIAL3A1KOLRwejPRIUf2Gog
 m76w==
X-Gm-Message-State: AJIora/3fK2OTCpODsDVdmtdyB1BRsewsXbw4JYmF3BAqkG6MwZs7tXN
 zY3KVu3dsQKV2TmeMev8Vw7DJcuA1RpzTORJMEa6zLQ9ISQ=
X-Google-Smtp-Source: AGRyM1sb9v4OnpYwAdujnRgPqcjXNx0nJyszaxkbEGaJ2WvIanz7rGWxK3fMOq12wl6TUobvc45C06kzy7Ieop9vm5k=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr29573350ywb.257.1658146010272; Mon, 18
 Jul 2022 05:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-25-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:06:38 +0100
Message-ID: <CAFEAcA81+ei2kc0t9vviR9f9uA3xmeVaz-oo8PhioA0AUSP2_A@mail.gmail.com>
Subject: Re: [RISU PATCH v4 24/29] Add --fulldump and --diffdup options
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 8 Jul 2022 at 17:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These allow the inspection of the trace files.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

