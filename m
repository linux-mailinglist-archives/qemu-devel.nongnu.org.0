Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91C6B258E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:35:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGQ7-0004yY-S6; Thu, 09 Mar 2023 08:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGQ5-0004x5-QZ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:34:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGQ4-0004rm-3D
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:34:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j3so1163737wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678368894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2b0LUVs3uWmtk0aaVmsx7G97ldMWivPoS36cRGZARU=;
 b=jd8zt2AcpkvpaA9AFsbtmT+5bIjgek5mG7TgWbm2pOmxf8w4ei+qZxzEKhgovvkPJ8
 VFkGbp3xSzbXhIjmoJuYghGWx6ZEQ4zroekKm00yDAkeIDgh3v1JfRNfuGSQCCHTL8jr
 4H9HHXR+UmUPRLkdBXtHedWjuwoE2IS0lLn7Yt5kMqF3XnWkG0li5XAZb9RlGLjv+LOZ
 jqSRiax7FdVVrUxnFQVBNrHn4cnq59EFNwPzs+F7TrdOdjSZvjy2oy08cQB4+x5zANF4
 G0RSXz+heSjR9637C+uineBqoGdTSG3Us7voE04ykpO5Iym7Np1Bh62+Y5azG87FEjAR
 4nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678368894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2b0LUVs3uWmtk0aaVmsx7G97ldMWivPoS36cRGZARU=;
 b=suK6eijjbWbJizCNpqHrROxEmfIegaBWEI/8T0mfHu0ovnJMHDV1BW2/ecIi2n7krD
 x4Hy92r5caPgxrS6ZBhnvz9yd53Yh4L5fzpZVl9wyFPWxN+5bisfKw0VWmx///9zmU6h
 flI4kmyVa7Asj3jfmacgn/3bxt3Sq3N7/cUEvQ3Hnm0rmypp1571PPpKDacKUKrPtGX/
 tt7wGRJVK3IhFCPXmD07EaAi55RGtS8NqAptI9Wsw88wPrcF0QHdOpKgVddUZAoeonMd
 DF8SRdu7Cuuu7vQ1hIYFZ4H6OXphGqAdjGssCiQ5IMkwaRd54/gO44tj4XRJruapNpv0
 6lMA==
X-Gm-Message-State: AO0yUKVLFxky0DBr2YM4JDdadJc3HfnxoG6knaAYVI3XFcCr4MriosAe
 TCKKOrUGMP1nSWXEfHSNPxOhsA==
X-Google-Smtp-Source: AK7set8O7905Oqg7ogRkLodNiVvhq5BCfHeBHk/YDwqc5es4Os9oL0bqOQ9sG/6vfcrms46o1UjXxg==
X-Received: by 2002:a05:600c:1e10:b0:3eb:39e0:3530 with SMTP id
 ay16-20020a05600c1e1000b003eb39e03530mr18617263wmb.41.1678368894416; 
 Thu, 09 Mar 2023 05:34:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s18-20020a05600c45d200b003e8dcc67bdesm2969275wmo.30.2023.03.09.05.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:34:53 -0800 (PST)
Message-ID: <6bbbf2ee-0c89-d935-1555-38691d638d3b@linaro.org>
Date: Thu, 9 Mar 2023 14:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] ui/cocoa: Override windowDidResignKey
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Gustavo Noronha Silva <gustavo@noronha.eti.br>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230228070946.12370-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228070946.12370-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 28/2/23 08:09, Akihiko Odaki wrote:
> This fixes pressed keys being stuck when the deck is clicked and the
> window loses focus.
> 
> In the past, Gustavo Noronha Silva also had a patch to fix this issue
> though it only ungrabs mouse and does not release keys, and depends on
> another out-of-tree patch:
> https://github.com/akihikodaki/qemu/pull/3/commits/e906a80147b1dc6d4f31b6a08064ef9871a2b76c
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   ui/cocoa.m | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Merged as commit 9d9bc7db50.


