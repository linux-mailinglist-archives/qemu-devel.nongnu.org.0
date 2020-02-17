Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B77161B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:22:32 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lyR-0005k0-VC
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lwZ-0003g7-P2
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:20:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lwY-0006Lh-Px
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:20:35 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44006)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lwY-0006L7-KI
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:20:34 -0500
Received: by mail-pg1-x542.google.com with SMTP id u12so9352931pgb.10
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fvZvxHXZQUhFrcVVSWTIWvVpZ49i8BB+mBdp1P9tkG8=;
 b=wrGkvXVF1d1FUoYxSoCgiRjTXd2oBE4nFAG3n4XOTIYSJl8J2hhP7Lz6W/X5Z8hZ9y
 VUMz0gGo2qkrk0dZm9STYEc+9U5jlJ08K35rSq+bQl6Zn+/Qwlv2OFOa/78n/8e+H0d0
 rGEnYa4Zbx2znR+VuuSIRQ5OjN6LA23Tl+i3+jXZ3rHYeQLQFbnoVja0Kb77avVPctWO
 OlMMMUwJhBf54b8GXnzj7Jufo6qVqFKVwQCptUoaFAerRbMCovCctudQdVCH5YYwe3vV
 JXIt3d8ybq+0/a7ziev7vQR4TImC9cIzZ2g16fYfra5OtUXAWFxUM4qUjLyQeQT0kncZ
 nc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvZvxHXZQUhFrcVVSWTIWvVpZ49i8BB+mBdp1P9tkG8=;
 b=GKRABP1bnCkckF7DIErCq5XeJ2G5x+9CBwhdUYSlT7fhEb+cx6ozENIaeZ3e2R/Rp+
 ggSpHWqgyKZqDza3cBU26xrOlhOxJjx9AjlBTW+vbkHrzjjjvAJ0lZqOMmVvak132l5u
 UbRwa9rUTiEAZoHtXc9fsJiJCgEp6x0ita8x1a/JS183lprVehZbOHUYWcUhXnPFSFgm
 b3ZhbfTmElKWTP1V2rZfqNG0mzapF5mRk1JRmjclZ5HIwN7FxyQulAnL6709pbxNHEuy
 KZ5dtTtpqKQSLh3oY2S2zcCpcRlmzpA0XCaRByv5okFx7/SOrcn/40VDvKMlUzE2m5tn
 sJMw==
X-Gm-Message-State: APjAAAUednKK7fklzBgTH9MaL3PtLAR7d76jKXFBolnQtJiYXKlWeK92
 tOqvNyuVElK0AGUjDV6ktbQ3wA==
X-Google-Smtp-Source: APXvYqwojxvc/M0zmW8e6Q00BoDn98HFD0+HJ3f2LDfK8I1NLLj0y5glDlmR0u/XqKH10poTMhcOvA==
X-Received: by 2002:a17:90b:30c9:: with SMTP id
 hi9mr581139pjb.81.1581967233681; 
 Mon, 17 Feb 2020 11:20:33 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 p16sm1594379pgi.50.2020.02.17.11.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:20:33 -0800 (PST)
Subject: Re: [PATCH v5 33/79] arm/virt: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-34-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2affe2-6e3d-3333-304c-d7f58fe53503@linaro.org>
Date: Mon, 17 Feb 2020 11:20:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-34-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:34 AM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away,
> so replace it with memdev allocated MemoryRegion.
> The later is initialized by generic code, so board only
> needs to opt in to memdev scheme by providing
>   MachineClass::default_ram_id
> and then map memory region provided by
>   MachineState::ram_memdev
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



