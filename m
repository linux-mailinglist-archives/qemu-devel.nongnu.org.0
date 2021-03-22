Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E034515B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:03:20 +0100 (CET)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lORhm-0003or-HA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lORef-0003CZ-4W
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:00:05 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lORed-0006gX-I5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:00:04 -0400
Received: by mail-qt1-x82b.google.com with SMTP id l13so13426704qtu.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 14:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmfsQ9944Q39q6dV55jIMMTTwMe1fSIxbJbNh+/2AIE=;
 b=UpCAZipHwEg3884oXBA/gSYsNNmEL327jTDBR9GN3P9gHRfo12OMBhggv2212Ujyjv
 u5NOwMMgym9aGap7VjYet5sfMsmvpnOEkidjiC/mOHA3/aiEemrxRlj3c6/HtHMUczU0
 pXdQ1NiZQcq5TowETmRAmsPiqwDki8JHMsK8m0p+QhNs5gU267+uomQJZUargZ8Gx9gF
 NEpDLt81PVUcNn3KSZ5EJ/vxhmwrRrkFWXDFRjmCuE3evL74hQje382BV5kbSKWTBctv
 Zop57qDlSSpYqoKnyuE41U4mFN7aS1E53mkddpLvOGq4aJGo9OW1k7BLHPfQ4u0JXptl
 ZzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmfsQ9944Q39q6dV55jIMMTTwMe1fSIxbJbNh+/2AIE=;
 b=JTAPoR5HEg9rGOYfhAljacNS3tRQi2b2B0zFWeqI7hBKpfiMKbI6cb9Ruw4eQ3ukeZ
 CcGh9L1RzYnk9RaSu9qN0eoOmzF9vsgwK0IoL9ensS8YP/A4WHZStJhuzu1V6s+DPAIU
 Cra8n7T2CI94PdvFY+0Ox3expTOh5RYPwHFnhiwRmyCEF6ioR80HJT3bz4rrj+f/UPTz
 vaulQiQlXywwE3XmxBIa8/YzdW5JN4SfHCFz5IPBWuxBwa5pn6q3G6WmKjXO/oSs8w4a
 hs7POtbJfLxoMl4HA6zKpHv5guxk1lr9sfpTEZWz+joul2i+kHvfabmUFchI6UOrGTYk
 icMA==
X-Gm-Message-State: AOAM531igVZCXuF3v1W4afJxltZdbRkHpiwuu9Q5Mb63Eo8FCzloWvlG
 btfYrwK/gGnNZsT96UKPQu0RUg==
X-Google-Smtp-Source: ABdhPJyGpP0nT85o7pw0x8llp7pFul22OkELSLU31AnxQj9jUqir71pnOeq5P180sEivkumryxLvXg==
X-Received: by 2002:ac8:4755:: with SMTP id k21mr1734581qtp.102.1616446802068; 
 Mon, 22 Mar 2021 14:00:02 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z7sm11676949qkf.136.2021.03.22.14.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 14:00:01 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
 <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
 <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
 <0cad2de8-1150-be7c-237b-9f3ddea52473@linaro.org>
 <4231d15c-493f-cb3d-39ef-aff40e3618ee@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <696de0d3-3b35-6c9a-1242-3761e6d6ec83@linaro.org>
Date: Mon, 22 Mar 2021 14:59:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4231d15c-493f-cb3d-39ef-aff40e3618ee@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 4:54 AM, Gavin Shan wrote:
> It looks this issue can be avoided after "volatile" is applied to
> @target_page. However, I'm not sure if it's the correct fix to have.

Certainly not.

That is the exact opposite of what we want.  We want to minimize the number of 
reads from the variable, not maximize them.


r~

