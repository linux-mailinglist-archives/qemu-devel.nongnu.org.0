Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C04DC580
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:06:07 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUotJ-0008Ir-Ns
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:06:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUolM-0001sG-UC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:57:53 -0400
Received: from [2a00:1450:4864:20::52f] (port=39827
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUolL-0008Qf-Ft
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:57:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g20so6251713edw.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tTW9HddORWRTYjZIEb3YNQ6MiaiHu2Ea6bpG2RGjo9Q=;
 b=Dgx2BrSC2s3rajfldlH+40JLYbpg24IPAory94UlDBt1H59P1xtTWBrX/gxLPjufhe
 /tLzbbJ9Po3bpCci6fwpDUePcjgP3raIjwprwJYMudZUP8trXUHRQvmHwVW6/rNfbYcD
 Gs2ESLD8f5zMkpDnYOKUNFHlQ6EQricYgJvIEQZEUbNgiIxo3GYLpfrK/YRd4sQXkUD8
 tzcn8IWSThajzlIKIxMyAdraiB84nvyLl1v2XkSNZRwZKd/K0zOleFTkjZD3RikI0nZr
 Mol5IomcbLGtt2C3PDan+ChyREzCq3RewC9Azy+s68f4IlJMVX3um+itsBpgpgbUBa4f
 3ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tTW9HddORWRTYjZIEb3YNQ6MiaiHu2Ea6bpG2RGjo9Q=;
 b=vZrVJJT9k8nw4LZ00xxzWRA5JAuUP+NovxAKO44niB6eOeuGbKATtCzQNL31vI3cD0
 RWl9L0dPesPLG9fcQmDHhiZRYRQsCoWoM6dF86s5BmXvHTLUVwyNTxphNHFcwiF5GMKb
 oYt3f7vSaZjNYn90fldnYlcm9frdqMH+xvVFtcqrDzW2tOVTqux/mv/UP8NqO9Nyu/ov
 n0OttjHLcTnPCrpJYBSILPZ0hRBPfyXzLF3kjxfUR7wicLcI8byNLp9FzZ5ttse0tVai
 t3u2/9NJjdQcgDdg/TY6l3toFnMs1BYanoi8Mnvpwi897DNxl0gODKIC3jIxuiQduq1o
 sUZQ==
X-Gm-Message-State: AOAM532/J6SnehaKsygVP4MAxoHXQeSMKv+aFDX7cOyhvVxK6S0NukRV
 nRqs+XQQyy3cc2JtLHkAits=
X-Google-Smtp-Source: ABdhPJyLpzQ9cwECcCOaShutb7T/udmY/tJ6nWF6HBwyWHcAL7uGHvYlPswCIEZ0Nm9kIoyZUDpVeQ==
X-Received: by 2002:a05:6402:3552:b0:416:9386:9e68 with SMTP id
 f18-20020a056402355200b0041693869e68mr4003574edd.286.1647518270033; 
 Thu, 17 Mar 2022 04:57:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 m5-20020a056402430500b00418681a31eesm2572697edc.61.2022.03.17.04.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:57:49 -0700 (PDT)
Message-ID: <2f4d8e8f-163a-d6d5-1a06-3a47f8969026@redhat.com>
Date: Thu, 17 Mar 2022 12:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just one change to aid future reading of the code, possibly.  Move this 
line:

On 3/16/22 17:03, Philippe Mathieu-Daudé wrote:
> +    qemu_event_init(&cbevent, false);

just before

+    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];

i.e. the place where it was before the patch, in cocoa_display_init.

Paolo

