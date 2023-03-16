Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB586BC77D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciEw-0003HD-Gi; Thu, 16 Mar 2023 03:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciEm-0003Ek-RD
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:41:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciEh-0001pp-2G
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:41:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so3023855wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678952476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z5Ho8NRURfeB00BxrstQFIhPibV+VDjLDHfIFm2+A58=;
 b=FWbczOW77dDqqKZA37RZgwNC32SYavPgm03LxNhTOu7FO5z450bwDcULXFBxb4IbyC
 /GDWuMbjFN4hTvff093ecOkV55AJEBAXjEZMFypc84kSQ3oK2JOrZgyUyPJ98To/l5Mp
 tg8iGVqyq8AnydQ7jAIYEBW8ykdWZ+7cBORkDL/ysCBhG0WarWxHoqySYLT5UXqsbPge
 S+r0ulauDKkPQfx0AasG93NNs36+PY6a11jZHOQcc4g5d7j9+gjNqVofyizpmPqc71o8
 cp3EBTwfGGDZ4VxCKVpNV1E3AdfqpoWcTgeB9aeTFW3UZh42/BFjJot3yZU1tQLHs344
 IW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678952476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z5Ho8NRURfeB00BxrstQFIhPibV+VDjLDHfIFm2+A58=;
 b=42ekezmddPPNz2vqiI3K7MwyO5cgzHqYCUQgLUcTBC9XZOmrcrRT4FyPnL9x+TuyiN
 B82v424ELg7YFOcCuT9NfUjdf99tbZRE9fudpWufbhrRplaXY3vjlQuhPPSdGNR4xTY9
 JIN2veuZlMBoBCVaSo3S5zewNfy/Sz2QxX51KUYh+OdPGjSRG2IHlvgColzc7j/fykZn
 SabZxaiOAGNzc02xIFYWuu62hZ2OcSjUvzfCExPyEE/iYY88KVkYTxaUbyDLUnLVaVSE
 BSJ43ahqT//e/6oDN8J56yOCXPKXOOvyAkseWsSYhf+rg9aldrzWj40pX6X6UEueuTSl
 HKig==
X-Gm-Message-State: AO0yUKV8DQHcctdOvpi8AVYkOYN2Ja2DyBtyPH6VH4eECmooadOZyV37
 v0T5oVnwBIag1f8M26b2UcqEBw==
X-Google-Smtp-Source: AK7set95im2WoVGgS3diojcIp1vEfjOqIG9eOV+mZdlqtZw1p1xJP0bgNRDqfN9mhI9KEys84ogHaA==
X-Received: by 2002:a05:600c:3b98:b0:3ed:492f:7f37 with SMTP id
 n24-20020a05600c3b9800b003ed492f7f37mr1763726wms.10.1678952476016; 
 Thu, 16 Mar 2023 00:41:16 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003ed341d2d68sm3868429wmq.16.2023.03.16.00.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:41:15 -0700 (PDT)
Message-ID: <69ffd86f-6c52-6779-9725-b0d1642c759d@linaro.org>
Date: Thu, 16 Mar 2023 08:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 05/14] qapi: Improve error message for unexpected array
 types
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316071325.492471-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 16/3/23 08:13, Markus Armbruster wrote:
> We reject array types in certain places with "cannot be an array".
> Deleting this check improves the error message to "should be a type
> name" or "should be an object or type name", depending on context, so
> do that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/expr.py                     | 6 ------
>   tests/qapi-schema/bad-data.err           | 2 +-
>   tests/qapi-schema/union-array-branch.err | 2 +-
>   3 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


