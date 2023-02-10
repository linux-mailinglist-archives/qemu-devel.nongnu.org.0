Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B1691FB0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:23:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTLr-0004Rs-CM; Fri, 10 Feb 2023 08:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTLo-0004O5-3V
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:22:04 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTLm-0004gt-HW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:22:03 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 gj9-20020a17090b108900b0023114156d36so9331298pjb.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X5DjDxf+vVbTXxHByiTyHYe0fPglJNAodfV78mD5iU0=;
 b=BqPW1ElIdXpRXQp/pskOxdo5YlnUCHy5ONGxQirY6D07peeKa+6vdGs+IEqtc60lbM
 D8hncUNATxOxMqfzTnweRV9vls1YZQlkpvSjZ9z7oSypDo5G55yeZ59szgJA8rkJq3rM
 xirNhv7VA1yAVJpI5rGflwU1Tw0zC4C9VZbyI+OJEquZ89OsLY0hTjVsB5ApETF+Hxbk
 LUWe6rA7XeztASe/AdoiA5UHK+6/dZKa6381zqVPhVi506mv9s6i9c8ogtrJRPH0W8AO
 k0/EaFQeCbR0Ggv/7VDAfyh4fSoXWsiyU+3uc2Sypqmie2CPwpARkFZcaEaMoBQJJtFM
 x5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5DjDxf+vVbTXxHByiTyHYe0fPglJNAodfV78mD5iU0=;
 b=qPVImNOi8mWNcYo+c2dt1XGp29KJN1NCOt0rLot5Lkg7EoZMpvaC5D8fZrMr+p+4z5
 v27E3bq6RWdzFnkqdXbE3noaoErNzH+N7vjfOehH4MLQxAW9MHvsWtjMAaHKYi99Lk5R
 D18IJRnXbqhUmCEzgNtvPUXCfhhE9eoUkXEkCNPjmbdH/HJ1Y9Sh6JIxLsg6BBwIHu/D
 KsXcjWmcPz3dlJt01XHjE0VIYQ7OJzS44DRIxrGKqwQBb16aRMlc8V7yF+ddAV5uqlYG
 DhpbR1Xkq1QbIABFA1xtke7ExATRwhoGSDKJEHibLVywDJKhDBNxZ9whE/DFyQBrn89p
 AizQ==
X-Gm-Message-State: AO0yUKXlApHly9pkvamY3R13JEF6bkzoEWthhd9HZMbS7H2tdYEoHeCl
 B/fMr2ewk+5FbJOXB38hyBYp12cacboMi3VTU2/TJA==
X-Google-Smtp-Source: AK7set9WTA8M9QdTITezYAheazExGo1k3GTnKR78iB2qIZ1+UMF6kOPVKP2o0SiSMrwXZPCjZCckDMARrCKa4B9ZdDM=
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr1590939pjn.89.1676035320838; Fri, 10 Feb
 2023 05:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-16-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:21:49 +0000
Message-ID: <CAFEAcA89_2i4z_5X9MQTY5DE_Nj14r+Mh7Yi+m6zwi3qD=_B4Q@mail.gmail.com>
Subject: Re: [PATCH 15/22] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not provide a fast-path for physical addresses,
> as those will need to be validated for GPC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

