Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF656161B87
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:20:22 +0100 (CET)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lwL-0002nu-Jz
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3luw-0001Hz-OC
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:18:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3luv-00050p-Qn
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:18:54 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35125)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3luv-00050D-Lj
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:18:53 -0500
Received: by mail-pf1-x444.google.com with SMTP id y73so9414730pfg.2
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0JXBjTsj59hubbgQEw+E94ZUzjwM8GP16u5Yl6V3o6I=;
 b=DS/HqmVPGEJfRUiEmmGcsenfUNRI1JKhlVeUs03R9d5rObQVoLo2M9RfLWALYCNne2
 gvuayKylOcqwwzDuLxoT6CJFNjtoEFMhYhV1dmVSgu6aKWjoHWk/DkvvcGs1B8SCxuZh
 gVEu4yAKhVdmjXoAKugGnlyW1RGNoVQMA/RBdhUqQxVz4h9G7p4iWmsvfrbSfCqqzB6r
 W+dovKmPexIwF3WgKWc062PfB0SCcvKR62wWpHejOTzsiXsIkYbQ5YdFyBXy5+ZdhXc7
 rMUfKzuaQyDmNYiwMhjo1psEqS7yd3x8C/SonTq8h/lAANo00BrfDaKg9q26wFkJ25iN
 /jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0JXBjTsj59hubbgQEw+E94ZUzjwM8GP16u5Yl6V3o6I=;
 b=PpkitPdl2uo3TZvCuKkUHzyVSqhJVmTrRjaI5gXvqU6Mn2fwFaMqOqPAHjapOWIBFE
 Zyl0e3pgKDc7ZQ9BbayhARD7kaRaqHdkevSXR8CK/z84D4xMuKdvA7qTNA/0icDvkd9c
 ZY0bYTnF+jifWwVARN7n5FpwBIzjw2nS1LKLKKTOnKTOdhH0on6lISc+WD/j+cuYs6HI
 yi08BkoV/J4yfxzU2d/Cq6QRO/wgeAEkj6Xtuv+Wv8tXZ5ckZ6MO09w5xcgEULGG1ErL
 Mx6NWmHtaLr3BKwsyxlXxsyXFKYihUTscsIMfDxK+wKWJxZBPYJaQMktqtiPxwzXB0oh
 Pilg==
X-Gm-Message-State: APjAAAWz51BG8gPs5QCjniPijked+1+npYLj9CLwt6jYAjLeJMCtW+W/
 rZTst7T6tdSliIHQBQa8OJw8Ug==
X-Google-Smtp-Source: APXvYqzDdIuzgH1/3l8ujXbJjeOqDSt8ksPxx+1qg1+xYVL4MPoaVWFtWPUYjSMnTs+sQUqd6wKx8A==
X-Received: by 2002:a17:90a:394d:: with SMTP id n13mr620023pjf.1.1581967132511; 
 Mon, 17 Feb 2020 11:18:52 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e84sm1182858pfh.149.2020.02.17.11.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:18:51 -0800 (PST)
Subject: Re: [PATCH v5 31/79] arm/versatilepb: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-32-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <831d70d8-223e-8d1f-4aec-5f38d4cec2e7@linaro.org>
Date: Mon, 17 Feb 2020 11:18:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-32-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



