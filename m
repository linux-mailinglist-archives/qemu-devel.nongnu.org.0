Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F64AAD18
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:51:23 +0100 (CET)
Received: from localhost ([::1]:43130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUpv-0001kx-0m
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUoB-0000Ep-9o
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:49:35 -0500
Received: from [2607:f8b0:4864:20::1034] (port=55053
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUoA-0005bI-1z
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:49:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id on2so889744pjb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8ZAdCW18x0h6Uree7OS/jsNHmJirEic8dH4RoYoG12U=;
 b=ZcWmtr34uCzAGZHblydHJz/MjCUOaNiD49ujxI5Fb9ELlYo1EYKN7Av12aw5hnpeKg
 gmQkUV6bFtoyNfLzZdHYsuzK4wqB3Bllzdi3aIdiDKGEXKkTvi4Zmw80nhpmXEOFAjKz
 XGpWOnQBKPYVsk3aJ4eiKFl02EOPFVcHy8k7jsO8uu6JcqOrFpiIda2AZ9qZqCIBXmJp
 VlD0i5XPAuCXRFzdK9gj+qtz4XG32S+wJesz7d5GcvetP7NOcmj6B3f9wD7hD+a/8pVd
 z7OPfgp/0LTvuXyEmRn8eRVcwzKnP1Q3Dau+dtanX1GIad2DQri08Ijrg0x1mBZXJR/L
 WMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ZAdCW18x0h6Uree7OS/jsNHmJirEic8dH4RoYoG12U=;
 b=UuBg0QN6L4/VjjQdP5byvR2bue5XsQCxFYGfObnA02NmbfmQaB8X7WGvKJhYm2/CpT
 6U8763osC84U/0xQB1JQmWGQURlv+IFnRusPar0IO4DZmajTKN9Qzt650RDnkX62ilyw
 zO0HZiTcoMEe9y2yA9JpWXuoqeOBk3/TeBG/0A9bFWg7BBvdUMEeDehw5VguIDOYGTc0
 gP0UV041GjmNATmqwAbVQ/n4zOnGO1DkLGD3/hJcBG51An4qCD+C0nOyZ52WeqpGL9uK
 f3h4WvhdlIBVf/7kkZeRrHwWCtFLhTrSLakKlT2uNvdmjeNzzaqBEhX2cCLOMfEEnm32
 OesA==
X-Gm-Message-State: AOAM532T42270drTpJ0+tX0xbPvvW2pg+KcPGaPTm5r5swnuYJgMMP7V
 8ZqvC1cGoYUFgFcdjezxJpCaJg==
X-Google-Smtp-Source: ABdhPJxSS0Cq4Xshsxzktd2XcV4M8F3S47dKQAf+GXxnor0OipIWzrJr0uAWlj7XyyqxpBRRVdTjTg==
X-Received: by 2002:a17:902:ea0f:: with SMTP id
 s15mr9623723plg.118.1644104972701; 
 Sat, 05 Feb 2022 15:49:32 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id j185sm6597226pfd.85.2022.02.05.15.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:49:32 -0800 (PST)
Message-ID: <1d86a46c-8219-92a4-8fe8-59408d6651d4@linaro.org>
Date: Sun, 6 Feb 2022 10:49:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/10] hw/s390x/virtio: Add missing 'cpu.h' include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:37, Philippe Mathieu-Daudé wrote:
> CPUS390XState is declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/s390x/s390-virtio-hcall.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

