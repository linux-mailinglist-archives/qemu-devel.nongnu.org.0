Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8CF675CAB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 19:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIw3B-0002je-5s; Fri, 20 Jan 2023 13:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw39-0002jH-Oe
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:23:39 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw38-0000Lv-4O
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:23:39 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso9873115pjg.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 10:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nfzD+17/Up7Ma5lDsT8nChWEegSPN3XuavFOi5YkAzo=;
 b=NCr54sDa+rgNiB11oiZdXE+LvayuYrvNvXCNastpWtjEeXvwagSG5nrZseyo7F87hG
 AzFhHVsoQ+S6iBc2MgVxAIjbztsNAFhToJbJAU9fS1AUxpAwUNNVjp8/vDzeOy/qfPRS
 JyRFyKpnCCH7AnbopO3mRqULICMzc7elZbNvoBWo8mpWX8VYaSLSArm8L/+0ZYQI67in
 WArmYN3QAuWioA2Lj0kYo1kVuKjRJn4o4Kq6kjjxZU4XkMI9iFhkxEW+QHSMXavQw0Zz
 mv66ffxNKspIQdWJg67Uio5+cIT9aAZ2zr4W1NWEyB7u0UbrcQWHxhGgRm/kjbfbKVfj
 Lyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nfzD+17/Up7Ma5lDsT8nChWEegSPN3XuavFOi5YkAzo=;
 b=gVDtnH7i4VgSLjPCy8d486IcgqSzyTvkH1C2eOheH2frSOivoY9r1AnS3/JfzLuQiE
 fnoE+kwTPbc71YDbaArSVxUGcAgCjoxMiULLvu6jJtIs4aocl8lhgivPOdEnUZivUPOJ
 S9eR7V4GhQXHBu9VYnpoMG7YRmgrbJIiv/CZfKdWFUPbw5k8pGU9edCorp24kcvmIRp/
 z0FQUSfQFevZqmhZLDWRNVbO7YyDR+l5QMvSGEc9t9CEi/8o2acnTNIR+tIgV3eTgj1k
 XaTPK8Pc5zZgLW9Fbb61CHbXOL7Ct+0zkCFUDZVJCzy8Oeq4wwvtnjYM0DhYzpFWIB3O
 oWBQ==
X-Gm-Message-State: AFqh2krbhLI8UjnSuLXa7EVR9tINpSysODNKsZg7FTyx0mGYD8/mPS10
 P2ovJbLK5ALSRbjfpvnjVL6ax8CIqKpxv5XhlgLgfw==
X-Google-Smtp-Source: AMrXdXti28Ncw7VdUzevEoqPIzLTJDwXwb8+AIwA+HTEPlfseXd6ZH/WNQ0WQzv2pJsrSQXUktb0hNFfEJizupd/yUQ=
X-Received: by 2002:a17:90a:53e4:b0:22b:b025:38ed with SMTP id
 y91-20020a17090a53e400b0022bb02538edmr347673pjh.19.1674239016768; Fri, 20 Jan
 2023 10:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:23:25 +0000
Message-ID: <CAFEAcA8JK=5P2zouaEZ=zhnwTFUwSospFoa7X+SW6=tnkKAdJg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 currently lacks a reset method. Implement it.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 26 +++++++++++++++++++++-----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

