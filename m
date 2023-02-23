Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EA6A0E19
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEZx-0000WP-V9; Thu, 23 Feb 2023 11:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEZv-0000S4-J0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:36:19 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEZt-0000Js-KI
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:36:19 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 130so3468504pgg.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sa7PV2nXBXdAlCvEmxHvm2m/RDngqt4wtmZrWM+E0z4=;
 b=aDnBO6XnnR0wHCaY2toi/fDPPbIkv1MTuNDOizX8UG4kDrS+M5a339+wO4KGvk9k08
 3QTOlRzthqyXFXflGAB3kJJO8wKR0qMQSSf/OOiNM7KFggTVqUUmUxa5QPuRbLAb5518
 H9dd4yc7OdVvDRea3+uaCQ4Gk/pLOItRrFAfA1PdnMbh8EhliPlI/c4KkPmFSkGgcQCc
 EaW3oBjFXLgEWsbexgUAokxcflMmaYFd8hRuZ1eOn+Qe3P4CwKKo3QcW90zPTdJa0Brx
 vRgtyGnP82xGuQsAZBDMzqhqSWypQkUL4GzYNI5ofEyvOI4o0jW623NMXV0huB5QqGum
 Q6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sa7PV2nXBXdAlCvEmxHvm2m/RDngqt4wtmZrWM+E0z4=;
 b=JyOLyYNtZfc2n8n7EmYTsH8LIZT7vUT8yTdBUN0tesZfvgh+bfr4cKxBrZzWqWd7h5
 KHdaJsYtPer35mwyE0J8ABRZHC5m5rq6rVM5lF7f9mQgiEpl4Mqzah/9S23hGMNanzHb
 DunaMPcIhFNphkIWXYl3Asi0Kw2rWb8OdREB7JLQPDYps1l6ZR/sPjv6gUKwBMwkNaof
 c35YiIW/ZPTOYoio2FlzZbd5knjNONedFKXvv6UYiaynyt5ogdPZYyjqppzafjuJRE7f
 H4Jb77QzWg3ud20d7mjFel8Vlza2yUHmfx9T2XmLRhBzhWrtkoNcvBBSG4ai8gC1chmu
 8MJw==
X-Gm-Message-State: AO0yUKWyKUjWPK25WHNHImzT3mpDn+9wlzWtft3VRzxmUOnHoeC4J9pf
 e53rpN8ppae5nuQs1YJ+nQsJhi9cMkkHYXkGr4kSbQ==
X-Google-Smtp-Source: AK7set/2mE0zMTOg8DuCnBiWZid5jCEAZQa7Du+KSHj6Pc0YgttHnhbQE7m2qcN6u/w4XiTg+WAIGDYdv4yLyqLp8nQ=
X-Received: by 2002:a63:6dc8:0:b0:4fb:b556:c9fc with SMTP id
 i191-20020a636dc8000000b004fbb556c9fcmr1813494pgc.9.1677170175518; Thu, 23
 Feb 2023 08:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-18-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:36:04 +0000
Message-ID: <CAFEAcA_AOd=swPveyTs=icGN1Hrbhr7vwgrpA0Bebme_UWxq1Q@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] target/arm: Move mte check for store-exclusive
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Push the mte check behind the exclusive_addr check.
> Document the several ways that we are still out of spec
> with this implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

