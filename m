Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D83CBAA5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:41:32 +0200 (CEST)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Qu3-0002a0-9n
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Qso-0001ZG-Mn
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:40:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Qsn-0003Pl-2O
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:40:14 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t3so13715398edc.7
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F7nZhr8OL4/8cjX9uRq9EBoz3R0CDrLz+eqwL0azsoM=;
 b=nzhRnc6Gztzap8K41c2OH1EWuo8tuIyHwP4DsvCBK8rNY/rTDqXth+rdxGtPnRwbzM
 DlQ41FD0zNg6I1N8TyNCTw2lTrLv+ePDYSOLqEBD4krEojIH/hBZbkEslzdoX6Bq3Apo
 Nnh4Zd0S0j/d634Wa/BTka6NAz6axNPnd0EjwYXO6esavoT5RWn88pgMNF7ipjrKHhEq
 3jiBgzr3F8NF+JgfDgz204tm6VUgETSgKlbElUoFj4uA7Q3bzKelOB4CaB01PvC9I6bi
 DCJc7iqYPdqJft6EEmCo4Su4bt7xQc077sTuqIHBSZdY/OOCXvi3YgytKl06YvbUyom9
 CJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F7nZhr8OL4/8cjX9uRq9EBoz3R0CDrLz+eqwL0azsoM=;
 b=PH5Xmk2jH/HvljgMlkgPKtTonzoot6OAZyg+bMxA1Os4bioXFqhpRnKyqpqFr44+Xw
 WeUSCPqWodL6ORdYP7rF/4m0e76YTTseMeQGd+AAZeI4scjJTps+m/gcY4sd8BZpv/oe
 6MQoiIbZiB4YkSzhJ1JNL7P6mw2PFpQtDsP5DckSkDDdmLVnnDvlpKH1p/nUZMe/bNM7
 4n8NYdPhXMl8FB7at9Dqu8Ig66YHEyS0QfPgm0fTqngTMyFov/VJZtgW61Br61GthvYu
 6x2RiMkLKmK0wHlMtwvhDOw0vC2cdQZXltBW9Tl6hpC3u39BXUJpc28l86tQ0RoCZONm
 6urA==
X-Gm-Message-State: AOAM5314TdJlbP0ioSofltfGWqpeZg8IZKcbjM3R0VEroc2pElDHVq+R
 u87TqKvtPKovOBEtHpwK7wi4fJIPKmEkAV0EGM6XVA==
X-Google-Smtp-Source: ABdhPJwPjuaasv9vfNIJUIW0QiuRyuutgi2C6bhRxtkle0FfOixtAwvDlCwYCrxt2IVBANufXPmtaaofnije/9a+0nM=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr15714069edy.44.1626453608200; 
 Fri, 16 Jul 2021 09:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-7-peter.maydell@linaro.org>
 <0332b682-1bd0-ca64-65f6-e06e1ad9c0bb@linaro.org>
In-Reply-To: <0332b682-1bd0-ca64-65f6-e06e1ad9c0bb@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 17:39:28 +0100
Message-ID: <CAFEAcA8c+cAs0bGgmShCNLHM-sKOdSDuv_Ow5OrB9iLoQ+eeFg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 06/34] target/arm: Fix 48-bit saturating shifts
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 17:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:36 AM, Peter Maydell wrote:
> > -    return (1ULL << 47) - (src >= 0);
> > +    return sextract64((1ULL << 47) - (src >= 0), 0, 48);
>
> Clearer as
>
>    return src >= 0 ? MAKE_64BIT_MASK(0, 47) : MAKE_64BIT_MASK(47, 17);

Yeah, agreed.

thanks
-- PMM

