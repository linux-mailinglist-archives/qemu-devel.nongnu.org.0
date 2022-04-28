Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A141513271
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:27:11 +0200 (CEST)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Ig-0005dp-4f
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1ZD-0001Mh-PB
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:40:12 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:41109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1ZB-0000l1-Iy
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:40:10 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ebf4b91212so48000477b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfaqFGYSmUWDoTVIJBIrhuCCHtdKf4KB0WH5Ybu8bLc=;
 b=ParEaFu4HEn1ooqip+dn5rF9B6LVRGTX/QRZZHNlKeZXcDG6hjig07C3fZ1vud20QO
 YU10Ps6pmffEY7e8CU+6Q7vn+zH0hm4ocimY3Klhk8xleVc6aLECNcHT4J2XjCRaDKpp
 mTyq6hN5ku8a7ivfZAlOwoGY1FqANKGYy53zhfxzp2gkCsAeXOYMV2yNe48FJYC1UVRc
 AOxmmU3WaQKoUtgFdcaRH5f0nmqteEPZ3p4iXo5jAaYA9qmVD4uoyg+KprFkbEHCgs1u
 S8Tjse1iUjbdNlMowqk1pCfTuy1qj099mZx6zY5ai4hCYtIx1jMTdMn87IPQSZkjlq8S
 P6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfaqFGYSmUWDoTVIJBIrhuCCHtdKf4KB0WH5Ybu8bLc=;
 b=JD8hH5whtfXAOlHx6wP2tDWPUe0Q4aqOliFuYklCMTje3lvQwPQnd8h1hGib2DY2y/
 CeOttPaxiiIXc9vp3f5wJ6RdHcLaSJePCA8ddG+/X6u/zy/hDz/201cTSa/Bz0dwisrR
 76cFC4gdLyad4RDj0poddk9S2ZWXIvaG15O8Re71eUfvj2EKU/XeJGP4bIE7kfrW+5wa
 hKAPWKu+8LzbOc7QGCvxhQQcJDHnDbl9ub1t7+IjuTHkJ7I0qM0JbfYL67ntlSUIXO9D
 OXDu90W1hPsRIAs/nq62lNyYvdkHdR2w8neY+dJRAzcZfDOvSA+NHA8C35Uu0xBX9JhM
 yLBQ==
X-Gm-Message-State: AOAM533AT2jVJrPwd9oM2aZlh1twHCkDBtThdiz5R14W9Ld/Y0kxNeKs
 3MAv2jLFOuBm+Fzi0Wxyc/wt2y6xu6MPK9NPJeuAEkCtvDw=
X-Google-Smtp-Source: ABdhPJzk/hRCl1rlXurlFmiv6sflX09mg8iPxtZKI43jGKdt4PhyMM4DfBxA7M1NtNCtRMAzRTPYJWUz1yQqfhb4Z2o=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr23137831ywb.469.1651142408337; Thu, 28
 Apr 2022 03:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-36-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:39:57 +0100
Message-ID: <CAFEAcA__A62QXfAQv9E_QrK7fNftkupiOHjjvOqy5Zr9W=zDYg@mail.gmail.com>
Subject: Re: [PATCH 35/47] target/arm: Use tcg_constant in trans_CSEL
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

On Tue, 26 Apr 2022 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

