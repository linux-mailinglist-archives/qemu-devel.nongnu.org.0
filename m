Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3966BDCC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOZI-0006yo-Jx; Mon, 16 Jan 2023 07:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOZE-0006ws-7V
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:26:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOZC-0002eb-BG
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:26:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so23499834wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mbU+eUdwAnFQdTh8eSeHtDfak0lMbiLZsendjxwBdz8=;
 b=vKKmjOJa5WfJs4N9RUIqpUzNHkT5dJbuiZxutsgsvJ6GDcaAN0bRBwlp3k/U4gVzWs
 EZdhFvYs3C6UZZ+JZqLatR3HBWCSHKMSZpdU8BL81/SMIwNYI9RWAO3HqDqfkRFW5tOV
 AUDb53rHwaaF7J7Ijnz8j39VqsYkuC3U2uhFumDRngBQNvS4rjzLfIJcdpTEqPWzl05P
 Wg73Wi+laBSOcxmYUbc5Es8p1n1JhRQRleqTpinGmkdMWWw5lySBFk5iZdlpDbrHJX1z
 3HLtCkd9u+1nzg6Le8QxCkWbiO6cEMsp1gi7BaqbyHZayjzimKQIXLdsr8H6tBweEL4K
 dDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mbU+eUdwAnFQdTh8eSeHtDfak0lMbiLZsendjxwBdz8=;
 b=SP7kMI291u/ftBmBgZaWMDfzJ5e9vR+OWBou95oYXqw1ya0FyD38GN646/bcjFIqTJ
 bbRO2NrUcQrZvcUJ879Vpy3haH3VrM9L5BjoYukkIifTMz07dESUSsdjHFSsP270teiX
 0v7lmxNluumkU4krK6NXcOj7HBNl4KG5KHa35PLGmNdo1FW/PGccKUBuvOmoAFsl86To
 r9V/XeXE37NBIcwVwVTWlRlsSo1Atv3cJ0x6j483PdF3YxMBQ4+wWN5QLAk486A9lx2b
 2VWBtH29B2Br0wgCZvTgPeFJAlknusdyhfI2jTKI4xSWmT8FxNYy+ZXNGm9KvAoMhcW2
 C5kA==
X-Gm-Message-State: AFqh2kpRPfMNdLUd4s/1Jolpj1jsXulFrQbDXdfGasVwkTUatDdhexkz
 K5M69AsDhEofZ8Gmn5XUJET9ZA==
X-Google-Smtp-Source: AMrXdXvT2JY0GwC9rzLBxP1GLcARvJLwexbZVcDYp2NXMORZlyn71XKx9svmnOROdXNpUu09tgX9JQ==
X-Received: by 2002:a05:600c:4999:b0:3d3:4007:9c88 with SMTP id
 h25-20020a05600c499900b003d340079c88mr69497182wmp.18.1673871980960; 
 Mon, 16 Jan 2023 04:26:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003d9b89a39b2sm37458801wms.10.2023.01.16.04.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:26:20 -0800 (PST)
Message-ID: <ad3fe423-a498-7516-211d-e0ef1361d3c7@linaro.org>
Date: Mon, 16 Jan 2023 13:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/6] hw/arm/npcm7xx: Remove local copy of at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-5-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-5-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/npcm7xx_boards.c | 20 +++++---------------
>   1 file changed, 5 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


