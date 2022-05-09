Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A2551FD33
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:46:14 +0200 (CEST)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2mC-0003B9-Nd
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2Fn-0000Xz-3p; Mon, 09 May 2022 08:12:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2Fl-0003vM-Lo; Mon, 09 May 2022 08:12:42 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so12489039pji.3; 
 Mon, 09 May 2022 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tp2k1w21oMHLqtL/FjwhTwH15wjW6qb8qHY+5D2zHs4=;
 b=DClIZncVlC1iApENftyyos6Pjr8TnDPnRGlCtppXX7uqPR/h1FZd6rH/w4tUK2p7hl
 tBrd4H2FIC8hLu09XDYz40Q+uEZokXmf+Y2BzhUKgvi6EAFltrrCufyK/2U0HYrz3u/+
 6UQkDN7ZUe8h4giilRLVlY4oRhLAUTj3o2XVC2kTO5mqrExIkUGbhatsCQ0maVxUg40x
 eBOSyukHFoDEb07yjF4pp7DpCbsKPmRjV0ssTAqgk6MelRORm2bim4pF32Fx6rKSifkW
 py8ttyO+8BdS2J6tlsFVYoJiMm4TG33/ifaClTM+JKYufw1+OMIUHu9oZcXCQN8HR/PF
 r49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tp2k1w21oMHLqtL/FjwhTwH15wjW6qb8qHY+5D2zHs4=;
 b=TJle0+fy2lXAWD6LN/imb4b1q96nuSiOE7tZCE9fWouv3YJHb+9PxPdM8ebfEkIy2s
 /HjxUFbuHx84YeCujTUTRCwf6F969x5R0oloNTf7uiJpykouKOEX7mFwc4GG8lvus9UB
 +cXGVA9D/CnHPYhDfNBjqksRmhdg4vAmgLA3+zd0X+oO1tFbX/+Fyiqo8yM24zak+wtk
 Yk1NPZrF0XJ5xyTjrElXiIIFrIojRQZD/+e0BPFuN9yH3UC6el7OMlnUxRZ9edJW0oBc
 CDD6PKX+Hb/uabwjckAxuimz/BnSwrElv22rjCq6F4R+E7naqKIZ81fDiWxKzCAdmKSv
 0DTw==
X-Gm-Message-State: AOAM531w+XwhHLiDSR5NFtPO9MlsAb8l6o99XAsIzs/5GiGOYiAI7YvA
 MCW2762J0e57hZpWlcRMEOU=
X-Google-Smtp-Source: ABdhPJxY5PNLEDnmme7EC3X1vorJJSsS3Gg0HZhiDe2mEskBcumNiTbbxmu/1PrXkCSxRlDxv9dMdQ==
X-Received: by 2002:a17:90a:eb93:b0:1d9:a003:3f93 with SMTP id
 o19-20020a17090aeb9300b001d9a0033f93mr17909683pjy.50.1652098360129; 
 Mon, 09 May 2022 05:12:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c08400b0015e981111d5sm6915178pld.234.2022.05.09.05.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:12:39 -0700 (PDT)
Message-ID: <74ec0692-bec7-57cb-18ec-59abcf53f2be@amsat.org>
Date: Mon, 9 May 2022 14:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 02/11] hw: Reuse TYPE_I8042 define
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-3-shentey@gmail.com>
In-Reply-To: <20220505161805.11116-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/5/22 18:17, Bernhard Beschow wrote:
> TYPE_I8042 is exported, so reuse it for consistency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc.c       | 4 ++--
>   hw/sparc64/sun4u.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

