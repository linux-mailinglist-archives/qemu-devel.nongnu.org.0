Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CA432DADC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:09:20 +0100 (CET)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuHf-00006g-R3
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuDN-0005tu-Su
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:04:53 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuDJ-0000Hv-Cb
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:04:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 192so12730588pfv.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=k9p9CBlxkeT7UOqovLbboAwo48ySz/XZI0CgrUXyVxg=;
 b=ACpEK7LUWw/mZwlhheI1qNjkVnR4B34xFmbw31vil9GV78jVWdQ2jIXR0z6zXBcKu0
 C0CTOJf7uHr1WiPXfDctfClCAZT11/n2friG3UlyfRk98rpyF4K/h97kEGC1AIth3v9C
 GfwkEIHyZx5c36JEFjn4pzyLZdolNW6wJnKaB9+WQwLzL1YxUGoITELVQPbBguNvGk3d
 lgw4GDJ3M5zCeXrRiVqaskIg/bMZzpTFwf50i5AYa7IdA6IvEraO3f1c6XgdfURlISPE
 wc1uugx1h8zdIp0iEkqU0WntXx5qHGl6dLYkXOlpM2zo6toGbI1ibs/sjlR+R7x2s/5F
 AZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9p9CBlxkeT7UOqovLbboAwo48ySz/XZI0CgrUXyVxg=;
 b=HXiKb48xaVB24xs4NUF2gcPHOqaABtFRNkCmx5cQ64sq54zJhx0z3slECPbUcMsBeR
 kDDTL0nxhsA0nEZ9psiH8bDyGXfvdrrfULNtlMNmzWrVleSgv/y28zZLhf3bu8Ilsba3
 HgXOM80YtHgobs3qrtaBCBUaAnVt/27lYLbifeGzUEv/uhAi3gbErg5r0gJnYAlqfVap
 nYthJt3u6ZrWw2PdecUI7I9MTu2fNmwijMX0zp33g1ZB6YiVbVL64ttZUIxm8aeoQQg/
 2rO6FsxVb9gjD2dVTx26xig6YUHLripOH/2zHayP4xRSlklSCqRViun+epZA73Lt6fha
 RC3Q==
X-Gm-Message-State: AOAM531BsrLs3AaUYMhUtfGvJ7nagWP9Cl2MgAxtV5dSFFvEwzgqmYjl
 e+8vT8QUCzuM6kv/i5SwMMD9CGVy8SDcEQ==
X-Google-Smtp-Source: ABdhPJz9nGtQ89Zv8xtuogyRbpgzaCgUoZNImH6NknjqivWypZlt0ubI/q5p04bKUGzuDW0yauw7PA==
X-Received: by 2002:a63:4f59:: with SMTP id p25mr5001131pgl.335.1614888287978; 
 Thu, 04 Mar 2021 12:04:47 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i11sm230936pfo.29.2021.03.04.12.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:04:47 -0800 (PST)
Subject: Re: [PATCH 22/44] hw/arm/armsse: Add a define for number of IRQs used
 by the SSE itself
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f27f0f65-d384-4bca-282c-bf13ff455c9f@linaro.org>
Date: Thu, 4 Mar 2021 12:04:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE uses 32 interrupts for its own devices, and then passes through
> its expansion IRQ inputs to the CPU's interrupts 33 and upward.
> Add a define for the number of IRQs the SSE uses for itself, instead
> of hardcoding 32.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

