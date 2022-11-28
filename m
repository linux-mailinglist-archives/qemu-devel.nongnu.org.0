Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B1263B0BA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 19:08:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oziXY-0007fv-6k; Mon, 28 Nov 2022 13:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oziXT-0007f0-Ie
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:07:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oziXP-0004Ey-0x
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:07:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g12so18202216wrs.10
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hmLk60q6IxZ7qxovGNrDCp5JT2kzwFHJYfYRwWUeYek=;
 b=yoBEkZPgPIAUKgGHz8Wlvvmz6uolULO0iY/zZ/j8jbmuBPOKBXUpaR6oU2ipSwDV52
 2DwGvWPg4VnmrIEC2MQVGezzOqZoBXbX8hIZpbBe+v5axMqLZlXOruCUM8NvUNIaUQk2
 KeZLVfx40EhsNLBs04uaBs+yu9YPfBvrj/cDUeHi5Ex+5jy8m4Yf+0kC1HlnCJ4JSGWm
 jwORT+sV2atRcc2PUx6p6ep5S9rtmHBbwb5x2tDlJMhUpQ4ehNobIQbTEQR0VeALtfQ9
 uwShGBjHMmKtSTYLGB+ugDqHaRE1fN0lAri6ND0a/xtkoAqSlxASfqZKgDpVyzYDsMbj
 W4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hmLk60q6IxZ7qxovGNrDCp5JT2kzwFHJYfYRwWUeYek=;
 b=y6R/MMpjZ3JuyH+t2/l40R52F0IJvaT6AjbDsLjarUBlnNIt+WKm7YAoSw8AWa+x/m
 vLiZAAPPHSU6IVdxYodVZ5gcSguDSe2cq/zrNdgHCxaikC/Ioa6Te+ba4JQjqOyUiB2R
 p/Ft3PyNyZ6ySDs9hpVpohenhhxgmhsL+T/UkAMPzYlLJURFs9EeHOfqydrGzCvofn6f
 PseyuHXm3VC7W9++oVh82uy1XWMaFKjN/jFr23pzo+PZl4oVg48Zyg7w80ZT8T6cz2TU
 50kaNL96gXYfBfs9m9U5Zb/9nVKZvy82kCktvU3rLumATA8mbYXDIWPqlOEI8pJX7PN/
 5f3w==
X-Gm-Message-State: ANoB5pkEEgBVxTUZGFnoDlNPs4hz+TuosxSjJwKEJtrbeDozwWI+gNiG
 sj3bfTbdr3sXJ/EE8BhHWpYB6w==
X-Google-Smtp-Source: AA0mqf6NNf7oEx0kpH3U5DY5Lsa8gHrVAxCO475Pg37B62P++7n0ZB2PMVYIMWw9BNdYyXMKGeXBew==
X-Received: by 2002:a5d:5507:0:b0:236:8a6d:eaeb with SMTP id
 b7-20020a5d5507000000b002368a6deaebmr31939522wrv.208.1669658844236; 
 Mon, 28 Nov 2022 10:07:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfebce000000b00241d21d4652sm11410774wrn.21.2022.11.28.10.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 10:07:23 -0800 (PST)
Message-ID: <89064d0a-40b2-63be-ac92-e8266ce8f765@linaro.org>
Date: Mon, 28 Nov 2022 19:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] MAINTAINERS: Add 9p test client to section "virtio-9p"
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 18:12, Christian Schoenebeck wrote:
> The 9p test cases use a dedicated, lite-weight 9p client implementation
> (using virtio transport) under tests/qtest/libqos/ to communicate with
> QEMU's 9p server.
> 
> It's already there for a long time. Let's officially assign it to 9p
> maintainers.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


