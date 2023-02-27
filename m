Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8396A4138
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:54:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc4i-00044m-C8; Mon, 27 Feb 2023 06:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc4f-00044H-Iv
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:53:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc4e-0000Oz-2Y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:53:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so6912101wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/EeTOjUSH4KuvrkKgqy9HEWaFUNqeWzxtGjPUHilEV0=;
 b=jc3L8plN7aleX/Q8hJFTgRhPWxskYb6BnYQIDG0E5YX5S4ajVDB8yMjrQaAbw6gd5D
 5/YOq78bYL4XvSDlkSVTCMiRTHgZOpC1nzBVlLLyHrVJzJL83lql9CtfiU1m0ebWQUBS
 vWoZ9AigUVEIgqgJrd5pRr/7l94K1lo1OADL6Z+F0nyXbVMOE7L8Oe2rBFaeysZGS3n5
 lxemD38prR5QK2lc+Q4ILpYSGP1Du+Xnb5TWrV9u1b5fgwPBnDt8ytrEROpSX+kWH5QD
 8HlEC4g/iM43l2Ev+AA7SIQokRRETjm9oPOavYouCQBj4elxGd80hfuJSNvytHqps+5A
 Ct1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/EeTOjUSH4KuvrkKgqy9HEWaFUNqeWzxtGjPUHilEV0=;
 b=qLGpGwOY4ODLGCyfsRqf7uPYwpL5mmcp/DmgV6MsEALQznWa2tPgJkbAjFurVG89pk
 D4kFHGz+rUt4pprxOgHqVxSIBfqqb9nsdweNPuKXCc4fxwYaWvDAc5rew7Wn7khMeNuo
 ZyLYhHzbonsXUGENsrPkruHHWHGglCK8RHl8+ASF3uYDItdkkhGJtuEJwgxW8WzbDrpZ
 PLf6X/8QYVANn7EjGwuc0DXlb8cxhTo/7jYxqzzJaIPOdOaRQ/aPHV/TkVrvnsO2YueO
 TWmk2E/98uOaY66Arx2WbanCBy7l7uezJ3vYF9spp9Mmmfj4NfSTeDGSAmd6WStzduzr
 mYnw==
X-Gm-Message-State: AO0yUKUxw+ng0dRfueKaTLGJc8Q0Nt4XDgfF9clf/bTOBqmafMWp+cKU
 UvAyZbJ7FWJ9GgZkGDWSun82OQ==
X-Google-Smtp-Source: AK7set/yDCBzqxWfBRuLjGiaeQVMBnphcOIhvwMmjx/iNJpyjcRr7HiMD1TObfmoKNmay6cIBf61OA==
X-Received: by 2002:a05:600c:4aa9:b0:3eb:3843:9f31 with SMTP id
 b41-20020a05600c4aa900b003eb38439f31mr4640488wmp.10.1677498822831; 
 Mon, 27 Feb 2023 03:53:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c359400b003daf7721bb3sm13285562wmq.12.2023.02.27.03.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:53:42 -0800 (PST)
Message-ID: <3728d663-c2aa-d0cb-3062-8cde8aed923b@linaro.org>
Date: Mon, 27 Feb 2023 12:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 06/12] hw/i386/pc_q35: Allow for setting properties before
 realizing TYPE_ICH9_LPC_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> This is a preparation to make the next patch cleaner.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_q35.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


