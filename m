Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CE161B96
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:27:26 +0100 (CET)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3m3B-0004Iz-4A
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m1u-0002qM-DU
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:26:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m1t-0001sD-7l
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:26:06 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33658)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3m1t-0001ra-1p
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:26:05 -0500
Received: by mail-pf1-x443.google.com with SMTP id n7so9422287pfn.0
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n49T0KPJkB2El29Lj3qPqCF0+aVDqkZrOTmxSKudp24=;
 b=UF4Bg2KDq4mIMsnmGcOFD/Z8YLfK/mn1h98bIfxX0nh3LrJdTcDIBoboR2/4FyEyCj
 8tBuC1gb90reTB0nGymUe40gp9zkqkXosTZv8s1RxH0L6MIyd/o5Fc52TnMc5dpRS6R3
 /bjwXofN1yqWrVZBIY6KhpapuASEarIKViwrXV5NHqwTjYMhJyQxHzN6wevCYNCUt29u
 BF6QO6wxTBlxoK67Zdk6WkYbOZ3krKK/J8zO7uIk6xD13wWj/xBTGp+tDNt1H3okp3GV
 aN1IXtX34gfaj8RsvdKcpksDJehwf0VPj8EGSpi+fSoFmUgAx622iCJc/8VgJlq/x4Wr
 VPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n49T0KPJkB2El29Lj3qPqCF0+aVDqkZrOTmxSKudp24=;
 b=Xwo7CmVavv2H+h1Ynyp5hJgcN+Eb+h/MCJ+9nGSnwVVUpweVx1gpPBzWq99JxyfAhX
 gkqXLE5i+ZktJ1+0sPtjC2fapRrIpd75+WP5Lc5KX8JhxVXLZOear3uZ1tMqh1JhdJvF
 SS0Z7fIEmTnfgHhXmE0QtBItqP1SoJWMy91GBXuxCw+QaZg9rIGaYpMs85lIeFSO74/z
 fQlZBl2Uee0VDKiWN0MF5Ln107U8Xw2uW8lM3BeD6iwYm42CW0uTLz9UruOoY3zQLwKU
 v87dACexfx547rL3Dyu6qsf42fabCAAkfeHVQ5thnaKui8fuP4SBfq3y9GgEW6zBrsoJ
 hcGw==
X-Gm-Message-State: APjAAAU4Y2LGmBIDBHMptAJs0TZBdcdEOSQisrjIGVry6DGbLh20y2RS
 wya0R+RJHKpnFzXWZy4Q5Ab1iA==
X-Google-Smtp-Source: APXvYqyYDi/vW5T8/XhGQsGFzFXVnvPsQIqAk5yyZ2+UpP8cNNkrcOZXrkcVvduKElU+oUF5aA2SWA==
X-Received: by 2002:a17:90a:200d:: with SMTP id
 n13mr697304pjc.16.1581967563899; 
 Mon, 17 Feb 2020 11:26:03 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 17sm1178740pfv.142.2020.02.17.11.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:26:03 -0800 (PST)
Subject: Re: [PATCH v5 38/79] s390x/s390-virtio-ccw: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-39-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89b717a7-9361-2902-efdc-47b935e07047@linaro.org>
Date: Mon, 17 Feb 2020 11:26:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-39-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Tested-by: Halil Pasic <pasic@linux.ibm.com>
> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


