Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA48161B5B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:15:30 +0100 (CET)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lrd-0004yK-DR
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lpt-0003kQ-7b
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:13:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lps-00013H-7p
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:13:41 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36099)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lps-00012t-2d
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:13:40 -0500
Received: by mail-pf1-x441.google.com with SMTP id 185so9402886pfv.3
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lOpoGlMHmRcDqN4ZWXKlb9Ek24G1P4/qCOiUBXU8rBU=;
 b=BiKNoXtcS9ulbSsT+BkJqCYMXyXB+UXt3Z1ycnz4PPusjRy9CKB6QEOjcn+mdUfg4Q
 41vB+d8ftMUEUP6pnfRXj95GmSbSu/ZLIXSB/h0Nnuc0jxXVpalT7V6iciyIEIOTdBfd
 UxgACytsuHXchLvSsbW+zU99iOwoICD5fk6G4bAkvcmd1hMPDIEuNgbOc4WYX7Sup3hy
 mxYv51lO2xKV+vJsiRerUEnWqycEUfA56UIcteTEp5yRl549pKisPR6jsFjyhw4n53rw
 Kudx5LOoq1i3WJti5YCfHQMf5gfpMkFXTblRdl/3kMzqpfkznuXCJA7Gajh8cj1oNpHj
 G/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lOpoGlMHmRcDqN4ZWXKlb9Ek24G1P4/qCOiUBXU8rBU=;
 b=YER/P1S8EiLg7puYFFwRpMxwvKq0uhMpZLdc1Mks+xwZqEsP5/3fy1Z78STk4slkY/
 0oXx9RPbJ2iMdD9qigEx/67/U3Ym0TmJKi3U+Z/PziiOZqZOGYPnYCq+L/9kKTL/qMFh
 D75xZE7p7KxtqjMbtaupcLQ9wmX+l0/ZKh4kzZtpaY8E7idwlgCkycv6nig58mPeBG3J
 PlDmoMw5QsI/XBbGt4Pe2BTb1voMC4z0Ui+mXhs/XTY7egbATthB6Uomac91W++a7VKx
 /mjkVpHl07XSfLPqkDKg9b7ZyhKuP8l82Vy2HLkMsrA39Zyq2FuFrMdNSgDzBkQzgQS8
 5ZRA==
X-Gm-Message-State: APjAAAX31z8Gj1CZ/pyXs0T8B6cSOE9cVU25DJ/Zd0MA0XY369s4pgFv
 w1x2951gJuJYd1OFFWaSuiM84g==
X-Google-Smtp-Source: APXvYqzlYBcnGCJLc7qRgYkltWXwEwDUj1subw7PkCfuk/80LDf1eBAM85Dk+I4xq/ccNYySkFk2Dg==
X-Received: by 2002:a05:6a00:5b:: with SMTP id
 i27mr18173452pfk.112.1581966819042; 
 Mon, 17 Feb 2020 11:13:39 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ep2sm195282pjb.31.2020.02.17.11.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:13:38 -0800 (PST)
Subject: Re: [PATCH v5 26/79] arm/omap_sx1: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-27-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e69a08cc-acb2-b9ae-e5eb-2f55cd073eca@linaro.org>
Date: Mon, 17 Feb 2020 11:13:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-27-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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

On 2/17/20 9:33 AM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
> 
> PS:
>  while at it add check for user supplied RAM size and error
>  out if it mismatches board expected value.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



