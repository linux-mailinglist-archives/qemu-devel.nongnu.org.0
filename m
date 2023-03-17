Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1E6BF49E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 22:52:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdHyE-0007zj-OY; Fri, 17 Mar 2023 17:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pdHyB-0007xy-Q4
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 17:50:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pdHy9-0004Pi-Om
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 17:50:39 -0400
Received: by mail-ed1-x529.google.com with SMTP id cy23so25488492edb.12
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 14:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679089835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QKOzz9+XOqO2JsrB5MqPMuKAaIId5RWJhgKBQZsKY9E=;
 b=GCtl5WWiLP76CcCxz9X9+ZMXwJDay/pagkAjIyW+iCusLxOZhhEvYN3Ri8ey3wmfKp
 5xb69fcRcq991z4Dd//fjFimSexG9ZWF7jXCQe2rfm2VwMI9DrM0Bdj6UFh3korrz8cw
 i8e+llkr6glI6EL1nK/GncjzO5zd9thWWxKV8hH7JfBakN4L2aoqirwmf7+nksQEEazz
 Yh6ZVufbuk7Gh6OIf5mt+VfYqIgooxvfw1O83NHHWWlp8qxiCqZw6Qfxc4iCqzMj6BVY
 onFr3Ou6/6iz7vBqHPb5bwUo7TzZMA5r54VnRxtCu0uoioAHLfkoXrEp4QSc3XhIZvwR
 L8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679089835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QKOzz9+XOqO2JsrB5MqPMuKAaIId5RWJhgKBQZsKY9E=;
 b=iyG79AYErxfeNJUvm6qkLm2dPWGUx2YwC56eDyK/lkNrhLlvA5KGIWIlAWQf8Mb14R
 /wOIKWIevNqwMjdkm39KZ8hZqlzApf3QZa2BB/I39UHZ8LW1gO7ylAFqSiV/8mnnOkuh
 ZUoLi6lZpn3WWdLzskZzna0fYAPi+rd8u9V2+HTHWpRODlE3mdpJi9WQzUfGja/V7ZG0
 H46ELUSuWSegibBhuYLzEsz1v9Rzmhqf/1ZBj0CtvdaGIEPCmVFdhvoZJfwIO7qJlp3s
 37HyjprHmsobnIF3ZWuFfF8lykrrG2Aqizf/vGSxJfmgUOHf5h+P3cK6r+cT6+XujBjj
 QYlA==
X-Gm-Message-State: AO0yUKXjMEgARgXQFBATEHEGjtoHMUfpMVTFUWCJAREBbujEr/5+MmuW
 PxEQUS87SK5OnL+1AEWvHQwZQQ==
X-Google-Smtp-Source: AK7set9Q9Yncr28f1485MSKRH3Rj/QR+dbW4WkmQ4hrZpufKdYUyAaTn8ab2gTMhSl3ixGf054lslA==
X-Received: by 2002:a17:906:7c4f:b0:90b:53f6:fd8b with SMTP id
 g15-20020a1709067c4f00b0090b53f6fd8bmr874954ejp.31.1679089835590; 
 Fri, 17 Mar 2023 14:50:35 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.193.198])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090626c400b00924916f9c21sm1393030ejc.87.2023.03.17.14.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 14:50:34 -0700 (PDT)
Message-ID: <bb8827a3-78af-3c0f-1ae2-7278204c2b7e@linaro.org>
Date: Fri, 17 Mar 2023 22:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
References: <20230316234926.208874-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316234926.208874-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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

On 17/3/23 00:49, Guenter Roeck wrote:
> The i.MX USB Phy driver does not check register ranges, resulting in out of
> bounds accesses if an attempt is made to access non-existing PHY registers.
> Add range check and conditionally report bad accesses to fix the problem.
> 
> While at it, also conditionally log attempted writes to non-existing or
> read-only registers.
> 
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
> Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/usb/imx-usb-phy.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


