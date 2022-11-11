Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BEA625969
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSIW-0001aM-NX; Fri, 11 Nov 2022 06:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otSIU-0001aA-Ar
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:34:10 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otSIS-0008Fe-Nu
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:34:10 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so6082985wrt.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLUHCfqkTbKQ19H1HzNs6v8/QoNEm9+T4c60ZWc22BU=;
 b=yLw7YqZtteak9DYtSn3DygXvRvZKsqMwixyfA2BYKNbu0yCuV0Kz52Ea0Lwp2tLdKV
 03bttxu1Bblsk7StVqE9S4HkCkgB8ZurRTV9GBO/G6Hco24yPXuXOHwErxec36AZGDUr
 VMNAE5W4h10vSHdt++zGBmNiamMz+/j9z8F8V2n4xUke9SOhZqNfvNB343PHTWIB5H9x
 r4p98337ciXTZw1fpXZsMC16SpE3ME9vwvwSMN+uo8gJqd+OM7nGVzoZtN6xmWt25SDf
 80ByV5pHWiW8SY4Zw82SzILt6pHR1Dc3n73eni1/UPSVJV0LY/DegB13z7k5KMaCVzzO
 Ji4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aLUHCfqkTbKQ19H1HzNs6v8/QoNEm9+T4c60ZWc22BU=;
 b=EZJJV5f1pNEUcBWRdTTwkACyf6V2RlvdIZs6JyNBBXcwji2Zm02pXlqXr2oCxj8KGc
 u63pFC5bLFiKm0tq9JdIRI5eVguKb+FcX95ZxW7sM9cMxFeMZ9xkMrLU8odza/RZqyXE
 2oBLVRY4ScdcdJwQt37+i6dN15pA3BhmPLAo3kz9EcaJvBg+j/a2M9oCd+LZERIMNa3v
 8SN9RBg6ij7RFIYWSIu9z6VdWPcorHLpfvdmXUX9cYrUJ+/mqMhAvjFmgnMGaobAqzeW
 M89qfWmjzyWyV/NDV+DHRjJJJm+FWzY+8sdtFWA3sTYq4zp32+kjgaClGfKYK9HwCV4T
 IKEw==
X-Gm-Message-State: ANoB5pmltshDserq+4JArBe2tCLAD79/gqIvdpmsFg7iJ8c5IIaJBp2v
 NS/+Vdt0JjruxmaJrRb+dEYSiw==
X-Google-Smtp-Source: AA0mqf7jJGvXl6DHFmluClwshp4fqUgMuoE5zkB3Ts/xLNUtYaK0nQ/Cd4Mh9yiXdi6WhEoX/KAlEQ==
X-Received: by 2002:adf:cd06:0:b0:236:5e6a:7c4 with SMTP id
 w6-20020adfcd06000000b002365e6a07c4mr987137wrm.150.1668166447216; 
 Fri, 11 Nov 2022 03:34:07 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 bh9-20020a05600005c900b0022e36c1113fsm1700732wrb.13.2022.11.11.03.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:34:06 -0800 (PST)
Message-ID: <84b99826-0d96-187a-7b95-0b9f79f4495f@linaro.org>
Date: Fri, 11 Nov 2022 12:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] Add missing pixman dependecy
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, mrezanin@redhat.com,
 qemu-devel@nongnu.org
Cc: imammedo@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <20221109153417.49132-1-mrezanin@redhat.com>
 <d9c073ea-7379-7f51-f55b-b9c70d3daabf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d9c073ea-7379-7f51-f55b-b9c70d3daabf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 11/11/22 12:24, Paolo Bonzini wrote:
> On 11/9/22 16:34, mrezanin@redhat.com wrote:
>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>
>> Commit cfead31326 'acpi: pc: vga: use AcpiDevAmlIf interface to build 
>> VGA device descriptors' added
>> a new file - acpi-vga.c. This file (indirectly) includes pixman.h file 
>> so we need to ensure pixman
>> is available when file is compiled.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> The patch is fine, but I think the new file does not need vga_int.h and 
> therefore does not need to include pixman.h.  Can you try?

MST already fixed, see:
https://lore.kernel.org/qemu-devel/20221109222112.74519-1-mst@redhat.com/

