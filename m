Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E498662434
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqIW-0000f1-GW; Mon, 09 Jan 2023 06:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqHs-0000Th-Oh
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:26:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqHn-0002VS-CN
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:25:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id co23so7813296wrb.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DjAW6WzhQGzTGIbks3TPqWAztSta32vEf4oiyOMMApU=;
 b=Q6toVkl4qOnjjHVDcOaMb92zRYzMRmcswjHEZs6x+2LsVfH8rWXThvyyB3Yndy1vzn
 j/Q4hBRXGgTkIhw7FX3ybp5gEmoSrwsV4mjSRquIBXmnXIl5a5w8LH50f+e18hr9gk7Q
 5hSCmqLNOp1UdSE7LR390HLMw0k3bdl3rZ0r4MyzJZJiQCQqEPxV1yTVFDUaGg0rykuP
 U1CHLA8+mK6xmxdCIK8FD0ezN52Eu+GsH3/B0T6/IUngYUOc+gv37wD4+Mm/CWQoL2LH
 GAnPDWLhx11heyQPFs8yIVnd/A45/DkuqKXQ4yukOv7A0af2pnbhs66GzymcrCa7KvhG
 oZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DjAW6WzhQGzTGIbks3TPqWAztSta32vEf4oiyOMMApU=;
 b=eKGM/n8vVnmNNZGwi2IGEDYG2JUMZcNk8ACx3vMgGuOvi6BmhVvTzGJ0n9TrlAMeiW
 Jmnfrmj1C8mu2PUtcNuigJI6tdPsDhOcnwc5Ojr1kJAggAQl1JnAhT58X4vP84w2iZ2q
 GBXx/9xXYjzsRZSDo7hWOGYjF7ShL1lERZH/n+k9w3ySAM6QkWfrjeeIlzANenFVPc64
 Z9/byIWzBZaSw5WybOS0vMCKxzGWwHp5s2r1d6HeHYWmQ/BhHxuqFNNy3aQo3aJsXqRA
 NcdUM8Gh3i6EA1VUQ2uqC5thwjJrlCJUH+Rb2LinjMd9MIfDwxwhbZCCfj8MLADTAAMB
 1F3g==
X-Gm-Message-State: AFqh2kog0t0WOds1kUgqQm+Kl4fOnnBNM6JQzWODZmXgY0kqveYo/02q
 4JL6/fSl449jIg3/XuMoIoyNpxQLK2YaMbST
X-Google-Smtp-Source: AMrXdXvcucrqjjgDkcXIG+4Y9tAhhbJRbAau9h1BIypWCXIYmX0/OfnHu18Sm4lI5exvGzhKFIRy2w==
X-Received: by 2002:a5d:4351:0:b0:256:ff7d:2346 with SMTP id
 u17-20020a5d4351000000b00256ff7d2346mr36503842wrr.51.1673263548630; 
 Mon, 09 Jan 2023 03:25:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d6686000000b002bb3229a03csm7308565wru.34.2023.01.09.03.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 03:25:48 -0800 (PST)
Message-ID: <0917600b-f7e8-de00-8ee7-51051c16538a@linaro.org>
Date: Mon, 9 Jan 2023 12:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] qom: Extract object_try_new() from qdev_new()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Claudio Fontana
 <cfontana@suse.de>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230109112056.94385-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109112056.94385-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 9/1/23 12:20, Philippe Mathieu-Daudé wrote:
> The module resolving in qdev_new() is specific to QOM, not to
> QDev. Extract the code as a new QOM object_try_new() helper so
> it can be reused by non-QDev code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC because I'm wonder if we can't find a better name...
> 
> Also, should we refactor object_initialize() similarly,
> having object_try_initialize(..., Error *)?
> ---
>   hw/core/qdev.c       | 23 ++---------------------
>   include/qom/object.h | 12 ++++++++++++
>   qom/object.c         | 23 +++++++++++++++++++++++
>   3 files changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index d759c4602c..3a076dcc7f 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -147,31 +147,12 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>   
>   DeviceState *qdev_new(const char *name)
>   {
> -    ObjectClass *oc = object_class_by_name(name);
> -#ifdef CONFIG_MODULES
> -    if (!oc) {
> -        int rv = module_load_qom(name, &error_fatal);
> -        if (rv > 0) {
> -            oc = object_class_by_name(name);
> -        } else {
> -            error_report("could not find a module for type '%s'", name);
> -            exit(1);

Wrong patch, sorry, v2 coming.

