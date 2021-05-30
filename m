Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E39394FDD
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 08:39:12 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnF6M-0004xB-Kk
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 02:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnF3i-0003dS-7f
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:36:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnF3g-0002Xa-NL
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:36:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id f17so2939841wmf.2
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 23:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IrFvYgl//jE7MFxYYHIsJ7paYB4ndfyTAYq+UjryCEU=;
 b=TGmtG/oF5hrcXiGeNtxKbBTzWb6Stihftj+HJmbJUugjBJ9JAbBs5gDneJ29i+XVKi
 sD2h76BcU8ymBn0JYuDw32NZlviEaHvnQ7JyXiweNWG+Wq0LLn/Lntpqh7AOz4dztrKl
 RkIMeMKa8MsjWb35E+FRI6m/hT2nli0XRY9x4RlrVPOfsP3NWNgSsadpbmWGPsEetske
 soBfhZY4svgRHkTx8eZXB/ni4G62X4aoSdfzPRCpwIC2of1DC27ALSk6DiEN9iMUwiQB
 Ra9eT44k9EMOkg/lR8efz2/soSCosl+aYPwE2a3SylAiY4YWj9pNQHnS4vw1pcjxNPhO
 gu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IrFvYgl//jE7MFxYYHIsJ7paYB4ndfyTAYq+UjryCEU=;
 b=Bck76jexZDM47vzBwBn57zMW3S18DrmDmLOErVuTftU7NpLIFiU4aKQTlJvUY6QXPN
 Gkp5Z0qmfQ39mDP1QiHfePU/aPP2U6Lfu/j6umRqN85CeP7wiK9X18PGUzN93wgat5kJ
 uqXTtIai5rj2E2GUlzjalM/uXI6D6Jaitf8ZfpEgIL5XvYNZuDAH77T78k0TRgVLtXem
 YmF/B5eyPzBL1048HaJGNTmaL4rdVoucwcpZTll2zVPaa+IIFj4BxJJnsMmXykfe3Jya
 Op7GWpUlKAagYMgTcDyIWYMp6dMYFwHLO3RsSlbLQ4NsvkpTkQaC4gM6ITeZhC+M8Jw4
 ubeQ==
X-Gm-Message-State: AOAM533HDiBaPlyMVKmxQMd1gbUBtThH0zILS/mgPfrtccp3SXTw9loJ
 TrtuTrrjBIic+SgdtIgRp28=
X-Google-Smtp-Source: ABdhPJxZQw6nmk5ZnL4mTNTp0LyZjy2Ooqn9gHs9UisF5LZuCftabQ02bnmfc6WlhOI0cBlrxgeHfg==
X-Received: by 2002:a05:600c:441a:: with SMTP id
 u26mr27579wmn.166.1622356583310; 
 Sat, 29 May 2021 23:36:23 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n2sm14080680wmb.32.2021.05.29.23.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 23:36:22 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] Cache modelling TCG plugin
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <31a9b076-03dd-0b79-1657-6f6b6d3c7bef@amsat.org>
Date: Sun, 30 May 2021 08:36:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210529152203.40358-1-ma.mandourr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Emilio G. Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Emilio too.

On 5/29/21 5:22 PM, Mahmoud Mandour wrote:
> In this RFC patch series, I propose an initial cache modelling TCG
> plugin. As of now, it models separate L1 data cache and L1 instruction
> cache. It supports three eviction policies: LRU, random, and FIFO. Once
> a policy is chosen, it's used for both instruction and data caches.
> 
> Mahmoud Mandour (3):
>   plugins: Added a new cache modelling plugin
>   plugins: cache: Enabled parameterization and added trace printing
>   plugins: cache: Added FIFO and LRU eviction policies.
> 
>  contrib/plugins/Makefile |   1 +
>  contrib/plugins/cache.c  | 595 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 596 insertions(+)
>  create mode 100644 contrib/plugins/cache.c
> 


