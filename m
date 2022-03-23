Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7F4E5845
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:18:12 +0100 (CET)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5Yh-00034J-2X
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:18:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5Wy-0001Jr-VT
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:16:24 -0400
Received: from [2607:f8b0:4864:20::b32] (port=41951
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5Wx-0000Ky-JE
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:16:24 -0400
Received: by mail-yb1-xb32.google.com with SMTP id y38so1565290ybi.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mHqPOd69yQ53GZ01PqXjCLD1WAOCktnvZg4jcLbliLE=;
 b=eymrb4BloSnPvpGCeEJjxs/Shsjm7grjxql+re/Ts1mEiNVr6vuZVOzhYtOiLco96B
 2M4Eg/p3R6+aK9TFrUVHoNu704AZUBnlJja6+7b48cJvy8eEmW3fQSHg39pP3fSaXUFH
 NMfMMPxRlXyxUaGuLw/7j6pHy/U53s4J+3TuljkfjNQm99lbCweVmXULlddSS/ecouUE
 vrNH51jGkU6OezDkLAs6aDsa6UPlUgumyz1QDPb62z19454X/QHoic2lxdMtNcgvJvUU
 opbtQDRVywz+WmayCnrWSGldQdNhvTnjJVA0pm5RT9/jyVBTjQmgf1zphiKh3evJ6Gcx
 JJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mHqPOd69yQ53GZ01PqXjCLD1WAOCktnvZg4jcLbliLE=;
 b=cJ5nvYDbK6EUN/XWm/IE0C4AFSb/kiwEWsrGwkJt8YYIGrJs6dXT9HT6DTSobOTQYY
 qKGAjSbvEtZl4Oz72PTEzS63Do1NVxf+X6adSNM5SjxsyKeNt1iqO611feAWcMniTxRE
 4StR+oAz8jcRoPOIqcQT16Tuw+Rcjdem+5+cBWTDoN/kqQMg8y6OXxjzNtMA5+HIbl5T
 3Lv3VyoNenI92hEOGcTroSvYBItPIW58DST+PfpamCAGlyqXUWcJpkVaHgQB/p9NwuCV
 vCmtWlWW0RUw16+RzwxSIBTsA3uyDyPJZD1EMt+cCnJHFeAHuD7oiNLqS+dpeOw4IVLU
 HFqg==
X-Gm-Message-State: AOAM5320fDYlYvqzIaGLELm9feyeNy6Z7+tNOJCYGHDwKskmOQgRaTGj
 E2Vz2MqJuinD3OHrLk3ILeEX1jIkpeb/T4k63SU9cA==
X-Google-Smtp-Source: ABdhPJxYMGYDgTuFBKfn6azNcrG+t7z9JD5IjAMkXzJAB0WzWKyWr9IgHtS3251eQj4MI9GxpeV9l9sG8Nvk/YuHm2s=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr1273911ybf.288.1648059382648; Wed, 23
 Mar 2022 11:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-6-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-6-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:16:09 +0000
Message-ID: <CAFEAcA8OCBd+y9a=p2kDzNiTsczuPWX_gAutSe6xrNA4DavhQg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/core/irq: remove unused 'qemu_irq_split'
 function
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 17:37, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/811

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

