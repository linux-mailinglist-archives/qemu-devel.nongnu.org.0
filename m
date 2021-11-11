Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804144D838
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:26:39 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB2E-0002tV-Dl
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAwr-0002N8-Qo
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:21:05 -0500
Received: from [2a00:1450:4864:20::32c] (port=51911
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAwq-0007Ox-21
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:21:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id z200so5236728wmc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OMVVQrIWt/obkPXq+FDpLbfKna8ZmbmlXYUFlBREnYE=;
 b=VGl3BvwfYqwjZDWIo6TS4351R3rLfVJpKDWEXPDREb6hK6RpR3jvhCfWQf2hucY8da
 R0Jg0fd8GdlIDevE7zDhW1BUJYKPZCvQCdhz+Kbs0azv7mSaebEw4HrGoALWnbsTILjX
 RHgiEne+fggU+fwC8kesyjkJXHDVZJKu1gb3OYmXo2S+sol2gBJHvH30+YYrKQfoauMV
 55ZLtZGEkdi3YWbOypL/IjAw/Meu5DTGEFkqDD5uAPPwIejUsWhdDnEvMnHS7b82FGR7
 ysDYA1jTKgZI0jisW0G/jJUJmtZSB0XDkoSfmvZJs9Vt8XidzOwUQ7Cack03U6SUstP3
 kKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OMVVQrIWt/obkPXq+FDpLbfKna8ZmbmlXYUFlBREnYE=;
 b=ct1jUDDUNRyNNsXUZ4JK9Pc2Cdy3jCRxDXZrhhJV7uKsTpz7dxaSUBy53+zPnuNzcu
 XD6ipI33uIZJApKv038Nwz9qHylCtPElHBiPjevh/GbGZLq1JZUmA1PR44aNUkHWOIGs
 FvGUHvTB7fVx8/NOC5zVsicMzbw90bAjCVjfNmNMrW4ZT3UgsnDa2pWnQPxMPpuoh9fD
 WxR/TWEJpSkjLIYuSsabCIohezvOjTONP8uHMnWP/iWJwNxZoRoTor0UQHFA/18/dtYg
 dkRjDa+0/HxqgJzBR9Q70Zo2q/oSMPmSlHZSwAFUFzqEhm36hAAUxwGKz//z8IY0HZw7
 bc+Q==
X-Gm-Message-State: AOAM531kpEOKISi/dtYL5prKvjGZHJUWpGChtaGNCj5kdRuIcjGNo4Hk
 S00EZ6SBbmc8IaTMB8IpeVCsYw==
X-Google-Smtp-Source: ABdhPJzYrh1ubalPpfaxds5kmkCqRIJx2d4kfDeghvmDBTrB08djhKodKFzkGTyDFoa4ZOB8+9m6rg==
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr8656676wmh.68.1636640462589; 
 Thu, 11 Nov 2021 06:21:02 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id l16sm3095728wmq.46.2021.11.11.06.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:21:02 -0800 (PST)
Subject: Re: [PATCH-for-6.2 v3 6/6] hw/core: Rename smp_parse() ->
 machine_parse_smp_config()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <633691aa-3814-cd27-937a-ba85c48f58e1@linaro.org>
Date: Thu, 11 Nov 2021 15:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> All methods related to MachineState are prefixed with "machine_".
> smp_parse() does not need to be an exception. Rename it and
> const'ify the SMPConfiguration argument, since it doesn't need
> to be modified.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/boards.h         | 3 ++-
>   hw/core/machine-smp.c       | 6 ++++--
>   hw/core/machine.c           | 2 +-
>   tests/unit/test-smp-parse.c | 8 ++++----
>   4 files changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

