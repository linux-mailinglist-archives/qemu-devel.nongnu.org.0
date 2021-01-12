Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448082F2D3D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:54:33 +0100 (CET)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHJo-0005Cy-9L
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGfG-0004ho-Dn
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:12:38 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGfE-0000hy-Rq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:12:38 -0500
Received: by mail-ej1-x62c.google.com with SMTP id g20so2728403ejb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/Y7ppQtuS3fpbvTdFYBXtOH/K4xhXeo13718pbsi7w=;
 b=T2Lo5AapG/JU9dByJ+7LcCJwR3tSTlaWBFWfDclNmZTqg0IqKwQo3xES1dRlZzd224
 Zngzfo76MS5hrKPz0IHSrpU0iJBy8r986grm17/l552Mwr7Q1Y9F4sgOf00fYJ7OsKHt
 ZUbMuJUqRqXc1V8wm2hFvwvYUlcE52BytT+3uMQu7VJrfE8WmFn3fblL8D9Nh+TNlEev
 g0W7CpiSD8B/GL6YvN7FX0pJIPO7AoaiDVXG8lLiTNF4XP5y796FGGMWkgS5kWLcxKys
 DdqmceMd7zce7LLcMz7c9ARhIEJQzlRB20NbtDjKEE3h4rZ0qCXPoF9kSm0ZD5LX68Sr
 yyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/Y7ppQtuS3fpbvTdFYBXtOH/K4xhXeo13718pbsi7w=;
 b=tQUfYSwvxwdAR1VEqFORFoY9vafbd0apSBsjXE9bt+1CGgw7SVASz2lYZyGixd0J3h
 FCZ4m+g/GN1hRMqf9VWqbJmE6GB9N5u1c9t2dziruy5l6RNfE2d8TnfD1sjW8EH+7fgC
 8e4+po8S1B/UEwm51qrCWlkfUFmZolrNtGnJc6edNeSCjY8cfCplRzpj6LVmc3Nsy2wV
 tUhqzg3lRNd/56rG1XozgObw9K1DJYXc4gWfCfTgpkesKzYEVaZDW1bT420lZbY+xOy8
 UQqB3MHJ1iRZa0tw0pN/UnGg2ZAKJAVN+jC0sg6AQW7JIc5MhIDsZJGajYVIph1Qtyhv
 NM2Q==
X-Gm-Message-State: AOAM5305v4bY70+/9V8TSRTlaELSZ/+pnG3XDow57cGeBuWryO1vWVCN
 HvFyTvpl+KOTsFNIa2ShSL3D2DjHhl26kaVSbmLwYQ==
X-Google-Smtp-Source: ABdhPJxIEqPc+S6f5Mix5z88ll5pR/5CINYN/VWV6LUZgNtzRfsfQQOeTHd2tKp94CBp8D5oRScMADJ95pV0en/tkqQ=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2622714ejf.407.1610446355490; 
 Tue, 12 Jan 2021 02:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:12:24 +0000
Message-ID: <CAFEAcA_YnV7dOUAGtxqVm==wg3W9PoVNrh4U0EJHK1C8o8f5dw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: various changes to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 18:51, Leif Lindholm <leif@nuviainc.com> wrote:
>
> First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).
>
> Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
> by the ARM ARM.
>
> Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
> I was unsure of prefererred naming - Ttype7-Ttype1?).
>
> Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,
>
> Lastly, add all ID_ (aarch32) registers/fields.
>
> Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
> submitting shortly, and some of those features also exist for aarch32.



Applied to target-arm.next, thanks.

-- PMM

