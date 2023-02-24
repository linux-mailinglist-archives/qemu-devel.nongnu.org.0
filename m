Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A626A192A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUkw-0002SW-PV; Fri, 24 Feb 2023 04:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVUku-0002S0-Pb
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:52:44 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVUkt-0007bg-Cg
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:52:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so13119724wrh.9
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xZUw463RhFcZZlBaqGUFgRaYCoIAbPBGnh5Hbe5Flc8=;
 b=fCljZUMXuZ9FVrL4+tu85zJDy9lUE/0jc89lWXF8n9z/926mbTKDRyz1oQETchhblA
 gE1ELzjrZmHyUw5tXNrP+SsaAtif6KKV3g8ezJdaYsk9Bqsxsuns+sepCUXWc5GeBAIp
 ph5Qsk1k0w/vtx+mhex/l4WQgQ3V0SkCqYC3IY3wCNpYeOHBSZnEf9I13lIbUffiVjYv
 wSLi4W44hf3tDhPZZpZxmARTyI/Vp6jER/6NKobhDOEVqhAh6oUJ0BMNzRhZiWwviasj
 M2ddAjw9CfLhRxbBxw1RbZ4Y19LANIU2iq+JUZY8fpcdf+AWuCtJMK9Vk8XhDckTvPT+
 86nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xZUw463RhFcZZlBaqGUFgRaYCoIAbPBGnh5Hbe5Flc8=;
 b=4RFzRK7bxXlhZqenewjAVIv9oeQ4dUsPP9j858nds9DzpoP28RS9wLy7gRnzPNycNM
 ftgwi8PovhlfFJgsDd6PG3HfYRROuP3gNFFFeoOQeDp6FLvDQbyUeydfr2iRSvuNxL4g
 Y99BVFoPhrnZ5eEFPbvfe6J+iJWKJtBPwE2JUAH4KdGHzZmShB3JPNUhVdeDWPzHqXoN
 WOMp5fIirQvNxEcv8wtlXcYzTqpA/aWIb16fJAnt4fZjkROkt4Cy/fsxgvhCtAI+SNe+
 F6OlPs2GBKQ68uOXu5sZbB5mubb4YAnBCb3LNVo10iiqjkbfhfUuNDTPAGPGIEPkQKI/
 gLfg==
X-Gm-Message-State: AO0yUKW1WGX7lXhNuWoqiQHfPAnM3EcJAcdrR1Sm8rrdr0ATpHj8pLvO
 OfUCPozJSGx0jEwfWsVRp7prXQ==
X-Google-Smtp-Source: AK7set/1LH1tq02X4++mbUkRpJL4YGqzs02qeP0zpsWtHHgpTPeKUNx0Z1qlWMeoeatU+Q7BtJ3OQw==
X-Received: by 2002:adf:e445:0:b0:2c5:a6d4:1398 with SMTP id
 t5-20020adfe445000000b002c5a6d41398mr13054296wrm.70.1677232361316; 
 Fri, 24 Feb 2023 01:52:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s14-20020a5d510e000000b002c569acab1esm12925696wrt.73.2023.02.24.01.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:52:40 -0800 (PST)
Message-ID: <fc053cad-b50c-67b2-0500-c94aa41695e5@linaro.org>
Date: Fri, 24 Feb 2023 10:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] Deprecate the "-no-acpi" command line switch
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Sunil V L <sunilvl@ventanamicro.com>
References: <20230224090543.1129677-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224090543.1129677-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 24/2/23 10:05, Thomas Huth wrote:
> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> line option that should be replaced with the "acpi" machine parameter
> nowadays.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Fixed stypid copy-n-paste bug (Thanks to Sunil for spotting it!)
> 
>   docs/about/deprecated.rst | 6 ++++++
>   softmmu/vl.c              | 1 +
>   2 files changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


