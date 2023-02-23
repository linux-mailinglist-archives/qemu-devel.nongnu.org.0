Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AB6A093B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBCp-0007Kk-AX; Thu, 23 Feb 2023 08:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVBCg-000730-QP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:00:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVBCf-0002o0-4C
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:00:06 -0500
Received: by mail-wr1-x432.google.com with SMTP id i11so4449668wrp.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i1PVANsEkSrJDMy2jC3iUiPhW80VnOCf3W+q+O+w/4I=;
 b=ptKCBPJ4Xvgi1ftlaDRmK4EQwzQ3SdtpPKTjWkVzIbWQs6rwGLnXL6jD4BC+VKosb/
 i4uFGR9NABFRGc89TzOYQ1/+RNKum1/a2uVToZy8N706qsUpVh0G6qeY9uLDT8BW+vHz
 VqQogYnm0Ryju/ruUBm9wSnhfz1GC8vcMbIjnBFogbv9sAtGTJoUTx76/QbxUKbKaffI
 MIjNXyy/1mYQe7OT+2dsN9RkO1mX7HOxBGyudmCDVi9FKsU3bP6Z9Y5MIzU3NfmsviJL
 yOYmS+FPaw0M0+chX18PW/xQHquToAgKfkMFUOP4AzDlz6yezGrpEvQ9QSkOftjNL9up
 OZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1PVANsEkSrJDMy2jC3iUiPhW80VnOCf3W+q+O+w/4I=;
 b=MZ/aXUi1j1329Wmj8ufk5qfpuHLJBoyn0WTmqcjdAq7W7QykAQzrVt9eHM9J9xSv06
 uw6FQhQzdnH/TP6G/TtJiZcLX5HAPBHmsCHMG7TPyjZ4ArR4GdcYnns6b1lZUHQ8Ek7g
 KyZal781xMjBcP6zDwT/AZrg6FHPehoj3MLO5St/79zFaGvqhf2SG07Gr1vWTDSqldD/
 yUu2R8h4u1TyQHGmRkDr18k6fpIAQNtpf2MDgUyu2vo7fehiIE48TnEjwAZGGbFmERIC
 bzmrf54/lAqL+g1ltK0uRhWILNZ5avRZmFQyoQDKdGzJTbbFPw6hZC2avhalmp9kE9DS
 QGpw==
X-Gm-Message-State: AO0yUKUJly2x1Qt3a5R731mrSr21gjYdB2q8SICN9j77sFzCSjGb+/aS
 hdgMkgZSWKmJsjO8hNcY/lwDuu+5WEsSoD/+
X-Google-Smtp-Source: AK7set9G9VNXiBjXoBkZMXWPgqzeB/T0x9CWcnEPQw7PIUOAIxLsTFcTdHDh8qcQNJJ8GslopW2otQ==
X-Received: by 2002:adf:f946:0:b0:2c5:6287:bd30 with SMTP id
 q6-20020adff946000000b002c56287bd30mr9732380wrr.26.1677157203351; 
 Thu, 23 Feb 2023 05:00:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b002c567b58e9asm12108142wro.56.2023.02.23.05.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 05:00:02 -0800 (PST)
Message-ID: <3ff9033e-8f47-8f7f-00a2-8eca05b481eb@linaro.org>
Date: Thu, 23 Feb 2023 14:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] hw/qdev-properties: Constify Property* in DeviceClass
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230203101224.25796-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 3/2/23 11:12, Philippe Mathieu-Daudé wrote:
> Qualify some Property pointers as 'const' when the
> structure is accessed read-only.
> 
> Philippe Mathieu-Daudé (4):
>    hw/qdev-properties: Constify Property* in object_field_prop_ptr()
>    hw/qdev-properties: Constify Property* in PropertyInfo::print()
>      handler
>    hw/qdev-properties: Constify Property* in PropertyInfo::create()
>      handler
>    hw/qdev-properties: Constify DeviceClass::props_ field
Ping (trivial).

