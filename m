Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72155535DA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:22:06 +0200 (CEST)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fhd-00019B-9H
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fgQ-0008S0-Ii
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:20:50 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fgP-00056D-5Z
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:20:50 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3177f4ce3e2so110799727b3.5
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TanvPNz//G2FIjNQ4Kdi5rgHo4s6889iGmjShpKYkOU=;
 b=RTMy/3S0tLea/ZHDHvwPuIqPlbr3hXnBr3Q6Bh8g14wMyTSS8Ouk4OOtenliwgFTQg
 diose0TfYD6hO7vN7wfCvIvCUYNir6mg4chEWpRCGZcgfRRH8mHqPoPhtKOR4l1/jnei
 wHJHEIx59CDLc8nzkjS/9hE/1YC2KKz1PqP0pgt6GYrgsIOgakirlmNZwKkPX1Z2QWYH
 eDHAnIeQAVH1q7adXY85nW1ysvGWOWqQLarKhRPrKduwCkaLUQ4b6FbwHeZUvwPykdy0
 NEyb1creQAaoc3qBx10qUyfXj/gytbAm7c5tmlzRVQkIcaFakHIuruelJ0udP2t/K8oU
 W4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TanvPNz//G2FIjNQ4Kdi5rgHo4s6889iGmjShpKYkOU=;
 b=a0bwhhVLyTJZZ7+ISobaT6e4wkw9x0uPx2dHKSP8y3fmlYiA81UFCoCR/Df5D24phU
 TzP/ctFQM7gGvVP/vo7A0EUJgGTYtsvcFzYQ4oMJulWiS4QP4isOa+JueTdVXrHLQcjT
 +S7PU9KDwjiUJhdCrbFJwuA4iuFUNvTN8MBxCfVq6bKSghx7tLslxpHpayBx/gp12N61
 pgPHcUdh5dKPhPgLOrNgz322Si/lenvNQQiYiXx8euILfhm3DQuXDq62pveEdsxgJsVF
 9yjphbxWI2S4VLqalW4F1fm7Hun/xfp32lJrgv4IXO34qKAb3eIzn6+HVuULNJjjQI4H
 2pjw==
X-Gm-Message-State: AJIora+4wDnHNU6l33Bo8PEFxooC/JYDKWrwvCGWPPz4+YewVW94n72N
 jHt0vrGYIih8CSCzMIsL/BFx9343w2zm+w8sjV8W5Q==
X-Google-Smtp-Source: AGRyM1sRe4Kx4AF02RuEoS9cfOuXMFiLNBkuXfdkiwqZeNYEBJ18jlqVBavSye0bw9F7eeZUnJ/fU3GbSTdvQVrS7E0=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr18862645ywb.10.1655824847040; Tue, 21
 Jun 2022 08:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220621014837.189139-1-richard.henderson@linaro.org>
 <20220621014837.189139-3-richard.henderson@linaro.org>
In-Reply-To: <20220621014837.189139-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:20:09 +0100
Message-ID: <CAFEAcA-v=RvRhzqudg8Vff5yUhnhtbsv7ipmn=8kHvPNv+2xOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] util/cacheflush: Merge aarch64 ctr_el0 usage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, npiggin@gmail.com, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 21 Jun 2022 at 02:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Merge init_ctr_el0 into arch_cache_info.  In flush_idcache_range,
> use the pre-computed line sizes from the global variables.
> Use CONFIG_DARWIN in preference to __APPLE__.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

