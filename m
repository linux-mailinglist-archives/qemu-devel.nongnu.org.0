Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904E64DEFC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 17:52:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5rSf-0001dA-5g; Thu, 15 Dec 2022 11:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5rSZ-0001cR-F8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:51:51 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5rSX-0007T9-Dl
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:51:50 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gt4so11113492pjb.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/wK70+gnOYAypc8MJwkonLfllaOGcAkSkJE46tDzpx0=;
 b=SdSKyoDeHcdfEA6q8CpnPKxUnsX+V0DVlmx52nTnJa87Bdzv9CtWEInOvS29W/ErOv
 kI5NdRCEvqbA3fR9klCmOlp0W41jNK+IVKcIxADp/8iyE5hAKsR7HIQ0nJw4GriXzYrp
 QKAuc3hLCCmha6ktaUVE8yB6cBbOsZ3CamggHiR2gbRMiJe4dGy7/I5EoIXDdOqvM+AA
 ZOdYXS/QeTcO2QEOjCUJEYTWbCCX/kPhmZPBBQTN7dqc6aOcxu92yNnM+AYLhlYHYtkv
 ag50kLps9d13g7xgopuvo9T8MXs4FSHtD7fE+ZxW4OEqVSM/I85GhORWbIV6vGralbqp
 tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/wK70+gnOYAypc8MJwkonLfllaOGcAkSkJE46tDzpx0=;
 b=ZQqCSAsjnQAKeJ/gvivDqhJX6ZxdOqXPIx/zcrV+2b4qQF9Je3YcFC1kEJFrbQ+G+J
 JMAh8/JRFrdCQla4ztyCI4tk05yUgwCjZXLeBaVs91l1AW4BilB62NAuBjpkQcHssGcp
 RKzIFIZNXbUu1AYxSdRDSb4UKfjj/yra16VzWIye72O046eIXAZfQwRwear/D2UMSit+
 UCuLlf4jXRcLDBDi2VkMgn9N84G7neF6KHaufJAF5TG5JX2N0Q6GmsMQ6pxy39iQNZdF
 Az6YR7IllCKssyJxOWwNS1i/OdySeobmBtkvC2QIqdZWBGof1h5eyPRWO3Eu0ZiyOpgf
 sULg==
X-Gm-Message-State: ANoB5plbISlZAyf7VgyFTPUdz+vCbLJcEx0Jh5g16xaFxsQbtuFwyyaE
 2TzSAaTu4b1PST+UPTYOnj3inq+TPGLd0ktrW7Pd5w==
X-Google-Smtp-Source: AA0mqf7ZCWQrjOsSZBKfO85aQ9VwTLPNsJSfAUQc1O84N7cIIiMB1tV/0f/BvZKN/MBshfum2HZ+HntvezbfO+kMg8o=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23455973pla.168.1671123106646; Thu, 15
 Dec 2022 08:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
In-Reply-To: <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 16:51:35 +0000
Message-ID: <CAFEAcA8bD7SnHTL8r0cwjdUOJ4katcdgSqkLnknp1++JT5CKjg@mail.gmail.com>
Subject: Re: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, f4bug@amsat.org, 
 mst@redhat.com, zhouyibo@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Tue, 13 Dec 2022 at 13:36, Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
>
> Before using any flatview, sanity check we're not during a memory
> region transaction or the map can be invalid.
>
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>  include/exec/memory.h | 9 +++++++++
>  softmmu/memory.c      | 1 -
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 91f8a2395a..b43cd46084 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1069,8 +1069,17 @@ struct FlatView {
>      MemoryRegion *root;
>  };
>
> +static unsigned memory_region_transaction_depth;

This looks odd. If you define a static variable in a
header file then each .c file which directly or indirectly
includes the header will get its own private copy of the
variable. This probably isn't what you want...

thanks
-- PMM

