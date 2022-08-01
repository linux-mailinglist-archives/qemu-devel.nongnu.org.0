Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71957586837
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 13:37:00 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oITjH-0008Hq-JF
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 07:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITdd-00037K-Cw
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:31:09 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITda-0006B6-1N
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:31:09 -0400
Received: by mail-yb1-xb34.google.com with SMTP id 141so18201991ybn.4
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
 b=nF8h7HZP8TFNl0JFcQ/onEkOFOMx+y5ev32NeAzJ7/7rF4ezEdXbUhXYVP0V4eJ0TK
 bsHdn/+sW1YIlhr2jFoUk8tTtOAQeQNnXRVnvV2pKoJs/CzF5WWvwBQ9x5XFbBCWtWOh
 0zp4YM/Ne8jZVJEXd1f6ka8ug57RClqKbhv4O1lpxt8QAJDb1IIgExd3s6scHrM+t4aF
 u4V5sWgAj9L5H31HltmlE8vHIni7igK6s8adhZjo8yBI+nalfxayVC3Ttwgfvu9jfqHl
 4W2Q5KWma2Pqgp/Roe8NNGepcHqqGe9bA5ymZnHrY+vPcLaeQixmrNx/i4LtknQmtyqp
 EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
 b=7JGjU0SzPmvSO+Pi7Oh9lStP+XVeFn5yhbXzHUYvlKuLn/hwsNch7NY/rYhYijk9v9
 XCvIRvqvU5WSAeW9kxWtgMl3k+5jJpMC9aVJqElEMlopo0hOxQEZVXl3vqSEBXTwjiaV
 Wof4fanNQBNBAPEmxDqXhySke9oUWShZJyOmiy0Kd+Zg5KODjHkK8vIiPY3kkDhYq8nY
 Zd+9CYtptLp/QWLpqPyHZoPCxbxW9dFo4yRLZRkmTqXfmDJqzUvYNZaedxaD9JFIIsQM
 tKpUCcNwpYj6TIi/SWXwglku3R34WuIZNpTKJutiLZXuqZg35ALP+Ht+rjHJcnyg2JcB
 eFgw==
X-Gm-Message-State: ACgBeo1spwbBhywVY78dej1/gIGw1xwbYhhZQwsVSSojxpVQdlKsS07q
 MX6PI1hT/RenA4ZBcxFlFgKHIziMje+DU1T/I94ZRPLPemQ=
X-Google-Smtp-Source: AA6agR5Tt2UEpAe7tNj/VUIKuenfBZH85WAMurnDF5WF5B6eWrM+pnZZ+C0xhiMZIYfmya4Y6JC81ip1v5TmYYNmWt8=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr10583789ybq.140.1659353465054; Mon, 01
 Aug 2022 04:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-5-qemu@ben.fluff.org>
In-Reply-To: <20220727223905.624285-5-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:30:54 +0100
Message-ID: <CAFEAcA8JLLcPfMSfnKhsZdtXzWCkfLEFrzwL0BVh9+4ncZCTDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/mips: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Wed, 27 Jul 2022 at 23:40, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

