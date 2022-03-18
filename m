Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD324DD9AA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:20:56 +0100 (CET)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBbD-0003MP-FL
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:20:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBRv-0003q9-EA
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:11:21 -0400
Received: from [2607:f8b0:4864:20::112f] (port=38481
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBRu-0005tQ-16
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:11:19 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e592e700acso88884017b3.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2W02vop6NnPDtP6KCZyY5M0IPWVpcM7SO8ypdL7epIQ=;
 b=ZQT2CQu5HafzdBAh0+lIrd5kLCnQ6Z3cAg1rfEgYVHsWUYDiT1a3ozkGdklD62yihh
 QiEA0BNB1yaDb/cec5QItVvheyiVnvbC2WHbIIHH3k6Is4k3K8dtj4EJPD2ty+v7fVrV
 l9y474Z6YrYxk7EEs0cNjwzO7GpvmKCMpk4UTYMlmHJqhnKQjtwsMOZux6B4x9v3Prlk
 mA1E2o3FDUEun9Fqu5ljftFU6ZgzeNAHaV0mo+rf0SYM5WoQmBiW2GHNBMQHKnyPS3jQ
 7BVT4AFxK0uBLM0M3gOVaXPcAfW9FH6l0NLkqUz4xcx/TpnJJZ1AYIdM349/2eGueKwU
 8rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2W02vop6NnPDtP6KCZyY5M0IPWVpcM7SO8ypdL7epIQ=;
 b=h7DFzemFW5J9jRi1hvdcao3zP/vtu4+3oGaTzFiJTkvoVxD5qOrRCcneMoITZ1w2pA
 X7YQFcjmwHSLYFd8iyIyuU+Karq0PVgIOF20pRNBBSqLhlGbgN1m2aXTZKSd5IX+Z4vm
 B6zEFwxxGr6xr/flW0l2TF+Ib8GdN/q5ZbRlowkS8rXotUqBxjVU/s3tg9h61C0ubfIJ
 EXJj5aILOeWuBxyZjDOlZ/Q6AGIsj7imHtrkvnvc05nFKY1BRdn7B5TqPzkN2KskXKiQ
 qPN4v/OTDK1FwW/YBQO75C44hQGwkzOxAJ6uMhb2LrQVX2pGWU4kKhuotcTasjNqpiGh
 8rRQ==
X-Gm-Message-State: AOAM532lAcm8R5rze6Euu2DbGT6WumsFt+f7p8AbUNnThAtN2uhQZ5CJ
 q8k2A6GSxS2Ou8dVhCxvjgfcf35a4ZJ+OVx92DrMug==
X-Google-Smtp-Source: ABdhPJyXbXhFhfuB9uju9zKiDDg28nRUpcnvZ0sSJr78LUeWr8HNnz3g3TEQEv0A5HiuDYSU1xdwFHOpEG5hUi/kXyQ=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr10538367ywk.455.1647605477039; Fri, 18
 Mar 2022 05:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-5-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-5-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 12:11:05 +0000
Message-ID: <CAFEAcA99HwWPjJqkJQ-y_rXimx+O9cPQiaGaV_TiLOwoxjOEFQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] hvf: rename struct hvf_slot to HVFSlot
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> Follow the QEMU coding style. Structured type names are in CamelCase.
>
> Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

