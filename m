Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8A53F915
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:07:37 +0200 (CEST)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVBY-000136-3w
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUvh-0007sY-4g
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:51:13 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUvf-0003rY-9k
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:51:12 -0400
Received: by mail-yb1-xb33.google.com with SMTP id g201so2169771ybf.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbSqCXHJKmDx3SNsT1EOjb100Zgdd8ZCRDv/YCy5RVw=;
 b=mvRDfPnLMS9awug5YY58gfgRuacWkv9z7Jhvr8YMPfJVVl4kP8wzstMF/U5H3wQqrh
 piFT8cmD91L/1Pz5Ng7mPLkqBLDhltIq+S++tQleZROztHswNkQTcyrD6ynHzanCIzDn
 BXPuazcdIJEbj8S3zVIBlGmu0k5ZdjL/8mcA2wMaXqYFxF6MnLlijn/SpWbQU/YBXolr
 JVoTDRyo6ESVnUYyVvFTmqDYeFUuVEVgfViTjWA9uKh+1NKdJ1VtivE5BCHcNwe+YmUy
 xoosn5BZq/nt+vytMG+hgW9t9pJaHdJgMeKHNGIZAkZkHwwxWNBov7jHXeRMIjbwYYHZ
 Xtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbSqCXHJKmDx3SNsT1EOjb100Zgdd8ZCRDv/YCy5RVw=;
 b=Ttk62bgJTkiB5xkICcQ5Kfps0ez9UudZozk7l7ikUY33n3T0mnjF8nE8Ky5/Tcwz/L
 Qa/gZzvx6cAooNJOgCdw2158Hb7/RRGmAPdpozqJC+us2zIeEn854wvTHNgHeN32YygQ
 VHHXve1sXKzg8koRAr+obW9MWbok2dINEppKRSLqBBIzVmlwwX1+JYbJpMAlyVULHwms
 TLOwx7NLaYvfObvD2mRWE/olLjloXhXgrirs9SGKVVfXfTTcdJW2qtMLb9pMVilK1tkU
 LBMfoKiOlMUVTbuUhue9hsIQzJweEdutsDt67eP7BcmyoJoeaH5Pt7HRUjnj2KlrK6wf
 bvkQ==
X-Gm-Message-State: AOAM5313gg9ianQ3LF6i/xfNi5ecO+p+7vkU2rkI50TPuY0Bom3CwVFw
 aSDCujjGDLmIh94Fe3W1cgHrMMyeUX+9wcxwQlbmDlTdB0E=
X-Google-Smtp-Source: ABdhPJyh3SwYka5HcbYouRYjFai+sY+qrjm0oHibPl+TnoFCVyeFiCkedxABgV8mf6OeBf2FlNPlZf70iHBrtbwvvy0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr29411768ybq.67.1654591870195; Tue, 07
 Jun 2022 01:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-36-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:50:59 +0100
Message-ID: <CAFEAcA_aAY3jpOFBR0_aNAUubfQr=r6_Y3Z0KTz+F+Zuakn6NA@mail.gmail.com>
Subject: Re: [PATCH 35/71] target/arm: Move arm_cpu_*_finalize to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2 Jun 2022 at 23:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the aa32-only inline fallbacks,
> and just use a couple of ifdefs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

