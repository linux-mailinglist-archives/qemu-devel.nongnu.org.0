Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C164801A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Zg6-0001nP-T9; Fri, 09 Dec 2022 04:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zfz-0001ha-NE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:28:16 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zfx-00031D-OT
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:28:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m19so3114702wms.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cvfLGqPHS43kpZqt+2Qls2eDCxbv51lrviCtY8VwmYE=;
 b=P2Mjpchx70Cogxna9JcKqEVYzz9NFfGoBlwCviUKI5X9pXo0ibIYemCNukcNmKKtYu
 hv+j5bqZuJfCRezOiPWQ8npDIIYIX7JndXHWeBQ2a6Ign9eKsWYnO5YsnWK0s60vJynC
 Yn+okS6X8z/Qd1ifNTQbpUmFw7HtsYRivHkL6s0FohZgCvEpdWF4tfgJC9vcxmrCrXRQ
 /uopgtTDqsBJGey+9vOQGRCB8pK+ojM6IPkjMMJr9aox2gBrk8l0Y+Yg1x/DOvL2e5lW
 PK2Mr++kau6ehUcKtIOjVOrsDBM6HhYvQhy/rUZNC+ysGyAdhZdDsUg9wzvkl0nCAoxR
 bV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cvfLGqPHS43kpZqt+2Qls2eDCxbv51lrviCtY8VwmYE=;
 b=LHdy2WYld0afSa/qdEATWu0Nna80gc/amR87m+/LvOg9ygGcEmm5/Eswpz/DJSVGsM
 gO0WDu3rSJ0ftrwr2n+dk+fIZRkqUnvhUGq/VG0AU9Ebudemm3pkMJMs8FrFR5bzY/tA
 evyVv4JAbBUfS9PZ1RntZ8BKZ4J2/E96GRigmu7k/+nwCWNCpynxGeQ1QPSB8QlrIxeH
 IYC0QEbrb1i6Oq4KaQ/cWxtEVfbCi6UwzjIbhV8z82ywdOv5/I7Uqsg4PAZy/gLo+ZjP
 NQLWM8KT7wElNSlHpWZMZT3TWn1sBUXRSBXy2qDaz2U9qXGNIB+5+d1+e0mftRkbMqyg
 WPDg==
X-Gm-Message-State: ANoB5pk5g8g963hHWo2sRV3jVKhwzW4SIw9qnNd+NsQUGvmxPNEk21ZS
 zoknTU5GLj/K2dyChXP1wHkHow==
X-Google-Smtp-Source: AA0mqf58E48FmX6mChNSxkH+iRikgX6voTLWSsmVyganATdiBfrEhTbJyVip0Yu1ggSOe586pysJdQ==
X-Received: by 2002:a05:600c:1da0:b0:3cf:ac89:f9f0 with SMTP id
 p32-20020a05600c1da000b003cfac89f9f0mr4441123wms.25.1670578091923; 
 Fri, 09 Dec 2022 01:28:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b003b4fe03c881sm8408306wmg.48.2022.12.09.01.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 01:28:11 -0800 (PST)
Message-ID: <864d88cc-4ff3-94f1-e232-3ac3efe46af0@linaro.org>
Date: Fri, 9 Dec 2022 10:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 7/8] accel/tcg: Move PageDesc tree into tb-maint.c for
 system
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209051914.398215-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 9/12/22 06:19, Richard Henderson wrote:
> Now that PageDesc is not used for user-only, and for system
> it is only used for tb maintenance, move the implementation
> into tb-main.c appropriately ifdefed.
> 
> We have not yet eliminated all references to PageDesc for
> user-only, so retain a typedef to the structure without definition.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/internal.h      |  49 +++-----------
>   accel/tcg/tb-maint.c      | 130 ++++++++++++++++++++++++++++++++++++--
>   accel/tcg/translate-all.c |  95 ----------------------------
>   3 files changed, 134 insertions(+), 140 deletions(-)


> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index 20e86c813d..9b996bbeb2 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c

Expanding diff context:

     #ifdef CONFIG_USER_ONLY

     ...

>   #else


> +PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
> +{
> +    PageDesc *pd;
> +    void **lp;
> +    int i;
> +
> +    /* Level 1.  Always allocated.  */
> +    lp = l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
> +
> +    /* Level 2..N-1.  */
> +    for (i = v_l2_levels; i > 0; i--) {
> +        void **p = qatomic_rcu_read(lp);
> +
> +        if (p == NULL) {
> +            void *existing;
> +
> +            if (!alloc) {
> +                return NULL;
> +            }
> +            p = g_new0(void *, V_L2_SIZE);
> +            existing = qatomic_cmpxchg(lp, NULL, p);
> +            if (unlikely(existing)) {
> +                g_free(p);
> +                p = existing;
> +            }
> +        }
> +
> +        lp = p + ((index >> (i * V_L2_BITS)) & (V_L2_SIZE - 1));
> +    }
> +
> +    pd = qatomic_rcu_read(lp);
> +    if (pd == NULL) {
> +        void *existing;

            int i;

> +
> +        if (!alloc) {
> +            return NULL;
> +        }
> +        pd = g_new0(PageDesc, V_L2_SIZE);
> +#ifndef CONFIG_USER_ONLY

CONFIG_USER_ONLY never defined here, so this block can be simplified.

> +        {
> +            int i;
> +
> +            for (i = 0; i < V_L2_SIZE; i++) {
> +                qemu_spin_init(&pd[i].lock);
> +            }
> +        }
> +#endif
> +        existing = qatomic_cmpxchg(lp, NULL, pd);
> +        if (unlikely(existing)) {
> +#ifndef CONFIG_USER_ONLY
> +            {

Ditto.

> +                int i;
> +
> +                for (i = 0; i < V_L2_SIZE; i++) {
> +                    qemu_spin_destroy(&pd[i].lock);
> +                }
> +            }
> +#endif
> +            g_free(pd);
> +            pd = existing;
> +        }
> +    }
> +
> +    return pd + (index & (V_L2_SIZE - 1));
> +}


